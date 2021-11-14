CREATE TABLE temperature(
	id SERIAL PRIMARY KEY not null,
	temperature FLOAT not null,
	humidity FLOAT not null,
	full_date DATE not null,
	full_hour TIME not null
)

INSERT INTO temperature(temperature, humidity, full_date, full_hour) 
VALUES(23.8, 67.1, '2021-10-30', '16:24:21')

SELECT * FROM temperature