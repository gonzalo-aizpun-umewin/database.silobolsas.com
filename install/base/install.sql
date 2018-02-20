# ================================================================================================

DROP DATABASE IF EXISTS `silobolsas`;
CREATE DATABASE `silobolsas` CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `silobolsas`;

# ================================================================================================
# Admin

GRANT ALL PRIVILEGES ON silobolsas.* To 'silobolsas'@'localhost' IDENTIFIED BY 'b64875d6039a6c4161a99e073210a3b4';
GRANT ALL PRIVILEGES ON silobolsas.* To 'silobolsas'@'%' IDENTIFIED BY 'b64875d6039a6c4161a99e073210a3b4';
