A = [1, -1; 2, 1; 1, 1];
U = [3; 2; -1];
e1 = A(:,1);
e2 = A(:,2);

X = A \ U;
pf_u = A * X;

erreur = U - pf_u;

fprintf('\n=== Vérification de l''orthogonalité ===\n');

dot_prod1 = dot(erreur, pf_u);
fprintf('(u - Pf(u)) · Pf(u) = %.2e (should be ~0)\n', dot_prod1);

dot_e1 = dot(erreur, e1);
dot_e2 = dot(erreur, e2);
fprintf('(u - Pf(u)) · e1 = %.2e (should be ~0)\n', dot_e1);
fprintf('(u - Pf(u)) · e2 = %.2e (should be ~0)\n', dot_e2);

[a, b] = meshgrid(-2:0.5:3, -3:0.5:2);
PX = a*e1(1) + b*e2(1);
PY = a*e1(2) + b*e2(2);
PZ = a*e1(3) + b*e2(3);

figure('Color', 'w'); hold on; grid on;

mesh(PX, PY, PZ, 'FaceAlpha', 0.1, 'EdgeColor', [0.7 0.7 0.7], 'FaceColor', 'none');

quiver3(0,0,0, e1(1), e1(2), e1(3), 0, 'b', 'LineWidth', 2);
quiver3(0,0,0, e2(1), e2(2), e2(3), 0, 'g', 'LineWidth', 2);

plot3(U(1), U(2), U(3), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
plot3(pf_u(1), pf_u(2), pf_u(3), 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');
plot3([U(1) pf_u(1)], [U(2) pf_u(2)], [U(3) pf_u(3)], 'k--', 'LineWidth', 2);

offset = 0.5;
text(0.1, 0, 0, 'O', 'FontSize', 12, 'FontWeight', 'bold');
text(e1(1)+offset, e1(2), e1(3), 'e_1', 'Color', 'b', 'FontSize', 12);
text(e2(1), e2(2)+offset, e2(3), 'e_2', 'Color', 'g', 'FontSize', 12);
text(U(1)+offset, U(2), U(3), 'u', 'Color', 'r', 'FontSize', 12);
text(pf_u(1)+offset, pf_u(2), pf_u(3), 'P_F(u)', 'Color', 'k', 'FontSize', 12);
xlabel('X'); ylabel('Y'); zlabel('Z');
axis equal;
title(sprintf('Projection orthogonale (erreur·Pf(u) = %.2e)', dot_prod1));
