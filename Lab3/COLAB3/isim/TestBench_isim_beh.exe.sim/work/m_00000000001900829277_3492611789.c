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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/Users/afhwu0329/Desktop/Lab3/COLAB3/ALU_Ctrl.v";
static unsigned int ng1[] = {2U, 0U};
static unsigned int ng2[] = {8U, 0U};
static int ng3[] = {1, 0};
static int ng4[] = {0, 0};
static unsigned int ng5[] = {0U, 0U};
static unsigned int ng6[] = {1U, 0U};
static unsigned int ng7[] = {9U, 0U};
static unsigned int ng8[] = {6U, 0U};
static unsigned int ng9[] = {4U, 0U};
static unsigned int ng10[] = {11U, 0U};
static unsigned int ng11[] = {32U, 0U};
static unsigned int ng12[] = {34U, 0U};
static unsigned int ng13[] = {36U, 0U};
static unsigned int ng14[] = {37U, 0U};
static unsigned int ng15[] = {3U, 0U};
static unsigned int ng16[] = {42U, 0U};
static unsigned int ng17[] = {43U, 0U};
static unsigned int ng18[] = {5U, 0U};
static unsigned int ng19[] = {24U, 0U};
static unsigned int ng20[] = {10U, 0U};
static unsigned int ng21[] = {7U, 0U};
static int ng22[] = {6, 0};
static int ng23[] = {7, 0};
static int ng24[] = {10, 0};
static int ng25[] = {11, 0};
static int ng26[] = {12, 0};



static void Always_51_0(char *t0)
{
    char t6[8];
    char t22[8];
    char t36[8];
    char t52[8];
    char t60[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    char *t35;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    char *t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    int t84;
    int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    char *t99;

LAB0:    t1 = (t0 + 5136U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 5704);
    *((int *)t2) = 1;
    t3 = (t0 + 5168);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(52, ng0);

LAB5:    xsi_set_current_line(53, ng0);
    t4 = (t0 + 3656U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t4 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t4);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB9;

LAB6:    if (t18 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t6) = 1;

LAB9:    memset(t22, 0, 8);
    t23 = (t6 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t6);
    t27 = (t26 & t25);
    t28 = (t27 & 1U);
    if (t28 != 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t23) != 0)
        goto LAB12;

LAB13:    t30 = (t22 + 4);
    t31 = *((unsigned int *)t22);
    t32 = *((unsigned int *)t30);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB14;

LAB15:    memcpy(t60, t22, 8);

LAB16:    t92 = (t60 + 4);
    t93 = *((unsigned int *)t92);
    t94 = (~(t93));
    t95 = *((unsigned int *)t60);
    t96 = (t95 & t94);
    t97 = (t96 != 0);
    if (t97 > 0)
        goto LAB28;

LAB29:    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 4216);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB30:    goto LAB2;

LAB8:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB9;

LAB10:    *((unsigned int *)t22) = 1;
    goto LAB13;

LAB12:    t29 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB13;

LAB14:    t34 = (t0 + 3496U);
    t35 = *((char **)t34);
    t34 = ((char*)((ng2)));
    memset(t36, 0, 8);
    t37 = (t35 + 4);
    t38 = (t34 + 4);
    t39 = *((unsigned int *)t35);
    t40 = *((unsigned int *)t34);
    t41 = (t39 ^ t40);
    t42 = *((unsigned int *)t37);
    t43 = *((unsigned int *)t38);
    t44 = (t42 ^ t43);
    t45 = (t41 | t44);
    t46 = *((unsigned int *)t37);
    t47 = *((unsigned int *)t38);
    t48 = (t46 | t47);
    t49 = (~(t48));
    t50 = (t45 & t49);
    if (t50 != 0)
        goto LAB20;

LAB17:    if (t48 != 0)
        goto LAB19;

LAB18:    *((unsigned int *)t36) = 1;

LAB20:    memset(t52, 0, 8);
    t53 = (t36 + 4);
    t54 = *((unsigned int *)t53);
    t55 = (~(t54));
    t56 = *((unsigned int *)t36);
    t57 = (t56 & t55);
    t58 = (t57 & 1U);
    if (t58 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t53) != 0)
        goto LAB23;

LAB24:    t61 = *((unsigned int *)t22);
    t62 = *((unsigned int *)t52);
    t63 = (t61 & t62);
    *((unsigned int *)t60) = t63;
    t64 = (t22 + 4);
    t65 = (t52 + 4);
    t66 = (t60 + 4);
    t67 = *((unsigned int *)t64);
    t68 = *((unsigned int *)t65);
    t69 = (t67 | t68);
    *((unsigned int *)t66) = t69;
    t70 = *((unsigned int *)t66);
    t71 = (t70 != 0);
    if (t71 == 1)
        goto LAB25;

LAB26:
LAB27:    goto LAB16;

LAB19:    t51 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB20;

LAB21:    *((unsigned int *)t52) = 1;
    goto LAB24;

LAB23:    t59 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t59) = 1;
    goto LAB24;

LAB25:    t72 = *((unsigned int *)t60);
    t73 = *((unsigned int *)t66);
    *((unsigned int *)t60) = (t72 | t73);
    t74 = (t22 + 4);
    t75 = (t52 + 4);
    t76 = *((unsigned int *)t22);
    t77 = (~(t76));
    t78 = *((unsigned int *)t74);
    t79 = (~(t78));
    t80 = *((unsigned int *)t52);
    t81 = (~(t80));
    t82 = *((unsigned int *)t75);
    t83 = (~(t82));
    t84 = (t77 & t79);
    t85 = (t81 & t83);
    t86 = (~(t84));
    t87 = (~(t85));
    t88 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t88 & t86);
    t89 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t89 & t87);
    t90 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t90 & t86);
    t91 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t91 & t87);
    goto LAB27;

LAB28:    xsi_set_current_line(54, ng0);

LAB31:    xsi_set_current_line(55, ng0);
    t98 = ((char*)((ng3)));
    t99 = (t0 + 4216);
    xsi_vlogvar_assign_value(t99, t98, 0, 0, 1);
    goto LAB30;

}

static void Always_61_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    int t9;

LAB0:    t1 = (t0 + 5384U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 5720);
    *((int *)t2) = 1;
    t3 = (t0 + 5416);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(62, ng0);

LAB5:    xsi_set_current_line(63, ng0);
    t4 = (t0 + 3656U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 5, t4, 32);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 5, t2, 32);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 5, t2, 32);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng15)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 5, t2, 32);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng9)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 5, t2, 32);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng18)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 5, t2, 32);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng22)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 5, t2, 32);
    if (t6 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng23)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 5, t2, 32);
    if (t6 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng24)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 5, t2, 32);
    if (t6 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng25)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 5, t2, 32);
    if (t6 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng26)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 5, t2, 32);
    if (t6 == 1)
        goto LAB27;

LAB28:
LAB30:
LAB29:    xsi_set_current_line(90, ng0);

LAB63:    xsi_set_current_line(90, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 4056);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);

LAB31:    goto LAB2;

LAB7:    xsi_set_current_line(64, ng0);

LAB32:    xsi_set_current_line(64, ng0);
    t7 = ((char*)((ng5)));
    t8 = (t0 + 4056);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 5);
    goto LAB31;

LAB9:    xsi_set_current_line(65, ng0);

LAB33:    xsi_set_current_line(65, ng0);
    t3 = ((char*)((ng7)));
    t4 = (t0 + 4056);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 5);
    goto LAB31;

LAB11:    xsi_set_current_line(67, ng0);

LAB34:    xsi_set_current_line(68, ng0);
    t3 = (t0 + 3496U);
    t4 = *((char **)t3);

LAB35:    t3 = ((char*)((ng5)));
    t9 = xsi_vlog_unsigned_case_compare(t4, 6, t3, 6);
    if (t9 == 1)
        goto LAB36;

LAB37:    t2 = ((char*)((ng9)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB38;

LAB39:    t2 = ((char*)((ng11)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB40;

LAB41:    t2 = ((char*)((ng12)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB42;

LAB43:    t2 = ((char*)((ng13)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB44;

LAB45:    t2 = ((char*)((ng14)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB46;

LAB47:    t2 = ((char*)((ng16)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB48;

LAB49:    t2 = ((char*)((ng17)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB50;

LAB51:    t2 = ((char*)((ng19)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB52;

LAB53:
LAB54:    goto LAB31;

LAB13:    xsi_set_current_line(80, ng0);

LAB55:    xsi_set_current_line(80, ng0);
    t3 = ((char*)((ng20)));
    t7 = (t0 + 4056);
    xsi_vlogvar_assign_value(t7, t3, 0, 0, 5);
    goto LAB31;

LAB15:    xsi_set_current_line(81, ng0);

LAB56:    xsi_set_current_line(81, ng0);
    t3 = ((char*)((ng2)));
    t7 = (t0 + 4056);
    xsi_vlogvar_assign_value(t7, t3, 0, 0, 5);
    goto LAB31;

LAB17:    xsi_set_current_line(82, ng0);

LAB57:    xsi_set_current_line(82, ng0);
    t3 = ((char*)((ng21)));
    t7 = (t0 + 4056);
    xsi_vlogvar_assign_value(t7, t3, 0, 0, 5);
    goto LAB31;

LAB19:    xsi_set_current_line(83, ng0);

LAB58:    xsi_set_current_line(83, ng0);
    t3 = (t0 + 2104);
    t7 = *((char **)t3);
    t3 = (t0 + 4056);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 5);
    goto LAB31;

LAB21:    xsi_set_current_line(84, ng0);

LAB59:    xsi_set_current_line(84, ng0);
    t3 = (t0 + 2240);
    t7 = *((char **)t3);
    t3 = (t0 + 4056);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 5);
    goto LAB31;

LAB23:    xsi_set_current_line(87, ng0);

LAB60:    xsi_set_current_line(87, ng0);
    t3 = (t0 + 2512);
    t7 = *((char **)t3);
    t3 = (t0 + 4056);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 5);
    goto LAB31;

LAB25:    xsi_set_current_line(88, ng0);

LAB61:    xsi_set_current_line(88, ng0);
    t3 = (t0 + 2648);
    t7 = *((char **)t3);
    t3 = (t0 + 4056);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 5);
    goto LAB31;

LAB27:    xsi_set_current_line(89, ng0);

LAB62:    xsi_set_current_line(89, ng0);
    t3 = (t0 + 2784);
    t7 = *((char **)t3);
    t3 = (t0 + 4056);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 5);
    goto LAB31;

LAB36:    xsi_set_current_line(69, ng0);
    t7 = ((char*)((ng8)));
    t8 = (t0 + 4056);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 5);
    goto LAB54;

LAB38:    xsi_set_current_line(70, ng0);
    t3 = ((char*)((ng10)));
    t7 = (t0 + 4056);
    xsi_vlogvar_assign_value(t7, t3, 0, 0, 5);
    goto LAB54;

LAB40:    xsi_set_current_line(71, ng0);
    t3 = ((char*)((ng5)));
    t7 = (t0 + 4056);
    xsi_vlogvar_assign_value(t7, t3, 0, 0, 5);
    goto LAB54;

LAB42:    xsi_set_current_line(72, ng0);
    t3 = ((char*)((ng6)));
    t7 = (t0 + 4056);
    xsi_vlogvar_assign_value(t7, t3, 0, 0, 5);
    goto LAB54;

LAB44:    xsi_set_current_line(73, ng0);
    t3 = ((char*)((ng1)));
    t7 = (t0 + 4056);
    xsi_vlogvar_assign_value(t7, t3, 0, 0, 5);
    goto LAB54;

LAB46:    xsi_set_current_line(74, ng0);
    t3 = ((char*)((ng15)));
    t7 = (t0 + 4056);
    xsi_vlogvar_assign_value(t7, t3, 0, 0, 5);
    goto LAB54;

LAB48:    xsi_set_current_line(75, ng0);
    t3 = ((char*)((ng9)));
    t7 = (t0 + 4056);
    xsi_vlogvar_assign_value(t7, t3, 0, 0, 5);
    goto LAB54;

LAB50:    xsi_set_current_line(76, ng0);
    t3 = ((char*)((ng18)));
    t7 = (t0 + 4056);
    xsi_vlogvar_assign_value(t7, t3, 0, 0, 5);
    goto LAB54;

LAB52:    xsi_set_current_line(77, ng0);
    t3 = (t0 + 2376);
    t7 = *((char **)t3);
    t3 = (t0 + 4056);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 5);
    goto LAB54;

}


extern void work_m_00000000001900829277_3492611789_init()
{
	static char *pe[] = {(void *)Always_51_0,(void *)Always_61_1};
	xsi_register_didat("work_m_00000000001900829277_3492611789", "isim/TestBench_isim_beh.exe.sim/work/m_00000000001900829277_3492611789.didat");
	xsi_register_executes(pe);
}
