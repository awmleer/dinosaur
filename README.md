---
typora-copy-images-to: ipic
---

# chrome小恐龙 项目报告

数字逻辑课程  郝广博 桂晓琬

 

 

 

 

 

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

![562EF094-E3BD-47DE-B729-25F1256E7300](https://ww1.sinaimg.cn/large/006y8lVagw1fbgwtkwjhtj30vu0mmjsc.jpg)

下面是各个模块的具体介绍

 

 



## Top module

主模块，控制游戏的**开始**(start)、**结束**(stop)、**重启**(reset)，以及**衔接**各个模块，如，把`ground`、`jump`、`cactus`的输出数据送给`vga`模块来显示在屏幕上。

### 游戏的开始和结束

首先，我们设计了一个寄存器`game_status`用来表示游戏是否是正在进行，0表示stop，1表示running，并且把game_status的引脚接给各个子模块从而实现全局的协调控制。

另外，我们设计了一个寄存器`trigger_start`和一条线`trigger_stop`。并且在每个时钟周期，都去判断这两个值，如果`trigger_stop`为1，就把`game_status`变成0，如果`trigger_start`为1，就把`gama_status`变成1。不过值得一提的是，在start操作的时候，我们**并不是**发现`trigger_start`等于1以后就立即改变`game_status`的值，而是**等到`vs`为低电平**的时候再去做这个操作，这是为了保证游戏的开始是在VGA的**消隐期**进行的。

而游戏停止的机制也十分简单，只需要判断dinosaur和cactus的图案是否有**重叠部分**，一旦发现某个像素`px_dinosaur`和`px_cactus`都为1，就表示dinosaur和cactus**撞在了一起**，即可出发停止游戏的操作。

```verilog
wire trigger_stop;
assign trigger_stop = px_dinosaur && px_cactus;
```

### 分频器

```verilog
reg [31:0]clkdiv;
always@(posedge CLK) begin
    clkdiv <= clkdiv + 1'b1;
end
```

一个32位的分频器。

 

## Vga module

有必要在介绍其他模块前，先说明一下vga显示模块的一些引脚定义。

这个模块基本是在老师提供的Vgac模块的基础上做了一些修改。

由于不需要显示彩色的图案，所以我们简化了r、g、b的数据处理：

```verilog
assign r = rdn ? 4'h0 : px ? 4'b0000:4'b1111; // 3-bit red
assign g = rdn ? 4'h0 : px ? 4'b0000:4'b1111; // 3-bit green
assign b = rdn ? 4'h0 : px ? 4'b0000:4'b1111; // 2-bit blue
```

`px`为1，则显示**黑色**，`px`为0，则显示**白色**。

而`px`这根线的定义则是：

```verilog
assign px = px_ground || px_dinosaur || px_cactus || px_frame;
```

也就是说，**只要**`px_ground`、`px_dinosaur`、`px_cactus`、`px_frame`其中有一个为1，`px`就会为1，使屏幕上对应的位置显示黑色像素。

这个原理类似于**投影重叠**，如下图，layerA和layerB分别有一个三角形和一个长方形，因此screen上的投影图案显示的是**两个图形的叠加**。

![65EED49CF9389B25BDA79848BA0E1E10](https://ww4.sinaimg.cn/large/006y8lVagw1fbgx6avd5qj30zk0qowgf.jpg)

在这个工程里，我们从`ground`、`jump`、`cactus`、`frame`这几个模块分别引了一根线到`vga`模块，并且从`vga`模块引出`col_addr`和`row_addr`这两组线，来告诉其他模块此时需要显示的**处于哪个位置的像素**，这样，其他模块只需要根据`col_addr`和`row_addr`**计算出**自己要在这个位置显示黑色还是白色像素就可以了，`vga`模块会把这些独立的图像进行**叠加**。

除此以外，我们还把`vga`模块的`vs`这根线接到了其他的模块，以便于一些操作可以控制在消隐期(blanking period)进行。

相较于做**显存**的方案，我们采用的这种方法可能有些简陋，但是对于这个小游戏，足矣。

> 一些其他的基本参数
>
> 刷新频率：60Hz
>
> 屏幕宽度：640px (col)
>
> 屏幕高度：480px (row)





## Ground module

这个模块控制路面的**显示和移动**，不涉及太多的逻辑。

所谓的路面，其实是由4块**8*160**的**地砖**构成的，每一块的图案都是**首尾相接**的，因此只需要一个**公式**，就能算出`px`的值：

```verilog
px <= pattern[row_addr-10'd400][(col_addr+ground_position)%10'd160];
```

而通过

```verilog
always @(negedge fresh) begin
    if (game_status) begin
        ground_position<=(ground_position+speed)%10'd160;
    end
end
```

可以在`game_status`等于1的时候，每**经过一帧**，就改变一点路面的位置。





## Jump module

这个模块用来**显示小恐龙**以及控制小恐龙的**跳跃**。

我们把小恐龙切成了**两个部分**，并且开了5个ram，分别用来存小恐龙的**身体的两个状态**和**脚的三个状态**。这样可以让小恐龙在**跑**、**跳**、**停止**这三个状态下可以显示不同的样子，更加生动。

对于jump的过程，实际上是有**两个变量**的：`height`和`time`，但是，我们只是在每一帧改变`time`的值，而学过物理的同学都知道，小恐龙在竖直方向上是做**匀加速直线运动**，于是有：

```verilog
assign height = (jump_time*12'd40 - jump_time*jump_time) / 2'd2;
```

这样就可以比较逼真的模拟出**重力**的感觉。



## Cactus module

这个模块是用来显示仙人掌的，这里，有两个地方需要做到**随机**（至少是伪随机）：两个仙人掌之间的间距、仙人掌的种类。但是verilog内的`$random`函数只能用于**仿真**，因此我们去stackoverflow查了一番，找到了这样一个伪随机数生成的方法：(使用**CFSR**)

```verilog
always @(posedge clk) begin
    data_next[4] = data[4]^data[1];
    data_next[3] = data[3]^data[0];
    data_next[2] = data[2]^data_next[4];
    data_next[1] = data[1]^data_next[3];
    data_next[0] = data[0]^data_next[2];
end

always @(posedge clk)
    if(RESET)
        data <= 5'h1f;
    else
        data <= data_next;
```

比较遗憾的是，由于时间有限，我们只做了大中小三种仙人掌，没有设计更多的障碍物种类。





## Frame module







## 程序流程

![A5B24B76-B7DF-4189-A4BA-768533541D1B](https://ww2.sinaimg.cn/large/006y8lVagw1fbh18u0m9rj30ow0ew3z3.jpg)





## 调试及仿真







## 组内成员分工说明及贡献比例

#### 郝广博 50%

- VGA模块
- Cactus模块
- Random模块
- 文档书写
- 仿真测试
- 模块设计

#### 桂晓琬 50%

- Jump模块
- Ground模块
- Frame模块
- 文档书写
- 流程图制作
- 图案设计
- 视频制作



## 项目代码及开发历程

见[GitHub](https://github.com/haoguangbo/dinosaur) (https://github.com/haoguangbo/dinosaur)

