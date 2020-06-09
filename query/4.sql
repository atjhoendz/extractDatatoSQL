-- Perhitungan Growth Rate kasus positif covid
select 
	f.id_kasus
from 
	factTable f
inner join perKasus k
	ON f.id_kasus = k.id_kasus
inner join perProvinsi p
	ON p.kode_provinsi = k.kode_provinsi
where 
	id_waktu >= 31
	AND
	id_waktu <= 60
group by 
	f.id_kasus