/* Assignment #2, Question #1 */
DROP TABLE IF EXISTS `customers_copy`;
CREATE TABLE `customers_copy` LIKE `customers`;
INSERT INTO `customers_copy` SELECT * FROM `customers`;

DROP TABLE IF EXISTS `products_copy`;
CREATE TABLE `products_copy` LIKE `products`;
INSERT INTO `products_copy` SELECT * FROM `products`;

DROP TABLE IF EXISTS `addresses_copy`;
CREATE TABLE `addresses_copy` LIKE `addresses`;
INSERT INTO `addresses_copy` SELECT * FROM `addresses`;
