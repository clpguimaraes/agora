<?php

require_once('modules/Agoraportal/lib/Agoraportal/Util.php');

class Agoraportal_Controller_User extends Zikula_AbstractController {

    public function postInitialize() {
        $this->view->setCaching(false);
    }

    /**
     * shows the clients and services list
     * @author:	Albert Pérez Monfort (aperezm@xtec.cat)
     * @return:	The list of available services
     */
    public function main() {
        // Security check
        AgoraPortal_Util::requireUser();
        if (AgoraPortal_Util::isClient() && !AgoraPortal_Util::isAdmin()) {
            return System::redirect(ModUtil::url('Agoraportal', 'user', 'myAgora'));
        }
        return System::redirect(ModUtil::url('Agoraportal', 'user', 'sitesList'));
    }

    /**
     * show the services available for a client
     * @author:	Albert Pérez Monfort (aperezm@xtec.cat)
     * @param:	The client Code
     * @return:	The list of available services
     */
    public function myAgora($args) {
        AgoraPortal_Util::requireClient();

        $clientCode = AgoraPortal_Util::getFormVar($args, 'clientCode');
        if (!$clientCode) {
            $username = UserUtil::getVar('uname');

            $manager = ModUtil::apiFunc('Agoraportal', 'user', 'getManager', array('managerUName' => $username));
            // Check if the user is in the Agoraportal_client_managers table
            if ($manager) {
                $clientCode = $manager['clientCode'];
            }
        }
        $clientInfo = ModUtil::apiFunc('Agoraportal', 'user', 'getRealClientCode', array('clientCode' => $clientCode));
        $isAdmin = AgoraPortal_Util::isAdmin();

        // check user access level in Àgora
        $accessLevel = (AgoraPortal_Util::isManager()) ? 'add' : 'comment';

        // Load Àgora config (needed later)
        global $agora;

        $clientCode = $clientInfo['clientCode'];
        $client = $clientInfo['client'];
        $clientarray = $client[$clientCode];
        $clientOldDNS = $clientarray['clientDNS'];
        $services = ModUtil::apiFunc('Agoraportal', 'user', 'getAllServices');
        //get client services information
        $clientInfo = ModUtil::apiFunc('Agoraportal', 'user', 'getAllClientsAndServices', array('init' => 0,
                    'rpp' => 50,
                    'service' => 0,
                    'state' => -1,
                    'search' => 1,
                    'searchText' => $clientCode,
                    'clientCode' => $clientCode));

        //Check if the client is pending of change his clientDNS
        //Only for site managers
        if (AgoraPortal_Util::isManager()) {
            $schooldata = getSchoolFromWS($clientCode);
            // Data for debug (commented)
            // $schooldata['error'] = 0;
            // $schooldata['message'] = 'a8000004$$ceip-platon$$Escola Francesc Platón i Sartí$$c. Salvador Espriu, 3$$Abrera$$08630';
            if ($schooldata['error'] == 1) {
                LogUtil::registerError($schooldata['message']);
            } else {
                // Assume there's info of the school
                $school = explode('$$', $schooldata['message']);
                $clientDNS = (isset($school[1])) ? $school[1] : '';
                // Keyword equals to '0' means school exists and has no 'nom propi', so an error is shown
                if ($clientDNS == '0') {
                    return LogUtil::registerError("No s'ha trobat el nom propi del centre. Cal disposar de nom propi per poder sol·licitar serveis d'Àgora");
                }
                SessionUtil::setVar('changeDNS_clientCode', $clientCode);
                SessionUtil::setVar('changeDNS_olddns', $clientOldDNS);
                SessionUtil::setVar('changeDNS_newdns', $clientDNS);
            }
        }

        //get client services
        $clientInfoArray = $clientInfo;
        foreach ($clientInfoArray as $oneService) {
            $maxDiskSpace = $oneService['diskSpace'] * 1024;
            $percentage = ($maxDiskSpace > 0) ? round($oneService['diskConsume'] * 100 / $maxDiskSpace) : 0;
            $widthUsage = ($percentage > 100) ? 100 : $percentage;
            $alertspace = 0;
            if (ModUtil::apiFunc('Agoraportal', 'user', 'checkDiskRequestThreshold', array('serviceId' => $oneService['serviceId'],
                        'clientCode' => $clientCode))) {
                $alertspace = 1;
            }
            $clientInfoArray[$oneService['clientServiceId']]['usageArray'] = array('maxDiskSpace' => $maxDiskSpace,
                'percentage' => $percentage,
                'totalDiskSpace' => round($maxDiskSpace / 1024),
                'usedDiskSpace' => round($oneService['diskConsume'] / 1024),
                'widthUsage' => $widthUsage,
                'alert' => $alertspace);
        }
        // get client managers
        $managers = ModUtil::apiFunc('Agoraportal', 'user', 'getManagers', array('clientCode' => $clientCode));

        return $this->view->assign('client', $client[$clientCode])
                        ->assign('clientArray', $clientInfoArray)
                        ->assign('services', $services)
                        ->assign('clientCode', $clientCode)
                        ->assign('siteBaseURL', $agora['server']['server'] . $agora['server']['base'])
                        ->assign('isAdmin', $isAdmin)
                        ->assign('managers', count($managers))
                        ->assign('clientOldDNS', $clientOldDNS)
                        ->assign('clientDNS', $clientDNS)
                        ->assign('accessLevel', $accessLevel)
                        ->fetch('agoraportal_user_main.tpl');
    }

    /**
     * Allow clients to ask the activation of new services
     * @author:	Albert Pérez Monfort (aperezm@xtec.cat)
     * @return:	A form with the services available and not solicited
     */
    public function askServices($args) {

        // Access check
        if (!AgoraPortal_Util::isManager()) {
            return $this->view->assign('noaccess', true)->fetch('agoraportal_user_askServices.tpl');
        }


        $acceptUseTerms = AgoraPortal_Util::getFormVar($args, 'acceptUseTerms');
        $clientCode = AgoraPortal_Util::getFormVar($args, 'clientCode');
        $contactProfile = AgoraPortal_Util::getFormVar($args, 'contactProfile');

        $isAdmin = AgoraPortal_Util::isAdmin();

        $clientInfo = ModUtil::apiFunc('Agoraportal', 'user', 'getRealClientCode', array('clientCode' => $clientCode));
        $clientCode = $clientInfo['clientCode'];
        $client = $clientInfo['client'];

        $allowedServices = array();
        $services = ModUtil::apiFunc('Agoraportal', 'user', 'getAllServices');
        $modeltypes = ModUtil::apiFunc('Agoraportal', 'user', 'getModelTypes');

        foreach ($services as $service) {
            if ($service['allowedClients'] != '') {
                if (strpos($service['allowedClients'], $clientCode) !== false) {
                    $allowedServices[$service['serviceId']] = $service;
                }
            } else {
                $allowedServices[$service['serviceId']] = $service;
            }
        }

        // Get active client services
        $clientInfo = ModUtil::apiFunc('Agoraportal', 'user', 'getAllClientsAndServices', array('init' => 0,
                    'rpp' => 50,
                    'service' => 0,
                    'state' => array(0, 1),
                    'search' => 1,
                    'searchText' => $clientCode,
                    'clientCode' => $clientCode,
                ));

        $clientServices = array();
        $haveMoodle = false;
        foreach ($clientInfo as $info) {
            if ($services[$info['serviceId']]['serviceName'] == 'moodle2') {
                $haveMoodle = true;
            }
            $clientServices[$info['serviceId']] = $info['serviceId'];
        }

        // Get not asked services
        $notsolicitedServices = array_diff_key($allowedServices, $clientServices);

        if (empty($notsolicitedServices)) {
            if (AgoraPortal_Util::isAdmin()) {
                return System::redirect(ModUtil::url('Agoraportal', 'user', 'main', array('clientCode' => $clientCode)));
            }
            return System::redirect(ModUtil::url('Agoraportal', 'user', 'main'));
        }

        foreach ($notsolicitedServices as $notsolicited) {
            $notsolicitedServices[$notsolicited['serviceId']]['disabled'] = (!$haveMoodle && $notsolicited['serviceName'] == 'marsupial') ? 1 : 0;
        }

        // Reverse order
        arsort($notsolicitedServices);

        return $this->view->assign('notsolicitedServices', $notsolicitedServices)
                        ->assign('contactName', UserUtil::getVar('uname'))
                        ->assign('contactProfile', $contactProfile)
                        ->assign('acceptUseTerms', $acceptUseTerms)
                        ->assign('clientCode', $clientCode)
                        ->assign('isAdmin', $isAdmin)
                        ->assign('client', $client[$clientCode])
                        ->assign('modeltypes', $modeltypes)
                        ->assign('noaccess', false)
                        ->fetch('agoraportal_user_askServices.tpl');
    }

    /**
     * Update client information for service ask
     *
     * @author:	Albert Pérez Monfort (aperezm@xtec.cat)
     * @author: Toni Ginard
     *
     * @return:	Redirect user to the ask services information
     */
    public function updateAskService($args) {
        AgoraPortal_Util::requireManager();

        $serviceId = AgoraPortal_Util::getFormVar($args, 'serviceId', null, 'POST');
        $nodes = AgoraPortal_Util::getFormVar($args, 'nodes', null, 'POST');
        $contactProfile = AgoraPortal_Util::getFormVar($args, 'contactProfile', null, 'POST');
        $acceptUseTerms = AgoraPortal_Util::getFormVar($args, 'acceptUseTerms', null, 'POST');
        $clientCode = AgoraPortal_Util::getFormVar($args, 'clientCode', null, 'POST');

        // Confirm authorisation code
        $this->checkCsrfToken();

        $clientInfo = ModUtil::apiFunc('Agoraportal', 'user', 'getRealClientCode', array('clientCode' => $clientCode));
        $clientCode = $clientInfo['clientCode'];

        // Check all the required values
        if ($serviceId == null) {
            LogUtil::registerError($this->__('No heu marcat cap servei'));
            return System::redirect(ModUtil::url('Agoraportal', 'user', 'askServices', array('clientCode' => $clientCode,
                                'contactProfile' => $contactProfile,
                                'acceptUseTerms' => $acceptUseTerms)));
        }

        $modeltypes = ModUtil::apiFunc('Agoraportal', 'user', 'getModelTypes');

        // User can ask for many services at a time
        foreach ($serviceId as $id) {
            $service = ModUtil::apiFunc('Agoraportal', 'user', 'getService', array('serviceId' => $id));
            $serviceName = $service['serviceName'];
            // If service is 'nodes' ensure that the model of service is selected
            if ($serviceName == 'nodes') {
                if (is_null($nodes)) {
                    LogUtil::registerError($this->__('No heu indicat indicat quina maqueta voleu per al servei Nodes'));
                    return System::redirect(ModUtil::url('Agoraportal', 'user', 'askServices', array('clientCode' => $clientCode,
                                        'contactProfile' => $contactProfile,
                                        'acceptUseTerms' => $acceptUseTerms)));
                } else {
                    foreach ($modeltypes as $modeltype) {
                        if ($nodes == $modeltype['shortcode']) {
                            $nodes = $modeltype['description'];
                        }
                    }
                }
            }
        }

        if ($contactProfile == '') {
            LogUtil::registerError($this->__('No heu indicat el vostre càrrec en el centre'));
            return System::redirect(ModUtil::url('Agoraportal', 'user', 'askServices', array('clientCode' => $clientCode,
                                'contactProfile' => $contactProfile,
                                'acceptUseTerms' => $acceptUseTerms)));
        }

        if ($acceptUseTerms == null && !AgoraPortal_Util::isAdmin()) {
            LogUtil::registerError($this->__('No heu acceptat les condicions d\'ús'));
            return System::redirect(ModUtil::url('Agoraportal', 'user', 'askServices', array('clientCode' => $clientCode,
                                'contactProfile' => $contactProfile,
                                'acceptUseTerms' => $acceptUseTerms)));
        }

        // Create the new service
        if (!ModUtil::apiFunc('Agoraportal', 'user', 'updateAskService', array('clientCode' => $clientCode,
                    'serviceId' => $serviceId,
                    'contactProfile' => $contactProfile,
                    'observations' => $nodes))) {
            LogUtil::registerError($this->__('S\'ha produït un error en la creació del servei.'));
            if (AgoraPortal_Util::isAdmin()) {
                return System::redirect(ModUtil::url('Agoraportal', 'user', 'main', array('clientCode' => $clientCode)));
            }
            return System::redirect(ModUtil::url('Agoraportal', 'user', 'main'));
        } else {
            LogUtil::registerStatus($this->__('La sol·licitud s\'ha rebut correctament. Quan sigui acceptada o denegada rebreu un missatge de correu electrònic a la vostra bústia de correu XTEC. S\'enviarà una còpia d\'aquest missatge a la bústia del centre.'));
            ModUtil::apiFunc('Agoraportal', 'user', 'addLog', array('actionCode' => 1,
                'action' => $this->__f('S\'ha fet la sol·licitud del servei %s', $serviceName)));
        }

        if (AgoraPortal_Util::isAdmin()) {
            return System::redirect(ModUtil::url('Agoraportal', 'user', 'myAgora', array('clientCode' => $clientCode)));
        }

        return System::redirect(ModUtil::url('Agoraportal', 'user', 'myAgora'));
    }

    /**
     * get the list of sites
     * @author:	Albert Pérez Monfort (aperezm@xtec.cat)
     * @return:	the client sites list main structure
     */
    public function sitesList() {
        AgoraPortal_Util::requireUser();

        $sitesListContent = ModUtil::func('Agoraportal', 'user', 'sitesListContent');
        // Create output object
        return $this->view->assign('sitesListContent', $sitesListContent)
                        ->fetch('agoraportal_user_sitesList.tpl');
    }

    /**
     * get the list of sites content
     * @author:	Albert Pérez Monfort (aperezm@xtec.cat)
     * @param:	Filter values
     * @return:	The list of sites content
     */
    public function sitesListContent($args) {
        AgoraPortal_Util::requireUser();

        $init = AgoraPortal_Util::getFormVar($args, 'init', 1, 'POST');
        $rpp = AgoraPortal_Util::getFormVar($args, 'rpp', 10, 'POST');
        $location = AgoraPortal_Util::getFormVar($args, 'location', '0', 'POST');
        $typeId =  AgoraPortal_Util::getFormVar($args, 'typeId', '0', 'POST');
        $search =  AgoraPortal_Util::getFormVar($args, 'search', null, 'POST');
        $searchText =  AgoraPortal_Util::getFormVar($args, 'searchText', null, 'POST');

        $services = ModUtil::apiFunc('Agoraportal', 'user', 'getAllServices');
        $locations = ModUtil::apiFunc('Agoraportal', 'user', 'getAllLocations');
        $types = ModUtil::apiFunc('Agoraportal', 'user', 'getAllTypes');
        $sites = ModUtil::apiFunc('Agoraportal', 'user', 'getAllClientsAndServicesForSitesList', array('init' => $init,
                    'rpp' => $rpp,
                    'location' => $location,
                    'typeId' => $typeId,
                    'search' => $search,
                    'searchText' => $searchText));
        $sitesNumber = ModUtil::apiFunc('Agoraportal', 'user', 'getAllClientsAndServicesForSitesList', array('onlyNumber' => 1,
                    'location' => $location,
                    'typeId' => $typeId,
                    'search' => $search,
                    'searchText' => $searchText));

        $sitesArray = array();

        if (count($sites) > 0) {
            foreach ($sites as $site) {
                // Skip clients with no services
                if (!isset($site['serviceId'])) {
                    continue;
                }

                $serviceName = $services[$site['serviceId']]['serviceName'];
                $hasDB = $services[$site['serviceId']]['hasDB'];
                $link = ModUtil::func('Agoraportal', 'user', 'getServiceLink', array('clientDNS' => $site['clientDNS'], 'serviceName' => $serviceName));
                $logos = '';

                if ($hasDB) {
                    $logos = "<div style=\"float:left;\" class=\"$serviceName\">
                                <a href=\"$link\">
                                    <img src=\"modules/Agoraportal/images/$serviceName.gif\" alt=\"$serviceName\" title=\"$serviceName\" />
                                </a>
                              </div>";
                } else {
                    $logos = "<div style=\"float:left;\" class=\"$serviceName\">
                                <img src=\"modules/Agoraportal/images/$serviceName.gif\" alt=\"$serviceName\" title=\"$serviceName\" />
                              </div>";
                }

                // Create an array for printing. Each row is a client and logos are accumulated in a field.
                if (!array_key_exists($site['clientDNS'], $sitesArray)) {
                    $sitesArray[$site['clientDNS']] = array('clientName' => $site['clientName'],
                        'clientId' => $site['clientId'],
                        'typeId' => $site['typeId'],
                        'locationId' => $site['locationId'],
                        'clientCity' => $site['clientCity'],
                        'clientDNS' => $site['clientDNS'],
                        'serviceId' => $site['serviceId'],
                        'educat' => $site['educat'],
                        'logos' => $logos);
                } else {
                    $sitesArray[$site['clientDNS']]['logos'] .= $logos;
                }
            }
        }
        $pager = ModUtil::func('Agoraportal', 'admin', 'pager', array('init' => $init,
                    'rpp' => $rpp,
                    'total' => $sitesNumber,
                    'javascript' => true,
                    'urltemplate' => "sitesList($typeId,$location,'$search','$searchText',%%,$rpp)"));

        // Create output object
        return $this->view->assign('sites', $sitesArray)
                        ->assign('locations', $locations)
                        ->assign('types', $types)
                        ->assign('pager', $pager)
                        ->assign('sitesNumber', $sitesNumber)
                        ->fetch('agoraportal_user_sitesListContent.tpl');
    }

    /**
     * upload big files to the server for moodle courses
     * @author:	Albert Pérez Monfort (aperezm@xtec.cat)
     * @param:	client code and file to upload
     * @return:	redirect user to the upload form
     */
    public function files($args) {
        AgoraPortal_Util::requireManager();

        $clientCode = AgoraPortal_Util::getFormVar($args, 'clientCode', null, 'GET');
        $file = AgoraPortal_Util::getFormVar($args, 'file', null, 'GET');
        $clientServiceId = AgoraPortal_Util::getFormVar($args, 'clientServiceId', null, 'GET');
        $action = AgoraPortal_Util::getFormVar($args, 'action', null, 'GET');

        $clientInfo = ModUtil::apiFunc('Agoraportal', 'user', 'getRealClientCode', array('clientCode' => $clientCode));
        $isAdmin = AgoraPortal_Util::isAdmin();
        $clientCode = $clientInfo['clientCode'];
        $client = $clientInfo['client'];
        // get all services
        $services = ModUtil::apiFunc('Agoraportal', 'user', 'getAllServices');
        //print_r($services);
        //get client services information
        $clientServices = ModUtil::apiFunc('Agoraportal', 'user', 'getAllClientsAndServices', array('init' => -1,
                    'rpp' => -1,
                    'service' => 0,
                    'state' => 1,
                    'search' => 1,
                    'searchText' => $clientCode,
                    'clientCode' => $clientCode,
                ));
        // Create output object
        $view = Zikula_View::getInstance('Agoraportal', false);
        foreach ($clientServices as $clientService) {
            if ($services[$clientService['serviceId']]['serviceName'] == 'moodle2') {
                if ($action == 'uploadFiles') {
                    if ($clientService['diskSpace'] > 0) {
                        //TODO: Now the only service that allow to update files is moodle. In the future other services will allow to update files.
                        //Then several changes in the cgi update script will be necessary
                        $usedDiskSpace = $clientService['diskConsume'];
                        $maxDiskSpace = $clientService['diskSpace'] * 1024;
                        $percentage = round($usedDiskSpace * 100 / $maxDiskSpace);
                        $widthUsage = ($percentage > 100) ? 100 : $percentage;
                        $usageArray[$clientService['serviceId']] = array('serviceName' => $services[$clientService['serviceId']]['serviceName'],
                            'maxDiskSpace' => $maxDiskSpace,
                            'percentage' => $percentage,
                            'totalDiskSpace' => round($maxDiskSpace / 1024),
                            'usedDiskSpace' => round($usedDiskSpace / 1024),
                            'widthUsage' => $widthUsage,
                            'clientServiceId' => $clientService['clientServiceId'],
                        );
                        $actived[$clientService['serviceId']] = $clientService['activedId'];
                    }
                    $view->assign('usageArray', $usageArray);
                }
            }
            $activedServicesNames[] = $services[$clientService['serviceId']]['serviceName'];
        }
        if (count($services) > count($clientServices)) {
            $view->assign('askServices', true);
        }
        $view->assign('isAdmin', $isAdmin);
        $view->assign('client', $client[$clientCode]);
        $view->assign('action', $action);
        $view->assign('activedServicesNames', $activedServicesNames);

        global $agora;
        // upload big file to service folder
        if ($file != null) {
            // send file to folder
            $fileToMove = $agora['server']['ubr_upload'] . $file;
            $serviceName = $services[$clientServices[$clientServiceId]['serviceId']]['serviceName'];
            $folder = $agora['moodle2']['repository_files'];
            $destination = $agora['server']['root'] . $agora[$serviceName]['datadir'] . $agora[$serviceName]['username'] . $clientServices[$clientServiceId]['activedId'] . $folder;
            if (!file_exists($fileToMove)) {
                LogUtil::registerError($this->__('No s\'ha trobat el directori d\'origen'));
                return System::redirect(ModUtil::url('Agoraportal', 'user', 'main', array('clientCode' => $clientCode)));
            }
            if (!file_exists($destination)) {
                unlink($fileToMove);
                LogUtil::registerError($this->__('No s\'ha trobat el directori de destí ' . $destination));
                return System::redirect(ModUtil::url('Agoraportal', 'user', 'main', array('clientCode' => $clientCode)));
            }
            $moved = rename($fileToMove, $destination . $file);
            if (!$moved) {
                unlink($fileToMove);
                LogUtil::registerError($this->__('S\'ha pujat el fitxer al servidor, però s\'ha produït un error en moure\'l internament en el servidor.'));
            } else {
                LogUtil::registerStatus($this->__f('S\'ha pujat el fitxer <strong>%s</strong> al servidor. El trobareu en el repositori <strong>Fitxers</strong> del vostre Moodle.', $file));
                $size = round(filesize($destination . $file) / 1024);
                $diskConsume = $clientServices[$clientServiceId]['diskConsume'] + $size;
                ModUtil::apiFunc('Agoraportal', 'user', 'saveDiskConsume', array('clientServiceId' => $clientServiceId,
                    'diskConsume' => $diskConsume,
                ));
            }
            return System::redirect(ModUtil::url('Agoraportal', 'user', 'files', array('clientCode' => $clientCode)));
        }

        include('modules/Agoraportal/upload/ubr_default_config.php');
        $view->assign('cgi_script', $agora['server']['cgi_script']);

        // read moodle2 repository folder
        if (in_array('moodle2', $activedServicesNames) && $action == 'm2x') {
            $clientService = ModUtil::apiFunc('Agoraportal', 'user', 'getClientService', array('clientId' => $clientInfo['client'][$clientCode]['clientId'], 'serviceName' => 'moodle2'));
            $folder = $agora['server']['root'] . $agora['moodle2']['datadir'] . $agora['moodle2']['userprefix'] . $clientService['activedId'] . '/repository/files/';

            if (is_dir($folder)) {
                $moodle2RepoFiles = array();
                $objects = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($folder), RecursiveIteratorIterator::SELF_FIRST);
                foreach ($objects as $name => $object) {
                    if (substr($name, -2) != '/.' && substr($name, -3) != '/..') {
                        $filename = DataUtil::formatForDisplay($name);
                        $basedir = substr($name, strlen($folder));
                        $file_object = array('name' => DataUtil::formatForDisplay($basedir),
                            'filename' => DataUtil::formatForDisplay($filename),
                            'size' => round((filesize($filename) / 1024) / 1024, 2),
                            'type' => filetype($filename),
                            'time' => date("j F Y, H:i", filemtime($filename)),
                        );
                        $moodle2RepoFiles[] = $file_object;
                    }
                }
            } else {
                LogUtil::registerError($this->__('No s\'ha trobat el directori utilitzat pel repositori del Moodle 2'));
            }

            $view->assign('moodle2RepoFiles', $moodle2RepoFiles);
        }

        return $view->fetch('agoraportal_user_files.tpl');
    }

    public function downloadFile($args) {
        AgoraPortal_Util::requireManager();

        $clientCode = AgoraPortal_Util::getFormVar($args, 'clientCode', null, 'GET');
        $filename = AgoraPortal_Util::getFormVar($args, 'filename', null, 'GET');
        $courseId = AgoraPortal_Util::getFormVar($args, 'courseId', 0, 'GET');
        $target = AgoraPortal_Util::getFormVar($args, 'target', null, 'GET');

        $clientInfo = ModUtil::apiFunc('Agoraportal', 'user', 'getRealClientCode', array('clientCode' => $clientCode));
        $clientCode = $clientInfo['clientCode'];

        global $agora;
        $folder = $agora['moodle2']['repository_files'];

        $clientService = ModUtil::apiFunc('Agoraportal', 'user', 'getClientService', array('clientId' => $clientInfo['client'][$clientCode]['clientId'], 'serviceName' => 'moodle2'));
        $folder = $agora['server']['root'] . $agora['moodle2']['datadir'] . $agora['moodle2']['userprefix'] . $clientService['activedId'] . $folder;

        //Check if file exists. If not returns error.
        if (!file_exists($filename)) {
            LogUtil::registerError($this->__f('S\'ha produït algun problema en descarregar el fitxer %s', array($filename)));
            return System::redirect(ModUtil::url('Agoraportal', 'user', 'files', array('clientCode' => $clientCode,
                                'action' => $target)));
        }

        // get file size
        $fileSize = filesize($filename);
        // Get file extension
        $fileExtension = strtolower(substr(strrchr($filename, "."), 1));

        //Begin writing headers
        header("Pragma: public");
        header("Expires: 0");
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
        header("Cache-Control: public");
        header("Content-Description: File Transfer");
        //Force the download
        $header = "Content-Disposition: attachment; filename=" . basename($filename) . ";";
        header($header);
        header("Content-Transfer-Encoding: binary");
        header("Content-Length: " . $fileSize);
        @readfile($filename);
        return true;
    }

    /**
     * Verify the verifyCode sent by the user and change the active nevel if this is correct
     * @author: Fèlix Casanellas (fcasanel@xtec.cat)
     * @param: verifyCode of the user and clientCode
     * @return:  Error or succed message
     */
    public function changeDNS($args) {
        AgoraPortal_Util::requireClient();

        $clientCode = AgoraPortal_Util::getFormVar($args, 'clientCode', null, 'POST');
        $clientDNS = AgoraPortal_Util::getFormVar($args, 'clientDNS', null, 'POST');
        $clientOldDNS = AgoraPortal_Util::getFormVar($args, 'clientOldDNS', null, 'POST');

        // Securize form info
        $changeDNS_clientCode = SessionUtil::getVar('changeDNS_clientCode', false);
        $changeDNS_olddns = SessionUtil::getVar('changeDNS_olddns', false);
        $changeDNS_newdns = SessionUtil::getVar('changeDNS_newdns', false);
        SessionUtil::delVar('changeDNS_clientCode');
        SessionUtil::delVar('changeDNS_olddns');
        SessionUtil::delVar('changeDNS_newdns');

        if (!$clientCode || $clientCode != $changeDNS_clientCode || !$clientDNS || $clientDNS != $changeDNS_newdns || !$clientOldDNS || $clientOldDNS != $changeDNS_olddns) {
            return LogUtil::registerError($this->__('Els paràmetres per al canvi de nom no coincideixen, o bé falten dades'));
        }

        if (ModUtil::apiFunc('Agoraportal', 'user', 'apiChangeDNS', array('clientCode' => $clientCode,
                    'clientDNS' => $clientDNS,
                    'clientOldDNS' => $clientOldDNS))) {
            LogUtil::registerStatus($this->__f('S\'ha canviat el nom propi del centre a Àgora de <strong>%1$s</strong> a <strong>%2$s</strong>. En aquests moments s\'estan realitzant actualitzacions automàtiques als serveis. Per aquest motiu, és possible que durant els propers 10 minuts mostrin algun error.', array($clientOldDNS, $clientDNS)));
            // Register log
            ModUtil::apiFunc('Agoraportal', 'user', 'addLog', array('action' => $this->__f('S\'ha canviat el DNS del centre de<strong>%1$s</strong> a <strong>%2$s</strong>.', array($clientOldDNS, $clientDNS)),
                'actionCode' => 1,
                'clientCode' => $clientCode));
        } else {
            LogUtil::registerError($this->__('No s\'ha pogut canviar el nom propi del centre'));
            // Register log
            ModUtil::apiFunc('Agoraportal', 'user', 'addLog', array('action' => $this->__f('No s\'ha pogut canviar el DNS del centre de %1$s a %2$s', array($clientOldDNS, $clientDNS)),
                'actionCode' => 3,
                'clientCode' => $clientCode));
        }

        return System::redirect(ModUtil::url('Agoraportal', 'user', 'myAgora'));
    }

    /**
     * Show the menu for log parameters selection
     * @author: Fèlix Casanellas (fcasanel@xtec.cat)
     */
    public function logs($args) {
        AgoraPortal_Util::requireClient();

        $clientCode = AgoraPortal_Util::getFormVar($args, 'clientCode', null, 'POST');

        $clientInfo = ModUtil::apiFunc('Agoraportal', 'user', 'getRealClientCode', array('clientCode' => $clientCode));
        $clientCode = $clientInfo['clientCode'];
        $isAdmin = AgoraPortal_Util::isAdmin();
        $client = $clientInfo['client'];
        $logsContent = ModUtil::func('Agoraportal', 'user', 'logsContent');
        // get client services information
        $clientServices = ModUtil::apiFunc('Agoraportal', 'user', 'getAllClientsAndServices', array('init' => 0,
                    'rpp' => 50,
                    'service' => 0,
                    'state' => -1,
                    'search' => 1,
                    'searchText' => $clientCode));
        $services = ModUtil::apiFunc('Agoraportal', 'user', 'getAllServices');
        $askServices = (count($services) > count($clientServices)) ? true : false;
        return $this->view->assign('askServices', $askServices)
                        ->assign('logsContent', $logsContent)
                        ->assign('isAdmin', $isAdmin)
                        ->assign('client', $client[$clientCode])
                        ->fetch('agoraportal_user_logs.tpl');
    }

    /**
     * Take the parameters of seletcion and return the logs that satisfy, the number of pages and the actual parameters
     * @author: Fèlix Casanellas (fcasanel@xtec.cat)
     * @param:  logs parameters
     * @return: all logs that satisfy the parameters, the number of pages and the actual paramaters
     */
    public function logsContent($args) {
        AgoraPortal_Util::requireClient();

        $clientCode = AgoraPortal_Util::getFormVar($args, 'clientCode', null, 'POST');
        $init = AgoraPortal_Util::getFormVar($args, 'init', null, 'POST');
        $actionCode = AgoraPortal_Util::getFormVar($args, 'actionCode', null, 'POST');
        $uname = AgoraPortal_Util::getFormVar($args, 'uname', null, 'POST');
        $fromDate = AgoraPortal_Util::getFormVar($args, 'fromDate', null, 'POST');
        $toDate = AgoraPortal_Util::getFormVar($args, 'toDate', null, 'POST');
        $pag = AgoraPortal_Util::getFormVar($args, 'pag', 1, 'POST');


        $factor = 20;

        $response = ModUtil::apiFunc('Agoraportal', 'user', 'getLogsContent', array('init' => $init,
                    'clientCode' => $clientCode,
                    'actionCode' => $actionCode,
                    'uname' => $uname,
                    'fromDate' => $fromDate,
                    'toDate' => $toDate,
                    'pag' => $pag,
                    'factor' => $factor));

        $logs = $response['content'];
        $numLogs = $response['numLogs'];
        $numPags = $response['numPags'];

        $pags = array();
        for ($i = 1; $i <= $numPags; $i++) {
            $pags[$i] = $i;
        }

        $config = array('init' => $init,
            'actionCode' => $actionCode,
            'uname' => $uname,
            'fromDate' => $fromDate,
            'toDate' => $toDate,
            'pag' => $pag);

        $isAdmin = AgoraPortal_Util::isAdmin();

        return $this->view->assign('logs', $logs)
                        ->assign('pags', $pags)
                        ->assign('config', $config)
                        ->assign('numLogs', $numLogs)
                        ->assign('isAdmin', $isAdmin)
                        ->fetch('agoraportal_user_logsContent.tpl');
    }

    /**
     * Extract the services available for a client
     * @author: Albert Pérez Monfort (aperezm@xtec.cat)
     * @param: The client services array
     * @return:  And array with the client services
     */
    public function getActiveServices($args) {
        $clientServices = AgoraPortal_Util::getFormVar($args, 'clientServices', null, 'POST');
        foreach ($clientServices as $service) {
            if ($service['state'] == 1) {
                $returnServices[$service['serviceId']] = $service;
            }
        }
        return $returnServices;
    }

    /**
     * Allow to assign users' managers
     * @author: Albert Pérez Monfort (aperezm@xtec.cat)
     * @param: The configurable parameters
     * @return: True if success and false otherwise
     */
    public function managers($args) {
        AgoraPortal_Util::requireClient();

        $clientCode = AgoraPortal_Util::getFormVar($args, 'clientCode');

        $clientInfo = ModUtil::apiFunc('Agoraportal', 'user', 'getRealClientCode', array('clientCode' => $clientCode));
        $clientCode = $clientInfo['clientCode'];
        $isAdmin = AgoraPortal_Util::isAdmin();
        $client = $clientInfo['client'];
        // check user access level in Àgora
        $accessLevel = 'none';
        if (AgoraPortal_Util::isClient()) {
            $accessLevel = 'comment';
        }

        if (AgoraPortal_Util::isManager()) {
            $accessLevel = 'add';
        }

        // get client managers
        $managers = ModUtil::apiFunc('Agoraportal', 'user', 'getManagers', array('clientCode' => $clientCode));
        $canDelegate = ModUtil::apiFunc('Agoraportal', 'user', 'canDelegate', array('clientCode' => $clientCode));
        // get client services information
        $clientInfo = ModUtil::apiFunc('Agoraportal', 'user', 'getAllClientsAndServices', array('init' => 0,
                    'rpp' => 50,
                    'service' => 0,
                    'state' => -1,
                    'search' => 1,
                    'searchText' => $clientCode));
        $services = ModUtil::apiFunc('Agoraportal', 'user', 'getAllServices');
        $askServices = (count($services) > count($clientInfo)) ? true : false;

        return $this->view->assign('askServices', $askServices)
                        ->assign('isAdmin', $isAdmin)
                        ->assign('client', $client[$clientCode])
                        ->assign('managers', $managers)
                        ->assign('canDelegate', $canDelegate)
                        ->assign('accessLevel', $accessLevel)
                        ->assign('uname', UserUtil::getVar('uname'))
                        ->fetch('agoraportal_user_managers.tpl');
    }

    /**
     * delete a manager for a client
     * @author: Albert Pérez Monfort (aperezm@xtec.cat)
     * @param: The managerId
     * @return: True if success and false otherwise
     */
    public function deleteManager($args) {
        AgoraPortal_Util::requireClient();

        $managerId = AgoraPortal_Util::getFormVar($args, 'managerId', null, 'POST');

        // get manager information
        $manager = ModUtil::apiFunc('Agoraportal', 'user', 'getManager', array('managerId' => $managerId));
        $clientCode = $manager['clientCode'];
        // check if user can delete the manager
        $clientInfo = ModUtil::apiFunc('Agoraportal', 'user', 'getRealClientCode', array('clientCode' => $clientCode));
        $clientCode = $clientInfo['clientCode'];

        // get client managers
        $managers = ModUtil::apiFunc('Agoraportal', 'user', 'getManagers', array('clientCode' => $clientCode));

        // check if assigned the user can delete de manager
        if (!AgoraPortal_Util::isClient()) {
            LogUtil::registerError($this->__('No pots esborrar el gestor.'));
            return System::redirect(ModUtil::url('Agoraportal', 'user', 'managers'));
        }

        // get a particular manager
        $thisManager = ModUtil::apiFunc('Agoraportal', 'user', 'getManager', array('managerId' => $managerId));
        // check if realy the user can delete de manager
        if (UserUtil::getVar('uname') == $thisManager['managerUName']) {
            LogUtil::registerError($this->__('No et pots esborrar a tu mateix com a gestor.'));
            return System::redirect(ModUtil::url('Agoraportal', 'user', 'managers'));
        }
        // the use can delete the manager
        if (!ModUtil::apiFunc('Agoraportal', 'user', 'deleteManager', array('managerId' => $managerId))) {
            LogUtil::registerError($this->__('S\'ha produït un error en esborrar el gestor.'));
        } else {
            LogUtil::registerStatus($this->__('El gestor s\'ha esborrat correctament.'));
            // insert the action in logs table
            ModUtil::apiFunc('Agoraportal', 'user', 'addLog', array('actionCode' => 3,
                'action' => $this->__f('S\'ha esborrat el gestor amb nom d\'usuari %s', $thisManager['managerUName'])));
        }
        if (AgoraPortal_Util::isAdmin()) {
            return System::redirect(ModUtil::url('Agoraportal', 'user', 'managers', array('clientCode' => $clientCode)));
        }
        return System::redirect(ModUtil::url('Agoraportal', 'user', 'managers'));
    }

    /**
     * add a manager for a client
     * @author: Albert Pérez Monfort (aperezm@xtec.cat)
     * @param: The manager information
     * @return: The new manager if success and false otherwise
     */
    public function addManager($args) {
        AgoraPortal_Util::requireClient();

        $managerUName = AgoraPortal_Util::getFormVar($args, 'managerUName', null, 'POST');

        // check if user can add a new manager
        $clientInfo = ModUtil::apiFunc('Agoraportal', 'user', 'getRealClientCode', array());
        $clientCode = $clientInfo['clientCode'];
        // Confirm authorisation code
        $this->checkCsrfToken();
        $canDelegate = ModUtil::apiFunc('Agoraportal', 'user', 'canDelegate', array('clientCode' => $clientCode));
        if (!$canDelegate) {
            LogUtil::registerError($this->__('No pots crear gestors.'));
            if (AgoraPortal_Util::isAdmin()) {
                return System::redirect(ModUtil::url('Agoraportal', 'user', 'managers', array('clientCode' => $clientCode)));
            }
            return System::redirect(ModUtil::url('Agoraportal', 'user', 'managers'));
        }

        // In case an e-mail address was given, remove text after @
        $pos = strpos($managerUName, '@');
        if ($pos !== false) {
            $managerUName = substr($managerUName, 0, $pos);
        }

        // the user delegated can't have a code username
        if (is_numeric(substr($managerUName, 1, strlen($managerUName)))) {
            LogUtil::registerError($this->__('No pots assignar a usuaris genèrics la gestió.'));
            if (AgoraPortal_Util::isAdmin()) {
                return System::redirect(ModUtil::url('Agoraportal', 'user', 'managers', array('clientCode' => $clientCode)));
            }
            return System::redirect(ModUtil::url('Agoraportal', 'user', 'managers'));
        }
        // check if the user is manager in another client. A user can only be manager for one client
        $manager = ModUtil::apiFunc('Agoraportal', 'user', 'getManager', array('managerUName' => $managerUName));
        if ($manager) {
            // get school name
            $clientMainInfo = ModUtil::apiFunc('Agoraportal', 'user', 'getClientMainInfo', array('clientCode' => $manager['clientCode']));
            LogUtil::registerError($this->__f('L\'usuari/ària ja és gestor/a del centre <strong>%s</strong>. Una mateixa persona no pot ser gestora de dos centres simultàniament.', $clientMainInfo));
            if (AgoraPortal_Util::isAdmin()) {
                return System::redirect(ModUtil::url('Agoraportal', 'user', 'managers', array('clientCode' => $clientCode)));
            }
            return System::redirect(ModUtil::url('Agoraportal', 'user', 'managers'));
        }
        // the use can add the manager
        if (!ModUtil::apiFunc('Agoraportal', 'user', 'addManager', array('clientCode' => $clientCode,
                    'managerUName' => $managerUName))) {
            LogUtil::registerError($this->__('No s\'ha pogut crear el gestor/a.'));
        } else {
            LogUtil::registerStatus($this->__("El gestor s'ha creat correctament. Aviseu a l'usuari designat que a partir d'ara podrà gestionar els serveis del centre des d'aquest portal."));
            // insert the action in logs table
            ModUtil::apiFunc('Agoraportal', 'user', 'addLog', array('actionCode' => 1,
                'action' => $this->__f('S\'ha afegit un gestor amb nom d\'usuari %s', $managerUName)));
        }
        if (AgoraPortal_Util::isAdmin()) {
            return System::redirect(ModUtil::url('Agoraportal', 'user', 'managers', array('clientCode' => $clientCode)));
        }
        return System::redirect(ModUtil::url('Agoraportal', 'user', 'managers'));
    }

    /**
     * Show the client requests list
     * @author      Aida Regi Cosculluela (aregi@xtec.cat)
     * @param       Client code
     * @return:     The client requests list
     */
    public function requests($args) {
        AgoraPortal_Util::requireClient();

        // client code is optional
        $clientCode = AgoraPortal_Util::getFormVar($args, 'clientCode');

        // Get client info. If client code is empty, getRealClientCode will use the manager's client code
        $clientInfo = ModUtil::apiFunc('Agoraportal', 'user', 'getRealClientCode', array('clientCode' => $clientCode));
        $clientCode = $clientInfo['clientCode'];
        $client = $clientInfo['client'];

        // check user access level in Àgora
        $clientInfo = ModUtil::apiFunc('Agoraportal', 'user', 'getAllClientsAndServices', array('init' => 0,
                    'rpp' => 50,
                    'service' => 0,
                    'state' => -1,
                    'search' => 1,
                    'searchText' => $clientCode,
                    'clientCode' => $clientCode));

        $clientInfoArray = $clientInfo;

        foreach ($clientInfoArray as $oneService) {
            $maxDiskSpace = $oneService['diskSpace'] * 1024;
            $percentage = ($maxDiskSpace > 0) ? round($oneService['diskConsume'] * 100 / $maxDiskSpace) : 100;
            $widthUsage = ($percentage > 100) ? 100 : $percentage;
            ($percentage >= 70) ? $alertspace = 1 : $alertspace = 0;
            $clientInfoArray[$oneService['clientServiceId']]['usageArray'] = array('alert' => $alertspace);
        }

        // Get the list of services (intranet, moodle, marsupial)
        $services = ModUtil::apiFunc('Agoraportal', 'user', 'getAllServices');
        $requests = ModUtil::apiFunc('Agoraportal', 'user', 'getAllRequests', array('client' => $client[$clientCode]));
        $types = ModUtil::apiFunc('Agoraportal', 'user', 'getAllRequestTypes');

        return $this->view->assign('client', $client[$clientCode])
                        ->assign('clientArray', $clientInfoArray)
                        ->assign('services', $services)
                        ->assign('clientCode', $clientCode)
                        ->assign('requests', $requests)
                        ->assign('types', $types)
                        ->fetch('agoraportal_user_requests.tpl');
    }

    /**
     * Add a new request
     * @author      Aida Regi Cosculluela (aregi@xtec.cat)
     * @param       Client and request information
     * @return:     The new request if success and error message otherwise
     */
    public function addRequest($args) {
        AgoraPortal_Util::requireClient();

        $service = AgoraPortal_Util::getFormVar($args, 'requestMenuServices');
        $typeId = AgoraPortal_Util::getFormVar($args, 'requestFilter');
        $clientId = AgoraPortal_Util::getFormVar($args, 'clienId');
        $clientCode = AgoraPortal_Util::getFormVar($args, 'clientCode');
        $comments = AgoraPortal_Util::getFormVar($args, 'comments');

        $managerid = UserUtil::getVar('uid');

        // the user can add the request
        if (!ModUtil::apiFunc('Agoraportal', 'user', 'addRequest', array('clientId' => $clientId,
                    'service' => $service,
                    'typeId' => $typeId,
                    'comments' => $comments,
                    'managerId' => $managerid))) {
            LogUtil::registerError($this->__('No s\'ha pogut crear la sol·licitud'));
        }

        $serviceId = $service;
        $service = ModUtil::apiFunc($this->name, 'user', 'getService', array('serviceId' => $serviceId));
        $types = ModUtil::apiFunc('Agoraportal', 'user', 'getAllRequestTypes');

        LogUtil::registerStatus($this->__('La sol·licitud s\'ha creat correctament'));

        ModUtil::apiFunc('Agoraportal', 'user', 'addLog', array('actionCode' => 1,
            'action' => $this->__f('S\'ha fet la sol·licitud de %s del servei %s', array($types[$typeId]['name'],
                $service['serviceName']))));

        return System::redirect(ModUtil::url('Agoraportal', 'user', 'requests', array('clientCode' => $clientCode)));
    }

    /**
     * Get the services associated to a requestType which are active services
     *  of the client associated to the current logged user (which is supposed
     *  to be a manager)
     *
     * @author Toni Ginard
     * @author Aida Regi
     *
     * @param int requestTypeId
     *
     * @return array Services that meet the conditions
     */
    public function getRequestServices($args) {
        AgoraPortal_Util::requireUser();

        $requestTypeId = AgoraPortal_Util::getFormVar($args, 'requestTypeId', null, 'GET');

        // Get clientCode of the client associated to the user currently logged in Zikula
        $userLogged = UserUtil::getVar('uname');
        $manager = ModUtil::apiFunc('Agoraportal', 'user', 'getManager', array('managerUName' => $userLogged));
        $clientCode = $manager['clientCode'];

        // Get client active services
        $clientServices = ModUtil::apiFunc('Agoraportal', 'user', 'getClientServices', array('clientCode' => $clientCode));

        // Get services allowed for the requestType
        $requestTypesServices = ModUtil::apiFunc('Agoraportal', 'user', 'getRequestTypesServices', array('requestTypeId' => $requestTypeId));

        // Determine which services will be shown in the dropdown menu. Only
        //  allowed services of the active services of the client will be shown.
        foreach ($clientServices as $clientService) {
            foreach ($requestTypesServices as $requestTypesService) {
                if ($clientService['serviceId'] == $requestTypesService['serviceId']) {
                    $allowedServices[$clientService['serviceId']] = $clientService['serviceId'];
                }
            }
        }

        if (count($allowedServices) > 0) {
            // Get the service names
            foreach ($allowedServices as $allowedService) {
                $service = ModUtil::apiFunc('Agoraportal', 'user', 'getService', array('serviceId' => $allowedService));
                $allowedServices[$allowedService] = ucfirst($service['serviceName']);
            }
        }

        return $allowedServices;
    }

    public function getServiceLink($args) {
        $serviceName = AgoraPortal_Util::getFormVar($args, 'serviceName', null, 'POST');
        $clientDNS = AgoraPortal_Util::getFormVar($args, 'clientDNS', null, 'POST');

        $services = ModUtil::apiFunc('Agoraportal', 'user', 'getServiceByName', array('serviceName' => $serviceName));

        return ModUtil::getVar('Agoraportal', 'siteBaseURL') . $clientDNS . '/' . $services['URL'];
    }

    public function recalcConsume($args) {
        AgoraPortal_Util::requireClient();

        // client code is optional
        $clientServiceId = AgoraPortal_Util::getFormVar($args, 'clientServiceId', null, 'GET');

        if (!AgoraPortal_Util::isAdmin()) {
            $client = ModUtil::apiFunc('Agoraportal', 'user', 'getAllClientsAndServices', array('clientServiceId' => $clientServiceId,
                        'clientServiceId' => $clientServiceId));

            // Get client info. If client code is empty, getRealClientCode will use the manager's client code
            $clientInfo = ModUtil::apiFunc('Agoraportal', 'user', 'getRealClientCode', array('clientCode' => $client['clientCode']));
            $clientCode = $clientInfo['clientCode'];

            // for security. The managers only can recalc the quotes of their services
            if ($client[$clientServiceId]['clientCode'] != $clientCode) {
                throw new Zikula_Exception_Forbidden();
            }
        }
        ModUtil::apiFunc('Agoraportal', 'user', 'calcUsedSpace', array('clientServiceId' => $clientServiceId));

        LogUtil::registerStatus($this->__('L\'espai consumit s\'ha recalculat correctament.'));
        return System::redirect($_SERVER['HTTP_REFERER']);
    }

    public function servicesTerms() {
        AgoraPortal_Util::requireUser();
        return $this->view->fetch('agoraportal_user_terms.tpl');
    }

}
