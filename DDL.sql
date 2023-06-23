CREATE DATABASE RentalMobil;
USE RentalMobil;
DROP DATABASE RentalMobil;

-- DDL
CREATE TABLE Kendaraan (
  id_kendaraan INT PRIMARY KEY,
  merk VARCHAR(50),
  warna VARCHAR(50),
  harga_sewa INT,
  status_kendaraan ENUM('Tersedia', 'Tidak Tersedia') NOT NULL
);

CREATE TABLE Sopir (
  id_sopir INT PRIMARY KEY,
  id_kendaraan INT,
  nama_sopir VARCHAR(50),
  no_hp_sopir VARCHAR(20),
  status_sopir ENUM('Tersedia', 'Tidak Tersedia') NOT NULL,
  CONSTRAINT fk_sopir_id_kend FOREIGN KEY (id_kendaraan) REFERENCES Kendaraan (id_kendaraan)
);

CREATE TABLE Customer (
  id_customer INT PRIMARY KEY,
  nama_customer VARCHAR(50),
  alamat_customer VARCHAR(100),
  no_hp_customer VARCHAR(20),
  email VARCHAR(50)
);

CREATE TABLE Transaksi (
  id_transaksi INT PRIMARY KEY,
  id_kendaraan INT,
  id_sopir INT,
  id_customer INT,
  tgl_sewa DATE,
  tgl_kembali DATE,
  total_harga INT,
  tgl_pembayaran DATE,
  metode_pembayaran VARCHAR(10),
  status_transaksi VARCHAR(10),
  CONSTRAINT fk_transaksi_id_kend FOREIGN KEY (id_kendaraan) REFERENCES Kendaraan (id_kendaraan),
  CONSTRAINT fk_transaksi_id_sopir FOREIGN KEY (id_sopir) REFERENCES Sopir (id_sopir),
  CONSTRAINT fk_transaksi_id_cust FOREIGN KEY (id_customer) REFERENCES Customer (id_customer)
);

DESC Kendaraan;
DESC Sopir;
DESC Customer;
DESC Transaksi;
