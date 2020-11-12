


dataset = [mod_class(:).subj_ind];

for z = 1:12
    
    curr_subj_ind = find(dataset==z);
    all_subj_block_master_copy_subj = mod_class(curr_subj_ind);
    
curr_mod_class = [all_subj_block_master_copy_subj(:).mod_class];
up_ind = find(curr_mod_class==1);
down_ind = find(curr_mod_class==-1);
mix_ind = find(curr_mod_class==10);
for i = 1:numel(up_ind);up_trial_mean(i,:) = all_subj_block_master_copy_subj(up_ind(i)).trial_mean;end
for i = 1:numel(down_ind);down_trial_mean(i,:) = all_subj_block_master_copy_subj(down_ind(i)).trial_mean;end
for i = 1:numel(mix_ind);mix_trial_mean(i,:) = all_subj_block_master_copy_subj(mix_ind(i)).trial_mean;end




if exist('up_trial_mean')==1



for i = 1:size(up_trial_mean,1)
    
    curr_ch = up_trial_mean(i,1001:2500);
    
    start_ind = 1; end_ind = 50;
    
    for j = 1:(numel(curr_ch)/50)
    
    
    curr_ch_bin(j) = mean(curr_ch(start_ind:end_ind));
    
    
    start_ind = start_ind + 50; end_ind = end_ind + 50;
    
    
    
    end
    
    up_mod_bin_z(i,:) = zscore(curr_ch_bin);
    
    
end


if size(up_mod_bin_z,1)>1
    up_mod_bin_z_mean = mean(up_mod_bin_z);
    up_mod_bin_z_sem = std(up_mod_bin_z)/sqrt(size(up_mod_bin_z,1));
    
else
 up_mod_bin_z_mean = up_mod_bin_z;
    up_mod_bin_z_sem = zeros(1,numel(up_mod_bin_z));
end


mod_avg_class_all_subj(z).up_mod_bin_z_mean = up_mod_bin_z_mean; clear up_mod_bin_z_mean; 
mod_avg_class_all_subj(z).up_mod_bin_z_sem = up_mod_bin_z_sem; clear up_mod_bin_z_sem; 
mod_avg_class_all_subj(z).up_trial_mean = up_trial_mean; clear up_trial_mean; 
clear up_mod_bin_z curr_ch_bin;

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if exist('down_trial_mean')==1

for i = 1:size(down_trial_mean,1)
    
    curr_ch = down_trial_mean(i,1001:2500);
    
    start_ind = 1; end_ind = 50;
    
    for j = 1:(numel(curr_ch)/50)
    
    
    curr_ch_bin(j) = mean(curr_ch(start_ind:end_ind));
    
    
    start_ind = start_ind + 50; end_ind = end_ind + 50;
    
    
    
    end
    
    down_mod_bin_z(i,:) = zscore(curr_ch_bin);
    
    
end


if size(down_mod_bin_z,1)>1
    down_mod_bin_z_mean = mean(down_mod_bin_z);
    down_mod_bin_z_sem = std(down_mod_bin_z)/sqrt(size(down_mod_bin_z,1));
    
else
 down_mod_bin_z_mean = down_mod_bin_z;
    down_mod_bin_z_sem = zeros(1,numel(down_mod_bin_z));
end


mod_avg_class_all_subj(z).down_mod_bin_z_mean = down_mod_bin_z_mean; clear down_mod_bin_z_mean; 
mod_avg_class_all_subj(z).down_mod_bin_z_sem = down_mod_bin_z_sem; clear down_mod_bin_z_sem; 
mod_avg_class_all_subj(z).down_trial_mean = down_trial_mean; clear down_trial_mean; 
clear down_mod_bin_z curr_ch_bin;

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


if exist('mix_trial_mean')==1
for i = 1:size(mix_trial_mean,1)
    
    curr_ch = mix_trial_mean(i,1001:2500);
    
    start_ind = 1; end_ind = 50;
    
    for j = 1:(numel(curr_ch)/50)
    
    
    curr_ch_bin(j) = mean(curr_ch(start_ind:end_ind));
    
    
    start_ind = start_ind + 50; end_ind = end_ind + 50;
    
    
    
    end
    
    mix_mod_bin_z(i,:) = zscore(curr_ch_bin);
    
    
end



if size(mix_mod_bin_z,1)>1
    mix_mod_bin_z_mean = mean(mix_mod_bin_z);
    mix_mod_bin_z_sem = std(mix_mod_bin_z)/sqrt(size(mix_mod_bin_z,1));
    
else
 mix_mod_bin_z_mean = mix_mod_bin_z;
    mix_mod_bin_z_sem = zeros(1,numel(mix_mod_bin_z));
end

mod_avg_class_all_subj(z).mix_mod_bin_z_mean = mix_mod_bin_z_mean; clear mix_mod_bin_z_mean; 
mod_avg_class_all_subj(z).mix_mod_bin_z_sem = mix_mod_bin_z_sem; clear mix_mod_bin_z_sem; 
mod_avg_class_all_subj(z).mix_trial_mean = mix_trial_mean; clear mix_trial_mean; 
clear mix_mod_bin_z curr_ch_bin;

end

end


upmod_count=1; mixmod_count=1; downmod_count=1;

for i = 1:numel(mod_avg_class_all_subj)
    
    
    if isempty(mod_avg_class_all_subj(i).up_mod_bin_z_mean)==0
        
 upmod(upmod_count,:) = mod_avg_class_all_subj(i).up_mod_bin_z_mean;
 
upmod_count=upmod_count+1;

    end

 if isempty(mod_avg_class_all_subj(i).mix_mod_bin_z_mean)==0
        
 mixmod(mixmod_count,:) = mod_avg_class_all_subj(i).mix_mod_bin_z_mean;
 
mixmod_count=mixmod_count+1;

 end
    
  if isempty(mod_avg_class_all_subj(i).down_mod_bin_z_mean)==0
        
 downmod(downmod_count,:) = mod_avg_class_all_subj(i).down_mod_bin_z_mean;
 
downmod_count=downmod_count+1;

    end
 
 
end


upmod_mean = mean(upmod); upmod_sem = std(upmod)/sqrt(size(upmod,1));
mixmod_mean = mean(mixmod); mixmod_sem = std(mixmod)/sqrt(size(mixmod,1));
downmod_mean = mean(downmod); downmod_sem = std(downmod)/sqrt(size(downmod,1));

figure;subplot(3,1,1);shadedErrorBar([1:30],upmod_mean,upmod_sem,{'markerfacecolor',[0.85 0.33 0.1]})
xlim([1 30]);yline(0,'LineWidth',1);xline(10,'LineWidth',1);xline(20,'k--','LineWidth',1);
yticks(0);yticklabels({'0'}); xticks([1 10 20 30]);%xticklabels({'-500','-250','0','250'});


subplot(3,1,2);shadedErrorBar([1:30],mixmod_mean,mixmod_sem,{'markerfacecolor',[0.93 0.69 0.13]})
xlim([1 30]);yline(0,'LineWidth',1);xline(10,'LineWidth',1);xline(20,'k--','LineWidth',1);
yticks(0);yticklabels({'0'}); xticks([1 10 20 30]);%xticklabels({'-500','-250','0','250'});



subplot(3,1,3);shadedErrorBar([1:30],downmod_mean, downmod_sem,{'markerfacecolor',[0, 0.45, 0.74]})
xlim([1 30]);yline(0,'LineWidth',1);xline(10,'LineWidth',1);xline(20,'k--','LineWidth',1);
yticks(0);yticklabels({'0'}); xticks([1 10 20 30]);xticklabels({'-500','-250','0','250'});
xlabel('Time (msec)');


