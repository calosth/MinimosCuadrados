function [a,b] = AyB(vecx,vecy)
    
    Sumxy = sum(vecx.*vecy);
    
    nSumxy = length(vecx) * Sumxy;
    
    Sumx = sum(vecx);
    
    Sumy = sum(vecy);
    
    SumPWR2 = sum(vecx.^2);
    
    nSumPWR2 = length(vecx) * SumPWR2;
    
    SumxPWR2 = Sumx.^2;
    
    a = ( nSumxy - ( Sumx*Sumy ) )/( nSumPWR2 - SumxPWR2 )
    
    
    b = ( ( SumPWR2 * Sumy ) - ( Sumxy * Sumx ) ) /( nSumPWR2 - SumxPWR2 )