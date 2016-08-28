CREATE DATABASE IF NOT EXISTS `memo`
USE `memo`;

CREATE TABLE IF NOT EXISTS `memos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `status` (
  `memo_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  KEY `memo_id` (`memo_id`),
  CONSTRAINT `status_ibfk_1` FOREIGN KEY (`memo_id`) REFERENCES `memos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `status_info` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `status_info` (`id`, `type`) VALUES
	(0, 'red'),
	(1, 'yellow'),
	(2, 'green'),
	(3, 'none');
