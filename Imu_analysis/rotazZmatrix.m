function [rotmatrix,matrposiniz]=rotazZmatrix(dati,TRmatrix,graf)


TRmatr=[TRmatrix.Points(:,1) TRmatrix.Points(:,2) TRmatrix.Points(:,3)];

%matrice di rotaz rispetto al nord
R_iniz=rotz(dati(1,1));
%stl ruotato sul punto di partenza rispetto al nord
matr1=TRmatr*R_iniz;
%calcolo vertice superiore del mio stl scritto come vettore perchè devo
%moltiplicarlo per le matrici di rotazione (questo è sul nord)(blu)
k=max(TRmatr(:,1))*1.3;
j=[k 0 0];
%calcolo punto j girato (j1)per capire da dove parto con la rotaz. (verde)
j1=j*R_iniz;
%matrice di rotaz totale (questo è contributo dalla partenza fino al punto
%di arrivo
R1=rotz(dati(end,1)-dati(1,1));
%stl ruotato totalmente
matriceruot=matr1*R1;
%punto di arrivo(rosso)
j2=j1*R1;

rotmatrix=R_iniz*R1;
matrposiniz=R_iniz;

%metto if per grafico
if graf ==1
    %grafico finale
    trisurf(TRmatrix.ConnectivityList,matriceruot(:,1),matriceruot(:,2),matriceruot(:,3));
    hold on
    plot3(j(1),j(2),j(3),'b*');
    plot3(j1(1),j1(2),j1(3),'g*');
    plot3(j2(1),j2(2),j2(3),'r*');
    title('blu:nord,verde:partenza risp a nord, rosso:arrivo')
    ylabel('gradi');
    xlabel('tempo');
end
end