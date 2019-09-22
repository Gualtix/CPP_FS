#Contenido de calificacion.sh

#CREANDO DISCOS ----------------------------------------------------------------------------------------
mkdisk -size=75 -unit=M -path=/home/wrm/Desktop/fase2/Disco1.disk -fit=FF

#CREANDO PARTICIONES ----------------------------------------------------------------------------------
#Crear particiones Disco1.disk
fdisk -type=P -unit=M -name=Part1 -size=20 -path=/home/wrm/Desktop/fase2/Disco1.disk -fit=BF

#Monta las particiones 
mount -path=/home/wrm/Desktop/fase2/Disco1.disk -name=Part1

#Crea el sistema de archivos en todas las particiones primarias
#fast reescribe el superbloque 
#full poner /0 y luego reescribir el superbloque

mkfs -type=fast -id=vda1 -fs=3fs


#Reporte1 ::::(  ) 
#rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte1_vda1_sb.pdf" -name=sb
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte1_vda1_tree.jpg" -name=tree


#Creando Usuarios
#Login como root en el vda1 - Part1 de tipo EXT2
#Debe dar error porque no existe el usuario roca
Login -pwd=567 -usr=roca -id=vda1
#debe dar error porque no existe nada activo
logout
#Debe dar error contraseña incorrecta
Login -pwd=12345 -usr=root -id=vda1
Login -pwd=123 -usr=root -id=vda1
#Debe dar error porque ya hay un login activo
lOgin -pwd=error -usr=error -id=vda1


#Creando grupos en vda1
mkgrp -naMe=Archivos
mkgrp -NamE=Arqui
mkgrp -name="Compi2"
#Error en el mkgrp grupo ya existente
mkgrp -name="Compi2"


#Borrando Grupos
#Error no existe este grupo
rmgrp -name="DB2"
rmgrp -name=Arqui


#Crearemos 3 usuarios llamados user1, user2, user3
Mkusr -usr="user1" -grp=Archivos -pwd=user1
Mkusr -usr="user2" -grp="Compi2" -pwd=user2
Mkusr -usr="user3" -grp="Compi2" -pwd=user3
#Da error porque ya existe ese usuario
Mkusr -usr="user2" -grp="Compi2" -pwd=user2
#Da error porque no existe ese grupo
Mkusr -usr="user2" -grp=Arqui -pwd=user2


rmusr -usr=user3


pause

Mkdir -P  -path=/home/wrm/Desktop/mia/fase1
Mkdir -P  -path=/home/wrm/Desktop/mia/carpeta2
Mkdir -P  -path=/home/wrm/Desktop/mia/carpeta3/carpeta7/carpeta8/carpeta9/carpeta10/carpeta11
Mkdir -P  -path=/home/wrm/Desktop/mia/carpeta4/carpeta7/carpeta8/carpeta9/carpeta10/carpeta11/carpeta7/carpeta8/carpeta9/carpeta10/carpeta11
Mkdir  -path=/home/wrm/Desktop/mia/carpeta2/a1
Mkdir  -path=/home/wrm/Desktop/mia/carpeta2/a2
Mkdir  -path=/home/wrm/Desktop/mia/carpeta2/a3
Mkdir  -path=/home/wrm/Desktop/mia/carpeta2/a4
Mkdir  -path=/home/wrm/Desktop/mia/carpeta2/a5
Mkdir  -path=/home/wrm/Desktop/mia/carpeta2/a6
Mkdir  -path=/home/wrm/Desktop/mia/carpeta2/a7
Mkdir  -path=/home/wrm/Desktop/mia/carpeta2/a8
Mkdir  -path=/home/wrm/Desktop/mia/carpeta2/a9
Mkdir  -path=/home/wrm/Desktop/mia/carpeta2/a10
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a1
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a2
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a3
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a4
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a5
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a6
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a7
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a8
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a9
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a10
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a11
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a12
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a13
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a14
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a15
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a16
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a17
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a18
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a19
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a20
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a21
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a22
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a23
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a24
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a25
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a26
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a27
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a28
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a29
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a30
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a31
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a32
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a33
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a34
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a35
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a36
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a37
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a38
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a39
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a40
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a41
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a42
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a43
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a44
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a45
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a46

#Debe dar error porque ya existe a46
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a46

#Primer indirecto
mkdir  -path="/home/wrm/Desktop/mia/fase2/b1"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b2"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b3"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b4"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b5"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b6"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b7"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b8"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b9"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b10"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b11"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b12"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b13"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b14"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b15"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b16"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b17"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b18"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b19"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b20"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b21"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b22"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b23"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b24"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b25"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b26"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b27"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b28"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b29"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b30"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b31"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b32"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b33"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b34"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b35"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b36"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b37"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b38"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b39"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b40"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b41"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b42"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b43"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b44"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b45"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b46"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b47"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b48"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b49"
mkdir  -path="/home/wrm/Desktop/mia/fase2/b50"

#reporte2 ::::(  ) 
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte2_vda1_sb.pdf" -name=sb
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte2_vda1_tree.jpg" -name=tree

pause

logout
loGin -usr=user1 -pwd=user1 -id=vda1
#Archivo 
mkfile -path="/home/b1.txt" -size=75
#Debe dar error ruta no existe
mkfile -path="/home/Noexiste/b1.txt" -size=75
#Debe dar error size negativo
mkfile -path="/home/b1.txt" -size=45
#1er indirecto
mkfile -path="/home/b1_1.txt" -size=1700
#archivo con parametro -p 
mkfile -path="/home/ahora/yaexiste/b1.txt" -size=640

#reporte3 ::::(  ) 
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte3_vda1_sb.pdf" -name=sb
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte3_vda1_tree.jpg" -name=tree

pause

#REMOVER
#Carpeta Directos
rem -path=/home/wrm/Desktop/mia/fase2/a46
#Carpeta indirectos
rem -path="/home/wrm/Desktop/mia/fase2/b1"

#Reporte4 ::::(  ) 
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte4_vda1_sb.pdf" -name=sb
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte4_vda1_tree.jpg" -name=tree

pause

#MOVER
#debe dar error porque no existe
mv mkdir  -path="/home/wrm/Desktop/no existe" -dest="/home"
mv mkdir  -path="/home/wrm/Desktop/mia/fase2/b50" -dest="/home"

#Reporte5 ::::(  ) 
#Ultimo reporte antes de la perdida
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/users.txt" -ruta="users.txt" -name=file
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/ls.pdf" -ruta="users.txt" -name=ls
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte5_vda1_sb.pdf" -name=sb
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte5_vda1_tree.jpg" -name=tree
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte5_vda1_inode.pdf" -name=inode
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte5_vda1_block.pdf" -name=block
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte5_vda1_bm_inode.pdf" -name=bm_inode
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte5_vda1_bm_block.pdf" -name=bm_block
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte5_vda1_journal.pdf" -name=journal
pause

#PERDIDA
Loss -id=vda1

#reporte6 ::::(  ) 
#Reporte despues de la perdida es el 6
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte6_vda1_sb.pdf" -name=sb
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte6_vda1_tree.jpg" -name=tree
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte6_vda1_inode.pdf" -name=inode
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte6_vda1_block.pdf" -name=block
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte6_vda1_bm_inode.pdf" -name=bm_inode
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte6_vda1_bm_block.pdf" -name=bm_block
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte6_vda1_journal.pdf" -name=journal
pause

#Recovery
Recovery -id=vda1
#reporte7 ::::(  ) 
#Reporte despues del recovery es el 7
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte7_vda1_sb.pdf" -name=sb
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte7_vda1_tree.jpg" -name=tree
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte7_vda1_inode.pdf" -name=inode
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte7_vda1_block.pdf" -name=block
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte7_vda1_bm_inode.pdf" -name=bm_inode
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte7_vda1_bm_block.pdf" -name=bm_block
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/reporte7_vda1_journal.pdf" -name=journal
pause
