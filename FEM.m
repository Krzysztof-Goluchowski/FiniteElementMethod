function FEM(n)
    h = 2/n;
    
    % Tworzymy macierz
    matrix = zeros(n+1, n+1);
    
    % Tworzymy wektor wyrazów wolnych
    wektor_pr = zeros(n+1, 1);
    
    % Wymuszenie warunku brzegowego
    matrix(1,1) = 1;
    wektor_pr(1,1) = 1;

    matrix(2, 3) = functionB(2, 3, n); % Dolna przekątna
    matrix(2, 2) = functionB(2, 2, n); % Przekątna
    wektor_pr(2, 1) = functionL(2, n) - functionB(1, 2, n) + 5 * baseFunction(2, n, 2); % Wektor prawej strony

    for i=3:n
        matrix(i, i+1) = functionB(i, i+1, n);% Dolna przekątna
        matrix(i, i) = functionB(i, i, n);    % Przekątna
        matrix(i, i-1) = functionB(i, i-1, n);% Górna przekątna
        wektor_pr(i, 1) = functionL(i, n) - functionB(1, i, n) + 5 * baseFunction(i, n, 2);    % Wektor prawej strony
    end

    matrix(n+1, n+1) = functionB(n+1, n+1, n); % Przekątna
    matrix(n+1, n) = functionB(n+1, n, n);     % Górna przekątna
    wektor_pr(n+1, 1) = functionL(n+1, n) - functionB(1, n+1, n) + 5 * baseFunction(n+1, n, 2);     % Wektor prawej strony
    
    % Rozwiązywanie układu równań
    result = linsolve(matrix, wektor_pr);
    disp(result);
    x = 0: h: 2;
    y = zeros(1, n+1);
    for i=1:length(x)
        for j=1:length(result)
            y(i) = y(i) + result(j) * baseFunction(j-1, n, x(i));
        end
    end
    plot(x, y);
end