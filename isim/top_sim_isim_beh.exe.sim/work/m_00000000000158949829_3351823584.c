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
static const char *ng0 = "C:/Users/CST/Desktop/dinosaur/Ground.v";
static unsigned int ng1[] = {0U, 0U};



static void Always_29_0(char *t0)
{
    char t13[8];
    char t29[8];
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
    char *t11;
    char *t12;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t30;

LAB0:    t1 = (t0 + 1536U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(29, ng0);
    t2 = (t0 + 1876);
    *((int *)t2) = 1;
    t3 = (t0 + 1564);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(29, ng0);

LAB5:    xsi_set_current_line(30, ng0);
    t4 = (t0 + 692U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(30, ng0);

LAB9:    xsi_set_current_line(31, ng0);
    t11 = (t0 + 692U);
    t12 = *((char **)t11);
    t11 = ((char*)((ng1)));
    memset(t13, 0, 8);
    t14 = (t12 + 4);
    if (*((unsigned int *)t14) != 0)
        goto LAB11;

LAB10:    t15 = (t11 + 4);
    if (*((unsigned int *)t15) != 0)
        goto LAB11;

LAB14:    if (*((unsigned int *)t12) < *((unsigned int *)t11))
        goto LAB12;

LAB13:    t17 = (t13 + 4);
    t18 = *((unsigned int *)t17);
    t19 = (~(t18));
    t20 = *((unsigned int *)t13);
    t21 = (t20 & t19);
    t22 = (t21 != 0);
    if (t22 > 0)
        goto LAB15;

LAB16:    xsi_set_current_line(34, ng0);

LAB19:    xsi_set_current_line(35, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 920);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 6, 0LL);

LAB17:    goto LAB8;

LAB11:    t16 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB13;

LAB12:    *((unsigned int *)t13) = 1;
    goto LAB13;

LAB15:    xsi_set_current_line(31, ng0);

LAB18:    xsi_set_current_line(32, ng0);
    t23 = (t0 + 920);
    t24 = (t23 + 36U);
    t25 = *((char **)t24);
    t26 = (t0 + 1012);
    t27 = (t26 + 36U);
    t28 = *((char **)t27);
    memset(t29, 0, 8);
    xsi_vlog_unsigned_add(t29, 6, t25, 6, t28, 4);
    t30 = (t0 + 920);
    xsi_vlogvar_wait_assign_value(t30, t29, 0, 0, 6, 0LL);
    goto LAB17;

}

static void Initial_41_1(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(41, ng0);

LAB2:    xsi_set_current_line(42, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1012);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 4, 0LL);
    xsi_set_current_line(43, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 920);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 6, 0LL);

LAB1:    return;
}


extern void work_m_00000000000158949829_3351823584_init()
{
	static char *pe[] = {(void *)Always_29_0,(void *)Initial_41_1};
	xsi_register_didat("work_m_00000000000158949829_3351823584", "isim/top_sim_isim_beh.exe.sim/work/m_00000000000158949829_3351823584.didat");
	xsi_register_executes(pe);
}
