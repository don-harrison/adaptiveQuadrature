% TRAPEZOIDAL
%
% apply the trapezoidal rule. Use as trapezoidal(f,a,b,n)
function T = trapezoidal(f, currentStep, previousStep, h)
    T = (h/2)*(f(previousStep)+f(currentStep));
end