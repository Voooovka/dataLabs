-- 1
-- Вивести всі кораблі, що брали участь у битві
-- 'Guadalcanal' та не були потопленими. Вивести: ship, battle, result.
-- Вихідні дані впорядкувати за спаданням за стовпцем ship. 
 
SELECT ship, battle, result FROM Outcomes
WHERE Outcomes.battle = 'Guadalcanal'
AND NOT Outcomes.result = 'sunk';
-- ORDER BY ship DESC; 

-- 2
-- З таблиці Ships вивести назви кораблів та роки їх
-- спущення на воду, назва яких не закінчується літерою 'a'.

SELECT name, launched FROM Ships
WHERE name NOT LIKE '%a'; 

-- 3
-- Виведіть усі можливі моделі ПК, їх виробників
-- та ціну (якщо вона вказана). Вивести: maker, model, price.
  
SELECT DISTINCT product.model, maker, price FROM product JOIN pc ON product.model = pc.model;

-- 4
-- Знайти виробників ПК, моделей яких немає в
-- продажу (тобто відсутні в таблиці PC).

-- SELECT DISTINCT maker FROM Product
-- where model in (select model from pc);

-- 5
-- За Вашингтонським міжнародним договором від
-- початку 1922 р. заборонялося будувати лінійні кораблі
-- водотоннажністю понад 35 тис. тонн. Вкажіть кораблі, що порушили
-- цей договір (враховувати лише кораблі з відомим роком спущення на
-- воду, тобто з таблиці Ships). Виведіть: name, launched, displacement.
 
SELECT name, launched, displacement
FROM ships JOIN classes ON ships.class = classes.class
WHERE launched > 1922
AND displacement > 35000;

-- 6
-- Для таблиці Printer вивести всю інформацію з
-- коментарями в кожній комірці, наприклад, 'модель: 1276', 'ціна:400,00' і т.д.

SELECT CONCAT('Model: ', model) AS Model,
CONCAT('Gray scale: ', color) AS IsGrayScale,
CONCAT('Type: ', type) AS Type,
CONCAT('Price: ', price) AS Price 
FROM Printer; 

-- 7
-- Знайти тих виробників ПК, усі моделі ПК яких є
-- в наявності в таблиці PC (використовувати засоби групової
-- статистики). Вивести maker.

SELECT Product.maker FROM Product LEFT JOIN pc ON PC.model = Product.model
WHERE Product.type = 'PC'
GROUP BY Product.maker
HAVING COUNT(Product.model) = COUNT(PC.model);

-- 8 
-- Вкажіть назву, водотоннажність та число гармат
-- кораблів, що брали участь у битві при 'Guadalcanal'. Вивести: ship,
-- displacement, numGuns. (Підказка: використовувати підзапити в
-- якості обчислювальних стовпців)

select outcomes.ship, displacement, numGuns from ships
inner join classes on ships.class=classes.class
inner join outcomes on ships.name=outcomes.ship
inner join battles on battles.name=outcomes.battle
where battles.name='Guadalcanal';




