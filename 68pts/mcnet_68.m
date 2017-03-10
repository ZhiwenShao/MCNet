clc,clear

load ('bounding_boxes_ibug.mat');

img_num = 135;
crop_img_size = 50;

caffe.set_mode_cpu();
net_model = 'MCNet_deploy_68.prototxt';
net_weights = 'combine_68.caffemodel';

phase = 'test';
align_net = caffe.Net(net_model, net_weights, phase);

for i=1:img_num
    
    img=imread(['image\ibug\',bounding_boxes{1,i}.imgName]);    
    left = bounding_boxes{1,i}.bb_ground_truth(1,1);
    right = bounding_boxes{1,i}.bb_ground_truth(1,3);
    top = bounding_boxes{1,i}.bb_ground_truth(1,2);
    bottom = bounding_boxes{1,i}.bb_ground_truth(1,4);
    
    t1=clock;
    pred_all_land (i,:) = face_align (align_net, img, crop_img_size, left, right, top, bottom);
    t2=clock;
    runtime(i,1)=etime(t2,t1);
    
end

ave_time = mean(runtime(:));

fprintf('Processing %d images, using %f ms averagely for each image.\n',img_num,...
    ave_time * 1000);

caffe.reset_all();

