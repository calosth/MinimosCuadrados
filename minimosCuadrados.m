function minimosCuadrados()
    
    % Programa que calcula la ecuacion de la recta mediante mínimos
    % cuadrados
    
    
    f = fopen('puntos.txt');
    
    x = fgets(f);
    
    VecX = str2num( x );
    
    y = fgets(f);
    
    VecY = str2num( y );
    
    fclose(f);
    
    vecx = VecX;
    vecy = VecY;
    
    k = 1;
    
    if length(vecx) == length(vecy)       
    
        % Para el metodo 1
        fprintf('\n**************************************************');
        for i=1:length(vecx)
            vecx(i) = 1 / (vecx(i));
        end

        [a,b] = AyB(vecx,vecy);

        fprintf('\n Primera Funcion');
        func = sprintf('(%.4f/x) + %.4f',a,b);                

        tabla(vecx,vecy,func);
        
        vecx = VecX;
        vecy = VecY;
              
        [E,fx] = error(vecx,vecy,func);
        
        fprintf('\n El error local total es: E = %.4f',E);    
        fprintf('\n**************************************************\n');
        
        graficar(vecx,vecy,fx,func,k,E);
        
        k = k + 1;
        

        % Para el metodo 2
        fprintf('\n**************************************************');

        for i=1:length(vecx)
            vecx(i) = vecx(i) * vecy(i);
        end

        [a,b] = AyB(vecx,vecy);

        d = 1 / a; 

        c = d * b;
        
        fprintf('\n Segunda Funcion');
        func = sprintf('%.4f / (x + %.4f)',d,c); 
        
        tabla(vecx,vecy,func);

        vecx = VecX;
        vecy = VecY;
        
        [E,fx] = error(vecx,vecy,func);
        
        fprintf('\n El error local total es: E = %.4f',E);
        fprintf('\n**************************************************\n');
        
        graficar(vecx,vecy,fx,func,k,E);
        
        k = k + 1;
        


        %En caso de que la funcion sea Potencial
        
        fprintf('\n**************************************************');

        for i=1:length(vecx)
            vecx(i) = log(vecx(i));
            vecy(i) = log(vecy(i));
        end
        
        [a,b] = AyB(vecx,vecy);

        c = exp(b);   
        
        fprintf('\n Tercera Funcion');

        func = sprintf('%.4f*x^(%.4f)',c,a);
        
        tabla(vecx,vecy,func);

        vecx = VecX;
        vecy = VecY;
        
        [E,fx] = error(vecx,vecy,func);
        fprintf('\n El error local total es: E = %.4f',E);
        fprintf('\n**************************************************\n');
        
        graficar(vecx,vecy,fx,func,k,E);
        
        k = k + 1;
        


        %Para el metodo 4
        
        fprintf('\n**************************************************');

        fprintf('\n Cuarta Funcion');
        
        for i=1:length(vecx)
            vecy(i) = log(vecy(i));
        end

        [a,b] = AyB(vecx,vecy);            
        c = exp(b);

        func = sprintf('exp((%.4f*x))', a);
        
        tabla(vecx,vecy,func);

        vecx = VecX;
        vecy = VecY;
        
        [E,fx] = error(vecx,vecy,func);
        fprintf('\n El error local total es: E = %.4f',E);
        fprintf('\n**************************************************\n');
        
        graficar(vecx,vecy,fx,func,k,E);
        
        k = k + 1;
        

        %Para el metodo 5
        
        fprintf('\n**************************************************');

        fprintf('\n Quinta Funcion');

        for i=1:length(vecx)
            vecx(i) = log(vecx(i));
        end

        [a,b] = AyB(vecx,vecy);
        func = sprintf('%.4f*log(x) + %.4f',a,b); 
        
        tabla(vecx,vecy,func);

        vecx = VecX;
        vecy = VecY; 
        
        [E,fx] = error(vecx,vecy,func);
        fprintf('\n El error local total es: E = %.4f',E);
        fprintf('\n**************************************************\n');
        
        graficar(vecx,vecy,fx,func,k,E);
        
        k = k + 1;


        %Para el metodo 6
        
        fprintf('\n**************************************************');

        fprintf('\n Sexta Funcion');

        for i=1:length(vecx)
            vecy(i) = - sqrt(vecy(i));
        end

        [a,b] = AyB(vecx,vecy);
        func = sprintf('(%.4f*x + %.4f)^(-2)',a,b);
        
        tabla(vecx,vecy,func);

        vecx = VecX;
        vecy = VecY;     
        
        [E,fx] = error(vecx,vecy,func);
        fprintf('\n El error local total es: E = %.4f',E);
        fprintf('\n**************************************************\n');
        
        graficar(vecx,vecy,fx,func,k,E);
        
        k = k + 1;
        

        %En caso de que la funcion sea lineal
        
        fprintf('\n**************************************************');

        fprintf('\n Funcion Lineal');

        [a,b] = AyB(vecx,vecy);
        func = sprintf('%.4f*x + (%.4f)',a,b);
        
        tabla(vecx,vecy,func);
        
        [E,fx] = error(vecx,vecy,func);
        fprintf('\n El error local total es: E = %.4f',E);
        fprintf('\n**************************************************\n');
        
        graficar(vecx,vecy,fx,func,k,E);                                    
    
    else        
        
        fprintf('No tienen la misma longitud los vectores x e y');       
        
    end
    
end

    
function graficar(vecx,vecy,fx,func,k,E)

    subplot(2,4,k);         

    plot(vecx,fx,'b'); grid; hold on;

    plot(vecx,vecy,'.'); title(['Error = ',num2str(E)]);

    legend(func,'puntos','Location','Best');

    hold off;
    
end

        
    
    

    
    
    