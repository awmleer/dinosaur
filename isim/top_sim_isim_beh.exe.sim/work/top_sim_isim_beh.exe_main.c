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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000003266574342_1129804446_init();
    work_m_00000000003470356772_2846351715_init();
    work_m_00000000000158949829_3351823584_init();
    work_m_00000000000897832967_2055094517_init();
    work_m_00000000002527915213_3376253697_init();
    work_m_00000000003079782243_2668991232_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003079782243_2668991232");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
