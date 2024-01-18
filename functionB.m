function result = functionB(u, v, n)
    h = 2/n;
    u = u-1;
    v = v-1;
    result = -baseFunction(u, n, 2) * baseFunction(v, n, 2);
    
    % Dolna przekątna
    if u == v+1 || u == n
        x1 = h/2 * (1/sqrt(3)) + u*h - h/2;
        x2 = h/2 * (-1/sqrt(3)) + u*h - h/2;
        result = result + h/2 * (deriviative(u, n, x1) * deriviative(v, n, x1) + ...
                                 deriviative(u, n, x2) * deriviative(v, n, x2)) - ...
                          h/2 * (baseFunction(u, n, x1) * baseFunction(v, n, x1) + ...
                                 baseFunction(u, n, x2) * baseFunction(v, n, x2));
    % Przekątna
    elseif u == v
        x1 = h * (1/sqrt(3)) + u*h;
        x2 = h * (-1/sqrt(3)) + u*h;
        result = result + h * (deriviative(u, n, x1) * deriviative(v, n, x1) + ...
                               deriviative(u, n, x2) * deriviative(v, n, x2)) - ...
                          h * (baseFunction(u, n, x1) * baseFunction(v, n, x1) + ...
                               baseFunction(u, n, x2) * baseFunction(v, n, x2));

    % Górna przekątna
    elseif u == v-1
        x1 = h/2 * (1/sqrt(3)) + u*h + h/2;
        x2 = h/2 * (-1/sqrt(3)) + u*h + h/2;
        result = result + h/2 * (deriviative(u, n, x1) * deriviative(v, n, x1) + ...
                                 deriviative(u, n, x2) * deriviative(v, n, x2)) - ...
                          h/2 * (baseFunction(u, n, x1) * baseFunction(v, n, x1) + ...
                                 baseFunction(u, n, x2) * baseFunction(v, n, x2));
    end
end