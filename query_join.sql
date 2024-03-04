-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT S.`name`, S.`surname`, D.`name` FROM `students` AS S JOIN `degrees`AS D ON S.`degree_id` = D.`id` WHERE D.`name` LIKE '%economia';
-- Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT D.name, DE.name FROM `degrees` AS D JOIN `departments` AS DE ON D.department_id = DE.id WHERE DE.name LIKE '%neuroscienze';
-- Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT T.id AS 'codice professore', C.name AS 'nome corso', T.name AS 'nome professore', T.surname AS 'cognome professore' FROM `teachers` AS T JOIN `course_teacher` AS CT ON T.id = CT.teacher_id JOIN `courses` AS C ON CT.course_id = C.id WHERE T.name = 'fulvio' AND T.surname = 'amato';
-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT D.name, D.level, S.name, S.surname, DE.name
FROM `students` AS S 
JOIN `degrees`AS D 
ON S.degree_id = D.id
JOIN `departments`AS DE 
ON D.department_id = DE.id
ORDER BY S.name ASC,
ORDER BY `students`.surname ASC;


