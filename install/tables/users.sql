USE `silobolsas`;

# ================================================================================================

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
 `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
 `email` varchar(128) NOT NULL,
 `password` varchar(32) NOT NULL,
 `active` tinyint(1) unsigned NOT NULL,
 `created_at` datetime DEFAULT NULL,

 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



