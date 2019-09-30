# Contenido de calificacion.sh
# exec -path=/home/marco/Desktop/entrada.sh
# Crea 5 discos de 50 Mb
# ----------------------------------------------------------------------------------------
# PRIMERA FASE
# ----------------------------------------------------------------------------------------

# CREANDO DISCOS ----------------------------------------------------------------------------------------
mkdisk -size=80 -unit=M -path=/home/archivos/fase2/Disco1.disk -fit=BF

# CREANDO PARTICIONES ----------------------------------------------------------------------------------
# Crear particiones Disco1.disk
fdisk -type=P -unit=m -name=Part1 -size=20 -path=/home/archivos/fase2/Disco1.disk -fit=BF
fdisk -type=E -unit=m -name=Part2 -size=15 -path=/home/archivos/fase2/Disco1.disk -fit=FF
fdisk -type=P -unit=m -name=Part3 -size=20 -path=/home/archivos/fase2/Disco1.disk -fit=WF
fdisk -type=P -unit=m -name=Part4 -size=20 -path=/home/archivos/fase2/Disco1.disk -fit=BF
fdisk -type=L -unit=K -name=Part5 -size=2048 -path=/home/archivos/fase2/Disco1.disk -fit=BF
fdisk -type=L -unit=K -name=Part6 -size=2048 -path=/home/archivos/fase2/Disco1.disk -fit=BF
fdisk -type=L -unit=K -name=Part7 -size=2048 -path=/home/archivos/fase2/Disco1.disk -fit=WF
fdisk -type=L -unit=K -name=Part8 -size=2048 -path=/home/archivos/fase2/Disco1.disk -fit=WF
fdisk -type=L -unit=K -name=Part9 -size=2048 -path=/home/archivos/fase2/Disco1.disk -fit=BF
fdisk -type=L -unit=K -name=Part10 -size=2048 -path=/home/archivos/fase2/Disco1.disk -fit=BF


# MONTAR PARTICIONES ----------------------------------------------------------------------------------------
# Monta las particiones Disco1.disk
mount -path=/home/archivos/fase2/Disco1.disk -name=Part1 #vda1
mount -path=/home/archivos/fase2/Disco1.disk -name=Part8 #vda2
mount -path=/home/archivos/fase2/Disco1.disk -name=Part7 #vda3
mount -path=/home/archivos/fase2/Disco1.disk -name=Part3 #vda6

#pause

# ----------------------------------------------------------------------------------------
# SEGUNDA FASE
# ----------------------------------------------------------------------------------------

# FORMATEAR PARTICIONES ----------------------------------------------------------------------------------------
mkfs -type=fast -id=vda1 -fs=3fs
mkfs -type=fast -id=vda2 -fs=3fs

#pause

# INICIO DE SESION ----------------------------------------------------------------------------------------
# sesion: root
login -usr=root -pwd=123 -id=vda1

#pause

# CREANDO REPORTES ----------------------------------------------------------------------------------------
# PRIMER REPORTE
#rep -id=vda1 -Path=/home/mia_f2/inode_1.png -name=inode
#rep -id=vda1 -Path=/home/mia_f2/block_1.png -name=block
#rep -id=vda1 -Path=/home/mia_f2/tree_1.png -name=tree
#rep -id=vda1 -Path=/home/mia_f2/sb_1.png -name=sb
#rep -id=vda1 -Ruta=/users.txt -Path=/home/mia_f2/file_1.txt -name=file
#rep -id=vda1 -ruta=/ -Path=/home/mia_f2/ls_1.txt -name=ls


# CREANDO GRUPOS ----------------------------------------------------------------------------------------
mkgrp -name="usuarios"
mkgrp -name=mia
mkgrp -name=mia
mkgrp -name=compi

# ELIMINANDO GRUPOS ----------------------------------------------------------------------------------------
rmgrp -name=mia
rmgrp -name=mia

# CREANDO REPORTES ----------------------------------------------------------------------------------------
# SEGUNDO REPORTE
rep -id=vda1 -Ruta=/users.txt -Path=/home/mia_f2/file_2.txt -name=file

# CREANDO USUARIOS ----------------------------------------------------------------------------------------
mkusr -usr=user1 -pwd=user1 -grp=usuarios
mkusr -usr=user2 -pwd=user2 -grp=usuarios
mkusr -usr=user3 -pwd=user3 -grp=usuarios
mkusr -usr=user4 -pwd=user4 -grp=compi
mkusr -usr=user5 -pwd=user5 -grp=compi

# ELIMINANDO USUARIOS ----------------------------------------------------------------------------------------
rmusr -usr=user3 -pwd=user3 -grp=usuarios
rmusr -usr=user3 -pwd=user3 -grp=usuarios

# CREANDO REPORTES ----------------------------------------------------------------------------------------
# TERCER REPORTE
rep -id=vda1 -ruta=/users.txt -Path=/home/mia_f2/file_3.txt -name=file

# CERRAR SESION ----------------------------------------------------------------------------------------
# sesión: root
Logout
Logout

# # INICIO DE SESION ----------------------------------------------------------------------------------------
# sesión: user1 - usuarios
login -usr=user1 -pwd=user1 -id=vda1



# CREAR DIRECTORIOS ----------------------------------------------------------------------------------------
mkdir -path=/home/user1/documentos/usac
mkdir -p -path="/user1/folder4/mia 19"


mkdir -path=/user1/folder5
mkdir -path=/user1/folder6
mkdir -path=/user1/folder7
mkdir -path=/user1/folder8

mkdir -path=/user1/folder9
mkdir -path=/user1/folder10
mkdir -path=/user1/folder11
mkdir -path=/user1/folder12

mkdir -path=/user1/folder13
mkdir -path=/user1/folder14
mkdir -path=/user1/folder15
mkdir -path=/user1/folder16

mkdir -path=/user1/folder17
mkdir -path=/user1/folder18
mkdir -path=/user1/folder19
mkdir -path=/user1/folder20

mkdir -path=/user1/folder21
mkdir -path=/user1/folder22
mkdir -path=/user1/folder23
mkdir -path=/user1/folder24

mkdir -path=/user1/folder25
mkdir -path=/user1/folder26
mkdir -path=/user1/folder27
mkdir -path=/user1/folder28

mkdir -path=/user1/folder29
mkdir -path=/user1/folder30
mkdir -path=/user1/folder31
mkdir -path=/user1/folder32

mkdir -path=/user1/folder33
mkdir -path=/user1/folder34
mkdir -path=/user1/folder35
mkdir -path=/user1/folder36

mkdir -path=/user1/folder37
mkdir -path=/user1/folder38
mkdir -path=/user1/folder39
mkdir -path=/user1/folder40

mkdir -path=/user1/folder41
mkdir -path=/user1/folder42
mkdir -path=/user1/folder43
mkdir -path=/user1/folder44

mkdir -path=/user1/folder45
mkdir -path=/user1/folder46
mkdir -path=/user1/folder47
mkdir -path=/user1/folder48

# sesión: user1
Logout

# INICIO DE SESION ----------------------------------------------------------------------------------------
# sesión: root
login -usr=root -pwd=123 -id=vda1



# CAMBIAR GRUPO A USUARIO ----------------------------------------------------------------------------------------
chgrp -usr=user2 -grp=compi

# CREANDO REPORTES ----------------------------------------------------------------------------------------
# CUARTO REPORTE
#rep -id=vda1 -Path=/home/mia_f2/inode_4.png -name=inode
#rep -id=vda1 -Path=/home/mia_f2/block_4.png -name=block
#rep -id=vda1 -Path=/home/mia_f2/tree_4.png -name=tree
#rep -id=vda1 -path=/home/mia_f2/journal_4.png -name=journaling
#rep -id=vda1 -ruta=/ -Path=/home/mia_f2/ls_4.txt -name=ls
#rep -id=vda1 -Ruta=/users.txt -Path=/home/mia_f2/file_4.txt -name=file

# sesión: root
Logout

# INICIO DE SESION ----------------------------------------------------------------------------------------
# sesión: user 4 - compi
login -usr=user4 -pwd=user4 -id=vda1


# CREAR ARCHIVO ----------------------------------------------------------------------------------------
mkfile -p -path=/user4/lorem.txt -size=1024
mkfile -path=/user4/datos.txt -cont=/home/marco/Desktop/datos.txt

mkfile -p -path=/compi/manual.txt -size=20
rep -id=vda1 -Path=/home/mia_f2/ants.png -name=tree


# # CAMBIAR PERMISOS ----------------------------------------------------------------------------------------
#chmod -path=/compi -r -ugo=777

# MOSTRANDO CONTENIDO DE ARCHIVO ----------------------------------------------------------------------------------------
#cat -file=/user4/datos.txt

# EDITANDO ARCHIVO ----------------------------------------------------------------------------------------
edit -path=/compi/manual.txt -cont="Aquiempiezaelmanual"
rep -id=vda1 -Path=/home/mia_f2/tree_6.png -name=tree


# RENOMBRAR ----------------------------------------------------------------------------------------
ren -path=/compi/manual.txt -name=tarea.txt

# CERRAR SESION ----------------------------------------------------------------------------------------
# sesión: user 4 - compi
logout

# INICIO SESION ----------------------------------------------------------------------------------------
# sesión: root
login -usr=root -pwd=123 -id=vda1



# CREANDO REPORTES ----------------------------------------------------------------------------------------
# QUINTO REPORTE
#rep -id=vda1 -Path=/home/mia_f2/bm_inode_5.txt -name=bm_inode
#rep -id=vda1 -Path=/home/mia_f2/bm_block_5.txt -name=bm_block
#rep -id=vda1 -Path=/home/mia_f2/inode_5.png -name=inode
#rep -id=vda1 -Path=/home/mia_f2/block_5.png -name=block
#rep -id=vda1 -Path=/home/mia_f2/journaling_5.png -name=journaling
#rep -id=vda1 -Path=/home/mia_f2/tree_5.png -name=tree
#rep -id=vda1 -Ruta=/users.txt -Path=/home/mia_f2/file_5.txt -name=file

# CERRAR SESION ----------------------------------------------------------------------------------------
# sesión: root
logout

# SIMULAR PERDIDA ----------------------------------------------------------------------------------------
loss -id=vda1

# RECUPERAR PARTICION ----------------------------------------------------------------------------------------
recovery -id=vda1

# INICIO SESION ----------------------------------------------------------------------------------------
# sesión: root
login -usr=root -pwd=123 -id=vda1


# CREANDO REPORTES ----------------------------------------------------------------------------------------
# QUINTO REPORTE
rep -id=vda1 -Path=/home/mia_f2/bm_inode_6.txt -name=bm_inode
rep -id=vda1 -Path=/home/mia_f2/bm_block_6.txt -name=bm_block
rep -id=vda1 -Path=/home/mia_f2/inode_6.png -name=inode
rep -id=vda1 -Path=/home/mia_f2/block_6.png -name=block
rep -id=vda1 -Path=/home/mia_f2/journaling_6.png -name=journaling
rep -id=vda1 -Path=/home/mia_f2/tree_6.png -name=tree
rep -id=vda1 -Ruta=/users.txt -Path=/home/mia_f2/file_6.txt -name=file

# CERRAR SESION ----------------------------------------------------------------------------------------
# sesión: root
logout
