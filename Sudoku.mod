/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Couldosh
 * Creation Date: 21 août 2020 at 08:29:39
 *********************************************/
range N = 1..9;
int grid[N][N] = ...;
dvar int choice[N][N] in N;

subject to{
  forall(i in N){
    forall(j1 in N){
      forall(j2 in N : j1!=j2){
        choice[i][j1] != choice[i][j2];//Chaque élément de la ligne different
        choice[j1][i] != choice[j2][i];//Chaque élément de la colonne different
      }
      
      if(grid[i][j1]!=0){
        choice[i][j1]==grid[i][j1]; //Ajout des cases déjà remplies de la grille
      }
    }
  }
  //Contrainte des boites 3x3
  forall(p in 1..3,q in 1..3){
    forall(i1 in 3*p-2..3*p,j1 in 3*q-2..3*q,i2 in 3*p-2..3*p,j2 in 3*q-2..3*q : i1!=i2 && j1!=j2){
      choice[i1][j1]!=choice[i2][j2];
    }
  }
  

}