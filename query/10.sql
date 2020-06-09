-- Perhitungan kelengkapan data yang ada
-- Maksud dari P pada nama kolom adalah 'Persentase'

SELECT 
    (SELECT 
        COUNT(kode_provinsi) 
    FROM 
        perKasus
    WHERE
        kode_provinsi = 0)
    * 100 / COUNT(*) as P_KodeProvinsi,
    (SELECT 
        COUNT(umur) 
    FROM 
        perKasus
    WHERE
        umur = 0)
    * 100 / COUNT(*) as P_Umur,
    (SELECT 
        COUNT(keterangan) 
    FROM 
        perKasus
    WHERE
        keterangan = '')
    * 100 / COUNT(*) as P_Keterangan,
    (SELECT 
        COUNT(garis_penularan) 
    FROM 
        perKasus
    WHERE
        garis_penularan = '')
    * 100 / COUNT(*) as P_GarisPenularan,
    (SELECT 
        COUNT(keterangan_status) 
    FROM 
        perKasus
    WHERE
        keterangan_status = '')
    * 100 / COUNT(*) as P_KeteranganStatus,
    (SELECT 
        COUNT(wn) 
    FROM 
        perKasus
    WHERE
        wn = '0')
    * 100 / COUNT(*) as P_wn,
    (SELECT 
        COUNT(detail_wn) 
    FROM 
        perKasus
    WHERE
        detail_wn = '')
    * 100 / COUNT(*) as P_DetailWN
FROM
    perKasus; 