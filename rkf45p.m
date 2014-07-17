function [y1] = rkf45p(f,a,b,in,hmin,hmax,tol)

    format long;
    
    BAND = 1;
    X(1) = a;
    Z(1) = in;
    Y(1) = in;
    auxx=0;
    
    R = 0;   
    
    h = 0;
    
    i = 1;
    
    fprintf(' %.7f      %.7f    %.7f     %.7f     %.7f \n',X(1),Z(1),h,R,Y(1));
    
    h = hmax;
    
    
    while(BAND)
        
        x = X(i);
        y = Y(i);
        
        k1 = h * eval(f);
        
        auxx = x;
        auxy = y;              
        
        x = auxx + (h / 4);
        y = auxy + (k1 / 4);
        
        k2 = h * eval(f);
        
        x = auxx + (h * 3/8);
        y = auxy + ((3/32 * k1) + (9/32 * k2));
        
        k3 = h * eval(f);m , 
        
        x = auxx + (12/13 * h);
        y = auxy + ((1932/2197 * k1) - (7200/2197 * k2) + (7296/2197 * k3));
        
        k4 = h * eval(f);
        
        x = auxx + h;
        y = auxy + ((439/216 * k1) - (8*k2) + (3680/513 * k3) - (845/4104 * k4));
        
        k5 = h * eval(f);
        
        x = auxx + (1/2 * h);
        y = auxy + (-(8/27 * k1) + (2*k2) - (3544/2565 * k3) + (1859/4104 * k4) - (11/40 * k5));
        
        k6 = h * eval(f);       
        
        R = abs( ( k1/360 ) - ( 128*k3/4275 ) - ( 2197*k4/75240 ) + ( k5/50 ) + ( 2*k6/55 ) ) / h ;
        
        if R <= tol
            
            auxx = auxx + h;
            
            Z(i+1) = Z(i) + ( (25/216 * k1) + (1408/2565 * k3) + (2197/4104 * k4) - (1/5 * k5) );  
            Y(i+1) = Y(i) + ( ( 16/135 * k1 ) + ( 6656/12825 * k3 ) + ( 28561/56430 * k4 ) - ( 9/50 * k5 ) + ( 2/55 * k6 ) );
            
            fprintf(' %.7f      %.7f    %.7f     %.7f     %.7f\n',auxx,Z(i+1),h,R,Y(i+1));
            
        end
        
        i = i + 1;
        X(i) = auxx;
        
        d = 0.84*((tol/R)^(1/4));
        
        if (d <= 0.1)
            h = 0.1 * h;            
        elseif (d >= 4)
            h = 4 * h;            
        else
            h = d * h;
        end
        
        if (h > hmax)
            h = hmax;   
        end
        
        if (auxx >= b)
            BAND = 0;
        elseif ((auxx + h) > b)
            h = b - auxx;
        elseif (h < hmin)
            BAND = 0;
            break;
        end                                            
        
    end

end