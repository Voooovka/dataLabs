USE
    `lab7`;


-- 1. Забезпечити цілісність значень для структури БД.
-- POSITION
DROP TRIGGER IF EXISTS positionUpdate;
DELIMITER //
CREATE TRIGGER positionUpdate
    before UPDATE
    on position
    for EACH ROW
BEGIN
    if (new.id != old.id) then
        signal sqlstate '45000'
            set message_text = 'You cannot change id while updating entity';
    end if;
end //
DELIMITER ;

DROP TRIGGER IF EXISTS positionDelete;
DELIMITER //
CREATE TRIGGER positionDelete
    before DELETE
    on position
    for EACH ROW
BEGIN
    if (old.id in (select position_id from coworker)) then
        signal sqlstate '45000'
            set message_text = 'Failed to delete, because there is FK relation with this entity';
    end if;
end //
DELIMITER ;

DROP TRIGGER IF EXISTS positionDeleteLog;
DELIMITER //
CREATE TRIGGER positionDeleteLog
    after DELETE
    on position
    for EACH ROW
BEGIN
    INSERT INTO position_logs(time_deleted, name) values (now(), OLD.name);
end //
DELIMITER ;


-- ACADEMIC_STATUS
DROP TRIGGER IF EXISTS academicStatusUpdate;
DELIMITER //
CREATE TRIGGER academicStatusUpdate
    before UPDATE
    on academic_status
    for EACH ROW
BEGIN
    if (new.id != old.id) then
        signal sqlstate '45000'
            set message_text = 'You cannot change id while updating entity';
    end if;
end //
DELIMITER ;

DROP TRIGGER IF EXISTS academicStatusDelete;
DELIMITER //
CREATE TRIGGER academicStatusDelete
    before DELETE
    on academic_status
    for EACH ROW
BEGIN
    if (old.id in (select academic_status_id from coworker)) then
        signal sqlstate '45000'
            set message_text = 'Failed to delete, because there is FK relation with this entity';
    end if;
end //
DELIMITER ;


-- DEGREE
DROP TRIGGER IF EXISTS degreeUpdate;
DELIMITER //
CREATE TRIGGER degreeUpdate
    before UPDATE
    on degree
    for EACH ROW
BEGIN
    if (new.id != old.id) then
        signal sqlstate '45000'
            set message_text = 'You cannot change id while updating entity';
    end if;
end //
DELIMITER ;

DROP TRIGGER IF EXISTS degreeDelete;
DELIMITER //
CREATE TRIGGER degreeDelete
    before DELETE
    on degree
    for EACH ROW
BEGIN
    if (old.id in (select degree_id from coworker)) then
        signal sqlstate '45000'
            set message_text = 'Failed to delete, because there is FK relation with this entity';
    end if;
end //
DELIMITER ;


-- ASSESSMENT
DROP TRIGGER IF EXISTS assessmentUpdate;
DELIMITER //
CREATE TRIGGER assessmentUpdate
    before UPDATE
    on assessment
    for EACH ROW
BEGIN
    if (new.id != old.id) then
        signal sqlstate '45000'
            set message_text = 'You cannot change id while updating entity';
    end if;
end //
DELIMITER ;

DROP TRIGGER IF EXISTS assessmentDelete;
DELIMITER //
CREATE TRIGGER assessmentDelete
    before DELETE
    on assessment
    for EACH ROW
BEGIN
    if (old.id in (select assessment_id from discipline)) then
        signal sqlstate '45000'
            set message_text = 'Failed to delete, because there is FK relation with this entity';
    end if;
end //
DELIMITER ;


-- DISCIPLINE
DROP TRIGGER IF EXISTS disciplineUpdate;
DELIMITER //
CREATE TRIGGER disciplineUpdate
    before UPDATE
    on discipline
    for EACH ROW
BEGIN
    if (new.id != old.id) then
        signal sqlstate '45000'
            set message_text = 'You cannot change id while updating entity';
    end if;
end //
DELIMITER ;

DROP TRIGGER IF EXISTS disciplineDelete;
DELIMITER //
CREATE TRIGGER disciplineDelete
    before DELETE
    on discipline
    for EACH ROW
BEGIN
    if (old.id in (select discipline_id from coworker_discipline)) then
        signal sqlstate '45000'
            set message_text = 'Failed to delete, because there is FK relation with this entity';
    end if;
end //
DELIMITER ;

DROP TRIGGER IF EXISTS disciplineInsert;
DELIMITER //
CREATE TRIGGER disciplineInsert
    before INSERT
    on discipline
    for EACH ROW
BEGIN
    if (new.assessment_id not in (select id from assessment)) then
        signal sqlstate '45000'
            set message_text = 'Failed FK constraint';
    end if;
end //
DELIMITER ;


-- COWORKER
DROP TRIGGER IF EXISTS coworkerUpdate;
DELIMITER //
CREATE TRIGGER coworkerUpdate
    before UPDATE
    on coworker
    for EACH ROW
BEGIN
    if (new.id != old.id) then
        signal sqlstate '45000'
            set message_text = 'You cannot change id while updating entity';
    end if;
end //
DELIMITER ;

DROP TRIGGER IF EXISTS coworkerDelete;
DELIMITER //
CREATE TRIGGER coworkerDelete
    before DELETE
    on coworker
    for EACH ROW
BEGIN
    if (old.id in (select coworker_id from coworker_discipline)) then
        signal sqlstate '45000'
            set message_text = 'Failed to delete, because there is FK relation with this entity';
    end if;
end //
DELIMITER ;

DROP TRIGGER IF EXISTS coworkerInsert;
DELIMITER //
CREATE TRIGGER coworkerInsert
    before INSERT
    on coworker
    for EACH ROW
BEGIN
    if ((new.position_id not in (select id from position))
        OR (new.academic_status_id not in (select id from academic_status))
        OR (new.degree_id not in (select id from degree))) then
        signal sqlstate '45000'
            set message_text = 'Failed FK constraint';
    end if;
    if (new.passport_number not rlike '[A-Z]-[0-9]{6}') then
        signal sqlstate '45000'
            set message_text = 'Passport number doesn\'t match regex';
    end if;
    if (new.name not in ('Василь', 'Анна', 'Ірина', 'Андрій', 'Юрій')) then
        signal sqlstate '45000'
            set message_text = 'Wrong name';
    end if;
end //
DELIMITER ;


-- COWORKER_DISCIPLINE
DROP TRIGGER IF EXISTS coworkerDisciplineInsert;
DELIMITER //
CREATE TRIGGER coworkerDisciplineInsert
    before INSERT
    on coworker_discipline
    for EACH ROW
BEGIN
    if ((new.coworker_id not in (select id from coworker))
        OR (new.discipline_id not in (select id from discipline))) then
        signal sqlstate '45000'
            set message_text = 'Failed FK constraint';
    end if;
end //
DELIMITER ;


-- 2. для Співробітники→Серія та номер паспорту забезпечити формат вводу:  2 великі кириличні букви + '-' + 6 цифр ;
-- Done above


-- 3. у полі Співробітники →Ім’я допускається ввід лише таких імен: 'Василь', 'Анна', 'Ірина', 'Андрій' та 'Юрій'.
-- Done above


-- 4. Створити таблицю-журнал, в якій вести логи зі штампом часу при видаленні даних для таблиці Посада.
-- Done above
