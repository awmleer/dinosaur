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

![B24EE13F-034A-4C7E-8689-6E43D745522E](https://ww4.sinaimg.cn/large/006y8lVagw1fbh36ui9uij30vu0mmmy4.jpg)

下面是各个模块的具体介绍

  

  

 

## Top module

主模块，控制游戏的**开始**(start)、**结束**(stop)、**重启**(reset)，以及**衔接**各个模块，如，把`ground`、`jump`、`cactus`、`score`的输出数据送给`vga`模块来显示在屏幕上。

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
assign px = px_ground || px_dinosaur || px_cactus || px_score;
```

也就是说，**只要**`px_ground`、`px_dinosaur`、`px_cactus`、`px_score`其中有一个为1，`px`就会为1，使屏幕上对应的位置显示黑色像素。

这个原理类似于**投影重叠**，如下图，layerA和layerB分别有一个三角形和一个长方形，因此screen上的投影图案显示的是**两个图形的叠加**。

![65EED49CF9389B25BDA79848BA0E1E10](https://ww4.sinaimg.cn/large/006y8lVagw1fbgx6avd5qj30zk0qowgf.jpg)

在这个工程里，我们从`ground`、`jump`、`cactus`、`score`这几个模块分别引了一根线到`vga`模块，并且从`vga`模块引出`col_addr`和`row_addr`这两组线，来告诉其他模块此时需要显示的**处于哪个位置的像素**，这样，其他模块只需要根据`col_addr`和`row_addr`**计算出**自己要在这个位置显示黑色还是白色像素就可以了，`vga`模块会把这些独立的图像进行**叠加**。

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

 

 

 

## Score module

这个模块用于**统计并输出分数**。

我们在module前利用**宏定义**``define`定义了单词“score”和四位数字0-9.

此处以字母“S”为例。

S是利用五个矩形简单表示的，其他字母和数字同理。

```verilog
`define LetterS ((450 <= col_addr) && (col_addr < 470) && (30 <= row_addr) && (row_addr < 34))   || ((450 <= col_addr) && (col_addr < 470) && (48 <= row_addr) && (row_addr < 52))
|| ((450 <= col_addr) && (col_addr < 470) && (66 <= row_addr) && (row_addr < 70)) 
|| ((450 <= col_addr) && (col_addr < 454) && (30 <= row_addr) && (row_addr < 52)) 
|| ((466 <= col_addr) && (col_addr < 470) && (48 <= row_addr) && (row_addr < 70))
```

在每一个时钟周期，我们都会进行分数输出。

如果reset，则不输出。

其他情况，输出“score”和分数。分数有四位，每一位由四位二进制表示，输出时每四位判断应输出的数字。

```verilog
always @ (posedge clkdiv[0] or posedge RESET) begin
	if(RESET==1)begin
		px<=1'b0;//if reset , don't display the score
	end
	else if(`LetterS || `LetterC || `LetterO || `LetterR || `LetterE) begin
		px<=1'b1; //display score
	end
	else if(((score[3:0] == 0) && (`Zero0)) ||//every 4 regs shows one number.
			((score[3:0] == 4'd1) && (`One0)) ||
			...
            ) begin
			px<=1'b1;
		end
		else begin
			px<=1'b0;
		end
	end
```

每个时钟周期，我们都进行分数的更新。

如果reset或start，分数清零。

如果game over，分数不变化。

如果游戏正常进行，则分数增加。特别的，由于储存方式为四位二进制表示一个十进制的数，我们需要转换成**BCD码**，即如果达到9（4‘b1001），清零当前位并进位。

```verilog
if(score[15:12] == 4'b1001) begin						
	score[15:12] <= 0;
end
else score[15:12] <= score[15:12] + 1;
```

 

 

 

## 程序流程

![A5B24B76-B7DF-4189-A4BA-768533541D1B](https://ww2.sinaimg.cn/large/006y8lVagw1fbh18u0m9rj30ow0ew3z3.jpg)

 

 

 

## 调试及仿真

### Vga

```verilog
initial begin
    // Initialize Inputs
    vga_clk = 0;
    clrn = 0;
    px_ground = 0;
    px_score=0;
    px_dinosaur=0;
    px_cactus=0;
    // Wait 100 ns for global reset to finish
    #30;
    clrn = 1;
    // Add stimulus here
end
always begin
    vga_clk = 0; #10;
    vga_clk = 1; #10;
end
always begin
    px_ground=0;
    #100000;
    px_ground=1;
    #50000;
end
```

![F84CCAA1-5398-46DD-B930-B2BD8C388105](https://ww4.sinaimg.cn/large/006y8lVagw1fbh3wan8l3j30qv0a0tgo.jpg)

### Ground

```verilog
initial begin
    // Initialize Inputs
    clkdiv = 0;
    row_addr = 0;
    col_addr = 0;
    game_status = 0;
    fresh=0;
    // Wait 100 ns for global reset to finish
    #100;
    game_status =1;
end
always begin
    clkdiv = clkdiv+1'b1; #10;
end
always begin
    fresh=0;#30;
    fresh=1;#30;
end
```

![2320E9E1-E58A-4DAC-99D8-10BDE0EBECBD](https://ww1.sinaimg.cn/large/006y8lVagw1fbh4c1734oj30qe066419.jpg)

### Random

```verilog
initial begin
    // Initialize Inputs
    clk = 0;
    RESET = 0;
    // Wait 100 ns for global reset to finish
    #30;
    RESET=1;
    #30;
    RESET=0;
end
always begin
      clk = 0; #10;
      clk = 1; #10;
end
```

![C5F95795-89C4-45C7-BA9F-2D4BF46324E3](https://ww1.sinaimg.cn/large/006y8lVagw1fbh427kkzxj30pu03ldgy.jpg)

 

 

 

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

