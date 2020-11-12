
function plot4(SVM)

for i = 1:4
    
    swa_beta_accuracy_FT(i) = mean(SVM(i).SWA_beta_fron_temp);
    
     swa_r_accuracy_FT(i) = mean(SVM(i).SWA_r_fron_temp);
    
    
end

addpath \\mycloudpr4100\Ivan\single_unit\human\wcst\violin
figure;violin([swa_beta_accuracy_FT' swa_r_accuracy_FT']);
xticks([1 2]);xticklabels({'?','r'});xline(0.5);
yticks([0.4 0.5 1]);yticklabels({'0.4','chance level','1'});yline(0.5);
ylim([0.4 1]);title('Frontal - Temporal');b = gca; legend(b,'off');


for i = 1:4
    
    swa_beta_accuracy_AT(i) = mean(SVM(i).SWA_beta_amy_temp);
    
     swa_r_accuracy_AT(i) = mean(SVM(i).SWA_r_amy_temp);
    
    
end


figure;violin([swa_beta_accuracy_AT' swa_r_accuracy_AT']);
xticks([1 2]);xticklabels({'?','r'});xline(0.5);
yticks([0.4 0.5 1]);yticklabels({'0.4','chance level','1'});yline(0.5);
ylim([0.4 1]);title('Amygdala - Temporal');b = gca; legend(b,'off');




figure;violin([swa_beta_accuracy_FT' swa_beta_accuracy_AT']);
xticks([1 2]);xticklabels({'Fron-Temp','Amy-Temp'});xline(0.5);
yticks([0.4 0.5 1]);yticklabels({'0.4','chance level','1'});yline(0.5);
ylim([0.4 1]);b = gca; legend(b,'off');




for i = 1:4
    
    swa_swr_beta_accuracy_FT(i) = mean(SVM(i).SWA_SWR_beta_fron_temp);
    
    swr_beta_accuracy_FT(i) = mean(SVM(i).SWR_beta_fron_temp);
    
    
end


figure;violin([swa_beta_accuracy_FT' swa_swr_beta_accuracy_FT' swr_beta_accuracy_FT']);
xticks([1 2 3]);xticklabels({'SWA phase difference','Combined','SWR amplitude'});xline(0.5);
yticks([0.4 0.5 1]);yticklabels({'0.4','chance level','1'});yline(0.5);
ylim([0.4 1]);b = gca; legend(b,'off');



for i = 1:4
    
    swa_swr_beta_accuracy_FT = SVM(i).SWA_SWR_beta_fron_temp;
    
    swr_beta_accuracy_FT = SVM(i).SWR_beta_fron_temp;
    
    
    swa_beta_accuracy_FT = SVM(i).SWA_beta_fron_temp;
    
    figure;violin([swa_beta_accuracy_FT swa_swr_beta_accuracy_FT swr_beta_accuracy_FT]);
xticks([1 2 3]);xticklabels({'SWA phase difference','Combined','SWR amplitude'});xline(0.5);
yticks([0.4 0.5 1]);yticklabels({'0.4','chance level','1'});yline(0.5);
ylim([0.4 1]);b = gca; legend(b,'off');title(sprintf('Subject %d',i));
    
end




