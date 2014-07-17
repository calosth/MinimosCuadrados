function minimosCuadrados()
<<<<<<< HEAD
=======
    % Programa que calcula la ecuación de la recta mediante Mínimos Cuadrados
    % utilizando siete tipos de cambios de variables, además 
    % sugiere cual es la mejor función usando el criterio del menor error y grafica 
    % todos las funciones calculadas contrastadas con los puntos dados.
    %
    % La función lee un archivo de texto que tiene en cada linea pares de
    % puntos
    %
    %
    % Ejemplo: minimosCuadrados()
>>>>>>> FETCH_HEAD
    
    file = fopen('archivo.txt');
    
<<<<<<< HEAD
    
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
=======
    x = fgets(file);
    vecx = str2num(x);
     y = fgets(file);
    vecy = str2num(y);
    
    Orinigal_vecx = vecx;
    Orinigal_vecy = vecy;
    

    if length(vecx) == length(vecy)
        fprintf('Funcion                             Error Local\n');
        fprintf('-----------------------------------------------\n');
        ErrorMenor = 1000000;
        ktotal=0;
        
        for i=1:length(vecx)
            vecx(i) = 1 / (vecx(i));
        end
        [a,b] = AyB(vecx,vecy);
        func = sprintf('%.4f/x + %.4f',a,b);         
        [E,ErrorMenor,ktotal] = GraphicAndError(ktotal,ErrorMenor, Orinigal_vecx, Orinigal_vecy, func,1);
        fprintf('\t\t\t%.4f\n',E);
        vecx = Orinigal_vecx;
        vecy = Orinigal_vecy;
        
        
        for i=1:length(vecx)
            vecx(i) = vecx(i) * vecy(i);
        end
        [a,b] = AyB(vecx,vecy);
        d = 1 / a;
        c = d * b;
        func = sprintf('%.4f / x + %.4f',d,c);                                 
        [E,ErrorMenor,ktotal] = GraphicAndError(ktotal,ErrorMenor, Orinigal_vecx, Orinigal_vecy, func,2);
        fprintf('\t\t\t%.4f\n',E);
        vecx = Orinigal_vecx;
        vecy = Orinigal_vecy;        


        for i=1:length(vecx)
            vecx(i) = log(vecx(i));
            vecy(i) = log(vecy(i));
        end
        [a,b] = AyB(vecx,vecy);
        c = exp(b);   
        func = sprintf('%.4f*x.^(%.4f)',c,a);        
        [E,ErrorMenor,ktotal] = GraphicAndError(ktotal,ErrorMenor, Orinigal_vecx, Orinigal_vecy, func,3);
        fprintf('\t\t\t%.4f\n',E);
        vecx = Orinigal_vecx;
        vecy = Orinigal_vecy;        
        
        
        for i=1:length(vecx)
            vecy(i) = log(vecy(i));
        end
        [a,b] = AyB(vecx,vecy);
        c = exp(b);
        func = sprintf('exp((%.4f*x))', a);
        [E,ErrorMenor,ktotal] = GraphicAndError(ktotal,ErrorMenor, Orinigal_vecy, Orinigal_vecy, func,4);
        fprintf('\t\t\t%.4f\n',E);
        vecx = Orinigal_vecx;
        vecy = Orinigal_vecy;
        
        
        for i=1:length(vecx)
            vecx(i) = log(vecx(i));
        end
        [a,b] = AyB(vecx,vecy);
        func = sprintf('%.4f*log(x) + %.4f',a,b);
        [E,ErrorMenor,ktotal] = GraphicAndError(ktotal,ErrorMenor, Orinigal_vecx, Orinigal_vecy, func,5);
        fprintf('\t\t%.4f\n',E);                
        vecx = Orinigal_vecx;
        vecy = Orinigal_vecy;
        
        
        for i=1:length(vecx)
            vecy(i) = - sqrt(vecy(i));
        end
        [a,b] = AyB(vecx,vecy);
        func = sprintf('(%.4f*x + %.4f) ^ -2',a,b);
        [E,ErrorMenor,ktotal] = GraphicAndError(ktotal,ErrorMenor, Orinigal_vecx, Orinigal_vecy, func,6);
        fprintf('\t\t%.4f\n',E);
        vecx = Orinigal_vecx;
        vecy = Orinigal_vecy;        
        
        [a,b] = AyB(vecx,vecy);
        func = sprintf('%.4f*x + (%.4f)',a,b);     
        [E,ErrorMenor,ktotal] = GraphicAndError(ktotal,ErrorMenor, Orinigal_vecx, Orinigal_vecy, func,7);
        fprintf('\t\t\t%.4f\n',E);         
        vecx = Orinigal_vecx;
        vecy = Orinigal_vecy;  
        
        fprintf('-----------------------------------------------\n');        
        fprintf('La función que mejor se ajusta a los puntos dados es %d, con error local: %.4f\n\n',ktotal,ErrorMenor)
>>>>>>> FETCH_HEAD
    
    else        
        
        fprintf('No tienen la misma longitud los vectores x e y');       
        
    end
    
end
<<<<<<< HEAD

=======
    
function [E,ErrorMenor,ktotal] = GraphicAndError(ktotal,ErrorMenor,vecx,vecy, func,k)

    E = 0;
    for m=1:length(vecx)
        x = vecx(m);
        fx(m) = eval(func);
        E = E + (vecy(m) - fx(m))^2; % Calculo el error
    end

    fprintf('%d) %s',k,func);
    
    subplot(3,4,k,'Position');
    
    plot(vecx,fx,'b-',vecx,vecy,'.r'), hold on;
    title(['Error: ',num2str(E)]);
    legend(func,'Location','Best');
    hold off;    

    if(E < ErrorMenor)
        ErrorMenor = E;
        ktotal = k;
    end
     
end
    
>>>>>>> FETCH_HEAD
    
function graficar(vecx,vecy,fx,func,k,E)

    subplot(2,4,k);         

    plot(vecx,fx,'b'); grid; hold on;

    plot(vecx,vecy,'.'); title(['Error = ',num2str(E)]);

    legend(func,'puntos','Location','Best');

    hold off;
    
end

        
    
    

    
    
    