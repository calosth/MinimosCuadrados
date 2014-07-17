function [E,fx] = error(vecx,vecy,func)

    E = 0;

    for i=1:length(vecx)
       
        x = vecx(i);
        fx(i) = eval(func);
        E = E + ( vecy(i) - fx(i) )^2;
        
    end
    