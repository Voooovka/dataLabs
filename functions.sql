USE
    `lab7`;


SET GLOBAL log_bin_trust_function_creators = 1;


-- 1. Для таблиці Співробітники написати функцію як буде шукати MAX стовпця Дата народження . Потім зробити вибірку
-- даних (SELECT), використовуючи дану функцію.
DROP FUNCTION IF EXISTS getMaxDob;
DELIMITER //
CREATE FUNCTION getMaxDob()
    RETURNS DATE
BEGIN
    return (SELECT MAX(coworker.dob) FROM coworker);
END //
DELIMITER ;


-- 2. Написати функцію, яка витягує за ключем між таблицями Форма навчання та Дисципліни значення поля Назва з таблиці
-- Форма навчання. Потім зробити вибірку усіх даних (SELECT) з таблиці Дисципліни, використовуючи дану функцію.
DROP FUNCTION IF EXISTS getAssessmentNameById;
DELIMITER //
CREATE FUNCTION getAssessmentNameById(
    assessment_id INT
)
    RETURNS VARCHAR(25)
BEGIN
    RETURN (
        select `name`
        from assessment
        where id = assessment_id
    );
END //
DELIMITER ;

select getMaxDob();
