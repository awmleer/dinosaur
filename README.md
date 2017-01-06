---
typora-copy-images-to: ipic
---

# chrome小恐龙 项目报告

数字逻辑课程  Group x  郝广博 桂晓琬

 

 

 

 

 

## 背景介绍

Chrome浏览器在没有网络连接的时候，会显示一个小恐龙，点击空格就可以玩这个小游戏，十分有趣，所以我们在这次的project中使用Verilog硬件描述语言来实现这样一个小恐龙游戏。

![1150912E-B0FA-4F6E-9BA6-90FD84B8156B](https://ww3.sinaimg.cn/large/006y8lVagw1fbeebi1vxtj30yo09gwep.jpg)







## 设计说明

### 课程设计环境

实验平台: Sword Kintex7

开发环境: Xilinx ISE 14.7

硬件描述语言:Verilog HDL

### 输入输出交互选择

输入: Sword 实验平台上的按钮、拨动开关

输出: VGA显示器





## 模块结构

工程一共包括六个模块，**关系**如下图：

![F64A0101-EED8-4DB6-BE9F-281590051B7E](https://ww4.sinaimg.cn/large/006y8lVagw1fbgs45hkhtj30um0mmdgf.jpg)

  

下面是各个模块的具体介绍



### Top

主模块，控制游戏的**开始**(start)、**结束**(stop)、**重启**(reset)，以及衔接各个模块，如，把`ground`、`jump`、`cactus`的输出数据送给`vga`模块来显示在屏幕上。

### Ground

控制路面的显示和移动，







## 程序流程







## 调试及仿真







## 组内成员分工说明及贡献比例









## 项目代码及开发历程

见[GitHub](https://github.com/haoguangbo/dinosaur) (https://github.com/haoguangbo/dinosaur)

