%programa qu2e calcula el minimo para una funcion no lineal univariable
%mediante el metodo de los tres puntos

clear all
a = input('digite el extremo izquierdo del intervalo ');
b = input('digite el extremo derecho del intervalo ');
tol = input('digite tolerancia del intervalo ');
fun = input('digite funcion ', 's');
opcion = input('digite 0 para hallar el mínimo y 1 para el máximo');


sw = 0;

while(sw == 0)
    d = (b-a)*((-1+sqrt(5))/2);
    x1 = a + d;
    x2 = b - d;
    x = [x1, x2];
    
    for i=1:2
        f(i)= str2num(strrep(fun, 'x', num2str(x(i))));
    end
    
    if(opcion == 0)
        [fop, pos] = min(f);
    else
        [fop, pos] = max(f);
        
    end      
    xopt = x(pos);
        if(b-a)>  tol 
            if(pos==1)
                a = x(2);
            else
                b = x(1);
            end
        else
            sw = 1;
        end
   
end

if opcion == 0
    fprintf('El mínimo es X* = %f\n', xopt);
    fprintf('El f mínimo es f(x*) = %f\n', fop);
else
    fprintf('El máximo es X* = %f\n', xopt);
    fprintf('El f máximo es f(x*) = %f\n', fop);
end