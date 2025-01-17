
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