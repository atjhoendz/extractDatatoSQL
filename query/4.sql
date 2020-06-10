-- Perhitungan Growth Rate kasus positif covid
--- Bulan 1
SELECT
    COUNT(factTable.id_kasus) AS JumlahBulan1
FROM
    factTable 
        JOIN perKasus ON factTable.id_kasus = perKasus.id_kasus
        JOIN perProvinsi ON perKasus.kode_provinsi = perProvinsi.kode_provinsi
WHERE
    factTable.id_waktu BETWEEN 1 AND 31
ORDER BY
    JumlahBulan1 DESC;

-- Bulan 2
SELECT
    COUNT(factTable.id_kasus) AS JumlahBulan2
FROM
    factTable 
        JOIN perKasus ON factTable.id_kasus = perKasus.id_kasus
        JOIN perProvinsi ON perKasus.kode_provinsi = perProvinsi.kode_provinsi
WHERE
    factTable.id_waktu BETWEEN 32 AND 62
ORDER BY
    JumlahBulan2 DESC;

-- Bulan 3
SELECT
    COUNT(factTable.id_kasus) AS JumlahBulan3
FROM
    factTable 
        JOIN perKasus ON factTable.id_kasus = perKasus.id_kasus
        JOIN perProvinsi ON perKasus.kode_provinsi = perProvinsi.kode_provinsi
WHERE
    factTable.id_waktu BETWEEN 63 AND 93
ORDER BY
    JumlahBulan3 DESC;