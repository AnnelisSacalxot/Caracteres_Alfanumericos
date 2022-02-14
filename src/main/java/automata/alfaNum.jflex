/*primer seccion: codigo de usuario*/

package automata
package com.mycompany.alfanumerico;
import java.util.ArrayList;


%%

/*segunda seccion: configuracion*/
%class AlfaNum
%unicode
%line
%column
%int
%public
%ignorecase //no importa si es mayuscula o miniscula
%standalone //crea un main en jflex
%{init
  	  yyline = 1; 
    	yycolumn = 1; 
%init}

%{
    private int contChar= 0;
    private int contVoc1, contVoc2, contVoc3, contVoc4, contVoc5= 0;
    ArrayList<String> contNum=new ArrayList<String>();
	
    private void contadorVocales() {   
       contChar++;
    }
    
    //para que lea las palabras y devuelva las vocales
    public void leyendoPalabra(){
    //ciclo para identificar desde 1 a 5 vocales
    	if(contChar == 1){
    	contVoc1++;
    	}if(contChar == 2){
    	contVoc2++;
    	}if(contChar == 3){
    	contVoc3++;
    	}if(contChar == 4){
    	 contVoc4++;
    	}if(contChar == 5){
    	contVoc5++;
    	}
    }
    
    public int getContVoc1(){
    return contVoc1;
    }
    
     public int getContVoc2(){
     return contVoc2;
    }
   
     public int getContVoc3(){
     return contVoc3;
    } 
    
    public int getContVoc4(){
    return contVoc4;
    }
    
    public int getContVoc5(){
    return contVoc5;
    }
    
    private void contadorNum() {
        contNum.add("Fila: "+yyline+", Columna: "+yycolumn);	
    }
    
    public ArrayList<String> getContNum(){
		return contNum;
	}
    
%}


%eof{
 //System.out.println("Vocales 1: " +  getContVoc1());
 //System.out.println("Vocales 2: " +  getContVoc2());
 //System.out.println("Vocales 3: " +  getContVoc3());
 //System.out.println("Vocales 4: " +  getContVoc4());
 //System.out.println("Vocales 5: " +  getContVoc5());
 //System.out.println("Numeros:" + getContNum());
%eof}

%%

/*tercer seccion: reglase lexicas*/

(aeiouAEIOU)+		{ contadorVocales();}
( 0-9)+				{ contadorNum(); }

[^] {}
