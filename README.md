# MCNet
This is the testing code of our paper MCNet for both 29 and 68 facial landmarks, using the matlab interface of Caffe [1]. We suggest you using caffe-happynear (https://github.com/happynear/caffe-windows), which is a popular compiled windows version of Caffe.

We give examples (mcnet_29.m, mcnet_68.m) for obtaining the face alignment results on COFW [2] and IBUG [3].

If you find our code useful in your research work, please cite our paper.
```
@inproceedings{shao2017learning,
  title={Learning a multi-center convolutional network for unconstrained face alignment},
  author={Shao, Zhiwen and Zhu, Hengliang and Hao, Yangyang and Wang, Min and Ma, Lizhuang},
  booktitle={IEEE International Conference on Multimedia and Expo},
  pages={109--114},
  year={2017},
  organization={IEEE}
}
```
Should you have any questions, don't hesitate to contact with us through email shaozhiwen@sjtu.edu.cn.

References:

[1] Yangqing Jia, Evan Shelhamer, Jeff Donahue, Sergey Karayev, Jonathan Long, Ross B Girshick, Sergio Guadarrama, and Trevor Darrell, "Caffe: Convolutional architecture for fast feature embedding.," in ACM International Conference on Multimedia. ACM, 2014, pp. 675–678.

[2] Xavier P Burgos-Artizzu, Pietro Perona, and Piotr Dollar, "Robust face landmark estimation under occlusion," in IEEE International Conference on Computer Vision. IEEE, 2013, pp. 1513–1520.

[3] Christos Sagonas, Georgios Tzimiropoulos, Stefanos Zafeiriou, and Maja Pantic, "300 faces in-the-wild challenge: The first facial landmark localization challenge," in IEEE International Conference on Computer VisionWorkshops. IEEE, 2013, pp. 397–403.
