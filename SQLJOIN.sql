-- SQL JOIN
SELECT Transaksi.id_transaksi, Kendaraan.merk, Sopir.nama_sopir, Customer.nama_customer
FROM Transaksi
INNER JOIN Kendaraan ON Transaksi.id_kendaraan = Kendaraan.id_kendaraan
INNER JOIN Sopir ON Transaksi.id_sopir = Sopir.id_sopir
INNER JOIN Customer ON Transaksi.id_customer = Customer.id_customer;

SELECT Transaksi.id_transaksi, Kendaraan.merk, Transaksi.total_harga, Customer.nama_customer, Transaksi.status_transaksi
FROM Transaksi
LEFT JOIN Kendaraan ON Transaksi.id_kendaraan = Kendaraan.id_kendaraan
LEFT JOIN Customer ON Transaksi.id_customer = Customer.id_customer;

SELECT Transaksi.id_transaksi, Transaksi.total_harga, Sopir.nama_sopir, Customer.nama_customer
FROM Transaksi
RIGHT JOIN Sopir ON Transaksi.id_sopir = Sopir.id_sopir
RIGHT JOIN Customer ON Transaksi.id_customer = Customer.id_customer;

SELECT * FROM Transaksi
LEFT OUTER JOIN Customer ON Transaksi.id_customer = Customer.id_customer
UNION
SELECT * FROM Transaksi
LEFT OUTER JOIN Customer ON Transaksi.id_customer = Customer.id_customer;
