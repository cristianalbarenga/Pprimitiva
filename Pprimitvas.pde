/* 
  --Objeto Primitivas--
  Crea cuadrado, triangulo y circulo 
  cuyas proporciones son similares visualmente
  El cuadrado se puede rotar 45º, y el triangulo 
  puede tener la punta hacia abajo o arriba
    
  Pprimitiva.display( TIPO ,  POSICION , TAMAÑO , ROTACION );
  TIPO 
    'A' : triangulo
    'B' : cuadrado
    'C' : circulo
    
   POSICION - matriz int[] pos     
   TAMAÑO - int
   ROTACION - boolean (true/false)
*/

class Pprimitiva{
  
  /************** VARIABLES *************
  -------------------------------------*/
  //primitiva
  int size; // tamaño
  int[] posicion; //posicion
  float rotacion; //rotacion

  /************* CONSTRUCTOR *************   
  ---------------------------------------*/ 
  Pprimitiva(){
    rectMode(CENTER);    
  }
  
  /************** FUNCIONES **************
  ---------------------------------------*/
  
  //--- RENDERIZA LA FORMA ---//
  /* Muestra la forma en pantalla */
  void display(char TIPO,int[] POSICION,int TAMANIO,boolean ROTACION){
   
    size=TAMANIO; 
    
    pushMatrix();
      translate(POSICION[0],POSICION[1]);
      
      switch( TIPO ){
        case 'A':
          triangulo( ROTACION );
          break;      
        case 'B':
          cuadrado( ROTACION );
          break;      
        case 'C':
          circulo();
          break;      
          }
     popMatrix(); 
  }//-------------------//
  
  //--- TRIANGULO SIMPLE ---//
  /*
  rotacion: hacia arriba (false) o hacia abajo (true)
  */
  void triangulo(boolean rotacion){
     
    int pivote= size/2; //punto pivote del traingulo
    float rot=0;
    
    if(rotacion){rot=PI;} //rota 180º
    float[][] puntos={ {0,-pivote},{-size/1.8,pivote},{size/1.8,pivote}}; //puntos del triangulo
      
    pushMatrix();
    rotate(rot);
       triangle(puntos[0][0],puntos[0][1],puntos[1][0],puntos[1][1],puntos[2][0],puntos[2][1]);
    popMatrix();
    
  }//-------------------//
  
  
  //--- CUADRADO SIMPLE ---//
  /*
  rotacion: cuadrado (false) o rombo (true)
  */
  void cuadrado(boolean rotacion){
    
    float tam=size, // tamaño del cuadrado
          rot=0; //valor de la rotacion
    
    if(rotacion){ //si el cuadrado se rota
      tam= size*0.85; //ajuste optico del tamaño
      rot=PI/4; //define rotacion de 45º
    }
    
    pushMatrix();
    rotate(rot);
      rect(0,0,tam,tam);
    popMatrix();
   
  }//--------------//
      
      
  //--- CIRCULO SIMPLE ---//
  void circulo(){
    float tam= size * 1.15; //ajuste optico del tamaño
    ellipse(0,0,tam, tam); //dibuja el circulo     
  }//----------------//
 
}//-------- END OBJECT ---------//
