--^ 1) Selezionare tutti gli studenti nati nel 1990 (160).
SELECT `id`, `name`, `surname`, `date_of_birth`
FROM `students`
WHERE YEAR(`date_of_birth`) = '1990';
