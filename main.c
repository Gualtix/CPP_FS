#include <stdio.h>
#include <stdlib.h>
#include <strings.h>

#include "Fw/StringHandler.h"
#include "Fw/Helper.h"
#include "Analizer.h"

int main()
{

    /*
    newLine_Flag = 0;
    cmdString    = NULL;
     */
    
    int i = 0;
    while (i < 25){
        UsingDisk_List[i] = *newDisk_in_Use();
        i++;
    }

    Omni = newGLS();

    while (1){
        system("clear");
        printf("\n");        
        printf("(^< ............ ............ ............\n");
        printf("Ready to Execute:\n");
        //char *InputString = CatchCommandLine();
        char *InputString = newString("exec -path=/home/wrm/Desktop/CPP_FS/marcou.sh");
        //int Rs = strcasecmp(InputString, "exit\n");
        //if (Rs == 0){
            //break;
        //}
        ExecuteComand(InputString);
        break;
    }    
    
    printf("(^< ............ S A L I E N D O ............\n");
    return 0;
}
