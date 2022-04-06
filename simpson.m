function S = simpson(f, previousStep, currentStep, h)
    S = (h/3)*(f(previousStep) + (4*f((currentStep + previousStep)/2)) + f(currentStep));
end