

function plot3a_jpsth(hf_swa_jpsth)


subj_ind = [hf_swa_jpsth(:).dataset];
for i = 1:12
curr_subj_ind = find(subj_ind==i);
curr_reg_ripple=hf_swa_jpsth(curr_subj_ind);
curr_HF_sig=[curr_reg_ripple(:).HF_sig];
curr_SO_sig=[curr_reg_ripple(:).SO_sig];

HF_sig_ind=find(curr_HF_sig==1);
SO_sig_ind=find(curr_SO_sig==1);

HF_nsig_ind=find(curr_HF_sig==0);
SO_nsig_ind=find(curr_SO_sig==0);

%figure;
if isempty(SO_sig_ind)==0
for ii = 1:numel(SO_sig_ind)
so_jpsth_hf_sig(:,:,ii) = curr_reg_ripple(SO_sig_ind(ii)).hf_delta;
end

so_jpsth_hf_sig_mean(:,:,i) = mean(so_jpsth_hf_sig,3);
clear so_jpsth_hf_sig;
else
so_jpsth_hf_sig_mean(:,:,i) = NaN;
end
if isempty(SO_nsig_ind)==0
for ii = 1:numel(SO_nsig_ind)
so_jpsth_hf_nsig(:,:,ii) = curr_reg_ripple(SO_nsig_ind(ii)).hf_delta;
end
so_jpsth_hf_nsig_mean(:,:,i) = mean(so_jpsth_hf_nsig,3);
clear so_jpsth_hf_nsig;
else
so_jpsth_hf_nsig_mean(:,:,i) = NaN;
end
end


nan_ind = find(isnan(so_jpsth_hf_sig_mean(1,1,:))==1);
so_jpsth_hf_sig_mean(:,:,nan_ind)=[];

so_jpsth_hf_sig_grandavg = mean(so_jpsth_hf_sig_mean,3);



nan_ind = find(isnan(so_jpsth_hf_nsig_mean(1,1,:))==1);
so_jpsth_hf_nsig_mean(:,:,nan_ind)=[];

so_jpsth_hf_nsig_grandavg = mean(so_jpsth_hf_nsig_mean,3);

min_min = min([so_jpsth_hf_sig_grandavg(:); so_jpsth_hf_nsig_grandavg(:)]);

max_max = max([so_jpsth_hf_sig_grandavg(:); so_jpsth_hf_nsig_grandavg(:)]);

figure;
subplot(2,1,1);imagesc(so_jpsth_hf_sig_grandavg(21:60,21:60));colormap('jet');caxis([-0.05 0.7]);
xticks([0.5 20 39.5]);xticklabels({'-500','0','500'});
yticks([0.5 20 39.5]);yticklabels({'500','0','-500'});
caxis([min_min max_max]);colorbar
ylabel('time (msec)');

line([40.5,0],[0,40.5],'Color','white','LineStyle','--','LineWidth',2);
subplot(2,1,2);imagesc(so_jpsth_hf_nsig_grandavg(21:60,21:60));colormap('jet');caxis([-0.05 0.7]);
xticks([0.5 20 39.5]);xticklabels({'-500','0','500'});
yticks([0.5 20 39.5]);yticklabels({'500','0','-500'});
caxis([min_min max_max]);colorbar


line([40.5,0],[0,40.5],'Color','white','LineStyle','--','LineWidth',2);
xlabel('time (msec)');ylabel('time (msec)');
