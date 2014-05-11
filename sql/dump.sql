-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 11, 2014 at 09:38 PM
-- Server version: 5.5.34-0ubuntu0.13.04.1
-- PHP Version: 5.4.9-4ubuntu2.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `free2`
--

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
(2, 1, 'Irina Mychkova', 'imychkova@gmail.com', 'First Order', '2013-12-10 17:13:18', 1),
(4, 1, 'Irina Mychkova', 'imychkova@gmail.com', 'S O', '2013-12-10 17:16:17', 1),
(5, 1, 'Irina Mychkova', 'imychkova@gmail.com', 'Third Order', '2013-12-10 17:21:19', 1),
(6, 1, 'Irina Mychkova', 'imychkova@gmail.com', 'F', '2013-12-10 17:26:25', 1),
(7, 1, 'name', 'email', 'ggggg', '2013-12-10 17:32:52', 1),
(8, 1, 'Irina Mychkova', 'imychkova@gmail.com', 'First SMTP message', '2013-12-14 13:35:03', 1),
(9, 1, 'Irina Mychkova', 'imychkova@gmail.com', 'f', '2013-12-14 13:58:40', 1),
(10, 1, 'Irina Mychkova', 'imychkova@gmail.com', 'f', '2013-12-14 14:00:18', 1),
(11, 1, 'name', 'imychkova@gmail.com', 'eeee', '2013-12-14 14:03:06', 1),
(12, 1, 'Irina Mychkova', 'imychkova@gmail.com', 'ddddd', '2013-12-14 14:06:00', 1),
(13, 1, 'Irina Mychkova', 'imychkova@gmail.com', 'Добрый день, я хочу заказать несколько уроков.', '2013-12-14 14:09:44', 1),
(14, 1, 'Irina Mychkova', 'imychkova@gmail.com', 'Хочу заказать урок', '2013-12-14 14:12:11', 1),
(15, 1, 'name', 'imychkova@gmail.com', 'добрый день, мне понравился ваш сайт, я хочу заказать урок', '2013-12-14 14:13:33', 1),
(16, 1, 'Ирина ', 'imychkova@gmail.com', 'Форма вакансий', '2013-12-22 15:49:27', 1),
(17, 1, 'Ирина ', 'imychkova@gmail.com', 'Форма вакансий', '2013-12-22 15:55:27', 1);

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
(1, 'T. Luba', 'I am satisfied.', '2013-12-05 21:54:33', 1),
(2, 'T. Luba', 'I am not satisfied.', '2013-12-07 21:54:33', 0);

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
