%yn+1 = hfn + yn
function approximation = euler(f,x0,y0, a, b, n)
    x = zeros;
    y = zeros;
    
    x(1) = x0;
    y(1) = y0;
    
    for k=1:n
        x(k+1)=x(k) + ((b-a)/n);
        y(k+1)= y(k) + f(x(k),y(k))*((b-a)/n);
    end
    
    approximation = [x; y];
end