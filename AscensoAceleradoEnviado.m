%maximizar una funcion usando el metodo ascenso acelerado
%por Miguel Rodriguez y Marinelly Rua

clear all

fun = input('digite la funcion a maximizar: ', 's');
nv=input('Digite el número de variables: ');
Xo = input('Digite el valor inicial para el vector Xo: ');
tol = input('Digite la toleracia: ');

%evaluar la funcion en Xo
s = fun;
for i=1:nv
        s = strrep(s, ['x', num2str(i)], num2str(Xo(i)));
end

fxo = str2num(s);

 for i=1:nv
    
    %genera el gradiente

        g(i) = diff(sym(fun),['x',num2str(i)]); %diff:deriva, sym:convierte una variable en simbolica, []: concatena
    end
sw = 0;
while(sw == 0)
   
    
    %X0+lambda*g(i)
    for i=1:nv
        l{i,1}=[num2str(Xo(i)), '+','l','*','(', strrep(char(g(i)), ['x', num2str(i)], num2str(Xo(i))), ')'];
    end
    funrep = fun;
    for i=1:nv
        funrep = strrep(funrep, ['x', num2str(i)], l{i,1});
    end
    
    %grafica la funcion landa para escoger el intervalo
    x=-99:100;
    for i=1:200
        y(i) = str2num(strrep(funrep,'l', num2str(x(i))));
    end
    plot(x,y);
    
    %metodo de los 3 puntos
    a = input('digite el extremo izquierdo del intervalo ');
    b = input('digite el extremo derecho del intervalo ');
    tol = input('digite tolerancia del intervalo ');
    
    sw2 = 0;

    while(sw2 == 0)
        h = (b-a)/4;
        x1 = a + h;
        x2 = x1 + h;
        x3 = x2 + h;
        x = [x1, x2, x3];

        for i=1:3
            f(i)= str2num(strrep(funrep, 'l', num2str(x(i))));
        end


        [fop, ind] = max(f);
        xopt = x(ind);
        if((b-a)>  tol) 
            a = xopt - h;
            b = xopt + h;
        else
            sw2 = 1;
        end
    end
    
    
    
    fprintf('El lambda optimo es: %f\n',xopt);
    for i=1:nv
        X1(i)=str2num(strrep(l{i,1}, 'l', num2str(xopt)));
    end
    s = fun;
    for i=1:nv
            s = strrep(s, ['x', num2str(i)], num2str(X1(i)));
    end

    fx1 = str2num(s);
    fprintf('x1= %f\n');
    X1'
    fprintf('F(x1)= %f\n',fx1);
    if(abs(fx1-fxo) > tol)
        fxo = fx1;
        Xo = X1;
        fprintf('Calculando nuevamente... \n');
    else
        sw = 1;
        fprintf('MAXIMO ENCONTRADO\n');
        fprintf('x*= %f\n',X1);
    fprintf('F(x*)= %f\n',fx1);
    end
    


end


