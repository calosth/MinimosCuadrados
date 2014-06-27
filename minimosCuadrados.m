function minimosCuadrados(vecx , vecy, method)
    
    % Programa que calcula la ecuacion de la recta mediante mínimos
    % cuadrados
    
    % Se ingresan los valores de x separados por comas y distintos entre sí
    % Se ingresan los valores de y separados por comas
    

    if length(vecx) == length(vecy)
    
        switch method

            case 1
                
                for i=1:length(vecx)
                    vecx(i) = 1 / (vecx(i));
                end
                
                [a,b] = AyB(vecx,vecy);
                
                func = sprintf('%.4f/x + %.4f',a,b);       
                for i=1:length(vecx)
                    vecx(i) = 1 / (vecx(i));
                end
                
            
            case 2
                 
                 for i=1:length(vecx)
                     vecx(i) = vecx(i) * vecy(i);
                 end
                 
                 [a,b] = AyB(vecx,vecy);
                 
                 d = 1 / a; 
                 
                 c = d * b;
                 
                 func = sprintf('%.4f / x + %.4f',d,c); 
                 

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
                func = sprintf('e^(%.4f*x)', a);
                
            case 5
                for i=1:length(vexc)
                    vecx(i) = log(vecx(i))
                end
                [a,b] = AyB(vecx,vecy);
                func = sprintf('%.4fLn(x) + %.4f',a,b); 
                 
             case 6
                 for i=1;length(vecx)
                     vecy(i) = - sqrt(vecy(i));
                 end
                 [a,b] = AyB(vecx,vecy);
                 func = sprintf('(%.4f*x + %.4f) ^ -2',a,b);
                
            
             case 7

                %En caso de que la funcion sea lineal

                [a,b] = AyB(vecx,vecy);
                func = sprintf('%.4f*x + (%.4f)',a,b);
            

        end
        E = 0
        for i=1:length(vecx)
            x = vecx(i);
            fx(i) = eval(func);
            E = E + ( vecy(i) - fx(i) )^2;
        end
        

        plot(vecx,fx,'b'), hold on;

        plot(vecx,vecy,'.');

        legend(func,'puntos');

        hold off; 
    
    else        
        fprintf('No tienen la misma longitud los vectores x e y');
        
    end
    
    
    
    
    
    
    
    