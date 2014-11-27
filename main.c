#include <stdlib.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
	if (!(argc<3 && argc>1)){
		printf("Nombre d'arguments invalide : \n");
		printf("Usage %s fichier.dot \n", argv[0] );
	}
	else{
		printf("OK \n");
		FILE* fichier = NULL;
    	fichier = fopen(argv[1], "r+");
    	if (fichier == NULL){
    		perror("Erreur lors de la lecture du fichier");
    	}
    	else{
    		fclose(fichier);
    	}
    	
	}


    return 0;
}