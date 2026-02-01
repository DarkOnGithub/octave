load Ex1.mat;

n = 200;
t = linspace(0, 2*pi, n);

[P, D] = eigs(A);
lambda1 = D(1,1);
lambda2 = D(2,2);

x_prime = cos(t) ./ sqrt(lambda1);
y_prime = sin(t) ./ sqrt(lambda2);

X_prime = [x_prime; y_prime];

X = P * X_prime;

figure(1); clf;
plot(cos(t), sin(t), 'k--', 'LineWidth', 1);
hold on;

plot(X(1,:), X(2,:), 'r', 'LineWidth', 2);

axis equal;

legend('Cercle unité ||u|| = 1', 'Cercle unité pour la norme ||u||_A = 1');
xlabel('x_1');
ylabel('x_2');
hold off;
