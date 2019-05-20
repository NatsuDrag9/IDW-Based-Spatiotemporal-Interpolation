function [y] = IDW_space_time_func(x_int, y_int, t_int, x_stat, y_stat, t_stat, t_stat_plot, val_stat, N, e)
    val_int = [];
    for t_pt = 1:length(t_int)
    for x_pt = 1:length(x_int)
        for y_pt = 1:length(y_int)
            D = [];
            for i=1:length(t_stat)
                x_cord = x_stat{i,1};
                y_cord = y_stat{i,1};
                t_i = t_stat_plot{i,1};
                D = [D,sqrt((x_cord-x_int(x_pt)).^2 +((y_cord-y_int(y_pt)).^2) +(t_i-t_int(t_pt)).^2)];
                [D,I] = sort(D);
                val_calc = val_stat(I);
                if length(D) >= N
                    D = D(1:N);
                    val_calc = val_calc(1:N);
                else 
                    D = D;
                    val_calc = val_calc;
                end
                lamda_temp = D.^e;
                sum_lamda = sum(lamda_temp);
                lamda_temp = lamda_temp/sum_lamda;
                val_int(x_int(x_pt),y_int(y_pt),t_int(t_pt)) = sum(lamda_temp.*val_calc);
            end
        end
    end
    end
    
    y = val_int;
end