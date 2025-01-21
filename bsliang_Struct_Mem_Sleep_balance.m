% Script to balance stimuli for the Structural Memory and Sleep Project
clear all; close all; clc
rms0=0.35;
target_fs = 44100;

file_dir=fullfile('..','3_audacity_adjustpitch');
output_dir = fullfile('..','4_matlab_rms');
if ~exist(output_dir, 'dir')
    mkdir(output_dir);
end

wav_files = dir(fullfile(file_dir, '*.wav'));
for k = 1:length(wav_files)
    % read dara
    input_file = fullfile(wav_files(k).folder, wav_files(k).name);
    [y, fs] = audioread(input_file);
    % re-sample
    if fs ~= target_fs
        y = resample(y, target_fs, fs);
        rs_ext = '_rs';
    else
        rs_ext = [];
    end
    % adjust amplitude to a specific RMS
    y_rms=bsliang_balanceRMS_rmblank(y,rms0);
    % test
    max_val=max(abs(y_rms)); % should not be higher than 1
    disp(['Max absolute amplitude: ',num2str(max_val)])
    if max_val>=1
        error('Larger than 1 amplitude. Should reduce rms0');
    end
    disp(strjoin(["Tested RMS without gap: ", num2str(bsliang_rmbrms(y_rms))]));
    % save
    [~, name, ext] = fileparts(wav_files(k).name);
    new_name = [name, '_rms', num2str(rms0), rs_ext, ext];
    output_file = fullfile(output_dir, new_name);
    audiowrite(output_file, y_rms, target_fs);
end