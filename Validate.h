#ifndef VALIDATE_H
#define VALIDATE_H

#include "Container.h"
#include "Belong.h"

//(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............
//(^< ............ ............ ............ ............ ............ P R I N T E R
//(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............


void ErrorPrinter(char* CMD,char* MsgType,char* ParamName,char* ParamValue,char* Msg){
    printf("\n");
    printf("%s %s: Parametro: %s   Valor:   -> %s <-   %s\n",CMD,MsgType,ParamName,ParamValue,Msg);
}

void SuccessPrinter(char* CMD,char* MsgType,char* ParamName,char* ParamValue,char* Msg){
    printf("\n");
    printf("%s %s: Parametro: %s   Valor:   -> %s <-   %s\n",CMD,MsgType,ParamName,ParamValue,Msg);
}

//(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............
//(^< ............ ............ ............ ............ ............ Each
//(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............

int idV(char* CMD,InfoCatcher* nwInf){
    //(^< ............ ............ ............ ............ ............ _id: Mandatory
    if(nwInf->_id ==  NULL){
        ErrorPrinter(CMD,"ERROR","-id","NULL","Es Obligatorio");
        return 0;
    }
    else{
        Mounted_Part* mP = getPartMounted_By_vID(nwInf->_id);
        if(mP == NULL){
            ErrorPrinter(CMD,"ERROR","-id",nwInf->_id,"No es una Particion Montada");
            return 0;
        }
    }
    return 1;
}

int typeV(char* CMD,InfoCatcher* nwInf){
    //(^< ............ ............ ............ ............ ............ _type: Optional
    if(nwInf->_type == NULL){
        nwInf->_type == "full";
        return 1;
    }

    if(strcasecmp(nwInf->_type,"fast") != 0 && strcasecmp(nwInf->_type,"full")){
        nwInf->_type == "full";
        return 1;
    }

    return 1;
}

int fsV(char* CMD,InfoCatcher* nwInf){
    //(^< ............ ............ ............ ............ ............ _fs: Optional
    if(nwInf->_fs == NULL){
        nwInf->_fs = newString("3fs");
        return 1;
    }

    nwInf->_fs = "3fs";

    return 1;
}

int usrV(char* CMD,InfoCatcher* nwInf){


    //(^< ............ ............ ............ ............ ............ _usr: Mandatory
    if(nwInf->_usr ==  NULL){
        ErrorPrinter(CMD,"ERROR","-usr","NULL","Es Obligatorio");
        return 0;
    }
    
    DoublyGenericList* usrList = getUsersList();
    int usr = usrExists(nwInf->_usr,usrList);

    //(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............
    //(^< ............ ............ ............ ............ ............ MKUSR
    //(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............
    if(strcasecmp(CMD,"MKUSR") == 0){
        if(usr > -1){
            ErrorPrinter(CMD,"ERROR","-usr",nwInf->_usr,"El Usuario Ya Existe");
            return 0;
        }
        return 1;
    }

    //(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............
    //(^< ............ ............ ............ ............ ............ RMUSR
    //(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............
    if(strcasecmp(CMD,"RMUSR") == 0){
        if(usr == -1){
            ErrorPrinter(CMD,"ERROR","-usr",nwInf->_usr,"El Usuario No Existe");
            return 0;
        }
        return 1;
    }
    //(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............
    //(^< ............ ............ ............ ............ ............ LOGIN
    //(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............
    if(strcasecmp(CMD,"LOGIN") == 0){
        if(usr == -1){
        ErrorPrinter(CMD,"ERROR","-usr",nwInf->_usr,"El Usuario no Existe");
        return 0;
        }
        return 1;
    }   
}

int pwdV(char* CMD,InfoCatcher* nwInf){
    //(^< ............ ............ ............ ............ ............ _pwd: Mandatory
    if(nwInf->_pwd ==  NULL){
        ErrorPrinter(CMD,"ERROR","-pwd","NULL","Es Obligatorio");
        return 0;
    }

    DoublyGenericList* usrList = getUsersList();
    GroupUserInfo* gu = getUSR_by_Name(nwInf->_usr,usrList);

    //(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............
    //(^< ............ ............ ............ ............ ............ MKUSR
    //(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............
    if(strcasecmp(CMD,"MKUSR") == 0){
        return 1;
    }

    //(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............
    //(^< ............ ............ ............ ............ ............ LOGIN
    //(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............
    if(strcasecmp(CMD,"LOGIN") == 0){
        if(strcasecmp(nwInf->_pwd,gu->Password) != 0){
        ErrorPrinter("LOGIN","ERROR","-pwd",nwInf->_pwd,"Password Incorrecto");
            return 0;
        }
        return 1;
    }

    
}

int nameV(char* CMD,InfoCatcher* nwInf){

    //(^< ............ ............ ............ ............ ............ -name: Mandatory
    if(nwInf->_name == NULL){
        ErrorPrinter(CMD,"ERROR","-name","NULL","Es Obligatorio");
        return 0;
    }

    

    //(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............
    //(^< ............ ............ ............ ............ ............ REP
    //(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............

    if(strcasecmp(CMD,"REP") == 0){
        if(strcasecmp(nwInf->_name,"inode")      != 0 &&
           strcasecmp(nwInf->_name,"journaling") != 0 &&
           strcasecmp(nwInf->_name,"block")      != 0 &&
           strcasecmp(nwInf->_name,"bm_inode")   != 0 &&
           strcasecmp(nwInf->_name,"bm_block")   != 0 &&
           strcasecmp(nwInf->_name,"tree")       != 0 &&
           strcasecmp(nwInf->_name,"sb")         != 0 &&
           strcasecmp(nwInf->_name,"file")       != 0 &&
           strcasecmp(nwInf->_name,"ls")         != 0
        ){
            ErrorPrinter(CMD,"ERROR","-name",nwInf->_name,"Este Tipo de Reporte no Existe...");
            return 0;
        }
        return 1;
    }

    DoublyGenericList*  grpList = getGroupsList();
    GroupUserInfo* gu = newGrus();
    int grpEx = grpExists(nwInf->_name,grpList);

    //(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............
    //(^< ............ ............ ............ ............ ............ MKGRP
    //(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............
    
    //(^< ............ ............ ............ ............ ............ -name: Unique
    if(strcasecmp(CMD,"MKGRP") == 0){
        if(grpEx > -1){
            ErrorPrinter(CMD,"ERROR","-name",nwInf->_name,"Este Grupo Ya Existe");
            return 0;
        }
        return 1;
    }
    
    //(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............
    //(^< ............ ............ ............ ............ ............ RMGRP
    //(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............
    
    //(^< ............ ............ ............ ............ ............ -name: Exist
    if(strcasecmp(CMD,"RMGRP") == 0){
        if(grpEx == -1){
            ErrorPrinter(CMD,"ERROR","-name",nwInf->_name,"Este Grupo No Existe");
            return 0;
        }
        return 1;
    }

    
    
}

int rutaV(char* CMD,InfoCatcher* nwInf){
    //(^< ............ ............ ............ ............ ............ -ruta: Mandatory
    if(strcasecmp(nwInf->_name,"ls") != 0 && strcasecmp(nwInf->_name,"file") != 0){
        return 1;
    }
    if(nwInf->_ruta == NULL && strcasecmp(nwInf->_name,"mbr") != 0 && strcasecmp(nwInf->_name,"disk") != 0){
        ErrorPrinter(CMD,"ERROR","-ruta","NULL","Es Obligatorio");
        return 0;
    }

    if(strcasecmp(nwInf->_name,"file") == 0){
        char* FileName = Path_get_Last_FolderName(nwInf->_ruta);
        setOmni(nwInf->_id);
        SeekInfo* SF = CompleteSeeker(0,FileName);
        Omni = newGLS();
        if(SF == NULL){
            ErrorPrinter(CMD,"ERROR","-ruta",FileName,"El Archivo No Existe");
            return 0;
        }
    }

    if(strcasecmp(nwInf->_name,"ls") == 0){

        if(strcasecmp(nwInf->_ruta,"/") != 0){
            DoublyGenericList* Ph = PathSeparate(nwInf->_ruta);
            Pop(Ph);
            char* tmp = (char*)Pop(Ph);
            int  istxt = Check_If_Is_txtFile(tmp);
            setOmni(nwInf->_id);
            SeekInfo* SF = CompleteSeeker(0,tmp);
            Omni = newGLS();
            if(SF == NULL){
                if(istxt == 1){
                    ErrorPrinter(CMD,"ERROR","-ruta",tmp,"El Archivo No Existe");
                    return 0;
                }
                else{
                    ErrorPrinter(CMD,"ERROR","-ruta",tmp,"El Folder No Existe");
                    return 0;
                }
            }
        }
    }
    return 1;
}

int grpV(char* CMD,InfoCatcher* nwInf){
    //(^< ............ ............ ............ ............ ............ -grp: Mandatory
    if(nwInf->_grp == NULL){
        ErrorPrinter(CMD,"ERROR","-grp","NULL","Es Obligatorio");
        return 0;
    }
    //(^< ............ ............ ............ ............ ............ -grp: Exist
    DoublyGenericList*  grpList = getGroupsList();
    GroupUserInfo* gu = newGrus();
    int grpEx = grpExists(nwInf->_grp,grpList);
    if(grpEx == -1){
        ErrorPrinter(CMD,"ERROR","-grp",nwInf->_grp,"Este Grupo No Existe");
        return 0;
    }
}

int pathV(char* CMD,InfoCatcher* nwInf){
    //(^< ............ ............ ............ ............ ............ -path: Mandatory
    if(nwInf->_path == NULL){
        ErrorPrinter(CMD,"ERROR","-path","NULL","Es Obligatorio");
        return 0;
    }

    if(strcasecmp(CMD,"REP") == 0){
        return 1;
    }

    Existence* ex = vFF_Exists(nwInf);

    if(nwInf->_P != 1){
        if(ex->PrevOk == 0){
            ErrorPrinter(CMD,"ERROR","-path",ex->FFName,"La Carpeta Raiz No Existe");
            return 0;
        }
    }

    if(strcasecmp(CMD,"CAT") == 0){
        return 1;
    }

    if(strcasecmp(CMD,"MKDIR") == 0){
        if(ex->iNode > -1){
            ErrorPrinter(CMD,"ERROR","-path",ex->FFName,"La Carpeta Ya Existe");
            return 0;
        }
        return 1;
    }

    if(strcasecmp(CMD,"MKFILE") == 0){
        if(ex->iNode > -1){
            ErrorPrinter(CMD,"ERROR","-path",ex->FFName,"El Archivo Ya Existe");
            return 0;
        }
        return 1;
    }
}

int contV(char* CMD,InfoCatcher* nwInf){
    if(strcasecmp(CMD,"MKFILE") == 0){
        //(^< ............ ............ ............ ............ ............ -cont: Optional
        if(nwInf->_cont != NULL){
            char* txtData = getString_from_File(nwInf->_cont);
            if(txtData == NULL){
                ErrorPrinter("MKFILE","ERROR","-cont",nwInf->_cont,"Archivo No Encontrado");
                return 0;
            }
            nwInf->txtData = txtData;
        }
        return 1;
    }
}

int sizeV(char* CMD,InfoCatcher* nwInf){
    if(strcasecmp(CMD,"MKFILE") == 0){
        if(nwInf->_size < 0){
            ErrorPrinter(CMD,"ERROR","-size","Negativo","El Parametro -size No puede ser Negativo");
            return 0;
        }else{
            char* txtData = getDefault_txtContent(nwInf->_size);
            nwInf->txtData = txtData;
        }
        return 1;
    }
}

//(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............
//(^< ............ ............ ............ ............ ............ Permissions
//(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............




//(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............
//(^< ............ ............ ............ ............ ............ Manager
//(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............


int ErrorManager(InfoCatcher* nwInf,char* CMD){

    int a = 6;
    // 1 = No Error = Ok

    //MKFS   ****************************************************************************************************** 
    if(strcasecmp(CMD,"MKFS") == 0){
        if(idV("MKFS",nwInf) == 0) return 0;
        typeV("MKFS",nwInf);
        fsV("MKFS",nwInf);
        return 1;
    }

    //LOGIN   ****************************************************************************************************** 
    if(strcasecmp(CMD,"LOGIN") == 0){
        if(usrV("LOGIN",nwInf) == 0) return 0;
        if(pwdV("LOGIN",nwInf) == 0) return 0;
        if(idV("LOGIN",nwInf)  == 0) return 0;
        return 1;
    }

    //REP   ****************************************************************************************************** 
    if(strcasecmp(CMD,"REP") == 0){
        if(nameV("REP",nwInf) == 0) return 0;
        if(pathV("REP",nwInf) == 0) return 0;
        if(idV("REP",nwInf)     == 0) return 0;
        if(rutaV("REP",nwInf) == 0) return 0;
        return 1;
    }

    //RECOVERY   ****************************************************************************************************** 
    if(strcasecmp(CMD,"RECOVERY") == 0){
        if(idV("RECOVERY",nwInf) == 0) return 0;
        return 1;
    }

    //LOSS   ****************************************************************************************************** 
    if(strcasecmp(CMD,"LOSS") == 0){
        if(idV("LOSS",nwInf) == 0) return 0;
        return 1;
    }

    //(^< ............ ............ ............ ............ ............ root use only
    if (strcasecmp(Omni->LoggedUser->UsrName,"root") != 0){
        ErrorPrinter(CMD,"ERROR","Usuario",Omni->LoggedUser->UsrName,"Solo root puede usar este Comando");
        return 0;
    }

    //MKGRP   ****************************************************************************************************** 
    if(strcasecmp(CMD,"MKGRP") == 0){
        if(nameV("MKGRP",nwInf) == 0) return 0;
        return 1;
    }

    //RMGRP   ****************************************************************************************************** 
    if(strcasecmp(CMD,"RMGRP") == 0){
        if(nameV("RMGRP",nwInf) == 0) return 0;
        return 1;
    }

    //MKUSR   ****************************************************************************************************** 
    if(strcasecmp(CMD,"MKUSR") == 0){
        if(usrV("MKUSR",nwInf) == 0) return 0;
        if(pwdV("MKUSR",nwInf) == 0) return 0;
        if(grpV("MKUSR",nwInf)     == 0) return 0;

        return 1;
    }

    //RMUSR   ****************************************************************************************************** 
    if(strcasecmp(CMD,"RMUSR") == 0){
        if(usrV("RMUSR",nwInf) == 0) return 0;
        return 1;
    }

    //MKFILE   ****************************************************************************************************** 
    if(strcasecmp(CMD,"MKFILE") == 0){
        if(pathV("MKFILE",nwInf) == 0) return 0;
        sizeV("MKFILE",nwInf);
        contV("MKFILE",nwInf);
        
        return 1;
    }

    //MKDIR   ****************************************************************************************************** 
    if(strcasecmp(CMD,"MKDIR") == 0){
        if(pathV("MKDIR",nwInf) == 0) return 0;
        return 1;
    }

    //REM   ****************************************************************************************************** 
    if(strcasecmp(CMD,"REM") == 0){
        return 1;
    }

    //CAT   ****************************************************************************************************** 
    if(strcasecmp(CMD,"CAT") == 0){
        nwInf->_path = newString(nwInf->_file);
        if(pathV("CAT",nwInf) == 0) return 0;
        return 1;
    }

    
}


#endif // VALIDATE_H