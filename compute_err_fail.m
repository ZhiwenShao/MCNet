clc,clear

ground_truth_land=importdata('IBUG_ground_land.txt');
num = size(ground_truth_land,1);%135
landmark_size=size(ground_truth_land,2)/2;%68
pred_land = importdata('IBUG_pred_land.txt');
    
error_list=zeros(num,landmark_size);
mean_errors=zeros(num,1);
l_ocular = zeros(1,2);
r_ocular = zeros(1,2);
for i=1:num
    l_ocular(1,1)=mean(ground_truth_land(i,2*(37:1:42)-1));
    l_ocular(1,2)=mean(ground_truth_land(i,2*(37:1:42)));
    r_ocular(1,1)=mean(ground_truth_land(i,2*(43:1:48)-1));
    r_ocular(1,2)=mean(ground_truth_land(i,2*(43:1:48)));  
     
    biocular=(l_ocular(1,1)-r_ocular(1,1))*(l_ocular(1,1)-r_ocular(1,1))+(l_ocular(1,2)-r_ocular(1,2))*(l_ocular(1,2)-r_ocular(1,2)); 

    for j=1:landmark_size
        error_list(i,j)=sqrt((ground_truth_land(i,2*j-1)-pred_land(i,2*j-1))*(ground_truth_land(i,2*j-1)-pred_land(i,2*j-1))+...
        (ground_truth_land(i,2*j)-pred_land(i,2*j))*(ground_truth_land(i,2*j)-pred_land(i,2*j)))/sqrt(biocular);
    end
    
    error_list(i,:)=error_list(i,:);
    mean_errors(i,1)=mean(error_list(i,:));
end

mean_err=mean(mean_errors(:));
failure_rate = length(find(mean_errors>0.1))/num;