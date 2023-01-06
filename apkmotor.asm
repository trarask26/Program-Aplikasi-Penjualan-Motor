 .model small
.code
org 100h
start:
	jmp mulai
nama	    db 13,10,'Nama Anda		: $'
alamat	    db 13,10,'Alamat 		: $'
tampung_nama	db 30,?,30 dup(?)
tampung_alamat  db 30,?,30 dup(?)

daftar	db '|--|--------------------|-----------------|--------------------|',13,10
	db '|--|                  APLIKASI PENJUALAN MOTOR                     |',13,10
	db '|--|--------------------|-----------------|--------------------|',13,10
	db '|no|        Tipe        |       Tahun     |        Harga           |',13,10
	db '|--|--------------------|-----------------|--------------------|',13,10
	db '|01|        MIO	    |       2022      |  Rp 34.345.000     |',13,10
	db '|--|--------------------|-----------------|--------------------|',13,10
	db '|02|        BEAT	    |       2022      |  Rp 50.000.000     |',13,10
	db '|--|--------------------|-----------------|--------------------|',13,10
	db '|03|      MEGAPRO	    |       2022      |  Rp 99.999.000     |',13,10
	db '|--|--------------------|-----------------|--------------------|',13,10
	db '|04|       HONDA	    |       2022      |  Rp 67.349.000     |',13,10
	db '|--|--------------------|-----------------|--------------------|',13,10
	db '|05|        PCX	    |       2022      |  Rp 12.999.000     |',13,10
	db '|--|--------------------|-----------------|--------------------|',13,10
	db '|06|       YAMAHA	    |       2022      |  Rp 77.000.000     |',13,10
	db '|--|--------------------|-----------------|--------------------|',13,10
	db '|07|       BEBEK	    |       2022      |  Rp 23.877.000     |',13,10
	db '|--|--------------------|-----------------|--------------------|',13,10
	db '|--| TENTUKAN PILIHAN MOTOR YANG ANDA INGINKAN SESUAI NO TABEL |',13,10
	db '|--|--------------------|-----------------|--------------------|','$'

error	    db 13,10,'KODE YANG ANDA MASUKKAN SALAH $'
pilih_brs   db 13,10,'Silahkan masukkan Kode/No motor yang Anda pilih: $'
success     db 13,10,'Selamat Anda Berhasil $'

      mulai:
	mov ah,09h
	lea dx,nama
	int 21h
	mov ah,0ah
	lea dx,tampung_nama
	int 21h
	push dx

	mov ah,09h
	lea dx,alamat
	int 21h
	mov ah,0ah
	lea dx,tampung_alamat
	int 21h
	push dx


	mov ah,09h
	mov dx,offset daftar
	int 21h
	mov ah,09h
	jmp proses


error_msg:
	mov ah,09h
	mov dx,offset error
	int 21h
	int 20h

proses:
	mov ah,09
	mov dx,offset pilih_brs
	int 21h

	mov ah,1
	int 21h
	mov bh, al
	mov ah,1
	int 21h
	mov bl,al
	cmp bh,'0'
	cmp bl,'1'
	je hasil1

	cmp bh,'0'
	cmp bl,'2'
	je hasil2

	cmp bh,'0'
	cmp bl,'3'
	je hasil3

	cmp bh,'0'
	cmp bl,'4'
	je hasil4

	cmp bh,'0'
	cmp bl,'5'
	je hasil5

	cmp bh,'0'
	cmp bl,'6'
	je hasil6

	cmp bh,'0'
	cmp bl,'7'
	je hasil7



	jne error_msg


;-----------------------------------------------------------------

hasil1: 
	mov ah,09h
	lea dx,teks1
	int 21h
	int 20h

hasil2:
	mov ah,09h
	lea dx,teks2
	int 21h
	int 20h

hasil3:
	mov ah,09h
	lea dx,teks3
	int 21h
	int 20h

hasil4:
	mov ah,09h
	lea dx,teks4
	int 21h
	int 20h

hasil5:
	mov ah,09h
	lea dx,teks5
	int 21h
	int 20h

hasil6:
	mov ah,09h
	lea dx,teks6
	int 21h
	int 20h

hasil7:
	mov ah,09h
	lea dx,teks7
	int 21h
	int 20h




;-----------------------------------------------------------------

teks1	db 13,10,'Anda memilih motor MIO '
	db 13,10,'keluaran tahun 2022'
	db 13,10,'dengan harga yang harus dibayar: Rp 34.345.000 '
	db 13,10,'Arigato jangan lupa datang lagi $'

teks2	db 13,10,'Anda memilih motor BEAT '
	db 13,10,'keluaran tahun 2022'
	db 13,10,'dengan harga yang harus dibayar: Rp 50.000.000 '
	db 13,10,'Arigato jangan lupa datang lagi $'

teks3	db 13,10,'Anda memilih motor MEGAPRO '
	db 13,10,'keluaran tahun 2022'
	db 13,10,'dengan harga yang harus dibayar: Rp 99.999.000 '
	db 13,10,'Arigato jangan lupa datang lagi $'

teks4	db 13,10,'Anda memilih motor HONDA '
	db 13,10,'keluaran tahun 2022'
	db 13,10,'dengan harga yang harus dibayar: Rp 67.349.000 '
	db 13,10,'Arigato jangan lupa datang lagi $'

teks5	db 13,10,'Anda memilih motor PCX '
	db 13,10,'keluaran tahun 2022'
	db 13,10,'dengan harga yang harus dibayar: Rp 12.999.000 '
	db 13,10,'Arigato jangan lupa datang lagi $'

teks6	db 13,10,'Anda memilih motor YAMAHA '
	db 13,10,'keluaran tahun 2022'
	db 13,10,'dengan harga yang harus dibayar: Rp 77.000.000 '
	db 13,10,'Arigato jangan lupa datang lagi $'

teks7	db 13,10,'Anda memilih motor BEBEK '
	db 13,10,'keluaran tahun 2022'
	db 13,10,'dengan harga yang harus dibayar: Rp 23.877.000 '
	db 13,10,'Arigato jangan lupa datang lagi $'

end start
   
