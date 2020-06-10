-- Perhitungan ranking kasus positif per provinsi menggunakan sorting descend

SELECT 
    perProvinsi.nama_provinsi AS Nama_Provinsi, 
    COUNT(perKasus.kode_provinsi) AS Jumlah_Terduga_Positif
FROM 
    perKasus JOIN perProvinsi ON perKasus.kode_provinsi = perProvinsi.kode_provinsi
GROUP BY 
    perKasus.kode_provinsi, perProvinsi.nama_provinsi
ORDER BY 
    COUNT(perKasus.kode_provinsi) DESC;

