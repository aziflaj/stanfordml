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

h = sigmoid(X * theta);
hot_y = y .* log(h);
not_y = (1 - y) .* log(1 - h);
reg = sum(theta(2:end) .^ 2) * lambda / (2 * m);
J = (-(sum(hot_y + not_y)) / m) + reg;

grad = (X' * (h - y)) / m + (lambda * theta)/ m;
grad(1) = (X'(1,:) * (h - y)) / m;

% =============================================================

end
