function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

h = sigmoid(X*theta);
shifted_theta = theta(2:size(theta));
theta_reg = [0;shifted_theta]; % add theta0 to the feature vector

J = ((1/m) * (-y' * log(h) - (1 - y)' * log(1 - h)));
J = J + (lambda/(2*m)) * theta_reg' * theta_reg;

grad(1) = (1/m) * (X(:,1))' * (h - y);
grad(2:size(grad)) = ((1/m) * (X(:,[2:end]))' * (h - y)) + (lambda/m)*shifted_theta;


% =============================================================

end
