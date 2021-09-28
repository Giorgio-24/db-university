--^ 1) Selezionare tutti gli studenti nati nel 1990 (160).
SELECT `id`, `name`, `surname`, `date_of_birth`
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990;

--^ 2) Selezionare tutti i corsi che valgono più di 10 crediti (479).
SELECT `id`, `degree_id`, `name`, `cfu`
FROM `courses`
WHERE `cfu` >= 10;

--^3) Selezionare tutti gli studenti che hanno più di 30 anni.
SELECT `id`, `name`, `surname`, `date_of_birth`
FROM `students`
WHERE YEAR(`date_of_birth`) >= 1990;
--Mi viene da dire che questa soluzione al momento è giusta cosi, ma il prossimo anno non lo sarà più perchè 
--andranno inclusi anche i nati nel 1991 e cosi per ogni anno a venire.

--^4) Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286).
SELECT `id`, `name`, `period`, `year`
FROM `courses`
WHERE `year` = 1 AND `period` = 'I semestre';

--^5) Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21).
SELECT `id`, `course_id`, `date`, `hour`
FROM `exams`
WHERE `date`= '2020/06/20' AND hour(`hour`) >= 14;

--^6) Selezionare tutti i corsi di laurea magistrale (38).
SELECT `id`, `department_id`, `name`, `level`
FROM `degrees`
WHERE `level` = 'magistrale';

--^7) Da quanti dipartimenti è composta l'università? (12).
SELECT COUNT(*)
FROM `departments`;

--^8) Quanti sono gli insegnanti che non hanno un numero di telefono? (50).
SELECT COUNT(*)
FROM `teachers`
WHERE ISNULL(`phone`);

--^9) Contare quanti iscritti ci sono stati ogni anno.
SELECT COUNT(*), YEAR(`enrolment_date`)
FROM `students`
GROUP BY YEAR(`enrolment_date`);

--^10) Contare gli insegnanti che hanno l'ufficio nello stesso edificio.
SELECT COUNT(*), `office_address`
FROM `teachers`
GROUP BY `office_address`;

--^11) Calcolare la media dei voti di ogni appello d'esame.


--^12) Contare quanti corsi di laurea ci sono per ogni dipartimento.
