/*
Урок 1. Установка СУБД, подключение к БД, просмотр и создание таблиц.

1. Создайте таблицу с мобильными телефонами, используя графический 
интерфейс. Заполните БД данными.
*/
CREATE SCHEMA `databases_and_sql_homework1` ;

CREATE TABLE `databases_and_sql_homework1`.`mobile_phones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `phone_name` VARCHAR(45) NOT NULL,
  `producing_country` VARCHAR(45) NULL,
  `year_of_manufacture` YEAR NULL,
  `tag` VARCHAR(128) NULL,
  PRIMARY KEY (`id`));

ALTER TABLE `databases_and_sql_homework1`.`mobile_phones` 
ADD COLUMN `mobile_phones_manufactureВыведите название, производителя и цену для товаров, количество которых превышает 2r` VARCHAR(45) NOT NULL AFTER `mobile_phones_price`,
ADD COLUMN `mobile_phones_quantity` INT NOT NULL AFTER `mobile_phone_producing_country`,
CHANGE COLUMN `year_of_manufacture` `mobile_phones_price` INT NOT NULL AFTER `mobile_phone_name`,
CHANGE COLUMN `phone_name` `mobile_phone_name` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `producing_country` `mobile_phone_producing_country` VARCHAR(45) NULL DEFAULT NULL ;

INSERT INTO `databases_and_sql_homework1`.`mobile_phones` (`id`, `mobile_phone_name`, `mobile_phones_price`, `mobile_phone_producing_country`, `mobile_phones_quantity`, `mobile_phones_manufacturer`) VALUES ('1', 'Samsung Galaxy S22', '76000', 'Korea', '50', 'Samsung');
INSERT INTO `databases_and_sql_homework1`.`mobile_phones` (`id`, `mobile_phone_name`, `mobile_phones_price`, `mobile_phone_producing_country`, `mobile_phones_quantity`, `mobile_phones_manufacturer`) VALUES ('2', 'Huawei P30 Pro', '75000', 'China', '56', 'Huawei');
INSERT INTO `databases_and_sql_homework1`.`mobile_phones` (`id`, `mobile_phone_name`, `mobile_phones_price`, `mobile_phone_producing_country`, `mobile_phones_quantity`, `mobile_phones_manufacturer`) VALUES ('3', 'Philips S396', '30000', 'China', '25', 'Philips');
INSERT INTO `databases_and_sql_homework1`.`mobile_phones` (`id`, `mobile_phone_name`, `mobile_phones_price`, `mobile_phone_producing_country`, `mobile_phones_quantity`, `mobile_phones_manufacturer`) VALUES ('4', 'LG G4 Stylus', '34000', 'Korea', '43', 'LG');
INSERT INTO `databases_and_sql_homework1`.`mobile_phones` (`id`, `mobile_phone_name`, `mobile_phones_price`, `mobile_phone_producing_country`, `mobile_phones_quantity`, `mobile_phones_manufacturer`) VALUES ('5', 'Apple iPhone 14', '87348', 'China', '1', 'Apple');

-- Если нужно подключиться к базе данных введём команду
USE databases_and_sql_homework1;

-- Выведем полученую таблицу
SELECT * FROM mobile_phones;

/*
1. Выведите название, производителя и цену для товаров, количество 
которых превышает 2.
*/
SELECT mobile_phone_name, mobile_phones_manufacturer, mobile_phones_price 
FROM mobile_phones 
WHERE mobile_phones_quantity > 2;

/*
3. Выведите весь ассортимент товаров марки “Samsung”.
*/
SELECT * FROM mobile_phones
WHERE mobile_phones_manufacturer = "Samsung";
