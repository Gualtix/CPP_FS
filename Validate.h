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
        nwInf->_fs == "ext3";
        return 1;
    }

    if(strcasecmp(nwInf->_fs,"fast") != 0 && strcasecmp(nwInf->_fs,"full")){
        nwInf->_fs == "ext3";
        return 1;
    }

    nwInf->_fs == "ext3";

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

    if(usr == -1){
        ErrorPrinter(CMD,"ERROR","-usr",nwInf->_usr,"El Usuario no Existe");
        return 0;
    }

    return 1;
}

int pwdV(char* CMD,InfoCatcher* nwInf){
    //(^< ............ ............ ............ ............ ............ _pwd: Mandatory
    if(nwInf->_pwd ==  NULL){
        ErrorPrinter(CMD,"ERROR","-pwd","NULL","Es Obligatorio");
        return 0;
    }

    DoublyGenericList* usrList = getUsersList();
    GroupUserInfo* gu = getUSR_by_Name(nwInf->_usr,usrList);

    if(strcmp(nwInf->_pwd,gu->Password) != 0){
        ErrorPrinter("LOGIN","ERROR","-pwd",nwInf->_pwd,"Password Incorrecto");
        return 0;
    }

    return 1;
}

int nameV(char* CMD,InfoCatcher* nwInf){
    //(^< ............ ............ ............ ............ ............ -name: Mandatory
    if(nwInf->_name == NULL){
        ErrorPrinter(CMD,"ERROR","-name","NULL","Es Obligatorio");
        return 0;
    }

    DoublyGenericList*  grpList = getGroupsList();
    GroupUserInfo* gu = newGrus();
    int grpEx = grpExists(nwInf->_name,grpList);

    //(^< ............ ............ ............ ............ ............ -name: Exist
    if(strcasecmp(CMD,"MKGRP") == 0){
        if(grpEx > -1){
        ErrorPrinter(CMD,"ERROR","-name",nwInf->_name,"Este Grupo ya Existe");
        return 0;
        }
    }
    
    //(^< ............ ............ ............ ............ ............ -name: Unique
    if(strcasecmp(CMD,"RMGRP") == 0){
        if(grpEx == -1){
        ErrorPrinter(CMD,"ERROR","-name",nwInf->_name,"Este Grupo No Existe");
        return 0;
        }
    }
    
}

int pathV(char* CMD,InfoCatcher* nwInf){
    //(^< ............ ............ ............ ............ ............ -path: Mandatory
    if(nwInf->_path == NULL){
        ErrorPrinter(CMD,"ERROR","-path","NULL","Es Obligatorio");
        return 0;
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



//(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............
//(^< ............ ............ ............ ............ ............ Manager
//(^< ............ ............ ............ ............ ............ ............ ............ ............ ............ ............


int ErrorManager(InfoCatcher* nwInf,char* CMD){
    // 1 = No Error = Ok

    //MKFS   ****************************************************************************************************** 
    if(strcasecmp(CMD,"MKFS") == 0){
        if(idV("MKFS",nwInf) == 0) return 0;
        typeV("MKFS",nwInf);
        fsV("MKFS",nwInf);
        return 1;
    }

    //LOGIN   ****************************************************************************************************** 
    if(strcasecmp(CMD,"LOGIN")       == 0){
        if(usrV("LOGIN",nwInf) == 0) return 0;
        if(pwdV("LOGIN",nwInf)       == 0) return 0;
        if(idV("LOGIN",nwInf)   == 0) return 0;
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
        if(usrV("MKUSR",nwInf) == 0) return 0;
        return 1;
    }

    //MKFILE   ****************************************************************************************************** 
    if(strcasecmp(CMD,"MKFILE") == 0){
        return 1;
    }

    //MKDIR   ****************************************************************************************************** 
    if(strcasecmp(CMD,"MKDIR") == 0){
        return 1;
    }

    //REM   ****************************************************************************************************** 
    if(strcasecmp(CMD,"REM") == 0){
        return 1;
    }
}


#endif // VALIDATE_H