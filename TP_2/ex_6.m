P1 = [2, 4];
A1 = 145;

P2 = [4, 3];
A2 = 0;

P3 = [2.5, 2];
A3 = -95;

t1 = A1 * pi / 180;
t2 = A2 * pi / 180;
t3 = A3 * pi / 180;

M = [-sin(t1), cos(t1);
     -sin(t2), cos(t2);
     -sin(t3), cos(t3)];

C = [-sin(t1)*P1(1) + cos(t1)*P1(2);
     -sin(t2)*P2(1) + cos(t2)*P2(2);
     -sin(t3)*P3(1) + cos(t3)*P3(2)];

function plot_lighthouse(P, t, col, label, k_range)
     p1 = [P(1) + k_range(1)*cos(t), P(2) + k_range(1)*sin(t)];
     p2 = [P(1) + k_range(2)*cos(t), P(2) + k_range(2)*sin(t)];
     plot([p1(1) p2(1)], [p1(2) p2(2)], col, 'LineWidth', 1.5, 'DisplayName', ['Ligne de visée ' label]);
     plot(P(1), P(2), [col 'o'], 'MarkerSize', 10, 'MarkerFaceColor', col, 'DisplayName', label);
 end

nav_pos = M \ C;

fprintf('Estimation de la position du navire :\n');
fprintf('x = %.4f\n', nav_pos(1));
fprintf('y = %.4f\n', nav_pos(2));


hold on; grid on;

k_range = [-4, 1];

plot_lighthouse(P1, t1, 'r', 'Phare 1', k_range);
plot_lighthouse(P2, t2, 'g', 'Phare 2', k_range);
plot_lighthouse(P3, t3, 'b', 'Phare 3', k_range);

plot(nav_pos(1), nav_pos(2), 'mp', 'MarkerSize', 12, 'MarkerFaceColor', 'm', 'DisplayName', 'Navire');

xlabel('x'); ylabel('y');
title('Localisation du navire');
legend('Location', 'northeastoutside');
axis equal;
grid on;



