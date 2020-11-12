


function plot2c(mod_class)

subj_ind=[mod_class(:).subj_ind];


for i = 1:12
    
    curr_subj_ind=find(subj_ind==i);
    
    curr_mod_class=[mod_class(curr_subj_ind).mod_class];
    
    down_perc(i)=numel(find(curr_mod_class==-1))/numel(curr_mod_class);
    
    up_perc(i)=numel(find(curr_mod_class==1))/numel(curr_mod_class);
   
    mix_perc(i)=numel(find(curr_mod_class==10))/numel(curr_mod_class);
    
    
end



down_perc_mean = mean(down_perc);
mix_perc_mean = mean(mix_perc);
up_perc_mean = mean(up_perc);

down_perc_sem = std(down_perc)/sqrt(numel(down_perc));
mix_perc_sem = mean(mix_perc)/sqrt(numel(mix_perc));
up_perc_sem = mean(up_perc)/sqrt(numel(up_perc));



figure;

nan_ind  = find(isnan(up_perc)==1); up_perc(nan_ind)=[];
nan_ind  = find(isnan(mix_perc)==1); mix_perc(nan_ind)=[];
nan_ind  = find(isnan(down_perc)==1); down_perc(nan_ind)=[];

means=[mean(up_perc) mean(mix_perc) mean(down_perc)];
sems=[std(up_perc)/sqrt(numel(up_perc)) std(mix_perc)/sqrt(numel(mix_perc)) std(mix_perc)/sqrt(numel(down_perc))];


bar(1, means(1),0.4,'FaceColor',[0.85 0.33 0.1])
hold on
bar(2,means(2),0.4,'FaceColor',[0.93 0.69 0.13]);bar(3,means(3),0.4,'FaceColor',[0, 0.45, 0.74]);
 errorbar(means,sems,'k','LineWidth',3,'LineStyle','none');xlim([0.5 3.5]);title('Overall');
ylim([0 0.5]);
yticks([0 0.2 0.4]); yticklabels({'0','0.2','0.4'});
ylabel('Proportion')
xticks([1 2 3]); xticklabels({'pos','mix','neg'});xlabel('mod class')




amy_count=1; temp_count=1; fron_count=1;
for i = 1:numel(mod_class)
    
    if strcmp(mod_class(i).roi,'amy ')==1
        amy_ind(amy_count)=i;amy_count=amy_count+1;
        
    elseif strcmp(mod_class(i).roi,'temp')==1
        temp_ind(temp_count)=i;temp_count=temp_count+1;
        
    elseif strcmp(mod_class(i).roi,'fron')==1
        fron_ind(fron_count)=i;fron_count=fron_count+1;
        
          end
          
  end


all_subj_block_amy=mod_class(amy_ind);

all_subj_block_temp=mod_class(temp_ind);

all_subj_block_fron=mod_class(fron_ind);


%%%%

subj_ind_amy=[all_subj_block_amy(:).subj_ind];


for i = 1:12
    
    curr_subj_ind_amy=find(subj_ind_amy==i);
    
    curr_mod_class_amy=[all_subj_block_amy(curr_subj_ind_amy).mod_class];
    
    down_perc_amy(i)=numel(find(curr_mod_class_amy==-1))/numel(curr_mod_class_amy);
    
    up_perc_amy(i)=numel(find(curr_mod_class_amy==1))/numel(curr_mod_class_amy);
   
    mix_perc_amy(i)=numel(find(curr_mod_class_amy==10))/numel(curr_mod_class_amy);
    
    
end


%%%%

subj_ind_temp=[all_subj_block_temp(:).subj_ind];


for i = 1:12
    
    curr_subj_ind_temp=find(subj_ind_temp==i);
    
    curr_mod_class_temp=[all_subj_block_temp(curr_subj_ind_temp).mod_class];
    
    down_perc_temp(i)=numel(find(curr_mod_class_temp==-1))/numel(curr_mod_class_temp);
    
    up_perc_temp(i)=numel(find(curr_mod_class_temp==1))/numel(curr_mod_class_temp);
   
    mix_perc_temp(i)=numel(find(curr_mod_class_temp==10))/numel(curr_mod_class_temp);
    
    
end




%%%

subj_ind_fron=[all_subj_block_fron(:).subj_ind];


for i = 1:12
    
    curr_subj_ind_fron=find(subj_ind_fron==i);
    
    curr_mod_class_fron=[all_subj_block_fron(curr_subj_ind_fron).mod_class];
    
    down_perc_fron(i)=numel(find(curr_mod_class_fron==-1))/numel(curr_mod_class_fron);
    
    up_perc_fron(i)=numel(find(curr_mod_class_fron==1))/numel(curr_mod_class_fron);
   
    mix_perc_fron(i)=numel(find(curr_mod_class_fron==10))/numel(curr_mod_class_fron);
    
    
end


figure;subplot(1,3,1)

nan_ind  = find(isnan(up_perc_amy)==1); up_perc_amy(nan_ind)=[];
nan_ind  = find(isnan(mix_perc_amy)==1); mix_perc_amy(nan_ind)=[];
nan_ind  = find(isnan(down_perc_amy)==1); down_perc_amy(nan_ind)=[];
means=[mean(up_perc_amy) mean(mix_perc_amy)];
sems=[std(up_perc_amy)/sqrt(numel(up_perc_amy)) std(mix_perc_amy)/sqrt(numel(mix_perc_amy))];

bar(1, means(1),0.4,'FaceColor',[0.85 0.33 0.1])
hold on
bar(2,means(2),0.4,'FaceColor',[0.93 0.69 0.13]);%bar(3,means(3),0.4,'FaceColor',[0, 0.45, 0.74]);
 errorbar(means,sems,'k','LineWidth',3,'LineStyle','none');xlim([0.5 3.5]);title('Amygdala');
ylim([0 0.5]);
yticks([0 0.2 0.4]); yticklabels({'0','0.2','0.4'});
ylabel('Proportion')
xticks([1 2 3]); xticklabels({'pos','mix','neg'});xlabel('mod class')



subplot(1,3,2)
nan_ind  = find(isnan(up_perc_temp)==1); up_perc_temp(nan_ind)=[];
nan_ind  = find(isnan(mix_perc_temp)==1); mix_perc_temp(nan_ind)=[];
nan_ind  = find(isnan(down_perc_temp)==1); down_perc_temp(nan_ind)=[];
means=[mean(up_perc_temp) mean(mix_perc_temp) mean(down_perc_temp)];
sems=[std(up_perc_temp)/sqrt(numel(up_perc_temp)) std(mix_perc_temp)/sqrt(numel(mix_perc_temp)) std(mix_perc_temp)/sqrt(numel(down_perc_temp))];
bar(1, means(1),0.4,'FaceColor',[0.85 0.33 0.1])
hold on
bar(2,means(2),0.4,'FaceColor',[0.93 0.69 0.13]);bar(3,means(3),0.4,'FaceColor',[0, 0.45, 0.74]);
 errorbar(means,sems,'k','LineWidth',3,'LineStyle','none');xlim([0.5 3.5]);title('Temporal');
ylim([0 0.5]);
yticks([0 0.2 0.4]); yticklabels({'0','0.2','0.4'});
ylabel('Proportion')
xticks([1 2 3]); xticklabels({'pos','mix','neg'});xlabel('mod class')



subplot(1,3,3)
nan_ind  = find(isnan(up_perc_fron)==1); up_perc_fron(nan_ind)=[];
nan_ind  = find(isnan(mix_perc_fron)==1); mix_perc_fron(nan_ind)=[];
nan_ind  = find(isnan(down_perc_fron)==1); down_perc_fron(nan_ind)=[];
means=[mean(up_perc_fron) mean(mix_perc_fron) mean(down_perc_fron)];
sems=[std(up_perc_fron)/sqrt(numel(up_perc_fron)) std(mix_perc_fron)/sqrt(numel(mix_perc_fron)) std(mix_perc_fron)/sqrt(numel(down_perc_fron))];
bar(1, means(1),0.4,'FaceColor',[0.85 0.33 0.1])
hold on
bar(2,means(2),0.4,'FaceColor',[0.93 0.69 0.13]);bar(3,means(3),0.4,'FaceColor',[0, 0.45, 0.74]);
 errorbar(means,sems,'k','LineWidth',3,'LineStyle','none');xlim([0.5 3.5]);title('Frontal');
ylim([0 0.2]);
yticks([0 0.2]); yticklabels({'0','0.2'});
ylabel('Proportion')
xticks([1 2 3]); xticklabels({'pos','mix','neg'});xlabel('mod class')





