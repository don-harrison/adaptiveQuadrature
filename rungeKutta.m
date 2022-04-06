function est = rungeKutta(f, x0, y0, a, b, n)
    x = zeros;
    y = zeros;
    h = ((b-a)/n);
    x(1) = x0;
    y(1) = y0;

    %Runge Kutta 4th Order loop
    for k=1:n
        K1=h*f(x(k),y(k));
        K2=h*f(x(k)+h/2,y(k)+K1/2);
        K3=h*f(x(k)+h/2,y(k)+K2/2);
        K4=h*f(x(k)+h,y(k)+K3);
        x(k+1) = x(k) + h;
        y(k+1)=y(k)+1/6*(K1+2*K2+2*K3+K4);
    end
        
        est = [x; y];
end