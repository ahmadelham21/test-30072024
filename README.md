## 1. Generate Table

tabel BARANG untuk menyimpan data barang dan tabel JUAL untuk data penjualan, lalu mengisi kedua tabel dengan beberapa entri. Kemudian, kode ini menampilkan seluruh data dari tabel JUAL dan menghasilkan daftar barang dengan total jumlah penjualan mereka, menggunakan LEFT JOIN untuk menyertakan barang yang mungkin tidak terjual. Fungsi COALESCE memastikan nilai nol jika tidak ada penjualan, dan hasilnya diurutkan berdasarkan KODEBRG.

```sql
CREATE TABLE BARANG (
	KODEBRG int NOT NULL,
	NAMABRG varchar(255) NOT NULL
);

INSERT INTO BARANG (KODEBRG, NAMABRG) VALUES (1, 'MEJA');
INSERT INTO BARANG (KODEBRG, NAMABRG) VALUES (2, 'KURSI');
INSERT INTO BARANG (KODEBRG, NAMABRG) VALUES (3, 'LAMPU');

CREATE TABLE JUAL (
	KODEBRG int NOT NULL,
	JUMLAH int NOT NULL
);

INSERT INTO JUAL (KODEBRG, JUMLAH) VALUES (1, 2);
INSERT INTO JUAL (KODEBRG, JUMLAH) VALUES (1, 3);
INSERT INTO JUAL (KODEBRG, JUMLAH) VALUES (2, 4);

SELECT * FROM JUAL;

SELECT a.KODEBRG,
a.NAMABRG,
COALESCE(SUM(B.JUMLAH),0) AS JML_JUAL
FROM BARANG a
LEFT JOIN JUAL B
ON a.KODEBRG = b.KODEBRG
GROUP BY a.NAMABRG, a.KODEBRG
ORDER BY a.KODEBRG
ASC;

```

## 2. History Stock

tabel HISTORYSTOKBARANG untuk menyimpan riwayat stok barang dengan kolom KODESTOK, TANGGAL, KODEBARANG, dan STOKAKHIR, lalu mengisinya dengan beberapa entri. Selanjutnya, kode ini menampilkan seluruh data dari tabel tersebut. Dengan menggunakan CTE (Common Table Expression) TANGGALTERAKHIR, kode ini mengidentifikasi tanggal terakhir untuk setiap barang. Query utama kemudian memilih stok akhir dari barang pada tanggal terakhirnya, menggabungkan data dengan CTE, dan mengurutkan hasil berdasarkan KODEBARANG.

```sql


CREATE TABLE HISTORYSTOKBARANG (
	KODESTOK int NOT NULL,
	TANGGAL DATE,
	KODEBARANG char(1),
	STOKAKHIR int
);

INSERT INTO HISTORYSTOKBARANG (KODESTOK, TANGGAL, KODEBARANG, STOKAKHIR)
VALUES (1, '2009-01-01', 'A', 2);
INSERT INTO HISTORYSTOKBARANG (KODESTOK, TANGGAL, KODEBARANG, STOKAKHIR)
VALUES (2, '2009-01-02', 'A', 5);
INSERT INTO HISTORYSTOKBARANG (KODESTOK, TANGGAL, KODEBARANG, STOKAKHIR)
VALUES (3, '2009-01-02', 'B', 1);
INSERT INTO HISTORYSTOKBARANG (KODESTOK, TANGGAL, KODEBARANG, STOKAKHIR)
VALUES (4, '2009-01-03', 'A', 3);
INSERT INTO HISTORYSTOKBARANG (KODESTOK, TANGGAL, KODEBARANG, STOKAKHIR)
VALUES (5, '2009-01-03', 'B', 3);
INSERT INTO HISTORYSTOKBARANG (KODESTOK, TANGGAL, KODEBARANG, STOKAKHIR)
VALUES (6, '2009-01-04', 'A', 5);
INSERT INTO HISTORYSTOKBARANG (KODESTOK, TANGGAL, KODEBARANG, STOKAKHIR)
VALUES (7, '2009-01-04', 'A', 4);

SELECT * FROM HISTORYSTOKBARANG;

WITH TANGGALTERAKHIR AS (
    SELECT KODEBARANG,
           MAX(TANGGAL) AS TANGGAL
    FROM HISTORYSTOKBARANG
    GROUP BY KODEBARANG
)

SELECT DISTINCT(a.KODEBARANG),
       a.STOKAKHIR
FROM HISTORYSTOKBARANG a
JOIN TANGGALTERAKHIR b
ON a.KODEBARANG = b.KODEBARANG
AND a.TANGGAL = b.TANGGAL
ORDER BY a.KODEBARANG ASC;
```

## 3. Generate sequence

Fungsi generateSequence menghasilkan deret angka yang dimulai dengan dua angka 1, lalu menambahkan angka-angka berikutnya yang merupakan penjumlahan dari dua angka terakhir dalam deret tersebut, sampai angka terakhir mencapai atau melebihi nilai n. Jika angka terakhir melebihi n, angka tersebut dihapus dari deret. Hasil deret kemudian dicetak sebagai sebuah string dengan angka-angka dipisahkan oleh spasi

```javascript
const generateSequence = (n) => {
  let result = [1, 1];

  while (result[result.length - 1] < n) {
    let nextValue = result[result.length - 1] + result[result.length - 2];
    result.push(nextValue);
  }

  if (result[result.length - 1] > n) {
    result.pop();
  }

  console.log(result.join(" "));
};
```

## 4. Triangle

Fungsi generatePattern menghasilkan pola bintang yang terdiri dari n baris, di mana setiap baris berisi jumlah bintang yang ganjil dan meningkat sesuai barisnya, dimulai dari 1 bintang di baris pertama. Pada setiap iterasi, baris i akan berisi 2 \* i - 1 bintang, dan pola ini dicetak langsung ke konsol menggunakan metode console.log

```javascript
const generatePattern = (n) => {
  for (let i = 1; i <= n; i++) {
    console.log("*".repeat(2 * i - 1));
  }
};
```

## 5. Format number

Fungsi formatNumber menerima dua parameter: number yang merupakan angka yang akan diformat dan totalLength yang menentukan panjang total string hasil format. Fungsi ini mengubah angka menjadi string, lalu menambahkan angka nol di depan string tersebut hingga panjang string sama dengan totalLength. Proses ini dilakukan dalam loop while yang terus menambah nol di depan string selama panjang string kurang dari totalLength. Setelah panjang string sesuai, fungsi mengembalikan string yang telah diformat dengan nol di depannya.

```javascript
function formatNumber(number, totalLength) {
  let str = number.toString();
  while (str.length < totalLength) {
    str = "0" + str;
  }
  return str;
}
```
