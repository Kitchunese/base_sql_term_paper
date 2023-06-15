-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 15 2023 г., 04:09
-- Версия сервера: 10.4.25-MariaDB
-- Версия PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `pi_226_valyakin`
--

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `ID_clients` int(50) NOT NULL,
  `full_name_client` varchar(255) NOT NULL,
  `number_phone` int(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `adress` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `execution_orders`
--

CREATE TABLE `execution_orders` (
  `ID_order` int(50) NOT NULL,
  `ID_clients` int(50) NOT NULL,
  `ID_service` int(50) NOT NULL,
  `ID_type_of_work` int(50) NOT NULL,
  `date_of_zakaz` int(50) NOT NULL,
  `deadline` int(50) NOT NULL,
  `order_price` int(50) NOT NULL,
  `order status` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `follow_up_report`
--

CREATE TABLE `follow_up_report` (
  `ID_report` int(50) NOT NULL,
  `period_start_date` date NOT NULL,
  `period_end_date` date NOT NULL,
  `number_of_orders` int(50) NOT NULL,
  `number_of_works` int(50) NOT NULL,
  `amount_of_proceeds` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `ID_order` int(50) NOT NULL,
  `ID_clients` int(50) NOT NULL,
  `ID_service` int(50) NOT NULL,
  `ID_type_of_work` int(50) NOT NULL,
  `date_of_zakaz` int(50) NOT NULL,
  `deadline` int(50) NOT NULL,
  `order_price` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `order_invoice`
--

CREATE TABLE `order_invoice` (
  `ID_order` int(50) NOT NULL,
  `date_start` int(50) NOT NULL,
  `order_price` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `price_list`
--

CREATE TABLE `price_list` (
  `ID_service` int(50) NOT NULL,
  `ID_type_of_work` int(50) NOT NULL,
  `price` int(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `ready_orders`
--

CREATE TABLE `ready_orders` (
  `ID_order` int(50) NOT NULL,
  `ID_clients` int(50) NOT NULL,
  `ID_type_of_work` int(50) NOT NULL,
  `ID_report` int(50) NOT NULL,
  `date_of_zakaz` int(50) NOT NULL,
  `deadline` int(50) NOT NULL,
  `order_price` int(50) NOT NULL,
  `order_status` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `types_of_jobs`
--

CREATE TABLE `types_of_jobs` (
  `ID_type_of_work` int(50) NOT NULL,
  `name_work` int(40) NOT NULL,
  `price_in_rubles` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`ID_clients`);

--
-- Индексы таблицы `execution_orders`
--
ALTER TABLE `execution_orders`
  ADD PRIMARY KEY (`ID_order`);

--
-- Индексы таблицы `follow_up_report`
--
ALTER TABLE `follow_up_report`
  ADD PRIMARY KEY (`ID_report`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID_order`);

--
-- Индексы таблицы `order_invoice`
--
ALTER TABLE `order_invoice`
  ADD PRIMARY KEY (`ID_order`);

--
-- Индексы таблицы `price_list`
--
ALTER TABLE `price_list`
  ADD PRIMARY KEY (`ID_service`);

--
-- Индексы таблицы `ready_orders`
--
ALTER TABLE `ready_orders`
  ADD PRIMARY KEY (`ID_order`);

--
-- Индексы таблицы `types_of_jobs`
--
ALTER TABLE `types_of_jobs`
  ADD PRIMARY KEY (`ID_type_of_work`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `ID_clients` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `execution_orders`
--
ALTER TABLE `execution_orders`
  MODIFY `ID_order` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `follow_up_report`
--
ALTER TABLE `follow_up_report`
  MODIFY `ID_report` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `ID_order` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_invoice`
--
ALTER TABLE `order_invoice`
  MODIFY `ID_order` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `price_list`
--
ALTER TABLE `price_list`
  MODIFY `ID_service` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ready_orders`
--
ALTER TABLE `ready_orders`
  MODIFY `ID_order` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `types_of_jobs`
--
ALTER TABLE `types_of_jobs`
  MODIFY `ID_type_of_work` int(50) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `order_invoice`
--
ALTER TABLE `order_invoice`
  ADD CONSTRAINT `order_invoice_ibfk_1` FOREIGN KEY (`ID_order`) REFERENCES `ready_orders` (`ID_order`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
