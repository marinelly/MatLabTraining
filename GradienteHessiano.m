% Programa que calcula el graadiente y el Hessiano
% en un punto dado

clear all
nv=input('Digite el n�mero de variables: ');
fun=input('Digite la funci�n: ','s');
Xo = input('Digite el punto a evaluar: ');

%C�lculo de vector grradiente
for i=1:nv
g(i)=diff(sym(fun),['x',num2str(i)]); %diff:deriva, sym:convierte una variable en simbolica, []: concatena
end

%Evaluacu�n del gradiente en Xo

for i=1:nv
    
   s=char(g(i));
   for j=1:nv
   s=strrep(s,['x', num2str(j)],num2str(Xo(j)));
   end
   gx(i)=str2num(s);
end
gx'


%C�lculo de la matriz Hessiana

for i=1:nv
   s=sym(g(i));
   for j=1:nv
       h(i,j)=diff(s,['x', num2str(j)]);
   end
end
h

%Evaluaci�n de la matriz Hessiana en Xo

for i=1:nv
    for j=1:nv
    s=char(h(i,j));
        for k=1:nv
           s= strrep(s,['x', num2str(k)],num2str(Xo(k)));
        end
        hx(i,j)=str2num(s);
    end
end
hx