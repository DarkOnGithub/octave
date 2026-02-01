load Ex1.mat;

n = 100;
t = linspace(0, 2 * pi, n);
u = [cos(t); sin(t)];

function retval = phi_M(M, vec)
  retval = vec' * M * vec;
endfunction

function retval = create_space (M, u, n)
  retval = zeros(1, n);
  for i = 1:n
      vec = u(:, i);
      retval(i) = phi_M(M, vec);
  endfor
endfunction

function plot_space(t, space, name, fignum)
  figure(fignum);
  clf;
  plot(t, space, 'b', 'LineWidth', 2);
  title(['Graphe de \phi_{', name, '}(u(t), u(t))']);
  xlabel('t');
  ylabel('\phi(u, u)');
  
endfunction

space_a = create_space(A, u, n);
space_b = create_space(B, u, n);
space_c = create_space(C, u, n);

plot_space(t, space_a, "A", 1);
plot_space(t, space_b, "B", 2);
plot_space(t, space_c, "C", 3);

[Pa, Da] = eigs(A);
[Pb, Db] = eigs(B);
[Pc, Dc] = eigs(C);

disp("Valeurs propres de A :");
disp(diag(Da));
disp("Valeurs propres de B :");
disp(diag(Db));
disp("Valeurs propres de C :");
disp(diag(Dc));
