-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 20, 2019 at 12:55 PM
-- Server version: 10.3.20-MariaDB-1
-- PHP Version: 7.3.11-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vapt`
--

-- --------------------------------------------------------

--
-- Table structure for table `command`
--

CREATE TABLE `command` (
  `command_id` int(11) NOT NULL,
  `parameter` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `command`
--

INSERT INTO `command` (`command_id`, `parameter`) VALUES
(1, 'nmap --script +ssh2-enum-algos -sV IP_ADDRESS -p PORT\n'),
(2, 'timeout 30 openssl s_client -showcerts -connect IP_ADDRESS:PORT'),
(3, 'nmap --script +ssl-enum-ciphers -sV IP_ADDRESS -p PORT'),
(4, 'sslyze --certinfo IP_ADDRESS:PORT'),
(5, 'nmap --script +ssl-dh-params -sV IP_ADDRESS -p PORT'),
(6, '(nslookup qq.com IP_ADDRESS -port=PORT; nmap -sU -p PORT --script dns-cache-snoop.nse IP_ADDRESS;)'),
(7, 'nmap --script +http-internal-ip-disclosure -sV IP_ADDRESS -p PORT'),
(8, 'nmap --script +sslv2-drown -sV IP_ADDRESS -p PORT'),
(9, 'nmap --script +ssl-poodle -sV IP_ADDRESS -p PORT'),
(10, 'whatweb IP_ADDRESS:PORT\r\n'),
(11, 'nmap --script +http-methods -sV IP_ADDRESS -p PORT'),
(12, 'nmap --script +ssl-heartbleed -sV IP_ADDRESS -p PORT'),
(13, 'nmap --script +ssl-ccs-injection -sV IP_ADDRESS -p PORT'),
(14, 'nmap --script +rdp-enum-encryption -sV -p PORT IP_ADDRESS'),
(15, 'nmap --script +smb-security-mode.nse -sV -p PORT IP_ADDRESS'),
(16, '(echo \'\' > RANDOM_PATH; echo \'use auxiliary/scanner/smb/smb_version\' >> RANDOM_PATH; echo \'set rhosts IP_ADDRESS\' >> RANDOM_PATH; echo \'set rport PORT\' >> RANDOM_PATH; echo \'run\' >> RANDOM_PATH; echo \'exit\' >> RANDOM_PATH; msfconsole -r RANDOM_PATH; rm RANDOM_PATH;)'),
(17, 'nmap -sS -sV -p PORT IP_ADDRESS'),
(18, 'curl -k -L -s https://IP_ADDRESS:PORT | grep -A 2 -B 3 smhversion'),
(19, 'nmap -sU -sV -p PORT IP_ADDRESS'),
(20, 'nmap -sT -sU -sV -p PORT IP_ADDRESS'),
(21, 'nmap --script +smtp-enum-users --script-args methods={EXPN,VRFY} -p PORT IP_ADDRESS'),
(22, 'curl -s -k -L http://IP_ADDRESS:PORT/eccgs/eccgs-404-error-page.html | grep \"Apache Tomcat\\|Pivotal tc Runtime\"'),
(23, '(cd tools/rdp-sec-check; echo | cpan install Encoding::BER; ./rdp-sec-check.pl IP_ADDRESS:PORT;cd ../../;)'),
(24, 'sslyze --regular IP_ADDRESS:PORT'),
(25, '(echo \'\' > RANDOM_PATH; echo \'use exploit/windows/smb/ms17_010_psexec\' >> RANDOM_PATH; echo \'set rhosts IP_ADDRESS\' >> RANDOM_PATH; echo \'set rport PORT\' >> RANDOM_PATH; echo \'check\' >> RANDOM_PATH; echo \'exit\' >> RANDOM_PATH; msfconsole -r RANDOM_PATH; rm RANDOM_PATH;)'),
(26, 'nmap -sS -sV --script +smb-protocols -p PORT IP_ADDRESS'),
(27, 'nmap -sS -sV --script +http-vuln-cve2015-1635 -p PORT IP_ADDRESS'),
(28, '(echo \'\' > RANDOM_PATH; echo \'use auxiliary/scanner/rdp/cve_2019_0708_bluekeep\' >> RANDOM_PATH; echo \'set rhosts IP_ADDRESS\' >> RANDOM_PATH; echo \'set rport PORT\' >> RANDOM_PATH; echo \'run\' >> RANDOM_PATH; echo \'exit\' >> RANDOM_PATH; msfconsole -r RANDOM_PATH; rm RANDOM_PATH;)'),
(29, '(echo \'\' > RANDOM_PATH; echo \'use auxiliary/scanner/vmware/esx_fingerprint\' >> RANDOM_PATH; echo \'set rhosts IP_ADDRESS\' >> RANDOM_PATH; echo \'run\' >> RANDOM_PATH; echo \'exit\' >> RANDOM_PATH; msfconsole -r RANDOM_PATH; rm RANDOM_PATH;)'),
(30, '(echo \'\' > RANDOM_PATH; echo \'use exploit/windows/misc/hp_dataprotector_cmd_exec\' >> RANDOM_PATH; echo \'set rhosts IP_ADDRESS\' >> RANDOM_PATH; echo \'set rport PORT\' >> RANDOM_PATH; echo \'check\' >> RANDOM_PATH; echo \'exit\' >> RANDOM_PATH; msfconsole -r RANDOM_PATH; rm RANDOM_PATH;)'),
(31, 'enum4linux IP_ADDRESS PORT | grep -B 1 -A 3 \"Session Check\"'),
(32, 'showmount --exports IP_ADDRESS'),
(33, 'nmap -O -sV IP_ADDRESS'),
(34, '(echo \'\' > RANDOM_PATH; echo \'use exploit/multi/misc/hp_data_protector_exec_integutil\' >> RANDOM_PATH; echo \'set rhosts IP_ADDRESS\' >> RANDOM_PATH; echo \'set rport PORT\' >> RANDOM_PATH; echo \'check\' >> RANDOM_PATH; echo \'exit\' >> RANDOM_PATH; msfconsole -r RANDOM_PATH; rm RANDOM_PATH;)'),
(35, 'nmap -sS -sV --script +http-headers -p PORT IP_ADDRESS'),
(36, 'nmap -sV --script +tls-ticketbleed IP_ADDRESS -p PORT'),
(37, 'nmap -sV --script +pop3-capabilities -p PORT IP_ADDRESS'),
(38, 'nmap --script +smtp-commands -sV -p PORT IP_ADDRESS'),
(39, '(echo \'#!/bin/bash\' > RANDOM_PATH; echo \"( sleep 5; curl -s -k -L http://IP_ADDRESS:PORT/Hewlett-Packard/OpenView/BBC/status | grep -B 2 iframe ) &\" >> RANDOM_PATH; echo \"timeout 10 python2 /usr/share/exploitdb/exploits/multiple/webapps/35076.py IP_ADDRESS https://www.eccgs.com --port PORT\" >> RANDOM_PATH; chmod a+x RANDOM_PATH; ./RANDOM_PATH; rm RANDOM_PATH;)'),
(40, '(python2 /usr/share/exploitdb/exploits/windows/remote/27400.py IP_ADDRESS PORT \"whoami\"; python2 /usr/share/exploitdb/exploits/windows/remote/27400.py IP_ADDRESS PORT \"ipconfig\";)'),
(41, '(echo \'#!/bin/bash\' > RANDOM_PATH; echo \'temp=$(echo | openssl s_client -connect IP_ADDRESS:PORT 2>/dev/null | openssl x509 -noout -fingerprint -sha256)\' >> RANDOM_PATH; echo \'temp2=${temp//\\:/}\' >> RANDOM_PATH; echo \'temp3=${temp2//SHA256 Fingerprint=/}\' >> RANDOM_PATH; echo \'temp4=${temp3,,}\' >> RANDOM_PATH; echo \'curl -s -k -L https://raw.githubusercontent.com/sec-consult/houseofkeys/master/certificates/${temp4}.key\' >> RANDOM_PATH; echo \'curl -s -k -L https://raw.githubusercontent.com/sec-consult/houseofkeys/master/certificates/${temp4}.pem;\' >> RANDOM_PATH; chmod a+x RANDOM_PATH; ./RANDOM_PATH; rm RANDOM_PATH;)'),
(42, 'nmap -sV --script +vmware-version -p PORT IP_ADDRESS'),
(43, 'nmap -sV --script +sshv1 IP_ADDRESS -p PORT'),
(44, 'ntpq -c rv IP_ADDRESS'),
(45, 'python2 /usr/share/exploitdb/exploits/windows/remote/39858.py -p PORT IP_ADDRESS -c \'whoami\'; python2 /usr/share/exploitdb/exploits/windows/remote/39858.py -p PORT IP_ADDRESS -c \'ipconfig\'\n'),
(46, '(echo \'\' > RANDOM_PATH; echo \'use auxiliary/scanner/rdp/ms12_020_check\' >> RANDOM_PATH; echo \'set rhosts IP_ADDRESS\' >> RANDOM_PATH; echo \'set rport PORT\' >> RANDOM_PATH; echo \'check\' >> RANDOM_PATH; echo \'exit\' >> RANDOM_PATH; msfconsole -r RANDOM_PATH; rm RANDOM_PATH;)');

-- --------------------------------------------------------

--
-- Table structure for table `plugin`
--

CREATE TABLE `plugin` (
  `plugin_id` int(11) NOT NULL,
  `command_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plugin`
--

INSERT INTO `plugin` (`plugin_id`, `command_id`) VALUES
(70658, 1),
(71049, 1),
(90317, 1),
(20007, 3),
(26928, 3),
(31705, 3),
(42873, 3),
(65821, 3),
(66848, 3),
(79638, 3),
(81606, 3),
(91572, 3),
(35291, 4),
(83738, 5),
(83875, 5),
(12217, 6),
(10759, 7),
(77026, 7),
(89058, 8),
(78479, 9),
(80035, 9),
(34460, 10),
(11213, 11),
(73412, 12),
(74326, 13),
(77200, 13),
(57690, 14),
(57608, 15),
(58327, 16),
(90509, 16),
(125388, 16),
(10203, 17),
(10205, 17),
(42263, 17),
(44589, 17),
(58987, 17),
(64532, 17),
(76791, 17),
(78555, 17),
(85885, 17),
(97994, 17),
(101787, 17),
(102431, 17),
(119780, 17),
(72959, 18),
(73639, 18),
(76345, 18),
(78090, 18),
(84923, 18),
(85181, 18),
(90150, 18),
(90251, 18),
(91222, 18),
(94654, 18),
(103530, 18),
(10043, 19),
(10891, 19),
(41028, 19),
(10061, 20),
(10249, 21),
(12085, 22),
(18405, 23),
(30218, 23),
(58453, 23),
(15901, 24),
(45411, 24),
(51192, 24),
(57582, 24),
(69551, 24),
(97833, 25),
(99439, 25),
(100464, 26),
(82828, 27),
(125313, 28),
(105486, 29),
(111759, 29),
(118466, 29),
(118885, 29),
(123518, 29),
(76616, 30),
(26920, 31),
(42256, 32),
(84729, 33),
(108797, 33),
(79233, 34),
(88098, 35),
(97191, 36),
(15855, 37),
(18391, 38),
(54582, 38),
(78628, 39),
(53641, 40),
(121008, 41),
(111760, 42),
(10882, 43),
(97861, 44),
(90796, 45),
(58435, 46);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `command`
--
ALTER TABLE `command`
  ADD PRIMARY KEY (`command_id`);

--
-- Indexes for table `plugin`
--
ALTER TABLE `plugin`
  ADD PRIMARY KEY (`plugin_id`),
  ADD UNIQUE KEY `plugin_id` (`plugin_id`),
  ADD KEY `tools_id` (`command_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `command`
--
ALTER TABLE `command`
  MODIFY `command_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `plugin`
--
ALTER TABLE `plugin`
  ADD CONSTRAINT `plugin_ibfk_1` FOREIGN KEY (`command_id`) REFERENCES `command` (`command_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
