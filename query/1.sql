-- Perhitungan Case Fatality Rate dan pengaruhnya dalam intensitas penanganan di masing-masing provinsi

select
	nama_provinsi,
	kasus_positif,
	kasus_meninggal,
	(
		((
			select
				kasus_meninggal
			from 
				perProvinsi o
			where 
				o.nama_provinsi = p.nama_provinsi
		) * 100)/
		(
			select
				kasus_positif
			from
				perProvinsi o
			where
				o.nama_provinsi = p.nama_provinsi
		)
	) AS 'CFR %'
from
	perProvinsi p;