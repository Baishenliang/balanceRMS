function soundout=bsliang_balanceRMS_rmblank(sound_temp,rms0)
    %% grossly changing amplitude to avoid errors
    rbmrms_s=bsliang_rmbrms(sound_temp);
    if rbmrms_s<0.5
        while bsliang_rmbrms(sound_temp)<0.5
            sound_temp=sound_temp*1.1;
        end
    elseif rbmrms_s>0.5
        while bsliang_rmbrms(sound_temp)>0.5
            sound_temp=sound_temp*0.9;
        end
    end
    %% getting sound with rms adjusted
    bsliang = @(k)(bsliang_rmbrms(k*sound_temp)-rms0);
    options = optimset('TolX',0.00000000000000000001);
    k=fzero(bsliang,[0.01 1],options);
    soundout=k*sound_temp;