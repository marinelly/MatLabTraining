%programa que calcula el minimo para una funcion no lineal univariable
%mediante el metodo de los tres puntos

clear all
a = input('digite el extremo izquierdo del intervalo ');
b = input('digite el extremo derecho del intervalo ');
tol = input('digite tolerancia del intervalo ');
fun = input('digite funcion ', 's');

sw = 0;

while(sw == 0)
    h = (b-a)/4;
    x1 = a + h;
    x2 = x1 + h;
    x3 = x2 + h;
    x = [x1, x2, x3];
    
    for i=1:3
        f(i)= str2num(strrep(fun, 'x', num2str(x(i))));
    end
    
    
    [fop, ind] = max(f);
    xopt = x(ind);
    if((b-a)>  tol) 
        a = xopt - h;
        b = xopt + h;
    else
        sw = 1;
    end
end

fprintf('X* = %f\n', xopt);
fprintf('f(x*) = %f\n', fop);