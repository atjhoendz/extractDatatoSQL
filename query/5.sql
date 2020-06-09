-- Pengambilan informasi tingkat kematian dan korelasinya dengan umur

SELECT
    umur as Umur,
    COUNT(umur) as Jumlah_Orang
FROM
    perKasus
GROUP BY 
    umur
ORDER BY
    Jumlah_Orang DESC;

