USE
    `lab7`;


-- 1. Забезпечити параметризовану вставку нових значень у таблицю Співробітники
DROP PROCEDURE IF EXISTS createCoworker;
DELIMITER
//
CREATE PROCEDURE createCoworker(
    `surname` VARCHAR(45),
    `name` VARCHAR(45),
    `seniority` INT,
    `dob` DATE,
    `passport_number` VARCHAR(100),
    `position_id` INT,
    `academic_status_id` INT,
    `degree_id` INT
)
BEGIN
    INSERT INTO coworker(`surname`, `name`, `seniority`, `dob`, `passport_number`, `position_id`, `academic_status_id`,
                         `degree_id`)
    VALUES (surname, name, seniority, dob, passport_number, position_id, academic_status_id, degree_id);
END
//
DELIMITER ;


-- 2. Забезпечити реалізацію зв’язку М:М між таблицями Співробітники та Дисципліни, тобто вставити в стикувальну
-- таблицю відповідну стрічку, при цьому відповідні стрічки мають існувати в основних таблицях
DROP PROCEDURE IF EXISTS createCoworkerDiscipline;
DELIMITER
//
CREATE PROCEDURE createCoworkerDiscipline(
    coworker_id INT,
    discipline_id INT
)
BEGIN
    if exists(select * from coworker where coworker.id = coworker_id)
        AND exists(select * from discipline where discipline.id = discipline_id)
        and not exists(select 1
                       from coworker_discipline
                       where coworker_discipline.`discipline_id` = discipline_id
                         AND coworker_discipline.`coworker_id` = coworker_id) THEN
        INSERT INTO coworker_discipline(`coworker_id`, `discipline_id`) VALUES (coworker_id, discipline_id);
    END IF;
END
//
DELIMITER ;


-- 3. Використовуючи курсор, забезпечити динамічне створення таблиць з іменами Дисципліна у поточній БД, з випадковою
-- кількістю стовпців (від 1 до 9). Імена та тип стовпців довільні.
DROP PROCEDURE IF EXISTS createTables;
DELIMITER //
CREATE PROCEDURE createTables()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE name VARCHAR(45);
    DECLARE disciplines CURSOR FOR
        SELECT discipline.`name` FROM discipline;
    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = TRUE;
    OPEN disciplines;
    posts_loop:
    LOOP
        FETCH disciplines INTO name;
        IF done THEN
            LEAVE posts_loop;
        END IF;
        SET @table_count = 1;
        while_loop:
        WHILE @table_count < 5
            DO
                SET @new_table = CONCAT('CREATE TABLE IF NOT EXISTS ', name, '(id INT, name VARCHAR(45));');
                SELECT @new_table;
                PREPARE my_query FROM @new_table;
                EXECUTE my_query;
                SET @table_count = @table_count + 1;
            END WHILE;
    END LOOP;
    CLOSE disciplines;
END;
//
DELIMITER ;
