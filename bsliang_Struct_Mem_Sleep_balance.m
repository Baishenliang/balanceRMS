% Script to balance stimuli for the Structural Memory and Sleep Project
rms0=0.3;
%% Tone 500ms
cd('D:\bsliang_Coganlabcode\Retrocue_taskscripts\stim')
[y_tone, Fs] = audioread('tone500_3.wav');
y_tone_rms=bsliang_balanceRMS_rmblank(y_tone,0.2);
bsliang_rmbrms(y_tone_rms)
audiowrite('tone500_3.wav', y_tone_rms, Fs);

%% Human sound
cd('C:\Users\bl314\Box\CoganLab\IndividualMeetings\Baishen\Retro_stimuli_recorded\extrated_syllables\selected_syllables\')

[y_ga, Fs] = audioread('ga02_selected_cropped.wav');
ga_human_rms=bsliang_balanceRMS_rmblank(y_ga,rms0);
bsliang_rmbrms(ga_human_rms)
audiowrite('ga_human_rms.wav', ga_human_rms, Fs);

[y_mo, ~] = audioread('mo3_selected_cropped.wav');
mo_human_rms=bsliang_balanceRMS_rmblank(y_mo,rms0);
bsliang_rmbrms(mo_human_rms)
audiowrite('mo_human_rms.wav', mo_human_rms, Fs);

[y_ree, ~] = audioread('ree12_selected_cropped.wav');
ree_human_rms=bsliang_balanceRMS_rmblank(y_ree,rms0);
bsliang_rmbrms(ree_human_rms)
audiowrite('ree_human_rms.wav', ree_human_rms, Fs);

%% Human sound: Evan
cd('C:\Users\bl314\Box\CoganLab\IndividualMeetings\Baishen\Retro_stimuli_recorded\Evan\cut_syllables\selected\')

[y_ga, Fs] = audioread('ga08_selected_cut_580ms.wav');
ga_human_rms=bsliang_balanceRMS_rmblank(y_ga,rms0);
bsliang_rmbrms(ga_human_rms)
audiowrite('ga_human_rms.wav', ga_human_rms, Fs);

[y_mo, ~] = audioread('mo11_selected_cut_680ms.wav');
mo_human_rms=bsliang_balanceRMS_rmblank(y_mo,rms0);
bsliang_rmbrms(mo_human_rms)
audiowrite('mo_human_rms.wav', mo_human_rms, Fs);

[y_ree, ~] = audioread('ree14_selected_cut_620ms.wav');
ree_human_rms=bsliang_balanceRMS_rmblank(y_ree,rms0);
bsliang_rmbrms(ree_human_rms)
audiowrite('ree_human_rms.wav', ree_human_rms, Fs);


%% gTTS
cd('C:\Users\bl314\Box\CoganLab\IndividualMeetings\Baishen\meetings\retrocue_task_stim_trial_final\gTTS')

% Updated 20250117: note that the script originally read sound files
% ga.wav, mo.wav, and ree.wav. But I then used the cut files that have been
% used for two patients. They are download from the github repository
% https://github.com/coganlab/Retrocue/tree/main/stim (version:
% 6692123854c89c9486ed2f2fbc3099547533ba9c) (be0ed7a). The files names were
% originally ga_gTTS_rms.wav, I added 01_cut here.
% Use these sounds to updated the intensity as they are cut.

%[y_ga, Fs] = audioread('ga.wav');
[y_ga, Fs] = audioread('ga_gTTS_rms01_cut.wav');
ga_gTTS_rms=bsliang_balanceRMS_rmblank(y_ga,rms0);
max(abs(ga_gTTS_rms)) % should not be higher than 1
bsliang_rmbrms(ga_gTTS_rms)
audiowrite('ga_gTTS_rms.wav', ga_gTTS_rms, Fs);

%[y_mo, ~] = audioread('mo.wav');
[y_mo, Fs] = audioread('mo_gTTS_rms01_cut.wav');
mo_gTTS_rms=bsliang_balanceRMS_rmblank(y_mo,rms0);
max(abs(mo_gTTS_rms)) % should not be higher than 1
bsliang_rmbrms(mo_gTTS_rms)
audiowrite('mo_gTTS_rms.wav', mo_gTTS_rms, Fs);

%[y_ree, ~] = audioread('ree.wav');
[y_ree, Fs] = audioread('ree_gTTS_rms01_cut.wav');
re_gTTS_rms=bsliang_balanceRMS_rmblank(y_ree,rms0);
max(abs(re_gTTS_rms)) % should not be higher than 1
bsliang_rmbrms(re_gTTS_rms)
audiowrite('ree_gTTS_rms.wav', re_gTTS_rms, Fs);
