function [rotmatrix]=rotazXmatrix(dati,TRmatrix,graf)


TRmatr=[TRmatrix.Points(:,1) TRmatrix.Points(:,2) TRmatrix.Points(:,3)];

%matrice di rotaz rispetto al punto iniziale ( ossia 0 gradi di roll)

R_iniz=rotx(-dati(1,3));

%stl ruotato sul punto di partenza rispetto al punto iniziale
matr1=TRmatr*R_iniz;


%matrice di rotaz totale (questo è contributo dalla partenza rispetto al nord fino al punto
%di arrivo)

R1=rotx(-(dati(end,3)-dati(1,3)));

%stl ruotato totalmente
matriceruot=matr1*R1;

%matrice di rotazione totale (dal nord fino all'arrivo)
rotmatrix=R_iniz*R1;

%metto if per grafico
if graf ==1
    %grafico finale
    trisurf(TRmatrix.ConnectivityList,matriceruot(:,1),matriceruot(:,2),matriceruot(:,3));

    title('Rotaz intorno asse X ')

end
end