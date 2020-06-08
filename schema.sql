-- Schema Database SQL SERVER

-- DROP DATABASE IF EXISTS dbDatware;
-- CREATE DATABASE IF NOT EXISTS dbDatware;

-- USE dbDatware;

DROP TABLE IF EXISTS factTable;
DROP TABLE IF EXISTS perKasus;
DROP TABLE IF EXISTS perProvinsi;
DROP TABLE IF EXISTS waktu;

CREATE TABLE perProvinsi (
  kode_provinsi INT PRIMARY KEY,
  nama_provinsi VARCHAR(50) NOT NULL,
  kasus_positif INT,
  kasus_sembuh INT,
  kasus_meninggal INT
);

CREATE TABLE perKasus (
  id_kasus INT PRIMARY KEY,
  kode_provinsi INT,
  jenis_kelamin VARCHAR(5),
  umur INT,
  keterangan VARCHAR(50),
  garis_penularan VARCHAR(50),
  keterangan_status VARCHAR(50),
  wn VARCHAR(5),
  detail_wn VARCHAR(50),
  tanggal_ditambahkan DATE,
  FOREIGN KEY (kode_provinsi) REFERENCES perProvinsi(kode_provinsi)
);

CREATE TABLE waktu (
  id_waktu INT PRIMARY KEY,
  tahun VARCHAR(10),
  bulan VARCHAR(10),
  hari VARCHAR(10)
);

CREATE TABLE factTable (
  id_factTable INT PRIMARY KEY,
  id_waktu INT,
  id_kasus INT,
  jumlah_kasus_sembuh_perhari INT,
  jumlah_kasus_meninggal_perhari INT,
  jumlah_kasus_dirawat_perhari INT,
  jumlah_negatif INT,
  pdp INT,
  odp INT,
  FOREIGN KEY (id_waktu) REFERENCES waktu(id_waktu),
  FOREIGN KEY (id_kasus) REFERENCES perKasus(id_kasus)
);

-- INSERTING DATA
