-- Perbandingan rata-rata kenaikan ODP & PDP dan rata-rata kenaikan kasus positif untuk memprediksi kenaikan jumlah positif kedepannya. 

-- odp hari ke 30
-- odp hari ke 60
-- odp hari ke 90

SELECT 
    id_waktu AS Hari_Ke,
    pdp AS Total_PDP,
    odp AS Total_ODP
FROM
    factTable
WHERE
    id_waktu = 30 OR 
    id_waktu = 59 OR 
    id_waktu = 98;