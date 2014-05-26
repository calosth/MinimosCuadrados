function minimosCuadrados(x , y)
    
    % Programa que calcula la ecuacion de la recta mediante m�nimos
    % cuadrados
    
    % Se ingresan los valores de x separados por comas y distintos entre s�
    % Se ingresan los valores de y separados por comas
    
%     vecx = str2num( input('x=','s') );
%     vecy = str2num( input('y=','s') );
     vecx = str2num( x );
     vecy = str2num( y ); 
%      method = str2num( method );
    % Se ingresa un valor num�rico que haga referencia al tipo de ajuste:
    % 1: lineal
    % 2: potencial
    
%     method = str2num( input('metodo: ','s') );
    
    method = 1;

    if length(vecx) == length(vecy)
    
        switch method

            case 1
                
                for i=1:length(vecx)
                    vecx(i) = 1 / (vecx(i));
                end
                
                [a,b] = AyB(vecx,vecy);
                
                func = sprintf('%.4f/x. + %.4f',a,b);
            

            case 3
                %En caso de que la funcion sea Potencial
                for i=1:length(vecx)
                    vecx(i) = log(vecx(i));
                    vecy(i) = log(vecy(i));
                end
                [a,b] = AyB(vecx,vecy);

                c = exp(b);   

                func = sprintf('%.4f*x.^(%.4f)',c,a);

                for i=1:length(vecx)
                    vecx(i) = exp(vecx(i));
                    vecy(i) = exp(vecy(i));        
                end
            case 4 
                for i=1:length(vecx)
                    vecy(i) = log(vecy(i));
                end
                [a,b] = AyB(vecx,vecy);
                c = exp(b);
                func = sprintf('e^(%.4f x)', a);
            case 5
                for i=1:length(vexc)
                    vecx(i) = log(vecx(i))
                end
                [a,b] = AyB(vecx,vecy);
                func = sprintf('%.4fLn(x) + %.4f',a,b);
                
            
                
            
             case 7

                %En caso de que la funcion sea lineal

                [a,b] = AyB(vecx,vecy);
                func = sprintf('%.4f*x + (%.4f)',a,b);
            

        end

        for i=1:length(vecx)

            x = vecx(i);
            fx(i) = eval(func);

        end

        plot(vecx,fx,'b'), hold on;

        plot(vecx,vecy,'.');

        legend(func,'puntos'); pause; close;

        hold off; 
    
    else        
        fprintf('No tienen la misma longitud los vectores x e y');
        
    end
    
    
    
    
    
    
    
    