%yn+2 − yn = (h/3)*(fn+2 + 4fn+1 + fn)
%y_n+2=(1/(1-(h/3))*(((4*h)/3)*y_n+1) + y_n)
function S = simpson(f, previousStep, currentStep, n)
    sum = 0;
    for k=1:n-1  
        if(mod(k, 2) == 0)
            sum = sum + (2*f(previousStep + k*((currentStep - previousStep)/n)));
        else
            sum = sum + (4*f(previousStep + k*((currentStep - previousStep)/n)));
        end
        
    end
    S = f(previousStep) + f(currentStep) + (((currentStep - previousStep)/n)/3)*sum;
end