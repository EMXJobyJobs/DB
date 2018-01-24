CREATE DATABASE `joby_jobs` /*!40100 DEFAULT CHARACTER SET utf8 */;
   CREATE TABLE `admin_person_settings` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_person_id` int(11) NOT NULL,
  `setting_key` varchar(150) NOT NULL,
  `settings_value` varchar(500) NOT NULL,
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`setting_id`),
  UNIQUE KEY `admin_person_id_UNIQUE` (`admin_person_id`),
  CONSTRAINT `admin_person_id_FK` FOREIGN KEY (`admin_person_id`) REFERENCES `admin_persons` (`admin_person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `admin_persons` (
  `admin_person_id` int(11) NOT NULL AUTO_INCREMENT,
  `identity_user_id` varchar(128) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `register_date` datetime NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_person_id`),
  UNIQUE KEY `identity_user_id_UNIQUE` (`identity_user_id`),
  CONSTRAINT `user_id_1` FOREIGN KEY (`identity_user_id`) REFERENCES `users` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `application_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `visual_name` varchar(150) NOT NULL,
  `active` varchar(45) NOT NULL DEFAULT 'b''1''',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seeker_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `application_start_date` datetime NOT NULL,
  `story` longtext NOT NULL COMMENT 'The story around the current application',
  `watched` bit(1) DEFAULT b'0' COMMENT 'Holds a value for whether the applicaition has been watched by the employer',
  `last_updated` datetime DEFAULT CURRENT_TIMESTAMP,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `position_id4_idx` (`position_id`),
  KEY `application_status_id_1_idx` (`status_id`),
  KEY `seeker_id1_idx` (`seeker_id`),
  CONSTRAINT `application_status_id_1` FOREIGN KEY (`status_id`) REFERENCES `application_statuses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `position_id4` FOREIGN KEY (`position_id`) REFERENCES `positions` (`position_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `seeker_id1` FOREIGN KEY (`seeker_id`) REFERENCES `seekers` (`seeker_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `conversation_messages` (
  `message_id` int(11) NOT NULL,
  `message_uid` varchar(38) DEFAULT NULL,
  `message_type` int(11) NOT NULL,
  `seeker_id` int(11) NOT NULL,
  `employer_id` int(11) NOT NULL,
  `employer_person_id` int(11) NOT NULL,
  `header` varchar(300) DEFAULT NULL,
  `content` longtext,
  `date` datetime NOT NULL,
  `is_read` bit(1) NOT NULL COMMENT 'is read by the other side',
  PRIMARY KEY (`message_id`),
  KEY `worker_id_5_idx` (`seeker_id`),
  KEY `company_person_id_6_idx` (`employer_person_id`),
  KEY `company_id_idx` (`employer_id`),
  CONSTRAINT `employer_id3` FOREIGN KEY (`employer_id`) REFERENCES `employers` (`employer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `employer_person_id3` FOREIGN KEY (`employer_person_id`) REFERENCES `employer_persons` (`employer_person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `seeker_id3` FOREIGN KEY (`seeker_id`) REFERENCES `seekers` (`seeker_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds conversation (chat) messages between an employer and a job seeker';

CREATE TABLE `employer_person_settings` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `employer_person_id` int(11) NOT NULL,
  `setting_key` varchar(150) NOT NULL,
  `settings_value` varchar(500) NOT NULL,
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`setting_id`),
  KEY `employer_person_id4_idx` (`employer_person_id`),
  CONSTRAINT `employer_person_id4` FOREIGN KEY (`employer_person_id`) REFERENCES `employer_persons` (`employer_person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `employer_persons` (
  `employer_person_id` int(11) NOT NULL,
  `identity_user_id` varchar(128) NOT NULL,
  `employer_id` int(11) NOT NULL,
  `employer_department_id` int(11) DEFAULT NULL COMMENT 'the department of the company person (if any)',
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `id_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `register_date` datetime NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`employer_person_id`),
  KEY `employer_8_idx` (`employer_id`),
  KEY `employer_department_id2_idx` (`employer_department_id`),
  KEY `user_id_idx` (`identity_user_id`),
  CONSTRAINT `employer_department_id2` FOREIGN KEY (`employer_department_id`) REFERENCES `empoyer_departments` (`department_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `employer_id8` FOREIGN KEY (`employer_id`) REFERENCES `employers` (`employer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id1` FOREIGN KEY (`identity_user_id`) REFERENCES `users` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `employers` (
  `employer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `address` varchar(500) NOT NULL,
  `phone_number` varchar(150) NOT NULL,
  `contact_person_name` varchar(150) DEFAULT NULL COMMENT 'the main contact person (refereant) in the company. may be null.',
  `contact_person_phone_number` varchar(150) DEFAULT NULL COMMENT 'the phone number of the  main contact person (refereant) in the company. may be null.',
  `company_hp` varchar(50) DEFAULT NULL COMMENT 'The israeli company id number (h.p)',
  `join_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logo` varchar(500) NOT NULL COMMENT 'relative url to the company logo',
  `about` text COMMENT 'about the company',
  `website_url` varchar(500) DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`employer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `empoyer_departments` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `employer_id` int(11) NOT NULL,
  `department_name` varchar(45) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`department_id`),
  KEY `employer_id21_idx` (`employer_id`),
  CONSTRAINT `employer_id21` FOREIGN KEY (`employer_id`) REFERENCES `employers` (`employer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='departments inside an employer';

CREATE TABLE `ext_cities` (
  `Name` varchar(150) NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds external data around cities';

CREATE TABLE `fields` (
  `filed_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`filed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `global_settings` (
  `global_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `global_settings_key` varchar(150) NOT NULL,
  `value` text,
  PRIMARY KEY (`global_setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='global settings and data';

CREATE TABLE `interviews` (
  `interview_id` int(11) NOT NULL AUTO_INCREMENT,
  `interview_uid` varchar(38) DEFAULT NULL,
  `employer_id` int(11) NOT NULL,
  `seeker_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `location` varchar(150) NOT NULL,
  `address` varchar(150) NOT NULL,
  `notes` varchar(9999) DEFAULT NULL,
  `is_cancelled` bit(1) DEFAULT b'0',
  `cancel_reason` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`interview_id`),
  KEY `employer_id6_idx` (`employer_id`),
  KEY `seeker_id6_idx` (`seeker_id`),
  CONSTRAINT `employer_id6` FOREIGN KEY (`employer_id`) REFERENCES `employers` (`employer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `seeker_id6` FOREIGN KEY (`seeker_id`) REFERENCES `seekers` (`seeker_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `position_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_id` int(11) NOT NULL,
  `tag_id` varchar(38) NOT NULL COMMENT 'a unique tag id',
  `precedence` int(11) DEFAULT NULL COMMENT 'the precedence of the current position in the current tag (1-based); null is 1;',
  PRIMARY KEY (`id`),
  KEY `position_id1_idx` (`position_id`),
  CONSTRAINT `position_id1` FOREIGN KEY (`position_id`) REFERENCES `positions` (`position_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='holds all tags for a specific position';

CREATE TABLE `positions` (
  `position_id` int(11) NOT NULL,
  `position_uid` varchar(38) COLLATE armscii8_bin DEFAULT NULL,
  `employer_id` int(11) NOT NULL,
  `position_type` varchar(150) CHARACTER SET utf8 DEFAULT NULL COMMENT 'The position type (full time, part time, shifts)',
  `title` varchar(150) CHARACTER SET utf8 NOT NULL,
  `profession_id` int(11) NOT NULL,
  `subprofession_id` int(11) NOT NULL,
  `salary_min` int(11) NOT NULL,
  `salary_max` int(11) NOT NULL,
  `location` varchar(150) CHARACTER SET utf8 NOT NULL,
  `description` longtext CHARACTER SET utf8 NOT NULL,
  `status_id` int(11) NOT NULL COMMENT 'the status of the position: draft, onair, frozen',
  `internal_precedence` int(11) DEFAULT NULL COMMENT 'holds the precedence in the current company (1-based); null is 1;',
  `draft` bit(1) NOT NULL DEFAULT b'0' COMMENT 'specifies whether the position is not yet to be published (draft); NOT USED; ',
  `frozen` bit(1) NOT NULL DEFAULT b'0' COMMENT 'specifies whether the position is frozen (that is not active for searches);  NOT USED; ',
  `active` bit(1) NOT NULL DEFAULT b'1' COMMENT 'specifies whether the position was deleted (logically)',
  PRIMARY KEY (`position_id`),
  KEY `employer_id1_idx` (`employer_id`),
  CONSTRAINT `employer_id1` FOREIGN KEY (`employer_id`) REFERENCES `employers` (`employer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

CREATE TABLE `professions` (
  `profession_id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `tag_id` varchar(38) NOT NULL COMMENT 'a unique tag id for search purposes',
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`profession_id`),
  KEY `field_id1_idx` (`field_id`),
  CONSTRAINT `field_id1` FOREIGN KEY (`field_id`) REFERENCES `fields` (`filed_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `reaction_types` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `reactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seeker_id` int(11) NOT NULL,
  `employer_id` int(11) DEFAULT NULL,
  `reaction_type_id` int(11) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `position_id` int(11) DEFAULT NULL,
  `employer_person_id` int(11) DEFAULT NULL,
  `disabled` bit(1) DEFAULT b'0' COMMENT 'true means row is disabled,\nfalse or null means otherwise.',
  PRIMARY KEY (`id`),
  KEY `reaction_type_1_idx` (`reaction_type_id`),
  KEY `position_id_idx` (`position_id`),
  KEY `employer_id_16_idx` (`employer_id`),
  KEY `employer_person_id_idx` (`employer_person_id`),
  KEY `seeker_id9_idx` (`seeker_id`),
  CONSTRAINT `employer_id_16` FOREIGN KEY (`employer_id`) REFERENCES `employers` (`employer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `employer_person_id` FOREIGN KEY (`employer_person_id`) REFERENCES `employer_persons` (`employer_person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `position_id` FOREIGN KEY (`position_id`) REFERENCES `positions` (`position_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `reaction_type_1` FOREIGN KEY (`reaction_type_id`) REFERENCES `reaction_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `seeker_id9` FOREIGN KEY (`seeker_id`) REFERENCES `seekers` (`seeker_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='reactions: seeker initied likes, employer initiated likes, mutual matches';

CREATE TABLE `roles` (
  `Id` varchar(128) NOT NULL,
  `Name` varchar(256) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='identity table- roles';

CREATE TABLE `seeker_job_interests` (
  `id` int(11) NOT NULL,
  `seeker_id` int(11) NOT NULL,
  `file` varchar(500) NOT NULL,
  `date` datetime NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `seeker_id9_idx` (`seeker_id`),
  CONSTRAINT `seeker_id19` FOREIGN KEY (`seeker_id`) REFERENCES `seekers` (`seeker_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='seeker settings: that includes worker preferences, job requirements, and general info.';

CREATE TABLE `seeker_resumes` (
  `id` int(11) NOT NULL,
  `seeker_id` int(11) NOT NULL,
  `file` varchar(500) NOT NULL,
  `date` datetime NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `seeker_id7_idx` (`seeker_id`),
  CONSTRAINT `seeker_id7` FOREIGN KEY (`seeker_id`) REFERENCES `seekers` (`seeker_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Represents the physical files of a seeker''s resume';

CREATE TABLE `seeker_settings` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `seeker_id` int(11) NOT NULL,
  `setting_key` varchar(150) NOT NULL,
  `settings_value` varchar(500) NOT NULL,
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`setting_id`),
  KEY `seeker_id13_idx` (`seeker_id`),
  CONSTRAINT `seeker_id13` FOREIGN KEY (`seeker_id`) REFERENCES `seekers` (`seeker_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='seeker(candidate)  settings: that includes worker preferences, job requirements, and general info.';

CREATE TABLE `seekers` (
  `seeker_id` int(11) NOT NULL AUTO_INCREMENT,
  `identity_user_id` varchar(128) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `phone_number` varchar(50) NOT NULL COMMENT 'NOT RELEVANT; identical column in users table.',
  `id_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `register_date` datetime NOT NULL,
  `gender` int(11) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`seeker_id`),
  KEY `user_id2_idx` (`identity_user_id`),
  CONSTRAINT `user_id2` FOREIGN KEY (`identity_user_id`) REFERENCES `users` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `subprofessions` (
  `subprofession_id` int(11) NOT NULL AUTO_INCREMENT,
  `profession_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `tag_id` varchar(38) NOT NULL COMMENT 'a unique tag id for search purposes',
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`subprofession_id`),
  KEY `profession_id_idx` (`profession_id`),
  CONSTRAINT `profession_id` FOREIGN KEY (`profession_id`) REFERENCES `professions` (`profession_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `userclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(128) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `ApplicationUser_Claims` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='identity table- userclaims';

CREATE TABLE `userlogins` (
  `LoginProvider` varchar(128) NOT NULL,
  `ProviderKey` varchar(128) NOT NULL,
  `UserId` varchar(128) NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`,`UserId`),
  KEY `ApplicationUser_Logins` (`UserId`),
  CONSTRAINT `ApplicationUser_Logins` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='identity table- userlogins';

CREATE TABLE `userroles` (
  `UserId` varchar(128) NOT NULL,
  `RoleId` varchar(128) NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IdentityRole_Users` (`RoleId`),
  CONSTRAINT `ApplicationUser_Roles` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `IdentityRole_Users` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='identity table- userroles';

CREATE TABLE `users` (
  `Id` varchar(128) NOT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext,
  `SecurityStamp` longtext,
  `PhoneNumber` longtext,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEndDateUtc` datetime DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  `UserName` varchar(256) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='identity table- users';
