function [cl] = interpolate(alpha)
    alpha_values = [-2.025902479, 0.038772741, 2.05982177, 6.017645346, 9.932239783, ...
        14.16254093, 14.36464087, 17.98442351, 22.07932961, 26.01754869, ...
        27.87918097, 31.99647093];
    alpha_values = alpha_values .* pi/180;
     
    cl_values = [-0.20812679, 0.00652805, 0.22331494, 0.62902511, 1.03258364, ...
        1.30984164, 1.00359647, 0.83948681, 0.70332889, 0.85200745, ...
        0.91454208, 1.00542989];
    %we want to find what 2 values of alpha our value falls between
    for cnt = 1:length(alpha_values)
        if alpha > alpha_values(cnt) && alpha < alpha_values(cnt+1)
            small_alpha = alpha_values(cnt);
            large_alpha = alpha_values(cnt+1);
            small_cl = cl_values(cnt);
            large_cl = cl_values(cnt+1);
            break
        end
    end

    cl = small_cl + (alpha - small_alpha) * ((large_cl - small_cl) / (large_alpha - small_alpha));
end

