SELECT species_name
fROM species
ORDER BY species_id
LIMIT 1;

SELECT species_name
fROM species
WHERE species_amount > 1800;


SELECT species_name
fROM species
WHERE species_name LIKE 'п%' 
AND type_id = 5;


SELECT species_name
fROM species
WHERE species_name LIKE '_са' 
OR species_amount = 5
;


SELECT species_name
FROM species
WHERE EXTRACT(YEAR FROM date_start) = 2023;

SELECT s.species_name
FROM species s
JOIN species_in_places sp
ON s.species_id = sp.species_id
WHERE sp.place_id = 3 
AND s.species_status = 'absent'
;


SELECT s.species_name,
s.species_amount
FROM species s
JOIN species_in_places sp
ON s.species_id = sp.species_id
JOIN places pl 
ON sp.place_id = pl.place_id
WHERE pl.place_name = 'дом'
AND EXTRACT(MONTH FROM s.date_start) = 5
;


SELECT species_name
FROM species
WHERE species_name LIKE '% %';



SELECT s.species_name
FROM species s
WHERE s.date_start = (
    SELECT date_start
    FROM species
    WHERE species_name = 'малыш'
) 
AND s.species_id != (
    SELECT species_id
    FROM species
    WHERE species_name = 'малыш'
);


SELECT s.species_name
FROM species s
JOIN species_in_places sp ON s.species_id = sp.species_id
JOIN places p ON sp.place_id = p.place_id
WHERE p.place_name IN ('сарай', 'дом')
AND p.place_size = (
    SELECT MAX(place_size)
    FROM places
    WHERE place_name IN ('сарай', 'дом')
);


SELECT * FROM (
    SELECT s.species_name
    FROM species s
    JOIN species_in_places sip ON s.species_id = sip.species_id
    JOIN places pl ON pl.place_id = sip.place_id
    WHERE pl.place_name = 'дом'
    ORDER BY s.species_amount DESC
    LIMIT 1 OFFSET 4
) AS fifth_result;


SELECT s.species_name
FROM species s
WHERE s.species_status = 'fairy'
AND s.species_id NOT IN (
    SELECT species_id
    FROM species_in_places
);
