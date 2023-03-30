function rmbrms=bsliang_rmbrms(A)
    %rmbrms: removed blank root mean square
    [i,~]=find(A>max(A)/100);
    len=length(i);
    E1=(A.'*A)/len;
    rmbrms=sqrt(E1);