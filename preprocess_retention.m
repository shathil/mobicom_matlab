function A = preprocess_retention(M,d,last)
a_interval = d/length(M);
A(1,:) = a_interval:a_interval:d;
A(2,:) = 1+(M(1,2)-M(:,2))/((M(end,2)-M(1,2))/(1-last/100));
curmax=-1;
for i=1:length(A)
    if curmax == -1 || A(2,i)<curmax
        curmax = A(2,i);
    else
        A(2,i) = curmax;
    end;
end;
