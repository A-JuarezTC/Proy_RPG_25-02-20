juego P1;
juego P2;
juego Interfase;
int dmgP1 = (int)random(10, 50);
int dmgP2 = (int)random(10, 50);

void setup(){
  size (500,500);
  P1 = new juego(dmgP1,100,100,300);
  P2 = new juego(dmgP2,100,300,300);
  Interfase = new juego();
}

void draw(){
  Interfase.CambioPantalla();
}


class juego{
  int pantalla;
  int turno;
  boolean jugador1;
  boolean jugador2;
  int ataque;
  int vida;
  int px;
  int py;
  int ID1;
  int ID2;
  
  juego(){
    this.pantalla = 0;
    this.turno = 0;
    this.jugador1 = false;
    this.jugador2 = false;
    this.ID1 = 0;
    this.ID2 = 0;
  }
  
  juego(int a_, int v_, int x_, int y_){
   this.ataque = a_;
   this.vida = v_;
   this.px = x_;
   this.py = y_;
  }
  
  void PanInicio(){
    pushMatrix();
      background(#B9FFFD);
      fill(#712C00);
      rect(60,200,50,70);
      fill(#712C00);
      rect(380,200,50,70);
      fill(#712C00);
      rect(220,200,50,70);
      fill(#FCDE70);
      rect(0,260,500,260);
      beginShape();
      vertex(20,200);
      vertex(150,200);
      vertex(85,50);
      fill(#004D06);
      endShape(CLOSE);
      beginShape();
      vertex(350,200); 
      vertex(460,200);
      vertex(408,50);
      fill(#004D06);
      endShape(CLOSE);
      textSize(100);
      fill(#000000);
      text(" uwu ", 110, 150); 
      textSize(20);
      fill(#000000);
      text("Presione ENTER para ir a siguiente pantalla", 40, 300);
    popMatrix();
    
    if(key == ENTER){
      this.pantalla = 1;
    }
  }
  
  void PanInstruccion(){
    background(#B9FFFD);
    fill(#712C00);
    rect(60,200,50,70);
    fill(#712C00);
    rect(380,200,50,70);
    fill(#712C00);
    rect(220,200,50,70);
    fill(#FCDE70);
    rect(0,260,500,260);
    beginShape();
    vertex(20,200);
    vertex(150,200);
    vertex(85,50);
    fill(#004D06);
    endShape(CLOSE);
    beginShape();
    vertex(350,200); 
    vertex(460,200);
    vertex(408,50);
    fill(#004D06);
    endShape(CLOSE);
    textSize(40);
    fill(0);
    text("Instrucciones", 30, 100);
    textSize(20);
    text("Selecciona un personaje\ncon las teclas Z, X, C, V y B\nsi eres el jugador 1 y con\n1, 2, 3, 4 y 5 si eres el jugador 2",30,150);
    textSize(10);
    text("Presione ESPACIO para sig. pantalla",30,400);
    if(key == ' '){
      this.pantalla = 2;
    }
  }
  
  void PanSeleccion(){
    background(#B9FFFD);
    fill(#712C00);
    rect(60,200,50,70);
    fill(#712C00);
    rect(380,200,50,70);
    fill(#712C00);
    rect(220,200,50,70);
    fill(#FCDE70);
    rect(0,260,500,260);
    beginShape();
    vertex(20,200);
    vertex(150,200);
    vertex(85,50);
    fill(#004D06);
    endShape(CLOSE);
    beginShape();
    vertex(350,200); 
    vertex(460,200);
    vertex(408,50);
    fill(#004D06);
    endShape(CLOSE);
    pushMatrix();
    translate(10,200);
    Per1();
    translate(100,-9);
    Per2();
    translate(90,10);
    Per3();
    translate(99,-9);
    Per4();
    translate(90,26);
    Per5();
    popMatrix();
    if(keyPressed){
      if(key == 'z' || key == 'Z'){
        this.ID1 = 1;
        this.jugador1 = true;
      }
      else if(key == 'x' || key == 'X'){
        this.ID1 = 2;
        this.jugador1 = true;
      }
      else if(key == 'c' || key == 'C'){
        this.ID1 = 3;
        this.jugador1 = true;
      }
      else if(key == 'v' || key == 'V'){
        this.ID1 = 4;
        this.jugador1 = true;
      }
      else if(key == 'b' || key == 'B'){
        this.ID1 = 5;
        this.jugador1 = true;
      }
    }
    
    if(keyPressed){
      if(key == '1'){
        this.ID2 = 1;
        this.jugador2 = true;
      }
      else if(key == '2'){
        this.ID2 = 2;
        this.jugador2 = true;
      }
      else if(key == '3'){
        this.ID2 = 3;
        this.jugador2 = true;
      }
      else if(key == '4'){
        this.ID2 = 4;
        this.jugador2 = true;
      }
      else if(key == '5'){
        this.ID2 = 5;
        this.jugador2 = true;
      }
    }
    
    if(this.jugador1 && this.jugador2){
      this.pantalla = 3;
    }
  }
  
  void PanPelea(){
    background(#B9FFFD);
    fill(#712C00);
    rect(60,200,50,70);
    fill(#712C00);
    rect(380,200,50,70);
    fill(#712C00);
    rect(220,200,50,70);
    fill(#FCDE70);
    rect(0,260,500,260);
    beginShape();
    vertex(20,200);
    vertex(150,200);
    vertex(85,50);
    fill(#004D06);
    endShape(CLOSE);
    beginShape();
    vertex(350,200); 
    vertex(460,200);
    vertex(408,50);
    fill(#004D06);
    endShape(CLOSE);
    DisplayP1();
    DisplayP2();
    fill(255,0,0);
    textSize(30);
    text("PS" + P1.vida,100,100);
    text("PS" + P2.vida,300,100);
    textSize(15);
    text("Presiona A",100,150);
    text("Presiona L",300,150);
    
    if(this.turno == 0){
      if(keyPressed){
        if(key == 'a' || key == 'A'){
          P2.vida = P2.vida - P1.ataque;
          this.turno = 2;
        }
      }
    }
    
    if(this.turno == 2){
      if(keyPressed){
        if(key == 'l' || key == 'L'){
          P1.vida = P1.vida - P2.ataque;
          this.turno = 0;
        }
      }
    }
    
    if(P1.vida <= 0 || P2.vida <= 0){
      this.pantalla = 4;
    }
  }
  
  void PanGanador(){
    background(#B9FFFD);
    fill(#712C00);
    rect(60,200,50,70);
    fill(#712C00);
    rect(380,200,50,70);
    fill(#712C00);
    rect(220,200,50,70);
    fill(#FCDE70);
    rect(0,260,500,260);
    beginShape();
    vertex(20,200);
    vertex(150,200);
    vertex(85,50);
    fill(#004D06);
    endShape(CLOSE);
    beginShape();
    vertex(350,200); 
    vertex(460,200);
    vertex(408,50);
    fill(#004D06);
    endShape(CLOSE);
    fill(0);
    textSize(50);
    if(P1.vida > P2.vida){
      text("Jugador 1 gana",100,300);
    }
    else{
      text("Jugador 2 gana",100,300);
    }
    textSize(20);
    text("Pulsa R para reiniciar",100,400);
    if(key == 'r' || key == 'R'){
      this.pantalla = 0;
      this.turno = 0;
      this.jugador1 = false;
      this.jugador2 = false;
      this.ID1 = 0;
      this.ID2 = 0;
      P1.vida = 100;
      P2.vida = 100;
    }
  }
  
  void CambioPantalla(){
    switch(pantalla){
      case 0:
        PanInicio();
      break;
      
      case 1:
        PanInstruccion();
      break;
      
      case 2:
        PanSeleccion();
      break;
      
      case 3:
        PanPelea();
      break;
      
      case 4:
        PanGanador();
      break;
    }
  }
  
  void DisplayP1(){
    switch(this.ID1){
       case 1:
         pushMatrix();
            translate(P1.px,P1.py);
            beginShape();
            vertex(80,70);
            vertex(90,65);
            vertex(92,63);
            vertex(92,55);
            vertex(98,40);//
            vertex(98,36);//
            vertex(92,51);
            vertex(92,59);
            vertex(90,61);
            vertex(80,66);
            fill(#FFA91F);
            endShape(CLOSE);
            
            //cuerpo
            beginShape();
            vertex(30,20); //p1
            vertex(25,30); //p2
            vertex(10,70); //p3
            vertex(20,75); //p4
            vertex(73,75); //p5
            vertex(80,70); //p6 -
            vertex(65,30); //p7 -
            vertex(60,20); //p8
            vertex(55,30); //p9
            vertex(35,30); //p10
            fill(#FFA91F);
            endShape(CLOSE);
            
            //cejas
            beginShape();
            vertex(38,38);
            vertex(42,42);
            endShape(CLOSE);
            
            beginShape();
            vertex(52,38);
            vertex(48,42);
            endShape(CLOSE);
            
            //ojo
            beginShape();
            vertex(40,40);
            vertex(40,45);
            endShape(CLOSE);
            //ojo#2
            beginShape();
            vertex(50,40);
            vertex(50,45);
            endShape(CLOSE);
            
            fill(#FF76BF);
            ellipse(32,47,8,5);
            
            fill(#FF76BF);
            ellipse(57,47,8,5);
         popMatrix();
       break;
       
       case 2:
         pushMatrix();
            translate(P1.px, P1.py);
            beginShape();
            vertex(80,80);  
            vertex(90,80);
            vertex(92,78);
            vertex(92,60);
            vertex(90,58);
            vertex(80,58);
            vertex(75,60);
            fill(#FFFFFF);
            endShape(CLOSE);
            
            //cuerpo
            beginShape();
            vertex(28,40);
            vertex(30,20);
            vertex(20,10); //p1
            vertex(10,20); //p2
            vertex(15,50); //p3
            vertex(10,80); //p4
            vertex(13,85); //p5
            vertex(75,85); //p6
            vertex(80,80); //p7
            vertex(70,50); //p8
            vertex(75,20); //p9
            vertex(65,10); //p10
            vertex(53,20); //p11
            vertex(60,40); //p12
            fill(#FFFFFF);
            endShape(CLOSE);
            
            //cejas
            beginShape();
            vertex(28,58);
            vertex(32,62);
            endShape(CLOSE);
            
            beginShape();
            vertex(52,58);
            vertex(48,62);
            endShape(CLOSE);
            
            //ojo
            beginShape();
            vertex(30,60);
            vertex(30,70);
            endShape(CLOSE);
            //ojo#2
            beginShape();
            vertex(50,60);
            vertex(50,70);
            endShape(CLOSE);
            
            fill(#FF76BF);
            ellipse(23,72,8,5);
            
            fill(#FF76BF);
            ellipse(56,72,8,5);           
         popMatrix();
       break;
       
       case 3:
         pushMatrix();
            translate(P1.px, P1.py);
            beginShape();
            fill(#FFDD17);
            vertex(30,40);
            vertex(40,30);
            vertex(45,35);
            vertex(52,32);
            vertex(55,40);
            vertex(65,45);
            vertex(62,52);
            vertex(70,58);
            vertex(65,70);
            vertex(78,63);
            vertex(83,75);
            vertex(90,68);
            vertex(95,75);
            vertex(80,75);
            endShape(CLOSE);
            
            beginShape(); 
            vertex(40,35); //p1
            vertex(25,40); //p2
            vertex(15,70); //p3
            vertex(20,75); //p4
            vertex(105,75); //p5
            vertex(65,65); //p6
            vertex(55,40); //p7
            vertex(40,35); //p8 
            fill(#4EFF2C);
            endShape(CLOSE);
            
             //cejas
            beginShape();
            vertex(28,48);
            vertex(32,52);
            endShape(CLOSE);
            
            beginShape();
            vertex(42,48);
            vertex(38,52);
            endShape(CLOSE);
            
            //ojo
            beginShape();
            vertex(30,50);
            vertex(30,55);
            endShape(CLOSE);
            
            //ojo#2
            beginShape();
            vertex(40,50);
            vertex(40,55);
            endShape(CLOSE);
            
            fill(#FF76BF);
            ellipse(23,57,8,5);
            
            fill(#FF76BF);
            ellipse(47,57,8,5);
         popMatrix();
       break;
       
       case 4:
         pushMatrix();
            translate(P1.px, P1.py);
            beginShape();
            vertex(90,80);  
            vertex(100,80);
            vertex(102,78);
            vertex(102,60);
            vertex(100,58);
            fill(#7E3D00);
            endShape(CLOSE);
            
            //cuerpo
            beginShape();
            vertex(50,25);
            vertex(30,30); //Orejas
            vertex(25,25);
            vertex(15,25);
            vertex(10,45);
            vertex(25,35); //p1 - CUERPO
            vertex(20,80); //p2
            vertex(23,85); //p3
            vertex(85,85); //p4
            vertex(90,80); //p5
            vertex(80,35); //p6
            vertex(95,45);
            vertex(90,25);
            vertex(80,25);
            vertex(75,30);
            fill(#FFFFFF);
            endShape(CLOSE);
            
            //color oreja
            beginShape();
            vertex(30,30);
            vertex(25,25);
            vertex(15,25);
            vertex(10,45);
            fill(#7E3D00);
            endShape(CLOSE);
            
            fill(#7E3D00);
            ellipse(60,55,14,16);
            
            //cejas
            beginShape();
            vertex(38,50);
            vertex(42,52);
            endShape(CLOSE);
            
            beginShape();
            vertex(62,50);
            vertex(58,52);
            endShape(CLOSE);
            
            //ojo
            beginShape();
            vertex(40,50);
            vertex(40,60);
            endShape(CLOSE);
            //ojo#2
            beginShape();
            vertex(60,50);
            vertex(60,60);
            endShape(CLOSE);
            
            fill(#FF76BF);
            ellipse(33,60,8,5);
            
            fill(#FF76BF);
            ellipse(66,60,8,5);
         popMatrix();
       break;
       
       case 5:
         pushMatrix();
            translate(P1.px, P1.py);
            beginShape();
            vertex(50,30);
            vertex(65,22);
            vertex(65,30);
            endShape();
            
            beginShape();
            vertex(40,45);
            vertex(35,40);
            vertex(35,50);
            vertex(40,45);
            vertex(40,60);
            vertex(70,60);
            vertex(80,50);
            vertex(90,58);
            vertex(90,32);
            vertex(80,40);
            vertex(70,30);
            vertex(40,30);
            vertex(40,45);
            fill(#FFB803);
            endShape();
            
            //Ojo
            beginShape();
            vertex(45,38);
            vertex(50,45);
            endShape();
            beginShape();
            vertex(50,38);
            vertex(45,45);
            endShape();
            
            beginShape();
            vertex(60,40);
            vertex(70,50);
            vertex(60,50);
            endShape();
         popMatrix();
       break;
    }
  }
  
  void DisplayP2(){
    switch(this.ID2){
       case 1:
         pushMatrix();
            translate(P2.px,P2.py);
            beginShape();
            vertex(80,70);
            vertex(90,65);
            vertex(92,63);
            vertex(92,55);
            vertex(98,40);//
            vertex(98,36);//
            vertex(92,51);
            vertex(92,59);
            vertex(90,61);
            vertex(80,66);
            fill(#FFA91F);
            endShape(CLOSE);
            
            //cuerpo
            beginShape();
            vertex(30,20); //p1
            vertex(25,30); //p2
            vertex(10,70); //p3
            vertex(20,75); //p4
            vertex(73,75); //p5
            vertex(80,70); //p6 -
            vertex(65,30); //p7 -
            vertex(60,20); //p8
            vertex(55,30); //p9
            vertex(35,30); //p10
            fill(#FFA91F);
            endShape(CLOSE);
            
            //cejas
            beginShape();
            vertex(38,38);
            vertex(42,42);
            endShape(CLOSE);
            
            beginShape();
            vertex(52,38);
            vertex(48,42);
            endShape(CLOSE);
            
            //ojo
            beginShape();
            vertex(40,40);
            vertex(40,45);
            endShape(CLOSE);
            //ojo#2
            beginShape();
            vertex(50,40);
            vertex(50,45);
            endShape(CLOSE);
            
            fill(#FF76BF);
            ellipse(32,47,8,5);
            
            fill(#FF76BF);
            ellipse(57,47,8,5);
         popMatrix();
       break;
       
       case 2:
         pushMatrix();
            translate(P2.px, P2.py);
            beginShape();
            vertex(80,80);  
            vertex(90,80);
            vertex(92,78);
            vertex(92,60);
            vertex(90,58);
            vertex(80,58);
            vertex(75,60);
            fill(#FFFFFF);
            endShape(CLOSE);
            
            //cuerpo
            beginShape();
            vertex(28,40);
            vertex(30,20);
            vertex(20,10); //p1
            vertex(10,20); //p2
            vertex(15,50); //p3
            vertex(10,80); //p4
            vertex(13,85); //p5
            vertex(75,85); //p6
            vertex(80,80); //p7
            vertex(70,50); //p8
            vertex(75,20); //p9
            vertex(65,10); //p10
            vertex(53,20); //p11
            vertex(60,40); //p12
            fill(#FFFFFF);
            endShape(CLOSE);
            
            //cejas
            beginShape();
            vertex(28,58);
            vertex(32,62);
            endShape(CLOSE);
            
            beginShape();
            vertex(52,58);
            vertex(48,62);
            endShape(CLOSE);
            
            //ojo
            beginShape();
            vertex(30,60);
            vertex(30,70);
            endShape(CLOSE);
            //ojo#2
            beginShape();
            vertex(50,60);
            vertex(50,70);
            endShape(CLOSE);
            
            fill(#FF76BF);
            ellipse(23,72,8,5);
            
            fill(#FF76BF);
            ellipse(56,72,8,5);           
         popMatrix();
       break;
       
       case 3:
         pushMatrix();
            translate(P2.px, P2.py);
            beginShape();
            fill(#FFDD17);
            vertex(30,40);
            vertex(40,30);
            vertex(45,35);
            vertex(52,32);
            vertex(55,40);
            vertex(65,45);
            vertex(62,52);
            vertex(70,58);
            vertex(65,70);
            vertex(78,63);
            vertex(83,75);
            vertex(90,68);
            vertex(95,75);
            vertex(80,75);
            endShape(CLOSE);
            
            beginShape(); 
            vertex(40,35); //p1
            vertex(25,40); //p2
            vertex(15,70); //p3
            vertex(20,75); //p4
            vertex(105,75); //p5
            vertex(65,65); //p6
            vertex(55,40); //p7
            vertex(40,35); //p8 
            fill(#4EFF2C);
            endShape(CLOSE);
            
             //cejas
            beginShape();
            vertex(28,48);
            vertex(32,52);
            endShape(CLOSE);
            
            beginShape();
            vertex(42,48);
            vertex(38,52);
            endShape(CLOSE);
            
            //ojo
            beginShape();
            vertex(30,50);
            vertex(30,55);
            endShape(CLOSE);
            
            //ojo#2
            beginShape();
            vertex(40,50);
            vertex(40,55);
            endShape(CLOSE);
            
            fill(#FF76BF);
            ellipse(23,57,8,5);
            
            fill(#FF76BF);
            ellipse(47,57,8,5);
         popMatrix();
       break;
       
       case 4:
         pushMatrix();
            translate(P2.px, P2.py);
            beginShape();
            vertex(90,80);  
            vertex(100,80);
            vertex(102,78);
            vertex(102,60);
            vertex(100,58);
            fill(#7E3D00);
            endShape(CLOSE);
            
            //cuerpo
            beginShape();
            vertex(50,25);
            vertex(30,30); //Orejas
            vertex(25,25);
            vertex(15,25);
            vertex(10,45);
            vertex(25,35); //p1 - CUERPO
            vertex(20,80); //p2
            vertex(23,85); //p3
            vertex(85,85); //p4
            vertex(90,80); //p5
            vertex(80,35); //p6
            vertex(95,45);
            vertex(90,25);
            vertex(80,25);
            vertex(75,30);
            fill(#FFFFFF);
            endShape(CLOSE);
            
            //color oreja
            beginShape();
            vertex(30,30);
            vertex(25,25);
            vertex(15,25);
            vertex(10,45);
            fill(#7E3D00);
            endShape(CLOSE);
            
            fill(#7E3D00);
            ellipse(60,55,14,16);
            
            //cejas
            beginShape();
            vertex(38,50);
            vertex(42,52);
            endShape(CLOSE);
            
            beginShape();
            vertex(62,50);
            vertex(58,52);
            endShape(CLOSE);
            
            //ojo
            beginShape();
            vertex(40,50);
            vertex(40,60);
            endShape(CLOSE);
            //ojo#2
            beginShape();
            vertex(60,50);
            vertex(60,60);
            endShape(CLOSE);
            
            fill(#FF76BF);
            ellipse(33,60,8,5);
            
            fill(#FF76BF);
            ellipse(66,60,8,5);
         popMatrix();
       break;
       
       case 5:
         pushMatrix();
            translate(P2.px, P2.py);
            beginShape();
            vertex(50,30);
            vertex(65,22);
            vertex(65,30);
            endShape();
            
            beginShape();
            vertex(40,45);
            vertex(35,40);
            vertex(35,50);
            vertex(40,45);
            vertex(40,60);
            vertex(70,60);
            vertex(80,50);
            vertex(90,58);
            vertex(90,32);
            vertex(80,40);
            vertex(70,30);
            vertex(40,30);
            vertex(40,45);
            fill(#FFB803);
            endShape();
            
            //Ojo
            beginShape();
            vertex(45,38);
            vertex(50,45);
            endShape();
            beginShape();
            vertex(50,38);
            vertex(45,45);
            endShape();
            
            beginShape();
            vertex(60,40);
            vertex(70,50);
            vertex(60,50);
            endShape();
         popMatrix();
       break;
    }
  }
  
  void Per1(){
    pushMatrix();
            beginShape();
            vertex(80,70);
            vertex(90,65);
            vertex(92,63);
            vertex(92,55);
            vertex(98,40);//
            vertex(98,36);//
            vertex(92,51);
            vertex(92,59);
            vertex(90,61);
            vertex(80,66);
            fill(#FFA91F);
            endShape(CLOSE);
            
            //cuerpo
            beginShape();
            vertex(30,20); //p1
            vertex(25,30); //p2
            vertex(10,70); //p3
            vertex(20,75); //p4
            vertex(73,75); //p5
            vertex(80,70); //p6 -
            vertex(65,30); //p7 -
            vertex(60,20); //p8
            vertex(55,30); //p9
            vertex(35,30); //p10
            fill(#FFA91F);
            endShape(CLOSE);
            
            //cejas
            beginShape();
            vertex(38,38);
            vertex(42,42);
            endShape(CLOSE);
            
            beginShape();
            vertex(52,38);
            vertex(48,42);
            endShape(CLOSE);
            
            //ojo
            beginShape();
            vertex(40,40);
            vertex(40,45);
            endShape(CLOSE);
            //ojo#2
            beginShape();
            vertex(50,40);
            vertex(50,45);
            endShape(CLOSE);
            
            fill(#FF76BF);
            ellipse(32,47,8,5);
            
            fill(#FF76BF);
            ellipse(57,47,8,5);
         popMatrix();
  }
  
  void Per2(){
    pushMatrix();
            beginShape();
            vertex(80,80);  
            vertex(90,80);
            vertex(92,78);
            vertex(92,60);
            vertex(90,58);
            vertex(80,58);
            vertex(75,60);
            fill(#FFFFFF);
            endShape(CLOSE);
            
            //cuerpo
            beginShape();
            vertex(28,40);
            vertex(30,20);
            vertex(20,10); //p1
            vertex(10,20); //p2
            vertex(15,50); //p3
            vertex(10,80); //p4
            vertex(13,85); //p5
            vertex(75,85); //p6
            vertex(80,80); //p7
            vertex(70,50); //p8
            vertex(75,20); //p9
            vertex(65,10); //p10
            vertex(53,20); //p11
            vertex(60,40); //p12
            fill(#FFFFFF);
            endShape(CLOSE);
            
            //cejas
            beginShape();
            vertex(28,58);
            vertex(32,62);
            endShape(CLOSE);
            
            beginShape();
            vertex(52,58);
            vertex(48,62);
            endShape(CLOSE);
            
            //ojo
            beginShape();
            vertex(30,60);
            vertex(30,70);
            endShape(CLOSE);
            //ojo#2
            beginShape();
            vertex(50,60);
            vertex(50,70);
            endShape(CLOSE);
            
            fill(#FF76BF);
            ellipse(23,72,8,5);
            
            fill(#FF76BF);
            ellipse(56,72,8,5);           
         popMatrix();
  }
  
  void Per3(){
    pushMatrix();
            beginShape();
            fill(#FFDD17);
            vertex(30,40);
            vertex(40,30);
            vertex(45,35);
            vertex(52,32);
            vertex(55,40);
            vertex(65,45);
            vertex(62,52);
            vertex(70,58);
            vertex(65,70);
            vertex(78,63);
            vertex(83,75);
            vertex(90,68);
            vertex(95,75);
            vertex(80,75);
            endShape(CLOSE);
            
            beginShape(); 
            vertex(40,35); //p1
            vertex(25,40); //p2
            vertex(15,70); //p3
            vertex(20,75); //p4
            vertex(105,75); //p5
            vertex(65,65); //p6
            vertex(55,40); //p7
            vertex(40,35); //p8 
            fill(#4EFF2C);
            endShape(CLOSE);
            
             //cejas
            beginShape();
            vertex(28,48);
            vertex(32,52);
            endShape(CLOSE);
            
            beginShape();
            vertex(42,48);
            vertex(38,52);
            endShape(CLOSE);
            
            //ojo
            beginShape();
            vertex(30,50);
            vertex(30,55);
            endShape(CLOSE);
            
            //ojo#2
            beginShape();
            vertex(40,50);
            vertex(40,55);
            endShape(CLOSE);
            
            fill(#FF76BF);
            ellipse(23,57,8,5);
            
            fill(#FF76BF);
            ellipse(47,57,8,5);
         popMatrix();
  }
  
  void Per4(){
    pushMatrix();
            beginShape();
            vertex(90,80);  
            vertex(100,80);
            vertex(102,78);
            vertex(102,60);
            vertex(100,58);
            fill(#7E3D00);
            endShape(CLOSE);
            
            //cuerpo
            beginShape();
            vertex(50,25);
            vertex(30,30); //Orejas
            vertex(25,25);
            vertex(15,25);
            vertex(10,45);
            vertex(25,35); //p1 - CUERPO
            vertex(20,80); //p2
            vertex(23,85); //p3
            vertex(85,85); //p4
            vertex(90,80); //p5
            vertex(80,35); //p6
            vertex(95,45);
            vertex(90,25);
            vertex(80,25);
            vertex(75,30);
            fill(#FFFFFF);
            endShape(CLOSE);
            
            //color oreja
            beginShape();
            vertex(30,30);
            vertex(25,25);
            vertex(15,25);
            vertex(10,45);
            fill(#7E3D00);
            endShape(CLOSE);
            
            fill(#7E3D00);
            ellipse(60,55,14,16);
            
            //cejas
            beginShape();
            vertex(38,50);
            vertex(42,52);
            endShape(CLOSE);
            
            beginShape();
            vertex(62,50);
            vertex(58,52);
            endShape(CLOSE);
            
            //ojo
            beginShape();
            vertex(40,50);
            vertex(40,60);
            endShape(CLOSE);
            //ojo#2
            beginShape();
            vertex(60,50);
            vertex(60,60);
            endShape(CLOSE);
            
            fill(#FF76BF);
            ellipse(33,60,8,5);
            
            fill(#FF76BF);
            ellipse(66,60,8,5);
         popMatrix();
  }
  
  void Per5(){
    pushMatrix();
            beginShape();
            vertex(50,30);
            vertex(65,22);
            vertex(65,30);
            endShape();
            
            beginShape();
            vertex(40,45);
            vertex(35,40);
            vertex(35,50);
            vertex(40,45);
            vertex(40,60);
            vertex(70,60);
            vertex(80,50);
            vertex(90,58);
            vertex(90,32);
            vertex(80,40);
            vertex(70,30);
            vertex(40,30);
            vertex(40,45);
            fill(#FFB803);
            endShape();
            
            //Ojo
            beginShape();
            vertex(45,38);
            vertex(50,45);
            endShape();
            beginShape();
            vertex(50,38);
            vertex(45,45);
            endShape();
            
            beginShape();
            vertex(60,40);
            vertex(70,50);
            vertex(60,50);
            endShape();
         popMatrix();
  }
}
