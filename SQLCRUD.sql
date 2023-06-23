-- SQL CRUD
-- Create
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

-- Read
SELECT * FROM Kendaraan;
SELECT * FROM Sopir;
SELECT * FROM Customer;
SELECT * FROM Transaksi;

-- Update
UPDATE Kendaraan SET harga_sewa = 5000000 WHERE id_kendaraan = 5;
UPDATE Sopir SET no_hp_sopir = '08234567890' WHERE id_sopir = 456;
UPDATE Customer SET email = 'mark127@gmail.com' WHERE id_customer = 10;
UPDATE Transaksi SET total_harga = 25000000 WHERE id_transaksi = 14;

-- Delete
DELETE FROM Kendaraan WHERE id_kendaraan = 2;
DELETE FROM Sopir WHERE id_sopir = 345;
DELETE FROM Customer WHERE id_customer = 40;
DELETE FROM Transaksi WHERE id_transaksi = 14;
