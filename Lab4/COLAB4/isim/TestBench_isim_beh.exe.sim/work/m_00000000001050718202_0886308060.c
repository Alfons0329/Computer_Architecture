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
static const char *ng0 = "D:/Users/afhwu0329/Desktop/Lab4/COLAB4/ALU.v";
static unsigned int ng1[] = {9U, 0U};
static int ng2[] = {0, 0};
static int ng3[] = {1, 0};
static unsigned int ng4[] = {10U, 0U};
static int ng5[] = {15, 0};
static int ng6[] = {16, 0};
static unsigned int ng7[] = {0U, 0U};
static unsigned int ng8[] = {1U, 0U};
static unsigned int ng9[] = {2U, 0U};
static unsigned int ng10[] = {3U, 0U};
static unsigned int ng11[] = {4U, 0U};
static unsigned int ng12[] = {5U, 0U};
static unsigned int ng13[] = {6U, 0U};
static unsigned int ng14[] = {7U, 0U};
static int ng15[] = {65536, 0};
static unsigned int ng16[] = {8U, 0U};
static unsigned int ng17[] = {11U, 0U};
static int ng18[] = {12, 0};
static int ng19[] = {13, 0};
static int ng20[] = {14, 0};



static void Always_35_0(char *t0)
{
    char t13[8];
    char t35[8];
    char t36[8];
    char t41[8];
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
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    char *t56;
    char *t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    char *t63;
    char *t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    char *t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    char *t73;
    char *t74;

LAB0:    t1 = (t0 + 3488U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 4056);
    *((int *)t2) = 1;
    t3 = (t0 + 3520);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(36, ng0);

LAB5:    xsi_set_current_line(37, ng0);
    t4 = (t0 + 1688U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(54, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2248);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(38, ng0);

LAB9:    xsi_set_current_line(39, ng0);
    t11 = (t0 + 1368U);
    t12 = *((char **)t11);
    t11 = ((char*)((ng1)));
    memset(t13, 0, 8);
    t14 = (t12 + 4);
    t15 = (t11 + 4);
    t16 = *((unsigned int *)t12);
    t17 = *((unsigned int *)t11);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB13;

LAB10:    if (t25 != 0)
        goto LAB12;

LAB11:    *((unsigned int *)t13) = 1;

LAB13:    t29 = (t13 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (~(t30));
    t32 = *((unsigned int *)t13);
    t33 = (t32 & t31);
    t34 = (t33 != 0);
    if (t34 > 0)
        goto LAB14;

LAB15:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t13, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t16 = (t9 ^ t10);
    t17 = (t8 | t16);
    t18 = *((unsigned int *)t4);
    t19 = *((unsigned int *)t5);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB37;

LAB34:    if (t20 != 0)
        goto LAB36;

LAB35:    *((unsigned int *)t13) = 1;

LAB37:    t12 = (t13 + 4);
    t23 = *((unsigned int *)t12);
    t24 = (~(t23));
    t25 = *((unsigned int *)t13);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB38;

LAB39:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng5)));
    memset(t13, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t16 = (t9 ^ t10);
    t17 = (t8 | t16);
    t18 = *((unsigned int *)t4);
    t19 = *((unsigned int *)t5);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB61;

LAB58:    if (t20 != 0)
        goto LAB60;

LAB59:    *((unsigned int *)t13) = 1;

LAB61:    t12 = (t13 + 4);
    t23 = *((unsigned int *)t12);
    t24 = (~(t23));
    t25 = *((unsigned int *)t13);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB62;

LAB63:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng6)));
    memset(t13, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t16 = (t9 ^ t10);
    t17 = (t8 | t16);
    t18 = *((unsigned int *)t4);
    t19 = *((unsigned int *)t5);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB86;

LAB83:    if (t20 != 0)
        goto LAB85;

LAB84:    *((unsigned int *)t13) = 1;

LAB86:    t12 = (t13 + 4);
    t23 = *((unsigned int *)t12);
    t24 = (~(t23));
    t25 = *((unsigned int *)t13);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB87;

LAB88:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng5)));
    memset(t13, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t16 = (t9 ^ t10);
    t17 = (t8 | t16);
    t18 = *((unsigned int *)t4);
    t19 = *((unsigned int *)t5);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB111;

LAB108:    if (t20 != 0)
        goto LAB110;

LAB109:    *((unsigned int *)t13) = 1;

LAB111:    t12 = (t13 + 4);
    t23 = *((unsigned int *)t12);
    t24 = (~(t23));
    t25 = *((unsigned int *)t13);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB112;

LAB113:    xsi_set_current_line(51, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2248);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB114:
LAB89:
LAB64:
LAB40:
LAB16:    goto LAB8;

LAB12:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB13;

LAB14:    xsi_set_current_line(40, ng0);
    t37 = (t0 + 2088);
    t38 = (t37 + 56U);
    t39 = *((char **)t38);
    t40 = ((char*)((ng2)));
    memset(t41, 0, 8);
    t42 = (t39 + 4);
    t43 = (t40 + 4);
    t44 = *((unsigned int *)t39);
    t45 = *((unsigned int *)t40);
    t46 = (t44 ^ t45);
    t47 = *((unsigned int *)t42);
    t48 = *((unsigned int *)t43);
    t49 = (t47 ^ t48);
    t50 = (t46 | t49);
    t51 = *((unsigned int *)t42);
    t52 = *((unsigned int *)t43);
    t53 = (t51 | t52);
    t54 = (~(t53));
    t55 = (t50 & t54);
    if (t55 != 0)
        goto LAB20;

LAB17:    if (t53 != 0)
        goto LAB19;

LAB18:    *((unsigned int *)t41) = 1;

LAB20:    memset(t36, 0, 8);
    t57 = (t41 + 4);
    t58 = *((unsigned int *)t57);
    t59 = (~(t58));
    t60 = *((unsigned int *)t41);
    t61 = (t60 & t59);
    t62 = (t61 & 1U);
    if (t62 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t57) != 0)
        goto LAB23;

LAB24:    t64 = (t36 + 4);
    t65 = *((unsigned int *)t36);
    t66 = *((unsigned int *)t64);
    t67 = (t65 || t66);
    if (t67 > 0)
        goto LAB25;

LAB26:    t69 = *((unsigned int *)t36);
    t70 = (~(t69));
    t71 = *((unsigned int *)t64);
    t72 = (t70 || t71);
    if (t72 > 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t64) > 0)
        goto LAB29;

LAB30:    if (*((unsigned int *)t36) > 0)
        goto LAB31;

LAB32:    memcpy(t35, t73, 8);

LAB33:    t74 = (t0 + 2248);
    xsi_vlogvar_assign_value(t74, t35, 0, 0, 1);
    goto LAB16;

LAB19:    t56 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t56) = 1;
    goto LAB20;

LAB21:    *((unsigned int *)t36) = 1;
    goto LAB24;

LAB23:    t63 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t63) = 1;
    goto LAB24;

LAB25:    t68 = ((char*)((ng3)));
    goto LAB26;

LAB27:    t73 = ((char*)((ng2)));
    goto LAB28;

LAB29:    xsi_vlog_unsigned_bit_combine(t35, 32, t68, 32, t73, 32);
    goto LAB33;

LAB31:    memcpy(t35, t68, 8);
    goto LAB33;

LAB36:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB37;

LAB38:    xsi_set_current_line(42, ng0);
    t14 = (t0 + 2088);
    t15 = (t14 + 56U);
    t28 = *((char **)t15);
    t29 = ((char*)((ng2)));
    memset(t41, 0, 8);
    t37 = (t28 + 4);
    t38 = (t29 + 4);
    t30 = *((unsigned int *)t28);
    t31 = *((unsigned int *)t29);
    t32 = (t30 ^ t31);
    t33 = *((unsigned int *)t37);
    t34 = *((unsigned int *)t38);
    t44 = (t33 ^ t34);
    t45 = (t32 | t44);
    t46 = *((unsigned int *)t37);
    t47 = *((unsigned int *)t38);
    t48 = (t46 | t47);
    t49 = (~(t48));
    t50 = (t45 & t49);
    if (t50 != 0)
        goto LAB44;

LAB41:    if (t48 != 0)
        goto LAB43;

LAB42:    *((unsigned int *)t41) = 1;

LAB44:    memset(t36, 0, 8);
    t40 = (t41 + 4);
    t51 = *((unsigned int *)t40);
    t52 = (~(t51));
    t53 = *((unsigned int *)t41);
    t54 = (t53 & t52);
    t55 = (t54 & 1U);
    if (t55 != 0)
        goto LAB45;

LAB46:    if (*((unsigned int *)t40) != 0)
        goto LAB47;

LAB48:    t43 = (t36 + 4);
    t58 = *((unsigned int *)t36);
    t59 = *((unsigned int *)t43);
    t60 = (t58 || t59);
    if (t60 > 0)
        goto LAB49;

LAB50:    t61 = *((unsigned int *)t36);
    t62 = (~(t61));
    t65 = *((unsigned int *)t43);
    t66 = (t62 || t65);
    if (t66 > 0)
        goto LAB51;

LAB52:    if (*((unsigned int *)t43) > 0)
        goto LAB53;

LAB54:    if (*((unsigned int *)t36) > 0)
        goto LAB55;

LAB56:    memcpy(t35, t57, 8);

LAB57:    t63 = (t0 + 2248);
    xsi_vlogvar_assign_value(t63, t35, 0, 0, 1);
    goto LAB40;

LAB43:    t39 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t39) = 1;
    goto LAB44;

LAB45:    *((unsigned int *)t36) = 1;
    goto LAB48;

LAB47:    t42 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t42) = 1;
    goto LAB48;

LAB49:    t56 = ((char*)((ng2)));
    goto LAB50;

LAB51:    t57 = ((char*)((ng3)));
    goto LAB52;

LAB53:    xsi_vlog_unsigned_bit_combine(t35, 32, t56, 32, t57, 32);
    goto LAB57;

LAB55:    memcpy(t35, t56, 8);
    goto LAB57;

LAB60:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB61;

LAB62:    xsi_set_current_line(45, ng0);
    t14 = (t0 + 1048U);
    t15 = *((char **)t14);
    t14 = (t0 + 1208U);
    t28 = *((char **)t14);
    memset(t41, 0, 8);
    t14 = (t15 + 4);
    if (*((unsigned int *)t14) != 0)
        goto LAB66;

LAB65:    t29 = (t28 + 4);
    if (*((unsigned int *)t29) != 0)
        goto LAB66;

LAB69:    if (*((unsigned int *)t15) > *((unsigned int *)t28))
        goto LAB68;

LAB67:    *((unsigned int *)t41) = 1;

LAB68:    memset(t36, 0, 8);
    t38 = (t41 + 4);
    t30 = *((unsigned int *)t38);
    t31 = (~(t30));
    t32 = *((unsigned int *)t41);
    t33 = (t32 & t31);
    t34 = (t33 & 1U);
    if (t34 != 0)
        goto LAB70;

LAB71:    if (*((unsigned int *)t38) != 0)
        goto LAB72;

LAB73:    t40 = (t36 + 4);
    t44 = *((unsigned int *)t36);
    t45 = *((unsigned int *)t40);
    t46 = (t44 || t45);
    if (t46 > 0)
        goto LAB74;

LAB75:    t47 = *((unsigned int *)t36);
    t48 = (~(t47));
    t49 = *((unsigned int *)t40);
    t50 = (t48 || t49);
    if (t50 > 0)
        goto LAB76;

LAB77:    if (*((unsigned int *)t40) > 0)
        goto LAB78;

LAB79:    if (*((unsigned int *)t36) > 0)
        goto LAB80;

LAB81:    memcpy(t35, t43, 8);

LAB82:    t56 = (t0 + 2248);
    xsi_vlogvar_assign_value(t56, t35, 0, 0, 1);
    goto LAB64;

LAB66:    t37 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t37) = 1;
    goto LAB68;

LAB70:    *((unsigned int *)t36) = 1;
    goto LAB73;

LAB72:    t39 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t39) = 1;
    goto LAB73;

LAB74:    t42 = ((char*)((ng3)));
    goto LAB75;

LAB76:    t43 = ((char*)((ng2)));
    goto LAB77;

LAB78:    xsi_vlog_unsigned_bit_combine(t35, 32, t42, 32, t43, 32);
    goto LAB82;

LAB80:    memcpy(t35, t42, 8);
    goto LAB82;

LAB85:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB86;

LAB87:    xsi_set_current_line(47, ng0);
    t14 = (t0 + 1048U);
    t15 = *((char **)t14);
    t14 = (t0 + 1208U);
    t28 = *((char **)t14);
    memset(t41, 0, 8);
    t14 = (t15 + 4);
    if (*((unsigned int *)t14) != 0)
        goto LAB91;

LAB90:    t29 = (t28 + 4);
    if (*((unsigned int *)t29) != 0)
        goto LAB91;

LAB94:    if (*((unsigned int *)t15) < *((unsigned int *)t28))
        goto LAB92;

LAB93:    memset(t36, 0, 8);
    t38 = (t41 + 4);
    t30 = *((unsigned int *)t38);
    t31 = (~(t30));
    t32 = *((unsigned int *)t41);
    t33 = (t32 & t31);
    t34 = (t33 & 1U);
    if (t34 != 0)
        goto LAB95;

LAB96:    if (*((unsigned int *)t38) != 0)
        goto LAB97;

LAB98:    t40 = (t36 + 4);
    t44 = *((unsigned int *)t36);
    t45 = *((unsigned int *)t40);
    t46 = (t44 || t45);
    if (t46 > 0)
        goto LAB99;

LAB100:    t47 = *((unsigned int *)t36);
    t48 = (~(t47));
    t49 = *((unsigned int *)t40);
    t50 = (t48 || t49);
    if (t50 > 0)
        goto LAB101;

LAB102:    if (*((unsigned int *)t40) > 0)
        goto LAB103;

LAB104:    if (*((unsigned int *)t36) > 0)
        goto LAB105;

LAB106:    memcpy(t35, t43, 8);

LAB107:    t56 = (t0 + 2248);
    xsi_vlogvar_assign_value(t56, t35, 0, 0, 1);
    goto LAB89;

LAB91:    t37 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t37) = 1;
    goto LAB93;

LAB92:    *((unsigned int *)t41) = 1;
    goto LAB93;

LAB95:    *((unsigned int *)t36) = 1;
    goto LAB98;

LAB97:    t39 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t39) = 1;
    goto LAB98;

LAB99:    t42 = ((char*)((ng3)));
    goto LAB100;

LAB101:    t43 = ((char*)((ng2)));
    goto LAB102;

LAB103:    xsi_vlog_unsigned_bit_combine(t35, 32, t42, 32, t43, 32);
    goto LAB107;

LAB105:    memcpy(t35, t42, 8);
    goto LAB107;

LAB110:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB111;

LAB112:    xsi_set_current_line(49, ng0);
    t14 = (t0 + 1048U);
    t15 = *((char **)t14);
    t14 = ((char*)((ng2)));
    memset(t41, 0, 8);
    t28 = (t15 + 4);
    t29 = (t14 + 4);
    t30 = *((unsigned int *)t15);
    t31 = *((unsigned int *)t14);
    t32 = (t30 ^ t31);
    t33 = *((unsigned int *)t28);
    t34 = *((unsigned int *)t29);
    t44 = (t33 ^ t34);
    t45 = (t32 | t44);
    t46 = *((unsigned int *)t28);
    t47 = *((unsigned int *)t29);
    t48 = (t46 | t47);
    t49 = (~(t48));
    t50 = (t45 & t49);
    if (t50 != 0)
        goto LAB116;

LAB115:    if (t48 != 0)
        goto LAB117;

LAB118:    memset(t36, 0, 8);
    t38 = (t41 + 4);
    t51 = *((unsigned int *)t38);
    t52 = (~(t51));
    t53 = *((unsigned int *)t41);
    t54 = (t53 & t52);
    t55 = (t54 & 1U);
    if (t55 != 0)
        goto LAB119;

LAB120:    if (*((unsigned int *)t38) != 0)
        goto LAB121;

LAB122:    t40 = (t36 + 4);
    t58 = *((unsigned int *)t36);
    t59 = *((unsigned int *)t40);
    t60 = (t58 || t59);
    if (t60 > 0)
        goto LAB123;

LAB124:    t61 = *((unsigned int *)t36);
    t62 = (~(t61));
    t65 = *((unsigned int *)t40);
    t66 = (t62 || t65);
    if (t66 > 0)
        goto LAB125;

LAB126:    if (*((unsigned int *)t40) > 0)
        goto LAB127;

LAB128:    if (*((unsigned int *)t36) > 0)
        goto LAB129;

LAB130:    memcpy(t35, t43, 8);

LAB131:    t56 = (t0 + 2248);
    xsi_vlogvar_assign_value(t56, t35, 0, 0, 1);
    goto LAB114;

LAB116:    *((unsigned int *)t41) = 1;
    goto LAB118;

LAB117:    t37 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t37) = 1;
    goto LAB118;

LAB119:    *((unsigned int *)t36) = 1;
    goto LAB122;

LAB121:    t39 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t39) = 1;
    goto LAB122;

LAB123:    t42 = ((char*)((ng3)));
    goto LAB124;

LAB125:    t43 = ((char*)((ng2)));
    goto LAB126;

LAB127:    xsi_vlog_unsigned_bit_combine(t35, 32, t42, 32, t43, 32);
    goto LAB131;

LAB129:    memcpy(t35, t42, 8);
    goto LAB131;

}

static void Always_58_1(char *t0)
{
    char t17[8];
    char t40[8];
    char t41[8];
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
    int t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    int t31;
    int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    char *t42;
    char *t43;
    char *t44;

LAB0:    t1 = (t0 + 3736U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 4072);
    *((int *)t2) = 1;
    t3 = (t0 + 3768);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(59, ng0);

LAB5:    xsi_set_current_line(60, ng0);
    t4 = (t0 + 1688U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(83, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(61, ng0);

LAB9:    xsi_set_current_line(62, ng0);
    t11 = (t0 + 1368U);
    t12 = *((char **)t11);

LAB10:    t11 = ((char*)((ng7)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t11, 32);
    if (t13 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng8)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t2, 32);
    if (t13 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng9)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t2, 32);
    if (t13 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng10)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t2, 32);
    if (t13 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng11)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t2, 32);
    if (t13 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng12)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t2, 32);
    if (t13 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng13)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t2, 32);
    if (t13 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng14)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t2, 32);
    if (t13 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng16)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t2, 32);
    if (t13 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng1)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t2, 32);
    if (t13 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng4)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t2, 32);
    if (t13 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng17)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t2, 32);
    if (t13 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng18)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t2, 32);
    if (t13 == 1)
        goto LAB35;

LAB36:    t2 = ((char*)((ng19)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t2, 32);
    if (t13 == 1)
        goto LAB37;

LAB38:    t2 = ((char*)((ng20)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t2, 32);
    if (t13 == 1)
        goto LAB39;

LAB40:
LAB42:
LAB41:    xsi_set_current_line(79, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB43:    goto LAB8;

LAB11:    xsi_set_current_line(63, ng0);
    t14 = (t0 + 1048U);
    t15 = *((char **)t14);
    t14 = (t0 + 1208U);
    t16 = *((char **)t14);
    memset(t17, 0, 8);
    xsi_vlog_unsigned_add(t17, 32, t15, 32, t16, 32);
    t14 = (t0 + 2088);
    xsi_vlogvar_assign_value(t14, t17, 0, 0, 32);
    goto LAB43;

LAB13:    xsi_set_current_line(64, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t5 = *((char **)t3);
    memset(t17, 0, 8);
    xsi_vlog_unsigned_minus(t17, 32, t4, 32, t5, 32);
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t17, 0, 0, 32);
    goto LAB43;

LAB15:    xsi_set_current_line(65, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t5 = *((char **)t3);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 & t7);
    *((unsigned int *)t17) = t8;
    t3 = (t4 + 4);
    t11 = (t5 + 4);
    t14 = (t17 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t11);
    t18 = (t9 | t10);
    *((unsigned int *)t14) = t18;
    t19 = *((unsigned int *)t14);
    t20 = (t19 != 0);
    if (t20 == 1)
        goto LAB44;

LAB45:
LAB46:    t39 = (t0 + 2088);
    xsi_vlogvar_assign_value(t39, t17, 0, 0, 32);
    goto LAB43;

LAB17:    xsi_set_current_line(66, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t5 = *((char **)t3);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 | t7);
    *((unsigned int *)t17) = t8;
    t3 = (t4 + 4);
    t11 = (t5 + 4);
    t14 = (t17 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t11);
    t18 = (t9 | t10);
    *((unsigned int *)t14) = t18;
    t19 = *((unsigned int *)t14);
    t20 = (t19 != 0);
    if (t20 == 1)
        goto LAB47;

LAB48:
LAB49:    t39 = (t0 + 2088);
    xsi_vlogvar_assign_value(t39, t17, 0, 0, 32);
    goto LAB43;

LAB19:    xsi_set_current_line(67, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t5 = *((char **)t3);
    memset(t41, 0, 8);
    t3 = (t4 + 4);
    if (*((unsigned int *)t3) != 0)
        goto LAB51;

LAB50:    t11 = (t5 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB51;

LAB54:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB52;

LAB53:    memset(t40, 0, 8);
    t15 = (t41 + 4);
    t6 = *((unsigned int *)t15);
    t7 = (~(t6));
    t8 = *((unsigned int *)t41);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB55;

LAB56:    if (*((unsigned int *)t15) != 0)
        goto LAB57;

LAB58:    t39 = (t40 + 4);
    t18 = *((unsigned int *)t40);
    t19 = *((unsigned int *)t39);
    t20 = (t18 || t19);
    if (t20 > 0)
        goto LAB59;

LAB60:    t21 = *((unsigned int *)t40);
    t22 = (~(t21));
    t23 = *((unsigned int *)t39);
    t24 = (t22 || t23);
    if (t24 > 0)
        goto LAB61;

LAB62:    if (*((unsigned int *)t39) > 0)
        goto LAB63;

LAB64:    if (*((unsigned int *)t40) > 0)
        goto LAB65;

LAB66:    memcpy(t17, t43, 8);

LAB67:    t44 = (t0 + 2088);
    xsi_vlogvar_assign_value(t44, t17, 0, 0, 32);
    goto LAB43;

LAB21:    xsi_set_current_line(68, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t5 = *((char **)t3);
    memset(t41, 0, 8);
    t3 = (t4 + 4);
    if (*((unsigned int *)t3) != 0)
        goto LAB69;

LAB68:    t11 = (t5 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB69;

LAB72:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB70;

LAB71:    memset(t40, 0, 8);
    t15 = (t41 + 4);
    t6 = *((unsigned int *)t15);
    t7 = (~(t6));
    t8 = *((unsigned int *)t41);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB73;

LAB74:    if (*((unsigned int *)t15) != 0)
        goto LAB75;

LAB76:    t39 = (t40 + 4);
    t18 = *((unsigned int *)t40);
    t19 = *((unsigned int *)t39);
    t20 = (t18 || t19);
    if (t20 > 0)
        goto LAB77;

LAB78:    t21 = *((unsigned int *)t40);
    t22 = (~(t21));
    t23 = *((unsigned int *)t39);
    t24 = (t22 || t23);
    if (t24 > 0)
        goto LAB79;

LAB80:    if (*((unsigned int *)t39) > 0)
        goto LAB81;

LAB82:    if (*((unsigned int *)t40) > 0)
        goto LAB83;

LAB84:    memcpy(t17, t43, 8);

LAB85:    t44 = (t0 + 2088);
    xsi_vlogvar_assign_value(t44, t17, 0, 0, 32);
    goto LAB43;

LAB23:    xsi_set_current_line(69, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    t3 = (t0 + 1528U);
    t5 = *((char **)t3);
    memset(t17, 0, 8);
    xsi_vlog_unsigned_lshift(t17, 32, t4, 32, t5, 5);
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t17, 0, 0, 32);
    goto LAB43;

LAB25:    xsi_set_current_line(70, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng15)));
    memset(t17, 0, 8);
    xsi_vlog_unsigned_multiply(t17, 32, t4, 32, t3, 32);
    t5 = (t0 + 2088);
    xsi_vlogvar_assign_value(t5, t17, 0, 0, 32);
    goto LAB43;

LAB27:    xsi_set_current_line(71, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t5 = *((char **)t3);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 | t7);
    *((unsigned int *)t17) = t8;
    t3 = (t4 + 4);
    t11 = (t5 + 4);
    t14 = (t17 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t11);
    t18 = (t9 | t10);
    *((unsigned int *)t14) = t18;
    t19 = *((unsigned int *)t14);
    t20 = (t19 != 0);
    if (t20 == 1)
        goto LAB86;

LAB87:
LAB88:    t39 = (t0 + 2088);
    xsi_vlogvar_assign_value(t39, t17, 0, 0, 32);
    goto LAB43;

LAB29:    xsi_set_current_line(72, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t5 = *((char **)t3);
    memset(t17, 0, 8);
    xsi_vlog_unsigned_minus(t17, 32, t4, 32, t5, 32);
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t17, 0, 0, 32);
    goto LAB43;

LAB31:    xsi_set_current_line(73, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t5 = *((char **)t3);
    memset(t17, 0, 8);
    xsi_vlog_unsigned_minus(t17, 32, t4, 32, t5, 32);
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t17, 0, 0, 32);
    goto LAB43;

LAB33:    xsi_set_current_line(74, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    t3 = (t0 + 1048U);
    t5 = *((char **)t3);
    memset(t17, 0, 8);
    xsi_vlog_unsigned_lshift(t17, 32, t4, 32, t5, 32);
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t17, 0, 0, 32);
    goto LAB43;

LAB35:    xsi_set_current_line(76, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t5 = *((char **)t3);
    memset(t17, 0, 8);
    xsi_vlog_unsigned_add(t17, 32, t4, 32, t5, 32);
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t17, 0, 0, 32);
    goto LAB43;

LAB37:    xsi_set_current_line(77, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t5 = *((char **)t3);
    memset(t17, 0, 8);
    xsi_vlog_unsigned_add(t17, 32, t4, 32, t5, 32);
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t17, 0, 0, 32);
    goto LAB43;

LAB39:    xsi_set_current_line(78, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t5 = *((char **)t3);
    memset(t17, 0, 8);
    xsi_vlog_unsigned_multiply(t17, 32, t4, 32, t5, 32);
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t17, 0, 0, 32);
    goto LAB43;

LAB44:    t21 = *((unsigned int *)t17);
    t22 = *((unsigned int *)t14);
    *((unsigned int *)t17) = (t21 | t22);
    t15 = (t4 + 4);
    t16 = (t5 + 4);
    t23 = *((unsigned int *)t4);
    t24 = (~(t23));
    t25 = *((unsigned int *)t15);
    t26 = (~(t25));
    t27 = *((unsigned int *)t5);
    t28 = (~(t27));
    t29 = *((unsigned int *)t16);
    t30 = (~(t29));
    t31 = (t24 & t26);
    t32 = (t28 & t30);
    t33 = (~(t31));
    t34 = (~(t32));
    t35 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t35 & t33);
    t36 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t36 & t34);
    t37 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t37 & t33);
    t38 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t38 & t34);
    goto LAB46;

LAB47:    t21 = *((unsigned int *)t17);
    t22 = *((unsigned int *)t14);
    *((unsigned int *)t17) = (t21 | t22);
    t15 = (t4 + 4);
    t16 = (t5 + 4);
    t23 = *((unsigned int *)t15);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t31 = (t25 & t24);
    t26 = *((unsigned int *)t16);
    t27 = (~(t26));
    t28 = *((unsigned int *)t5);
    t32 = (t28 & t27);
    t29 = (~(t31));
    t30 = (~(t32));
    t33 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t33 & t29);
    t34 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t34 & t30);
    goto LAB49;

LAB51:    t14 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB53;

LAB52:    *((unsigned int *)t41) = 1;
    goto LAB53;

LAB55:    *((unsigned int *)t40) = 1;
    goto LAB58;

LAB57:    t16 = (t40 + 4);
    *((unsigned int *)t40) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB58;

LAB59:    t42 = ((char*)((ng3)));
    goto LAB60;

LAB61:    t43 = ((char*)((ng2)));
    goto LAB62;

LAB63:    xsi_vlog_unsigned_bit_combine(t17, 32, t42, 32, t43, 32);
    goto LAB67;

LAB65:    memcpy(t17, t42, 8);
    goto LAB67;

LAB69:    t14 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB71;

LAB70:    *((unsigned int *)t41) = 1;
    goto LAB71;

LAB73:    *((unsigned int *)t40) = 1;
    goto LAB76;

LAB75:    t16 = (t40 + 4);
    *((unsigned int *)t40) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB76;

LAB77:    t42 = ((char*)((ng3)));
    goto LAB78;

LAB79:    t43 = ((char*)((ng2)));
    goto LAB80;

LAB81:    xsi_vlog_unsigned_bit_combine(t17, 32, t42, 32, t43, 32);
    goto LAB85;

LAB83:    memcpy(t17, t42, 8);
    goto LAB85;

LAB86:    t21 = *((unsigned int *)t17);
    t22 = *((unsigned int *)t14);
    *((unsigned int *)t17) = (t21 | t22);
    t15 = (t4 + 4);
    t16 = (t5 + 4);
    t23 = *((unsigned int *)t15);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t31 = (t25 & t24);
    t26 = *((unsigned int *)t16);
    t27 = (~(t26));
    t28 = *((unsigned int *)t5);
    t32 = (t28 & t27);
    t29 = (~(t31));
    t30 = (~(t32));
    t33 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t33 & t29);
    t34 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t34 & t30);
    goto LAB88;

}


extern void work_m_00000000001050718202_0886308060_init()
{
	static char *pe[] = {(void *)Always_35_0,(void *)Always_58_1};
	xsi_register_didat("work_m_00000000001050718202_0886308060", "isim/TestBench_isim_beh.exe.sim/work/m_00000000001050718202_0886308060.didat");
	xsi_register_executes(pe);
}
