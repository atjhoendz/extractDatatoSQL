-- Perhitungan Growth Rate kasus positif di masing-masing provinsi

--- Bulan 1
SELECT
    perProvinsi.nama_provinsi AS Nama_Provinsi,
    COUNT(factTable.id_kasus) AS Bulan_1
FROM
    factTable 
        JOIN perKasus ON factTable.id_kasus = perKasus.id_kasus
        JOIN perProvinsi ON perKasus.kode_provinsi = perProvinsi.kode_provinsi
WHERE
    factTable.id_waktu BETWEEN 1 AND 31
GROUP BY 
    perKasus.kode_provinsi, perProvinsi.nama_provinsi
ORDER BY
    Bulan_1 DESC;

--- Bulan 2
SELECT
    perProvinsi.nama_provinsi AS Nama_Provinsi,
    COUNT(factTable.id_kasus) AS Bulan_2
FROM
    factTable 
        JOIN perKasus ON factTable.id_kasus = perKasus.id_kasus
        JOIN perProvinsi ON perKasus.kode_provinsi = perProvinsi.kode_provinsi
WHERE
    factTable.id_waktu BETWEEN 32 AND 62
GROUP BY 
    perKasus.kode_provinsi, perProvinsi.nama_provinsi
ORDER BY
    Bulan_2 DESC;

--- Bulan 3
SELECT
    perProvinsi.nama_provinsi AS Nama_Provinsi,
    COUNT(factTable.id_kasus) AS Bulan_3
FROM
    factTable 
        JOIN perKasus ON factTable.id_kasus = perKasus.id_kasus
        JOIN perProvinsi ON perKasus.kode_provinsi = perProvinsi.kode_provinsi
WHERE
    factTable.id_waktu BETWEEN 1 AND 31
    OR factTable.id_waktu BETWEEN 32 AND 62
    OR factTable.id_waktu BETWEEN 63 AND 93
GROUP BY 
    perKasus.kode_provinsi, perProvinsi.nama_provinsi
ORDER BY
    Bulan_3 DESC;

--
--