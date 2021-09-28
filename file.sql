--^ 1) Selezionare tutti gli studenti nati nel 1990 (160).
SELECT `id`, `name`, `surname`, `date_of_birth`
FROM `students`
WHERE YEAR(`date_of_birth`) = '1990';

--^ 2) Selezionare tutti i corsi che valgono più di 10 crediti (479).
SELECT `id`, `degree_id`, `name`, `cfu`
FROM `courses`
WHERE `cfu` >= 10;

--^3) Selezionare tutti gli studenti che hanno più di 30 anni.

SELECT `id`, `name`, `surname`, `date_of_birth`
FROM `students`
WHERE YEAR(`date_of_birth`) >= '1990';
--Mi viene da dire che questa soluzione al momento è giusta cosi, ma il prossimo anno non lo sarà più perchè 
--andranno inclusi anche i nati nel 1991 e cosi per ogni anno a venire.