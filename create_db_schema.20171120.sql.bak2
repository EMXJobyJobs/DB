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
  `active` bit(1) NOT NULL DEFAULT b'1',
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_person_id`),
  UNIQUE KEY `identity_user_id_UNIQUE` (`identity_user_id`),
  CONSTRAINT `user_id_1` FOREIGN KEY (`identity_user_id`) REFERENCES `users` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `application_statuses` (
  `int` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `active` varchar(45) NOT NULL DEFAULT 'b''1''',
  PRIMARY KEY (`int`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `worker_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `application_start_date` datetime NOT NULL,
  `story` longtext NOT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `companies` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `address` varchar(500) NOT NULL,
  `phone_number` varchar(150) NOT NULL,
  `contact_person_name` varchar(150) NOT NULL,
  `contact_person_phone` varchar(150) NOT NULL,
  `registration_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logo` varchar(500) NOT NULL COMMENT 'relative url to the company logo',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `company_person_settings` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_person_id` int(11) NOT NULL,
  `setting_key` varchar(150) NOT NULL,
  `settings_value` varchar(500) NOT NULL,
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`setting_id`),
  KEY `company_person_id_FK_idx` (`company_person_id`),
  CONSTRAINT `company_person_id_FK` FOREIGN KEY (`company_person_id`) REFERENCES `company_persons` (`company_person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `company_persons` (
  `company_person_id` int(11) NOT NULL AUTO_INCREMENT,
  `identity_user_id` varchar(128) NOT NULL,
  `company_id` int(11) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`company_person_id`),
  UNIQUE KEY `identity_user_id_UNIQUE` (`identity_user_id`),
  KEY `company_id_idx` (`company_id`),
  CONSTRAINT `company_id_FK` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id_3` FOREIGN KEY (`identity_user_id`) REFERENCES `users` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` int(11) NOT NULL,
  `company_person` int(11) NOT NULL,
  `content` longtext,
  `date` datetime NOT NULL,
  `read` bit(1) NOT NULL COMMENT 'is read by the other side',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds conversations (chats) between company and worker';

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
  `date` datetime NOT NULL,
  `location` varchar(150) NOT NULL,
  `address` varchar(150) NOT NULL,
  `notes` varchar(9999) DEFAULT NULL,
  PRIMARY KEY (`interview_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `position_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_id` int(11) NOT NULL,
  `tag_id` varchar(38) NOT NULL COMMENT 'a unique tag id',
  `precedence` int(11) DEFAULT NULL COMMENT 'the precedence of the current position in the current tag (1-based); null is 1;',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='holds all tags for a specific position';

CREATE TABLE `positions` (
  `int` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(150) CHARACTER SET utf8 NOT NULL,
  `position_type` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `title` varchar(150) CHARACTER SET utf8 NOT NULL,
  `profession_id` int(11) NOT NULL,
  `subprofession_id` int(11) NOT NULL,
  `salary_min` int(11) NOT NULL,
  `salary_max` int(11) NOT NULL,
  `location` varchar(150) CHARACTER SET utf8 NOT NULL,
  `description` longtext CHARACTER SET utf8 NOT NULL,
  `status_id` int(11) NOT NULL COMMENT 'the status of the position: active, frozen, filled,',
  `internal_precedence` int(11) DEFAULT NULL COMMENT 'holds the precedence in the current company (1-based); null is 1;',
  `draft` bit(1) NOT NULL DEFAULT b'0' COMMENT 'specifies whether the position is not yet to be published (draft)',
  `frozen` bit(1) NOT NULL DEFAULT b'0' COMMENT 'specifies whether the position is frozen (that is not active for searches)',
  `active` bit(1) NOT NULL DEFAULT b'1' COMMENT 'specifies whether the position was deleted (logically)',
  PRIMARY KEY (`int`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

CREATE TABLE `professions` (
  `profession_id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `tag_id` varchar(38) NOT NULL COMMENT 'a unique tag id for search purposes',
  `active` bit(1) NOT NULL DEFAULT b'1',
  `professionscol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`profession_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `reaction_types` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `reactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `worker_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `reaction_type_id` int(11) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='reactions: worker likes, company likes, mutual matches';

CREATE TABLE `roles` (
  `Id` varchar(128) NOT NULL,
  `Name` varchar(256) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='identity table- roles';

CREATE TABLE `subprofessions` (
  `subprofession_id` int(11) NOT NULL AUTO_INCREMENT,
  `profession_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `tag_id` varchar(38) NOT NULL COMMENT 'a unique tag id for search purposes',
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`subprofession_id`)
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

CREATE TABLE `worker_job_interests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `worker_id` int(11) NOT NULL,
  `salary_min` int(11) DEFAULT NULL,
  `salary_max` int(11) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL COMMENT 'Holds the distance (in km) from home',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `worker_resumes` (
  `id` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `file` varchar(500) NOT NULL,
  `date` datetime NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Represents the physical files of a worker''s resume';

CREATE TABLE `worker_settings` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `worker_id` int(11) NOT NULL,
  `setting_key` varchar(150) NOT NULL,
  `settings_value` varchar(500) NOT NULL,
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`setting_id`),
  KEY `worker_id_fk1_idx` (`worker_id`),
  CONSTRAINT `worker_id_fk1` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`worker_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='worker(candidate)  settings: that includes worker preferences, job requirements, and general info.';

CREATE TABLE `workers` (
  `worker_id` int(11) NOT NULL AUTO_INCREMENT,
  `identity_user_id` varchar(128) NOT NULL,
  `company_id` int(11) NOT NULL,
  `worker_number` varchar(50) NOT NULL,
  `id_number` varchar(50) DEFAULT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`worker_id`,`worker_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='workers(candidates)';
