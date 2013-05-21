<?php

    require_once('../config/dblib-mysql.php');

    // Debug code
    $debug_enabled = isset($_GET['debug']) ? $_GET['debug']: 'off';
    define ('DEBUG_ENABLED', $debug_enabled);
    xtec_debug("DEBUG ENABLED: $debug_enabled");
    
    $dbsource = isset($_GET['dbsource']) ? $_GET['dbsource'] : $agora['dbsource']['defaulttype'];
    xtec_debug("Selected: $dbsource");
    // End debug

    // Get info from cookie if exists
    $centre = $_REQUEST['ccentre'];

    if ($centre == null){
        // Envia a una pàgina d'error
        header('location: '.WWWROOT.'error.php?s=intranet&dns='.$_REQUEST['ccentre']);
        exit(0);
    }

    /**
     * Configurar si llegir les dades de connexió des de l'allSchools o de la base de dades
     * 1 = Des del fitxer allSchools (predefinit)
     * 2 = Des de la base de dades
     **/
     
    $school_info = getSchoolInfoFromFile($centre, $dbsource, 'intranet');

    // Debug code
    xtec_debug ($school_info['source']);

    if ($school_info === false) {
        header('location: '.WWWROOT.'error.php?s=intranet&dns='.$_REQUEST['ccentre']);
        exit(0);
    }

    if (!empty($school_info['new_dns'])) {
        $newadress = WWWROOT . $school_info['new_dns'].'/intranet';
        header('location: '.WWWROOT.'error.php?newaddress='.$newadress);
        exit(0);
    }

    if (!isset($school_info['id_intranet']) || empty($school_info['id_intranet'])) {
        header('location: '.WWWROOT.'error.php?s=intranet&dns='.$_REQUEST['ccentre']);
        exit(0);
    }

    global $ZConfig;

    // Zikula doesn't use serviceDB param cause duplicates activedId param. serviceDB is
    //  necessary when using Oracle DDBB.
    $database_intranet = $agora['intranet']['userprefix'] . $school_info['id_intranet'];

    $ZConfig['Multisites']['multi']           = '1';
    $ZConfig['Multisites']['siteDNS']         = $agora['server']['base'] . $centre . '/intranet';
    $ZConfig['Multisites']['mainSiteURL']     = $agora['server']['base'] . $centre . '/intranet';
    $ZConfig['Multisites']['filesRealPath']   = $agora['server']['root'] . $agora['intranet']['datadir'] . $database_intranet;
    $ZConfig['Multisites']['siteFilesFolder'] = 'data';

    $ZConfig['DBInfo']['databases']['default']['host']   = $school_info['dbhost_intranet'];
    $ZConfig['DBInfo']['databases']['default']['dbname']   = $database_intranet;
    $ZConfig['System']['temp']                = $agora['server']['root'] . $agora['intranet']['datadir'] . $database_intranet . '/pnTemp';

    $ZConfig['DBInfo']['databases']['moodle']['dbtabletype']    = $agora['intranet']['moodle_dbtype'];
    $ZConfig['DBInfo']['databases']['moodle']['dbdriver'] = 'mysql';
    $ZConfig['DBInfo']['databases']['moodle']['host']    = $agora['moodle']['dbhost'];
    $ZConfig['DBInfo']['databases']['moodle']['password']    = $agora['moodle']['userpwd'];
    $ZConfig['DBInfo']['databases']['moodle']['dbname']    = $school_info['database_moodle'];
    $ZConfig['DBInfo']['databases']['moodle']['user']   = $agora['moodle']['username'] . $school_info['id_moodle'];
    $ZConfig['DBInfo']['databases']['moodle']['charset'] = 'utf8';
    $ZConfig['DBInfo']['databases']['moodle']['collate'] = 'utf8_general_ci';

    $ZConfig['DBInfo']['databases']['moodle2']['dbtabletype']    = $agora['intranet']['moodle_dbtype'];
    $ZConfig['DBInfo']['databases']['moodle2']['dbdriver'] = 'mysql';
    $ZConfig['DBInfo']['databases']['moodle2']['host']    = $agora['moodle']['dbhost'];
    $ZConfig['DBInfo']['databases']['moodle2']['password']    = $agora['moodle']['userpwd'];
    $ZConfig['DBInfo']['databases']['moodle2']['dbname']    = $school_info['database_moodle'];
    $ZConfig['DBInfo']['databases']['moodle2']['user']   = $agora['moodle']['username'] . $school_info['id_moodle'];
    $ZConfig['DBInfo']['databases']['moodle2']['charset'] = 'utf8';
    $ZConfig['DBInfo']['databases']['moodle2']['collate'] = 'utf8_general_ci';