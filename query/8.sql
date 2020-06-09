-- Perhitungan kasus ODP yang berstatus Masih Dalam Penyelidikan Epidemiologi (PE)

SELECT 
    (SELECT 
        COUNT(*)
    FROM 
        perKasus
    WHERE
        keterangan = "Masih proses PE")
    * 100 / COUNT(*)
FROM
    perKasus; 