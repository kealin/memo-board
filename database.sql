/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for memo
CREATE DATABASE IF NOT EXISTS `memo` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `memo`;


-- Dumping structure for taulu memo.memos
CREATE TABLE IF NOT EXISTS `memos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table memo.memos: ~1 rows (suunnilleen)
/*!40000 ALTER TABLE `memos` DISABLE KEYS */;
INSERT INTO `memos` (`id`, `title`, `content`, `date`) VALUES
	(1, 'otsikko', 'viesti', '2016-08-26 17:15:17');
/*!40000 ALTER TABLE `memos` ENABLE KEYS */;


-- Dumping structure for taulu memo.status
CREATE TABLE IF NOT EXISTS `status` (
  `memo_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  KEY `memo_id` (`memo_id`),
  CONSTRAINT `status_ibfk_1` FOREIGN KEY (`memo_id`) REFERENCES `memos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table memo.status: ~1 rows (suunnilleen)
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` (`memo_id`, `status_id`) VALUES
	(1, 0);
/*!40000 ALTER TABLE `status` ENABLE KEYS */;


-- Dumping structure for taulu memo.status_info
CREATE TABLE IF NOT EXISTS `status_info` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table memo.status_info: ~4 rows (suunnilleen)
/*!40000 ALTER TABLE `status_info` DISABLE KEYS */;
INSERT INTO `status_info` (`id`, `type`) VALUES
	(0, 'red'),
	(1, 'yellow'),
	(2, 'green'),
	(3, 'none');
/*!40000 ALTER TABLE `status_info` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
