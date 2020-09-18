DROP TABLE IF EXISTS full_data;

CREATE TABLE full_data(
	patient_id INTEGER PRIMARY KEY
	, age FLOAT
	, blood_pressure FLOAT
	, exercise FLOAT
	, weight FLOAT
	,glucose FLOAT
	, BMI FLOAT
	, planet_id INTEGER
);

INSERT INTO full_data
SELECT d.patient_id, d.age, b.blood_pressure, b.exercise, b.weight, b.glucose, b.bmi, b.planet_id
FROM deidentify as d
JOIN boran as b
ON d.patient_id = b.patient_id	
UNION
SELECT d.patient_id, d.age, r.blood_pressure, r.exercise, r.weight, r.glucose, r.bmi, r.planet_id
FROM deidentify as d
JOIN radan as r
ON d.patient_id = r.patient_id;