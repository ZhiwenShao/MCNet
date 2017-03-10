clc,clear

load ('COFW_test_color.mat');

crop_img_size = 50;

caffe.set_mode_cpu();
net_model = 'MCNet_deploy_29.prototxt';
net_weights = 'combine_29.caffemodel';

phase = 'test';
align_net = caffe.Net(net_model, net_weights, phase);

for i=1:size(IsT,1)
    
    img=IsT{i,1};    
    left = bboxesT(i,1);
    right = bboxesT(i,1) + bboxesT(i,3);
    top = bboxesT(i,2);
    bottom = bboxesT(i,2) + bboxesT(i,4);
    
    t1=clock;
    pred_all_land (i,:) = face_align (align_net, img, crop_img_size, left, right, top, bottom);
    t2=clock;
    runtime(i,1)=etime(t2,t1);
    
end

ave_time = mean(runtime(:));

fprintf('Processing %d images, using %f ms averagely for each image.\n',size(IsT,1),...
    ave_time * 1000);

caffe.reset_all();

