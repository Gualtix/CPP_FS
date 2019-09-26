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

Mkdir -path=/home/wrm/Desktop/mia/fase1     -P  
Mkdir -path=/home/wrm/Desktop/mia/fase2     -P  
Mkdir -path=/home/wrm/Desktop/mia/carpeta2  -P  

Mkdir  -path=/home/wrm/Desktop/mia/carpeta2/a1
Mkdir  -path=/home/wrm/Desktop/mia/carpeta2/a2
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a46 



#Debe dar error porque ya existe a46
Mkdir  -path=/home/wrm/Desktop/mia/fase2/a46


mkfile -path="/home/b1.txt" -size=75

#Debe dar error ruta no existe
mkfile -path="/home/Noexiste/b1.txt" -size=75

#Debe dar error size negativo
mkfile -path="/home/sfe/eee/wwe/fff/b1.txt" -size=45

#1er indirecto
#mkfile -path="/home/b1_1.txt" -size=1700

#archivo con parametro -p 
mkfile -path="/home/ahora/yaexiste/b1.txt" -size=640 -p

mkfile -path="/sisi.txt" -size=15

cat -file="/sisi.txt"

#rep -id=vda1 -Path="/home/wrm/Desktop/reports2/antestree.jpg"   -name=tree
#rep -id=vda1 -Path="/home/wrm/Desktop/reports2/antesjour.jpg" -name=journaling

loss     -id=vda1 
recovery -id=vda1 

rep -id=vda1 -ruta=/users.txt -Path="/home/wrm/Desktop/reports2/eles.jpg"   -name=ls
rep -id=vda1 -Path="/home/wrm/Desktop/reports2/destree.jpg"   -name=tree
#rep -id=vda1 -Path="/home/wrm/Desktop/reports2/desjour.jpg" -name=journaling
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
