%Matlab adaptive quadrature adaptq.m
%TODO: 
%fix midpoint rule
%test
%error prediction and correction
%can we use variance on the samples weve collected to make better
%predictions for step size?

function R = adaptq_basic(f, a, b, tau)
%model after the stepwise midpoint/trapezoidal method
%Move from a to b in steps.
%At each step approximate the integral over
%the current step, and the error in the approximation.
%Accept the approximation if the error is sufficiently small, otherwise reject it and take a
%smaller step
% Based on the information created in the previous step, calculate a new stepsize.
%Repeat items 2–4 until done.

% Thus in building our algorithm we will
%ignore the higher order terms. This assumption is fundamental in most ODE and PDE
%solvers. 

%step size selection
%require e_n <= (h_n/(b-a))tau]
%For efficiency, the stepsize should
%be such that the inequality in (13) is satisfied as closely as possible by equality
    format long;
    n = 1;
    total=0;
    RES=0;
    previousStep = a;
    safety = .95;
    
    %choose h to be small
    h = .0001;
    test=1;
    while(true)
        total = total + 1;
        currentStep = previousStep + h;

        if (previousStep == b) 
            R=RES;
            disp("total: " + total);
            disp("succesful Loops: " + n);
            return;
        end

        %dont overshoot
        if (currentStep > b)
            h = b - previousStep;
            currentStep = b;
        end
        
        %calculate step error
        M_n = midpoint(f, previousStep, currentStep, h);
        T_n = trapezoidal(f, previousStep, currentStep, h);
        
        e_est = abs((T_n - M_n)/3);
        e_des = abs((h * tau)/(b-a));

        %h = safety * sqrt(abs(3*tau*(h^3))/(b-a) * (T_n * M_n));
        if (e_est > e_des)
            h = safety * h * sqrt(double(e_des)/double(e_est));
            continue;
        end
            n = n + 1;
            RES = RES + M_n;
            previousStep = currentStep;
            test = test + 1;
    end
end