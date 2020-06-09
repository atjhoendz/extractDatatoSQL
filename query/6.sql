-- Perhitungan rata-rata kasus spesimen diperiksa harian
SELECT TOP 1
	((
		select
			jumlah_kasus_diperiksa_spesimen
		from
			factTable t
		where 
			t.id_factTable = 98
	)/
	(
		select
			COUNT(*)
		from 
			factTable
	)
	) AS 'Rata-rata Kasus Diperiksa Spesimen'
from 
	factTable f;