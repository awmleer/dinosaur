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
static const char *ng0 = "C:/Users/CST/Desktop/dinosaur/AntiJitter.v";
static unsigned int ng1[] = {1U, 0U};
static unsigned int ng2[] = {0U, 0U};



static void Always_27_0(char *t0)
{
    char t11[8];
    char t28[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;

LAB0:    t1 = (t0 + 1616U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 1812);
    *((int *)t2) = 1;
    t3 = (t0 + 1644);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(27, ng0);

LAB5:    xsi_set_current_line(28, ng0);
    t4 = (t0 + 772U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(36, ng0);

LAB17:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 1092);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t11, 0, 8);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 & 1048575U);
    if (t10 != 0)
        goto LAB18;

LAB19:    if (*((unsigned int *)t5) != 0)
        goto LAB20;

LAB21:    t13 = (t11 + 4);
    t16 = *((unsigned int *)t13);
    t17 = (~(t16));
    t18 = *((unsigned int *)t11);
    t21 = (t18 & t17);
    t22 = (t21 != 0);
    if (t22 > 0)
        goto LAB22;

LAB23:    xsi_set_current_line(40, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB24:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(29, ng0);

LAB9:    xsi_set_current_line(30, ng0);
    t12 = (t0 + 1092);
    t13 = (t12 + 36U);
    t14 = *((char **)t13);
    memset(t11, 0, 8);
    t15 = (t14 + 4);
    t16 = *((unsigned int *)t14);
    t17 = *((unsigned int *)t15);
    t18 = (t16 | t17);
    if (t18 != 1048575U)
        goto LAB11;

LAB10:    if (*((unsigned int *)t15) == 0)
        goto LAB12;

LAB13:    t19 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t19) = 1;

LAB11:    t20 = (t11 + 4);
    t21 = *((unsigned int *)t20);
    t22 = (~(t21));
    t23 = *((unsigned int *)t11);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB14;

LAB15:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 1092);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 20, t4, 20, t5, 20);
    t12 = (t0 + 1092);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 20, 0LL);

LAB16:    goto LAB8;

LAB12:    *((unsigned int *)t11) = 1;
    goto LAB11;

LAB14:    xsi_set_current_line(31, ng0);
    t26 = ((char*)((ng1)));
    t27 = (t0 + 1000);
    xsi_vlogvar_wait_assign_value(t27, t26, 0, 0, 1, 0LL);
    goto LAB16;

LAB18:    *((unsigned int *)t11) = 1;
    goto LAB21;

LAB20:    t12 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB21;

LAB22:    xsi_set_current_line(38, ng0);
    t14 = (t0 + 1092);
    t15 = (t14 + 36U);
    t19 = *((char **)t15);
    t20 = ((char*)((ng1)));
    memset(t28, 0, 8);
    xsi_vlog_unsigned_minus(t28, 20, t19, 20, t20, 20);
    t26 = (t0 + 1092);
    xsi_vlogvar_wait_assign_value(t26, t28, 0, 0, 20, 0LL);
    goto LAB24;

}


extern void work_m_00000000003266574342_4010439870_init()
{
	static char *pe[] = {(void *)Always_27_0};
	xsi_register_didat("work_m_00000000003266574342_4010439870", "isim/AntiJitter_isim_beh.exe.sim/work/m_00000000003266574342_4010439870.didat");
	xsi_register_executes(pe);
}
