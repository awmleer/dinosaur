/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/CST/Desktop/dinosaur/Jump.v";
static unsigned int ng1[] = {5U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {0U, 0U};



static void Always_28_0(char *t0)
{
    char t15[8];
    char t26[8];
    char t27[8];
    char t44[8];
    char t52[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    char *t56;
    char *t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;
    char *t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    int t76;
    int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    char *t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    char *t90;
    char *t91;

LAB0:    t1 = (t0 + 1536U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 1876);
    *((int *)t2) = 1;
    t3 = (t0 + 1564);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(28, ng0);

LAB5:    xsi_set_current_line(29, ng0);
    t4 = (t0 + 1012);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB6;

LAB7:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(29, ng0);

LAB9:    xsi_set_current_line(30, ng0);
    t13 = (t0 + 692U);
    t14 = *((char **)t13);
    memset(t15, 0, 8);
    t13 = (t14 + 4);
    t16 = *((unsigned int *)t13);
    t17 = (~(t16));
    t18 = *((unsigned int *)t14);
    t19 = (t18 & t17);
    t20 = (t19 & 1U);
    if (t20 != 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t13) != 0)
        goto LAB12;

LAB13:    t22 = (t15 + 4);
    t23 = *((unsigned int *)t15);
    t24 = *((unsigned int *)t22);
    t25 = (t23 || t24);
    if (t25 > 0)
        goto LAB14;

LAB15:    memcpy(t52, t15, 8);

LAB16:    t84 = (t52 + 4);
    t85 = *((unsigned int *)t84);
    t86 = (~(t85));
    t87 = *((unsigned int *)t52);
    t88 = (t87 & t86);
    t89 = (t88 != 0);
    if (t89 > 0)
        goto LAB28;

LAB29:
LAB30:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 920);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t27, 0, 8);
    t5 = (t27 + 4);
    t6 = (t4 + 4);
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 0);
    *((unsigned int *)t27) = t9;
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 0);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t12 & 63U);
    t16 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t16 & 63U);
    memset(t26, 0, 8);
    t7 = (t27 + 4);
    t17 = *((unsigned int *)t27);
    t18 = *((unsigned int *)t7);
    t19 = (t17 | t18);
    if (t19 != 63U)
        goto LAB33;

LAB32:    if (*((unsigned int *)t7) == 0)
        goto LAB34;

LAB35:    t13 = (t26 + 4);
    *((unsigned int *)t26) = 1;
    *((unsigned int *)t13) = 1;

LAB33:    memset(t15, 0, 8);
    t14 = (t26 + 4);
    t20 = *((unsigned int *)t14);
    t23 = (~(t20));
    t24 = *((unsigned int *)t26);
    t25 = (t24 & t23);
    t33 = (t25 & 1U);
    if (t33 != 0)
        goto LAB39;

LAB37:    if (*((unsigned int *)t14) == 0)
        goto LAB36;

LAB38:    t21 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t21) = 1;

LAB39:    t22 = (t15 + 4);
    t34 = *((unsigned int *)t22);
    t35 = (~(t34));
    t36 = *((unsigned int *)t15);
    t37 = (t36 & t35);
    t38 = (t37 != 0);
    if (t38 > 0)
        goto LAB40;

LAB41:
LAB42:    goto LAB8;

LAB10:    *((unsigned int *)t15) = 1;
    goto LAB13;

LAB12:    t21 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB13;

LAB14:    t28 = (t0 + 920);
    t29 = (t28 + 36U);
    t30 = *((char **)t29);
    memset(t27, 0, 8);
    t31 = (t27 + 4);
    t32 = (t30 + 4);
    t33 = *((unsigned int *)t30);
    t34 = (t33 >> 0);
    *((unsigned int *)t27) = t34;
    t35 = *((unsigned int *)t32);
    t36 = (t35 >> 0);
    *((unsigned int *)t31) = t36;
    t37 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t37 & 63U);
    t38 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t38 & 63U);
    memset(t26, 0, 8);
    t39 = (t27 + 4);
    t40 = *((unsigned int *)t27);
    t41 = *((unsigned int *)t39);
    t42 = (t40 | t41);
    if (t42 != 63U)
        goto LAB18;

LAB17:    if (*((unsigned int *)t39) == 0)
        goto LAB19;

LAB20:    t43 = (t26 + 4);
    *((unsigned int *)t26) = 1;
    *((unsigned int *)t43) = 1;

LAB18:    memset(t44, 0, 8);
    t45 = (t26 + 4);
    t46 = *((unsigned int *)t45);
    t47 = (~(t46));
    t48 = *((unsigned int *)t26);
    t49 = (t48 & t47);
    t50 = (t49 & 1U);
    if (t50 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t45) != 0)
        goto LAB23;

LAB24:    t53 = *((unsigned int *)t15);
    t54 = *((unsigned int *)t44);
    t55 = (t53 & t54);
    *((unsigned int *)t52) = t55;
    t56 = (t15 + 4);
    t57 = (t44 + 4);
    t58 = (t52 + 4);
    t59 = *((unsigned int *)t56);
    t60 = *((unsigned int *)t57);
    t61 = (t59 | t60);
    *((unsigned int *)t58) = t61;
    t62 = *((unsigned int *)t58);
    t63 = (t62 != 0);
    if (t63 == 1)
        goto LAB25;

LAB26:
LAB27:    goto LAB16;

LAB19:    *((unsigned int *)t26) = 1;
    goto LAB18;

LAB21:    *((unsigned int *)t44) = 1;
    goto LAB24;

LAB23:    t51 = (t44 + 4);
    *((unsigned int *)t44) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB24;

LAB25:    t64 = *((unsigned int *)t52);
    t65 = *((unsigned int *)t58);
    *((unsigned int *)t52) = (t64 | t65);
    t66 = (t15 + 4);
    t67 = (t44 + 4);
    t68 = *((unsigned int *)t15);
    t69 = (~(t68));
    t70 = *((unsigned int *)t66);
    t71 = (~(t70));
    t72 = *((unsigned int *)t44);
    t73 = (~(t72));
    t74 = *((unsigned int *)t67);
    t75 = (~(t74));
    t76 = (t69 & t71);
    t77 = (t73 & t75);
    t78 = (~(t76));
    t79 = (~(t77));
    t80 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t80 & t78);
    t81 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t81 & t79);
    t82 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t82 & t78);
    t83 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t83 & t79);
    goto LAB27;

LAB28:    xsi_set_current_line(30, ng0);

LAB31:    xsi_set_current_line(31, ng0);
    t90 = ((char*)((ng1)));
    t91 = (t0 + 920);
    xsi_vlogvar_wait_assign_value(t91, t90, 0, 0, 6, 0LL);
    goto LAB30;

LAB34:    *((unsigned int *)t26) = 1;
    goto LAB33;

LAB36:    *((unsigned int *)t15) = 1;
    goto LAB39;

LAB40:    xsi_set_current_line(33, ng0);

LAB43:    xsi_set_current_line(34, ng0);
    t28 = (t0 + 920);
    t29 = (t28 + 36U);
    t30 = *((char **)t29);
    t31 = ((char*)((ng2)));
    memset(t44, 0, 8);
    xsi_vlog_unsigned_add(t44, 6, t30, 6, t31, 6);
    t32 = (t0 + 920);
    xsi_vlogvar_wait_assign_value(t32, t44, 0, 0, 6, 0LL);
    goto LAB42;

}

static void Initial_39_1(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(39, ng0);

LAB2:    xsi_set_current_line(40, ng0);
    t1 = ((char*)((ng3)));
    t2 = (t0 + 1012);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);
    xsi_set_current_line(41, ng0);
    t1 = ((char*)((ng3)));
    t2 = (t0 + 920);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 6, 0LL);

LAB1:    return;
}


extern void work_m_00000000003470356772_2846351715_init()
{
	static char *pe[] = {(void *)Always_28_0,(void *)Initial_39_1};
	xsi_register_didat("work_m_00000000003470356772_2846351715", "isim/top_sim_isim_beh.exe.sim/work/m_00000000003470356772_2846351715.didat");
	xsi_register_executes(pe);
}
