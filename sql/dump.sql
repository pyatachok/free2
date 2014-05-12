-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 12, 2014 at 10:00 AM
-- Server version: 5.5.6
-- PHP Version: 5.2.17-0.dotdeb.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `yas`
--

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`friend_id`),
  KEY `IDX_21EE7069A76ED395` (`user_id`),
  KEY `IDX_21EE70696A5458E8` (`friend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `friends`
--


-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `abbreviation` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `name`, `abbreviation`) VALUES
(1, 'English', 'en'),
(2, 'Français', 'fr'),
(3, 'Deutsch', 'de'),
(4, 'Español', 'es'),
(5, 'Italiano', 'it'),
(6, 'Български', 'bg'),
(7, 'Русский', 'ru');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(1024) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `functions` text CHARACTER SET utf8 NOT NULL,
  `done` text CHARACTER SET utf8 NOT NULL,
  `topic_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `topic_id` (`topic_id`),
  KEY `title` (`title`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `title`, `description`, `functions`, `done`, `topic_id`) VALUES
(1, 'Проект: Відкритий бюджет [#42]', 'ідея полягає у створенні сервісу, за допомогою якого можна було б відслідковувати бюджет країни з повною деталізацією до твого будинку.', '    повні інформаційні звіти державних установ: починаючи з головного бюджету країни, закінчуючи витратами місцевого жеку; \r\n    співставлення в часі - планували/витратили; \r\n    можливість формування онлайн запитів по закону про відкриту інформацію, та ведення історії наданих даних по цих звітах; \r\n    рейтинг найбільш прозорих міст, селищ та чиновників; \r\n    зрозуміла інфографіка та статті, які б роз''яснювали пересічному громадянину бюджетотворчій процес та його право впливати на розподіл своїх податків.', 'існує команда девелоперів та бізнес-аналітиків, що почала працювати над проектом: http://www.it-krayina.org.ua/openbudget/', 420190),
(2, 'Проект: Пряма демократія. [#21]', 'створення інструменту прямої демократії, а саме - можливості для кожного громадянина України впливати практично в реальному часі на законотворчий процесс та процесс реформування.\r\n', '    жорстка реєстрація користувачів (паспорт, ІНН тощо); \r\n    список питань, згідно якому, в форматі референдуму "так/ні", просто висловлює думку кожний пересічний громадянин (за наявності бажання впливати на процес). Список потрібно оновлювати, наприклад - раз на тиждень. \r\n    можливість обговорення непопулярних рішень; доведення у форматі суспільного далогу до населення необхідності таких рішень; \r\n    теоретично - можливість ветування суспільством окремих рішень. Наприклад, якщо рішення ветує більшість, держструктури забовязані в означений термін представити альтернативу законопроекту, детальне роз''яснення та аргументацію щодо доцільності кожного окремого пункту; \r\n    можливість інтегрування в таку систему розділу з просування кандидатів у владні органи через пряме голусування, такі "народні обранці", які найбільш підтримувані протягом певного довиборчого періоду станоляться автоматичними кандидатами на наступних виборах.\r\n', '    існує багато аналогічних систем в інших країніах; \r\n    декількома командами вже ведеться розробка прототипу системи.\r\n\r\n', 420188);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B6F7494EB6F7494E` (`question`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `question`) VALUES
(3, 'In what city did your father born?'),
(2, 'In what city did your mother born?'),
(4, 'In what city or town was your first job?'),
(1, 'What was your childhood phone number?');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL,
  `name` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Guest'),
(2, 'Member'),
(3, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `roles_parents`
--

CREATE TABLE IF NOT EXISTS `roles_parents` (
  `role_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`parent_id`),
  KEY `IDX_C70E6B91D60322AC` (`role_id`),
  KEY `IDX_C70E6B91727ACA70` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles_parents`
--

INSERT INTO `roles_parents` (`role_id`, `parent_id`) VALUES
(2, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE IF NOT EXISTS `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A393D2FBA393D2FB` (`state`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `state`) VALUES
(1, 'Disabled'),
(2, 'Enabled');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `answer` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_date` datetime DEFAULT NULL,
  `registration_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_confirmed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  KEY `IDX_8D93D649D60322AC` (`role_id`),
  KEY `IDX_8D93D64982F1BAF4` (`language_id`),
  KEY `IDX_8D93D6495D83CC1` (`state_id`),
  KEY `IDX_8D93D6491E27F6BF` (`question_id`),
  KEY `search_idx` (`username`,`first_name`,`last_name`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `user`
--


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'testuser', 'e16b2ab8d12314bf4efbd6203906ea6c'),
(2, 'new1', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `yas_lesson_order`
--

CREATE TABLE IF NOT EXISTS `yas_lesson_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `teacher_id` int(10) unsigned NOT NULL,
  `customer_name` varchar(1024) NOT NULL,
  `customer_email` varchar(1024) NOT NULL,
  `order_description` varchar(2048) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state_id` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`,`customer_name`(255),`customer_email`(255),`created`,`state_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `yas_lesson_order`
--

INSERT INTO `yas_lesson_order` (`id`, `teacher_id`, `customer_name`, `customer_email`, `order_description`, `created`, `state_id`) VALUES
(2, 1, 'Irina Mychkova', 'imychkova@gmail.com', 'First Order', '2013-12-10 12:13:18', 1),
(4, 1, 'Irina Mychkova', 'imychkova@gmail.com', 'S O', '2013-12-10 12:16:17', 1),
(5, 1, 'Irina Mychkova', 'imychkova@gmail.com', 'Third Order', '2013-12-10 12:21:19', 1),
(6, 1, 'Irina Mychkova', 'imychkova@gmail.com', 'F', '2013-12-10 12:26:25', 1),
(7, 1, 'name', 'email', 'ggggg', '2013-12-10 12:32:52', 1),
(8, 1, 'Irina Mychkova', 'imychkova@gmail.com', 'First SMTP message', '2013-12-14 08:35:03', 1),
(9, 1, 'Irina Mychkova', 'imychkova@gmail.com', 'f', '2013-12-14 08:58:40', 1),
(10, 1, 'Irina Mychkova', 'imychkova@gmail.com', 'f', '2013-12-14 09:00:18', 1),
(11, 1, 'name', 'imychkova@gmail.com', 'eeee', '2013-12-14 09:03:06', 1),
(12, 1, 'Irina Mychkova', 'imychkova@gmail.com', 'ddddd', '2013-12-14 09:06:00', 1),
(13, 1, 'Irina Mychkova', 'imychkova@gmail.com', 'Добрый день, я хочу заказать несколько уроков.', '2013-12-14 09:09:44', 1),
(14, 1, 'Irina Mychkova', 'imychkova@gmail.com', 'Хочу заказать урок', '2013-12-14 09:12:11', 1),
(15, 1, 'name', 'imychkova@gmail.com', 'добрый день, мне понравился ваш сайт, я хочу заказать урок', '2013-12-14 09:13:33', 1),
(16, 1, 'Ирина ', 'imychkova@gmail.com', 'Форма вакансий', '2013-12-22 10:49:27', 1),
(17, 1, 'Ирина ', 'imychkova@gmail.com', 'Форма вакансий', '2013-12-22 10:55:27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `yas_order_state`
--

CREATE TABLE IF NOT EXISTS `yas_order_state` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `yas_order_state`
--

INSERT INTO `yas_order_state` (`id`, `name`) VALUES
(1, 'new'),
(2, 'closed'),
(3, 'in progress'),
(4, 'rejected');

-- --------------------------------------------------------

--
-- Table structure for table `yas_review`
--

CREATE TABLE IF NOT EXISTS `yas_review` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reviewer` varchar(255) NOT NULL,
  `review_content` varchar(2048) NOT NULL,
  `review_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `moderated` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reviewer` (`reviewer`,`review_content`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `yas_review`
--

INSERT INTO `yas_review` (`id`, `reviewer`, `review_content`, `review_date`, `moderated`) VALUES
(1, 'T. Luba', 'I am satisfied.', '2013-12-05 16:54:33', 1),
(2, 'T. Luba', 'I am not satisfied.', '2013-12-07 16:54:33', 0);

-- --------------------------------------------------------

--
-- Table structure for table `yas_teacher`
--

CREATE TABLE IF NOT EXISTS `yas_teacher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(2048) NOT NULL,
  `imageUrl` varchar(1024) DEFAULT NULL,
  `urlName` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `urlName_2` (`urlName`),
  KEY `name` (`name`),
  KEY `imageUrl` (`imageUrl`(255)),
  KEY `urlName` (`urlName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `yas_teacher`
--

INSERT INTO `yas_teacher` (`id`, `name`, `description`, `imageUrl`, `urlName`) VALUES
(1, 'Ярослава Солтивская', 'Преподаватель ВНЗ с 5-летним стажем. Учитель немецкого языка', 'img/yas/Soltivska_Foto.jpg', 'yaroslava-soltivskaja'),
(2, 'Зоя Новикова', 'Преподаватель ВНЗ с 50-летним стажем', NULL, 'zoja-novikova');
