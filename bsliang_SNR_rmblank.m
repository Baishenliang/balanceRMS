function noiseout=bsliang_SNR_rmblank(signal,noise,SNR)
%  这个是主程序
    %% grossly changing amplitude to avoid errors
    rbmrms_s=bsliang_rmbrms(noise);
    if rbmrms_s<0.2689
        while bsliang_rmbrms(noise)<0.2689
            noise=noise*1.1;
        end
    elseif rbmrms_s>0.2689
        while bsliang_rmbrms(noise)>0.2689
            noise=noise*0.9;
        end
    end
    
    bsliang = @(k)(10*log10((bsliang_rmbrms(signal)/bsliang_rmbrms(k*noise))^2))-SNR;
    options = optimset('TolX',0.00000000000000001);
    k=fzero(bsliang,[0.001 1000],options);
    noiseout=k*noise;