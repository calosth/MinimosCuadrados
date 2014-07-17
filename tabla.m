function tabla(vecx,vecy,func)

    vecxXvecy = 0;
    vecx2 = 0;
    
    for i=1:length(vecx)
       
        vecxXvecy = vecxXvecy + ( vecx(i) * vecy(i) );
        vecx2 = vecx2 + ( vecx(i)^2 );
        
    end

    fprintf(' \n i      x        y       x*y      x^2    ');
    fprintf('\n -------------------------------------------------');

    for i=1:length(vecx)
       
        fprintf('\n %0.f %8.2f %8.2f %8.2f %8.2f %8.2f ',i,vecx(i),vecy(i),vecx(i)*vecy(i),vecx(i)^2);
        
    end
    
    fprintf('\n--------------------------------------------------');
    fprintf('\n   %8.2f %8.2f %8.2f %8.2f \n',sum(vecx),sum(vecy),vecxXvecy,vecx2);
    fprintf('--------------------------------------------------');
    
    fprintf('\n La curva de aproximacion es y=%s \n',func);