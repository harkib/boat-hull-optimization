function [x] = inverse_p(p,y,w, search_right_to_left)

ea = .0005;
es = ea + 1;
inc = .0001;

if search_right_to_left
    xi = w/2;
    while es > ea
        es = abs(polyval(p,xi)-y);
        xi = xi - inc;
        if xi < 0
            disp("****INVERSE FAILED****");
            xi=0;
            break 
        end
    end
    x = xi;
else 
    xi = 0;
    while es > ea
        es = abs(polyval(p,xi)-y)
        xi = xi + inc;
        if xi > w/2
            disp("****INVERSE FAILED****");
            xi=0;
            break 
        end
    end
    x = xi;
    
end

end

