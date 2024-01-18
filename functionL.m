function result = functionL(v, n)
    h = 2/n;
    v = v-1;
    x1 = h * (1/sqrt(3)) + v * h;
    x2 = h * (-1/sqrt(3)) + v * h;
    result = h * (sin(x1) * baseFunction(v, n, x1)  + ...
                  sin(x2) * baseFunction(v, n, x2));
end
