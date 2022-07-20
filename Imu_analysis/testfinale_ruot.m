matr = stlread('telefono2.stl');

%per fare ogni esperimento bisogna innanzitutto creare un oggetto del tipo
%tel = mobile dev per accedere ai dati direttamente . Poi bisogna
%cominciare a fare un log ponendo tel.Logging=1 ed infine assegnare i
%valori registrati ad una variabile per poi passarla alle varie function di
%rotazione.
%a = tel.orientlog

%RICORDA A OGNI ESPERIMENTO DEVI FARE discardlogs(tel) se il mobiledev lo
%hai chiamato tel
% 
% torun:
% tel = mobiledev
% avvio e fermo streaming dal telefono
% a = tel.orientlog e runno .

TRmatr=[matr.Points(:,1) matr.Points(:,2) matr.Points(:,3)];
[Rx]=rotazXmatrix(a,matr,0);
[Ry,R1y]=rotazYmatrix(a,matr,0);%returna anche la posiz iniziale per "avviare vettore"
[Rz,R1z]=rotazZmatrix(a,matr,0);

%creo vettore per capire da dove sono partito e dove arrivo
k=max(TRmatr(:,1))*1.3;
%questo punta a nord
j=[k 0 0];

%ora faccio quello per posizione iniziale
jiniz=j*R1z;
jiniz=jiniz*R1y;

%il punto di arrivo
jfin=j*Ry;
jfin=jfin*Rz;

%rotaz finale fatta come Z-Y-Z oppure X-Y-Z
Rtot=Rx*Ry*Rz;
%perchè non arrivo allo stesso punto?
%Rtot=Rx*Rz*Ry
%Rtot=Rz*Ry*Rz;

%ruoto i punti dell'stl
matrruot=TRmatr*Rtot;

%grafico
trisurf(matr.ConnectivityList,matrruot(:,1),matrruot(:,2),matrruot(:,3));
hold on

%questo in blu è il nord
plot3(j(1),j(2),j(3),'b*');
%punto di partenza
plot3(jiniz(1),jiniz(2),jiniz(3),'g*');
%punto di arrivo rosso
plot3(jfin(1),jfin(2),jfin(3),'r*');

title('\color{green}Partenza rispetto al nord, \color{blue}Nord, \color{red}Arrivo')
xlabel('X')
ylabel('Y')
zlabel('Z')