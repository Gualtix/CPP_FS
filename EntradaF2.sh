#Creacion 2 Discos 
mkdisk -size=50 -unit=M -path=/home/wrm/Desktop/archivos/fase2/Disco1.disk
mkdisk -unit=K -size=51200 -path=/home/wrm/Desktop/archivos/fase2/Disco2.disk

#Creando particiones
#Disco1
fdisk -type=P -unit=M -name=Part1 -size=15 -path=/home/wrm/Desktop/archivos/fase2/Disco1.disk
fdisk -type=P -unit=K -name=Part2 -size=15360 -path=/home/wrm/Desktop/archivos/fase2/Disco1.disk -fit=BF
fdisk -type=P -unit=M -name=Part3 -size=10 -path=/home/wrm/Desktop/archivos/fase2/Disco1.disk -fit=WF

#Disco2
fdisk -type=P -unit=M -name=Part4 -size=15 -path=/home/wrm/Desktop/archivos/fase2/Disco2.disk
fdisk -type=P -unit=K -name=Part5 -size=15360 -path=/home/wrm/Desktop/archivos/fase2/Disco2.disk -fit=BF
fdisk -type=P -unit=M -name=Part6 -size=10 -path=/home/wrm/Desktop/archivos/fase2/Disco2.disk -fit=WF

#Mount
mount -path=/home/wrm/Desktop/archivos/fase2/Disco1.disk -name=Part1
mount -path=/home/wrm/Desktop/archivos/fase2/Disco2.disk -name=Part4
mount -path=/home/wrm/Desktop/archivos/fase2/Disco1.disk -name=Part2
mount -path=/home/wrm/Desktop/archivos/fase2/Disco2.disk -name=Part5
mount -path=/home/wrm/Desktop/archivos/fase2/Disco1.disk -name=Part3
mount -path=/home/wrm/Desktop/archivos/fase2/Disco2.disk -name=Part6



#Crea el sistema de archivos en Part1 - EXT2, Part2 - EXT3, Part4- EXT2 y Part5 - EXT3
mkfs -type=fast -id=vda1 -fs=3fs
mkfs -id=vda2
mkFs -id=vdb1 -fs=3fs -type=full
mKfs -id=vdb2 -type=full


#Login como root en el vda1 - Part1 de tipo EXT2
login -pwd=123 -usr=root -id=vda1
login -pwd=error -usr=error -id=vda1



#Creando grupos en vda1 - Part1 de tipo EXT2
mkgrp -naMe="MySql"
mkgrp -NamE="Oracle"
mkgrp -name="DB2"
#Error en el mkgrp grupo ya existente
mkgrp -name=Oracle


#Crearemos 3 usuarios llamados user1, user2, user3, user4, user5, user6 en vda1 - Part1 de tipo EXT2
Mkusr -usr="user1" -grp=MySql -pwd=user1
Mkusr -usr="user2" -grp=Oracle -pwd=user2
Mkusr -usr="user3" -grp=DB2 -pwd=user3
Mkusr -usr="user4" -grp=MySql -pwd=user4
Mkusr -usr="user5" -grp=Oracle -pwd=user5
Mkusr -usr="user6" -grp=DB2 -pwd=user6
#Errores de Mkuser
Mkusr -usr="user1" -grp=MySql -pwd=user1
Mkusr -usr="user2" -grp=Error -pwd=user2
Mkusr -usr="Sima" -grp=Oracle -pwd=user2
#vamos a ver el archivo user.txt en el reporte tree
#rep -id=vda1 -Path="/home/wrm/Desktop/archivos/fase2/reportes/tree1.png" -name=tree
#eliminaremos el grupo DB2 y usuario user3
rmgrp -name="DB2"
rmgrp -name=DB2
rmusr -usr=user3
rmusr -usr=user3
#vamos a ver el archivo user.txt en el reporte file
#rep -id=vda1 -Path="/home/wrm/Desktop/archivos/fase2/reportes/file1.txt" -name=file -ruta=/users.txt
logout
#Iniciar sesion con usuario1 para crear carpetas
Login -pwd=user1 -usr=user1 -id=vda1


#Mkdir
mkdir -path="/home/wrm/Desktop/user/mia/fase2" -p
mkdir -path="/home/wrm/Desktop/user/mia/carpeta2" -p
mkdir -path="/home/wrm/Desktop/user/mia/carpeta3/carpeta7/carpeta8/carpeta9/carpeta10/carpeta11" -p
mkdir -path="/home/wrm/Desktop/user/mia/carpeta4/carpeta7/carpeta8/carpeta9/carpeta10/carpeta11/carpeta7/carpeta8/carpeta9/carpeta10/carpeta11" -p

mkdir -path="/home/wrm/Desktop/user/mia/carpeta2/Charanko"

mkdir -path="/home/wrm/Desktop/user/mia/carpeta2/a2"
mkdir -path="/home/wrm/Desktop/user/mia/carpeta2/a3"
mkdir -path="/home/wrm/Desktop/user/mia/carpeta2/a4"


mkdir -path="/home/wrm/Desktop/user/mia/carpeta2/a2"
mkdir -path="/home/wrm/Desktop/user/mia/carpeta2/a3"
mkdir -path="/home/wrm/Desktop/user/mia/carpeta2/a4"


mkdir -path="/home/wrm/Desktop/user/mia/carpeta2/a5"
mkdir -path="/home/wrm/Desktop/user/mia/carpeta2/a6"
mkdir -path="/home/wrm/Desktop/user/mia/carpeta2/a7"
mkdir -path="/home/wrm/Desktop/user/mia/carpeta2/a8"
mkdir -path="/home/wrm/Desktop/user/mia/carpeta2/a9"
mkdir -path="/home/wrm/Desktop/user/mia/carpeta2/a10"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a1"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a2"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a3"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a4"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a5"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a6"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a7"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a8"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a9"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a10"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a11"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a12"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a13"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a14"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a15"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a16"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a17"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a18"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a19"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a20"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a21"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a22"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a23"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a24"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a25"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a26"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a27"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a28"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a29"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a30"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a31"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a32"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a33"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a34"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a35"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a36"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a37"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a38"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a39"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a40"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a41"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a42"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a43"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a44"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a45"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a46"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a47"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/a48"
#Primer indirecto
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b1"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b2"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b3"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b4"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b5"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b6"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b7"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b8"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b9"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b10"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b11"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b12"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b13"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b14"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b15"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b16"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b17"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b18"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b19"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b20"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b21"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b22"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b23"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b24"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b25"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b26"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b27"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b28"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b29"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b30"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b31"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b32"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b33"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b34"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b35"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b36"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b37"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b38"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b39"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b40"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b41"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b42"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b43"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b44"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b45"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b46"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b47"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b48"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b49"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b50"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b51"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b52"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b53"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b54"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b55"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b56"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b57"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b58"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b59"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b60"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b61"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b62"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b63"
mkdir -path="/home/wrm/Desktop/user/mia/fase2/b64"



#Segundo indirecto
#mkdir -path="/home/wrm/Desktop/user/mia/fase1/c1"
#mkdir -path="/home/wrm/Desktop/user/mia/fase1/c2"
#mkdir -path="/home/wrm/Desktop/user/mia/fase1/c3"
#mkdir -path="/home/wrm/Desktop/user/mia/fase1/c4"
#mkdir -path="/home/wrm/Desktop/user/mia/fase1/c5"
#mkdir -path="/home/wrm/Desktop/user/mia/fase1/c6"
#mkdir -path="/home/wrm/Desktop/user/mia/fase1/c7"
#mkdir -path="/home/wrm/Desktop/user/mia/fase1/c8"
#mkdir -path="/home/wrm/Desktop/user/mia/fase1/c9"
#mkdir -path="/home/wrm/Desktop/user/mia/fase1/c10"
#mkdir -path="/home/wrm/Desktop/user/mia/fase1/c11"
#mkdir -path="/home/wrm/Desktop/user/mia/fase1/c12"
#mkdir -path="/home/wrm/Desktop/user/mia/fase1/c13"
#mkdir -path="/home/wrm/Desktop/user/mia/fase1/c14"
#mkdir -path="/home/wrm/Desktop/user/mia/fase1/c15"
#mkdir -path="/home/wrm/Desktop/user/mia/fase1/c16"
#Validar que no cree 2 veces el mismo directorio
#Validar que no cree dos veces el mismo directorio
#mkdir -path="/home/wrm/Desktop/user/mia/fase1/c16"
#mkdir -path="/home/wrm/Desktop/user/mia/fase1/a10"
#mkdir -path="/home/wrm/Desktop/user/mia/fase1/a12"
#mkdir -path="/home/wrm/Desktop/user/mia/fase1/b60"


#PRIMEROS REPORTES
#rep -name=inode -patH="/home/wrm/Desktop/archivos/fase2/reportes/inode01.png" -id=vda1
#rep -name=bm_inode -Path="/home/wrm/Desktop/archivos/fase2/reportes/bm_inode01.txt" -id=vda1
#rep -name=bm_block -Path="/home/wrm/Desktop/archivos/fase2/reportes/bm_block01.txt" -id=vda1
#rep -name=tree -Path="/home/wrm/Desktop/archivos/fase2/reportes/tree2.png" -id=vda1
#rep -name=block -Path="/home/wrm/Desktop/archivos/fase2/reportes/block01.png" -id=vda1
#Cerramos sesión
LogouT
#INICIAMOS SESION COMO ROOT Y CREAMOS ARCHIVOS SOBRE HOME EN VDA3
loGin -usr=root -pwd=123 -id=vdb1
#Archivo 
mkfile -path=/home/wrm/Desktop/b1.txt -size=705 -p
#Archivo
mkfile -path="/home/wrm/Desktop/a1.txt" -size=77 -p

#mkfile -path="/home/wrm/Desktop/Alaska.txt" -cont="/home/wrm/Desktop/Si.txt"


#Creamos los grupos en vdb1
mkgrp -naMe="MySql"
mkgrp -NamE="Oracle"
mkgrp -name="DB2"
#Usuarios en vdb1
#Mkusr -usr="user1" -grp=MySql -pwd=user1
#Mkusr -usr="user2" -grp=Oracle -pwd=user2
Mkusr -usr="user3" -grp=DB2 -pwd=user3
#Cerramos sesion
logout
#rep -name=file -Path="/home/wrm/Desktop/archivos/fase2/reportes/file1.txt" -id=vdb1 -ruta="/home/wrm/Desktop/a1.txt"
#rep -name=file -Path="/home/wrm/Desktop/archivos/fase2/reportes/file2.txt" -id=vdb1 -ruta="/home/wrm/Desktop/b1.txt"
loGin -usr=user3 -pwd=user3 -id=vdb1
#Crearemos la ruta y las padres que no existan
mkdir -path="/home/wrm/Desktop/user/mia/fase1" -p
mkdir -path="/home/wrm/Desktop/user/mia/carpeta2" -p
mkdir -path="/home/wrm/Desktop/user/mia/carpeta3" -p
mkdir -path="/home/wrm/Desktop/user/mia/carpeta4" -p
#Archivo
mkfile -path="/home/wrm/Desktop/user/mia/fase1/fase1.txt" -size=115
#Archivo
#mkfile -path="/home/wrm/Desktop/user/mia/fase1/a1.txt" -size=77
#Archivo
#Utiliza 
#mkfile -path="/home/wrm/Desktop/user/mia/fase1/a2.txt" -size=11
#Archivo 
#Utiliza 
#mkfile -path="/home/wrm/Desktop/user/mia/fase1/a3.txt" -size=15
#Archivo 
#Utiliza 
#mkfile -path="/home/wrm/Desktop/user/mia/fase1/a4.txt" -size=29
#Archivo 
#Utiliza n cantidad bloques aproximadamente
#mkfile -path="/home/wrm/Desktop/user/mia/fase1/a5.txt" -size=29
#generamos el reporte directorio para ver el uso de apuntadores
#rep -name=tree -Path="/home/wrm/Desktop/archivos/fase2/reportes/tree3.png" -id=vdb1
#uso de bloques e inodos
#rep -name=inode -Path="/home/wrm/Desktop/archivos/fase2/reportes/block02.png" -id=vdb1
#rep -name=block -Path="/home/wrm/Desktop/archivos/fase2/reportes/block02.png" -id=vdb1



#Renombrar
#ren -path="/home/wrm/Desktop/user/mia/carpeta4" -nombre="renombrada"
#ren -path="/users.txt" -nombre="usuarios.txt"
#generamos el reporte directorio para ver el uso de apuntadores

#rep -id=vda1    -Path=/home/wrm/Desktop/user/reportes/mbr3.png -name=mbr 
#rep -Name=inode -Path="/home/wrm/Desktop/user/reportes/rekenshi.pdf" -id=vdb1


#rem -path=/home/wrm/Desktop/user/mia/fase1/fase1.txt
#rem -path=/home

mv -path="/home/wrm/Desktop/user/mia" -dest="/home"
mv -path="/home/wrm/Desktop/b1.txt" -dest="/home/wrm"
mv -path="/home/wrm/Desktop/a1.txt" -dest="/home/wrm"

rep -Name=Journaling -Path="/home/wrm/Desktop/Reps/Disk_1/D1_Jour.png"       -id=vdb1
pause

loss -id=vdb1
rep -Name=tree       -Path="/home/wrm/Desktop/Reps/Disk_1/D1_tree.png"       -id=vdb1
pause

recovery -id=vdb1
rep -Name=tree       -Path="/home/wrm/Desktop/Reps/Disk_1/D1_tree.png"       -id=vdb1
pause

rep -Name=sb         -Path="/home/wrm/Desktop/Reps/Disk_1/D1_Sb.png"         -id=vdb1
rep -Name=block      -Path="/home/wrm/Desktop/Reps/Disk_1/D1_block.png"      -id=vdb1
rep -Name=inode      -Path="/home/wrm/Desktop/Reps/Disk_1/D1_inode.png"      -id=vdb1
rep -Name=bm_inode   -Path="/home/wrm/Desktop/Reps/Disk_1/D1_bm_inode.txt"   -id=vdb1
rep -Name=bm_block   -Path="/home/wrm/Desktop/Reps/Disk_1/D1_bm_block.txt"   -id=vdb1
rep -Name=file       -Path="/home/wrm/Desktop/Reps/Disk_1/achivi.txt"        -id=vdb1 -ruta=/Alaska.txt
rep -Name=ls         -Path="/home/wrm/Desktop/Reps/Disk_1/Dinox_ls.png"      -id=vdb1 -ruta=/home/wrm/Desktop/
rep -Name=Journaling -Path="/home/wrm/Desktop/Reps/Disk_1/D1_Jour.png"       -id=vdb1
