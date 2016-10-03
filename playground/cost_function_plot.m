x_data = [0 1 2 3 4];
y_data = [4 7 7 8 9];

theta0 = 4.5;
theta1 = 0.9999;

% ----------------------------
h = @(x) theta0 + theta1 .* x;

scatter(x_data, y_data)
hold
grid()

linex = 0:0.01:5;
liney = theta0 + theta1 * linex;

plot(linex, liney)
xlim([0 (x_data(end) + 2)])
ylim([0 (y_data(end) + 2)])

m = size(x_data);

% ----------------------------
cost = 1/(2*m(2)) * sum((h(x_data) - y_data).^2);

fprintf('Cost is: %s\n', cost)
xlabel(['Cost: ' num2str(cost)])