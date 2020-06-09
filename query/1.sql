-- Perhitungan Case Fatality Rate dan pengaruhnya dalam intensitas penanganan di masing-masing provinsi

SELECT
	nama_provinsi,
	kasus_positif,
	kasus_meninggal,
	(
		((
			SELECT
				kasus_meninggal
			FROM 
				perProvinsi o
			WHERE 
				o.nama_provinsi = p.nama_provinsi
		) * 100)/
		(
			SELECT
				kasus_positif
			FROM
				perProvinsi o
			WHERE
				o.nama_provinsi = p.nama_provinsi
		)
	) AS 'CFR %'
FROM
	perProvinsi p;