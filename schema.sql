-- Schema Database

CREATE DATABASE IF NOT EXISTS dbDatware;

USE dbDatware;

DROP TABLE IF EXISTS perProvinsi;

CREATE TABLE perProvinsi (
  kode_provinsi INT PRIMARY KEY,
  nama_provinsi VARCHAR(50) NOT NULL,
  kasus_positif INT,
  kasus_sembuh INT,
  kasus_meninggal INT
);

DROP TABLE IF EXISTS perKasus;

CREATE TABLE perKasus (
  id_kasus INT PRIMARY KEY,
  kode_provinsi INT,
  jenis_kelamin VARCHAR(2),
  umur INT,
  keterangan VARCHAR(50),
  garis_penularan VARCHAR(50),
  keterangan_status VARCHAR(50),
  wn VARCHAR(5),
  detail_wn VARCHAR(50),
  tanggal_ditambahkan DATE,
  FOREIGN KEY (kode_provinsi) REFERENCES perProvinsi(kode_provinsi)
);

-- INSERTING DATA
