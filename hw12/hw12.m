I = eye(10);
D = zeros(10,10);

for i =  1:10
    for j = 1:10
        D(i,j) = sin(i+j); 
    end
end

A = D + I;
b = [-2,-6,-9,1,8,10,1,-9,-4,-3];
S = 3;

nrm = A./sum(A.^2);

r = b';

[x]=OMP(S,b,nrm);
