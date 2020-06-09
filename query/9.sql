-- Perhitungan kasus positif Warga Negara Asing (WNA)

SELECT
    COUNT(perKasus.wn) AS Total_WNA,
    perProvinsi.nama_provinsi as Provinsi
FROM
    perKasus JOIN perProvinsi ON perKasus.kode_provinsi = perProvinsi.kode_provinsi
WHERE
    perKasus.wn = 2
GROUP BY 
    perProvinsi.nama_provinsi
ORDER BY
    perProvinsi.nama_provinsi DESC;