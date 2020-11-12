

ipsi_contra = [mod_class(:).ipsi_contra];

ipsi_ind = find(ipsi_contra == 'I');
contra_ind = find(ipsi_contra == 'C');

curr_mod_class = [mod_class(:).mod_class];

mod_class_ipsi = curr_mod_class(ipsi_ind);
mod_class_contra = curr_mod_class(contra_ind);



all_subj_block_ipsi = mod_class(ipsi_ind);


all_subj_block_contra = mod_class(contra_ind);




% 
% 
% for i = 1:numel(all_subj_block)
% curr_ch = all_subj_block(i).label_str;curr_subj = all_subj_block(i).subj_ID;
% curr_elecpos = all_subj_block(i).elecpos{1};
% for j = i:numel(all_subj_block)
% curr_ch2 = all_subj_block(j).label_str;curr_subj2 = all_subj_block(j).subj_ID;
% if strcmp(curr_ch,curr_ch2)==1 & strcmp(curr_subj,curr_subj2)==1
% all_subj_block(i).elecpos_resh = curr_elecpos + rand(1)*4;
% end
% end
% end
% 
% 
for i = 1:numel(all_subj_block_ipsi)
    
    if isempty(all_subj_block_ipsi(i).elecpos_resh)==0
    
    
    elecpos_resh_ipsi{i} = all_subj_block_ipsi(i).elecpos_resh;
    
    end
    
end

count = 1;

for i = 1:numel(elecpos_resh_ipsi)
    
    if isempty(elecpos_resh_ipsi{i}) == 1 
    
    empty_ind(count)=i; count= count + 1;
    
    end
    
    
    
end


elecpos_resh_ipsi(empty_ind) = [];

elecpos_resh_ipsi = cell2mat(elecpos_resh_ipsi');

mod_class_ipsi(empty_ind) = [];



for i = 1:numel(all_subj_block_contra)
    
    if isempty(all_subj_block_contra(i).elecpos_resh)==0
    
    
    elecpos_resh_contra{i} = all_subj_block_contra(i).elecpos_resh;
    
    end
    
end

count = 1;

for i = 1:numel(elecpos_resh_contra)
    
    if isempty(elecpos_resh_contra{i}) == 1 
    
    empty_ind(count)=i; count= count + 1;
    
    end
    
    
    
end


elecpos_resh_contra(empty_ind) = [];

elecpos_resh_contra = cell2mat(elecpos_resh_contra');

mod_class_contra(empty_ind) = [];







% 
% 
% for i = 1:numel(all_subj_block_contra)
%     
%     if isempty(all_subj_block_contra(i).elecpos_resh)==0
%     
%     
%     elecpos_resh_contra{i} = all_subj_block_contra(i).elecpos_resh;
%     
%     end
%     
% end
% 
% all_subj_block_master_copy
% 
% mod_class_ipsi = [all_subj_block_ipsi(:).mod_class];
% 
% mod_class_contra = [all_subj_block_contra(:).mod_class];


   figure;
   
   %subplot(1,2,1);
   
   hold on, % plot up regulation actived electrode as red 

mesh_r=load('\\mycloudpr4100\ivan\Ivan_analysis\Ivan\glass_brain\glass_brain\surface_pial_right.mat');


       ft_plot_mesh(mesh_r.mesh);
   alpha(0.12)
   % view([115 4]);
    %for medial view use view([-72 -18]);
   % view([-114 0])
    view([115 4]);
   
      %view([--77 -22])

c = 'k';
    
for i = 1:numel(mod_class_ipsi)
    
    tic
    
    if mod_class_ipsi(i) == 1
        
        color_fill = [230 97 0]./255;
        
    elseif mod_class_ipsi(i) == -1
        
        color_fill = [12 123 220]./255;
        
    elseif mod_class_ipsi(i) == 10
        
        color_fill = [225 190 106]./255;
        
    elseif isnan(mod_class_ipsi(i)) == 1
        
        color_fill = 'w';
        
        
    end
        
    if elecpos_resh_ipsi(i,1) ~= NaN

   scatter3(abs(elecpos_resh_ipsi(i,1)),elecpos_resh_ipsi(i,2),elecpos_resh_ipsi(i,3),80,color_fill,'filled', 'MarkerEdgeColor',c);
   
    end
   
   %surfaceonly = true;
   
   %maskstyle = 'opacity';
   % material dull; 
    %lighting gouraud; 
    title('ipsi','fontsize',18);


toc
end
camlight;

  
   figure;
   
   %subplot(1,2,1);
   
   hold on, % plot up regulation actived electrode as red 

mesh_r=load('\\mycloudpr4100\ivan\Ivan_analysis\Ivan\glass_brain\glass_brain\surface_pial_right.mat');


       ft_plot_mesh(mesh_r.mesh);
   alpha(0.12)
    view([115 4]);
    %for medial view use view
       % ([-72 -18]);
    %view([--77 -22])
    

c = 'k';
    
for i = 1:numel(mod_class_contra)
    
    tic
    
    if mod_class_contra(i) == 1
        
        color_fill = [230 97 0]./255;
        
    elseif mod_class_contra(i) == -1
        
        color_fill = [12 123 220]./255;
        
    elseif mod_class_contra(i) == 10
        
        color_fill = [225 190 106]./255;
        
    elseif isnan(mod_class_contra(i)) == 1
        
        color_fill = 'w';
        
    
        
        
    end
        
    if elecpos_resh_contra(i,1) ~= NaN

   scatter3(abs(elecpos_resh_contra(i,1)),elecpos_resh_contra(i,2),elecpos_resh_contra(i,3),80,color_fill,'filled', 'MarkerEdgeColor',c);
   
    end
   
   %surfaceonly = true;
   
   %maskstyle = 'opacity';
   % material dull; 
    %lighting gouraud; 
    %title('contra','fontsize',18);


toc
end
camlight;



