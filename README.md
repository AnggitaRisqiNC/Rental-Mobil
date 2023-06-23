# Database Rental Mobil
## Anggota Kelompok
> 1. **Zahra Nurhaliza** (312210364)
> 2. **Hafiz Faturrahman** (312210375)
> 3. **Liskania Aprilia** (312210383)
> 4. **Anggita Risqi Nur Clarita** (312210450)
> 5. **Faizah Via Fadhillah** (312210460)

## DAFTAR ISI <br>
| No | Description | Link |
|-----|------|-----|
|1|Perintah|[Click Here](#perintah)|
|2|ER-D Rental Mobil|[Click Here](#er-d-rental-mobil)|
|3|DDL Rental Mobil|[Click Here](#ddl-rental-mobil)|
|4|SQL CURD Rental Mobil|[Click Here](#sql-curd-rental-mobil)|
|5|SQL Join Rental Mobil|[Click Here](#sql-join-rental-mobil)|

## Perintah
![image](https://github.com/AnggitaRisqiNC/Rental-Mobil/blob/main/screenshot/Perintah%20Soal.png)

### ER-D Rental Mobil
![image](https://github.com/AnggitaRisqiNC/Rental-Mobil/blob/main/ER-D%20Rental%20Mobil/ER-D%20Rental%20Mobil.jpeg)

### DDL Rental Mobil
#### 1. Membuat Database
```sql
CREATE DATABASE RentalMobil;
```
> Untuk membuat database gunakan perintah: `CREATE DATABASE [nama_database];`.

#### 2. Masuk ke dalam database menggunakan perintah USE
```sql
USE RentalMobil;
```
> Perintah USE, digunakan untuk masuk kedalam database, atau
berganti ke database lain.

#### 3. Menghapus Database
```sql
DROP DATABASE RentalMobil;
```
> Untuk menghapus database, gunakan perintah: `DROP DATABASE [nama_database];`

#### 4. Membuat Tabel
```sql
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
```

> Sebelum membuat Tabel, pastikan database aktif yang digunakan dengan terlebih dahulu masuk kedalam databasenya, dengan perintah USE.
> Dalam script di atas, telah dibuat tabel-tabel sesuai dengan skema ERD yang telah disebutkan. Tabel-tabel tersebut antara lain: Kendaraan, Sopir, Customer, Transaksi, dan Laporan_Transaksi. Setiap tabel memiliki kolom-kolom yang sesuai dengan atribut-atribut yang terdapat dalam skema ERD, dan beberapa di antaranya memiliki tipe data yang sesuai seperti VARCHAR, INT, ENUM, dan DATE. Tabel-tabel tersebut juga saling memiliki relasi.


#### 5. Menampilkan Struktur Tabel
```sql
DESC Kendaraan;
```
![image](https://github.com/AnggitaRisqiNC/Rental-Mobil/blob/main/screenshot/1.png)

```sql
DESC Sopir;
```
![image](https://github.com/AnggitaRisqiNC/Rental-Mobil/blob/main/screenshot/2.png)

```sql
DESC Costumer;
```
![image](https://github.com/AnggitaRisqiNC/Rental-Mobil/blob/main/screenshot/3.png)

```sql
DESC Transaksi;
```
![image](https://github.com/AnggitaRisqiNC/Rental-Mobil/blob/main/screenshot/4.png)


> Untuk menampilkan struktur tabel yang sudah dibuat, gunakan
perintah: `DESC [nama_tabel];`


### SQL CURD Rental Mobil
#### Create
```sql
INSERT INTO Kendaraan (id_kendaraan, merk, warna, harga_sewa, status_kendaraan)
VALUES (1, 'Tesla', 'Hitam', 4000000, 'Tersedia'), 
	   (2, 'Wuling', 'Cream', 1000000, 'Tidak Tersedia'),
       (3, 'Lamborghini', 'Putih', 5000000, 'Tersedia'),
       (4, 'Porsche', 'Biru', 7000000, 'Tersedia'),
       (5, 'Alphard', 'Silver', 3000000, 'Tersedia'),
       (6, 'Hummer', 'Kuning', 6000000, 'Tersedia'),
       (7, 'Ferrari', 'Merah', 8000000, 'Tidak Tersedia');

INSERT INTO Sopir (id_sopir, id_kendaraan, nama_sopir, no_hp_sopir, status_sopir)
VALUES (123, 1, 'Johnny', '08123456789', 'Tersedia'),
	   (234, 3, 'Yuta', '08234567890', 'Tersedia'),
       (345, 2, 'Jay', '08345678901', 'Tidak Tersedia'),
       (456, 5, 'Eric', '08456789012', 'Tersedia'),
       (567, 4, 'Sehun', '08567890123', 'Tersedia'),
	   (678, 6, 'Felix', '08678901234', 'Tersedia');

INSERT INTO Customer (id_customer, nama_customer, alamat_customer, no_hp_customer, email)
VALUES (10, 'Mark', 'Jl. Ilichil No. 127', '0802081999', 'mark@gmail.com'), 
	   (20, 'Karina', 'Jl. Kwangya No. 140', '0811042000', 'karina@gmail.com'),
	   (30, 'Malfoy', 'Jl. Epsom No. 160', '0822091987', 'malfoy@gmail.com'),
       (40, 'Yeri', 'Jl. Cake No. 539', '0805031999', 'yeri@gmail.com'),
       (50, 'Jake', 'Jl. Carat No. 96', '0815061996', 'Hoshi@gmail.com');

INSERT INTO Transaksi (id_transaksi, id_kendaraan, id_sopir, id_customer, tgl_sewa, tgl_kembali, total_harga, tgl_pembayaran, metode_pembayaran, status_transaksi)
VALUES (11, 3, 234, 10, '2023-03-13', '2023-03-18', 25000000, '2023-03-13', 'Cash', 'Selesai'),
	   (12, 4, 567, 30, '2023-04-17', '2023-04-22', 35000000, '2023-04-17', 'Cash', 'Selesai'),
       (13, 1, 123, 20, '2023-05-08', '2023-05-13', 20000000, '2023-05-08', 'Debit', 'Selesai'),
	   (14, 5, 456, 40, '2023-06-12', '2023-06-19', 15000000, '2023-06-12', 'Debit', 'Selesai'),
       (15, 6, 678, 50, '2023-07-09', '2023-07-14', 30000000, '2023-07-09', 'Cash', 'Selesai');
```

> **Create** : Fungsi ini digunakan untuk menambahkan data baru ke dalam database menggunakan perintah SQL `INSERT INTO <table> (field1, ..., fieldn) VALUES (value1, ..., valuen)`. Dengan fungsi ini, kita dapat menambahkan data baru ke dalam database.


#### Read
```sql
SELECT * FROM Kendaraan;
```
![image](https://github.com/AnggitaRisqiNC/Rental-Mobil/blob/main/screenshot/5.png)

```sql
SELECT * FROM Sopir;
```
![image](https://github.com/AnggitaRisqiNC/Rental-Mobil/blob/main/screenshot/6.png)

```sql
SELECT * FROM Costumer;
```
![image](https://github.com/AnggitaRisqiNC/Rental-Mobil/blob/main/screenshot/7.png)

```sql
SELECT * FROM Transaksi;
```
![image](https://github.com/AnggitaRisqiNC/Rental-Mobil/blob/main/screenshot/8.png)


> **Read** : Fungsi ini digunakan untuk membaca data dari database menggunakan perintah SQL `SELECT * FROM <table>`. Dengan fungsi ini, kita dapat membaca data yang sudah tersimpan dalam database sebelumnya yaitu data Kendaraan, Sopir, Customer, Transaksi, dan Laporan_Transaksi.


#### Update
```sql
UPDATE Kendaraan SET harga_sewa = 5000000 WHERE id_kendaraan = 5;
```
![image](https://github.com/AnggitaRisqiNC/Rental-Mobil/blob/main/screenshot/9.png)

```sql
UPDATE Sopir SET no_hp_sopir = '08234567890' WHERE id_sopir = 456;
```
![image](https://github.com/AnggitaRisqiNC/Rental-Mobil/blob/main/screenshot/10.png)

```sql
UPDATE Customer SET email = 'mark127@gmail.com' WHERE id_customer = 10;
```
![image](https://github.com/AnggitaRisqiNC/Rental-Mobil/blob/main/screenshot/11.png)

```sql
UPDATE Transaksi SET total_harga = 25000000 WHERE id_transaksi = 14;
```
![image](https://github.com/AnggitaRisqiNC/Rental-Mobil/blob/main/screenshot/12.png)


> **Update** : Fungsi ini digunakan untuk memperbarui data yang sudah ada di dalam database menggunakan perintah SQL `UPDATE <table> SET field1=val1, ..., fieldn=valn WHERE <kondisi>`. Dengan fungsi ini, kita dapat mengubah data yang sudah tersimpan dalam database.


#### Delete
```sql
DELETE FROM Kendaraan WHERE id_kendaraan = 2;
```
![image](https://github.com/AnggitaRisqiNC/Rental-Mobil/blob/main/screenshot/13.png)

```sql
DELETE FROM Sopir WHERE id_sopir = 345;
```
![image](https://github.com/AnggitaRisqiNC/Rental-Mobil/blob/main/screenshot/14.png)

```sql
DELETE FROM Customer WHERE id_customer = 40;
```
![image](https://github.com/AnggitaRisqiNC/Rental-Mobil/blob/main/screenshot/15.png)

```sql
DELETE FROM Transaksi WHERE id_transaksi = 014;
```
![image](https://github.com/AnggitaRisqiNC/Rental-Mobil/blob/main/screenshot/16.png)


> **Delete** : Fungsi ini digunakan untuk menghapus data yang sudah ada di dalam database menggunakan perintah SQL `DELETE FROM <table> WHERE <kondisi>`. Dengan fungsi ini, kita dapat menghapus data yang sudah tersimpan dalam database.


### SQL JOIN Rental Mobil
> ### *JOIN TABLE*
> Operasi Join merupakan operasi yang digunakan untuk menggabungkan dua tabel atau lebih dengan hasil berupa gabungan dari kolom-kolom yang berasal dari tabel-tabel tersebut

> ### *Jenis JOIN*
> 1. **NATURAL JOIN / INNER JOIN** : Digunakan untuk menampilkan baris tabel yang memiliki nilai yang sama pada kolom yang terkait.
>
> 2. **LEFT JOIN** : Digunakan untuk menampilkan semua data pada table A dan sebagian data pada table B yang bersinggungan dengan table A.
>
> 3. **RIGHT JOIN** : Digunakan untuk menampilkan semua data pada table B dan sebagian data pada table A yang bersinggungan dengan table B.
>
> 4. **FULL JOIN / UNION** : Digunakan untuk menampilkan semua data pada table A dan B.

### 1. INNER JOIN
```sql
SELECT Transaksi.id_transaksi, Kendaraan.merk, Sopir.nama_sopir, Customer.nama_customer
FROM Transaksi
INNER JOIN Kendaraan ON Transaksi.id_kendaraan = Kendaraan.id_kendaraan
INNER JOIN Sopir ON Transaksi.id_sopir = Sopir.id_sopir
INNER JOIN Customer ON Transaksi.id_customer = Customer.id_customer;
```

![image](https://github.com/AnggitaRisqiNC/Rental-Mobil/blob/main/screenshot/17.png)

> Menampilkan Id transaksi, Merk kendaraan, Nama sopir, dan Nama customer.


### 2. LEFT JOIN
```sql
SELECT Transaksi.id_transaksi, Kendaraan.merk, Transaksi.total_harga, Customer.nama_customer, Transaksi.status_transaksi
FROM Transaksi
LEFT JOIN Kendaraan ON Transaksi.id_kendaraan = Kendaraan.id_kendaraan
LEFT JOIN Customer ON Transaksi.id_customer = Customer.id_customer;
```

![image](https://github.com/AnggitaRisqiNC/Rental-Mobil/blob/main/screenshot/18.png)

> Menampilkan Id_transaksi, Merk kendaraan, Total harga, Nama sopir, Nama customer, dan Status transaksi.


### 3. RIGHT JOIN
```sql
SELECT Transaksi.id_transaksi, Transaksi.total_harga, Sopir.nama_sopir, Customer.nama_customer
FROM Transaksi
RIGHT JOIN Sopir ON Transaksi.id_sopir = Sopir.id_sopir
RIGHT JOIN Customer ON Transaksi.id_customer = Customer.id_customer;
```

![image](https://github.com/AnggitaRisqiNC/Rental-Mobil/blob/main/screenshot/19.png)

> Menampilkan Id_transaksi, Total harga, Nama sopir, dan Nama customer.


### 4. UNION JOIN
```sql
SELECT * FROM Transaksi
LEFT OUTER JOIN Customer ON Transaksi.id_customer = Customer.id_customer
UNION
SELECT * FROM Transaksi
LEFT OUTER JOIN Customer ON Transaksi.id_customer = Customer.id_customer;
```

![image](https://github.com/AnggitaRisqiNC/Rental-Mobil/blob/main/screenshot/20.png)
![image](https://github.com/AnggitaRisqiNC/Rental-Mobil/blob/main/screenshot/21.png)

> Menampilkan semua data pada table Transaksi dan sebagian data pada table Customer yang bersinggungan dengan table Transaksi.

## Finish