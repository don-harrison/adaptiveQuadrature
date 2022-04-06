% MIDPOINT
%
% apply the midpoint rule. Use as midpoint(f,a,b,n)
function M = midpoint(f, currentStep, previousStep, h)
    M = h*f((previousStep + currentStep)/2);
end