-- phpMyAdmin SQL Dump
-- version 3.4.3.2
-- http://www.phpmyadmin.net
--
-- Servidor: pdb-int:3308
-- Temps de generació: 26-05-2015 a les 12:14:47
-- Versió del servidor: 5.5.38
-- Versió de PHP : 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de dades: `usu6`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_bp_activity`
--

CREATE TABLE `wp_bp_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `component` varchar(75) NOT NULL,
  `type` varchar(75) NOT NULL,
  `action` text NOT NULL,
  `content` longtext NOT NULL,
  `primary_link` varchar(255) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `secondary_item_id` bigint(20) DEFAULT NULL,
  `date_recorded` datetime NOT NULL,
  `hide_sitewide` tinyint(1) DEFAULT '0',
  `mptt_left` int(11) NOT NULL DEFAULT '0',
  `mptt_right` int(11) NOT NULL DEFAULT '0',
  `is_spam` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date_recorded` (`date_recorded`),
  KEY `user_id` (`user_id`),
  KEY `item_id` (`item_id`),
  KEY `secondary_item_id` (`secondary_item_id`),
  KEY `component` (`component`),
  KEY `type` (`type`),
  KEY `mptt_left` (`mptt_left`),
  KEY `mptt_right` (`mptt_right`),
  KEY `hide_sitewide` (`hide_sitewide`),
  KEY `is_spam` (`is_spam`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Bolcant dades de la taula `wp_bp_activity`
--

INSERT INTO `wp_bp_activity` (`id`, `user_id`, `component`, `type`, `action`, `content`, `primary_link`, `item_id`, `secondary_item_id`, `date_recorded`, `hide_sitewide`, `mptt_left`, `mptt_right`, `is_spam`) VALUES
(1, 2, 'members', 'last_activity', '', '', '', 0, NULL, '2015-05-15 08:31:10', 0, 0, 0, 0),
(2, 1, 'members', 'last_activity', '', '', '', 0, NULL, '2014-12-01 12:15:41', 0, 0, 0, 0),
(4, 2, 'groups', 'activity_update', '<a href="http://pwc-int.educacio.intranet/agora/masterpri/membres/xtecadmin/" title="xtecadmin">xtecadmin</a> ha fet una actualització al node <a href="http://pwc-int.educacio.intranet/agora/masterpri/nodes/educacio-emocional/">Educació emocional</a>', 'Hola noders, bon dia! Avui us portem un vídeo molt xulo sobre com fer espai als altres: \n\nhttps://www.youtube.com/watch?v=LAOICItn3MM', 'http://pwc-int.educacio.intranet/agora/masterpri/membres/xtecadmin/', 1, 0, '2014-09-22 16:45:52', 0, 0, 0, 0),
(5, 2, 'groups', 'created_group', '<a href="http://pwc-int.educacio.intranet/agora/masterpri/membres/xtecadmin/" title="xtecadmin">xtecadmin</a> ha creat el node <a href="http://pwc-int.educacio.intranet/agora/masterpri/nodes/mestres-1124779421/">Mestres</a>', '', 'http://pwc-int.educacio.intranet/agora/masterpri/membres/xtecadmin/', 2, 0, '2014-09-22 16:51:23', 1, 0, 0, 0),
(6, 2, 'groups', 'activity_update', '<a href="http://pwc-int.educacio.intranet/agora/masterpri/membres/xtecadmin/" title="xtecadmin">xtecadmin</a> ha fet una actualització al node <a href="http://pwc-int.educacio.intranet/agora/masterpri/nodes/mestres-1124779421/">Mestres</a>', 'Hola companys, us comparteixo un vídeo sobre educació emocional que em va agradar molt!\n\nhttps://www.youtube.com/watch?v=PQE4WqQSOcQ', 'http://pwc-int.educacio.intranet/agora/masterpri/membres/xtecadmin/', 2, 0, '2014-09-22 16:52:17', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_bp_activity_meta`
--

CREATE TABLE `wp_bp_activity_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Bolcant dades de la taula `wp_bp_activity_meta`
--

INSERT INTO `wp_bp_activity_meta` (`id`, `activity_id`, `meta_key`, `meta_value`) VALUES
(1, 4, '_oembed_f53b3de240959214172fa71fad6db8c8', '<iframe width="500" height="281" src="https://www.youtube.com/embed/LAOICItn3MM?feature=oembed" frameborder="0" allowfullscreen></iframe>'),
(2, 6, '_oembed_9a9cd4314ec5c6c352acee421db4e1c2', '<iframe width="500" height="281" src="https://www.youtube.com/embed/PQE4WqQSOcQ?feature=oembed" frameborder="0" allowfullscreen></iframe>');

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_bp_friends`
--

CREATE TABLE `wp_bp_friends` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `initiator_user_id` bigint(20) NOT NULL,
  `friend_user_id` bigint(20) NOT NULL,
  `is_confirmed` tinyint(1) DEFAULT '0',
  `is_limited` tinyint(1) DEFAULT '0',
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `initiator_user_id` (`initiator_user_id`),
  KEY `friend_user_id` (`friend_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_bp_groups`
--

CREATE TABLE `wp_bp_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'public',
  `enable_forum` tinyint(1) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `creator_id` (`creator_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Bolcant dades de la taula `wp_bp_groups`
--

INSERT INTO `wp_bp_groups` (`id`, `creator_id`, `name`, `slug`, `description`, `status`, `enable_forum`, `date_created`) VALUES
(1, 2, 'Educació emocional', 'educacio-emocional', 'Node sobre educació emocional', 'public', 0, '2014-09-22 16:44:12'),
(2, 2, 'Mestres', 'mestres-1124779421', 'Node dels mestres', 'private', 0, '2014-09-22 16:50:08');

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_bp_groups_groupmeta`
--

CREATE TABLE `wp_bp_groups_groupmeta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Bolcant dades de la taula `wp_bp_groups_groupmeta`
--

INSERT INTO `wp_bp_groups_groupmeta` (`id`, `group_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'total_member_count', '1'),
(2, 1, 'last_activity', '2014-09-22 16:45:52'),
(3, 1, 'ass_default_subscription', 'dig'),
(4, 1, 'ass_subscribed_users', 'a:1:{i:2;s:3:"dig";}'),
(5, 1, 'invite_status', 'admins'),
(6, 1, 'bp-docs', 'a:1:{s:10:"can-create";s:6:"member";}'),
(7, 2, 'total_member_count', '1'),
(8, 2, 'last_activity', '2014-09-22 16:52:17'),
(9, 2, 'ass_default_subscription', 'dig'),
(10, 2, 'ass_subscribed_users', 'a:1:{i:2;s:3:"dig";}'),
(11, 2, 'invite_status', 'admins');

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_bp_groups_members`
--

CREATE TABLE `wp_bp_groups_members` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `inviter_id` bigint(20) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `is_mod` tinyint(1) NOT NULL DEFAULT '0',
  `user_title` varchar(100) NOT NULL,
  `date_modified` datetime NOT NULL,
  `comments` longtext NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `invite_sent` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `is_admin` (`is_admin`),
  KEY `is_mod` (`is_mod`),
  KEY `user_id` (`user_id`),
  KEY `inviter_id` (`inviter_id`),
  KEY `is_confirmed` (`is_confirmed`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Bolcant dades de la taula `wp_bp_groups_members`
--

INSERT INTO `wp_bp_groups_members` (`id`, `group_id`, `user_id`, `inviter_id`, `is_admin`, `is_mod`, `user_title`, `date_modified`, `comments`, `is_confirmed`, `is_banned`, `invite_sent`) VALUES
(1, 1, 2, 0, 1, 0, 'Administrador/a del node', '2014-09-22 16:44:05', '', 1, 0, 0),
(2, 2, 2, 0, 1, 0, 'Administrador/a del node', '2014-09-22 16:49:49', '', 1, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_bp_messages_messages`
--

CREATE TABLE `wp_bp_messages_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `thread_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `date_sent` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_id` (`sender_id`),
  KEY `thread_id` (`thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_bp_messages_notices`
--

CREATE TABLE `wp_bp_messages_notices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `date_sent` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_bp_messages_recipients`
--

CREATE TABLE `wp_bp_messages_recipients` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `thread_id` bigint(20) NOT NULL,
  `unread_count` int(10) NOT NULL DEFAULT '0',
  `sender_only` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `thread_id` (`thread_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `sender_only` (`sender_only`),
  KEY `unread_count` (`unread_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_bp_mod_contents`
--

CREATE TABLE `wp_bp_mod_contents` (
  `content_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_type` varchar(42) NOT NULL DEFAULT '',
  `item_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `item_id2` bigint(20) unsigned NOT NULL DEFAULT '0',
  `item_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `item_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `item_url` varchar(250) NOT NULL DEFAULT '',
  `status` enum('new','warned','ignored','moderated','edited','deleted') NOT NULL DEFAULT 'new',
  PRIMARY KEY (`content_id`),
  KEY `item_type` (`item_type`),
  KEY `item_id` (`item_id`),
  KEY `item_id2` (`item_id2`),
  KEY `item_author` (`item_author`),
  KEY `item_date` (`item_date`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_bp_mod_flags`
--

CREATE TABLE `wp_bp_mod_flags` (
  `flag_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `reporter_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`flag_id`),
  KEY `content_id` (`content_id`),
  KEY `reporter_id` (`reporter_id`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_bp_notifications`
--

CREATE TABLE `wp_bp_notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `secondary_item_id` bigint(20) DEFAULT NULL,
  `component_name` varchar(75) NOT NULL,
  `component_action` varchar(75) NOT NULL,
  `date_notified` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `secondary_item_id` (`secondary_item_id`),
  KEY `user_id` (`user_id`),
  KEY `is_new` (`is_new`),
  KEY `component_name` (`component_name`),
  KEY `component_action` (`component_action`),
  KEY `useritem` (`user_id`,`is_new`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_bp_xprofile_data`
--

CREATE TABLE `wp_bp_xprofile_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `value` longtext NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Bolcant dades de la taula `wp_bp_xprofile_data`
--

INSERT INTO `wp_bp_xprofile_data` (`id`, `field_id`, `user_id`, `value`, `last_updated`) VALUES
(1, 1, 2, 'xtecadmin', '2014-09-12 09:30:30'),
(2, 1, 1, 'admin', '2014-09-12 09:35:06');

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_bp_xprofile_fields`
--

CREATE TABLE `wp_bp_xprofile_fields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL,
  `type` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_default_option` tinyint(1) NOT NULL DEFAULT '0',
  `field_order` bigint(20) NOT NULL DEFAULT '0',
  `option_order` bigint(20) NOT NULL DEFAULT '0',
  `order_by` varchar(15) NOT NULL DEFAULT '',
  `can_delete` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `parent_id` (`parent_id`),
  KEY `field_order` (`field_order`),
  KEY `can_delete` (`can_delete`),
  KEY `is_required` (`is_required`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Bolcant dades de la taula `wp_bp_xprofile_fields`
--

INSERT INTO `wp_bp_xprofile_fields` (`id`, `group_id`, `parent_id`, `type`, `name`, `description`, `is_required`, `is_default_option`, `field_order`, `option_order`, `order_by`, `can_delete`) VALUES
(1, 1, 0, 'textbox', 'Name', '', 1, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_bp_xprofile_groups`
--

CREATE TABLE `wp_bp_xprofile_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` mediumtext NOT NULL,
  `group_order` bigint(20) NOT NULL DEFAULT '0',
  `can_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `can_delete` (`can_delete`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Bolcant dades de la taula `wp_bp_xprofile_groups`
--

INSERT INTO `wp_bp_xprofile_groups` (`id`, `name`, `description`, `group_order`, `can_delete`) VALUES
(1, 'Base', '', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_bp_xprofile_meta`
--

CREATE TABLE `wp_bp_xprofile_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) NOT NULL,
  `object_type` varchar(150) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1375 ;

--
-- Bolcant dades de la taula `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://pwc-int.educacio.intranet/agora/masterpri', 'yes'),
(2, 'blogname', 'Escola L&#039;Arany', 'yes'),
(3, 'blogdescription', 'Web en construcció', 'yes'),
(4, 'users_can_register', '0', 'yes'),
(5, 'admin_email', 'a8000006@xtec.cat', 'yes'),
(6, 'start_of_week', '1', 'yes'),
(7, 'use_balanceTags', '0', 'yes'),
(8, 'use_smilies', '1', 'yes'),
(9, 'require_name_email', '1', 'yes'),
(10, 'comments_notify', '1', 'yes'),
(11, 'posts_per_rss', '10', 'yes'),
(12, 'rss_use_excerpt', '0', 'yes'),
(13, 'mailserver_url', 'mail.example.com', 'yes'),
(14, 'mailserver_login', 'login@example.com', 'yes'),
(15, 'mailserver_pass', 'password', 'yes'),
(16, 'mailserver_port', '110', 'yes'),
(17, 'default_category', '1', 'yes'),
(18, 'default_comment_status', 'open', 'yes'),
(19, 'default_ping_status', 'open', 'yes'),
(20, 'default_pingback_flag', '1', 'yes'),
(21, 'posts_per_page', '10', 'yes'),
(22, 'date_format', 'j \\d\\e F \\d\\e Y', 'yes'),
(23, 'time_format', 'G:i', 'yes'),
(24, 'links_updated_date_format', 'j \\d\\e F \\d\\e Y G:i', 'yes'),
(25, 'comment_moderation', '0', 'yes'),
(26, 'moderation_notify', '1', 'yes'),
(27, 'permalink_structure', '/%category%/%postname%/', 'yes'),
(28, 'gzipcompression', '0', 'yes'),
(29, 'hack_file', '0', 'yes'),
(30, 'blog_charset', 'UTF-8', 'yes'),
(31, 'moderation_keys', '', 'no'),
(32, 'active_plugins', 'a:23:{i:0;s:42:"bbpress-enable-tinymce-visual-tab/init.php";i:1;s:19:"bbpress/bbpress.php";i:2;s:37:"blogger-importer/blogger-importer.php";i:3;s:29:"bp-moderation/bpModLoader.php";i:4;s:33:"buddypress-activity-plus/bpfb.php";i:5;s:26:"buddypress-docs/loader.php";i:6;s:64:"buddypress-group-email-subscription/bp-activity-subscription.php";i:7;s:34:"buddypress-like/bp-like-loader.php";i:8;s:24:"buddypress/bp-loader.php";i:9;s:43:"google-analyticator/google-analyticator.php";i:10;s:49:"google-calendar-events/google-calendar-events.php";i:11;s:27:"grup-classe/grup_classe.php";i:12;s:31:"invite-anyone/invite-anyone.php";i:13;s:69:"pending-submission-notifications/pending-submission-notifications.php";i:14;s:27:"private-bp-pages/loader.php";i:15;s:21:"raw-html/raw_html.php";i:16;s:25:"slideshare/slideshare.php";i:17;s:44:"slideshow-jquery-image-gallery/slideshow.php";i:19;s:37:"tinymce-advanced/tinymce-advanced.php";i:20;s:71:"widget-visibility-without-jetpack/widget-visibility-without-jetpack.php";i:21;s:41:"wordpress-importer/wordpress-importer.php";i:22;s:42:"wordpress-social-login/wp-social-login.php";i:23;s:23:"xtec-mail/xtec-mail.php";}', 'yes'),
(33, 'home', 'http://pwc-int.educacio.intranet/agora/masterpri', 'yes'),
(34, 'category_base', '/categoria', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'advanced_edit', '0', 'yes'),
(37, 'comment_max_links', '2', 'yes'),
(38, 'gmt_offset', '1', 'yes'),
(39, 'default_email_category', '1', 'yes'),
(40, 'recently_edited', '', 'no'),
(41, 'template', 'reactor', 'yes'),
(42, 'stylesheet', 'reactor-primaria-1', 'yes'),
(43, 'comment_whitelist', '1', 'yes'),
(44, 'blacklist_keys', '', 'no'),
(45, 'comment_registration', '0', 'yes'),
(46, 'html_type', 'text/html', 'yes'),
(47, 'use_trackback', '0', 'yes'),
(48, 'default_role', 'contributor', 'yes'),
(49, 'db_version', '29630', 'yes'),
(50, 'uploads_use_yearmonth_folders', '1', 'yes'),
(51, 'upload_path', '', 'yes'),
(52, 'blog_public', '1', 'yes'),
(53, 'default_link_category', '2', 'yes'),
(54, 'show_on_front', 'page', 'yes'),
(55, 'tag_base', '', 'yes'),
(56, 'show_avatars', '1', 'yes'),
(57, 'avatar_rating', 'G', 'yes'),
(58, 'upload_url_path', '', 'yes'),
(59, 'thumbnail_size_w', '150', 'yes'),
(60, 'thumbnail_size_h', '150', 'yes'),
(61, 'thumbnail_crop', '1', 'yes'),
(62, 'medium_size_w', '300', 'yes'),
(63, 'medium_size_h', '300', 'yes'),
(64, 'avatar_default', 'mystery', 'yes'),
(65, 'large_size_w', '1024', 'yes'),
(66, 'large_size_h', '1024', 'yes'),
(67, 'image_default_link_type', 'file', 'yes'),
(68, 'image_default_size', '', 'yes'),
(69, 'image_default_align', '', 'yes'),
(70, 'close_comments_for_old_posts', '0', 'yes'),
(71, 'close_comments_days_old', '14', 'yes'),
(72, 'thread_comments', '1', 'yes'),
(73, 'thread_comments_depth', '5', 'yes'),
(74, 'page_comments', '0', 'yes'),
(75, 'comments_per_page', '50', 'yes'),
(76, 'default_comments_page', 'newest', 'yes'),
(77, 'comment_order', 'asc', 'yes'),
(78, 'sticky_posts', 'a:0:{}', 'yes'),
(79, 'widget_categories', 'a:2:{s:12:"_multiwidget";i:1;i:1;a:0:{}}', 'yes'),
(80, 'widget_text', 'a:5:{i:1;a:0:{}i:3;a:4:{s:5:"title";s:10:"Benvinguts";s:4:"text";s:213:"En aquesta pàgina podeu trobar tota la informació referent a l''AMPA del centre.\r\n\r\nPer contactar amb l''AMPA: \r\n\r\n<strong>Email:</strong>\r\ncorreuampa@elnostrecentre.cat\r\n\r\n<strong>Telèfon:</strong>\r\n123 45 67 89";s:6:"filter";b:1;s:10:"conditions";a:2:{s:6:"action";s:4:"show";s:5:"rules";a:1:{i:0;a:2:{s:5:"major";s:8:"category";s:5:"minor";s:1:"7";}}}}i:4;a:4:{s:5:"title";s:5:"Ginys";s:4:"text";s:615:"<p>En aquesta barra lateral hi podeu posar tots els ginys que considereu necessaris. Els ginys es poden modificar, afegir o treure de la barra lateral des de la secció <strong>Aparença - Ginys</strong> del Tauler.</p>\r\n<p>Quan afegiu un giny a la barra, aquest es mostra per defecte a totes les pàgines de categoria. Si voleu que aparegui només en una categoria determinada, canvieu els paràmetres de "Visibilitat" fent clic al botó que trobareu a la part inferior de les propietats del giny.</p>\r\n<p><a href=http://agora.xtec.cat/moodle/moodle/mod/glossary/view.php?id=1302&mode=entry&hook=1941>Ajuda</a></p>";s:6:"filter";b:0;s:10:"conditions";a:2:{s:6:"action";s:4:"show";s:5:"rules";a:1:{i:0;a:2:{s:5:"major";s:8:"category";s:5:"minor";s:0:"";}}}}i:5;a:3:{s:5:"title";s:0:"";s:4:"text";s:425:"<a class="twitter-timeline" href="https://twitter.com/escolalarany" data-widget-id="514020442797903872">Tuits de @escolalarany</a>\r\n<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:6:"filter";b:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(82, 'uninstall_plugins', 'a:0:{}', 'no'),
(83, 'timezone_string', '', 'yes'),
(84, 'page_for_posts', '0', 'yes'),
(85, 'page_on_front', '9', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'initial_db_version', '27916', 'yes'),
(89, 'wp_user_roles', 'a:10:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:65:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:45:"slideshow-jquery-image-gallery-add-slideshows";b:1;s:46:"slideshow-jquery-image-gallery-edit-slideshows";b:1;s:48:"slideshow-jquery-image-gallery-delete-slideshows";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:37:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:45:"slideshow-jquery-image-gallery-add-slideshows";b:1;s:46:"slideshow-jquery-image-gallery-edit-slideshows";b:1;s:48:"slideshow-jquery-image-gallery-delete-slideshows";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:13:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;s:45:"slideshow-jquery-image-gallery-add-slideshows";b:1;s:46:"slideshow-jquery-image-gallery-edit-slideshows";b:1;s:48:"slideshow-jquery-image-gallery-delete-slideshows";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:6:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:12:"upload_files";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:13:"bbp_keymaster";a:2:{s:4:"name";s:9:"Keymaster";s:12:"capabilities";a:29:{s:9:"keep_gate";b:1;s:8:"spectate";b:1;s:11:"participate";b:1;s:8:"moderate";b:1;s:8:"throttle";b:1;s:10:"view_trash";b:1;s:14:"publish_forums";b:1;s:11:"edit_forums";b:1;s:18:"edit_others_forums";b:1;s:13:"delete_forums";b:1;s:20:"delete_others_forums";b:1;s:19:"read_private_forums";b:1;s:18:"read_hidden_forums";b:1;s:14:"publish_topics";b:1;s:11:"edit_topics";b:1;s:18:"edit_others_topics";b:1;s:13:"delete_topics";b:1;s:20:"delete_others_topics";b:1;s:19:"read_private_topics";b:1;s:15:"publish_replies";b:1;s:12:"edit_replies";b:1;s:19:"edit_others_replies";b:1;s:14:"delete_replies";b:1;s:21:"delete_others_replies";b:1;s:20:"read_private_replies";b:1;s:17:"manage_topic_tags";b:1;s:15:"edit_topic_tags";b:1;s:17:"delete_topic_tags";b:1;s:17:"assign_topic_tags";b:1;}}s:13:"bbp_spectator";a:2:{s:4:"name";s:9:"Spectator";s:12:"capabilities";a:1:{s:8:"spectate";b:1;}}s:11:"bbp_blocked";a:2:{s:4:"name";s:7:"Blocked";s:12:"capabilities";a:28:{s:8:"spectate";b:0;s:11:"participate";b:0;s:8:"moderate";b:0;s:8:"throttle";b:0;s:10:"view_trash";b:0;s:14:"publish_forums";b:0;s:11:"edit_forums";b:0;s:18:"edit_others_forums";b:0;s:13:"delete_forums";b:0;s:20:"delete_others_forums";b:0;s:19:"read_private_forums";b:0;s:18:"read_hidden_forums";b:0;s:14:"publish_topics";b:0;s:11:"edit_topics";b:0;s:18:"edit_others_topics";b:0;s:13:"delete_topics";b:0;s:20:"delete_others_topics";b:0;s:19:"read_private_topics";b:0;s:15:"publish_replies";b:0;s:12:"edit_replies";b:0;s:19:"edit_others_replies";b:0;s:14:"delete_replies";b:0;s:21:"delete_others_replies";b:0;s:20:"read_private_replies";b:0;s:17:"manage_topic_tags";b:0;s:15:"edit_topic_tags";b:0;s:17:"delete_topic_tags";b:0;s:17:"assign_topic_tags";b:0;}}s:13:"bbp_moderator";a:2:{s:4:"name";s:9:"Moderator";s:12:"capabilities";a:25:{s:8:"spectate";b:1;s:11:"participate";b:1;s:8:"moderate";b:1;s:8:"throttle";b:1;s:10:"view_trash";b:1;s:14:"publish_forums";b:1;s:11:"edit_forums";b:1;s:19:"read_private_forums";b:1;s:18:"read_hidden_forums";b:1;s:14:"publish_topics";b:1;s:11:"edit_topics";b:1;s:18:"edit_others_topics";b:1;s:13:"delete_topics";b:1;s:20:"delete_others_topics";b:1;s:19:"read_private_topics";b:1;s:15:"publish_replies";b:1;s:12:"edit_replies";b:1;s:19:"edit_others_replies";b:1;s:14:"delete_replies";b:1;s:21:"delete_others_replies";b:1;s:20:"read_private_replies";b:1;s:17:"manage_topic_tags";b:1;s:15:"edit_topic_tags";b:1;s:17:"delete_topic_tags";b:1;s:17:"assign_topic_tags";b:1;}}s:15:"bbp_participant";a:2:{s:4:"name";s:11:"Participant";s:12:"capabilities";a:8:{s:8:"spectate";b:1;s:11:"participate";b:1;s:19:"read_private_forums";b:1;s:14:"publish_topics";b:1;s:11:"edit_topics";b:1;s:15:"publish_replies";b:1;s:12:"edit_replies";b:1;s:17:"assign_topic_tags";b:1;}}}', 'yes'),
(90, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(91, 'widget_recent-posts', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:6:"number";i:5;s:7:"exclude";s:0:"";s:10:"conditions";a:2:{s:6:"action";s:4:"show";s:5:"rules";a:1:{i:0;a:2:{s:5:"major";s:4:"page";s:5:"minor";s:14:"post_type-post";}}}}s:12:"_multiwidget";i:1;}', 'yes'),
(92, 'widget_recent-comments', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:6:"number";i:5;s:10:"conditions";a:2:{s:6:"action";s:4:"show";s:5:"rules";a:1:{i:0;a:2:{s:5:"major";s:4:"page";s:5:"minor";s:14:"post_type-post";}}}}s:12:"_multiwidget";i:1;}', 'yes'),
(93, 'widget_archives', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;s:10:"conditions";a:2:{s:6:"action";s:4:"show";s:5:"rules";a:1:{i:0;a:2:{s:5:"major";s:4:"page";s:5:"minor";s:14:"post_type-post";}}}}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'sidebars_widgets', 'a:8:{s:19:"wp_inactive_widgets";a:0:{}s:9:"categoria";a:14:{i:0;s:10:"nav_menu-2";i:1;s:10:"nav_menu-3";i:2;s:6:"text-3";i:3;s:20:"grup_classe_widget-5";i:4;s:20:"grup_classe_widget-6";i:5;s:20:"grup_classe_widget-7";i:6;s:20:"grup_classe_widget-8";i:7;s:20:"grup_classe_widget-9";i:8;s:21:"grup_classe_widget-10";i:9;s:20:"grup_classe_widget-2";i:10;s:20:"grup_classe_widget-3";i:11;s:20:"grup_classe_widget-4";i:12;s:6:"text-4";i:13;s:13:"xtec_widget-3";}s:7:"sidebar";a:7:{i:0;s:17:"slideshowwidget-2";i:1;s:18:"bp_groups_widget-2";i:2;s:32:"bp_core_recently_active_widget-2";i:3;s:14:"recent-posts-2";i:4;s:17:"recent-comments-2";i:5;s:11:"tag_cloud-2";i:6;s:10:"archives-2";}s:9:"sidebar-2";a:0:{}s:17:"sidebar-frontpage";a:4:{i:0;s:20:"logo_centre_widget-2";i:1;s:12:"gce_widget-2";i:2;s:6:"text-5";i:3;s:13:"xtec_widget-2";}s:19:"sidebar-frontpage-2";a:0:{}s:14:"sidebar-footer";a:2:{i:0;s:20:"socialmedia_widget-2";i:1;s:20:"logo_centre_widget-3";}s:13:"array_version";i:3;}', 'yes'),
(96, 'cron', 'a:7:{i:1432199449;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1432199460;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1432214122;a:1:{s:12:"remove_stats";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1432220826;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1432237020;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1432263600;a:1:{s:16:"ass_digest_event";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(99, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1432188324;s:8:"response";a:10:{s:19:"bbpress/bbpress.php";O:8:"stdClass":6:{s:2:"id";s:5:"11780";s:4:"slug";s:7:"bbpress";s:6:"plugin";s:19:"bbpress/bbpress.php";s:11:"new_version";s:5:"2.5.7";s:3:"url";s:38:"https://wordpress.org/plugins/bbpress/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/bbpress.2.5.7.zip";}s:24:"buddypress/bp-loader.php";O:8:"stdClass":7:{s:2:"id";s:4:"7756";s:4:"slug";s:10:"buddypress";s:6:"plugin";s:24:"buddypress/bp-loader.php";s:11:"new_version";s:7:"2.2.3.1";s:3:"url";s:41:"https://wordpress.org/plugins/buddypress/";s:7:"package";s:61:"https://downloads.wordpress.org/plugin/buddypress.2.2.3.1.zip";s:14:"upgrade_notice";s:59:"See: https://codex.buddypress.org/releases/version-2-2-3-1/";}s:64:"buddypress-group-email-subscription/bp-activity-subscription.php";O:8:"stdClass":6:{s:2:"id";s:5:"13692";s:4:"slug";s:35:"buddypress-group-email-subscription";s:6:"plugin";s:64:"buddypress-group-email-subscription/bp-activity-subscription.php";s:11:"new_version";s:5:"3.5.1";s:3:"url";s:66:"https://wordpress.org/plugins/buddypress-group-email-subscription/";s:7:"package";s:84:"https://downloads.wordpress.org/plugin/buddypress-group-email-subscription.3.5.1.zip";}s:34:"buddypress-like/bp-like-loader.php";O:8:"stdClass":7:{s:2:"id";s:5:"13151";s:4:"slug";s:15:"buddypress-like";s:6:"plugin";s:34:"buddypress-like/bp-like-loader.php";s:11:"new_version";s:5:"0.2.0";s:3:"url";s:46:"https://wordpress.org/plugins/buddypress-like/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/buddypress-like.zip";s:14:"upgrade_notice";s:56:"jQuery UI added back, which is required for some themes.";}s:49:"google-calendar-events/google-calendar-events.php";O:8:"stdClass":6:{s:2:"id";s:5:"15794";s:4:"slug";s:22:"google-calendar-events";s:6:"plugin";s:49:"google-calendar-events/google-calendar-events.php";s:11:"new_version";s:5:"2.2.5";s:3:"url";s:53:"https://wordpress.org/plugins/google-calendar-events/";s:7:"package";s:71:"https://downloads.wordpress.org/plugin/google-calendar-events.2.2.5.zip";}s:67:"import-users-from-csv-with-meta/import-users-from-csv-with-meta.php";O:8:"stdClass":6:{s:2:"id";s:5:"51873";s:4:"slug";s:31:"import-users-from-csv-with-meta";s:6:"plugin";s:67:"import-users-from-csv-with-meta/import-users-from-csv-with-meta.php";s:11:"new_version";s:5:"1.3.3";s:3:"url";s:62:"https://wordpress.org/plugins/import-users-from-csv-with-meta/";s:7:"package";s:74:"https://downloads.wordpress.org/plugin/import-users-from-csv-with-meta.zip";}s:31:"invite-anyone/invite-anyone.php";O:8:"stdClass":6:{s:2:"id";s:5:"11875";s:4:"slug";s:13:"invite-anyone";s:6:"plugin";s:31:"invite-anyone/invite-anyone.php";s:11:"new_version";s:5:"1.3.7";s:3:"url";s:44:"https://wordpress.org/plugins/invite-anyone/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/invite-anyone.1.3.7.zip";}s:21:"raw-html/raw_html.php";O:8:"stdClass":6:{s:2:"id";s:4:"1416";s:4:"slug";s:8:"raw-html";s:6:"plugin";s:21:"raw-html/raw_html.php";s:11:"new_version";s:6:"1.4.15";s:3:"url";s:39:"https://wordpress.org/plugins/raw-html/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/raw-html.1.4.15.zip";}s:44:"slideshow-jquery-image-gallery/slideshow.php";O:8:"stdClass":6:{s:2:"id";s:5:"31854";s:4:"slug";s:30:"slideshow-jquery-image-gallery";s:6:"plugin";s:44:"slideshow-jquery-image-gallery/slideshow.php";s:11:"new_version";s:6:"2.2.23";s:3:"url";s:61:"https://wordpress.org/plugins/slideshow-jquery-image-gallery/";s:7:"package";s:73:"https://downloads.wordpress.org/plugin/slideshow-jquery-image-gallery.zip";}s:35:"social-articles/social-articles.php";O:8:"stdClass":6:{s:2:"id";s:5:"38869";s:4:"slug";s:15:"social-articles";s:6:"plugin";s:35:"social-articles/social-articles.php";s:11:"new_version";s:3:"1.8";s:3:"url";s:46:"https://wordpress.org/plugins/social-articles/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/social-articles.1.8.zip";}}s:12:"translations";a:3:{i:0;a:7:{s:4:"type";s:6:"plugin";s:4:"slug";s:7:"bbpress";s:8:"language";s:2:"ca";s:7:"version";s:3:"2.5";s:7:"updated";s:19:"2014-08-27 10:11:47";s:7:"package";s:69:"https://downloads.wordpress.org/translation/plugin/bbpress/2.5/ca.zip";s:10:"autoupdate";b:1;}i:1;a:7:{s:4:"type";s:6:"plugin";s:4:"slug";s:16:"blogger-importer";s:8:"language";s:2:"ca";s:7:"version";s:3:"0.5";s:7:"updated";s:19:"2012-12-09 18:31:52";s:7:"package";s:78:"https://downloads.wordpress.org/translation/plugin/blogger-importer/0.5/ca.zip";s:10:"autoupdate";b:1;}i:2;a:7:{s:4:"type";s:6:"plugin";s:4:"slug";s:18:"wordpress-importer";s:8:"language";s:2:"ca";s:7:"version";s:5:"0.6.1";s:7:"updated";s:19:"2012-12-09 19:11:37";s:7:"package";s:82:"https://downloads.wordpress.org/translation/plugin/wordpress-importer/0.6.1/ca.zip";s:10:"autoupdate";b:1;}}s:9:"no_update";a:13:{s:42:"bbpress-enable-tinymce-visual-tab/init.php";O:8:"stdClass":6:{s:2:"id";s:5:"40515";s:4:"slug";s:33:"bbpress-enable-tinymce-visual-tab";s:6:"plugin";s:42:"bbpress-enable-tinymce-visual-tab/init.php";s:11:"new_version";s:5:"1.0.1";s:3:"url";s:64:"https://wordpress.org/plugins/bbpress-enable-tinymce-visual-tab/";s:7:"package";s:76:"https://downloads.wordpress.org/plugin/bbpress-enable-tinymce-visual-tab.zip";}s:37:"blogger-importer/blogger-importer.php";O:8:"stdClass":7:{s:2:"id";s:5:"14987";s:4:"slug";s:16:"blogger-importer";s:6:"plugin";s:37:"blogger-importer/blogger-importer.php";s:11:"new_version";s:3:"0.7";s:3:"url";s:47:"https://wordpress.org/plugins/blogger-importer/";s:7:"package";s:63:"https://downloads.wordpress.org/plugin/blogger-importer.0.7.zip";s:14:"upgrade_notice";s:148:"Added support for images and links. Improvements in error handling when connecting to Google. Some bug fixes, see change log. User interface refresh";}s:33:"buddypress-activity-plus/bpfb.php";O:8:"stdClass":6:{s:2:"id";s:5:"22781";s:4:"slug";s:24:"buddypress-activity-plus";s:6:"plugin";s:33:"buddypress-activity-plus/bpfb.php";s:11:"new_version";s:5:"1.6.1";s:3:"url";s:55:"https://wordpress.org/plugins/buddypress-activity-plus/";s:7:"package";s:73:"https://downloads.wordpress.org/plugin/buddypress-activity-plus.1.6.1.zip";}s:26:"buddypress-docs/loader.php";O:8:"stdClass":6:{s:2:"id";s:5:"20975";s:4:"slug";s:15:"buddypress-docs";s:6:"plugin";s:26:"buddypress-docs/loader.php";s:11:"new_version";s:5:"1.8.5";s:3:"url";s:46:"https://wordpress.org/plugins/buddypress-docs/";s:7:"package";s:64:"https://downloads.wordpress.org/plugin/buddypress-docs.1.8.5.zip";}s:29:"bp-moderation/bpModLoader.php";O:8:"stdClass":7:{s:2:"id";s:5:"14585";s:4:"slug";s:13:"bp-moderation";s:6:"plugin";s:29:"bp-moderation/bpModLoader.php";s:11:"new_version";s:5:"0.1.7";s:3:"url";s:44:"https://wordpress.org/plugins/bp-moderation/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/bp-moderation.0.1.7.zip";s:14:"upgrade_notice";s:62:"Requires PHP 5.3\nModeration page has now a top-level menu item";}s:43:"google-analyticator/google-analyticator.php";O:8:"stdClass":6:{s:2:"id";s:3:"130";s:4:"slug";s:19:"google-analyticator";s:6:"plugin";s:43:"google-analyticator/google-analyticator.php";s:11:"new_version";s:5:"6.4.8";s:3:"url";s:50:"https://wordpress.org/plugins/google-analyticator/";s:7:"package";s:68:"https://downloads.wordpress.org/plugin/google-analyticator.6.4.8.zip";}s:69:"pending-submission-notifications/pending-submission-notifications.php";O:8:"stdClass":6:{s:2:"id";s:5:"50559";s:4:"slug";s:32:"pending-submission-notifications";s:6:"plugin";s:69:"pending-submission-notifications/pending-submission-notifications.php";s:11:"new_version";s:3:"1.0";s:3:"url";s:63:"https://wordpress.org/plugins/pending-submission-notifications/";s:7:"package";s:75:"https://downloads.wordpress.org/plugin/pending-submission-notifications.zip";}s:25:"slideshare/slideshare.php";O:8:"stdClass":6:{s:2:"id";s:4:"1569";s:4:"slug";s:10:"slideshare";s:6:"plugin";s:25:"slideshare/slideshare.php";s:11:"new_version";s:5:"1.9.1";s:3:"url";s:41:"https://wordpress.org/plugins/slideshare/";s:7:"package";s:59:"https://downloads.wordpress.org/plugin/slideshare.1.9.1.zip";}s:37:"tinymce-advanced/tinymce-advanced.php";O:8:"stdClass":6:{s:2:"id";s:3:"731";s:4:"slug";s:16:"tinymce-advanced";s:6:"plugin";s:37:"tinymce-advanced/tinymce-advanced.php";s:11:"new_version";s:5:"4.1.9";s:3:"url";s:47:"https://wordpress.org/plugins/tinymce-advanced/";s:7:"package";s:65:"https://downloads.wordpress.org/plugin/tinymce-advanced.4.1.9.zip";}s:71:"widget-visibility-without-jetpack/widget-visibility-without-jetpack.php";O:8:"stdClass":6:{s:2:"id";s:5:"44147";s:4:"slug";s:33:"widget-visibility-without-jetpack";s:6:"plugin";s:71:"widget-visibility-without-jetpack/widget-visibility-without-jetpack.php";s:11:"new_version";s:3:"0.4";s:3:"url";s:64:"https://wordpress.org/plugins/widget-visibility-without-jetpack/";s:7:"package";s:76:"https://downloads.wordpress.org/plugin/widget-visibility-without-jetpack.zip";}s:41:"wordpress-importer/wordpress-importer.php";O:8:"stdClass":6:{s:2:"id";s:5:"14975";s:4:"slug";s:18:"wordpress-importer";s:6:"plugin";s:41:"wordpress-importer/wordpress-importer.php";s:11:"new_version";s:5:"0.6.1";s:3:"url";s:49:"https://wordpress.org/plugins/wordpress-importer/";s:7:"package";s:67:"https://downloads.wordpress.org/plugin/wordpress-importer.0.6.1.zip";}s:41:"wordpress-php-info/wordpress-php-info.php";O:8:"stdClass":6:{s:2:"id";s:4:"6362";s:4:"slug";s:18:"wordpress-php-info";s:6:"plugin";s:41:"wordpress-php-info/wordpress-php-info.php";s:11:"new_version";s:5:"14.12";s:3:"url";s:49:"https://wordpress.org/plugins/wordpress-php-info/";s:7:"package";s:61:"https://downloads.wordpress.org/plugin/wordpress-php-info.zip";}s:42:"wordpress-social-login/wp-social-login.php";O:8:"stdClass":6:{s:2:"id";s:5:"27354";s:4:"slug";s:22:"wordpress-social-login";s:6:"plugin";s:42:"wordpress-social-login/wp-social-login.php";s:11:"new_version";s:5:"2.2.3";s:3:"url";s:53:"https://wordpress.org/plugins/wordpress-social-login/";s:7:"package";s:71:"https://downloads.wordpress.org/plugin/wordpress-social-login.2.2.3.zip";}}}', 'yes'),
(102, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1432188326;s:7:"checked";a:1:{s:18:"reactor-primaria-1";s:5:"1.0.0";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'yes'),
(119, 'recently_activated', 'a:1:{s:35:"social-articles/social-articles.php";i:1426254588;}', 'yes'),
(122, '_bbp_private_forums', 'a:0:{}', 'yes'),
(123, '_bbp_hidden_forums', 'a:0:{}', 'yes'),
(124, '_bbp_db_version', '250', 'yes'),
(125, 'bp-deactivated-components', 'a:0:{}', 'yes'),
(126, 'bb-config-location', '/dades/agora/html/wordpress/bb-config.php', 'yes'),
(127, 'bp-xprofile-base-group-name', 'Base', 'yes'),
(128, 'bp-xprofile-fullname-field-name', 'Name', 'yes'),
(129, 'bp-blogs-first-install', '', 'yes'),
(130, 'bp-disable-profile-sync', '0', 'yes'),
(131, 'hide-loggedout-adminbar', '0', 'yes'),
(132, 'bp-disable-avatar-uploads', '0', 'yes'),
(133, 'bp-disable-account-deletion', '1', 'yes'),
(134, 'bp-disable-blogforum-comments', '1', 'yes'),
(135, '_bp_theme_package_id', 'legacy', 'yes'),
(136, 'bp_restrict_group_creation', '1', 'yes'),
(137, '_bp_enable_akismet', '1', 'yes'),
(138, '_bp_enable_heartbeat_refresh', '1', 'yes'),
(139, '_bp_force_buddybar', '', 'yes'),
(140, '_bp_retain_bp_default', '', 'yes'),
(141, 'widget_bp_core_login_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(142, 'widget_bp_core_members_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(143, 'widget_bp_core_whos_online_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(144, 'widget_bp_core_recently_active_widget', 'a:3:{i:1;a:0:{}i:2;a:3:{s:5:"title";s:17:"Han entrat fa poc";s:11:"max_members";s:2:"50";s:10:"conditions";a:2:{s:6:"action";s:4:"show";s:5:"rules";a:3:{i:0;a:2:{s:5:"major";s:4:"page";s:5:"minor";s:1:"5";}i:1;a:2:{s:5:"major";s:4:"page";s:5:"minor";s:1:"6";}i:2;a:2:{s:5:"major";s:4:"page";s:5:"minor";s:3:"141";}}}}s:12:"_multiwidget";i:1;}', 'yes'),
(145, 'widget_bp_groups_widget', 'a:2:{i:2;a:5:{s:5:"title";s:5:"Nodes";s:10:"max_groups";s:2:"16";s:13:"group_default";s:6:"active";s:10:"link_title";b:1;s:10:"conditions";a:2:{s:6:"action";s:4:"show";s:5:"rules";a:3:{i:0;a:2:{s:5:"major";s:4:"page";s:5:"minor";s:1:"5";}i:1;a:2:{s:5:"major";s:4:"page";s:5:"minor";s:3:"141";}i:2;a:2:{s:5:"major";s:4:"page";s:5:"minor";s:1:"6";}}}}s:12:"_multiwidget";i:1;}', 'yes'),
(146, 'widget_bp_messages_sitewide_notices_widget', '', 'yes'),
(151, 'registration', '0', 'yes'),
(152, 'bp-active-components', 'a:8:{s:8:"xprofile";s:1:"1";s:8:"settings";s:1:"1";s:7:"friends";s:1:"1";s:8:"messages";s:1:"1";s:8:"activity";s:1:"1";s:13:"notifications";s:1:"1";s:6:"groups";s:1:"1";s:7:"members";s:1:"1";}', 'yes'),
(153, 'bp-pages', 'a:3:{s:8:"activity";i:5;s:7:"members";i:6;s:6:"groups";i:141;}', 'yes'),
(154, '_bp_db_version', '8311', 'yes'),
(156, 'bp_docs_attachment_protection', '1', 'yes'),
(157, 'ass_digest_time', 'a:2:{s:5:"hours";s:2:"05";s:7:"minutes";s:2:"00";}', 'yes'),
(158, 'ass_weekly_digest', '4', 'yes'),
(159, 'bp_like_db_version', '22', 'yes'),
(160, 'bp_like_settings', 'a:7:{s:17:"likers_visibility";s:8:"show_all";s:23:"post_to_activity_stream";i:1;s:12:"show_excerpt";i:0;s:14:"excerpt_length";i:140;s:12:"text_strings";a:29:{s:4:"like";a:2:{s:7:"default";s:8:"M''agrada";s:6:"custom";s:4:"Like";}s:6:"unlike";a:2:{s:7:"default";s:11:"No m''agrada";s:6:"custom";s:6:"Unlike";}s:14:"like_this_item";a:2:{s:7:"default";s:34:"Indica que aquest element m''agrada";s:6:"custom";s:14:"Like this item";}s:16:"unlike_this_item";a:2:{s:7:"default";s:37:"Indica que aquest element no m''agrada";s:6:"custom";s:16:"Unlike this item";}s:10:"view_likes";a:2:{s:7:"default";s:21:"Mostra els "m''agrada"";s:6:"custom";s:10:"View likes";}s:10:"hide_likes";a:2:{s:7:"default";s:20:"Amaga els "M''agrada"";s:6:"custom";s:10:"Hide likes";}s:19:"show_activity_likes";a:2:{s:7:"default";s:9:"Activitat";s:6:"custom";s:14:"Activity Likes";}s:19:"show_blogpost_likes";a:2:{s:7:"default";s:31:""M''agrada" d''enviaments de blog";s:6:"custom";s:15:"Blog Post Likes";}s:17:"must_be_logged_in";a:2:{s:7:"default";s:46:"Has d''estar validat per poder dir que t''agrada";s:6:"custom";s:42:"Sorry, you must be logged in to like that.";}s:25:"record_activity_likes_own";a:2:{s:7:"default";s:74:"A %user% li ha agradat la seva pròpia <a href="%permalink%">activitat</a>";s:6:"custom";s:57:"%user% liked their own <a href="%permalink%">activity</a>";}s:24:"record_activity_likes_an";a:2:{s:7:"default";s:62:"A %user% li ha agradat una <a href="%permalink%">activitat</a>";s:6:"custom";s:50:"%user% liked an <a href="%permalink%">activity</a>";}s:27:"record_activity_likes_users";a:2:{s:7:"default";s:72:"A %user% li ha agradat l''<a href="%permalink%">activitat</a> de %author%";s:6:"custom";s:58:"%user% liked %author%''s <a href="%permalink%">activity</a>";}s:34:"record_activity_likes_own_blogpost";a:2:{s:7:"default";s:88:"A %user% li ha agradat el seu propi enviament al blog, <a href="%permalink%">%title%</a>";s:6:"custom";s:67:"%user% liked their own blog post, <a href="%permalink%">%title%</a>";}s:32:"record_activity_likes_a_blogpost";a:2:{s:7:"default";s:78:"A %user% li ha agradat un enviament al blog, <a href="%permalink%">%title%</a>";s:6:"custom";s:60:"%user% liked an blog post, <a href="%permalink%">%title%</a>";}s:36:"record_activity_likes_users_blogpost";a:2:{s:7:"default";s:89:"A %user% li ha agradat l''enviament de %author% al blog, <a href="%permalink%">%title%</a>";s:6:"custom";s:68:"%user% liked %author%''s blog post, <a href="%permalink%">%title%</a>";}s:18:"get_likes_no_likes";a:2:{s:7:"default";s:36:"Ningú ha clicat ningú a "M''agrada"";s:6:"custom";s:22:"Nobody likes this yet.";}s:20:"get_likes_only_liker";a:2:{s:7:"default";s:47:"Ets l''única persona que ha clicat a "M''agrada"";s:6:"custom";s:46:"You are the only person who likes this so far.";}s:26:"get_likes_you_and_singular";a:2:{s:7:"default";s:40:"A tu i a %count% altra persona us agrada";s:6:"custom";s:39:"You and %count% other person like this.";}s:24:"get_likes_you_and_plural";a:2:{s:7:"default";s:40:"A tu i a %count% persones més us agrada";s:6:"custom";s:38:"You and %count% other people like this";}s:31:"get_likes_count_people_singular";a:2:{s:7:"default";s:33:"A %count% persona li agrada això";s:6:"custom";s:26:"%count% person likes this.";}s:29:"get_likes_count_people_plural";a:2:{s:7:"default";s:35:"A %count% persones els agrada això";s:6:"custom";s:25:"%count% people like this.";}s:29:"get_likes_and_people_singular";a:2:{s:7:"default";s:34:"i a %count% persona més us agrada";s:6:"custom";s:35:"and %count% other person like this.";}s:27:"get_likes_and_people_plural";a:2:{s:7:"default";s:35:"i a %count% persones més us agrada";s:6:"custom";s:35:"and %count% other people like this.";}s:20:"get_likes_likes_this";a:2:{s:7:"default";s:13:"li ha agradat";s:6:"custom";s:11:"liked this.";}s:19:"get_likes_like_this";a:2:{s:7:"default";s:9:"li agrada";s:6:"custom";s:10:"like this.";}s:37:"get_likes_no_friends_you_and_singular";a:2:{s:7:"default";s:87:"Cap dels teus amics ha clicat a "M''agrada", però tu i %count% altra persona ho heu fet";s:6:"custom";s:74:"None of your friends like this yet, but you and %count% other person does.";}s:35:"get_likes_no_friends_you_and_plural";a:2:{s:7:"default";s:87:"Cap dels teus amics ha clicat a "M''agrada", però tu i %count% persones més ho heu fet";s:6:"custom";s:72:"None of your friends like this yet, but you and %count% other people do.";}s:29:"get_likes_no_friends_singular";a:2:{s:7:"default";s:75:"Cap dels teus amics ha clicat a "M''agrada", però %count% persona ho ha fet";s:6:"custom";s:66:"None of your friends like this yet, but %count% other person does.";}s:27:"get_likes_no_friends_plural";a:2:{s:7:"default";s:77:"Cap dels teus amics ha clicat a "M''agrada", però %count% persones ho han fet";s:6:"custom";s:64:"None of your friends like this yet, but %count% other people do.";}}s:14:"name_or_avatar";s:4:"name";s:17:"remove_fav_button";s:1:"0";}', 'yes'),
(161, 'bp_moderation_options', 'a:6:{s:14:"unflagged_text";s:9:"Inadequat";s:12:"flagged_text";s:16:"No és inadequat";s:12:"active_types";a:1:{s:16:"activity_comment";s:2:"on";}s:17:"warning_threshold";i:5;s:15:"warning_forward";s:17:"a8000006@xtec.cat";s:15:"warning_message";s:297:"Several user reported one of your content as inappropriate.\r\nYou can see the content in the page: %CONTENTURL%.\r\nYou posted this content with the account "%AUTHORNAME%".\r\n\r\nA community moderator will soon review and moderate this content if necessary.\r\n--------------------\r\n[%SITENAME%] %SITEURL%";}', 'yes'),
(162, 'bp_moderation_db_version', '-100', 'yes'),
(163, 'gce_version', '2.1.7', 'yes'),
(164, 'gce_options', 'a:1:{i:1;a:28:{s:2:"id";i:1;s:5:"title";s:0:"";s:3:"url";s:78:"http://www.google.com/calendar/feeds/inslarany%40ies-sabadell.cat/public/basic";s:13:"retrieve_from";s:5:"today";s:19:"retrieve_from_value";i:0;s:14:"retrieve_until";s:3:"any";s:20:"retrieve_until_value";i:0;s:10:"max_events";i:25;s:11:"date_format";s:0:"";s:11:"time_format";s:0:"";s:8:"timezone";s:7:"default";s:14:"cache_duration";i:300;s:12:"multiple_day";s:4:"true";s:13:"display_start";s:4:"time";s:11:"display_end";s:9:"time-date";s:16:"display_location";N;s:12:"display_desc";N;s:12:"display_link";s:2:"on";s:18:"display_start_text";s:7:"Starts:";s:16:"display_end_text";s:5:"Ends:";s:21:"display_location_text";s:9:"Location:";s:17:"display_desc_text";s:12:"Description:";s:18:"display_desc_limit";s:0:"";s:17:"display_link_text";s:12:"More details";s:19:"display_link_target";N;s:17:"display_separator";s:2:", ";s:11:"use_builder";s:4:"true";s:7:"builder";s:451:"<div class="gce-list-event gce-tooltip-event">[event-title]</div>\r\n[if-not-all-day]\r\n[if-single-day]<div><span>Quan:</span> [start-time]-[end-time]</div>[/if-single-day]\r\n[/if-not-all-day]\r\n[if-multi-day]<div>Del [start-date] fins el [end-date]</div>[/if-multi-day]\r\n[if-location]<div><span>On:</span> [location]</div>[/if-location]\r\n[if-description]<div>[description]</div>[/if-description]\r\n<div>[link newwindow="true"]Més detalls...[/link]</div>\r\n";}}', 'yes'),
(165, 'gce_general', 'a:7:{s:10:"stylesheet";s:0:"";s:10:"javascript";b:0;s:7:"loading";s:12:"Carregant...";s:5:"error";s:65:"El calendari no està disponible, torna a provar en uns minuts...";s:6:"fields";b:1;s:14:"old_stylesheet";b:0;s:13:"save_settings";b:1;}', 'yes'),
(166, 'invite_anyone', 'a:22:{s:11:"max_invites";i:5;s:23:"allow_email_invitations";s:3:"all";s:23:"message_is_customizable";s:3:"yes";s:23:"subject_is_customizable";s:2:"no";s:28:"can_send_group_invites_email";s:3:"yes";s:24:"bypass_registration_lock";s:3:"yes";s:7:"version";s:5:"1.3.1";s:23:"email_visibility_toggle";s:8:"no_limit";s:18:"email_since_toggle";b:0;s:10:"days_since";s:1:"0";s:17:"email_role_toggle";s:3:"yes";s:12:"minimum_role";s:13:"Administrator";s:22:"email_blacklist_toggle";b:0;s:15:"email_blacklist";s:0:"";s:23:"group_invites_can_admin";s:6:"anyone";s:29:"group_invites_can_group_admin";s:6:"anyone";s:27:"group_invites_can_group_mod";s:6:"anyone";s:30:"group_invites_can_group_member";s:5:"noone";s:32:"group_invites_enable_create_step";s:3:"yes";s:19:"cloudsponge_enabled";s:3:"off";s:26:"email_limit_invites_toggle";b:0;s:22:"limit_invites_per_user";s:2:"10";}', 'yes'),
(167, 'invite_anyone_db_version', '1.3.6', 'yes'),
(168, 'slideshow-plugin-updated-from-v1-x-x-to-v2-0-1', 'updated', 'yes'),
(169, 'slideshow-plugin-updated-from-v2-to-v2-1-20', 'updated', 'yes'),
(170, 'slideshow-jquery-image-gallery-updated-from-v2-1-20-to-v2-1-22', 'updated', 'yes'),
(171, 'slideshow-jquery-image-gallery-updated-from-v2-1-20-to-v2-1-23', 'updated', 'yes'),
(172, 'slideshow-jquery-image-gallery-updated-from-v2-1-23-to-v2-2-0', 'updated', 'yes'),
(173, 'slideshow-jquery-image-gallery-updated-from-v2-2-0-to-v2-2-8', 'updated', 'yes'),
(174, 'slideshow-jquery-image-gallery-updated-from-v2-2-8-to-v2-2-12', 'updated', 'yes'),
(175, 'slideshow-jquery-image-gallery-updated-from-v2-2-12-to-v2-2-16', 'updated', 'yes'),
(176, 'slideshow-jquery-image-gallery-updated-from-v2-2-16-to-v2-2-17', 'updated', 'yes'),
(177, 'slideshow-jquery-image-gallery-updated-from-v2-2-17-to-v2-2-20', 'updated', 'yes'),
(178, 'slideshow-jquery-image-gallery-plugin-version', '2.2.21', 'yes'),
(179, 'social_articles_options', 'a:6:{s:13:"post_per_page";s:2:"10";s:14:"excerpt_length";s:2:"30";s:8:"workflow";s:8:"approval";s:16:"bp_notifications";s:4:"true";s:20:"allow_author_adition";s:4:"true";s:21:"allow_author_deletion";s:4:"true";}', 'yes'),
(181, 'wsl_database_migration_version', '4', 'yes'),
(182, 'wsl_components_core_enabled', '1', 'yes'),
(183, 'wsl_components_networks_enabled', '1', 'yes'),
(184, 'wsl_components_login-widget_enabled', '1', 'yes'),
(185, 'wsl_components_bouncer_enabled', '1', 'yes'),
(186, 'wsl_components_diagnostics_enabled', '1', 'yes'),
(187, 'wsl_settings_welcome_panel_enabled', '', 'yes'),
(188, 'wsl_settings_redirect_url', 'http://pwc-int.educacio.intranet/agora/masterpri', 'yes'),
(189, 'wsl_settings_connect_with_label', 'Connect with:', 'yes'),
(190, 'wsl_settings_use_popup', '2', 'yes'),
(191, 'wsl_settings_widget_display', '1', 'yes'),
(192, 'wsl_settings_authentication_widget_css', '#wp-social-login-connect-with {font-weight: bold;}\n#wp-social-login-connect-options {padding:10px;}\n#wp-social-login-connect-options a {text-decoration: none;}\n#wp-social-login-connect-options img {border:0 none;}\n.wsl_connect_with_provider {}', 'yes'),
(193, 'wsl_settings_bouncer_registration_enabled', '1', 'yes'),
(194, 'wsl_settings_bouncer_authentication_enabled', '1', 'yes'),
(195, 'wsl_settings_bouncer_linking_accounts_enabled', '2', 'yes'),
(196, 'wsl_settings_bouncer_profile_completion_require_email', '2', 'yes'),
(197, 'wsl_settings_bouncer_profile_completion_change_email', '2', 'yes'),
(198, 'wsl_settings_bouncer_profile_completion_change_username', '2', 'yes'),
(199, 'wsl_settings_bouncer_profile_completion_text_notice', 'Almost there, we just need to check a couple of things', 'yes'),
(200, 'wsl_settings_bouncer_profile_completion_text_submit_button', 'Continue', 'yes'),
(201, 'wsl_settings_bouncer_profile_completion_text_email', 'E-mail', 'yes'),
(202, 'wsl_settings_bouncer_profile_completion_text_username', 'Username', 'yes'),
(203, 'wsl_settings_bouncer_profile_completion_text_email_invalid', 'E-mail is not valid!', 'yes'),
(204, 'wsl_settings_bouncer_profile_completion_text_username_invalid', 'Username is not valid!', 'yes'),
(205, 'wsl_settings_bouncer_profile_completion_text_email_exists', 'That E-mail is already registered!', 'yes'),
(206, 'wsl_settings_bouncer_profile_completion_text_username_exists', 'That Username is already registered!', 'yes'),
(207, 'wsl_settings_bouncer_profile_completion_text_connected_with', 'You are now connected via', 'yes'),
(208, 'wsl_settings_bouncer_new_users_moderation_level', '1', 'yes'),
(209, 'wsl_settings_bouncer_new_users_membership_default_role', 'default', 'yes'),
(210, 'wsl_settings_bouncer_new_users_restrict_domain_enabled', '2', 'yes'),
(211, 'wsl_settings_bouncer_new_users_restrict_domain_text_bounce', 'Bouncer says no.', 'yes'),
(212, 'wsl_settings_bouncer_new_users_restrict_email_enabled', '2', 'yes'),
(213, 'wsl_settings_bouncer_new_users_restrict_email_text_bounce', 'Bouncer say he refuses.', 'yes'),
(214, 'wsl_settings_bouncer_new_users_restrict_profile_enabled', '2', 'yes'),
(215, 'wsl_settings_bouncer_new_users_restrict_profile_text_bounce', 'Bouncer say only Mundo can go where he pleases!', 'yes'),
(216, 'wsl_settings_contacts_import_facebook', '2', 'yes'),
(217, 'wsl_settings_contacts_import_google', '2', 'yes'),
(218, 'wsl_settings_contacts_import_twitter', '2', 'yes'),
(219, 'wsl_settings_contacts_import_live', '2', 'yes'),
(220, 'wsl_settings_contacts_import_linkedin', '2', 'yes'),
(221, 'wsl_settings_Google_enabled', '0', 'yes'),
(222, 'wsl_settings_Moodle_enabled', '0', 'yes'),
(224, 'xtec_mail_idapp', 'AGORA', 'yes'),
(225, 'xtec_mail_replyto', 'agora-noreply@xtec.cat', 'yes'),
(226, 'xtec_mail_sender', 'educacio', 'yes'),
(227, 'xtec_mail_log', '0', 'yes'),
(228, 'xtec_mail_debug', '0', 'yes'),
(229, 'xtec_mail_logpath', '', 'yes'),
(233, 'current_theme', 'NODES', 'yes'),
(234, 'theme_mods_reactor-primaria-1', 'a:2:{i:0;b:0;s:18:"nav_menu_locations";a:1:{s:9:"main-menu";i:6;}}', 'yes'),
(235, 'theme_switched', '', 'yes'),
(237, 'widget_pages', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(238, 'widget_calendar', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(239, 'widget_tag_cloud', 'a:3:{i:1;a:0:{}i:2;a:3:{s:5:"title";s:0:"";s:8:"taxonomy";s:8:"post_tag";s:10:"conditions";a:2:{s:6:"action";s:4:"show";s:5:"rules";a:1:{i:0;a:2:{s:5:"major";s:4:"page";s:5:"minor";s:14:"post_type-post";}}}}s:12:"_multiwidget";i:1;}', 'yes'),
(240, 'widget_nav_menu', 'a:4:{i:1;a:0:{}i:2;a:3:{s:5:"title";s:15:"Blogs de classe";s:8:"nav_menu";i:2;s:10:"conditions";a:2:{s:6:"action";s:4:"show";s:5:"rules";a:1:{i:0;a:2:{s:5:"major";s:8:"category";s:5:"minor";s:1:"2";}}}}i:3;a:3:{s:5:"title";s:15:"Blogs de classe";s:8:"nav_menu";i:5;s:10:"conditions";a:2:{s:6:"action";s:4:"show";s:5:"rules";a:1:{i:0;a:2:{s:5:"major";s:8:"category";s:5:"minor";s:1:"5";}}}}s:12:"_multiwidget";i:1;}', 'yes'),
(241, 'widget_bbp_login_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(242, 'widget_bbp_views_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(243, 'widget_bbp_search_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(244, 'widget_bbp_forums_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(245, 'widget_bbp_topics_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(246, 'widget_bbp_replies_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(247, 'widget_bbp_stats_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(248, 'widget_gce_widget', 'a:3:{i:1;a:0:{}i:2;a:12:{s:5:"title";s:0:"";s:2:"id";s:3:"145";s:12:"display_type";s:4:"grid";s:10:"max_events";i:0;s:5:"order";s:3:"asc";s:13:"display_title";b:0;s:18:"display_title_text";s:17:"Esdeveniments del";s:6:"paging";i:1;s:12:"list_max_num";s:1:"7";s:15:"list_max_length";s:4:"days";s:21:"list_start_offset_num";s:1:"0";s:27:"list_start_offset_direction";s:4:"back";}s:12:"_multiwidget";i:1;}', 'yes'),
(249, 'widget_slideshowwidget', 'a:3:{i:1;a:0:{}i:2;a:3:{s:5:"title";s:9:"Destacats";s:11:"slideshowId";s:3:"140";s:10:"conditions";a:2:{s:6:"action";s:4:"show";s:5:"rules";a:3:{i:0;a:2:{s:5:"major";s:4:"page";s:5:"minor";s:1:"5";}i:1;a:2:{s:5:"major";s:4:"page";s:5:"minor";s:1:"6";}i:2;a:2:{s:5:"major";s:4:"page";s:5:"minor";s:3:"141";}}}}s:12:"_multiwidget";i:1;}', 'yes'),
(250, 'widget_invite-anyone-widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(251, 'widget_xtec_widget', 'a:4:{i:1;a:0:{}i:2;a:21:{s:5:"title";s:0:"";s:11:"ensenyament";s:2:"on";s:4:"xtec";s:2:"on";s:6:"edu365";s:2:"on";s:4:"edu3";s:2:"on";s:12:"xarxa-docent";s:0:"";s:10:"alexandria";s:0:"";s:6:"linkat";s:0:"";s:5:"jclic";s:0:"";s:5:"merli";s:0:"";s:3:"arc";s:0:"";s:7:"odissea";s:0:"";s:4:"ampa";s:0:"";s:12:"escola-verda";s:0:"";s:4:"atri";s:0:"";s:4:"saga";s:0:"";s:14:"familia-escola";s:0:"";s:15:"internet-segura";s:0:"";s:6:"moodle";s:0:"";s:8:"ampa_url";s:53:"http://pwc-int.educacio.intranet/agora/masterpri/ampa";s:16:"escola-verda_url";s:127:"http://mediambient.gencat.cat/ca/05_ambits_dactuacio/educacio_i_sostenibilitat/educacio_per_a_la_sostenibilitat/escoles_verdes/";}i:3;a:13:{s:5:"title";s:19:"Enllaços educatius";s:11:"ensenyament";s:2:"on";s:4:"xtec";s:2:"on";s:6:"edu365";s:2:"on";s:4:"edu3";s:2:"on";s:12:"xarxa-docent";s:0:"";s:10:"alexandria";s:0:"";s:6:"linkat";s:0:"";s:5:"jclic";s:0:"";s:5:"merli";s:0:"";s:4:"atri";s:0:"";s:4:"saga";s:0:"";s:15:"internet-segura";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(252, 'widget_logo_centre_widget', 'a:4:{i:1;a:0:{}i:2;a:1:{s:5:"title";s:0:"";}i:3;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(253, 'reactor_options', 'a:22:{s:15:"tamany_font_nom";s:5:"2.5vw";s:16:"imatge_capcalera";s:0:"";s:8:"carrusel";s:3:"103";s:10:"logo_image";s:96:"http://pwc-int.educacio.intranet/agora/masterpri/wp-content/uploads/usu6/2014/09/logo-escola.png";s:16:"nomCanonicCentre";s:18:"Escola Josep Arany";s:14:"direccioCentre";s:21:"Plaça de la Vila, 14";s:8:"cpCentre";s:21:"01234 Abella de Xerta";s:9:"telCentre";s:10:"12 345 678";s:10:"googleMaps";s:25:"https://goo.gl/maps/GTGDy";s:11:"emailCentre";s:64:"http://pwc-int.educacio.intranet/agora/masterpri/lescola/on-som/";s:13:"paleta_colors";s:12:"taronja-verd";s:14:"frontpage_page";s:1:"9";s:23:"frontpage_post_category";s:1:"4";s:16:"frontpage_layout";s:4:"2c-l";s:26:"frontpage_posts_per_fila_1";s:2:"33";s:26:"frontpage_posts_per_fila_2";s:1:"2";s:26:"frontpage_posts_per_fila_n";s:1:"2";s:22:"frontpage_number_posts";s:2:"20";s:21:"frontpage_link_titles";b:1;s:13:"post_readmore";s:13:"Llegir més»";s:13:"favicon_image";s:0:"";s:11:"logo_inline";b:1;}', 'yes'),
(254, 'icones_capcalera', '', 'yes'),
(281, 'tadv_settings', 'a:6:{s:7:"options";s:15:"menubar,advlist";s:9:"toolbar_1";s:117:"bold,italic,blockquote,bullist,numlist,alignleft,aligncenter,alignright,link,unlink,table,fullscreen,undo,redo,wp_adv";s:9:"toolbar_2";s:121:"formatselect,alignjustify,strikethrough,outdent,indent,pastetext,removeformat,charmap,wp_more,emoticons,forecolor,wp_help";s:9:"toolbar_3";s:0:"";s:9:"toolbar_4";s:0:"";s:7:"plugins";s:107:"anchor,code,insertdatetime,nonbreaking,print,searchreplace,table,visualblocks,visualchars,emoticons,advlist";}', 'yes'),
(282, 'tadv_admin_settings', 'a:1:{s:7:"options";a:0:{}}', 'yes'),
(283, 'tadv_version', '4000', 'yes'),
(306, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(312, 'category_8', 'a:1:{s:13:"articles_fila";s:0:"";}', 'yes'),
(367, 'my_option_name', 'a:13:{s:6:"icon11";s:14:"format-gallery";s:11:"link_icon11";s:110:"https://picasaweb.google.com/104252377742684144682/ExempleDeGaleriaDeFotosDeLEscola?authuser=0&feat=directlink";s:12:"title_icon11";s:5:"FOTOS";s:6:"icon12";s:6:"groups";s:11:"link_icon12";s:64:"http://pwc-int.educacio.intranet/agora/masterpri/categoria/ampa/";s:12:"title_icon12";s:4:"AMPA";s:6:"icon21";s:6:"carrot";s:11:"link_icon21";s:74:"http://pwc-int.educacio.intranet/agora/masterpri/serveis/menjador-escolar/";s:12:"title_icon21";s:8:"MENJADOR";s:6:"icon22";s:11:"format-chat";s:11:"link_icon22";s:58:"http://pwc-int.educacio.intranet/agora/masterpri/activitat";s:12:"title_icon22";s:5:"NODES";s:14:"show_text_icon";N;}', 'yes'),
(443, '_transient_bp_active_member_count', '2', 'yes'),
(446, 'bpfb', 'a:5:{s:5:"theme";s:3:"new";s:9:"alignment";s:4:"left";s:12:"oembed_width";i:450;s:20:"thumbnail_size_width";i:450;s:21:"thumbnail_size_height";i:450;}', 'yes'),
(458, 'bphelp-my-redirect-slug', 'wp-login.php', 'yes'),
(595, 'widget_bp_core_friends_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(619, 'gce_settings_general', 'a:1:{s:13:"save_settings";i:1;}', 'yes'),
(622, 'gce_cpt_setup', '1', 'yes'),
(671, 'ga_version', '6.4.7.3', 'yes'),
(672, 'ga_status', 'disabled', 'yes'),
(673, 'ga_disable_gasites', 'disabled', 'yes'),
(674, 'ga_analytic_snippet', 'enabled', 'yes'),
(675, 'ga_uid', 'UA-XXXXXXXX-X', 'yes'),
(676, 'ga_admin_status', 'enabled', 'yes'),
(677, 'ga_admin_disable_DimentionIndex', '', 'yes'),
(678, 'ga_admin_disable', 'remove', 'yes'),
(679, 'ga_admin_role', 'a:1:{i:0;s:13:"administrator";}', 'yes'),
(680, 'ga_dashboard_role', 'a:1:{i:0;s:13:"administrator";}', 'yes'),
(681, 'key_ga_show_ad', '1', 'yes'),
(682, 'ga_adsense', '', 'yes'),
(683, 'ga_extra', '', 'yes'),
(684, 'ga_extra_after', '', 'yes'),
(685, 'ga_event', 'enabled', 'yes'),
(686, 'ga_outbound', 'enabled', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(687, 'ga_outbound_prefix', 'outgoing', 'yes'),
(688, 'ga_enhanced_link_attr', 'disabled', 'yes'),
(689, 'ga_downloads', '', 'yes'),
(690, 'ga_downloads_prefix', 'download', 'yes'),
(691, 'ga_widgets', 'enabled', 'yes'),
(692, 'ga_annon', '', 'yes'),
(693, 'ga_defaults', 'yes', 'yes'),
(694, 'ga_google_token', '', 'yes'),
(777, 'widget_socialmedia_widget', 'a:3:{i:1;a:0:{}i:2;a:21:{s:5:"title";s:12:"Segueix-nos!";s:4:"mida";s:7:"fa-2-5x";s:11:"twitter_url";s:20:"twitter de la escola";s:12:"facebook_url";s:21:"facebook de la escola";s:15:"google-plus_url";s:0:"";s:11:"youtube_url";s:20:"youtube de la escola";s:9:"vimeo_url";s:0:"";s:10:"picasa_url";s:0:"";s:10:"flickr_url";s:0:"";s:13:"pinterest_url";s:0:"";s:13:"instagram_url";s:0:"";s:10:"tumblr_url";s:0:"";s:14:"soundcloud_url";s:0:"";s:11:"dropbox_url";s:0:"";s:7:"rss_url";s:53:"http://pwc-int.educacio.intranet/agora/masterpri/feed";s:9:"email_url";s:0:"";s:10:"moodle_url";s:0:"";s:14:"xarxanodes_url";s:58:"http://pwc-int.educacio.intranet/agora/masterpri/activitat";s:8:"docs_url";s:0:"";s:9:"fotos_url";s:0:"";s:9:"video_url";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(787, 'category_10', 'a:1:{s:13:"articles_fila";s:0:"";}', 'yes'),
(791, 'category_11', 'a:1:{s:13:"articles_fila";s:0:"";}', 'yes'),
(792, 'category_children', 'a:2:{i:2;a:3:{i:0;i:3;i:1;i:8;i:2;i:9;}i:5;a:6:{i:0;i:10;i:1;i:11;i:2;i:12;i:3;i:13;i:4;i:14;i:5;i:15;}}', 'yes'),
(793, 'category_12', 'a:1:{s:13:"articles_fila";s:0:"";}', 'yes'),
(823, 'gce_upgrade_has_run', '1', 'yes'),
(837, '_transient_random_seed', '846b6d4bdc9741c6ecf2c96be9ea5ade', 'yes'),
(840, 'WPLANG', 'ca', 'yes'),
(841, 'db_upgraded', '', 'yes'),
(842, 'rewrite_rules', 'a:232:{s:14:"docs/create/?$";s:52:"index.php?post_type=bp_doc&name=$matches[1]&create=1";s:17:"docs/my-groups/?$";s:55:"index.php?post_type=bp_doc&name=$matches[1]&my-groups=1";s:20:"docs/([^/]+)/edit/?$";s:50:"index.php?post_type=bp_doc&name=$matches[1]&edit=1";s:23:"docs/([^/]+)/history/?$";s:53:"index.php?post_type=bp_doc&name=$matches[1]&history=1";s:22:"docs/([^/]+)/delete/?$";s:53:"index.php?post_type=bp_doc&name=$matches[1]&history=1";s:23:"docs/([^/]+)/untrash/?$";s:53:"index.php?post_type=bp_doc&name=$matches[1]&untrash=1";s:9:"forums/?$";s:25:"index.php?post_type=forum";s:39:"forums/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?post_type=forum&feed=$matches[1]";s:34:"forums/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?post_type=forum&feed=$matches[1]";s:26:"forums/page/([0-9]{1,})/?$";s:43:"index.php?post_type=forum&paged=$matches[1]";s:9:"topics/?$";s:25:"index.php?post_type=topic";s:39:"topics/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?post_type=topic&feed=$matches[1]";s:34:"topics/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?post_type=topic&feed=$matches[1]";s:26:"topics/page/([0-9]{1,})/?$";s:43:"index.php?post_type=topic&paged=$matches[1]";s:28:"forums/forum/([^/]+)/edit/?$";s:34:"index.php?forum=$matches[1]&edit=1";s:28:"forums/topic/([^/]+)/edit/?$";s:34:"index.php?topic=$matches[1]&edit=1";s:28:"forums/reply/([^/]+)/edit/?$";s:34:"index.php?reply=$matches[1]&edit=1";s:32:"forums/topic-tag/([^/]+)/edit/?$";s:38:"index.php?topic-tag=$matches[1]&edit=1";s:47:"forums/user/([^/]+)/topics/page/?([0-9]{1,})/?$";s:59:"index.php?bbp_user=$matches[1]&bbp_tops=1&paged=$matches[2]";s:48:"forums/user/([^/]+)/replies/page/?([0-9]{1,})/?$";s:59:"index.php?bbp_user=$matches[1]&bbp_reps=1&paged=$matches[2]";s:50:"forums/user/([^/]+)/favorites/page/?([0-9]{1,})/?$";s:59:"index.php?bbp_user=$matches[1]&bbp_favs=1&paged=$matches[2]";s:54:"forums/user/([^/]+)/subscriptions/page/?([0-9]{1,})/?$";s:59:"index.php?bbp_user=$matches[1]&bbp_subs=1&paged=$matches[2]";s:29:"forums/user/([^/]+)/topics/?$";s:41:"index.php?bbp_user=$matches[1]&bbp_tops=1";s:30:"forums/user/([^/]+)/replies/?$";s:41:"index.php?bbp_user=$matches[1]&bbp_reps=1";s:32:"forums/user/([^/]+)/favorites/?$";s:41:"index.php?bbp_user=$matches[1]&bbp_favs=1";s:36:"forums/user/([^/]+)/subscriptions/?$";s:41:"index.php?bbp_user=$matches[1]&bbp_subs=1";s:27:"forums/user/([^/]+)/edit/?$";s:37:"index.php?bbp_user=$matches[1]&edit=1";s:22:"forums/user/([^/]+)/?$";s:30:"index.php?bbp_user=$matches[1]";s:40:"forums/view/([^/]+)/page/?([0-9]{1,})/?$";s:48:"index.php?bbp_view=$matches[1]&paged=$matches[2]";s:27:"forums/view/([^/]+)/feed/?$";s:47:"index.php?bbp_view=$matches[1]&feed=$matches[2]";s:22:"forums/view/([^/]+)/?$";s:30:"index.php?bbp_view=$matches[1]";s:34:"forums/search/page/?([0-9]{1,})/?$";s:27:"index.php?paged=$matches[1]";s:16:"forums/search/?$";s:20:"index.php?bbp_search";s:7:"docs/?$";s:26:"index.php?post_type=bp_doc";s:37:"docs/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?post_type=bp_doc&feed=$matches[1]";s:32:"docs/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?post_type=bp_doc&feed=$matches[1]";s:24:"docs/page/([0-9]{1,})/?$";s:44:"index.php?post_type=bp_doc&paged=$matches[1]";s:12:"slideshow/?$";s:29:"index.php?post_type=slideshow";s:42:"slideshow/feed/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?post_type=slideshow&feed=$matches[1]";s:37:"slideshow/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?post_type=slideshow&feed=$matches[1]";s:29:"slideshow/page/([0-9]{1,})/?$";s:47:"index.php?post_type=slideshow&paged=$matches[1]";s:48:"categoria/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:43:"categoria/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:36:"categoria/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:18:"categoria/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:38:"forums/forum/.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:48:"forums/forum/.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:68:"forums/forum/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:63:"forums/forum/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:63:"forums/forum/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:31:"forums/forum/(.+?)/trackback/?$";s:32:"index.php?forum=$matches[1]&tb=1";s:51:"forums/forum/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?forum=$matches[1]&feed=$matches[2]";s:46:"forums/forum/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?forum=$matches[1]&feed=$matches[2]";s:39:"forums/forum/(.+?)/page/?([0-9]{1,})/?$";s:45:"index.php?forum=$matches[1]&paged=$matches[2]";s:46:"forums/forum/(.+?)/comment-page-([0-9]{1,})/?$";s:45:"index.php?forum=$matches[1]&cpage=$matches[2]";s:31:"forums/forum/(.+?)(/[0-9]+)?/?$";s:44:"index.php?forum=$matches[1]&page=$matches[2]";s:40:"forums/topic/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:50:"forums/topic/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:70:"forums/topic/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"forums/topic/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"forums/topic/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"forums/topic/([^/]+)/trackback/?$";s:32:"index.php?topic=$matches[1]&tb=1";s:53:"forums/topic/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?topic=$matches[1]&feed=$matches[2]";s:48:"forums/topic/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?topic=$matches[1]&feed=$matches[2]";s:41:"forums/topic/([^/]+)/page/?([0-9]{1,})/?$";s:45:"index.php?topic=$matches[1]&paged=$matches[2]";s:48:"forums/topic/([^/]+)/comment-page-([0-9]{1,})/?$";s:45:"index.php?topic=$matches[1]&cpage=$matches[2]";s:33:"forums/topic/([^/]+)(/[0-9]+)?/?$";s:44:"index.php?topic=$matches[1]&page=$matches[2]";s:29:"forums/topic/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:39:"forums/topic/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:59:"forums/topic/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"forums/topic/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"forums/topic/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:40:"forums/reply/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:50:"forums/reply/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:70:"forums/reply/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"forums/reply/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"forums/reply/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"forums/reply/([^/]+)/trackback/?$";s:32:"index.php?reply=$matches[1]&tb=1";s:41:"forums/reply/([^/]+)/page/?([0-9]{1,})/?$";s:45:"index.php?reply=$matches[1]&paged=$matches[2]";s:48:"forums/reply/([^/]+)/comment-page-([0-9]{1,})/?$";s:45:"index.php?reply=$matches[1]&cpage=$matches[2]";s:33:"forums/reply/([^/]+)(/[0-9]+)?/?$";s:44:"index.php?reply=$matches[1]&page=$matches[2]";s:29:"forums/reply/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:39:"forums/reply/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:59:"forums/reply/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"forums/reply/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"forums/reply/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:57:"forums/topic-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:48:"index.php?topic-tag=$matches[1]&feed=$matches[2]";s:52:"forums/topic-tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:48:"index.php?topic-tag=$matches[1]&feed=$matches[2]";s:45:"forums/topic-tag/([^/]+)/page/?([0-9]{1,})/?$";s:49:"index.php?topic-tag=$matches[1]&paged=$matches[2]";s:27:"forums/topic-tag/([^/]+)/?$";s:31:"index.php?topic-tag=$matches[1]";s:42:"forums/search/([^/]+)/page/?([0-9]{1,})/?$";s:50:"index.php?bbp_search=$matches[1]&paged=$matches[2]";s:24:"forums/search/([^/]+)/?$";s:32:"index.php?bbp_search=$matches[1]";s:38:"ia_invites/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:48:"ia_invites/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:68:"ia_invites/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:63:"ia_invites/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:63:"ia_invites/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:31:"ia_invites/([^/]+)/trackback/?$";s:37:"index.php?ia_invites=$matches[1]&tb=1";s:39:"ia_invites/([^/]+)/page/?([0-9]{1,})/?$";s:50:"index.php?ia_invites=$matches[1]&paged=$matches[2]";s:46:"ia_invites/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?ia_invites=$matches[1]&cpage=$matches[2]";s:31:"ia_invites/([^/]+)(/[0-9]+)?/?$";s:49:"index.php?ia_invites=$matches[1]&page=$matches[2]";s:27:"ia_invites/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"ia_invites/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"ia_invites/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"ia_invites/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"ia_invites/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:52:"ia_invitees/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?ia_invitees=$matches[1]&feed=$matches[2]";s:47:"ia_invitees/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?ia_invitees=$matches[1]&feed=$matches[2]";s:40:"ia_invitees/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?ia_invitees=$matches[1]&paged=$matches[2]";s:22:"ia_invitees/([^/]+)/?$";s:33:"index.php?ia_invitees=$matches[1]";s:58:"ia_invited_groups/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:56:"index.php?ia_invited_groups=$matches[1]&feed=$matches[2]";s:53:"ia_invited_groups/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:56:"index.php?ia_invited_groups=$matches[1]&feed=$matches[2]";s:46:"ia_invited_groups/([^/]+)/page/?([0-9]{1,})/?$";s:57:"index.php?ia_invited_groups=$matches[1]&paged=$matches[2]";s:28:"ia_invited_groups/([^/]+)/?$";s:39:"index.php?ia_invited_groups=$matches[1]";s:30:"docs/.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:40:"docs/.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:60:"docs/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:55:"docs/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:55:"docs/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:23:"docs/(.+?)/trackback/?$";s:33:"index.php?bp_doc=$matches[1]&tb=1";s:43:"docs/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:45:"index.php?bp_doc=$matches[1]&feed=$matches[2]";s:38:"docs/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:45:"index.php?bp_doc=$matches[1]&feed=$matches[2]";s:31:"docs/(.+?)/page/?([0-9]{1,})/?$";s:46:"index.php?bp_doc=$matches[1]&paged=$matches[2]";s:38:"docs/(.+?)/comment-page-([0-9]{1,})/?$";s:46:"index.php?bp_doc=$matches[1]&cpage=$matches[2]";s:23:"docs/(.+?)(/[0-9]+)?/?$";s:45:"index.php?bp_doc=$matches[1]&page=$matches[2]";s:45:"item/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?bp_docs_tag=$matches[1]&feed=$matches[2]";s:40:"item/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?bp_docs_tag=$matches[1]&feed=$matches[2]";s:33:"item/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?bp_docs_tag=$matches[1]&paged=$matches[2]";s:15:"item/([^/]+)/?$";s:33:"index.php?bp_docs_tag=$matches[1]";s:55:"bp_docs_access/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:67:"index.php?taxonomy=bp_docs_access&term=$matches[1]&feed=$matches[2]";s:50:"bp_docs_access/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:67:"index.php?taxonomy=bp_docs_access&term=$matches[1]&feed=$matches[2]";s:43:"bp_docs_access/([^/]+)/page/?([0-9]{1,})/?$";s:68:"index.php?taxonomy=bp_docs_access&term=$matches[1]&paged=$matches[2]";s:25:"bp_docs_access/([^/]+)/?$";s:50:"index.php?taxonomy=bp_docs_access&term=$matches[1]";s:37:"slideshow/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:47:"slideshow/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:67:"slideshow/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"slideshow/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"slideshow/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"slideshow/([^/]+)/trackback/?$";s:36:"index.php?slideshow=$matches[1]&tb=1";s:50:"slideshow/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:48:"index.php?slideshow=$matches[1]&feed=$matches[2]";s:45:"slideshow/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:48:"index.php?slideshow=$matches[1]&feed=$matches[2]";s:38:"slideshow/([^/]+)/page/?([0-9]{1,})/?$";s:49:"index.php?slideshow=$matches[1]&paged=$matches[2]";s:45:"slideshow/([^/]+)/comment-page-([0-9]{1,})/?$";s:49:"index.php?slideshow=$matches[1]&cpage=$matches[2]";s:30:"slideshow/([^/]+)(/[0-9]+)?/?$";s:48:"index.php?slideshow=$matches[1]&page=$matches[2]";s:26:"slideshow/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:36:"slideshow/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:56:"slideshow/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"slideshow/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"slideshow/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:36:"gce_feed/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:46:"gce_feed/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:66:"gce_feed/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"gce_feed/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"gce_feed/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:29:"gce_feed/([^/]+)/trackback/?$";s:35:"index.php?gce_feed=$matches[1]&tb=1";s:37:"gce_feed/([^/]+)/page/?([0-9]{1,})/?$";s:48:"index.php?gce_feed=$matches[1]&paged=$matches[2]";s:44:"gce_feed/([^/]+)/comment-page-([0-9]{1,})/?$";s:48:"index.php?gce_feed=$matches[1]&cpage=$matches[2]";s:29:"gce_feed/([^/]+)(/[0-9]+)?/?$";s:47:"index.php?gce_feed=$matches[1]&page=$matches[2]";s:25:"gce_feed/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:35:"gce_feed/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:55:"gce_feed/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:50:"gce_feed/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:50:"gce_feed/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:27:"comment-page-([0-9]{1,})/?$";s:38:"index.php?&page_id=9&cpage=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:31:".+?/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:41:".+?/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:61:".+?/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:".+?/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:".+?/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:26:"(.+?)/([^/]+)/trackback/?$";s:57:"index.php?category_name=$matches[1]&name=$matches[2]&tb=1";s:46:"(.+?)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:69:"index.php?category_name=$matches[1]&name=$matches[2]&feed=$matches[3]";s:41:"(.+?)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:69:"index.php?category_name=$matches[1]&name=$matches[2]&feed=$matches[3]";s:34:"(.+?)/([^/]+)/page/?([0-9]{1,})/?$";s:70:"index.php?category_name=$matches[1]&name=$matches[2]&paged=$matches[3]";s:41:"(.+?)/([^/]+)/comment-page-([0-9]{1,})/?$";s:70:"index.php?category_name=$matches[1]&name=$matches[2]&cpage=$matches[3]";s:26:"(.+?)/([^/]+)(/[0-9]+)?/?$";s:69:"index.php?category_name=$matches[1]&name=$matches[2]&page=$matches[3]";s:20:".+?/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:30:".+?/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:50:".+?/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:45:".+?/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:45:".+?/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:38:"(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:33:"(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:26:"(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:33:"(.+?)/comment-page-([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&cpage=$matches[2]";s:8:"(.+?)/?$";s:35:"index.php?category_name=$matches[1]";}', 'yes'),
(843, 'wsl_settings_Google_app_scope', 'profile https://www.googleapis.com/auth/plus.profile.emails.read', 'yes'),
(845, 'can_compress_scripts', '1', 'yes'),
(846, '_transient_timeout_plugin_slugs', '1426769624', 'no'),
(847, '_transient_plugin_slugs', 'a:24:{i:0;s:19:"bbpress/bbpress.php";i:1;s:42:"bbpress-enable-tinymce-visual-tab/init.php";i:2;s:37:"blogger-importer/blogger-importer.php";i:3;s:24:"buddypress/bp-loader.php";i:4;s:33:"buddypress-activity-plus/bpfb.php";i:5;s:26:"buddypress-docs/loader.php";i:6;s:64:"buddypress-group-email-subscription/bp-activity-subscription.php";i:7;s:34:"buddypress-like/bp-like-loader.php";i:8;s:29:"bp-moderation/bpModLoader.php";i:9;s:43:"google-analyticator/google-analyticator.php";i:10;s:49:"google-calendar-events/google-calendar-events.php";i:11;s:27:"grup-classe/grup_classe.php";i:12;s:31:"invite-anyone/invite-anyone.php";i:13;s:69:"pending-submission-notifications/pending-submission-notifications.php";i:14;s:27:"private-bp-pages/loader.php";i:15;s:21:"raw-html/raw_html.php";i:16;s:25:"slideshare/slideshare.php";i:17;s:44:"slideshow-jquery-image-gallery/slideshow.php";i:18;s:35:"social-articles/social-articles.php";i:19;s:37:"tinymce-advanced/tinymce-advanced.php";i:20;s:71:"widget-visibility-without-jetpack/widget-visibility-without-jetpack.php";i:21;s:41:"wordpress-importer/wordpress-importer.php";i:22;s:42:"wordpress-social-login/wp-social-login.php";i:23;s:23:"xtec-mail/xtec-mail.php";}', 'no'),
(848, 'widget_grup_classe_widget', 'a:10:{i:2;a:12:{s:5:"title";s:13:"El blog de P3";s:12:"id_calendari";s:3:"145";s:13:"nom_calendari";s:6:"Agenda";s:14:"calendari_grid";b:1;s:14:"calendari_list";b:0;s:9:"nom_tutor";s:15:"Nom del tutor/a";s:11:"email_tutor";s:19:"tutor.p3@escola.cat";s:15:"horari_families";s:15:"dl. 00:00-00:00";s:8:"nav_menu";s:2:"20";s:9:"text_open";s:106:"<img src=http://pwc-int.educacio.intranet/agora/masterpri/wp-content/uploads/usu6/2015/01/foto-classe.png>";s:10:"text_close";s:71:"Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum";s:10:"conditions";a:2:{s:6:"action";s:4:"show";s:5:"rules";a:1:{i:0;a:2:{s:5:"major";s:8:"category";s:5:"minor";s:1:"3";}}}}i:3;a:12:{s:5:"title";s:13:"El blog de P4";s:12:"id_calendari";s:3:"145";s:13:"nom_calendari";s:6:"Agenda";s:14:"calendari_grid";b:1;s:14:"calendari_list";b:0;s:9:"nom_tutor";s:15:"Nom del tutor/a";s:11:"email_tutor";s:19:"tutor.p4@escola.cat";s:15:"horari_families";s:15:"dl. 00:00-00:00";s:8:"nav_menu";s:2:"20";s:9:"text_open";s:106:"<img src=http://pwc-int.educacio.intranet/agora/masterpri/wp-content/uploads/usu6/2015/01/foto-classe.png>";s:10:"text_close";s:71:"Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum";s:10:"conditions";a:2:{s:6:"action";s:4:"show";s:5:"rules";a:1:{i:0;a:2:{s:5:"major";s:8:"category";s:5:"minor";s:1:"8";}}}}i:4;a:12:{s:5:"title";s:13:"El blog de P5";s:12:"id_calendari";s:3:"145";s:13:"nom_calendari";s:6:"Agenda";s:14:"calendari_grid";b:1;s:14:"calendari_list";b:0;s:9:"nom_tutor";s:15:"Nom del tutor/a";s:11:"email_tutor";s:19:"tutor.p5@escola.cat";s:15:"horari_families";s:15:"dl. 00:00-00:00";s:8:"nav_menu";s:2:"20";s:9:"text_open";s:106:"<img src=http://pwc-int.educacio.intranet/agora/masterpri/wp-content/uploads/usu6/2015/01/foto-classe.png>";s:10:"text_close";s:71:"Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum";s:10:"conditions";a:2:{s:6:"action";s:4:"show";s:5:"rules";a:1:{i:0;a:2:{s:5:"major";s:8:"category";s:5:"minor";s:1:"9";}}}}i:5;a:12:{s:5:"title";s:10:"Blog de 1r";s:12:"id_calendari";s:3:"145";s:13:"nom_calendari";s:6:"Agenda";s:14:"calendari_grid";b:1;s:14:"calendari_list";b:0;s:9:"nom_tutor";s:15:"Nom del tutor/a";s:11:"email_tutor";s:19:"tutor.1r@escola.cat";s:15:"horari_families";s:15:"dl. 00:00-00:00";s:8:"nav_menu";s:2:"20";s:9:"text_open";s:106:"<img src=http://pwc-int.educacio.intranet/agora/masterpri/wp-content/uploads/usu6/2015/01/foto-classe.png>";s:10:"text_close";s:71:"Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum";s:10:"conditions";a:2:{s:6:"action";s:4:"show";s:5:"rules";a:1:{i:0;a:2:{s:5:"major";s:8:"category";s:5:"minor";s:2:"10";}}}}i:6;a:12:{s:5:"title";s:10:"Blog de 2n";s:12:"id_calendari";s:3:"145";s:13:"nom_calendari";s:0:"";s:14:"calendari_grid";b:1;s:14:"calendari_list";b:0;s:9:"nom_tutor";s:15:"Nom del tutor/a";s:11:"email_tutor";s:19:"tutor.2n@escola.cat";s:15:"horari_families";s:15:"dl. 00:00-00:00";s:8:"nav_menu";s:2:"20";s:9:"text_open";s:106:"<img src=http://pwc-int.educacio.intranet/agora/masterpri/wp-content/uploads/usu6/2015/01/foto-classe.png>";s:10:"text_close";s:71:"Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum";s:10:"conditions";a:2:{s:6:"action";s:4:"show";s:5:"rules";a:1:{i:0;a:2:{s:5:"major";s:8:"category";s:5:"minor";s:2:"11";}}}}i:7;a:12:{s:5:"title";s:10:"Blog de 3r";s:12:"id_calendari";s:3:"145";s:13:"nom_calendari";s:6:"Agenda";s:14:"calendari_grid";b:1;s:14:"calendari_list";b:0;s:9:"nom_tutor";s:15:"Nom del tutor/a";s:11:"email_tutor";s:19:"tutor.3r@escola.cat";s:15:"horari_families";s:15:"dl. 00:00-00:00";s:8:"nav_menu";s:2:"20";s:9:"text_open";s:106:"<img src=http://pwc-int.educacio.intranet/agora/masterpri/wp-content/uploads/usu6/2015/01/foto-classe.png>";s:10:"text_close";s:71:"Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum";s:10:"conditions";a:2:{s:6:"action";s:4:"show";s:5:"rules";a:1:{i:0;a:2:{s:5:"major";s:8:"category";s:5:"minor";s:2:"12";}}}}i:8;a:12:{s:5:"title";s:10:"Blog de 4t";s:12:"id_calendari";s:3:"145";s:13:"nom_calendari";s:6:"Agenda";s:14:"calendari_grid";b:1;s:14:"calendari_list";b:0;s:9:"nom_tutor";s:15:"Nom del tutor/a";s:11:"email_tutor";s:19:"tutor.4t@escola.cat";s:15:"horari_families";s:15:"dl. 00:00-00:00";s:8:"nav_menu";s:2:"20";s:9:"text_open";s:106:"<img src=http://pwc-int.educacio.intranet/agora/masterpri/wp-content/uploads/usu6/2015/01/foto-classe.png>";s:10:"text_close";s:71:"Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum";s:10:"conditions";a:2:{s:6:"action";s:4:"show";s:5:"rules";a:1:{i:0;a:2:{s:5:"major";s:8:"category";s:5:"minor";s:2:"13";}}}}i:9;a:12:{s:5:"title";s:11:"Blog de 5è";s:12:"id_calendari";s:3:"145";s:13:"nom_calendari";s:6:"Agenda";s:14:"calendari_grid";b:1;s:14:"calendari_list";b:0;s:9:"nom_tutor";s:15:"Nom del tutor/a";s:11:"email_tutor";s:19:"tutor.5e@escola.cat";s:15:"horari_families";s:15:"dl. 00:00-00:00";s:8:"nav_menu";s:2:"20";s:9:"text_open";s:106:"<img src=http://pwc-int.educacio.intranet/agora/masterpri/wp-content/uploads/usu6/2015/01/foto-classe.png>";s:10:"text_close";s:71:"Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum";s:10:"conditions";a:2:{s:6:"action";s:4:"show";s:5:"rules";a:1:{i:0;a:2:{s:5:"major";s:8:"category";s:5:"minor";s:2:"14";}}}}i:10;a:12:{s:5:"title";s:11:"Blog de 6è";s:12:"id_calendari";s:3:"145";s:13:"nom_calendari";s:6:"Agenda";s:14:"calendari_grid";b:1;s:14:"calendari_list";b:0;s:9:"nom_tutor";s:15:"Nom del tutor/a";s:11:"email_tutor";s:19:"tutor.6e@escola.cat";s:15:"horari_families";s:15:"dl. 00:00-00:00";s:8:"nav_menu";s:2:"20";s:9:"text_open";s:106:"<img src=http://pwc-int.educacio.intranet/agora/masterpri/wp-content/uploads/usu6/2015/01/foto-classe.png>";s:10:"text_close";s:71:"Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum";s:10:"conditions";a:2:{s:6:"action";s:4:"show";s:5:"rules";a:1:{i:0;a:2:{s:5:"major";s:8:"category";s:5:"minor";s:2:"15";}}}}s:12:"_multiwidget";i:1;}', 'yes'),
(857, 'bpfb_plugin', 'a:1:{s:9:"installed";i:1;}', 'yes'),
(930, 'wsl_components_users_enabled', '1', 'yes'),
(957, 'bp_disable_blogforum_comments', '1', 'yes'),
(963, '_site_transient_timeout_browser_900d3a303a783944357dc4c76d55eec2', '1425466555', 'yes'),
(964, '_site_transient_browser_900d3a303a783944357dc4c76d55eec2', 'a:9:{s:8:"platform";s:5:"Linux";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"35.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(1018, '_site_transient_timeout_browser_fb7e73d137e6cd6d4a2ec6775f80507c', '1426696486', 'yes'),
(1019, '_site_transient_browser_fb7e73d137e6cd6d4a2ec6775f80507c', 'a:9:{s:8:"platform";s:5:"Linux";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"36.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(1132, '_site_transient_timeout_browser_62b5acf8b2a2d5b1737dfa3a245f0e81', '1427718535', 'yes'),
(1133, '_site_transient_browser_62b5acf8b2a2d5b1737dfa3a245f0e81', 'a:9:{s:8:"platform";s:5:"Linux";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"40.0.2214.91";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(1140, '_site_transient_timeout_available_translations', '1427124552', 'yes'),
(1141, '_site_transient_available_translations', 'a:41:{s:2:"ar";a:8:{s:8:"language";s:2:"ar";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-04 15:44:04";s:12:"english_name";s:6:"Arabic";s:11:"native_name";s:14:"العربية";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.0/ar.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:2;s:3:"ara";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:2:"az";a:8:{s:8:"language";s:2:"az";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-10-01 13:29:39";s:12:"english_name";s:11:"Azerbaijani";s:11:"native_name";s:16:"Azərbaycan dili";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.0/az.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:2;s:3:"aze";}s:7:"strings";a:1:{s:8:"continue";s:5:"Davam";}}s:5:"bg_BG";a:8:{s:8:"language";s:5:"bg_BG";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-10-08 11:17:50";s:12:"english_name";s:9:"Bulgarian";s:11:"native_name";s:18:"Български";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/bg_BG.zip";s:3:"iso";a:2:{i:1;s:2:"bg";i:2;s:3:"bul";}s:7:"strings";a:1:{s:8:"continue";s:22:"Продължение";}}s:5:"bs_BA";a:8:{s:8:"language";s:5:"bs_BA";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-04 15:47:16";s:12:"english_name";s:7:"Bosnian";s:11:"native_name";s:8:"Bosanski";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/bs_BA.zip";s:3:"iso";a:2:{i:1;s:2:"bs";i:2;s:3:"bos";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:2:"ca";a:8:{s:8:"language";s:2:"ca";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-10-19 13:59:46";s:12:"english_name";s:7:"Catalan";s:11:"native_name";s:7:"Català";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.0/ca.zip";s:3:"iso";a:2:{i:1;s:2:"ca";i:2;s:3:"cat";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"cy";a:8:{s:8:"language";s:2:"cy";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-04 16:43:49";s:12:"english_name";s:5:"Welsh";s:11:"native_name";s:7:"Cymraeg";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.0/cy.zip";s:3:"iso";a:2:{i:1;s:2:"cy";i:2;s:3:"cym";}s:7:"strings";a:1:{s:8:"continue";s:6:"Parhau";}}s:5:"da_DK";a:8:{s:8:"language";s:5:"da_DK";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-10-22 11:59:16";s:12:"english_name";s:6:"Danish";s:11:"native_name";s:5:"Dansk";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/da_DK.zip";s:3:"iso";a:2:{i:1;s:2:"da";i:2;s:3:"dan";}s:7:"strings";a:1:{s:8:"continue";s:12:"Forts&#230;t";}}s:5:"de_DE";a:8:{s:8:"language";s:5:"de_DE";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-10-26 13:41:46";s:12:"english_name";s:6:"German";s:11:"native_name";s:7:"Deutsch";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/de_DE.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:5:"en_AU";a:8:{s:8:"language";s:5:"en_AU";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-06 00:56:37";s:12:"english_name";s:19:"English (Australia)";s:11:"native_name";s:19:"English (Australia)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/en_AU.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_GB";a:8:{s:8:"language";s:5:"en_GB";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-04 08:52:52";s:12:"english_name";s:12:"English (UK)";s:11:"native_name";s:12:"English (UK)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/en_GB.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_CA";a:8:{s:8:"language";s:5:"en_CA";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-05 00:31:07";s:12:"english_name";s:16:"English (Canada)";s:11:"native_name";s:16:"English (Canada)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/en_CA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"es_CL";a:8:{s:8:"language";s:5:"es_CL";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-04 19:47:01";s:12:"english_name";s:15:"Spanish (Chile)";s:11:"native_name";s:17:"Español de Chile";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/es_CL.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_PE";a:8:{s:8:"language";s:5:"es_PE";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-04 07:49:30";s:12:"english_name";s:14:"Spanish (Peru)";s:11:"native_name";s:17:"Español de Perú";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/es_PE.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_ES";a:8:{s:8:"language";s:5:"es_ES";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-04 17:40:25";s:12:"english_name";s:15:"Spanish (Spain)";s:11:"native_name";s:8:"Español";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/es_ES.zip";s:3:"iso";a:1:{i:1;s:2:"es";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:2:"eu";a:8:{s:8:"language";s:2:"eu";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-05 06:55:23";s:12:"english_name";s:6:"Basque";s:11:"native_name";s:7:"Euskara";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.0/eu.zip";s:3:"iso";a:2:{i:1;s:2:"eu";i:2;s:3:"eus";}s:7:"strings";a:1:{s:8:"continue";s:8:"Jarraitu";}}s:5:"fa_IR";a:8:{s:8:"language";s:5:"fa_IR";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-05 15:58:20";s:12:"english_name";s:7:"Persian";s:11:"native_name";s:10:"فارسی";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/fa_IR.zip";s:3:"iso";a:2:{i:1;s:2:"fa";i:2;s:3:"fas";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:2:"fi";a:8:{s:8:"language";s:2:"fi";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-10-06 08:32:55";s:12:"english_name";s:7:"Finnish";s:11:"native_name";s:5:"Suomi";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.0/fi.zip";s:3:"iso";a:2:{i:1;s:2:"fi";i:2;s:3:"fin";}s:7:"strings";a:1:{s:8:"continue";s:5:"Jatka";}}s:5:"fr_FR";a:8:{s:8:"language";s:5:"fr_FR";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-10-04 17:49:48";s:12:"english_name";s:15:"French (France)";s:11:"native_name";s:9:"Français";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/fr_FR.zip";s:3:"iso";a:1:{i:1;s:2:"fr";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:2:"gd";a:8:{s:8:"language";s:2:"gd";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-05 17:37:43";s:12:"english_name";s:15:"Scottish Gaelic";s:11:"native_name";s:9:"Gàidhlig";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.0/gd.zip";s:3:"iso";a:3:{i:1;s:2:"gd";i:2;s:3:"gla";i:3;s:3:"gla";}s:7:"strings";a:1:{s:8:"continue";s:15:"Lean air adhart";}}s:5:"gl_ES";a:8:{s:8:"language";s:5:"gl_ES";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-04 01:18:12";s:12:"english_name";s:8:"Galician";s:11:"native_name";s:6:"Galego";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/gl_ES.zip";s:3:"iso";a:2:{i:1;s:2:"gl";i:2;s:3:"glg";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"he_IL";a:8:{s:8:"language";s:5:"he_IL";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-04 22:57:38";s:12:"english_name";s:6:"Hebrew";s:11:"native_name";s:16:"עִבְרִית";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/he_IL.zip";s:3:"iso";a:1:{i:1;s:2:"he";}s:7:"strings";a:1:{s:8:"continue";s:12:"להמשיך";}}s:2:"hr";a:8:{s:8:"language";s:2:"hr";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-20 14:09:34";s:12:"english_name";s:8:"Croatian";s:11:"native_name";s:8:"Hrvatski";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.0/hr.zip";s:3:"iso";a:2:{i:1;s:2:"hr";i:2;s:3:"hrv";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:5:"hu_HU";a:8:{s:8:"language";s:5:"hu_HU";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-04 19:12:04";s:12:"english_name";s:9:"Hungarian";s:11:"native_name";s:6:"Magyar";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/hu_HU.zip";s:3:"iso";a:2:{i:1;s:2:"hu";i:2;s:3:"hun";}s:7:"strings";a:1:{s:8:"continue";s:7:"Tovább";}}s:5:"id_ID";a:8:{s:8:"language";s:5:"id_ID";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-04 11:26:19";s:12:"english_name";s:10:"Indonesian";s:11:"native_name";s:16:"Bahasa Indonesia";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/id_ID.zip";s:3:"iso";a:2:{i:1;s:2:"id";i:2;s:3:"ind";}s:7:"strings";a:1:{s:8:"continue";s:9:"Lanjutkan";}}s:5:"it_IT";a:8:{s:8:"language";s:5:"it_IT";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-10-02 08:24:03";s:12:"english_name";s:7:"Italian";s:11:"native_name";s:8:"Italiano";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/it_IT.zip";s:3:"iso";a:2:{i:1;s:2:"it";i:2;s:3:"ita";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"ja";a:8:{s:8:"language";s:2:"ja";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-10-21 06:30:27";s:12:"english_name";s:8:"Japanese";s:11:"native_name";s:9:"日本語";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.0/ja.zip";s:3:"iso";a:1:{i:1;s:2:"ja";}s:7:"strings";a:1:{s:8:"continue";s:9:"続ける";}}s:5:"ko_KR";a:8:{s:8:"language";s:5:"ko_KR";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-04 07:54:33";s:12:"english_name";s:6:"Korean";s:11:"native_name";s:9:"한국어";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/ko_KR.zip";s:3:"iso";a:2:{i:1;s:2:"ko";i:2;s:3:"kor";}s:7:"strings";a:1:{s:8:"continue";s:6:"계속";}}s:5:"my_MM";a:8:{s:8:"language";s:5:"my_MM";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-06 08:41:35";s:12:"english_name";s:7:"Burmese";s:11:"native_name";s:15:"ဗမာစာ";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/my_MM.zip";s:3:"iso";a:2:{i:1;s:2:"my";i:2;s:3:"mya";}s:7:"strings";a:1:{s:8:"continue";s:54:"ဆက်လက်လုပ်ေဆာင်ပါ။";}}s:5:"nb_NO";a:8:{s:8:"language";s:5:"nb_NO";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-04 20:51:26";s:12:"english_name";s:19:"Norwegian (Bokmål)";s:11:"native_name";s:13:"Norsk bokmål";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/nb_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nb";i:2;s:3:"nob";}s:7:"strings";a:1:{s:8:"continue";s:8:"Fortsett";}}s:5:"nl_NL";a:8:{s:8:"language";s:5:"nl_NL";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-17 06:23:19";s:12:"english_name";s:5:"Dutch";s:11:"native_name";s:10:"Nederlands";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/nl_NL.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"pl_PL";a:8:{s:8:"language";s:5:"pl_PL";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-10-03 17:44:34";s:12:"english_name";s:6:"Polish";s:11:"native_name";s:6:"Polski";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/pl_PL.zip";s:3:"iso";a:2:{i:1;s:2:"pl";i:2;s:3:"pol";}s:7:"strings";a:1:{s:8:"continue";s:9:"Kontynuuj";}}s:5:"pt_BR";a:8:{s:8:"language";s:5:"pt_BR";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-10-30 13:29:44";s:12:"english_name";s:19:"Portuguese (Brazil)";s:11:"native_name";s:20:"Português do Brasil";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/pt_BR.zip";s:3:"iso";a:2:{i:1;s:2:"pt";i:2;s:3:"por";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"pt_PT";a:8:{s:8:"language";s:5:"pt_PT";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-29 15:27:01";s:12:"english_name";s:21:"Portuguese (Portugal)";s:11:"native_name";s:10:"Português";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/pt_PT.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"ru_RU";a:8:{s:8:"language";s:5:"ru_RU";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-10-21 12:32:07";s:12:"english_name";s:7:"Russian";s:11:"native_name";s:14:"Русский";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/ru_RU.zip";s:3:"iso";a:2:{i:1;s:2:"ru";i:2;s:3:"rus";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продолжить";}}s:5:"sk_SK";a:8:{s:8:"language";s:5:"sk_SK";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-20 13:05:09";s:12:"english_name";s:6:"Slovak";s:11:"native_name";s:11:"Slovenčina";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/sk_SK.zip";s:3:"iso";a:2:{i:1;s:2:"sk";i:2;s:3:"slk";}s:7:"strings";a:1:{s:8:"continue";s:12:"Pokračovať";}}s:5:"sr_RS";a:8:{s:8:"language";s:5:"sr_RS";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-04 15:37:38";s:12:"english_name";s:7:"Serbian";s:11:"native_name";s:23:"Српски језик";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/sr_RS.zip";s:3:"iso";a:2:{i:1;s:2:"sr";i:2;s:3:"srp";}s:7:"strings";a:1:{s:8:"continue";s:14:"Настави";}}s:5:"sv_SE";a:8:{s:8:"language";s:5:"sv_SE";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-10-11 20:39:56";s:12:"english_name";s:7:"Swedish";s:11:"native_name";s:7:"Svenska";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/sv_SE.zip";s:3:"iso";a:2:{i:1;s:2:"sv";i:2;s:3:"swe";}s:7:"strings";a:1:{s:8:"continue";s:9:"Fortsätt";}}s:2:"th";a:8:{s:8:"language";s:2:"th";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-10-09 03:43:17";s:12:"english_name";s:4:"Thai";s:11:"native_name";s:9:"ไทย";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.0/th.zip";s:3:"iso";a:2:{i:1;s:2:"th";i:2;s:3:"tha";}s:7:"strings";a:1:{s:8:"continue";s:15:"ต่อไป";}}s:5:"tr_TR";a:8:{s:8:"language";s:5:"tr_TR";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-05 17:57:59";s:12:"english_name";s:7:"Turkish";s:11:"native_name";s:8:"Türkçe";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/tr_TR.zip";s:3:"iso";a:2:{i:1;s:2:"tr";i:2;s:3:"tur";}s:7:"strings";a:1:{s:8:"continue";s:5:"Devam";}}s:5:"zh_CN";a:8:{s:8:"language";s:5:"zh_CN";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-05 00:41:46";s:12:"english_name";s:15:"Chinese (China)";s:11:"native_name";s:12:"简体中文";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/zh_CN.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"继续";}}s:5:"zh_TW";a:8:{s:8:"language";s:5:"zh_TW";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-05 06:58:31";s:12:"english_name";s:16:"Chinese (Taiwan)";s:11:"native_name";s:12:"繁體中文";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/zh_TW.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"繼續";}}}', 'yes'),
(1331, '_site_transient_timeout_browser_4e23a6000876e66a7ec0dd24366f9a45', '1431690061', 'yes'),
(1332, '_site_transient_browser_4e23a6000876e66a7ec0dd24366f9a45', 'a:9:{s:8:"platform";s:5:"Linux";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"37.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(1335, '_transient_timeout_feed_399a5712149df56f3495904f4224b5e2', '1431128461', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1336, '_transient_feed_399a5712149df56f3495904f4224b5e2', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:51:"\n	\n	\n	\n	\n	\n	\n		\n		\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"NODES » Portada";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:27:"http://agora.xtec.cat/nodes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:26:"Una web per \nal teu centre";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 06 May 2015 08:01:17 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:2:"ca";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"Mostra de nodes actius";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"http://agora.xtec.cat/nodes/general/mostra-de-nodes-actius/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:68:"http://agora.xtec.cat/nodes/general/mostra-de-nodes-actius/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 31 Mar 2015 19:25:50 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:7:"General";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"Portada";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"http://agora.xtec.cat/nodes/?p=1191";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1118:"\r\n\r\n			\r\n	\r\n	\r\n\r\n		\r\n			\r\n				<a href="http://agora.xtec.cat/escolacharlesdarwin/" target="_blank" >					\r\n				</a>				\r\n					<a href="http://agora.xtec.cat/escolacharlesdarwin/" target="_blank" >Escola Charles Darwin (El Prat de Llobregat)</a>									\r\n			\r\n\r\n			\r\n			\r\n				<a href="http://agora.xtec.cat/escjoanmaragall/" target="_blank" >					\r\n				</a>				\r\n					<a href="http://agora.xtec.cat/escjoanmaragall/" target="_blank" >Escola Joan Maragall (Lleida)</a>									\r\n			\r\n\r\n			\r\n			\r\n				<a href="http://agora.xtec.cat/escolaforndanells/" target="_blank" >					\r\n				</a>				\r\n					<a href="http://agora.xtec.cat/escolaforndanells/" target="_blank" >Escola Forn d''Anells (Fornells de la Selva)</a>									\r\n			\r\n\r\n			\r\n			\r\n				<a href="http://agora.xtec.cat/escolapablopicasso/" target="_blank" >					\r\n				</a>				\r\n					<a href="http://agora.xtec.cat/escolapablopicasso/" target="_blank" >Escola Pablo Picasso (Barberà del Vallès)</a>									\r\n			\r\n\r\n			\r\n			\r\n				<a&#8230;  <a href="http://agora.xtec.cat/nodes/general/mostra-de-nodes-actius/" title="Read Mostra de nodes actius">Llegeix més»</a>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"xtecadmin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:18822:"<div class="slideshow_container slideshow_container_style-light" style="height: 500px; " data-session-id="1" data-style-name="style-light" data-style-version="2.2.21">\r\n\r\n			<div class="slideshow_loading_icon"></div>\r\n	\r\n	<div class="slideshow_content" style="display: none;">\r\n\r\n		<div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/escolacharlesdarwin/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/04/Selecció_999111.png" alt="Escola Charles Darwin (El Prat de Llobregat)" width="1263" height="908" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/escolacharlesdarwin/" target="_blank" >Escola Charles Darwin (El Prat de Llobregat)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/escjoanmaragall/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/04/Selecció_999108.png" alt="Escola Joan Maragall (Lleida)" width="1265" height="913" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/escjoanmaragall/" target="_blank" >Escola Joan Maragall (Lleida)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/escolaforndanells/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/04/Selecció_999110.png" alt="Escola Forn d''Anells (Fornells de la Selva)" width="1265" height="915" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/escolaforndanells/" target="_blank" >Escola Forn d''Anells (Fornells de la Selva)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/escolapablopicasso/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/04/Selecció_999093.png" alt="Escola Pablo Picasso (Barberà del Vallès)" width="1259" height="914" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/escolapablopicasso/" target="_blank" >Escola Pablo Picasso (Barberà del Vallès)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/insllicamunt2/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/04/Selecció_999067.png" alt="El Far d''Hipàtia" width="1269" height="914" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/insllicamunt2/" target="_blank" >El Far d''Hipàtia</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/escolarambletadelclot/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/02/Selecció_971.png" alt="Escola Rambleta del Clot (Barcelona)" width="1263" height="912" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/escolarambletadelclot/" target="_blank" >Escola Rambleta del Clot (Barcelona)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/ceipprovencals/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/03/Selecció_999028.png" alt="Escola Provençals" width="1254" height="893" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/ceipprovencals/" target="_blank" >Escola Provençals</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/inssobreques/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/03/Selecció_999038.png" alt="Institut Santiago Sobrequés i Vidal (Girona)" width="1251" height="890" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/inssobreques/" target="_blank" >Institut Santiago Sobrequés i Vidal (Girona)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/ceip-lesroquesblaves/" target="_self" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/04/Selecció_999113.png" alt="Escola Les Roques blanques (Esparraguera)" width="1263" height="908" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/ceip-lesroquesblaves/" target="_self" >Escola Les Roques blanques (Esparraguera)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/sesserradenoet/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/01/serranoet.png" alt="SI Serra de Noet (Berga)" width="1011" height="777" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/sesserradenoet/" target="_blank" >SI Serra de Noet (Berga)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/ieaoriolmartorell/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/03/Selecció_999030.png" alt="IEA Oriol Martorell" width="1251" height="892" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/ieaoriolmartorell/" target="_blank" >IEA Oriol Martorell</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/iesmariarubies/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/01/mariarubies.png" alt="Institut Maria Rubies (Lleida)" width="1141" height="773" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/iesmariarubies/" target="_blank" >Institut Maria Rubies (Lleida)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/insnoudegirona/" target="_self" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/01/nougirona.png" alt="Institut Nou de Girona (Girona)" width="1011" height="777" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/insnoudegirona/" target="_self" >Institut Nou de Girona (Girona)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/ceip-batea/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/01/batea.png" alt="Institut-Escola Mare de Déu del Portal (Batea)" width="1009" height="776" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/ceip-batea/" target="_blank" >Institut-Escola Mare de Déu del Portal (Batea)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/inssantandreu/" target="_self" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/01/santandreu.png" alt="Institut Sant Andreu (Sant Andreu de la Barca)" width="1011" height="778" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/inssantandreu/" target="_self" >Institut Sant Andreu (Sant Andreu de la Barca)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/ceip-collaso/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/01/collasoigil.png" alt="Escola Collaso i Gil (Barcelona)" width="1010" height="780" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/ceip-collaso/" target="_blank" >Escola Collaso i Gil (Barcelona)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/iesdeltebre/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/01/deltebre.png" alt="Institut de Deltebre" width="1007" height="773" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/iesdeltebre/" target="_blank" >Institut de Deltebre</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/esc-santgil/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/01/santgil.png" alt="Escola Sant Gil (Torà)" width="1008" height="774" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/esc-santgil/" target="_blank" >Escola Sant Gil (Torà)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/ceip-mcinto-verdaguer/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/01/jacintverdaguer.png" alt="Escola Mossèn Jacint Verdaguer (Barcelona)" width="1011" height="767" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/ceip-mcinto-verdaguer/" target="_blank" >Escola Mossèn Jacint Verdaguer (Barcelona)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/ceipstamargarida/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/01/santamargarida.png" alt="Escola Santa Margarida (Quart)" width="1140" height="779" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/ceipstamargarida/" target="_blank" >Escola Santa Margarida (Quart)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/ceip-puigberenguer/" target="_self" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/01/puigberenger.png" alt="Escola Puigberenguer (Manresa)" width="1139" height="778" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/ceip-puigberenguer/" target="_self" >Escola Puigberenguer (Manresa)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/insmontserratcolomer/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/01/montserratcolomer.png" alt="Institut Montserrat Colomer (Sant Esteve Sesrovires)" width="1136" height="731" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/insmontserratcolomer/" target="_blank" >Institut Montserrat Colomer (Sant Esteve Sesrovires)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/iespviana/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/01/princepviana.png" alt="Institut Princep de Viana (Barcelona)" width="1137" height="777" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/iespviana/" target="_blank" >Institut Princep de Viana (Barcelona)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/esc-dolorsmarti/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/01/martibadia.png" alt="Escola Dolors Martí i Badia (Igualada)" width="1139" height="775" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/esc-dolorsmarti/" target="_blank" >Escola Dolors Martí i Badia (Igualada)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/escolamontbui/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/01/montbui.png" alt="Escola Montbui (Caldes de Montbui)" width="1138" height="769" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/escolamontbui/" target="_blank" >Escola Montbui (Caldes de Montbui)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/ceip-montserrat-suria/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/01/montserrat.png" alt="Escola Mare de Déu de Montserrat (Súria)" width="1138" height="771" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/ceip-montserrat-suria/" target="_blank" >Escola Mare de Déu de Montserrat (Súria)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/ceip-turocanmates/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/01/turomates.png" alt="Escola de Turó de Can Mates (Sant Cugat del Vallès)" width="1138" height="779" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/ceip-turocanmates/" target="_blank" >Escola de Turó de Can Mates (Sant Cugat del Vallès)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/iesmolidelavila/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/01/molivila.png" alt="Institut Molí de la Vila (Capellades)" width="1137" height="775" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/iesmolidelavila/" target="_blank" >Institut Molí de la Vila (Capellades)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n				<a href="http://agora.xtec.cat/sinscardener/" target="_blank" >					<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2015/01/sinscardener.png" alt="SES Cardener (Sant Joan de Vilatorrada)" width="1137" height="777" />\r\n				</a>				<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title"><a href="http://agora.xtec.cat/sinscardener/" target="_blank" >SES Cardener (Sant Joan de Vilatorrada)</a></div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div>\r\n	</div>\r\n\r\n	<div class="slideshow_controlPanel slideshow_transparent" style="display: none;"><ul><li class="slideshow_togglePlay" data-play-text="Visualitza" data-pause-text="Atura"></li></ul></div>\r\n\r\n	<div class="slideshow_button slideshow_previous slideshow_transparent" role="button" data-previous-text="Anterior" style="display: none;"></div>\r\n	<div class="slideshow_button slideshow_next slideshow_transparent" role="button" data-next-text="Següent" style="display: none;"></div>\r\n\r\n	<div class="slideshow_pagination" style="display: none;" data-go-to-text="Vés a la diapositiva"><div class="slideshow_pagination_center"></div></div>\r\n\r\n	<!-- WordPress Slideshow Version 2.2.21 -->\r\n\r\n	</div>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:64:"http://agora.xtec.cat/nodes/general/mostra-de-nodes-actius/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:39:"Voleu renovar la web del vostre centre?";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"http://agora.xtec.cat/nodes/portada/renovar-web/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:57:"http://agora.xtec.cat/nodes/portada/renovar-web/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 21 Feb 2015 03:50:40 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:17:"Característiques";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"Portada";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"http://agora.xtec.cat/nodes/?p=810";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:207:"Si sou un centre educatiu públic o concertat de Catalunya i necessiteu crear o renovar la vostra web, podeu demanar Nodes <a href="http://agora.xtec.cat/moodle/moodle/mod/book/view.php?id=1981">AQUÍ</a>.\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"xtecadmin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:214:"<p>Si sou un centre educatiu públic o concertat de Catalunya i necessiteu crear o renovar la vostra web, podeu demanar Nodes <a href="http://agora.xtec.cat/moodle/moodle/mod/book/view.php?id=1981">AQUÍ</a>.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:53:"http://agora.xtec.cat/nodes/portada/renovar-web/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:13:"Molt flexible";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://agora.xtec.cat/nodes/portada/multiples-esquemes/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:64:"http://agora.xtec.cat/nodes/portada/multiples-esquemes/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 23 Dec 2014 11:58:56 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:17:"Característiques";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"Portada";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"http://agora.xtec.cat/nodes/?p=776";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:349:"NODES permet presentar la informació de manera molt flexible. Hi ha múltiples combinacions per mostrar els articles amb la mida i l''ordre que necessiteu. Amb barra de ginys lateral dreta, esquerra, totes dues o sense cap barra.&#8230;  <a href="http://agora.xtec.cat/nodes/portada/multiples-esquemes/" title="Read Molt flexible">Llegeix més»</a>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"xtecadmin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1104:"<p>NODES permet presentar la informació de manera molt flexible. Hi ha múltiples combinacions per mostrar els articles amb la mida i l&#8217;ordre que necessiteu. Amb barra de ginys lateral dreta, esquerra, totes dues o sense cap barra.</p>\n<p><strong>Combinacions possibles de visualització d&#8217;articles</strong></p>\n<ul>\n<li>1 article per fila</li>\n<li>2 articles per fila (mateixa mida)</li>\n<li>2 articles per fila (el primer article ocupa 1/3 i el segon 2/3)</li>\n<li>2 articles per fila (el primer article ocupa 2/3 i el segon 1/3)</li>\n<li>3 articles per fila</li>\n<li>4 articles per fila</li>\n</ul>\n<p>És possible definir quants articles es visualitzen de manera independent per:</p>\n<ul>\n<li>Fila 1</li>\n<li>Fila 2</li>\n<li>Resta de files</li>\n</ul>\n<p><strong>Configuracions de barres de ginys possibles</strong></p>\n<p><a href="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/12/esquemes.png"><img class="alignnone size-full wp-image-846" src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/12/esquemes.png" alt="esquemes" width="567" height="424" /></a></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:60:"http://agora.xtec.cat/nodes/portada/multiples-esquemes/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:17:"Allotjat a Àgora";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://agora.xtec.cat/nodes/portada/allotjat-a-agora-2/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:64:"http://agora.xtec.cat/nodes/portada/allotjat-a-agora-2/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 22 Dec 2014 18:05:28 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:17:"Característiques";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"Portada";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"http://agora.xtec.cat/nodes/?p=804";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:296:"El servei està allotjat a <a style="color: #c42300 !important;" href="http://agora.xtec.cat/">Àgora</a>, que garanteix programari actualitzat, còpies de seguretat diàries, alta disponibilitat i suport personalitzat. El centre educatiu no ha de realitzar cap tasca tècnica de manteniment.\n\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"xtecadmin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:354:"<p style="color: #444444;">El servei està allotjat a <a style="color: #c42300 !important;" href="http://agora.xtec.cat/">Àgora</a>, que garanteix programari actualitzat, còpies de seguretat diàries, alta disponibilitat i suport personalitzat. El centre educatiu no ha de realitzar cap tasca tècnica de manteniment.</p>\n<p style="color: #444444;">\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:60:"http://agora.xtec.cat/nodes/portada/allotjat-a-agora-2/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:6:"Social";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:61:"http://agora.xtec.cat/nodes/portada/amb-xarxa-social-inclosa/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:70:"http://agora.xtec.cat/nodes/portada/amb-xarxa-social-inclosa/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 22 Dec 2014 12:21:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:17:"Característiques";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"Portada";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"http://agora.xtec.cat/nodes/?p=799";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:308:"NODES inclou un entorn segur i controlat que permet als alumnes apendre què és una xarxa social i com fer-ne un bon ús. Un espai transversal on compartir aficions, interessos i projectes&#8230;  <a href="http://agora.xtec.cat/nodes/portada/amb-xarxa-social-inclosa/" title="Read Social">Llegeix més»</a>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"xtecadmin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4222:"<p>Nodes incorpora les extensions <strong>BuddyPress</strong> i <strong>BBPress</strong> (Fòrums) que permeten implementar una xarxa social amb el control, la privacitat i la seguretat necessàries. La xarxa està formada bàsicament pel <strong>Mur general</strong> i els <strong>nodes</strong>:</p>\n<ul>\n<li>El<strong> Mur general:</strong> qualsevol usuari/ària pot escriure un comentari, o adjuntar una imatge o un vídeo de manera molt senzilla.</li>\n</ul>\n<p><a href="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/01/Selecció_999001.png"><img class="aligncenter wp-image-1268" src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/01/Selecció_999001.png" alt="Selecció_999(001)" width="689" height="470" /></a></p>\n<ul>\n<li>Els<strong> nodes:</strong> espais amb el seu propi mur, fòrum i repositori de documents. Els nodes poden ser espais públics, privats o ocults.</li>\n</ul>\n<p><a href="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/01/Selecció_999006.png"><img class="aligncenter wp-image-1267 " src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/01/Selecció_999006.png" alt="Selecció_999(006)" width="288" height="385" /></a>Exemples de nodes reals: Professorat, Videojocs, Club de lectura, Notícies sobre la natura, Comissió TAC, Tutoria sobre RRR (Reducció, Reciclatge, Reutilització), Cinema, Papiroflèxia, Grup-classe d&#8217;ESO 1D, Tutoria educació emocional, Música, Fotografia, Grup-classe ESO 2A, Grup-classe ESO 1A, Intercanvi de llibres, Reptes del laberint, Futbol, Mondo internet, Dibuix, Goma eva (manualitats).</p>\n<p><a href="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/01/Selecció_999007.png"><img class="aligncenter wp-image-1269" src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/01/Selecció_999007.png" alt="Selecció_999(007)" width="615" height="579" /></a></p>\n<p style="text-align: center;"> <em>Exemple de mur del node &#8220;Club de Lectura&#8221;</em></p>\n<h4>Transversal</h4>\n<p>La xarxa permet una veritable comunicació transversal entre l&#8217;alumnat de diferents classes, cursos i nivells, agrupant-se atenent a projectes, aficions i interessos.</p>\n<h4>Eina de tutoria</h4>\n<p>Es pot crear un node per cada tema de tutoria que es vulgui tractar en profunditat durant un trimestre o tot el curs. Els propis alumnes poden ser els encarregats de gestionar i mantenir el node, afegint-hi contingut cada setmana i obrint converses de reflexió. Si el node es públic, tot el que es publica es replica al mur general, de manera que tot el centre pot veure l&#8217;activitat que s&#8217;està fent en aquella tutoria.</p>\n<p><a href="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/01/Selecció_999010.png"><img class="aligncenter wp-image-1274 " src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/01/Selecció_999010.png" alt="Selecció_999(010)" width="653" height="935" /></a></p>\n<p style="text-align: center;"><em>Node de reducció, reutilització i reciclatge, creat des de la tutoria de 2n d&#8217;ESO<br />\n</em></p>\n<h4>Intranet pel professorat</h4>\n<p>Simplement amb la creació d&#8217;un node, el professorat pot disposar d&#8217;un espai privat on iniciar converses (Mur), desenvolupar temes en profunditat (Fòrums) i compartir documents (Docs). Els nodes permeten diferents tipus de subscripció. D&#8217;aquesta manera, el docent pot triar, segons la subscripció, el flux d&#8217;informació que vol rebre.</p>\n<p><a href="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/01/Selecció_999008.png"><img class="aligncenter wp-image-1272" src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/01/Selecció_999008.png" alt="Selecció_999(008)" width="631" height="657" /></a></p>\n<p style="text-align: center;"><em>Mur del node professorat</em></p>\n<p><a href="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/01/Selecció_999009.png"><img class="aligncenter wp-image-1273" src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/01/Selecció_999009.png" alt="Selecció_999(009)" width="658" height="405" /></a></p>\n<p style="text-align: center;"><em>Apartat de documents associat al node </em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:66:"http://agora.xtec.cat/nodes/portada/amb-xarxa-social-inclosa/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:13:"Autenticació";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"http://agora.xtec.cat/nodes/portada/autenticacio-amb-moodle-i-google/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:78:"http://agora.xtec.cat/nodes/portada/autenticacio-amb-moodle-i-google/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 22 Dec 2014 11:57:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:17:"Característiques";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"Portada";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"http://agora.xtec.cat/nodes/?p=793";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:515:"Per entrar a la part privada de NODES, els usuaris poden autenticar-se fent servir l&#8217;usuari del Moodle d&#8217;Àgora del centre o l&#8217;usuari de Google (si el centre disposa de <a title="enllaç a Google Apps for education" href="https://www.google.com/intx/es/work/apps/education/" target="_blank">Google Apps for Education</a>). No és necessari donar-los d&#8217;alta&#8230;  <a href="http://agora.xtec.cat/nodes/portada/autenticacio-amb-moodle-i-google/" title="Read Autenticació">Llegeix més»</a>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"xtecadmin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:590:"<p>Per entrar a la part privada de NODES, els usuaris poden autenticar-se fent servir l&#8217;usuari del Moodle d&#8217;Àgora del centre o l&#8217;usuari de Google (si el centre disposa de <a title="enllaç a Google Apps for education" href="https://www.google.com/intx/es/work/apps/education/" target="_blank">Google Apps for Education</a>). No és necessari donar-los d&#8217;alta de nou.</p>\n<p>Més informació a la guia ràpida:</p>\n<ul>\n<li><a title="enllaç a guia ràpida" href="http://agora.xtec.cat/nodes/guia-rapida/7-gestiona-els-usuaris/">Gestió dels usuaris</a></li>\n</ul>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"http://agora.xtec.cat/nodes/portada/autenticacio-amb-moodle-i-google/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:8:"Carrusel";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"http://agora.xtec.cat/nodes/portada/carrusel/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:54:"http://agora.xtec.cat/nodes/portada/carrusel/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 22 Dec 2014 05:15:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:17:"Característiques";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"Portada";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"http://agora.xtec.cat/nodes/?p=755";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:311:"NODES inclou Carrusel, un sistema de presentació de diapositives molt flexible i potent. Les fotografies es poden carregar directament des de Picasa o Google+ Fotos. Compatible amb els dispositius mòbils.&#8230;  <a href="http://agora.xtec.cat/nodes/portada/carrusel/" title="Read Carrusel">Llegeix més»</a>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"xtecadmin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4090:"<p>NODES inclou l&#8217;extensió <strong>Carrusel</strong>, un sistema de presentació de diapositives molt flexible i potent. Les diapositives poden ser fotografies, vídeos o textos. Les fotografies es poden carregar directament des de Picasa o Google+ Fotos. Compatible amb els dispositius mòbils.</p>\n<p>Exemple:</p>\n<div class="slideshow_container slideshow_container_style-dark" style="height: 500px; " data-session-id="2" data-style-name="style-dark" data-style-version="2.2.21">\r\n\r\n			<div class="slideshow_loading_icon"></div>\r\n	\r\n	<div class="slideshow_content" style="display: none;">\r\n\r\n		<div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n									<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/11/12.jpg" alt="12" width="800" height="600" />\r\n								<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title">12</div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n									<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/11/13.jpg" alt="13" width="800" height="600" />\r\n								<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title">13</div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n									<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/11/14.jpg" alt="14" width="800" height="600" />\r\n								<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title">14</div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n									<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/11/15.jpg" alt="15" width="800" height="600" />\r\n								<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title">15</div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n									<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/11/16.jpg" alt="16" width="800" height="600" />\r\n								<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title">16</div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n									<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/11/17.jpg" alt="17" width="800" height="600" />\r\n								<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title">17</div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div><div class="slideshow_view">\r\n			<div class="slideshow_slide slideshow_slide_image">\r\n									<img src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/11/18.jpg" alt="18" width="800" height="600" />\r\n								<div class="slideshow_description_box slideshow_transparent">\r\n					<div class="slideshow_title">18</div>									</div>\r\n			</div>\r\n\r\n			<div style="clear: both;"></div></div>\r\n	</div>\r\n\r\n	<div class="slideshow_controlPanel slideshow_transparent" style="display: none;"><ul><li class="slideshow_togglePlay" data-play-text="Visualitza" data-pause-text="Atura"></li></ul></div>\r\n\r\n	<div class="slideshow_button slideshow_previous slideshow_transparent" role="button" data-previous-text="Anterior" style="display: none;"></div>\r\n	<div class="slideshow_button slideshow_next slideshow_transparent" role="button" data-next-text="Següent" style="display: none;"></div>\r\n\r\n	<div class="slideshow_pagination" style="display: none;" data-go-to-text="Vés a la diapositiva"><div class="slideshow_pagination_center"></div></div>\r\n\r\n	<!-- WordPress Slideshow Version 2.2.21 -->\r\n\r\n	</div>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:50:"http://agora.xtec.cat/nodes/portada/carrusel/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:17:"Calendaris Google";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"http://agora.xtec.cat/nodes/portada/calendaris-google/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:63:"http://agora.xtec.cat/nodes/portada/calendaris-google/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 22 Dec 2014 05:14:46 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:17:"Característiques";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"Portada";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"http://agora.xtec.cat/nodes/?p=761";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:295:"NODES inclou l&#8217;extensió <a title="enllaç al plugin" href="https://wordpress.org/plugins/google-calendar-events/" target="_blank">Google Calendar Events</a>, que permet visualitzar els vostres calendaris Google de manera òptima. Una bona eina que pot servir com a agenda d&#8217;aula.\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"xtecadmin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:311:"<p>NODES inclou l&#8217;extensió <em><a title="enllaç al plugin" href="https://wordpress.org/plugins/google-calendar-events/" target="_blank">Google Calendar Events</a></em>, que permet visualitzar els vostres calendaris Google de manera òptima. Una bona eina que pot servir com a agenda d&#8217;aula.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:59:"http://agora.xtec.cat/nodes/portada/calendaris-google/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:17:"Ginys específics";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:61:"http://agora.xtec.cat/nodes/portada/giny-denllacos-educatius/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:70:"http://agora.xtec.cat/nodes/portada/giny-denllacos-educatius/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 22 Dec 2014 04:40:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:17:"Característiques";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"Portada";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"http://agora.xtec.cat/nodes/?p=786";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:388:"NODES inclou diversos ginys que s''han desenvolupat pensant en els centres educatius. Un giny per identificar el centre, un giny amb una graella d''enllaços de la comunitat educativa (XTEC, Edu365, Edu3, Xarxa docent, ATRI, JClic...) i un giny de Grup classe.&#8230;  <a href="http://agora.xtec.cat/nodes/portada/giny-denllacos-educatius/" title="Read Ginys específics">Llegeix més»</a>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"xtecadmin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3426:"<p><strong>NODES</strong> inclou diversos ginys desenvolupats pensant en els centres educatius.</p>\n<h4>Giny d&#8217;identificació del centre</h4>\n<p>Afegeix el logotip i les dades del centre de manera molt senzilla.</p>\n<p>Composició horitzontal:</p>\n<p><a href="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/12/Selecció_903.png"><img class="alignnone size-full wp-image-1073" src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/12/Selecció_903.png" alt="Selecció_903" width="280" height="144" /></a></p>\n<p>Composició vertical:</p>\n<p><a href="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/12/Selecció_904.png"><img class="alignnone size-full wp-image-1074" src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/12/Selecció_904.png" alt="Selecció_904" width="177" height="300" /></a></p>\n<p>Configuració:</p>\n<p><a href="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/12/Selecció_905.png"><img class="alignnone size-full wp-image-1075" style="border: 1px solid #ddd;" src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/12/Selecció_905.png" alt="Selecció_905" width="280" height="724" /></a></p>\n<h4>Giny d&#8217;enllaços educatius</h4>\n<p>Permet incorporar de manera molt fàcil els principals enllaços de la comunitat educativa:</p>\n<p><a href="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/12/ginyeducatiu1.png"><img class="alignnone size-full wp-image-913" style="border: 1px solid #ddd;" src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/12/ginyeducatiu1.png" alt="ginyeducatiu" width="306" height="241" /></a></p>\n<ul>\n<li><strong>Departament d&#8217;Ensenyament:</strong> Pàgina del Departament d&#8217;Ensenyament</li>\n<li><strong>Xtec:</strong> Recursos educatius</li>\n<li><strong>Edu365:</strong> Recursos educatius</li>\n<li><strong>Edu3:</strong> Vídeos educatius</li>\n<li><strong>Xarxa docent:</strong> Xarxa de suport amb més de 10.000 docents inscrits</li>\n<li><strong>Alexandria:</strong> Cursos Moodle i activitats PDI per descarregar</li>\n<li><strong>Linkat:</strong> Linux pels centres educatius</li>\n<li><strong>JClic:</strong> Activitats JClic</li>\n<li><strong>Merlí:</strong> Catàleg/Cercador de recursos XTEC</li>\n<li><strong>ARC:</strong> Aplicació de recursos al Currículum</li>\n<li><strong>Odissea:</strong> Entorn virtual de formació per a docents</li>\n<li><strong>AMPA:</strong> L&#8217;associació de Mares i Pares d&#8217;alumnes del centre</li>\n<li><strong>Escola verda:</strong> Projectes a favor del medi ambient</li>\n<li><strong>ATRI:</strong> Portal</li>\n<li><strong>SAGA:</strong> Sistema d&#8217;Administració i Gestió Acadèmica</li>\n<li><strong>Familia i Escola:</strong> Pàgina amb consells i recursos per les famílies</li>\n<li><strong>Internet Segura:</strong> Recursos per utilitzar Internet de manera segura</li>\n<li><strong>Moodle:</strong> Aula virtual del vostre centre</li>\n</ul>\n<h4>El giny Grup classe</h4>\n<p>Aquest giny permet incloure informació sobre el vostre grup classe. Ideal pel blog de classe.</p>\n<p><a href="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/12/giny-grup-classe.png"><img class="size-full wp-image-1070 alignleft" style="border: 1px solid #ddd;" src="http://agora.xtec.cat/nodes/wp-content/uploads/usu135/2014/12/giny-grup-classe.png" alt="giny-grup-classe" width="584" height="850" /></a></p>\n<p>&nbsp;</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:66:"http://agora.xtec.cat/nodes/portada/giny-denllacos-educatius/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:13:"Sense pèrdua";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"http://agora.xtec.cat/nodes/portada/fil-dariadna-i-grups-de-pagines/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"http://agora.xtec.cat/nodes/portada/fil-dariadna-i-grups-de-pagines/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 22 Dec 2014 04:30:24 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:17:"Característiques";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"Portada";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"http://agora.xtec.cat/nodes/?p=758";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:214:"Totes les pàgines i categories inclouen un fil d&#8217;Ariadna per a què els vostres usuaris no es perdin. A més, és possible agrupar pàgines i mostrar, a cada pàgina, un índex de les pàgines del grup.\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"xtecadmin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:230:"<p>Totes les pàgines i categories inclouen un <em>fil d&#8217;Ariadna</em> per a què els vostres usuaris no es perdin. A més, és possible agrupar pàgines i mostrar, a cada pàgina, un índex de les pàgines del grup.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"http://agora.xtec.cat/nodes/portada/fil-dariadna-i-grups-de-pagines/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:51:"http://agora.xtec.cat/nodes/categoria/portada/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:11:{s:4:"date";s:29:"Fri, 08 May 2015 11:41:01 GMT";s:6:"server";s:28:"Apache/2.2.15 (CentOS) DAV/2";s:7:"expires";s:29:"Thu, 19 Nov 1981 08:52:00 GMT";s:13:"cache-control";s:62:"no-store, no-cache, must-revalidate, post-check=0, pre-check=0";s:6:"pragma";s:8:"no-cache";s:10:"x-pingback";s:38:"http://agora.xtec.cat/nodes/xmlrpc.php";s:13:"last-modified";s:29:"Wed, 06 May 2015 08:01:17 GMT";s:4:"etag";s:34:""c5c4e88a331bc1677f6726fb9d8c2f64"";s:10:"set-cookie";s:68:"invite-anyone=deleted; expires=Thu, 08-May-2014 11:41:00 GMT; path=/";s:10:"connection";s:5:"close";s:12:"content-type";s:23:"text/xml; charset=UTF-8";}s:5:"build";s:14:"20150317100018";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1337, '_transient_timeout_feed_mod_399a5712149df56f3495904f4224b5e2', '1431128462', 'no'),
(1338, '_transient_feed_mod_399a5712149df56f3495904f4224b5e2', '1431085262', 'no'),
(1339, 'wsl_settings_Google_app_id', '', 'yes'),
(1340, 'wsl_settings_Google_app_secret', '', 'yes'),
(1341, 'wsl_settings_Moodle_app_id', '', 'yes'),
(1342, 'wsl_settings_Moodle_app_secret', '', 'yes'),
(1343, 'wsl_settings_Moodle_url', '', 'yes'),
(1358, '_transient_timeout_gce_feed_145', '1431678963', 'no'),
(1359, '_transient_gce_feed_145', 'a:1:{i:0;O:9:"GCE_Event":9:{s:4:"feed";O:8:"GCE_Feed":13:{s:2:"id";s:3:"145";s:11:"calendar_id";s:61:"xtec.cat_d8jr0i0n3n9patiiq361c5oicc@group.calendar.google.com";s:8:"feed_url";s:61:"xtec.cat_d8jr0i0n3n9patiiq361c5oicc@group.calendar.google.com";s:11:"date_format";s:15:"j \\d\\e F \\d\\e Y";s:11:"time_format";s:3:"G:i";s:5:"cache";s:3:"300";s:19:"multiple_day_events";s:1:"1";s:11:"display_url";s:280:"https://www.googleapis.com/calendar/v3/calendars/xtec.cat_d8jr0i0n3n9patiiq361c5oicc@group.calendar.google.com/events?key=AIzaSyAxh4zWTv9TEdDcxec9L2I2BmaiqG_g44U&timeMin=2015-04-15T00%3A02%3A00%2B02%3A00&timeMax=2017-05-14T22%3A08%3A35%2B02%3A00&maxResults=10000&singleEvents=true";s:12:"search_query";s:0:"";s:16:"expand_recurring";s:1:"1";s:5:"title";s:25:"Calendari d&#8217;exemple";s:6:"events";a:1:{i:0;r:2;}s:17:"\0GCE_Feed\0api_key";s:39:"AIzaSyAssdKVved1mPVY0UJCrx96OUOF9u17AuY";}s:2:"id";s:26:"ed3kmhimvnpu1lbpd1i4qe5p30";s:5:"title";s:17:"Festa del treball";s:11:"description";s:0:"";s:8:"location";s:0:"";s:10:"start_time";i:1430431200;s:8:"end_time";i:1430517600;s:4:"link";s:128:"https://www.google.com/calendar/event?eid=ZWQza21oaW12bnB1MWxicGQxaTRxZTVwMzAgeHRlYy5jYXRfZDhqcjBpMG4zbjlwYXRpaXEzNjFjNW9pY2NAZw";s:8:"day_type";s:3:"SWD";}}', 'no'),
(1361, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:3:{i:0;O:8:"stdClass":10:{s:8:"response";s:7:"upgrade";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.2.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.2.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.2.2-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.2.2-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.2.2";s:7:"version";s:5:"4.2.2";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";}i:1;O:8:"stdClass":11:{s:8:"response";s:10:"autoupdate";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.2.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.2.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.2.2-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.2.2-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.2.2";s:7:"version";s:5:"4.2.2";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";s:12:"notify_email";s:1:"1";}i:2;O:8:"stdClass":10:{s:8:"response";s:10:"autoupdate";s:8:"download";s:62:"https://downloads.wordpress.org/release/ca/wordpress-4.1.5.zip";s:6:"locale";s:2:"ca";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:62:"https://downloads.wordpress.org/release/ca/wordpress-4.1.5.zip";s:10:"no_content";b:0;s:11:"new_bundled";b:0;s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.1.5";s:7:"version";s:5:"4.1.5";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1432188324;s:15:"version_checked";s:5:"4.0.5";s:12:"translations";a:0:{}}', 'yes'),
(1372, '_site_transient_timeout_theme_roots', '1432190125', 'yes'),
(1373, '_site_transient_theme_roots', 'a:2:{s:18:"reactor-primaria-1";s:7:"/themes";s:7:"reactor";s:7:"/themes";}', 'yes');

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=916 ;

--
-- Bolcant dades de la taula `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 7, '_edit_lock', '1410966320:2'),
(3, 7, '_edit_last', '2'),
(4, 7, '_wp_page_template', 'page-templates/front-page.php'),
(5, 9, '_edit_lock', '1411382938:1'),
(6, 9, '_edit_last', '2'),
(7, 9, '_wp_page_template', 'page-templates/front-page.php'),
(8, 11, '_wp_attached_file', '2014/09/logo-escola.png'),
(9, 11, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:131;s:6:"height";i:131;s:4:"file";s:23:"2014/09/logo-escola.png";s:5:"sizes";a:0:{}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(13, 13, '_edit_lock', '1411403818:2'),
(14, 13, '_edit_last', '2'),
(20, 13, '_amaga_titol', ''),
(21, 13, '_amaga_metadata', ''),
(22, 13, '_bloc_html', 'on'),
(31, 18, '_edit_lock', '1411384467:2'),
(32, 18, '_edit_last', '2'),
(38, 18, '_amaga_titol', ''),
(39, 18, '_amaga_metadata', ''),
(40, 18, '_bloc_html', 'on'),
(43, 22, '_edit_lock', '1411042756:2'),
(44, 22, '_edit_last', '2'),
(45, 22, '_wp_page_template', 'page-templates/side-menu.php'),
(46, 24, '_edit_lock', '1411042900:2'),
(47, 24, '_edit_last', '2'),
(48, 24, '_wp_page_template', 'page-templates/side-menu.php'),
(49, 26, '_edit_lock', '1411043179:2'),
(50, 26, '_edit_last', '2'),
(51, 26, '_wp_page_template', 'page-templates/side-menu.php'),
(52, 28, '_edit_lock', '1411043244:2'),
(53, 28, '_edit_last', '2'),
(54, 28, '_wp_page_template', 'page-templates/side-menu.php'),
(55, 30, '_edit_lock', '1411405634:1'),
(56, 30, '_edit_last', '1'),
(57, 30, '_wp_page_template', 'page-templates/side-menu.php'),
(58, 32, '_edit_lock', '1411405391:1'),
(59, 32, '_edit_last', '2'),
(60, 32, '_wp_page_template', 'page-templates/side-menu.php'),
(61, 34, '_edit_lock', '1411050076:2'),
(62, 34, '_edit_last', '2'),
(63, 34, '_wp_page_template', 'page-templates/side-menu.php'),
(64, 36, '_edit_lock', '1411384838:1'),
(65, 36, '_edit_last', '1'),
(66, 36, '_wp_page_template', 'page-templates/side-menu.php'),
(67, 38, '_edit_lock', '1422369572:2'),
(68, 38, '_edit_last', '2'),
(69, 38, '_wp_page_template', 'page-templates/side-menu.php'),
(205, 55, '_menu_item_type', 'post_type'),
(206, 55, '_menu_item_menu_item_parent', '0'),
(207, 55, '_menu_item_object_id', '22'),
(208, 55, '_menu_item_object', 'page'),
(209, 55, '_menu_item_target', ''),
(210, 55, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(211, 55, '_menu_item_xfn', ''),
(212, 55, '_menu_item_url', ''),
(214, 56, '_menu_item_type', 'post_type'),
(215, 56, '_menu_item_menu_item_parent', '55'),
(216, 56, '_menu_item_object_id', '38'),
(217, 56, '_menu_item_object', 'page'),
(218, 56, '_menu_item_target', ''),
(219, 56, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(220, 56, '_menu_item_xfn', ''),
(221, 56, '_menu_item_url', ''),
(223, 57, '_menu_item_type', 'post_type'),
(224, 57, '_menu_item_menu_item_parent', '55'),
(225, 57, '_menu_item_object_id', '36'),
(226, 57, '_menu_item_object', 'page'),
(227, 57, '_menu_item_target', ''),
(228, 57, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(229, 57, '_menu_item_xfn', ''),
(230, 57, '_menu_item_url', ''),
(232, 58, '_menu_item_type', 'post_type'),
(233, 58, '_menu_item_menu_item_parent', '55'),
(234, 58, '_menu_item_object_id', '34'),
(235, 58, '_menu_item_object', 'page'),
(236, 58, '_menu_item_target', ''),
(237, 58, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(238, 58, '_menu_item_xfn', ''),
(239, 58, '_menu_item_url', ''),
(241, 59, '_menu_item_type', 'post_type'),
(242, 59, '_menu_item_menu_item_parent', '55'),
(243, 59, '_menu_item_object_id', '32'),
(244, 59, '_menu_item_object', 'page'),
(245, 59, '_menu_item_target', ''),
(246, 59, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(247, 59, '_menu_item_xfn', ''),
(248, 59, '_menu_item_url', ''),
(250, 60, '_menu_item_type', 'post_type'),
(251, 60, '_menu_item_menu_item_parent', '55'),
(252, 60, '_menu_item_object_id', '30'),
(253, 60, '_menu_item_object', 'page'),
(254, 60, '_menu_item_target', ''),
(255, 60, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(256, 60, '_menu_item_xfn', ''),
(257, 60, '_menu_item_url', ''),
(259, 61, '_menu_item_type', 'post_type'),
(260, 61, '_menu_item_menu_item_parent', '55'),
(261, 61, '_menu_item_object_id', '28'),
(262, 61, '_menu_item_object', 'page'),
(263, 61, '_menu_item_target', ''),
(264, 61, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(265, 61, '_menu_item_xfn', ''),
(266, 61, '_menu_item_url', ''),
(268, 62, '_menu_item_type', 'post_type'),
(269, 62, '_menu_item_menu_item_parent', '55'),
(270, 62, '_menu_item_object_id', '26'),
(271, 62, '_menu_item_object', 'page'),
(272, 62, '_menu_item_target', ''),
(273, 62, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(274, 62, '_menu_item_xfn', ''),
(275, 62, '_menu_item_url', ''),
(277, 63, '_menu_item_type', 'post_type'),
(278, 63, '_menu_item_menu_item_parent', '55'),
(279, 63, '_menu_item_object_id', '24'),
(280, 63, '_menu_item_object', 'page'),
(281, 63, '_menu_item_target', ''),
(282, 63, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(283, 63, '_menu_item_xfn', ''),
(284, 63, '_menu_item_url', ''),
(286, 64, '_edit_lock', '1411383305:1'),
(287, 64, '_edit_last', '1'),
(288, 64, '_wp_page_template', 'page-templates/side-menu.php'),
(289, 66, '_edit_lock', '1411383327:1'),
(290, 66, '_edit_last', '2'),
(291, 66, '_wp_page_template', 'page-templates/side-menu.php'),
(292, 69, '_menu_item_type', 'post_type'),
(293, 69, '_menu_item_menu_item_parent', '0'),
(294, 69, '_menu_item_object_id', '66'),
(295, 69, '_menu_item_object', 'page'),
(296, 69, '_menu_item_target', ''),
(297, 69, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(298, 69, '_menu_item_xfn', ''),
(299, 69, '_menu_item_url', ''),
(301, 70, '_menu_item_type', 'post_type'),
(302, 70, '_menu_item_menu_item_parent', '0'),
(303, 70, '_menu_item_object_id', '64'),
(304, 70, '_menu_item_object', 'page'),
(305, 70, '_menu_item_target', ''),
(306, 70, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(307, 70, '_menu_item_xfn', ''),
(308, 70, '_menu_item_url', ''),
(310, 71, '_edit_lock', '1411044161:2'),
(311, 71, '_edit_last', '2'),
(312, 71, '_wp_page_template', 'page-templates/side-menu.php'),
(313, 73, '_edit_lock', '1411048986:2'),
(314, 73, '_edit_last', '2'),
(315, 73, '_wp_page_template', 'page-templates/side-menu.php'),
(316, 75, '_menu_item_type', 'post_type'),
(317, 75, '_menu_item_menu_item_parent', '69'),
(318, 75, '_menu_item_object_id', '73'),
(319, 75, '_menu_item_object', 'page'),
(320, 75, '_menu_item_target', ''),
(321, 75, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(322, 75, '_menu_item_xfn', ''),
(323, 75, '_menu_item_url', ''),
(325, 76, '_menu_item_type', 'post_type'),
(326, 76, '_menu_item_menu_item_parent', '69'),
(327, 76, '_menu_item_object_id', '71'),
(328, 76, '_menu_item_object', 'page'),
(329, 76, '_menu_item_target', ''),
(330, 76, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(331, 76, '_menu_item_xfn', ''),
(332, 76, '_menu_item_url', ''),
(334, 77, '_edit_lock', '1411048969:2'),
(335, 77, '_edit_last', '2'),
(336, 77, '_wp_page_template', 'page-templates/side-menu.php'),
(337, 79, '_menu_item_type', 'post_type'),
(338, 79, '_menu_item_menu_item_parent', '69'),
(339, 79, '_menu_item_object_id', '77'),
(340, 79, '_menu_item_object', 'page'),
(341, 79, '_menu_item_target', ''),
(342, 79, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(343, 79, '_menu_item_xfn', ''),
(344, 79, '_menu_item_url', ''),
(346, 80, '_edit_lock', '1411049276:2'),
(347, 80, '_edit_last', '2'),
(348, 80, '_wp_page_template', 'page-templates/side-menu.php'),
(349, 82, '_edit_lock', '1411049325:2'),
(350, 82, '_edit_last', '2'),
(351, 82, '_wp_page_template', 'page-templates/side-menu.php'),
(352, 84, '_edit_lock', '1411049459:2'),
(353, 84, '_edit_last', '2'),
(354, 84, '_wp_page_template', 'page-templates/side-menu.php'),
(355, 86, '_menu_item_type', 'taxonomy'),
(356, 86, '_menu_item_menu_item_parent', '0'),
(357, 86, '_menu_item_object_id', '7'),
(358, 86, '_menu_item_object', 'category'),
(359, 86, '_menu_item_target', ''),
(360, 86, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(361, 86, '_menu_item_xfn', ''),
(362, 86, '_menu_item_url', ''),
(364, 87, '_edit_lock', '1411385148:1'),
(365, 87, '_edit_last', '1'),
(366, 87, '_wp_page_template', 'page-templates/side-menu.php'),
(367, 89, '_menu_item_type', 'post_type'),
(368, 89, '_menu_item_menu_item_parent', '69'),
(369, 89, '_menu_item_object_id', '84'),
(370, 89, '_menu_item_object', 'page'),
(371, 89, '_menu_item_target', ''),
(372, 89, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(373, 89, '_menu_item_xfn', ''),
(374, 89, '_menu_item_url', ''),
(376, 90, '_menu_item_type', 'post_type'),
(377, 90, '_menu_item_menu_item_parent', '69'),
(378, 90, '_menu_item_object_id', '82'),
(379, 90, '_menu_item_object', 'page'),
(380, 90, '_menu_item_target', ''),
(381, 90, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(382, 90, '_menu_item_xfn', ''),
(383, 90, '_menu_item_url', ''),
(385, 91, '_menu_item_type', 'post_type'),
(386, 91, '_menu_item_menu_item_parent', '69'),
(387, 91, '_menu_item_object_id', '80'),
(388, 91, '_menu_item_object', 'page'),
(389, 91, '_menu_item_target', ''),
(390, 91, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(391, 91, '_menu_item_xfn', ''),
(392, 91, '_menu_item_url', ''),
(394, 92, '_menu_item_type', 'post_type'),
(395, 92, '_menu_item_menu_item_parent', '0'),
(396, 92, '_menu_item_object_id', '87'),
(397, 92, '_menu_item_object', 'page'),
(398, 92, '_menu_item_target', ''),
(399, 92, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(400, 92, '_menu_item_xfn', ''),
(401, 92, '_menu_item_url', ''),
(403, 93, '_menu_item_type', 'taxonomy'),
(404, 93, '_menu_item_menu_item_parent', '148'),
(405, 93, '_menu_item_object_id', '3'),
(406, 93, '_menu_item_object', 'category'),
(407, 93, '_menu_item_target', ''),
(408, 93, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(409, 93, '_menu_item_xfn', ''),
(410, 93, '_menu_item_url', ''),
(412, 94, '_menu_item_type', 'taxonomy'),
(413, 94, '_menu_item_menu_item_parent', '148'),
(414, 94, '_menu_item_object_id', '8'),
(415, 94, '_menu_item_object', 'category'),
(416, 94, '_menu_item_target', ''),
(417, 94, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(418, 94, '_menu_item_xfn', ''),
(419, 94, '_menu_item_url', ''),
(421, 95, '_menu_item_type', 'taxonomy'),
(422, 95, '_menu_item_menu_item_parent', '148'),
(423, 95, '_menu_item_object_id', '9'),
(424, 95, '_menu_item_object', 'category'),
(425, 95, '_menu_item_target', ''),
(426, 95, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(427, 95, '_menu_item_xfn', ''),
(428, 95, '_menu_item_url', ''),
(430, 96, '_menu_item_type', 'taxonomy'),
(431, 96, '_menu_item_menu_item_parent', '149'),
(432, 96, '_menu_item_object_id', '10'),
(433, 96, '_menu_item_object', 'category'),
(434, 96, '_menu_item_target', ''),
(435, 96, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(436, 96, '_menu_item_xfn', ''),
(437, 96, '_menu_item_url', ''),
(439, 97, '_menu_item_type', 'taxonomy'),
(440, 97, '_menu_item_menu_item_parent', '149'),
(441, 97, '_menu_item_object_id', '11'),
(442, 97, '_menu_item_object', 'category'),
(443, 97, '_menu_item_target', ''),
(444, 97, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(445, 97, '_menu_item_xfn', ''),
(446, 97, '_menu_item_url', ''),
(448, 98, '_menu_item_type', 'taxonomy'),
(449, 98, '_menu_item_menu_item_parent', '149'),
(450, 98, '_menu_item_object_id', '12'),
(451, 98, '_menu_item_object', 'category'),
(452, 98, '_menu_item_target', ''),
(453, 98, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(454, 98, '_menu_item_xfn', ''),
(455, 98, '_menu_item_url', ''),
(457, 99, '_menu_item_type', 'taxonomy'),
(458, 99, '_menu_item_menu_item_parent', '149'),
(459, 99, '_menu_item_object_id', '13'),
(460, 99, '_menu_item_object', 'category'),
(461, 99, '_menu_item_target', ''),
(462, 99, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(463, 99, '_menu_item_xfn', ''),
(464, 99, '_menu_item_url', ''),
(466, 100, '_menu_item_type', 'taxonomy'),
(467, 100, '_menu_item_menu_item_parent', '149'),
(468, 100, '_menu_item_object_id', '14'),
(469, 100, '_menu_item_object', 'category'),
(470, 100, '_menu_item_target', ''),
(471, 100, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(472, 100, '_menu_item_xfn', ''),
(473, 100, '_menu_item_url', ''),
(475, 101, '_menu_item_type', 'taxonomy'),
(476, 101, '_menu_item_menu_item_parent', '149'),
(477, 101, '_menu_item_object_id', '15'),
(478, 101, '_menu_item_object', 'category'),
(479, 101, '_menu_item_target', ''),
(480, 101, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(481, 101, '_menu_item_xfn', ''),
(482, 101, '_menu_item_url', ''),
(484, 102, '_wp_attached_file', '2014/09/exemple1b.png'),
(485, 102, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:350;s:6:"height";i:250;s:4:"file";s:21:"2014/09/exemple1b.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"exemple1b-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"exemple1b-300x214.png";s:5:"width";i:300;s:6:"height";i:214;s:9:"mime-type";s:9:"image/png";}s:9:"thumb-300";a:4:{s:4:"file";s:21:"exemple1b-300x250.png";s:5:"width";i:300;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:9:"thumb-200";a:4:{s:4:"file";s:21:"exemple1b-200x150.png";s:5:"width";i:200;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(489, 103, '_edit_lock', '1411387354:2'),
(490, 103, '_edit_last', '2'),
(496, 103, 'settings', 'a:26:{s:9:"animation";s:5:"slide";s:10:"slideSpeed";s:1:"1";s:16:"descriptionSpeed";s:3:"0.4";s:13:"intervalSpeed";s:3:"300";s:13:"slidesPerView";s:1:"1";s:8:"maxWidth";s:1:"0";s:11:"aspectRatio";s:3:"3:1";s:6:"height";s:3:"179";s:14:"imageBehaviour";s:4:"crop";s:15:"showDescription";s:5:"false";s:15:"hideDescription";s:4:"true";s:27:"preserveSlideshowDimensions";s:5:"false";s:20:"enableResponsiveness";s:4:"true";s:4:"play";s:5:"false";s:4:"loop";s:4:"true";s:12:"pauseOnHover";s:4:"true";s:12:"controllable";s:4:"true";s:21:"hideNavigationButtons";s:4:"true";s:14:"showPagination";s:5:"false";s:14:"hidePagination";s:4:"true";s:12:"controlPanel";s:5:"false";s:16:"hideControlPanel";s:4:"true";s:15:"waitUntilLoaded";s:4:"true";s:15:"showLoadingIcon";s:4:"true";s:6:"random";s:4:"true";s:11:"avoidFilter";s:4:"true";}'),
(497, 103, 'styleSettings', 'a:1:{s:5:"style";s:15:"style-light.css";}'),
(498, 103, 'slides', 'a:3:{i:1;a:9:{s:17:"titleElementTagID";s:1:"0";s:5:"title";s:35:"Il·lustració per Albert Bachiller";s:23:"descriptionElementTagID";s:1:"0";s:11:"description";s:0:"";s:3:"url";s:22:"http://www.jurjur.org/";s:9:"urlTarget";s:5:"_self";s:15:"alternativeText";s:35:"Il·lustració per Albert Bachiller";s:4:"type";s:10:"attachment";s:6:"postId";s:3:"133";}i:2;a:9:{s:17:"titleElementTagID";s:1:"0";s:5:"title";s:22:"Photo by Nick Amoscato";s:23:"descriptionElementTagID";s:1:"0";s:11:"description";s:0:"";s:3:"url";s:50:"https://www.flickr.com/photos/namoscato/8297366194";s:9:"urlTarget";s:5:"_self";s:15:"alternativeText";s:22:"Photo by Nick Amoscato";s:4:"type";s:10:"attachment";s:6:"postId";s:3:"112";}i:3;a:9:{s:17:"titleElementTagID";s:1:"0";s:5:"title";s:6:"classe";s:23:"descriptionElementTagID";s:1:"0";s:11:"description";s:0:"";s:3:"url";s:88:"http://upload.wikimedia.org/wikipedia/commons/6/68/Boxwood_PS_kindergarten_classroom.jpg";s:9:"urlTarget";s:5:"_self";s:15:"alternativeText";s:62:"By ChinaFlag (Own work) [Public domain], via Wikimedia Commons";s:4:"type";s:10:"attachment";s:6:"postId";s:3:"131";}}'),
(501, 106, '_wp_attached_file', '2014/09/joan_turu.png'),
(502, 106, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:640;s:6:"height";i:218;s:4:"file";s:21:"2014/09/joan_turu.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"joan_turu-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"joan_turu-300x102.png";s:5:"width";i:300;s:6:"height";i:102;s:9:"mime-type";s:9:"image/png";}s:9:"thumb-300";a:4:{s:4:"file";s:21:"joan_turu-300x218.png";s:5:"width";i:300;s:6:"height";i:218;s:9:"mime-type";s:9:"image/png";}s:9:"thumb-200";a:4:{s:4:"file";s:21:"joan_turu-200x150.png";s:5:"width";i:200;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(503, 107, '_wp_attached_file', '2014/09/nens2.png'),
(504, 107, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:393;s:6:"height";i:258;s:4:"file";s:17:"2014/09/nens2.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:17:"nens2-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:17:"nens2-300x196.png";s:5:"width";i:300;s:6:"height";i:196;s:9:"mime-type";s:9:"image/png";}s:9:"thumb-300";a:4:{s:4:"file";s:17:"nens2-300x250.png";s:5:"width";i:300;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:9:"thumb-200";a:4:{s:4:"file";s:17:"nens2-200x150.png";s:5:"width";i:200;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(508, 108, '_wp_attached_file', '2014/09/nensescola1.jpg'),
(509, 108, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:400;s:6:"height";i:265;s:4:"file";s:23:"2014/09/nensescola1.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:23:"nensescola1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:23:"nensescola1-300x198.jpg";s:5:"width";i:300;s:6:"height";i:198;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumb-300";a:4:{s:4:"file";s:23:"nensescola1-300x250.jpg";s:5:"width";i:300;s:6:"height";i:250;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumb-200";a:4:{s:4:"file";s:23:"nensescola1-200x150.jpg";s:5:"width";i:200;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(529, 112, '_wp_attached_file', '2014/09/Photo-by-Nick-Amoscato.jpg'),
(530, 112, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:638;s:6:"height";i:215;s:4:"file";s:34:"2014/09/Photo-by-Nick-Amoscato.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:34:"Photo-by-Nick-Amoscato-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:34:"Photo-by-Nick-Amoscato-300x101.jpg";s:5:"width";i:300;s:6:"height";i:101;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumb-300";a:4:{s:4:"file";s:34:"Photo-by-Nick-Amoscato-300x215.jpg";s:5:"width";i:300;s:6:"height";i:215;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumb-200";a:4:{s:4:"file";s:34:"Photo-by-Nick-Amoscato-200x150.jpg";s:5:"width";i:200;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(531, 112, '_wp_attachment_image_alt', 'Photo by Nick Amoscato'),
(532, 113, '_edit_lock', '1411381207:2'),
(533, 113, '_edit_last', '2'),
(536, 113, '_amaga_titol', ''),
(537, 113, '_amaga_metadata', ''),
(538, 113, '_bloc_html', 'on'),
(539, 115, '_edit_lock', '1411384372:2'),
(540, 115, '_edit_last', '2'),
(543, 115, '_amaga_titol', ''),
(544, 115, '_amaga_metadata', ''),
(545, 115, '_bloc_html', ''),
(550, 118, '_edit_lock', '1431093846:2'),
(551, 118, '_edit_last', '2'),
(554, 118, '_amaga_titol', ''),
(555, 118, '_amaga_metadata', ''),
(556, 118, '_bloc_html', 'on'),
(557, 120, '_edit_lock', '1411384049:2'),
(558, 120, '_edit_last', '1'),
(561, 120, '_amaga_titol', ''),
(562, 120, '_amaga_metadata', ''),
(563, 120, '_bloc_html', ''),
(573, 125, '_edit_lock', '1411139960:1'),
(574, 125, '_edit_last', '1'),
(575, 125, 'settings', 'a:26:{s:9:"animation";s:5:"slide";s:10:"slideSpeed";s:1:"1";s:16:"descriptionSpeed";s:3:"0.4";s:13:"intervalSpeed";s:1:"5";s:13:"slidesPerView";s:1:"1";s:8:"maxWidth";s:1:"0";s:11:"aspectRatio";s:3:"3:1";s:6:"height";s:3:"200";s:14:"imageBehaviour";s:4:"crop";s:15:"showDescription";s:4:"true";s:15:"hideDescription";s:4:"true";s:27:"preserveSlideshowDimensions";s:5:"false";s:20:"enableResponsiveness";s:4:"true";s:4:"play";s:4:"true";s:4:"loop";s:4:"true";s:12:"pauseOnHover";s:4:"true";s:12:"controllable";s:4:"true";s:21:"hideNavigationButtons";s:5:"false";s:14:"showPagination";s:4:"true";s:14:"hidePagination";s:4:"true";s:12:"controlPanel";s:5:"false";s:16:"hideControlPanel";s:4:"true";s:15:"waitUntilLoaded";s:4:"true";s:15:"showLoadingIcon";s:4:"true";s:6:"random";s:5:"false";s:11:"avoidFilter";s:4:"true";}'),
(576, 125, 'styleSettings', 'a:1:{s:5:"style";s:15:"style-light.css";}'),
(577, 125, 'slides', 'a:6:{i:1;a:9:{s:17:"titleElementTagID";s:1:"0";s:5:"title";s:8:"Imatge 1";s:23:"descriptionElementTagID";s:1:"0";s:11:"description";s:20:"Descripció imatge 1";s:3:"url";s:0:"";s:9:"urlTarget";s:5:"_self";s:15:"alternativeText";s:0:"";s:4:"type";s:10:"attachment";s:6:"postId";s:3:"128";}i:2;a:9:{s:17:"titleElementTagID";s:1:"0";s:5:"title";s:6:"Text 1";s:23:"descriptionElementTagID";s:1:"0";s:11:"description";s:54:"Els carrusels poden incloure imatges, vídeos i textos";s:9:"textColor";s:7:"#ffffff";s:5:"color";s:7:"#1e73be";s:3:"url";s:0:"";s:9:"urlTarget";s:5:"_self";s:4:"type";s:4:"text";}i:3;a:9:{s:17:"titleElementTagID";s:1:"0";s:5:"title";s:8:"Imatge 2";s:23:"descriptionElementTagID";s:1:"0";s:11:"description";s:20:"Descripció imatge 2";s:3:"url";s:0:"";s:9:"urlTarget";s:5:"_self";s:15:"alternativeText";s:0:"";s:4:"type";s:10:"attachment";s:6:"postId";s:3:"127";}i:4;a:3:{s:7:"videoId";s:11:"ygwGTiGFGi0";s:17:"showRelatedVideos";s:5:"false";s:4:"type";s:5:"video";}i:5;a:9:{s:17:"titleElementTagID";s:1:"0";s:5:"title";s:8:"Imatge 3";s:23:"descriptionElementTagID";s:1:"0";s:11:"description";s:20:"Descripció imatge 3";s:3:"url";s:0:"";s:9:"urlTarget";s:5:"_self";s:15:"alternativeText";s:0:"";s:4:"type";s:10:"attachment";s:6:"postId";s:3:"126";}i:6;a:9:{s:17:"titleElementTagID";s:1:"0";s:5:"title";s:8:"Imatge 4";s:23:"descriptionElementTagID";s:1:"0";s:11:"description";s:20:"Descripció imatge 4";s:3:"url";s:0:"";s:9:"urlTarget";s:5:"_self";s:15:"alternativeText";s:0:"";s:4:"type";s:10:"attachment";s:6:"postId";s:3:"102";}}'),
(578, 126, '_wp_attached_file', '2014/09/exemple3.png'),
(579, 126, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:600;s:4:"file";s:20:"2014/09/exemple3.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"exemple3-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:20:"exemple3-300x225.png";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:9:"image/png";}s:9:"thumb-300";a:4:{s:4:"file";s:20:"exemple3-300x250.png";s:5:"width";i:300;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:9:"thumb-200";a:4:{s:4:"file";s:20:"exemple3-200x150.png";s:5:"width";i:200;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(580, 127, '_wp_attached_file', '2014/09/imatge_recurs1.png'),
(581, 127, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:180;s:6:"height";i:90;s:4:"file";s:26:"2014/09/imatge_recurs1.png";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:25:"imatge_recurs1-150x90.png";s:5:"width";i:150;s:6:"height";i:90;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(582, 128, '_wp_attached_file', '2014/09/exemple3b.png'),
(583, 128, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:600;s:4:"file";s:21:"2014/09/exemple3b.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"exemple3b-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"exemple3b-300x225.png";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:9:"image/png";}s:9:"thumb-300";a:4:{s:4:"file";s:21:"exemple3b-300x250.png";s:5:"width";i:300;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:9:"thumb-200";a:4:{s:4:"file";s:21:"exemple3b-200x150.png";s:5:"width";i:200;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(588, 115, '_thumbnail_id', '107'),
(593, 107, '_edit_lock', '1411378617:2'),
(594, 131, '_wp_attached_file', '2014/09/classe.png'),
(595, 131, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1194;s:6:"height";i:427;s:4:"file";s:18:"2014/09/classe.png";s:5:"sizes";a:5:{s:9:"thumbnail";a:4:{s:4:"file";s:18:"classe-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:18:"classe-300x107.png";s:5:"width";i:300;s:6:"height";i:107;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:19:"classe-1024x366.png";s:5:"width";i:1024;s:6:"height";i:366;s:9:"mime-type";s:9:"image/png";}s:9:"thumb-300";a:4:{s:4:"file";s:18:"classe-300x250.png";s:5:"width";i:300;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:9:"thumb-200";a:4:{s:4:"file";s:18:"classe-200x150.png";s:5:"width";i:200;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(596, 131, '_wp_attachment_image_alt', 'By ChinaFlag (Own work) [Public domain], via Wikimedia Commons'),
(605, 5, '_edit_lock', '1411383227:1'),
(609, 133, '_wp_attached_file', '2014/09/albertbachiller.png'),
(610, 133, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1244;s:6:"height";i:269;s:4:"file";s:27:"2014/09/albertbachiller.png";s:5:"sizes";a:5:{s:9:"thumbnail";a:4:{s:4:"file";s:27:"albertbachiller-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:26:"albertbachiller-300x64.png";s:5:"width";i:300;s:6:"height";i:64;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:28:"albertbachiller-1024x221.png";s:5:"width";i:1024;s:6:"height";i:221;s:9:"mime-type";s:9:"image/png";}s:9:"thumb-300";a:4:{s:4:"file";s:27:"albertbachiller-300x250.png";s:5:"width";i:300;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:9:"thumb-200";a:4:{s:4:"file";s:27:"albertbachiller-200x150.png";s:5:"width";i:200;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(611, 133, '_wp_attachment_image_alt', 'Il·lustració per Albert Bachiller'),
(623, 139, '_wp_attached_file', '2014/09/screeshot.png'),
(624, 139, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:524;s:6:"height";i:392;s:4:"file";s:21:"2014/09/screeshot.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"screeshot-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"screeshot-300x224.png";s:5:"width";i:300;s:6:"height";i:224;s:9:"mime-type";s:9:"image/png";}s:9:"thumb-300";a:4:{s:4:"file";s:21:"screeshot-300x250.png";s:5:"width";i:300;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:9:"thumb-200";a:4:{s:4:"file";s:21:"screeshot-200x150.png";s:5:"width";i:200;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(625, 140, '_edit_lock', '1411402131:2'),
(626, 140, '_edit_last', '2'),
(627, 140, 'settings', 'a:26:{s:9:"animation";s:5:"slide";s:10:"slideSpeed";s:1:"1";s:16:"descriptionSpeed";s:3:"0.4";s:13:"intervalSpeed";s:2:"20";s:13:"slidesPerView";s:1:"1";s:8:"maxWidth";s:1:"0";s:11:"aspectRatio";s:3:"3:1";s:6:"height";s:3:"200";s:14:"imageBehaviour";s:4:"crop";s:15:"showDescription";s:4:"true";s:15:"hideDescription";s:4:"true";s:27:"preserveSlideshowDimensions";s:5:"false";s:20:"enableResponsiveness";s:4:"true";s:4:"play";s:4:"true";s:4:"loop";s:4:"true";s:12:"pauseOnHover";s:4:"true";s:12:"controllable";s:4:"true";s:21:"hideNavigationButtons";s:5:"false";s:14:"showPagination";s:4:"true";s:14:"hidePagination";s:4:"true";s:12:"controlPanel";s:5:"false";s:16:"hideControlPanel";s:4:"true";s:15:"waitUntilLoaded";s:4:"true";s:15:"showLoadingIcon";s:4:"true";s:6:"random";s:5:"false";s:11:"avoidFilter";s:4:"true";}'),
(628, 140, 'styleSettings', 'a:1:{s:5:"style";s:15:"style-light.css";}'),
(629, 140, 'slides', 'a:1:{i:1;a:9:{s:17:"titleElementTagID";s:1:"0";s:5:"title";s:9:"screeshot";s:23:"descriptionElementTagID";s:1:"0";s:11:"description";s:0:"";s:3:"url";s:0:"";s:9:"urlTarget";s:5:"_self";s:15:"alternativeText";s:0:"";s:4:"type";s:10:"attachment";s:6:"postId";s:3:"139";}}'),
(642, 13, '_oembed_a47471043cf1f80e92ecf21d41f541f0', '<iframe width="500" height="400" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?visual=true&url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F138433301&show_artwork=true&maxwidth=500&maxheight=750"></iframe>'),
(647, 142, '_edit_lock', '1411407406:1'),
(648, 142, '_edit_last', '1'),
(649, 142, 'settings', 'a:26:{s:9:"animation";s:5:"slide";s:10:"slideSpeed";s:1:"1";s:16:"descriptionSpeed";s:3:"0.4";s:13:"intervalSpeed";s:2:"10";s:13:"slidesPerView";s:1:"2";s:8:"maxWidth";s:1:"0";s:11:"aspectRatio";s:3:"3:1";s:6:"height";s:3:"200";s:14:"imageBehaviour";s:4:"crop";s:15:"showDescription";s:4:"true";s:15:"hideDescription";s:4:"true";s:27:"preserveSlideshowDimensions";s:5:"false";s:20:"enableResponsiveness";s:4:"true";s:4:"play";s:4:"true";s:4:"loop";s:4:"true";s:12:"pauseOnHover";s:4:"true";s:12:"controllable";s:4:"true";s:21:"hideNavigationButtons";s:5:"false";s:14:"showPagination";s:4:"true";s:14:"hidePagination";s:4:"true";s:12:"controlPanel";s:5:"false";s:16:"hideControlPanel";s:4:"true";s:15:"waitUntilLoaded";s:4:"true";s:15:"showLoadingIcon";s:4:"true";s:6:"random";s:5:"false";s:11:"avoidFilter";s:4:"true";}'),
(650, 142, 'styleSettings', 'a:1:{s:5:"style";s:15:"style-light.css";}'),
(651, 142, 'slides', 'a:3:{i:1;a:9:{s:17:"titleElementTagID";s:1:"0";s:5:"title";s:8:"Imatge 1";s:23:"descriptionElementTagID";s:1:"0";s:11:"description";s:0:"";s:3:"url";s:0:"";s:9:"urlTarget";s:5:"_self";s:15:"alternativeText";s:0:"";s:4:"type";s:10:"attachment";s:6:"postId";s:3:"102";}i:2;a:9:{s:17:"titleElementTagID";s:1:"0";s:5:"title";s:8:"Imatge 2";s:23:"descriptionElementTagID";s:1:"0";s:11:"description";s:0:"";s:3:"url";s:0:"";s:9:"urlTarget";s:5:"_self";s:15:"alternativeText";s:0:"";s:4:"type";s:10:"attachment";s:6:"postId";s:3:"126";}i:3;a:9:{s:17:"titleElementTagID";s:1:"0";s:5:"title";s:8:"Imatge 3";s:23:"descriptionElementTagID";s:1:"0";s:11:"description";s:0:"";s:3:"url";s:0:"";s:9:"urlTarget";s:5:"_self";s:15:"alternativeText";s:0:"";s:4:"type";s:10:"attachment";s:6:"postId";s:3:"128";}}'),
(666, 145, 'gce_feed_url', 'xtec.cat_d8jr0i0n3n9patiiq361c5oicc@group.calendar.google.com'),
(667, 145, 'gce_retrieve_from', 'today'),
(668, 145, 'gce_retrieve_until', 'end_time'),
(669, 145, 'gce_retrieve_max', '25'),
(672, 145, 'gce_cache', '300'),
(673, 145, 'gce_multi_day_events', '1'),
(674, 145, 'gce_display_mode', 'grid'),
(677, 145, 'old_gce_id', '1'),
(679, 145, 'gce_expand_recurring', '1'),
(680, 145, 'gce_paging', '1'),
(681, 145, 'gce_list_max_num', '7'),
(682, 145, 'gce_list_max_length', 'days'),
(684, 145, 'gce_list_start_offset_direction', 'back'),
(690, 145, 'gce_feed_start', '1'),
(691, 145, 'gce_feed_start_interval', 'months'),
(692, 145, 'gce_feed_end', '2'),
(693, 145, 'gce_feed_end_interval', 'years'),
(704, 145, '_edit_lock', '1422268574:2'),
(705, 145, '_edit_last', '2'),
(706, 145, 'gce_display_start', 'none'),
(707, 145, 'gce_display_end', 'none'),
(709, 145, 'gce_widget_paging_interval', '604800'),
(728, 148, '_menu_item_type', 'taxonomy'),
(729, 148, '_menu_item_menu_item_parent', '92'),
(730, 148, '_menu_item_object_id', '2'),
(731, 148, '_menu_item_object', 'category'),
(732, 148, '_menu_item_target', ''),
(733, 148, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(734, 148, '_menu_item_xfn', ''),
(735, 148, '_menu_item_url', ''),
(737, 149, '_menu_item_type', 'taxonomy'),
(738, 149, '_menu_item_menu_item_parent', '92'),
(739, 149, '_menu_item_object_id', '5'),
(740, 149, '_menu_item_object', 'category'),
(741, 149, '_menu_item_target', ''),
(742, 149, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(743, 149, '_menu_item_xfn', ''),
(744, 149, '_menu_item_url', ''),
(749, 150, '_menu_item_type', 'custom'),
(750, 150, '_menu_item_menu_item_parent', '0'),
(751, 150, '_menu_item_object_id', '150'),
(752, 150, '_menu_item_object', 'custom'),
(753, 150, '_menu_item_target', ''),
(754, 150, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(755, 150, '_menu_item_xfn', ''),
(756, 150, '_menu_item_url', '#'),
(758, 151, '_menu_item_type', 'custom'),
(759, 151, '_menu_item_menu_item_parent', '0'),
(760, 151, '_menu_item_object_id', '151'),
(761, 151, '_menu_item_object', 'custom'),
(762, 151, '_menu_item_target', ''),
(763, 151, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(764, 151, '_menu_item_xfn', ''),
(765, 151, '_menu_item_url', '#'),
(767, 152, '_menu_item_type', 'custom'),
(768, 152, '_menu_item_menu_item_parent', '0'),
(769, 152, '_menu_item_object_id', '152'),
(770, 152, '_menu_item_object', 'custom'),
(771, 152, '_menu_item_target', ''),
(772, 152, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(773, 152, '_menu_item_xfn', ''),
(774, 152, '_menu_item_url', '#'),
(776, 153, '_menu_item_type', 'custom'),
(777, 153, '_menu_item_menu_item_parent', '0'),
(778, 153, '_menu_item_object_id', '153'),
(779, 153, '_menu_item_object', 'custom'),
(780, 153, '_menu_item_target', ''),
(781, 153, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(782, 153, '_menu_item_xfn', ''),
(783, 153, '_menu_item_url', '#'),
(785, 154, '_menu_item_type', 'custom'),
(786, 154, '_menu_item_menu_item_parent', '0'),
(787, 154, '_menu_item_object_id', '154'),
(788, 154, '_menu_item_object', 'custom'),
(789, 154, '_menu_item_target', ''),
(790, 154, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(791, 154, '_menu_item_xfn', ''),
(792, 154, '_menu_item_url', '#'),
(794, 155, '_menu_item_type', 'custom'),
(795, 155, '_menu_item_menu_item_parent', '0'),
(796, 155, '_menu_item_object_id', '155'),
(797, 155, '_menu_item_object', 'custom'),
(798, 155, '_menu_item_target', ''),
(799, 155, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(800, 155, '_menu_item_xfn', ''),
(801, 155, '_menu_item_url', '#'),
(803, 156, '_wp_attached_file', '2015/01/foto-classe.png'),
(804, 156, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:640;s:6:"height";i:469;s:4:"file";s:23:"2015/01/foto-classe.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:23:"foto-classe-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:23:"foto-classe-300x219.png";s:5:"width";i:300;s:6:"height";i:219;s:9:"mime-type";s:9:"image/png";}s:9:"thumb-300";a:4:{s:4:"file";s:23:"foto-classe-300x250.png";s:5:"width";i:300;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:9:"thumb-200";a:4:{s:4:"file";s:23:"foto-classe-200x150.png";s:5:"width";i:200;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(809, 157, '_menu_item_type', 'taxonomy'),
(810, 157, '_menu_item_menu_item_parent', '0'),
(811, 157, '_menu_item_object_id', '8'),
(812, 157, '_menu_item_object', 'category'),
(813, 157, '_menu_item_target', ''),
(814, 157, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(815, 157, '_menu_item_xfn', ''),
(816, 157, '_menu_item_url', ''),
(818, 158, '_menu_item_type', 'taxonomy'),
(819, 158, '_menu_item_menu_item_parent', '0'),
(820, 158, '_menu_item_object_id', '3'),
(821, 158, '_menu_item_object', 'category'),
(822, 158, '_menu_item_target', ''),
(823, 158, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(824, 158, '_menu_item_xfn', ''),
(825, 158, '_menu_item_url', ''),
(827, 159, '_menu_item_type', 'taxonomy'),
(828, 159, '_menu_item_menu_item_parent', '0'),
(829, 159, '_menu_item_object_id', '9'),
(830, 159, '_menu_item_object', 'category'),
(831, 159, '_menu_item_target', ''),
(832, 159, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(833, 159, '_menu_item_xfn', ''),
(834, 159, '_menu_item_url', ''),
(836, 160, '_menu_item_type', 'taxonomy'),
(837, 160, '_menu_item_menu_item_parent', '0'),
(838, 160, '_menu_item_object_id', '10'),
(839, 160, '_menu_item_object', 'category'),
(840, 160, '_menu_item_target', ''),
(841, 160, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(842, 160, '_menu_item_xfn', ''),
(843, 160, '_menu_item_url', ''),
(845, 161, '_menu_item_type', 'taxonomy'),
(846, 161, '_menu_item_menu_item_parent', '0'),
(847, 161, '_menu_item_object_id', '11'),
(848, 161, '_menu_item_object', 'category'),
(849, 161, '_menu_item_target', ''),
(850, 161, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(851, 161, '_menu_item_xfn', ''),
(852, 161, '_menu_item_url', ''),
(854, 162, '_menu_item_type', 'taxonomy'),
(855, 162, '_menu_item_menu_item_parent', '0'),
(856, 162, '_menu_item_object_id', '13'),
(857, 162, '_menu_item_object', 'category'),
(858, 162, '_menu_item_target', ''),
(859, 162, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(860, 162, '_menu_item_xfn', ''),
(861, 162, '_menu_item_url', ''),
(863, 163, '_menu_item_type', 'taxonomy'),
(864, 163, '_menu_item_menu_item_parent', '0'),
(865, 163, '_menu_item_object_id', '12'),
(866, 163, '_menu_item_object', 'category'),
(867, 163, '_menu_item_target', ''),
(868, 163, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(869, 163, '_menu_item_xfn', ''),
(870, 163, '_menu_item_url', ''),
(872, 164, '_menu_item_type', 'taxonomy'),
(873, 164, '_menu_item_menu_item_parent', '0'),
(874, 164, '_menu_item_object_id', '14'),
(875, 164, '_menu_item_object', 'category'),
(876, 164, '_menu_item_target', ''),
(877, 164, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(878, 164, '_menu_item_xfn', ''),
(879, 164, '_menu_item_url', ''),
(881, 165, '_menu_item_type', 'taxonomy'),
(882, 165, '_menu_item_menu_item_parent', '0'),
(883, 165, '_menu_item_object_id', '15'),
(884, 165, '_menu_item_object', 'category'),
(885, 165, '_menu_item_target', ''),
(886, 165, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(887, 165, '_menu_item_xfn', ''),
(888, 165, '_menu_item_url', ''),
(893, 38, '_template_layout', '2c-l'),
(894, 145, 'gce_paging_widget', '1');

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=168 ;

--
-- Bolcant dades de la taula `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(2, 1, '2014-09-12 11:10:47', '2014-09-12 09:10:47', 'Aquesta és una pàgina d''exemple. És diferent d''una entrada del bloc perquè romandrà sempre al mateix lloc i es mostrarà al menú de navegació de la pàgina web (a molts temes). La majoria de gent comença amb una pàgina quant a que els presenta als visitants potencials de la pàgina web. Podria ser quelcom com això:\n\n<blockquote>Hola a tothom! Treballo de missatger en bicicleta de dia, sóc un aspirant a actor de nit, i aquest és el meu bloc. Visc a Barcelona, tinc un gos meravellós que es diu Pep, i m''agraden les calçotades (i quedar atrapat per la pluja.)</blockquote>\n\n... o potser això:\n<blockquote>La companyia Enginys XYZ es va fundar el 1971, i ha proveït al públic d''enginys de qualitat des de llavors. Ubicada a Gotham City, XYZ dóna treball a més de 2.000 persones i fa tot tipus de coses impressionants per a la comunitat de Gotham.</blockquote>\n\nCom a blocaire nou o nova del WordPress, hauríeu d''anar al <a href="http://pwc-int.educacio.intranet/agora/masterpri/wp-admin/">tauler</a> per suprimir aquesta pàgina i crear-ne de noves amb el vostre contingut. A passar-ho bé!', 'Pàgina d''exemple', '', 'publish', 'closed', 'closed', '', 'pagina-exemple', '', '', '2014-09-12 11:10:47', '2014-09-12 09:10:47', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?page_id=2', 0, 'page', '', 0),
(5, 2, '2014-09-12 09:30:30', '2014-09-12 09:30:30', '', 'Activitat', '', 'publish', 'closed', 'closed', '', 'activitat', '', '', '2014-09-12 09:30:30', '2014-09-12 09:30:30', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?page_id=5', 0, 'page', '', 0),
(6, 2, '2014-09-12 09:30:30', '2014-09-12 09:30:30', '', 'Membres', '', 'publish', 'closed', 'closed', '', 'membres', '', '', '2014-09-12 09:30:30', '2014-09-12 09:30:30', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?page_id=6', 0, 'page', '', 0),
(7, 2, '2014-09-17 15:07:41', '2014-09-17 15:07:41', 'Pàgina mare de les pàgines d''inici', 'Pàgines d''inici', '', 'publish', 'closed', 'closed', '', 'pagines-dinici', '', '', '2014-09-17 15:07:41', '2014-09-17 15:07:41', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?page_id=7', 0, 'page', '', 0),
(8, 2, '2014-09-17 15:07:41', '2014-09-17 15:07:41', 'Pàgina mare de les pàgines d''inici', 'Pàgines d''inici', '', 'inherit', 'open', 'open', '', '7-revision-v1', '', '', '2014-09-17 15:07:41', '2014-09-17 15:07:41', '', 7, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/7-revision-v1/', 0, 'revision', '', 0),
(9, 2, '2014-09-17 15:08:18', '2014-09-17 15:08:18', '', 'Pagina d''inici buida', '', 'publish', 'closed', 'closed', '', 'pagina-dinici-buida', '', '', '2014-09-17 15:08:18', '2014-09-17 15:08:18', '', 7, 'http://pwc-int.educacio.intranet/agora/masterpri/?page_id=9', 0, 'page', '', 0),
(10, 2, '2014-09-17 15:08:18', '2014-09-17 15:08:18', '', 'Pagina d''inici buida', '', 'inherit', 'open', 'open', '', '9-revision-v1', '', '', '2014-09-17 15:08:18', '2014-09-17 15:08:18', '', 9, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/9-revision-v1/', 0, 'revision', '', 0),
(11, 2, '2014-09-18 10:50:51', '2014-09-18 10:50:51', '', 'logo-escola', '', 'inherit', 'open', 'open', '', 'logo-escola', '', '', '2014-09-18 10:50:51', '2014-09-18 10:50:51', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/wp-content/uploads/usu6/2014/09/logo-escola.png', 0, 'attachment', 'image/png', 0),
(13, 2, '2014-09-18 11:49:40', '2014-09-18 11:49:40', 'https://soundcloud.com/institut-sabadell/sophie-message\r\n\r\nUn exemple de fitxer d''audio disponible directament des de la targeta resum. Dins de l''article, a la caixa "Paràmetres", heu de marcar la casella "Mostra el contingut sencer".', 'Notícia 1', '', 'publish', 'open', 'open', '', 'noticia', '', '', '2014-09-22 16:36:56', '2014-09-22 16:36:56', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=13', 0, 'post', '', 0),
(16, 2, '2014-09-18 11:51:02', '2014-09-18 11:51:02', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean erat dolor, aliquet vitae ligula suscipit, bibendum malesuada augue. Aliquam sollicitudin elementum neque non ornare. Nam varius varius elementum. Vivamus placerat consectetur dolor eget ornare. Nam semper id ipsum condimentum laoreet. Proin sollicitudin elit ut ligula hendrerit, et hendrerit ante condimentum. Aliquam suscipit feugiat velit, at vehicula lorem pharetra quis.', 'Notícia', '', 'inherit', 'open', 'open', '', '13-revision-v1', '', '', '2014-09-18 11:51:02', '2014-09-18 11:51:02', '', 13, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/13-revision-v1/', 0, 'revision', '', 0),
(17, 2, '2014-09-18 11:51:31', '2014-09-18 11:51:31', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean erat dolor, aliquet vitae ligula suscipit, bibendum malesuada augue. Aliquam sollicitudin elementum neque non ornare. Nam varius varius elementum. Vivamus placerat consectetur dolor eget ornare. Nam semper id ipsum condimentum laoreet. Proin sollicitudin elit ut ligula hendrerit, et hendrerit ante condimentum. Aliquam suscipit feugiat velit, at vehicula lorem pharetra quis.', 'Notícia 1', '', 'inherit', 'open', 'open', '', '13-revision-v1', '', '', '2014-09-18 11:51:31', '2014-09-18 11:51:31', '', 13, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/13-revision-v1/', 0, 'revision', '', 0),
(18, 2, '2014-09-18 11:58:18', '2014-09-18 11:58:18', '<iframe src="//www.youtube.com/embed/ygwGTiGFGi0?rel=0" width="560" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe>\r\n\r\nUn exemple de video disponible directament des de la targeta resum. Dins de l’article, a la caixa “Paràmetres”, heu de marcar la casella “Mostra el contingut sencer”', 'Notícia 2', '', 'publish', 'open', 'open', '', 'noticia-2', '', '', '2014-09-22 16:36:33', '2014-09-22 16:36:33', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=18', 0, 'post', '', 0),
(20, 2, '2014-09-18 11:58:18', '2014-09-18 11:58:18', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean erat dolor, aliquet vitae ligula suscipit, bibendum malesuada augue. Aliquam sollicitudin elementum neque non ornare. Nam varius varius elementum. Vivamus placerat consectetur dolor eget ornare. Nam semper id ipsum condimentum laoreet. Proin sollicitudin elit ut ligula hendrerit, et hendrerit ante condimentum. Aliquam suscipit feugiat velit, at vehicula lorem pharetra quis.', 'Notícia 2', '', 'inherit', 'open', 'open', '', '18-revision-v1', '', '', '2014-09-18 11:58:18', '2014-09-18 11:58:18', '', 18, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/18-revision-v1/', 0, 'revision', '', 0),
(22, 2, '2014-09-18 12:19:57', '2014-09-18 12:19:57', 'Aquesta secció pot contenir totes les pàgines necessàries per a oferir una descripció general de l''escola: ubicació, història, instal·lacions, equip docent, consell escolar, pla de qualitat, calendari, salut, informacions pràctiques, normativa...\r\n\r\nEn la maqueta inicial s''inclouen algunes d''aquestes pàgines amb contingut simulat. L''administrador/a pot editar-les, eliminar-les o crear-ne de noves des del tauler. És important que a la caixa <em>Atributs</em> de les pàgines hi consti com a <em>pare/mare</em> la pàgina "<em>L''escola</em>", i que tinguin seleccionada la plantilla "<em>Menú lateral</em>".', 'L''escola', '', 'publish', 'closed', 'closed', '', 'lescola', '', '', '2014-09-18 12:21:26', '2014-09-18 12:21:26', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?page_id=22', 0, 'page', '', 0),
(23, 2, '2014-09-18 12:19:57', '2014-09-18 12:19:57', 'Aquesta secció pot contenir totes les pàgines necessàries per a oferir una descripció general de l''escola: ubicació, història, instal·lacions, equip docent, consell escolar, pla de qualitat, calendari, salut, informacions pràctiques, normativa...\r\n\r\nEn la maqueta inicial s''inclouen algunes d''aquestes pàgines amb contingut simulat. L''administrador/a pot editar-les, eliminar-les o crear-ne de noves des del tauler. És important que a la caixa <em>Atributs</em> de les pàgines hi consti com a <em>pare/mare</em> la pàgina "<em>L''escola</em>", i que tinguin seleccionada la plantilla "<em>Menú lateral</em>".', 'L''escola', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2014-09-18 12:19:57', '2014-09-18 12:19:57', '', 22, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/22-revision-v1/', 0, 'revision', '', 0),
(24, 2, '2014-09-18 12:23:15', '2014-09-18 12:23:15', '<p style="color: #666666;"><strong>Escola l''Arany</strong>\r\nPlaça de la Vila, 14\r\n01234 Abella de Xerta</p>\r\nTel. 901 234 567\r\nescolalarany@xtec.cat\r\n\r\n<iframe style="border: 0;" src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d95122.2542300733!2d1.53775!3d41.837547!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sca!2sus!4v1410948001907" width="600" height="450" frameborder="0"></iframe>\r\n\r\n<strong>Com arribar-hi:</strong>\r\n\r\n<strong>Tren:</strong> Estació Abella centre de la línia 1\r\n<strong>Bus:</strong> Línies L3 i L5\r\n\r\n&nbsp;', 'On som', '', 'publish', 'closed', 'closed', '', 'on-som', '', '', '2014-09-18 12:23:15', '2014-09-18 12:23:15', '', 22, 'http://pwc-int.educacio.intranet/agora/masterpri/?page_id=24', 10, 'page', '', 0),
(25, 2, '2014-09-18 12:23:15', '2014-09-18 12:23:15', '<p style="color: #666666;"><strong>Escola l''Arany</strong>\r\nPlaça de la Vila, 14\r\n01234 Abella de Xerta</p>\r\nTel. 901 234 567\r\nescolalarany@xtec.cat\r\n\r\n<iframe style="border: 0;" src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d95122.2542300733!2d1.53775!3d41.837547!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sca!2sus!4v1410948001907" width="600" height="450" frameborder="0"></iframe>\r\n\r\n<strong>Com arribar-hi:</strong>\r\n\r\n<strong>Tren:</strong> Estació Abella centre de la línia 1\r\n<strong>Bus:</strong> Línies L3 i L5\r\n\r\n&nbsp;', 'On som', '', 'inherit', 'open', 'open', '', '24-revision-v1', '', '', '2014-09-18 12:23:15', '2014-09-18 12:23:15', '', 24, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/24-revision-v1/', 0, 'revision', '', 0),
(26, 2, '2014-09-18 12:24:32', '2014-09-18 12:24:32', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla facilisis vestibulum massa, ac porta dolor venenatis sit amet. Maecenas vel convallis nibh. Donec ut sem non arcu egestas viverra. Nam viverra ut eros id porttitor. Aliquam erat volutpat. Vivamus turpis magna, commodo quis ipsum sed, elementum maximus dui. Nam vulputate purus massa, in condimentum justo mattis ut. Sed efficitur finibus quam. Vestibulum ac dignissim purus. Cras placerat orci enim, eget volutpat enim ultricies non. Donec non diam sit amet nunc consequat faucibus eu ac arcu. Aliquam tempor at quam at porttitor. Vestibulum commodo mattis ligula, et viverra lectus mattis vitae. Donec luctus finibus purus non eleifend. Curabitur sit amet libero nunc.\r\n\r\nVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec auctor justo id tincidunt viverra. Suspendisse potenti. Suspendisse tempor tristique lacus, sit amet imperdiet tellus porta et. Sed enim elit, ultricies vitae porta eu, dignissim ac felis. Nulla lacinia ligula suscipit consectetur vehicula. Nullam varius, nulla id facilisis tincidunt, massa lacus tincidunt velit, vitae bibendum urna nisl a arcu. Nullam tincidunt venenatis libero eu efficitur.\r\n\r\nCurabitur eget scelerisque nibh, in viverra libero. Vestibulum iaculis congue nisl ut eleifend. Fusce ultricies diam nec lobortis fringilla. Suspendisse tincidunt posuere lectus, a porttitor sem consequat ac. Pellentesque eget feugiat orci. Vivamus semper imperdiet mi a sodales. Sed posuere semper lobortis. Maecenas ut est consequat, luctus ipsum posuere, posuere tortor. Donec dictum lacus orci.\r\n\r\nNullam nunc justo, consequat non pretium id, rutrum id nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis quis consectetur nulla. Curabitur pretium sollicitudin orci vitae egestas. Nulla facilisi. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec condimentum nibh mattis neque tempus eleifend.', 'Història', '', 'publish', 'closed', 'closed', '', 'historia', '', '', '2014-09-18 12:24:32', '2014-09-18 12:24:32', '', 22, 'http://pwc-int.educacio.intranet/agora/masterpri/?page_id=26', 20, 'page', '', 0),
(27, 2, '2014-09-18 12:24:32', '2014-09-18 12:24:32', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla facilisis vestibulum massa, ac porta dolor venenatis sit amet. Maecenas vel convallis nibh. Donec ut sem non arcu egestas viverra. Nam viverra ut eros id porttitor. Aliquam erat volutpat. Vivamus turpis magna, commodo quis ipsum sed, elementum maximus dui. Nam vulputate purus massa, in condimentum justo mattis ut. Sed efficitur finibus quam. Vestibulum ac dignissim purus. Cras placerat orci enim, eget volutpat enim ultricies non. Donec non diam sit amet nunc consequat faucibus eu ac arcu. Aliquam tempor at quam at porttitor. Vestibulum commodo mattis ligula, et viverra lectus mattis vitae. Donec luctus finibus purus non eleifend. Curabitur sit amet libero nunc.\r\n\r\nVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec auctor justo id tincidunt viverra. Suspendisse potenti. Suspendisse tempor tristique lacus, sit amet imperdiet tellus porta et. Sed enim elit, ultricies vitae porta eu, dignissim ac felis. Nulla lacinia ligula suscipit consectetur vehicula. Nullam varius, nulla id facilisis tincidunt, massa lacus tincidunt velit, vitae bibendum urna nisl a arcu. Nullam tincidunt venenatis libero eu efficitur.\r\n\r\nCurabitur eget scelerisque nibh, in viverra libero. Vestibulum iaculis congue nisl ut eleifend. Fusce ultricies diam nec lobortis fringilla. Suspendisse tincidunt posuere lectus, a porttitor sem consequat ac. Pellentesque eget feugiat orci. Vivamus semper imperdiet mi a sodales. Sed posuere semper lobortis. Maecenas ut est consequat, luctus ipsum posuere, posuere tortor. Donec dictum lacus orci.\r\n\r\nNullam nunc justo, consequat non pretium id, rutrum id nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis quis consectetur nulla. Curabitur pretium sollicitudin orci vitae egestas. Nulla facilisi. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec condimentum nibh mattis neque tempus eleifend.', 'Història', '', 'inherit', 'open', 'open', '', '26-revision-v1', '', '', '2014-09-18 12:24:32', '2014-09-18 12:24:32', '', 26, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/26-revision-v1/', 0, 'revision', '', 0),
(28, 2, '2014-09-18 12:29:35', '2014-09-18 12:29:35', '<p style="color: #444444;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nisl quam, lobortis et interdum finibus, aliquam eget ligula. Donec nec ex et leo ultrices dignissim. Suspendisse quis tortor porta, rhoncus velit sit amet, convallis est. In lobortis dignissim convallis. Integer faucibus urna at magna mattis, id accumsan lacus posuere. Quisque vitae ipsum erat. Cras varius placerat justo. Vivamus maximus finibus hendrerit. Nullam accumsan quam pulvinar odio sollicitudin feugiat. Praesent vehicula dolor mauris, in semper risus gravida quis.</p>\r\n<p style="color: #444444;">Cras vitae porta turpis. Proin pharetra ac lacus in tempor. Vestibulum ullamcorper neque quis elit faucibus, at sodales est pretium. Suspendisse ac mauris in enim eleifend porttitor. Sed quis dolor laoreet, eleifend diam non, tincidunt nisl. Nulla sed venenatis eros. Ut non neque cursus, condimentum leo consequat, tempus ligula. Nulla vel orci sed sapien tincidunt fermentum.</p>', 'Consell escolar', '', 'publish', 'closed', 'closed', '', 'consell-escolar', '', '', '2014-09-18 12:29:35', '2014-09-18 12:29:35', '', 22, 'http://pwc-int.educacio.intranet/agora/masterpri/?page_id=28', 30, 'page', '', 0),
(29, 2, '2014-09-18 12:29:35', '2014-09-18 12:29:35', '<p style="color: #444444;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nisl quam, lobortis et interdum finibus, aliquam eget ligula. Donec nec ex et leo ultrices dignissim. Suspendisse quis tortor porta, rhoncus velit sit amet, convallis est. In lobortis dignissim convallis. Integer faucibus urna at magna mattis, id accumsan lacus posuere. Quisque vitae ipsum erat. Cras varius placerat justo. Vivamus maximus finibus hendrerit. Nullam accumsan quam pulvinar odio sollicitudin feugiat. Praesent vehicula dolor mauris, in semper risus gravida quis.</p>\r\n<p style="color: #444444;">Cras vitae porta turpis. Proin pharetra ac lacus in tempor. Vestibulum ullamcorper neque quis elit faucibus, at sodales est pretium. Suspendisse ac mauris in enim eleifend porttitor. Sed quis dolor laoreet, eleifend diam non, tincidunt nisl. Nulla sed venenatis eros. Ut non neque cursus, condimentum leo consequat, tempus ligula. Nulla vel orci sed sapien tincidunt fermentum.</p>', 'Consell escolar', '', 'inherit', 'open', 'open', '', '28-revision-v1', '', '', '2014-09-18 12:29:35', '2014-09-18 12:29:35', '', 28, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/28-revision-v1/', 0, 'revision', '', 0),
(30, 2, '2014-09-18 12:30:23', '2014-09-18 12:30:23', 'Sed quis dolor laoreet, eleifend diam non, tincidunt nisl. Nulla sed venenatis eros. Ut non neque cursus, condimentum leo consequat, tempus ligula. Nulla vel orci sed sapien tincidunt fermentum.\r\n\r\n[slideshow_deploy id=''142'']\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce in feugiat urna, a sagittis nisl. Proin fringilla turpis sed orci ultricies commodo. Morbi ac magna pulvinar lacus feugiat placerat non eu urna. Mauris laoreet nisi tellus, vel vehicula erat ornare mollis. Pellentesque justo erat, maximus a varius vitae, suscipit vel augue. Vivamus mattis sed metus sit amet auctor. Curabitur vel enim enim. Cras cursus leo lorem, ac dictum nibh bibendum non. Maecenas ac mauris felis. Phasellus euismod luctus augue ac vehicula. Sed dignissim libero vitae consequat luctus. Maecenas quis ornare tellus. Aliquam erat volutpat.', 'Instal·lacions', '', 'publish', 'closed', 'closed', '', 'instal%c2%b7lacions', '', '', '2014-09-22 17:09:36', '2014-09-22 17:09:36', '', 22, 'http://pwc-int.educacio.intranet/agora/masterpri/?page_id=30', 40, 'page', '', 0),
(31, 2, '2014-09-18 12:30:23', '2014-09-18 12:30:23', 'Sed quis dolor laoreet, eleifend diam non, tincidunt nisl. Nulla sed venenatis eros. Ut non neque cursus, condimentum leo consequat, tempus ligula. Nulla vel orci sed sapien tincidunt fermentum.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce in feugiat urna, a sagittis nisl. Proin fringilla turpis sed orci ultricies commodo. Morbi ac magna pulvinar lacus feugiat placerat non eu urna. Mauris laoreet nisi tellus, vel vehicula erat ornare mollis. Pellentesque justo erat, maximus a varius vitae, suscipit vel augue. Vivamus mattis sed metus sit amet auctor. Curabitur vel enim enim. Cras cursus leo lorem, ac dictum nibh bibendum non. Maecenas ac mauris felis. Phasellus euismod luctus augue ac vehicula. Sed dignissim libero vitae consequat luctus. Maecenas quis ornare tellus. Aliquam erat volutpat.', 'Instal·lacions', '', 'inherit', 'open', 'open', '', '30-revision-v1', '', '', '2014-09-18 12:30:23', '2014-09-18 12:30:23', '', 30, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/30-revision-v1/', 0, 'revision', '', 0),
(32, 2, '2014-09-18 12:31:33', '2014-09-18 12:31:33', '<h4><strong>Inici de curs:</strong></h4>\r\n15 de setembre de 2014\r\n<h4><strong>Vacances:</strong></h4>\r\nDel 24 de desembre de 2014 al 7 de gener de 2015  (ambdós inclosos)\r\n\r\nDel 28 de març al 6 d’abril de 2015 (ambdós inclosos)\r\n\r\nA partir del 20 de juny de 2015\r\n<h4><strong>Dies festius de lliure disposició:</strong></h4>\r\n3 de novembre de 2014\r\n\r\n16 de febrer de 2015\r\n\r\n22 de maig de 2015\r\n<h4><strong>Jornada compactada:</strong></h4>\r\n23 de desembre de 2014 i del 8 al 19 de juny de   2015 (ambdós inclosos)\r\n\r\nL’<b>horari lectiu</b> del centre és de 9 a 12,30 h i de 15,00 a 16,30 h per a tots els alumnes del centre. El dia 20 de desembre de 2013 i a partir del 9 de juny de 2014 es realitza horari compactat de 9 a 13h. (Els alumnes que utilitzen el servei de menjador surten a les 15:00h.)\r\n\r\nPer als alumnes que inicien l’escolarització a P3 s’organitza un breu període d’adaptació que suposa una certa modificació dels horaris dels dos primers dies de classe, i que es fa saber a les famílies en les reunions prèvies corresponents.', 'Calendari del curs', '', 'publish', 'closed', 'closed', '', 'calendari-del-curs', '', '', '2014-09-18 12:31:33', '2014-09-18 12:31:33', '', 22, 'http://pwc-int.educacio.intranet/agora/masterpri/?page_id=32', 50, 'page', '', 0),
(33, 2, '2014-09-18 12:31:33', '2014-09-18 12:31:33', '<h4><strong>Inici de curs:</strong></h4>\r\n15 de setembre de 2014\r\n<h4><strong>Vacances:</strong></h4>\r\nDel 24 de desembre de 2014 al 7 de gener de 2015  (ambdós inclosos)\r\n\r\nDel 28 de març al 6 d’abril de 2015 (ambdós inclosos)\r\n\r\nA partir del 20 de juny de 2015\r\n<h4><strong>Dies festius de lliure disposició:</strong></h4>\r\n3 de novembre de 2014\r\n\r\n16 de febrer de 2015\r\n\r\n22 de maig de 2015\r\n<h4><strong>Jornada compactada:</strong></h4>\r\n23 de desembre de 2014 i del 8 al 19 de juny de   2015 (ambdós inclosos)\r\n\r\nL’<b>horari lectiu</b> del centre és de 9 a 12,30 h i de 15,00 a 16,30 h per a tots els alumnes del centre. El dia 20 de desembre de 2013 i a partir del 9 de juny de 2014 es realitza horari compactat de 9 a 13h. (Els alumnes que utilitzen el servei de menjador surten a les 15:00h.)\r\n\r\nPer als alumnes que inicien l’escolarització a P3 s’organitza un breu període d’adaptació que suposa una certa modificació dels horaris dels dos primers dies de classe, i que es fa saber a les famílies en les reunions prèvies corresponents.', 'Calendari del curs', '', 'inherit', 'open', 'open', '', '32-revision-v1', '', '', '2014-09-18 12:31:33', '2014-09-18 12:31:33', '', 32, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/32-revision-v1/', 0, 'revision', '', 0),
(34, 2, '2014-09-18 12:32:18', '2014-09-18 12:32:18', '<p style="color: #444444;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nisl quam, lobortis et interdum finibus, aliquam eget ligula. Donec nec ex et leo ultrices dignissim. Suspendisse quis tortor porta, rhoncus velit sit amet, convallis est. In lobortis dignissim convallis. Integer faucibus urna at magna mattis, id accumsan lacus posuere. Quisque vitae ipsum erat. Cras varius placerat justo. Vivamus maximus finibus hendrerit. Nullam accumsan quam pulvinar odio sollicitudin feugiat. Praesent vehicula dolor mauris, in semper risus gravida quis.</p>\r\n<p style="color: #444444;">Cras vitae porta turpis. Proin pharetra ac lacus in tempor. Vestibulum ullamcorper neque quis elit faucibus, at sodales est pretium. Suspendisse ac mauris in enim eleifend porttitor. Sed quis dolor laoreet, eleifend diam non, tincidunt nisl. Nulla sed venenatis eros. Ut non neque cursus, condimentum leo consequat, tempus ligula. Nulla vel orci sed sapien tincidunt fermentum.</p>\r\n<p style="color: #444444;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce in feugiat urna, a sagittis nisl. Proin fringilla turpis sed orci ultricies commodo. Morbi ac magna pulvinar lacus feugiat placerat non eu urna. Mauris laoreet nisi tellus, vel vehicula erat ornare mollis. Pellentesque justo erat, maximus a varius vitae, suscipit vel augue. Vivamus mattis sed metus sit amet auctor. Curabitur vel enim enim. Cras cursus leo lorem, ac dictum nibh bibendum non. Maecenas ac mauris felis. Phasellus euismod luctus augue ac vehicula. Sed dignissim libero vitae consequat luctus. Maecenas quis ornare tellus. Aliquam erat volutpat.</p>', 'Oferta educativa', '', 'publish', 'closed', 'closed', '', 'oferta-educativa', '', '', '2014-09-18 12:32:18', '2014-09-18 12:32:18', '', 22, 'http://pwc-int.educacio.intranet/agora/masterpri/?page_id=34', 60, 'page', '', 0),
(35, 2, '2014-09-18 12:32:18', '2014-09-18 12:32:18', '<p style="color: #444444;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nisl quam, lobortis et interdum finibus, aliquam eget ligula. Donec nec ex et leo ultrices dignissim. Suspendisse quis tortor porta, rhoncus velit sit amet, convallis est. In lobortis dignissim convallis. Integer faucibus urna at magna mattis, id accumsan lacus posuere. Quisque vitae ipsum erat. Cras varius placerat justo. Vivamus maximus finibus hendrerit. Nullam accumsan quam pulvinar odio sollicitudin feugiat. Praesent vehicula dolor mauris, in semper risus gravida quis.</p>\r\n<p style="color: #444444;">Cras vitae porta turpis. Proin pharetra ac lacus in tempor. Vestibulum ullamcorper neque quis elit faucibus, at sodales est pretium. Suspendisse ac mauris in enim eleifend porttitor. Sed quis dolor laoreet, eleifend diam non, tincidunt nisl. Nulla sed venenatis eros. Ut non neque cursus, condimentum leo consequat, tempus ligula. Nulla vel orci sed sapien tincidunt fermentum.</p>\r\n<p style="color: #444444;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce in feugiat urna, a sagittis nisl. Proin fringilla turpis sed orci ultricies commodo. Morbi ac magna pulvinar lacus feugiat placerat non eu urna. Mauris laoreet nisi tellus, vel vehicula erat ornare mollis. Pellentesque justo erat, maximus a varius vitae, suscipit vel augue. Vivamus mattis sed metus sit amet auctor. Curabitur vel enim enim. Cras cursus leo lorem, ac dictum nibh bibendum non. Maecenas ac mauris felis. Phasellus euismod luctus augue ac vehicula. Sed dignissim libero vitae consequat luctus. Maecenas quis ornare tellus. Aliquam erat volutpat.</p>', 'Oferta educativa', '', 'inherit', 'open', 'open', '', '34-revision-v1', '', '', '2014-09-18 12:32:18', '2014-09-18 12:32:18', '', 34, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/34-revision-v1/', 0, 'revision', '', 0),
(36, 2, '2014-09-18 12:33:11', '2014-09-18 12:33:11', 'Descripció i enumeració del material escolar que els alumnes i famílies necessitaran per al nivell educatiu corresponent, és recomanable diferenciar les diferents tipologies de material escolar necessari (llibres de text, lectures, dispositius digitals, material de taller, de dibuix…)', 'Material escolar', '', 'publish', 'closed', 'closed', '', 'material-escolar', '', '', '2014-09-22 11:22:40', '2014-09-22 11:22:40', '', 22, 'http://pwc-int.educacio.intranet/agora/masterpri/?page_id=36', 70, 'page', '', 0),
(37, 2, '2014-09-18 12:33:11', '2014-09-18 12:33:11', 'A la descripció i enumeració del material escolar que els alumnes i  famílies necessitaran per al nivell educatiu corresponent, és recomanable diferenciar les diferents tipologies de material escolar necessari (llibres de text, lectures, dispositius digitals, material de taller, de dibuix…)', 'Material escolar', '', 'inherit', 'open', 'open', '', '36-revision-v1', '', '', '2014-09-18 12:33:11', '2014-09-18 12:33:11', '', 36, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/36-revision-v1/', 0, 'revision', '', 0),
(38, 2, '2014-09-18 12:34:08', '2014-09-18 12:34:08', 'El caràcter d''aquesta pàgina ha de ser bàsicament informatiu. En aquesta secció cal fer una referència directa a qüestions de salut que afectin directament als alumnes del centre. Es pot categoritzar la informació, per exemple, entre <strong>medicaments</strong>, <strong>al·lèrgies</strong> i <strong>paràsits</strong>.\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;', 'Salut', '', 'publish', 'closed', 'closed', '', 'salut', '', '', '2015-01-27 15:41:50', '2015-01-27 14:41:50', '', 22, 'http://pwc-int.educacio.intranet/agora/masterpri/?page_id=38', 80, 'page', '', 0),
(39, 2, '2014-09-18 12:34:08', '2014-09-18 12:34:08', 'El caràcter d''aquesta pàgina ha de ser bàsicament informatiu. En aquesta secció cal fer una referència directa a qüestions de salut que afectin directament als alumnes del centre. Es pot categoritzar la informació, per exemple, entre <strong>medicaments</strong>, <strong>al·lèrgies</strong> i <strong>paràsits</strong>.', 'Salut', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-09-18 12:34:08', '2014-09-18 12:34:08', '', 38, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/38-revision-v1/', 0, 'revision', '', 0),
(55, 2, '2014-09-18 12:36:37', '2014-09-18 12:36:37', '', 'L''escola', '', 'publish', 'open', 'open', '', 'lescola-2', '', '', '2014-12-01 12:44:32', '2014-12-01 11:44:32', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=55', 1, 'nav_menu_item', '', 0),
(56, 2, '2014-09-18 12:36:37', '2014-09-18 12:36:37', ' ', '', '', 'publish', 'open', 'open', '', '56', '', '', '2014-12-01 12:44:32', '2014-12-01 11:44:32', '', 22, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=56', 9, 'nav_menu_item', '', 0),
(57, 2, '2014-09-18 12:36:37', '2014-09-18 12:36:37', ' ', '', '', 'publish', 'open', 'open', '', '57', '', '', '2014-12-01 12:44:32', '2014-12-01 11:44:32', '', 22, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=57', 8, 'nav_menu_item', '', 0),
(58, 2, '2014-09-18 12:36:37', '2014-09-18 12:36:37', ' ', '', '', 'publish', 'open', 'open', '', '58', '', '', '2014-12-01 12:44:32', '2014-12-01 11:44:32', '', 22, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=58', 7, 'nav_menu_item', '', 0),
(59, 2, '2014-09-18 12:36:37', '2014-09-18 12:36:37', ' ', '', '', 'publish', 'open', 'open', '', '59', '', '', '2014-12-01 12:44:32', '2014-12-01 11:44:32', '', 22, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=59', 6, 'nav_menu_item', '', 0),
(60, 2, '2014-09-18 12:36:37', '2014-09-18 12:36:37', ' ', '', '', 'publish', 'open', 'open', '', '60', '', '', '2014-12-01 12:44:32', '2014-12-01 11:44:32', '', 22, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=60', 5, 'nav_menu_item', '', 0),
(61, 2, '2014-09-18 12:36:37', '2014-09-18 12:36:37', ' ', '', '', 'publish', 'open', 'open', '', '61', '', '', '2014-12-01 12:44:32', '2014-12-01 11:44:32', '', 22, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=61', 4, 'nav_menu_item', '', 0),
(62, 2, '2014-09-18 12:36:37', '2014-09-18 12:36:37', ' ', '', '', 'publish', 'open', 'open', '', '62', '', '', '2014-12-01 12:44:32', '2014-12-01 11:44:32', '', 22, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=62', 3, 'nav_menu_item', '', 0),
(63, 2, '2014-09-18 12:36:37', '2014-09-18 12:36:37', ' ', '', '', 'publish', 'open', 'open', '', '63', '', '', '2014-12-01 12:44:32', '2014-12-01 11:44:32', '', 22, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=63', 2, 'nav_menu_item', '', 0),
(64, 2, '2014-09-18 12:39:08', '2014-09-18 12:39:08', 'En aquesta secció cada centre pot crear les pàgines necessàries per a descriure el seu projecte educatiu. D''acord amb la <a title="Article 91 LEC" href="http://www20.gencat.cat/portal/site/portaljuridic/menuitem.d15a4e5dfb99396dc366ec10b0c0e1a0/?vgnextoid=b85297b5a87d6210VgnVCM1000000b0c1e0aRCRD&amp;vgnextchannel=b85297b5a87d6210VgnVCM1000000b0c1e0aRCRD&amp;vgnextfmt=default&amp;action=fitxa&amp;portalId=1&amp;documentId=480169&amp;newLang=ca_ES#fragment-1182442" target="_blank">Llei d''Educació de Catalunya</a>, el projecte educatiu incorpora el caràcter propi del centre i ha de contenir com a mínim els elements següents:\r\n<ul>\r\n	<li>Criteris d''ordenació pedagògica, prioritats i plantejaments educatius, procediments d''inclusió i altres actuacions que caracteritzen el centre.</li>\r\n	<li>Indicadors de progrés.</li>\r\n	<li>Concreció i desenvolupament dels currículums.</li>\r\n	<li>Criteris que defineixen l''estructura organitzativa.</li>\r\n	<li>Projecte lingüístic.</li>\r\n	<li>Caràcter propi del centre, si n''hi ha.</li>\r\n</ul>\r\nEs poden incloure també en aquesta secció altres documents més específics que també formen part del projecte educatiu, com ara: Projecte de convivència, Pla TAC, Pla d''acollida, Projecte d''escola i família, Comunitat d''aprenentatge, etc.\r\n\r\nTambé pot ser interessant fer referència a altres projectes i activitats, com ara: Escola verda, Ràdio a l''escola, Art a l''escola, Cinema en curs, Taller de robòtica, Aprenentatge integrat de Continguts i Llengües Estrangeres (AICLE), Revista de l''escola, Agenda 21, Hort, Patis oberts...\r\n\r\nDonada la diversitat de seccions possibles, s''ha cregut oportú no crear cap pàgina específica en la maqueta inicial, deixant a criteri del centre la decisió sobre la millor manera d''estructurar la descripció del seu projecte educatiu. En crear els apartats és important que la caixa <em>Atributs de la pàgina</em> tingui com a pare/mare “<em>Projecte educatiu</em>“, i que se seleccioni com a plantilla l''opció “<em>Menú lateral</em>“.', 'Projecte educatiu', '', 'publish', 'closed', 'closed', '', 'projecte-educatiu', '', '', '2014-09-22 10:57:18', '2014-09-22 10:57:18', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?page_id=64', 0, 'page', '', 0),
(65, 2, '2014-09-18 12:39:08', '2014-09-18 12:39:08', 'En aquesta secció cada centre pot crear les pàgines necessàries per a descriure el seu projecte educatiu. D''acord amb la <a title="Article 91 LEC" href="http://www20.gencat.cat/portal/site/portaljuridic/menuitem.d15a4e5dfb99396dc366ec10b0c0e1a0/?vgnextoid=b85297b5a87d6210VgnVCM1000000b0c1e0aRCRD&amp;vgnextchannel=b85297b5a87d6210VgnVCM1000000b0c1e0aRCRD&amp;vgnextfmt=default&amp;action=fitxa&amp;portalId=1&amp;documentId=480169&amp;newLang=ca_ES#fragment-1182442" target="_blank">Llei d''Educació de Catalunya</a>, el projecte educatiu incorpora el caràcter propi del centre i ha de contenir com a mínim els elements següents:\r\n<ul>\r\n	<li>Criteris d''ordenació pedagògica, prioritats i plantejaments educatius, procediments d''inclusió i altres actuacions que caracteritzen el centre.</li>\r\n	<li>Indicadors de progrés.</li>\r\n	<li>Concreció i desenvolupament dels currículums.</li>\r\n	<li>Criteris que defineixen l''estructura organitzativa.</li>\r\n	<li>Projecte lingüístic.</li>\r\n	<li>Caràcter propi del centre, si n''hi ha.</li>\r\n</ul>\r\nEs poden incloure també en aquesta secció altres documents més específics que també formen part del projecte educatiu, com ara: Projecte de convivència, Pla TAC, Pla d''acollida, Projecte d''escola i família, Comunitat d''aprenentatge, etc.\r\n\r\nTambé pot ser interessant fer referència a altres projectes i activitats, com ara: Escola verda, Ràdio a l''escola, Art a l''escola, Cinema en curs, Taller de robòtica, Aprenentatge integrat de Continguts i Llengües Estrangeres (AICLE), Revista de l''escola, Agenda 21, Hort, Patis oberts...\r\n\r\nDonada la diversitat de seccions possibles, s''ha cregut oportú no crear cap pàgina específica en la maqueta inicial, deixant a criteri del centre la decisió sobre la millor manera d''estructurar la descripció del seu projecte educatiu. En crear els apartats és important que la caixa <em>Atributs de la pàgina</em> tingui com a pare/mare “<em>Projecte educatiu</em>“, i que es seleccioni com a plantilla l''opció “<em>Menú lateral</em>“.', 'Projecte educatiu', '', 'inherit', 'open', 'open', '', '64-revision-v1', '', '', '2014-09-18 12:39:08', '2014-09-18 12:39:08', '', 64, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/64-revision-v1/', 0, 'revision', '', 0),
(66, 2, '2014-09-18 12:40:47', '2014-09-18 12:40:47', 'Secció que ha d''informar a les famílies dels serveis que ofereix el centre. La missió educativa no es limita a l''eix curricular, per això és imprescindible que aquest apartat del web estigui en un primer nivell de navegació. És recomanable que s''introdueixi informació relacionada amb:\r\n<ul>\r\n<li>el menjador escolar</li>\r\n<li>l''acollida</li>\r\n<li>el transport escolar</li>\r\n<li>el casal d''estiu</li>\r\n<li>les activitats extraescolars</li>\r\n<li>altres serveis digitals (en cas que el centre compti amb altres serveis digitals en línia com ara Moodle, blogs, tutoria o gestió acadèmica, aplicacions mòbils...)</li>\r\n</ul>', 'Serveis', '', 'publish', 'closed', 'closed', '', 'serveis', '', '', '2014-09-18 12:40:58', '2014-09-18 12:40:58', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?page_id=66', 0, 'page', '', 0),
(67, 2, '2014-09-18 12:40:47', '2014-09-18 12:40:47', 'Secció que ha d''informar a les famílies dels serveis que ofereix el centre. La missió educativa no es limita a l''eix curricular, per això és imprescindible que aquest apartat del web estigui en un primer nivell de navegació. És recomanable que s''introdueixi informació relacionada amb:\r\n&lt;ul&gt;\r\n&lt;li&gt;el menjador escolar&lt;/li&gt;\r\n&lt;li&gt;l''acollida&lt;/li&gt;\r\n&lt;li&gt;el transport escolar&lt;/li&gt;\r\n&lt;li&gt;el casal d''estiu&lt;/li&gt;\r\n&lt;li&gt;les activitats extraescolars&lt;/li&gt;\r\n&lt;li&gt;altres serveis digitals (en cas que el centre compti amb altres serveis digitals en línia com ara Moodle, blogs, tutoria o gestió acadèmica, aplicacions mòbils...)&lt;/li&gt;\r\n&lt;/ul&gt;', 'Serveis', '', 'inherit', 'open', 'open', '', '66-revision-v1', '', '', '2014-09-18 12:40:47', '2014-09-18 12:40:47', '', 66, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/66-revision-v1/', 0, 'revision', '', 0),
(68, 2, '2014-09-18 12:40:58', '2014-09-18 12:40:58', 'Secció que ha d''informar a les famílies dels serveis que ofereix el centre. La missió educativa no es limita a l''eix curricular, per això és imprescindible que aquest apartat del web estigui en un primer nivell de navegació. És recomanable que s''introdueixi informació relacionada amb:\r\n<ul>\r\n<li>el menjador escolar</li>\r\n<li>l''acollida</li>\r\n<li>el transport escolar</li>\r\n<li>el casal d''estiu</li>\r\n<li>les activitats extraescolars</li>\r\n<li>altres serveis digitals (en cas que el centre compti amb altres serveis digitals en línia com ara Moodle, blogs, tutoria o gestió acadèmica, aplicacions mòbils...)</li>\r\n</ul>', 'Serveis', '', 'inherit', 'open', 'open', '', '66-revision-v1', '', '', '2014-09-18 12:40:58', '2014-09-18 12:40:58', '', 66, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/66-revision-v1/', 0, 'revision', '', 0),
(69, 2, '2014-09-18 12:41:37', '2014-09-18 12:41:37', ' ', '', '', 'publish', 'open', 'open', '', '69', '', '', '2014-12-01 12:44:33', '2014-12-01 11:44:33', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=69', 23, 'nav_menu_item', '', 0),
(70, 2, '2014-09-18 12:41:37', '2014-09-18 12:41:37', ' ', '', '', 'publish', 'open', 'open', '', '70', '', '', '2014-12-01 12:44:32', '2014-12-01 11:44:32', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=70', 10, 'nav_menu_item', '', 0),
(71, 2, '2014-09-18 12:44:56', '2014-09-18 12:44:56', 'L''oferta de <strong>serveis digitals</strong> constitueix un element molt important de l''engranatge d''un centre educatiu.\r\n\r\nEn aquesta pàgina es poden referenciar altres serveis en línia que ofereix l''escola com ara Moodle, blocs externs, aplicacions de tutoria o gestió acadèmica, aplicacions mòbils, etc.\r\n\r\nSi el centre posa en funcionament la <strong>xarxa Nodes</strong>, aquest pot ser un bon lloc per referenciar els principals grups i activitats que s''hi duen a terme.', 'Serveis digitals', '', 'publish', 'closed', 'closed', '', 'serveis-digitals', '', '', '2014-09-18 12:44:56', '2014-09-18 12:44:56', '', 66, 'http://pwc-int.educacio.intranet/agora/masterpri/?page_id=71', 10, 'page', '', 0),
(72, 2, '2014-09-18 12:44:56', '2014-09-18 12:44:56', 'L''oferta de <strong>serveis digitals</strong> constitueix un element molt important de l''engranatge d''un centre educatiu.\r\n\r\nEn aquesta pàgina es poden referenciar altres serveis en línia que ofereix l''escola com ara Moodle, blocs externs, aplicacions de tutoria o gestió acadèmica, aplicacions mòbils, etc.\r\n\r\nSi el centre posa en funcionament la <strong>xarxa Nodes</strong>, aquest pot ser un bon lloc per referenciar els principals grups i activitats que s''hi duen a terme.', 'Serveis digitals', '', 'inherit', 'open', 'open', '', '71-revision-v1', '', '', '2014-09-18 12:44:56', '2014-09-18 12:44:56', '', 71, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/71-revision-v1/', 0, 'revision', '', 0),
(73, 2, '2014-09-18 14:01:51', '2014-09-18 14:01:51', '<ul>\r\n	<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n	<li>Vivamus nec turpis viverra, vehicula tellus pellentesque, euismod urna.</li>\r\n	<li>Vivamus cursus neque eu erat bibendum, non ultrices enim dignissim.</li>\r\n	<li>Pellentesque consectetur lectus sit amet libero aliquam tincidunt.</li>\r\n	<li>Morbi eu purus vel mi dignissim volutpat eget nec est.</li>\r\n</ul>\r\n<ul>\r\n	<li>Curabitur vulputate purus nec orci suscipit viverra.</li>\r\n	<li>Phasellus vel lorem sit amet arcu posuere pellentesque.</li>\r\n	<li>Nam non tortor in turpis vestibulum ullamcorper id ut risus.</li>\r\n	<li>Suspendisse laoreet orci ac sodales varius.</li>\r\n	<li>Mauris laoreet eros et est hendrerit placerat.</li>\r\n</ul>', 'Menjador escolar', '', 'publish', 'closed', 'closed', '', 'menjador-escolar', '', '', '2014-09-18 14:05:26', '2014-09-18 14:05:26', '', 66, 'http://pwc-int.educacio.intranet/agora/masterpri/?page_id=73', 30, 'page', '', 0),
(74, 2, '2014-09-18 14:01:51', '2014-09-18 14:01:51', '<ul>\r\n	<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n	<li>Vivamus nec turpis viverra, vehicula tellus pellentesque, euismod urna.</li>\r\n	<li>Vivamus cursus neque eu erat bibendum, non ultrices enim dignissim.</li>\r\n	<li>Pellentesque consectetur lectus sit amet libero aliquam tincidunt.</li>\r\n	<li>Morbi eu purus vel mi dignissim volutpat eget nec est.</li>\r\n</ul>\r\n<ul>\r\n	<li>Curabitur vulputate purus nec orci suscipit viverra.</li>\r\n	<li>Phasellus vel lorem sit amet arcu posuere pellentesque.</li>\r\n	<li>Nam non tortor in turpis vestibulum ullamcorper id ut risus.</li>\r\n	<li>Suspendisse laoreet orci ac sodales varius.</li>\r\n	<li>Mauris laoreet eros et est hendrerit placerat.</li>\r\n</ul>', 'Menjador escolar', '', 'inherit', 'open', 'open', '', '73-revision-v1', '', '', '2014-09-18 14:01:51', '2014-09-18 14:01:51', '', 73, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/73-revision-v1/', 0, 'revision', '', 0),
(75, 2, '2014-09-18 14:08:22', '2014-09-18 14:08:22', ' ', '', '', 'publish', 'open', 'open', '', '75', '', '', '2014-12-01 12:44:33', '2014-12-01 11:44:33', '', 66, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=75', 26, 'nav_menu_item', '', 0),
(76, 2, '2014-09-18 14:08:22', '2014-09-18 14:08:22', ' ', '', '', 'publish', 'open', 'open', '', '76', '', '', '2014-12-01 12:44:33', '2014-12-01 11:44:33', '', 66, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=76', 24, 'nav_menu_item', '', 0),
(77, 2, '2014-09-18 14:05:08', '2014-09-18 14:05:08', '<p style="color: #666666;">Ma quande lingues coalesce, li grammatica del resultant lingue es plu simplic e regulari quam ti del coalescent lingues. Li nov lingua franca va esser plu simplic e regulari quam li existent Europan lingues. It va esser tam simplic quam Occidental in fact, it va esser Occidental.</p>\r\n<p style="color: #666666;">A un Angleso it va semblar un simplificat Angles, quam un skeptic Cambridge amico dit me que Occidental es. Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles.</p>', 'Acollida', '', 'publish', 'closed', 'closed', '', 'acollida', '', '', '2014-09-18 14:05:08', '2014-09-18 14:05:08', '', 66, 'http://pwc-int.educacio.intranet/agora/masterpri/?page_id=77', 20, 'page', '', 0),
(78, 2, '2014-09-18 14:05:08', '2014-09-18 14:05:08', '<p style="color: #666666;">Ma quande lingues coalesce, li grammatica del resultant lingue es plu simplic e regulari quam ti del coalescent lingues. Li nov lingua franca va esser plu simplic e regulari quam li existent Europan lingues. It va esser tam simplic quam Occidental in fact, it va esser Occidental.</p>\r\n<p style="color: #666666;">A un Angleso it va semblar un simplificat Angles, quam un skeptic Cambridge amico dit me que Occidental es. Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles.</p>', 'Acollida', '', 'inherit', 'open', 'open', '', '77-revision-v1', '', '', '2014-09-18 14:05:08', '2014-09-18 14:05:08', '', 77, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/77-revision-v1/', 0, 'revision', '', 0),
(79, 2, '2014-09-18 14:08:42', '2014-09-18 14:08:42', ' ', '', '', 'publish', 'open', 'open', '', '79', '', '', '2014-12-01 12:44:33', '2014-12-01 11:44:33', '', 66, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=79', 25, 'nav_menu_item', '', 0),
(80, 2, '2014-09-18 14:09:48', '2014-09-18 14:09:48', '<p style="color: #666666;">Ma quande lingues coalesce, li grammatica del resultant lingue es plu simplic e regulari quam ti del coalescent lingues. Li nov lingua franca va esser plu simplic e regulari quam li existent Europan lingues. It va esser tam simplic quam Occidental in fact, it va esser Occidental.</p>\r\n<p style="color: #666666;">A un Angleso it va semblar un simplificat Angles, quam un skeptic Cambridge amico dit me que Occidental es. Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles.</p>', 'Transport Escolar', '', 'publish', 'closed', 'closed', '', 'transport-escolar', '', '', '2014-09-18 14:09:48', '2014-09-18 14:09:48', '', 66, 'http://pwc-int.educacio.intranet/agora/masterpri/?page_id=80', 40, 'page', '', 0),
(81, 2, '2014-09-18 14:09:48', '2014-09-18 14:09:48', '<p style="color: #666666;">Ma quande lingues coalesce, li grammatica del resultant lingue es plu simplic e regulari quam ti del coalescent lingues. Li nov lingua franca va esser plu simplic e regulari quam li existent Europan lingues. It va esser tam simplic quam Occidental in fact, it va esser Occidental.</p>\r\n<p style="color: #666666;">A un Angleso it va semblar un simplificat Angles, quam un skeptic Cambridge amico dit me que Occidental es. Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles.</p>', 'Transport Escolar', '', 'inherit', 'open', 'open', '', '80-revision-v1', '', '', '2014-09-18 14:09:48', '2014-09-18 14:09:48', '', 80, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/80-revision-v1/', 0, 'revision', '', 0),
(82, 2, '2014-09-18 14:10:51', '2014-09-18 14:10:51', '<p style="color: #444444;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nisl quam, lobortis et interdum finibus, aliquam eget ligula. Donec nec ex et leo ultrices dignissim. Suspendisse quis tortor porta, rhoncus velit sit amet, convallis est. In lobortis dignissim convallis. Integer faucibus urna at magna mattis, id accumsan lacus posuere. Quisque vitae ipsum erat. Cras varius placerat justo. Vivamus maximus finibus hendrerit. Nullam accumsan quam pulvinar odio sollicitudin feugiat. Praesent vehicula dolor mauris, in semper risus gravida quis.</p>\r\n<p style="color: #444444;">Cras vitae porta turpis. Proin pharetra ac lacus in tempor. Vestibulum ullamcorper neque quis elit faucibus, at sodales est pretium. Suspendisse ac mauris in enim eleifend porttitor. Sed quis dolor laoreet, eleifend diam non, tincidunt nisl. Nulla sed venenatis eros. Ut non neque cursus, condimentum leo consequat, tempus ligula. Nulla vel orci sed sapien tincidunt fermentum.</p>', 'Casal d''estiu', '', 'publish', 'closed', 'closed', '', 'casal-destiu', '', '', '2014-09-18 14:10:51', '2014-09-18 14:10:51', '', 66, 'http://pwc-int.educacio.intranet/agora/masterpri/?page_id=82', 50, 'page', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(83, 2, '2014-09-18 14:10:51', '2014-09-18 14:10:51', '<p style="color: #444444;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nisl quam, lobortis et interdum finibus, aliquam eget ligula. Donec nec ex et leo ultrices dignissim. Suspendisse quis tortor porta, rhoncus velit sit amet, convallis est. In lobortis dignissim convallis. Integer faucibus urna at magna mattis, id accumsan lacus posuere. Quisque vitae ipsum erat. Cras varius placerat justo. Vivamus maximus finibus hendrerit. Nullam accumsan quam pulvinar odio sollicitudin feugiat. Praesent vehicula dolor mauris, in semper risus gravida quis.</p>\r\n<p style="color: #444444;">Cras vitae porta turpis. Proin pharetra ac lacus in tempor. Vestibulum ullamcorper neque quis elit faucibus, at sodales est pretium. Suspendisse ac mauris in enim eleifend porttitor. Sed quis dolor laoreet, eleifend diam non, tincidunt nisl. Nulla sed venenatis eros. Ut non neque cursus, condimentum leo consequat, tempus ligula. Nulla vel orci sed sapien tincidunt fermentum.</p>', 'Casal d''estiu', '', 'inherit', 'open', 'open', '', '82-revision-v1', '', '', '2014-09-18 14:10:51', '2014-09-18 14:10:51', '', 82, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/82-revision-v1/', 0, 'revision', '', 0),
(84, 2, '2014-09-18 14:11:31', '2014-09-18 14:11:31', '<p style="color: #444444;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nisl quam, lobortis et interdum finibus, aliquam eget ligula. Donec nec ex et leo ultrices dignissim. Suspendisse quis tortor porta, rhoncus velit sit amet, convallis est. In lobortis dignissim convallis. Integer faucibus urna at magna mattis, id accumsan lacus posuere. Quisque vitae ipsum erat. Cras varius placerat justo. Vivamus maximus finibus hendrerit. Nullam accumsan quam pulvinar odio sollicitudin feugiat. Praesent vehicula dolor mauris, in semper risus gravida quis.</p>\r\n<p style="color: #444444;">Cras vitae porta turpis. Proin pharetra ac lacus in tempor. Vestibulum ullamcorper neque quis elit faucibus, at sodales est pretium. Suspendisse ac mauris in enim eleifend porttitor. Sed quis dolor laoreet, eleifend diam non, tincidunt nisl. Nulla sed venenatis eros. Ut non neque cursus, condimentum leo consequat, tempus ligula. Nulla vel orci sed sapien tincidunt fermentum.</p>', 'Activitats extraescolars', '', 'publish', 'closed', 'closed', '', 'activitats-extraescolars', '', '', '2014-09-18 14:11:31', '2014-09-18 14:11:31', '', 66, 'http://pwc-int.educacio.intranet/agora/masterpri/?page_id=84', 60, 'page', '', 0),
(85, 2, '2014-09-18 14:11:31', '2014-09-18 14:11:31', '<p style="color: #444444;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nisl quam, lobortis et interdum finibus, aliquam eget ligula. Donec nec ex et leo ultrices dignissim. Suspendisse quis tortor porta, rhoncus velit sit amet, convallis est. In lobortis dignissim convallis. Integer faucibus urna at magna mattis, id accumsan lacus posuere. Quisque vitae ipsum erat. Cras varius placerat justo. Vivamus maximus finibus hendrerit. Nullam accumsan quam pulvinar odio sollicitudin feugiat. Praesent vehicula dolor mauris, in semper risus gravida quis.</p>\r\n<p style="color: #444444;">Cras vitae porta turpis. Proin pharetra ac lacus in tempor. Vestibulum ullamcorper neque quis elit faucibus, at sodales est pretium. Suspendisse ac mauris in enim eleifend porttitor. Sed quis dolor laoreet, eleifend diam non, tincidunt nisl. Nulla sed venenatis eros. Ut non neque cursus, condimentum leo consequat, tempus ligula. Nulla vel orci sed sapien tincidunt fermentum.</p>', 'Activitats extraescolars', '', 'inherit', 'open', 'open', '', '84-revision-v1', '', '', '2014-09-18 14:11:31', '2014-09-18 14:11:31', '', 84, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/84-revision-v1/', 0, 'revision', '', 0),
(86, 2, '2014-09-18 14:19:53', '2014-09-18 14:19:53', ' ', '', '', 'publish', 'open', 'open', '', '86', '', '', '2014-12-01 12:44:33', '2014-12-01 11:44:33', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=86', 30, 'nav_menu_item', '', 0),
(87, 2, '2014-09-18 14:28:12', '2014-09-18 14:28:12', 'De P3 a 6è cada nivell té una pàgina pròpia, que es creen mitjançant les categories.\r\n\r\nLes categories es defineixen des del menú de les entrades del blog. Paral·lelament als nivells també es poden definir més categories.\r\n\r\nJa estan definides les categories: Educació infantil, P3, P4, P5, Educació primària, 1r curs, 2n curs, 3r curs, 4t curs, 5è curs, 6è curs.', 'Nivells', '', 'publish', 'closed', 'closed', '', 'nivells', '', '', '2014-09-22 11:26:38', '2014-09-22 11:26:38', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?page_id=87', 0, 'page', '', 0),
(88, 2, '2014-09-18 14:28:12', '2014-09-18 14:28:12', 'De P3 a 6è cada nivell té una pàgina pròpia, que es creen mitjançant les categories.\r\n\r\nLes categories es defineixen des del menú de les entrades del blog. Paral·lelament als nivells també es poden definir més categories.\r\n\r\nEstan ja definides les categories: Educació infantil, P3, P4, P5, Educació primària, 1r. curs, 2n. curs, 3r. curs, 4t. curs, 5è. curs, 6à. curs.', 'Nivells', '', 'inherit', 'open', 'open', '', '87-revision-v1', '', '', '2014-09-18 14:28:12', '2014-09-18 14:28:12', '', 87, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/87-revision-v1/', 0, 'revision', '', 0),
(89, 2, '2014-09-18 14:29:22', '2014-09-18 14:29:22', ' ', '', '', 'publish', 'open', 'open', '', '89', '', '', '2014-12-01 12:44:33', '2014-12-01 11:44:33', '', 66, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=89', 29, 'nav_menu_item', '', 0),
(90, 2, '2014-09-18 14:29:22', '2014-09-18 14:29:22', '', 'Casal d''estiu', '', 'publish', 'open', 'open', '', 'casal-destiu', '', '', '2014-12-01 12:44:33', '2014-12-01 11:44:33', '', 66, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=90', 28, 'nav_menu_item', '', 0),
(91, 2, '2014-09-18 14:29:22', '2014-09-18 14:29:22', ' ', '', '', 'publish', 'open', 'open', '', '91', '', '', '2014-12-01 12:44:33', '2014-12-01 11:44:33', '', 66, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=91', 27, 'nav_menu_item', '', 0),
(92, 2, '2014-09-18 14:29:22', '2014-09-18 14:29:22', ' ', '', '', 'publish', 'open', 'open', '', '92', '', '', '2014-12-01 12:44:32', '2014-12-01 11:44:32', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=92', 11, 'nav_menu_item', '', 0),
(93, 2, '2014-09-18 14:30:17', '2014-09-18 14:30:17', ' ', '', '', 'publish', 'open', 'open', '', '93', '', '', '2014-12-01 12:44:32', '2014-12-01 11:44:32', '', 2, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=93', 13, 'nav_menu_item', '', 0),
(94, 2, '2014-09-18 14:30:17', '2014-09-18 14:30:17', ' ', '', '', 'publish', 'open', 'open', '', '94', '', '', '2014-12-01 12:44:32', '2014-12-01 11:44:32', '', 2, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=94', 14, 'nav_menu_item', '', 0),
(95, 2, '2014-09-18 14:30:17', '2014-09-18 14:30:17', ' ', '', '', 'publish', 'open', 'open', '', '95', '', '', '2014-12-01 12:44:32', '2014-12-01 11:44:32', '', 2, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=95', 15, 'nav_menu_item', '', 0),
(96, 2, '2014-09-18 14:30:17', '2014-09-18 14:30:17', '', '1r', '', 'publish', 'open', 'open', '', '96', '', '', '2014-12-01 12:44:33', '2014-12-01 11:44:33', '', 5, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=96', 17, 'nav_menu_item', '', 0),
(97, 2, '2014-09-18 14:30:17', '2014-09-18 14:30:17', '', '2n', '', 'publish', 'open', 'open', '', '97', '', '', '2014-12-01 12:44:33', '2014-12-01 11:44:33', '', 5, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=97', 18, 'nav_menu_item', '', 0),
(98, 2, '2014-09-18 14:30:17', '2014-09-18 14:30:17', '', '3r', '', 'publish', 'open', 'open', '', '98', '', '', '2014-12-01 12:44:33', '2014-12-01 11:44:33', '', 5, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=98', 19, 'nav_menu_item', '', 0),
(99, 2, '2014-09-18 14:30:17', '2014-09-18 14:30:17', ' ', '', '', 'publish', 'open', 'open', '', '99', '', '', '2014-12-01 12:44:33', '2014-12-01 11:44:33', '', 5, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=99', 20, 'nav_menu_item', '', 0),
(100, 2, '2014-09-18 14:30:17', '2014-09-18 14:30:17', ' ', '', '', 'publish', 'open', 'open', '', '100', '', '', '2014-12-01 12:44:33', '2014-12-01 11:44:33', '', 5, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=100', 21, 'nav_menu_item', '', 0),
(101, 2, '2014-09-18 14:30:17', '2014-09-18 14:30:17', ' ', '', '', 'publish', 'open', 'open', '', '101', '', '', '2014-12-01 12:44:33', '2014-12-01 11:44:33', '', 5, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=101', 22, 'nav_menu_item', '', 0),
(102, 2, '2014-09-18 15:29:22', '2014-09-18 15:29:22', '', 'exemple1b', '', 'inherit', 'open', 'open', '', 'exemple1b', '', '', '2014-09-18 15:29:22', '2014-09-18 15:29:22', '', 18, 'http://pwc-int.educacio.intranet/agora/masterpri/wp-content/uploads/usu6/2014/09/exemple1b.png', 0, 'attachment', 'image/png', 0),
(103, 2, '2014-09-18 16:32:01', '2014-09-18 16:32:01', '', 'Capçalera', '', 'publish', 'closed', 'closed', '', 'capcalera', '', '', '2014-09-22 12:04:54', '2014-09-22 12:04:54', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?post_type=slideshow&#038;p=103', 0, 'slideshow', '', 0),
(106, 2, '2014-09-18 16:39:33', '2014-09-18 16:39:33', '', 'joan_turu', '', 'inherit', 'open', 'open', '', 'joan_turu', '', '', '2014-09-18 16:39:33', '2014-09-18 16:39:33', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/wp-content/uploads/usu6/2014/09/joan_turu.png', 0, 'attachment', 'image/png', 0),
(107, 2, '2014-09-18 17:01:30', '2014-09-18 17:01:30', '', 'nens2', '', 'inherit', 'open', 'open', '', 'nens2', '', '', '2014-09-18 17:01:30', '2014-09-18 17:01:30', '', 13, 'http://pwc-int.educacio.intranet/agora/masterpri/wp-content/uploads/usu6/2014/09/nens2.png', 0, 'attachment', 'image/png', 0),
(108, 2, '2014-09-18 17:02:00', '2014-09-18 17:02:00', '', 'nensescola1', '', 'inherit', 'open', 'open', '', 'nensescola1', '', '', '2014-09-18 17:02:00', '2014-09-18 17:02:00', '', 18, 'http://pwc-int.educacio.intranet/agora/masterpri/wp-content/uploads/usu6/2014/09/nensescola1.jpg', 0, 'attachment', 'image/jpeg', 0),
(112, 2, '2014-09-19 11:11:44', '2014-09-19 11:11:44', '', 'Photo by Nick Amoscato', '', 'inherit', 'open', 'open', '', 'photo-by-nick-amoscato', '', '', '2014-09-19 11:11:44', '2014-09-19 11:11:44', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/wp-content/uploads/usu6/2014/09/Photo-by-Nick-Amoscato.jpg', 0, 'attachment', 'image/jpeg', 0),
(113, 1, '2014-09-19 11:51:13', '2014-09-19 11:51:13', '[slideshow_deploy id=''125'']\r\n\r\n<span style="color: #444444;">Nam semper id ipsum condimentum laoreet. Proin sollicitudin elit ut ligula hendrerit, et hendrerit ante condimentum. Aliquam suscipit feugiat velit, at vehicula lorem pharetra quis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean erat dolor, aliquet vitae ligula suscipit, bibendum malesuada augue.</span>', 'Notícia 3', '', 'publish', 'open', 'open', '', 'noticia-3', '', '', '2014-09-22 16:36:32', '2014-09-22 16:36:32', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=113', 0, 'post', '', 0),
(114, 1, '2014-09-19 11:51:13', '2014-09-19 11:51:13', '<span style="color: #444444;">Nam semper id ipsum condimentum laoreet. Proin sollicitudin elit ut ligula hendrerit, et hendrerit ante condimentum. Aliquam suscipit feugiat velit, at vehicula lorem pharetra quis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean erat dolor, aliquet vitae ligula suscipit, bibendum malesuada augue.</span>', 'Notícia 3', '', 'inherit', 'open', 'open', '', '113-revision-v1', '', '', '2014-09-19 11:51:13', '2014-09-19 11:51:13', '', 113, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/113-revision-v1/', 0, 'revision', '', 0),
(115, 1, '2014-09-19 11:51:44', '2014-09-19 11:51:44', '<span style="color: #444444;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean erat dolor, aliquet vitae ligula suscipit, bibendum malesuada augue. Nam semper id ipsum condimentum laoreet. Proin sollicitudin elit ut ligula hendrerit, et hendrerit ante condimentum. Aliquam suscipit feugiat velit, at vehicula lorem pharetra quis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean erat dolor, aliquet vitae ligula suscipit, bibendum malesuada augue.</span>', 'Notícia 4', '', 'publish', 'open', 'open', '', 'noticia-5', '', '', '2014-09-22 16:36:07', '2014-09-22 16:36:07', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=115', 0, 'post', '', 0),
(116, 1, '2014-09-19 11:51:44', '2014-09-19 11:51:44', '<span style="color: #444444;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean erat dolor, aliquet vitae ligula suscipit, bibendum malesuada augue. Nam semper id ipsum condimentum laoreet. Proin sollicitudin elit ut ligula hendrerit, et hendrerit ante condimentum. Aliquam suscipit feugiat velit, at vehicula lorem pharetra quis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean erat dolor, aliquet vitae ligula suscipit, bibendum malesuada augue.</span>', 'Notícia 5', '', 'inherit', 'open', 'open', '', '115-revision-v1', '', '', '2014-09-19 11:51:44', '2014-09-19 11:51:44', '', 115, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/115-revision-v1/', 0, 'revision', '', 0),
(117, 1, '2014-09-19 11:52:08', '2014-09-19 11:52:08', '<span style="color: #444444;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean erat dolor, aliquet vitae ligula suscipit, bibendum malesuada augue. Nam semper id ipsum condimentum laoreet. Proin sollicitudin elit ut ligula hendrerit, et hendrerit ante condimentum. Aliquam suscipit feugiat velit, at vehicula lorem pharetra quis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean erat dolor, aliquet vitae ligula suscipit, bibendum malesuada augue.</span>', 'Notícia 4', '', 'inherit', 'open', 'open', '', '115-revision-v1', '', '', '2014-09-19 11:52:08', '2014-09-19 11:52:08', '', 115, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/115-revision-v1/', 0, 'revision', '', 0),
(118, 1, '2014-09-19 11:53:11', '2014-09-19 11:53:11', '<iframe src="//player.vimeo.com/video/98712736?title=0&amp;byline=0&amp;portrait=0&amp;color=ff9933" width="550" height="309" frameborder="0" allowfullscreen="allowfullscreen"></iframe>', 'Notícia 5', '', 'publish', 'open', 'open', '', 'noticia-5-2', '', '', '2014-09-22 16:37:30', '2014-09-22 16:37:30', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=118', 0, 'post', '', 0),
(119, 1, '2014-09-19 11:53:11', '2014-09-19 11:53:11', '<span style="color: #444444;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean erat dolor, aliquet vitae ligula suscipit, bibendum malesuada augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean erat dolor, aliquet vitae ligula suscipit, bibendum malesuada augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean erat dolor, aliquet vitae ligula suscipit, bibendum malesuada augue.</span>', 'Notícia 5', '', 'inherit', 'open', 'open', '', '118-revision-v1', '', '', '2014-09-19 11:53:11', '2014-09-19 11:53:11', '', 118, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/118-revision-v1/', 0, 'revision', '', 0),
(120, 1, '2014-09-19 11:53:39', '2014-09-19 11:53:39', '<span style="color: #444444;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean erat dolor, aliquet vitae ligula suscipit, bibendum malesuada augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean erat dolor, aliquet vitae ligula suscipit, bibendum malesuada augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean erat dolor, aliquet vitae ligula suscipit, bibendum malesuada augue.</span>', 'Notícia 6', '', 'publish', 'open', 'open', '', 'noticia-6', '', '', '2014-09-22 16:36:07', '2014-09-22 16:36:07', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=120', 0, 'post', '', 0),
(121, 1, '2014-09-19 11:53:39', '2014-09-19 11:53:39', '<span style="color: #444444;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean erat dolor, aliquet vitae ligula suscipit, bibendum malesuada augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean erat dolor, aliquet vitae ligula suscipit, bibendum malesuada augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean erat dolor, aliquet vitae ligula suscipit, bibendum malesuada augue.</span>', 'Notícia 6', '', 'inherit', 'open', 'open', '', '120-revision-v1', '', '', '2014-09-19 11:53:39', '2014-09-19 11:53:39', '', 120, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/120-revision-v1/', 0, 'revision', '', 0),
(122, 1, '2014-09-19 11:55:07', '2014-09-19 11:55:07', '<iframe src="//player.vimeo.com/video/98712736?title=0&amp;byline=0&amp;portrait=0&amp;color=e835af" width="550" height="309" frameborder="0" allowfullscreen="allowfullscreen"></iframe>', 'Notícia 5', '', 'inherit', 'open', 'open', '', '118-revision-v1', '', '', '2014-09-19 11:55:07', '2014-09-19 11:55:07', '', 118, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/118-revision-v1/', 0, 'revision', '', 0),
(123, 1, '2014-09-19 11:59:09', '2014-09-19 11:59:09', 'https://soundcloud.com/institut-sabadell/sophie-message\r\n\r\nUn exemple de fitxer d''audio disponible directament des de la targeta resum. Dins de l''article, a la caixa "Paràmetres", heu de marcar la casella "Mostra el contingut sencer".', 'Notícia 1', '', 'inherit', 'open', 'open', '', '13-revision-v1', '', '', '2014-09-19 11:59:09', '2014-09-19 11:59:09', '', 13, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/13-revision-v1/', 0, 'revision', '', 0),
(124, 1, '2014-09-19 12:01:27', '2014-09-19 12:01:27', '<iframe width="560" height="315" src="//www.youtube.com/embed/ygwGTiGFGi0?rel=0" frameborder="0" allowfullscreen></iframe> \r\n\r\nUn exemple de video disponible directament des de la targeta resum. Dins de l’article, a la caixa “Paràmetres”, heu de marcar la casella “Mostra el contingut sencer”', 'Notícia 2', '', 'inherit', 'open', 'open', '', '18-revision-v1', '', '', '2014-09-19 12:01:27', '2014-09-19 12:01:27', '', 18, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/18-revision-v1/', 0, 'revision', '', 0),
(125, 1, '2014-09-19 15:17:52', '2014-09-19 15:17:52', '', 'Exemple', '', 'publish', 'closed', 'closed', '', 'exemple', '', '', '2014-09-19 15:21:39', '2014-09-19 15:21:39', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?post_type=slideshow&#038;p=125', 0, 'slideshow', '', 0),
(126, 1, '2014-09-19 15:18:28', '2014-09-19 15:18:28', '', 'exemple3', '', 'inherit', 'open', 'open', '', 'exemple3', '', '', '2014-09-19 15:18:28', '2014-09-19 15:18:28', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/wp-content/uploads/usu6/2014/09/exemple3.png', 0, 'attachment', 'image/png', 0),
(127, 1, '2014-09-19 15:18:40', '2014-09-19 15:18:40', '', 'imatge_recurs1', '', 'inherit', 'open', 'open', '', 'imatge_recurs1', '', '', '2014-09-19 15:18:40', '2014-09-19 15:18:40', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/wp-content/uploads/usu6/2014/09/imatge_recurs1.png', 0, 'attachment', 'image/png', 0),
(128, 1, '2014-09-19 15:18:53', '2014-09-19 15:18:53', '', 'exemple3b', '', 'inherit', 'open', 'open', '', 'exemple3b', '', '', '2014-09-19 15:18:53', '2014-09-19 15:18:53', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/wp-content/uploads/usu6/2014/09/exemple3b.png', 0, 'attachment', 'image/png', 0),
(129, 1, '2014-09-19 15:22:04', '2014-09-19 15:22:04', '[slideshow_deploy id=''125'']\r\n\r\n<span style="color: #444444;">Nam semper id ipsum condimentum laoreet. Proin sollicitudin elit ut ligula hendrerit, et hendrerit ante condimentum. Aliquam suscipit feugiat velit, at vehicula lorem pharetra quis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean erat dolor, aliquet vitae ligula suscipit, bibendum malesuada augue.</span>', 'Notícia 3', '', 'inherit', 'open', 'open', '', '113-revision-v1', '', '', '2014-09-19 15:22:04', '2014-09-19 15:22:04', '', 113, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/113-revision-v1/', 0, 'revision', '', 0),
(130, 1, '2014-09-19 15:26:19', '2014-09-19 15:26:19', '<iframe src="//player.vimeo.com/video/98712736?title=0&amp;byline=0&amp;portrait=0&amp;color=ff9933" width="550" height="309" frameborder="0" allowfullscreen="allowfullscreen"></iframe>', 'Notícia 5', '', 'inherit', 'open', 'open', '', '118-revision-v1', '', '', '2014-09-19 15:26:19', '2014-09-19 15:26:19', '', 118, 'http://pwc-int.educacio.intranet/agora/masterpri/2014/09/118-revision-v1/', 0, 'revision', '', 0),
(131, 2, '2014-09-22 09:46:48', '2014-09-22 09:46:48', '', 'classe', '', 'inherit', 'open', 'open', '', 'classe', '', '', '2014-09-22 09:46:48', '2014-09-22 09:46:48', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/wp-content/uploads/usu6/2014/09/classe.png', 0, 'attachment', 'image/png', 0),
(133, 2, '2014-09-22 10:56:17', '2014-09-22 10:56:17', '', 'albertbachiller', '', 'inherit', 'open', 'open', '', 'albertbachiller', '', '', '2014-09-22 10:56:17', '2014-09-22 10:56:17', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/wp-content/uploads/usu6/2014/09/albertbachiller.png', 0, 'attachment', 'image/png', 0),
(134, 1, '2014-09-22 10:57:18', '2014-09-22 10:57:18', 'En aquesta secció cada centre pot crear les pàgines necessàries per a descriure el seu projecte educatiu. D''acord amb la <a title="Article 91 LEC" href="http://www20.gencat.cat/portal/site/portaljuridic/menuitem.d15a4e5dfb99396dc366ec10b0c0e1a0/?vgnextoid=b85297b5a87d6210VgnVCM1000000b0c1e0aRCRD&amp;vgnextchannel=b85297b5a87d6210VgnVCM1000000b0c1e0aRCRD&amp;vgnextfmt=default&amp;action=fitxa&amp;portalId=1&amp;documentId=480169&amp;newLang=ca_ES#fragment-1182442" target="_blank">Llei d''Educació de Catalunya</a>, el projecte educatiu incorpora el caràcter propi del centre i ha de contenir com a mínim els elements següents:\r\n<ul>\r\n	<li>Criteris d''ordenació pedagògica, prioritats i plantejaments educatius, procediments d''inclusió i altres actuacions que caracteritzen el centre.</li>\r\n	<li>Indicadors de progrés.</li>\r\n	<li>Concreció i desenvolupament dels currículums.</li>\r\n	<li>Criteris que defineixen l''estructura organitzativa.</li>\r\n	<li>Projecte lingüístic.</li>\r\n	<li>Caràcter propi del centre, si n''hi ha.</li>\r\n</ul>\r\nEs poden incloure també en aquesta secció altres documents més específics que també formen part del projecte educatiu, com ara: Projecte de convivència, Pla TAC, Pla d''acollida, Projecte d''escola i família, Comunitat d''aprenentatge, etc.\r\n\r\nTambé pot ser interessant fer referència a altres projectes i activitats, com ara: Escola verda, Ràdio a l''escola, Art a l''escola, Cinema en curs, Taller de robòtica, Aprenentatge integrat de Continguts i Llengües Estrangeres (AICLE), Revista de l''escola, Agenda 21, Hort, Patis oberts...\r\n\r\nDonada la diversitat de seccions possibles, s''ha cregut oportú no crear cap pàgina específica en la maqueta inicial, deixant a criteri del centre la decisió sobre la millor manera d''estructurar la descripció del seu projecte educatiu. En crear els apartats és important que la caixa <em>Atributs de la pàgina</em> tingui com a pare/mare “<em>Projecte educatiu</em>“, i que se seleccioni com a plantilla l''opció “<em>Menú lateral</em>“.', 'Projecte educatiu', '', 'inherit', 'open', 'open', '', '64-revision-v1', '', '', '2014-09-22 10:57:18', '2014-09-22 10:57:18', '', 64, 'http://pwc-int.educacio.intranet/agora/masterpri/general/64-revision-v1/', 0, 'revision', '', 0),
(135, 2, '2014-09-22 11:10:14', '2014-09-22 11:10:14', '<iframe src="//www.youtube.com/embed/ygwGTiGFGi0?rel=0" width="560" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe>\r\n\r\nUn exemple de video disponible directament des de la targeta resum. Dins de l’article, a la caixa “Paràmetres”, heu de marcar la casella “Mostra el contingut sencer”', 'Notícia 2', '', 'inherit', 'open', 'open', '', '18-revision-v1', '', '', '2014-09-22 11:10:14', '2014-09-22 11:10:14', '', 18, 'http://pwc-int.educacio.intranet/agora/masterpri/general/18-revision-v1/', 0, 'revision', '', 0),
(136, 1, '2014-09-22 11:22:40', '2014-09-22 11:22:40', 'Descripció i enumeració del material escolar que els alumnes i famílies necessitaran per al nivell educatiu corresponent, és recomanable diferenciar les diferents tipologies de material escolar necessari (llibres de text, lectures, dispositius digitals, material de taller, de dibuix…)', 'Material escolar', '', 'inherit', 'open', 'open', '', '36-revision-v1', '', '', '2014-09-22 11:22:40', '2014-09-22 11:22:40', '', 36, 'http://pwc-int.educacio.intranet/agora/masterpri/general/36-revision-v1/', 0, 'revision', '', 0),
(137, 1, '2014-09-22 11:26:00', '2014-09-22 11:26:00', 'De P3 a 6è cada nivell té una pàgina pròpia, que es creen mitjançant les categories.\r\n\r\nLes categories es defineixen des del menú de les entrades del blog. Paral·lelament als nivells també es poden definir més categories.\r\n\r\nJa estan definides les categories: Educació infantil, P3, P4, P5, Educació primària, 1r. curs, 2n. curs, 3r. curs, 4t. curs, 5è. curs, 6è. curs.', 'Nivells', '', 'inherit', 'open', 'open', '', '87-revision-v1', '', '', '2014-09-22 11:26:00', '2014-09-22 11:26:00', '', 87, 'http://pwc-int.educacio.intranet/agora/masterpri/general/87-revision-v1/', 0, 'revision', '', 0),
(138, 1, '2014-09-22 11:26:38', '2014-09-22 11:26:38', 'De P3 a 6è cada nivell té una pàgina pròpia, que es creen mitjançant les categories.\r\n\r\nLes categories es defineixen des del menú de les entrades del blog. Paral·lelament als nivells també es poden definir més categories.\r\n\r\nJa estan definides les categories: Educació infantil, P3, P4, P5, Educació primària, 1r curs, 2n curs, 3r curs, 4t curs, 5è curs, 6è curs.', 'Nivells', '', 'inherit', 'open', 'open', '', '87-revision-v1', '', '', '2014-09-22 11:26:38', '2014-09-22 11:26:38', '', 87, 'http://pwc-int.educacio.intranet/agora/masterpri/general/87-revision-v1/', 0, 'revision', '', 0),
(139, 2, '2014-09-22 16:10:33', '2014-09-22 16:10:33', '', 'screeshot', '', 'inherit', 'open', 'open', '', 'screeshot', '', '', '2014-09-22 16:10:33', '2014-09-22 16:10:33', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/wp-content/uploads/usu6/2014/09/screeshot.png', 0, 'attachment', 'image/png', 0),
(140, 2, '2014-09-22 16:11:11', '2014-09-22 16:11:11', '', 'Destacat Nodes', '', 'publish', 'closed', 'closed', '', 'destacat-nodes', '', '', '2014-09-22 16:11:11', '2014-09-22 16:11:11', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?post_type=slideshow&#038;p=140', 0, 'slideshow', '', 0),
(141, 2, '2014-09-22 16:15:19', '2014-09-22 16:15:19', '', 'Nodes', '', 'publish', 'closed', 'closed', '', 'nodes', '', '', '2014-09-22 16:15:19', '2014-09-22 16:15:19', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/nodes/', 0, 'page', '', 0),
(142, 1, '2014-09-22 17:09:16', '2014-09-22 17:09:16', '', 'Instal·lacions', '', 'publish', 'closed', 'closed', '', 'instal%c2%b7lacions', '', '', '2014-09-22 17:10:07', '2014-09-22 17:10:07', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?post_type=slideshow&#038;p=142', 0, 'slideshow', '', 0),
(143, 1, '2014-09-22 17:09:36', '2014-09-22 17:09:36', 'Sed quis dolor laoreet, eleifend diam non, tincidunt nisl. Nulla sed venenatis eros. Ut non neque cursus, condimentum leo consequat, tempus ligula. Nulla vel orci sed sapien tincidunt fermentum.\r\n\r\n[slideshow_deploy id=''142'']\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce in feugiat urna, a sagittis nisl. Proin fringilla turpis sed orci ultricies commodo. Morbi ac magna pulvinar lacus feugiat placerat non eu urna. Mauris laoreet nisi tellus, vel vehicula erat ornare mollis. Pellentesque justo erat, maximus a varius vitae, suscipit vel augue. Vivamus mattis sed metus sit amet auctor. Curabitur vel enim enim. Cras cursus leo lorem, ac dictum nibh bibendum non. Maecenas ac mauris felis. Phasellus euismod luctus augue ac vehicula. Sed dignissim libero vitae consequat luctus. Maecenas quis ornare tellus. Aliquam erat volutpat.', 'Instal·lacions', '', 'inherit', 'open', 'open', '', '30-revision-v1', '', '', '2014-09-22 17:09:36', '2014-09-22 17:09:36', '', 30, 'http://pwc-int.educacio.intranet/agora/masterpri/general/30-revision-v1/', 0, 'revision', '', 0),
(145, 2, '2014-10-07 05:43:59', '2014-10-07 05:43:59', '<div class="gce-list-event gce-tooltip-event">[event-title]</div>\r\n[if-not-all-day]\r\n[if-single-day]\r\n<div>Quan: [start-time]-[end-time]</div>\r\n[/if-single-day]\r\n[/if-not-all-day]\r\n[if-multi-day]\r\n<div>Del [start-date] fins el [end-date]</div>\r\n[/if-multi-day]\r\n[if-location]\r\n<div>On: [location]</div>\r\n[/if-location]\r\n[if-description]\r\n<div>[description]</div>\r\n[/if-description]\r\n<div>[link newwindow="true"]Més detalls...[/link]</div>', 'Calendari d''exemple', '', 'publish', 'closed', 'closed', '', '145', '', '', '2015-01-26 11:38:35', '2015-01-26 10:38:35', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/gce_feed/145/', 0, 'gce_feed', '', 0),
(148, 1, '2014-12-01 12:44:32', '2014-12-01 11:44:32', ' ', '', '', 'publish', 'open', 'open', '', '148', '', '', '2014-12-01 12:44:32', '2014-12-01 11:44:32', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=148', 12, 'nav_menu_item', '', 0),
(149, 1, '2014-12-01 12:44:33', '2014-12-01 11:44:33', ' ', '', '', 'publish', 'open', 'open', '', '149', '', '', '2014-12-01 12:44:33', '2014-12-01 11:44:33', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=149', 16, 'nav_menu_item', '', 0),
(150, 2, '2015-01-26 11:57:41', '2015-01-26 10:57:41', '', 'Document 1', '', 'publish', 'open', 'open', '', 'document-1', '', '', '2015-01-26 11:57:54', '2015-01-26 10:57:54', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=150', 1, 'nav_menu_item', '', 0),
(151, 2, '2015-01-26 11:57:41', '2015-01-26 10:57:41', '', 'Document 2', '', 'publish', 'open', 'open', '', 'document-2', '', '', '2015-01-26 11:57:54', '2015-01-26 10:57:54', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=151', 2, 'nav_menu_item', '', 0),
(152, 2, '2015-01-26 11:57:41', '2015-01-26 10:57:41', '', 'Aplicació 1', '', 'publish', 'open', 'open', '', 'aplicacio-1', '', '', '2015-01-26 11:57:54', '2015-01-26 10:57:54', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=152', 3, 'nav_menu_item', '', 0),
(153, 2, '2015-01-26 11:57:41', '2015-01-26 10:57:41', '', 'Aplicació 2', '', 'publish', 'open', 'open', '', 'aplicacio-2', '', '', '2015-01-26 11:57:54', '2015-01-26 10:57:54', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=153', 4, 'nav_menu_item', '', 0),
(154, 2, '2015-01-26 11:57:41', '2015-01-26 10:57:41', '', 'Web 1', '', 'publish', 'open', 'open', '', 'web-1', '', '', '2015-01-26 11:57:54', '2015-01-26 10:57:54', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=154', 5, 'nav_menu_item', '', 0),
(155, 2, '2015-01-26 11:57:41', '2015-01-26 10:57:41', '', 'Web 2', '', 'publish', 'open', 'open', '', 'web-2', '', '', '2015-01-26 11:57:54', '2015-01-26 10:57:54', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=155', 6, 'nav_menu_item', '', 0),
(156, 2, '2015-01-26 11:59:04', '2015-01-26 10:59:04', '', 'foto-classe', '', 'inherit', 'open', 'open', '', 'foto-classe', '', '', '2015-01-26 11:59:04', '2015-01-26 10:59:04', '', 0, 'http://pwc-int.educacio.intranet/agora/masterpri/wp-content/uploads/usu6/2015/01/foto-classe.png', 0, 'attachment', 'image/png', 0),
(157, 2, '2015-01-27 14:32:41', '2015-01-27 13:32:41', ' ', '', '', 'publish', 'open', 'open', '', '157', '', '', '2015-01-27 14:32:41', '2015-01-27 13:32:41', '', 2, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=157', 2, 'nav_menu_item', '', 0),
(158, 2, '2015-01-27 14:32:41', '2015-01-27 13:32:41', ' ', '', '', 'publish', 'open', 'open', '', '158', '', '', '2015-01-27 14:32:41', '2015-01-27 13:32:41', '', 2, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=158', 1, 'nav_menu_item', '', 0),
(159, 2, '2015-01-27 14:32:41', '2015-01-27 13:32:41', ' ', '', '', 'publish', 'open', 'open', '', '159', '', '', '2015-01-27 14:32:41', '2015-01-27 13:32:41', '', 2, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=159', 3, 'nav_menu_item', '', 0),
(160, 2, '2015-01-27 14:35:05', '2015-01-27 13:35:05', ' ', '', '', 'publish', 'open', 'open', '', '160', '', '', '2015-01-27 14:35:11', '2015-01-27 13:35:11', '', 5, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=160', 1, 'nav_menu_item', '', 0),
(161, 2, '2015-01-27 14:35:05', '2015-01-27 13:35:05', ' ', '', '', 'publish', 'open', 'open', '', '161', '', '', '2015-01-27 14:35:11', '2015-01-27 13:35:11', '', 5, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=161', 2, 'nav_menu_item', '', 0),
(162, 2, '2015-01-27 14:35:05', '2015-01-27 13:35:05', ' ', '', '', 'publish', 'open', 'open', '', '162', '', '', '2015-01-27 14:35:11', '2015-01-27 13:35:11', '', 5, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=162', 4, 'nav_menu_item', '', 0),
(163, 2, '2015-01-27 14:35:05', '2015-01-27 13:35:05', ' ', '', '', 'publish', 'open', 'open', '', '163', '', '', '2015-01-27 14:35:11', '2015-01-27 13:35:11', '', 5, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=163', 3, 'nav_menu_item', '', 0),
(164, 2, '2015-01-27 14:35:05', '2015-01-27 13:35:05', ' ', '', '', 'publish', 'open', 'open', '', '164', '', '', '2015-01-27 14:35:11', '2015-01-27 13:35:11', '', 5, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=164', 5, 'nav_menu_item', '', 0),
(165, 2, '2015-01-27 14:35:05', '2015-01-27 13:35:05', ' ', '', '', 'publish', 'open', 'open', '', '165', '', '', '2015-01-27 14:35:11', '2015-01-27 13:35:11', '', 5, 'http://pwc-int.educacio.intranet/agora/masterpri/?p=165', 6, 'nav_menu_item', '', 0),
(166, 2, '2015-01-27 15:41:50', '2015-01-27 14:41:50', 'El caràcter d''aquesta pàgina ha de ser bàsicament informatiu. En aquesta secció cal fer una referència directa a qüestions de salut que afectin directament als alumnes del centre. Es pot categoritzar la informació, per exemple, entre <strong>medicaments</strong>, <strong>al·lèrgies</strong> i <strong>paràsits</strong>.\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;', 'Salut', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2015-01-27 15:41:50', '2015-01-27 14:41:50', '', 38, 'http://pwc-int.educacio.intranet/agora/masterpri/general/38-revision-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_signups`
--

CREATE TABLE `wp_signups` (
  `signup_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(200) NOT NULL DEFAULT '',
  `path` varchar(100) NOT NULL DEFAULT '',
  `title` longtext NOT NULL,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `activation_key` varchar(50) NOT NULL DEFAULT '',
  `meta` longtext,
  PRIMARY KEY (`signup_id`),
  KEY `activation_key` (`activation_key`),
  KEY `user_email` (`user_email`),
  KEY `user_login_email` (`user_login`,`user_email`),
  KEY `domain_path` (`domain`,`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_stats`
--

CREATE TABLE `wp_stats` (
  `stat_id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `ip` varchar(15) NOT NULL,
  `ipForward` varchar(15) NOT NULL,
  `ipClient` varchar(15) NOT NULL,
  `userAgent` varchar(255) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `isadmin` tinyint(4) NOT NULL DEFAULT '0',
  `username` varchar(60) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`stat_id`),
  KEY `uid` (`uid`),
  KEY `ip` (`ip`),
  KEY `ipForward` (`ipForward`),
  KEY `ipClient` (`ipClient`),
  KEY `userAgent` (`userAgent`),
  KEY `isadmin` (`isadmin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Bolcant dades de la taula `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'General', 'general', 0),
(2, 'Infantil', 'infantil', 0),
(3, 'P3', 'p3', 0),
(4, 'Portada', 'portada', 0),
(5, 'Primaria', 'primaria', 0),
(6, 'Menú principal', 'menu-principal', 0),
(7, 'AMPA', 'ampa', 0),
(8, 'P4', 'p4', 0),
(9, 'P5', 'p5', 0),
(10, '1r', '1r', 0),
(11, '2n', '2n', 0),
(12, '3r', '3r', 0),
(13, '4t', '4t', 0),
(14, '5è', '5e', 0),
(15, '6è', '6e', 0),
(16, 'Sortides', 'sortides', 0),
(17, 'Plàstica', 'plastica', 0),
(18, 'Psicomotricitat', 'psicomotricitat', 0),
(19, 'Audiovisuals', 'audiovisuals', 0),
(20, 'Menú exemple', 'menu-exemple', 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcant dades de la taula `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(13, 3, 0),
(13, 4, 0),
(13, 8, 0),
(13, 11, 0),
(13, 13, 0),
(13, 15, 0),
(13, 19, 0),
(18, 4, 0),
(18, 7, 0),
(18, 8, 0),
(18, 10, 0),
(18, 11, 0),
(18, 12, 0),
(18, 13, 0),
(18, 14, 0),
(18, 17, 0),
(18, 18, 0),
(55, 6, 0),
(56, 6, 0),
(57, 6, 0),
(58, 6, 0),
(59, 6, 0),
(60, 6, 0),
(61, 6, 0),
(62, 6, 0),
(63, 6, 0),
(69, 6, 0),
(70, 6, 0),
(75, 6, 0),
(76, 6, 0),
(79, 6, 0),
(86, 6, 0),
(89, 6, 0),
(90, 6, 0),
(91, 6, 0),
(92, 6, 0),
(93, 6, 0),
(94, 6, 0),
(95, 6, 0),
(96, 6, 0),
(97, 6, 0),
(98, 6, 0),
(99, 6, 0),
(100, 6, 0),
(101, 6, 0),
(113, 4, 0),
(113, 5, 0),
(113, 7, 0),
(113, 8, 0),
(113, 9, 0),
(113, 13, 0),
(113, 14, 0),
(113, 15, 0),
(113, 17, 0),
(113, 18, 0),
(115, 3, 0),
(115, 4, 0),
(115, 8, 0),
(115, 9, 0),
(115, 10, 0),
(115, 16, 0),
(118, 4, 0),
(118, 10, 0),
(118, 11, 0),
(118, 12, 0),
(118, 13, 0),
(118, 16, 0),
(118, 19, 0),
(120, 4, 0),
(120, 10, 0),
(120, 11, 0),
(120, 16, 0),
(148, 6, 0),
(149, 6, 0),
(150, 20, 0),
(151, 20, 0),
(152, 20, 0),
(153, 20, 0),
(154, 20, 0),
(155, 20, 0),
(157, 21, 0),
(158, 21, 0),
(159, 21, 0),
(160, 22, 0),
(161, 22, 0),
(162, 22, 0),
(163, 22, 0),
(164, 22, 0),
(165, 22, 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Bolcant dades de la taula `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'category', '', 0, 0),
(3, 3, 'category', '', 2, 2),
(4, 4, 'category', '', 0, 6),
(5, 5, 'category', '', 0, 1),
(6, 6, 'nav_menu', '', 0, 30),
(7, 7, 'category', '', 0, 2),
(8, 8, 'category', '', 2, 4),
(9, 9, 'category', '', 2, 2),
(10, 10, 'category', '', 5, 4),
(11, 11, 'category', '', 5, 4),
(12, 12, 'category', '', 5, 2),
(13, 13, 'category', '', 5, 4),
(14, 14, 'category', '', 5, 2),
(15, 15, 'category', '', 5, 2),
(16, 16, 'post_tag', '', 0, 3),
(17, 17, 'post_tag', '', 0, 2),
(18, 18, 'post_tag', '', 0, 2),
(19, 19, 'post_tag', '', 0, 2),
(20, 20, 'nav_menu', '', 0, 6),
(21, 2, 'nav_menu', '', 0, 3),
(22, 5, 'nav_menu', '', 0, 6);

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=62 ;

--
-- Bolcant dades de la taula `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'first_name', ''),
(2, 1, 'last_name', ''),
(3, 1, 'nickname', 'admin'),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:2:{s:13:"administrator";b:1;s:13:"bbp_keymaster";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp350_media,wp360_revisions,wp360_locks,wp390_widgets'),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'wp_dashboard_quick_press_last_post_id', '3'),
(15, 2, 'first_name', ''),
(16, 2, 'last_name', ''),
(17, 2, 'nickname', 'xtecadmin'),
(18, 2, 'description', ''),
(19, 2, 'rich_editing', 'true'),
(20, 2, 'comment_shortcuts', 'false'),
(21, 2, 'admin_color', 'fresh'),
(22, 2, 'use_ssl', '0'),
(23, 2, 'show_admin_bar_front', 'true'),
(24, 2, 'wp_capabilities', 'a:2:{s:13:"administrator";b:1;s:13:"bbp_keymaster";b:1;}'),
(25, 2, 'wp_user_level', '10'),
(26, 2, 'dismissed_wp_pointers', 'wp350_media,wp360_revisions,wp360_locks,wp390_widgets'),
(27, 2, 'wp_dashboard_quick_press_last_post_id', '4'),
(28, 2, 'last_activity', '2015-05-15 08:31:10'),
(29, 1, 'last_activity', '2014-12-01 12:15:41'),
(30, 2, 'wp_user-settings', 'editor=tinymce&libraryContent=browse&widgets_access=off'),
(31, 2, 'wp_user-settings-time', '1426683192'),
(35, 2, 'screen_layout_post', '2'),
(36, 2, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}'),
(37, 2, 'metaboxhidden_nav-menus', 'a:11:{i:0;s:23:"add-buddypress-nav-menu";i:1;s:8:"add-post";i:2;s:9:"add-forum";i:3;s:10:"add-bp_doc";i:4;s:12:"add-post_tag";i:5;s:15:"add-post_format";i:6;s:15:"add-ia_invitees";i:7;s:21:"add-ia_invited_groups";i:8;s:27:"add-bp_docs_associated_item";i:9;s:18:"add-bp_docs_access";i:10;s:15:"add-bp_docs_tag";}'),
(38, 2, 'nav_menu_recently_edited', '5'),
(39, 2, 'show_welcome_panel', '1'),
(40, 2, 'meta-box-order_dashboard', 'a:4:{s:6:"normal";s:19:"dashboard_right_now";s:4:"side";s:18:"dashboard_activity";s:7:"column3";s:0:"";s:7:"column4";s:0:"";}'),
(41, 2, 'closedpostboxes_slideshow', 'a:0:{}'),
(42, 2, 'metaboxhidden_slideshow', 'a:1:{i:3;s:7:"slugdiv";}'),
(43, 2, 'meta-box-order_slideshow', 'a:3:{s:4:"side";s:26:"submitdiv,slides-list,,,,,";s:6:"normal";s:34:"information,slugdiv,style,settings";s:8:"advanced";s:0:"";}'),
(44, 2, 'screen_layout_slideshow', '2'),
(46, 1, 'screen_layout_post', '2'),
(47, 1, 'wp_user-settings', 'editor=tinymce&libraryContent=browse'),
(48, 1, 'wp_user-settings-time', '1411383268'),
(49, 1, 'closedpostboxes_slideshow', 'a:0:{}'),
(50, 1, 'metaboxhidden_slideshow', 'a:1:{i:3;s:7:"slugdiv";}'),
(53, 2, 'total_group_count', '2'),
(54, 2, 'ass_digest_items', 'a:1:{s:3:"dig";a:0:{}}'),
(55, 1, 'nav_menu_recently_edited', '6'),
(56, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}'),
(57, 1, 'metaboxhidden_nav-menus', 'a:12:{i:0;s:23:"add-buddypress-nav-menu";i:1;s:8:"add-post";i:2;s:9:"add-forum";i:3;s:10:"add-bp_doc";i:4;s:12:"add-gce_feed";i:5;s:12:"add-post_tag";i:6;s:15:"add-post_format";i:7;s:15:"add-ia_invitees";i:8;s:21:"add-ia_invited_groups";i:9;s:27:"add-bp_docs_associated_item";i:10;s:18:"add-bp_docs_access";i:11;s:15:"add-bp_docs_tag";}'),
(59, 2, 'session_tokens', 'a:1:{s:64:"9a8052d52e8f187b92c4d41daba34c7f3b86b1435d980fa7cfde49f324b3156a";i:1431851470;}'),
(60, 2, 'meta-box-order_post', 'a:3:{s:4:"side";s:56:"submitdiv,postimagediv,postexcerpt,metabox1,tagsdiv-post";s:6:"normal";s:11:"categorydiv";s:8:"advanced";s:0:"";}'),
(61, 2, 'metaboxhidden_post', 'a:7:{i:0;s:9:"authordiv";i:1;s:11:"commentsdiv";i:2;s:16:"commentstatusdiv";i:3;s:11:"layout_meta";i:4;s:12:"revisionsdiv";i:5;s:7:"slugdiv";i:6;s:11:"ping_status";}');

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Bolcant dades de la taula `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BQgNNyp6COxvpyu1UnoItbXo6CKP7a0', 'admin', 'a8000006@xtec.cat', '', '2014-09-12 09:10:47', '', 0, 'admin'),
(2, 'xtecadmin', '$P$BfCUpq0vqeYBfD2KRm7GHDiZCUcIq3/', 'xtecadmin', 'agora@xtec.invalid', '', '2014-09-12 09:26:41', '', 0, 'xtecadmin');

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_wsluserscontacts`
--

CREATE TABLE `wp_wsluserscontacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `provider` varchar(50) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `profile_url` varchar(255) NOT NULL,
  `photo_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `wp_wslusersprofiles`
--

CREATE TABLE `wp_wslusersprofiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `object_sha` varchar(255) NOT NULL COMMENT 'to check if hybridauth user profile object has changed from last time, if yes we update the user profile here ',
  `identifier` varchar(255) NOT NULL,
  `profileurl` varchar(255) NOT NULL,
  `websiteurl` varchar(255) NOT NULL,
  `photourl` varchar(255) NOT NULL,
  `displayname` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `birthday` varchar(255) NOT NULL,
  `birthmonth` varchar(255) NOT NULL,
  `birthyear` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `emailverified` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
