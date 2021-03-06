--^1) Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia.
SELECT `students`.`name`, `students`.`surname`, `students`.`registration_number`, `degrees`.`name`
FROM `students`
JOIN `degrees`
ON `degrees`.`id` = `students`. `degree_id`
WHERE `degrees`.`name` = 'Corso di Laurea in Economia';

--^2) Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze.
SELECT *
FROM `degrees`
JOIN `departments`
ON `department_id` = `departments`.`id`
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze';

--^3) Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44).
SELECT `teachers`.`name`, `teachers`.`surname`, `courses`.`name`
FROM `course_teacher`
JOIN `teachers`
ON `teacher_id` = `teachers`.`id`
JOIN `courses`
ON  `course_id` = `courses`.`id`
WHERE `teachers`.`name` = 'Fulvio' AND `teachers`.`surname` = 'Amato';

--^4) Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il 
--^   relativo dipartimento, in ordine alfabetico per cognome e nome.
SELECT `students`.`surname`, `students`.`name`, `degrees`.`name`, `departments`.`name`
FROM `students`
JOIN `degrees`
ON `degree_id` = `degrees`.`id`
JOIN `departments`
ON `department_id` = `departments`.`id`
ORDER BY `students`.`surname`, `students`.`name`;

--^5) Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti.
SELECT `degrees`.`name`, `courses`.`name`, `courses`.`cfu`, `teachers`.`name`, `teachers`.`surname`
FROM `course_teacher`
JOIN `teachers`
ON `teacher_id` = `teachers`.`id`
JOIN `courses`
ON `course_id` = `courses`.`id`
JOIN `degrees`
ON `degree_id` = `degrees`.`id`
ORDER BY `degrees`.`name`;


--^6) Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54).
SELECT DISTINCT `departments`.`name`, `teachers`.`surname`, `teachers`.`name`
FROM `course_teacher`
JOIN `teachers`
ON `teacher_id` = `teachers`.`id`
JOIN `courses`
ON `course_id` = `courses`.`id`
JOIN `degrees`
ON `degree_id` = `degrees`.`id`
JOIN `departments`
ON `department_id` = `departments`.`id`
WHERE `departments`.`name` = 'Dipartimento di Matematica'
ORDER BY `teachers`.`surname`, `teachers`.`name`;

--^7) BONUS: Selezionare per ogni studente quanti tentativi d???esame ha sostenuto per
--^   superare ciascuno dei suoi esami.
SELECT `students`.`surname`, `students`.`name`, `courses`.`name`, COUNT(`exam_student`.`vote`) AS `attempts`,
MAX(`exam_student`.`vote`) AS `voto_massimo` --MAX PRENDE IL VALORE MASSIMO DELLA COLONNA.
FROM `students`
JOIN `exam_student`
ON `student`.`id` = `exam_student`.`id`
JOIN `exams`
ON `exam_id` = `exams`.`id`
JOIN `courses`
ON `course_id` = `courses`.`id`
GROUP BY `students`.`id`, `courses`.`id`
HAVING `voto_massimo` >= 18;  --HAVING E COME UN WHERE MA FATTO CON PARAMETRI CHE PRIMA NON ESISTEVANO, TIPO `voto_massimo`