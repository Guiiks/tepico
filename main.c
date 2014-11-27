#include <stdlib.h>
#include <stdio.h>
#include <regex.h>
#include <sys/stat.h>

int fileExists(const char* file) {
    struct stat buf;
    return (stat(file, &buf) == 0);
}

int verifier_fichier(char* nom){
	int res = 0;
	if(!fileExists(nom)){
		res = 1;
		printf("Ce fichier n'existe pas");
	}
	else{
		regex_t preg;
		regcomp(&preg, ".dot$", REG_EXTENDED|REG_NOSUB);
		int retour = regexec(&preg, nom,0,0,0);
		if (retour){
			printf("Le fichier doit être un .dot sale merde !");
			res = 1;
		}
	}
	
	return res;
}
int main(int argc, char *argv[])
{

	if (!(argc<3 && argc>1)){
		printf("Nombre d'arguments invalide : \n");
		printf("Usage %s fichier.dot \n", argv[0]);
	}
	else{
		
		if (verifier_fichier(argv[1])==0){
			FILE* fichier = NULL;
    		fichier = fopen(argv[1], "r+");
    		if (fichier == NULL){
    			perror("Erreur lors de la lecture du fichier");
    		}
    		else{
    			fclose(fichier);
    		}
		}
		
    	
	}


    return 0;
}

