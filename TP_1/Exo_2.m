load Ex1.mat;

n = 100;
t = linspace(0, 2*pi, n);
Circle = [cos(t); sin(t)];

function plot_CE(Circle, M, name, fignum)
  figure(fignum);
  clf;

  Image = M * Circle;

  plot(Circle(1,:), Circle(2,:), 'k--', 'LineWidth', 2);
  hold on;
  plot(Image(1,:), Image(2,:), 'b', 'LineWidth', 2);

  [P, D] = eigs(M);
  lambda1 = D(1,1);
  lambda2 = D(2,2);
  epsilon1 = P(:,1);
  epsilon2 = P(:,2);

  v1 = lambda1 * epsilon1;
  v2 = lambda2 * epsilon2;

  quiver(0, 0, v1(1), v1(2), 0, 'r', 'LineWidth', 2);
  quiver(0, 0, v2(1), v2(2), 0, 'g', 'LineWidth', 2);

  axis equal;
  title(['Transformée du cercle par ', name]);
  legend('Cercle C', ['Image ', name, '(C)'], '\lambda_1 \epsilon_1', '\lambda_2 \epsilon_2', 'Location', 'northeastoutside');
  
  hold off;

  verif = P' * P;
  disp(['Vérification orthonormalité pour ', name, ' (P^T * P) :']);
  disp(verif);
endfunction

plot_CE(Circle, A, "f (Matrice A)", 1);
plot_CE(Circle, B, "g (Matrice B)", 2);
plot_CE(Circle, C, "h (Matrice C)", 3);


