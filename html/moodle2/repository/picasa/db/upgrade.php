<?php
// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

/**
 * @param int $oldversion the version we are upgrading from
 * @return bool result
 */
function xmldb_repository_picasa_upgrade($oldversion) {
    global $CFG, $DB;

    $dbman = $DB->get_manager();

    if ($oldversion < 2012051400) {
        // Delete old user preferences storing authsub tokens.
        $DB->delete_records('user_preferences', array('name' => 'google_authsub_sesskey_picasa'));
        upgrade_plugin_savepoint(true, 2012051400, 'repository', 'picasa');
    }

    if ($oldversion < 2012053000) {
        require_once($CFG->dirroot.'/repository/lib.php');
        $existing = $DB->get_record('repository', array('type' => 'picasa'), '*', IGNORE_MULTIPLE);

        if ($existing) {
            $picasaplugin = new repository_type('picasa', array(), true);
            $picasaplugin->delete();
            repository_picasa_admin_upgrade_notification();
        }

        upgrade_plugin_savepoint(true, 2012053000, 'repository', 'picasa');
    }

    // Moodle v2.3.0 release upgrade line
    // Put any upgrade step following this


    return true;
}

function repository_picasa_admin_upgrade_notification() {
    $admins = get_admins();

    if (empty($admins)) {
        return;
    }
    $a = new stdClass;
    $a->docsurl = get_docs_url('Google_OAuth_2.0_setup');

    foreach ($admins as $admin) {
        $message = new stdClass();
        $message->component         = 'moodle';
        $message->name              = 'notices';
        $message->userfrom          = get_admin();
        $message->userto            = $admin;
        $message->smallmessage      = get_string('oauth2upgrade_message_small', 'repository_picasa');
        $message->subject           = get_string('oauth2upgrade_message_subject', 'repository_picasa');
        $message->fullmessage       = get_string('oauth2upgrade_message_content', 'repository_picasa', $a);
        $message->fullmessagehtml   = get_string('oauth2upgrade_message_content', 'repository_picasa', $a);
        $message->fullmessageformat = FORMAT_PLAIN;
        $message->notification      = 1;
        message_send($message);
    }
}
