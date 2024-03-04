-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT S.`name`, S.`surname`, D.`name` FROM `students` AS S JOIN `degrees`AS D ON S.`degree_id` = D.`id` WHERE D.`name` LIKE '%economia';
-- Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT D.name, DE.name FROM `degrees` AS D JOIN `departments` AS DE ON D.department_id = DE.id WHERE DE.name LIKE '%neuroscienze';
-- Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT T.id AS 'codice professore', C.name AS 'nome corso', T.name AS 'nome professore', T.surname AS 'cognome professore' FROM `teachers` AS T JOIN `course_teacher` AS CT ON T.id = CT.teacher_id JOIN `courses` AS C ON CT.course_id = C.id WHERE T.name = 'fulvio' AND T.surname = 'amato';
-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT D.name, D.level, S.name, S.surname, DE.name FROM `students` AS S JOIN `degrees`AS D ON S.degree_id = D.id JOIN `departments`AS DE ON D.department_id = DE.id ORDER BY S.name ASC, S.surname ASC;
-- Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT D.name AS 'nome corso', C.name AS 'nome materia', T.name AS 'nome insegnante', T.surname AS 'cognome insegnate' FROM `degrees` AS D JOIN `courses` AS C ON D.id = C.degree_id JOIN `course_teacher` AS CT ON C.id = CT.course_id JOIN `teachers` AS T ON T.id = CT.teacher_id;
--  Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DE.name AS 'nome dipartimento', T.id, T.name AS 'nome insegnate', T.surname AS 'cognome insegnate' FROM `teachers`AS T JOIN `course_teacher` AS CT ON T.id = CT.teacher_id JOIN `courses` AS C ON C.id = CT.course_id JOIN `degrees`AS D ON D.id = C.degree_id JOIN `departments` AS DE ON DE.id = D.department_id WHERE D.name LIKE '%matematica';
-- BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami
SELECT `students`.`id`, `students`.`name`, `students`.`surname`, `courses`.`name`, COUNT(`exam_student`.`vote`) AS `numero_tentativi`, MAX(`exam_student`.`vote`) AS `voto_massimo` FROM `students` JOIN `exam_student` ON `students`.`id` = `exam_student`.`student_id` JOIN `exams` ON `exam_student`.`exam_id` = `exams`.`id` JOIN `courses` ON `exams`.`course_id` = `courses`.`id` GROUP BY `students`.`id`, `courses`.`id` HAVING `voto_massimo` >= 18;
