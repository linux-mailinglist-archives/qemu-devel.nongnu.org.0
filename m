Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 941D3225F0
	for <lists+qemu-devel@lfdr.de>; Sun, 19 May 2019 06:33:07 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSDVS-0007PV-N9
	for lists+qemu-devel@lfdr.de; Sun, 19 May 2019 00:33:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hSDSl-0005xg-Lh
	for qemu-devel@nongnu.org; Sun, 19 May 2019 00:30:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hSDEV-0004oC-6L
	for qemu-devel@nongnu.org; Sun, 19 May 2019 00:15:36 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:34026)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hSDEU-0004nI-UN
	for qemu-devel@nongnu.org; Sun, 19 May 2019 00:15:35 -0400
Received: by mail-pg1-x543.google.com with SMTP id c13so5162668pgt.1
	for <qemu-devel@nongnu.org>; Sat, 18 May 2019 21:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i1NgkQuZk10k1ceiKaxM9hxXyQyjYikTQa3PtpV7vqI=;
	b=RaKTvM87jfK7kpIweYbfN59cIiK5mmwsgMEK3bQKV/S7j943ZUbXrWSK4+vwkoxSCr
	3rsS4hWRif0iFD78PnWJPTnEQoGSlleCCTsIdBAKpYKbW8E7wNzPOs7nhT4d9xV1VlaF
	cp7qY0VCRB1+46xpHERqH8SBfBBH9vL35TTyVA5wGQbEGcYauWXp94g2kvxf8kvE/nEC
	ihlOnmA6OiOotGTRXqDrvuf/xHXw9pT4VeX6HD1K4SqAU+CrEFJ4EPJIewdnl/v3Mqdc
	Hi66oFqLvrSHSIK/fRlRy++oWiqdsCf1wGJTqnFyZC1Hd03aVgH0vjuUf6KLHBwR0nEY
	DVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=i1NgkQuZk10k1ceiKaxM9hxXyQyjYikTQa3PtpV7vqI=;
	b=r4FNNTbK3PDdNnRojKQvP2TI9V5TJpfDG+yUfcJr0PC3yoRLG348ZMrMaI0bGT+Uge
	wnrjtU1D5uiTDNW+XhSkK+VF8gdPmsbthag1ZWhvFqNfgl1IQ0VchFLMU3hhAfslOvnn
	1L/GalgRkgUDr/gVa+p11ukZPFlbobzdyYH9oCwHHWAER0DvTOKVajQL2hLAAQmUNvaD
	lKXXZfKuTp6NNcrn/iT+LpmdJ75hzO5aNMOETU9WStmkJqw4Wu67YgQmEMOblrLfd73b
	M/V3Egvwpf/DLGnMLsOD1a2xg3cXLHmdDmiqiaA2faOHTbyJ97KobHtaEEl70soTb1MU
	yBmA==
X-Gm-Message-State: APjAAAWl6KuamtfeVgem+D8yQ1866ARIlo7QignFda/1MiUt90aOskzr
	JzWXk3w8etUXbYp7KTY3AmPZzmtXxtY=
X-Google-Smtp-Source: APXvYqxCHK2O+PfzuhCArKSiZIOCNOZrGIww3N7XxHV9V7XNHbJxJzSWJcxd1cyODU2UnMzb4D3dLg==
X-Received: by 2002:a63:6988:: with SMTP id
	e130mr68362551pgc.150.1558239332094; 
	Sat, 18 May 2019 21:15:32 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231]) by smtp.gmail.com with ESMTPSA id
	k63sm19381200pfb.108.2019.05.18.21.15.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 May 2019 21:15:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 18 May 2019 21:15:21 -0700
Message-Id: <20190519041522.12327-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190519041522.12327-1-richard.henderson@linaro.org>
References: <20190519041522.12327-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-devel] [PATCH v4 6/7] tcg/ppc: Update vector support to v2.07
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mark.cave-ayland@ilande.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes single-word loads and stores, lots of double-word
arithmetic, and a few extra logical operations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.h     |   3 +-
 tcg/ppc/tcg-target.inc.c | 111 +++++++++++++++++++++++++++++++--------
 2 files changed, 91 insertions(+), 23 deletions(-)

diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index 40544f996d..b8355d0a56 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -61,6 +61,7 @@ typedef enum {
 extern bool have_isa_altivec;
 extern bool have_isa_2_06;
 extern bool have_isa_2_06_vsx;
+extern bool have_isa_2_07_vsx;
 extern bool have_isa_3_00;
 
 /* optional instructions automatically implemented */
@@ -147,7 +148,7 @@ extern bool have_isa_3_00;
 #define TCG_TARGET_HAS_v256             0
 
 #define TCG_TARGET_HAS_andc_vec         1
-#define TCG_TARGET_HAS_orc_vec          0
+#define TCG_TARGET_HAS_orc_vec          have_isa_2_07_vsx
 #define TCG_TARGET_HAS_not_vec          1
 #define TCG_TARGET_HAS_neg_vec          0
 #define TCG_TARGET_HAS_abs_vec          0
diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
index 6cb8c8f0eb..dedf0de04d 100644
--- a/tcg/ppc/tcg-target.inc.c
+++ b/tcg/ppc/tcg-target.inc.c
@@ -67,6 +67,7 @@ static tcg_insn_unit *tb_ret_addr;
 bool have_isa_altivec;
 bool have_isa_2_06;
 bool have_isa_2_06_vsx;
+bool have_isa_2_07_vsx;
 bool have_isa_3_00;
 
 #define HAVE_ISA_2_06  have_isa_2_06
@@ -473,10 +474,12 @@ static int tcg_target_const_match(tcg_target_long val, TCGType type,
 #define LVEWX      XO31(71)
 #define LXSDX      XO31(588)      /* v2.06 */
 #define LXVDSX     XO31(332)      /* v2.06 */
+#define LXSIWZX    XO31(12)       /* v2.07 */
 
 #define STVX       XO31(231)
 #define STVEWX     XO31(199)
 #define STXSDX     XO31(716)      /* v2.06 */
+#define STXSIWX    XO31(140)      /* v2.07 */
 
 #define VADDSBS    VX4(768)
 #define VADDUBS    VX4(512)
@@ -487,6 +490,7 @@ static int tcg_target_const_match(tcg_target_long val, TCGType type,
 #define VADDSWS    VX4(896)
 #define VADDUWS    VX4(640)
 #define VADDUWM    VX4(128)
+#define VADDUDM    VX4(192)       /* v2.07 */
 
 #define VSUBSBS    VX4(1792)
 #define VSUBUBS    VX4(1536)
@@ -497,47 +501,62 @@ static int tcg_target_const_match(tcg_target_long val, TCGType type,
 #define VSUBSWS    VX4(1920)
 #define VSUBUWS    VX4(1664)
 #define VSUBUWM    VX4(1152)
+#define VSUBUDM    VX4(1216)      /* v2.07 */
 
 #define VMAXSB     VX4(258)
 #define VMAXSH     VX4(322)
 #define VMAXSW     VX4(386)
+#define VMAXSD     VX4(450)       /* v2.07 */
 #define VMAXUB     VX4(2)
 #define VMAXUH     VX4(66)
 #define VMAXUW     VX4(130)
+#define VMAXUD     VX4(194)       /* v2.07 */
 #define VMINSB     VX4(770)
 #define VMINSH     VX4(834)
 #define VMINSW     VX4(898)
+#define VMINSD     VX4(962)       /* v2.07 */
 #define VMINUB     VX4(514)
 #define VMINUH     VX4(578)
 #define VMINUW     VX4(642)
+#define VMINUD     VX4(706)       /* v2.07 */
 
 #define VCMPEQUB   VX4(6)
 #define VCMPEQUH   VX4(70)
 #define VCMPEQUW   VX4(134)
+#define VCMPEQUD   VX4(199)       /* v2.07 */
 #define VCMPGTSB   VX4(774)
 #define VCMPGTSH   VX4(838)
 #define VCMPGTSW   VX4(902)
+#define VCMPGTSD   VX4(967)       /* v2.07 */
 #define VCMPGTUB   VX4(518)
 #define VCMPGTUH   VX4(582)
 #define VCMPGTUW   VX4(646)
+#define VCMPGTUD   VX4(711)       /* v2.07 */
 
 #define VSLB       VX4(260)
 #define VSLH       VX4(324)
 #define VSLW       VX4(388)
+#define VSLD       VX4(1476)      /* v2.07 */
 #define VSRB       VX4(516)
 #define VSRH       VX4(580)
 #define VSRW       VX4(644)
+#define VSRD       VX4(1732)      /* v2.07 */
 #define VSRAB      VX4(772)
 #define VSRAH      VX4(836)
 #define VSRAW      VX4(900)
+#define VSRAD      VX4(964)       /* v2.07 */
 #define VRLB       VX4(4)
 #define VRLH       VX4(68)
 #define VRLW       VX4(132)
+#define VRLD       VX4(196)       /* v2.07 */
 
 #define VMULEUB    VX4(520)
 #define VMULEUH    VX4(584)
+#define VMULEUW    VX4(648)       /* v2.07 */
 #define VMULOUB    VX4(8)
 #define VMULOUH    VX4(72)
+#define VMULOUW    VX4(136)       /* v2.07 */
+#define VMULUWM    VX4(137)       /* v2.07 */
 #define VMSUMUHM   VX4(38)
 
 #define VMRGHB     VX4(12)
@@ -555,6 +574,9 @@ static int tcg_target_const_match(tcg_target_long val, TCGType type,
 #define VNOR       VX4(1284)
 #define VOR        VX4(1156)
 #define VXOR       VX4(1220)
+#define VEQV       VX4(1668)      /* v2.07 */
+#define VNAND      VX4(1412)      /* v2.07 */
+#define VORC       VX4(1348)      /* v2.07 */
 
 #define VSPLTB     VX4(524)
 #define VSPLTH     VX4(588)
@@ -568,6 +590,11 @@ static int tcg_target_const_match(tcg_target_long val, TCGType type,
 #define XXPERMDI   (OPCD(60) | (10 << 3))   /* v2.06 */
 #define XXSEL      (OPCD(60) | (3 << 4))    /* v2.06 */
 
+#define MFVSRD     XO31(51)       /* v2.07 */
+#define MFVSRWZ    XO31(115)      /* v2.07 */
+#define MTVSRD     XO31(179)      /* v2.07 */
+#define MTVSRWZ    XO31(179)      /* v2.07 */
+
 #define RT(r) ((r)<<21)
 #define RS(r) ((r)<<21)
 #define RA(r) ((r)<<16)
@@ -700,7 +727,15 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
         if (ret < 32 && arg < 32) {
             tcg_out32(s, OR | SAB(arg, ret, arg));
             break;
-        } else if (ret < 32 || arg < 32) {
+        } else if (ret < 32 && have_isa_2_07_vsx) {
+            tcg_out32(s, (type == TCG_TYPE_I32 ? MFVSRWZ : MFVSRD)
+                      | VRT(arg) | RA(ret) | 1);
+            break;
+        } else if (arg < 32 && have_isa_2_07_vsx) {
+            tcg_out32(s, (type == TCG_TYPE_I32 ? MTVSRWZ : MTVSRD)
+                      | VRT(ret) | RA(arg) | 1);
+            break;
+        } else {
             /* Altivec does not support vector/integer moves.  */
             return false;
         }
@@ -1140,6 +1175,10 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret,
             tcg_out_mem_long(s, LWZ, LWZX, ret, base, offset);
             break;
         }
+        if (have_isa_2_07_vsx) {
+            tcg_out_mem_long(s, 0, LXSIWZX | 1, ret & 31, base, offset);
+            break;
+        }
         assert((offset & 3) == 0);
         tcg_out_mem_long(s, 0, LVEWX, ret & 31, base, offset);
         shift = (offset - 4) & 0xc;
@@ -1186,6 +1225,10 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
             tcg_out_mem_long(s, STW, STWX, arg, base, offset);
             break;
         }
+        if (have_isa_2_07_vsx) {
+            tcg_out_mem_long(s, 0, STXSIWX | 1, arg & 31, base, offset);
+            break;
+        }
         assert((offset & 3) == 0);
         shift = (offset - 4) & 0xc;
         if (shift) {
@@ -2921,26 +2964,37 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_andc_vec:
     case INDEX_op_not_vec:
         return 1;
+    case INDEX_op_orc_vec:
+        return have_isa_2_07_vsx;
     case INDEX_op_add_vec:
     case INDEX_op_sub_vec:
     case INDEX_op_smax_vec:
     case INDEX_op_smin_vec:
     case INDEX_op_umax_vec:
     case INDEX_op_umin_vec:
+    case INDEX_op_shlv_vec:
+    case INDEX_op_shrv_vec:
+    case INDEX_op_sarv_vec:
+        return vece <= MO_32 || have_isa_2_07_vsx;
     case INDEX_op_ssadd_vec:
     case INDEX_op_sssub_vec:
     case INDEX_op_usadd_vec:
     case INDEX_op_ussub_vec:
-    case INDEX_op_shlv_vec:
-    case INDEX_op_shrv_vec:
-    case INDEX_op_sarv_vec:
         return vece <= MO_32;
     case INDEX_op_cmp_vec:
-    case INDEX_op_mul_vec:
     case INDEX_op_shli_vec:
     case INDEX_op_shri_vec:
     case INDEX_op_sari_vec:
-        return vece <= MO_32 ? -1 : 0;
+        return vece <= MO_32 || have_isa_2_07_vsx ? -1 : 0;
+    case INDEX_op_mul_vec:
+        switch (vece) {
+        case MO_8:
+        case MO_16:
+            return -1;
+        case MO_32:
+            return have_isa_2_07_vsx ? 1 : -1;
+        }
+        return 0;
     case INDEX_op_bitsel_vec:
         return have_isa_2_06_vsx;
     default:
@@ -3045,28 +3099,28 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                            const TCGArg *args, const int *const_args)
 {
     static const uint32_t
-        add_op[4] = { VADDUBM, VADDUHM, VADDUWM, 0 },
-        sub_op[4] = { VSUBUBM, VSUBUHM, VSUBUWM, 0 },
-        eq_op[4]  = { VCMPEQUB, VCMPEQUH, VCMPEQUW, 0 },
-        gts_op[4] = { VCMPGTSB, VCMPGTSH, VCMPGTSW, 0 },
-        gtu_op[4] = { VCMPGTUB, VCMPGTUH, VCMPGTUW, 0 },
+        add_op[4] = { VADDUBM, VADDUHM, VADDUWM, VADDUDM },
+        sub_op[4] = { VSUBUBM, VSUBUHM, VSUBUWM, VSUBUDM },
+        eq_op[4]  = { VCMPEQUB, VCMPEQUH, VCMPEQUW, VCMPEQUD },
+        gts_op[4] = { VCMPGTSB, VCMPGTSH, VCMPGTSW, VCMPGTSD },
+        gtu_op[4] = { VCMPGTUB, VCMPGTUH, VCMPGTUW, VCMPGTUD },
         ssadd_op[4] = { VADDSBS, VADDSHS, VADDSWS, 0 },
         usadd_op[4] = { VADDUBS, VADDUHS, VADDUWS, 0 },
         sssub_op[4] = { VSUBSBS, VSUBSHS, VSUBSWS, 0 },
         ussub_op[4] = { VSUBUBS, VSUBUHS, VSUBUWS, 0 },
-        umin_op[4] = { VMINUB, VMINUH, VMINUW, 0 },
-        smin_op[4] = { VMINSB, VMINSH, VMINSW, 0 },
-        umax_op[4] = { VMAXUB, VMAXUH, VMAXUW, 0 },
-        smax_op[4] = { VMAXSB, VMAXSH, VMAXSW, 0 },
-        shlv_op[4] = { VSLB, VSLH, VSLW, 0 },
-        shrv_op[4] = { VSRB, VSRH, VSRW, 0 },
-        sarv_op[4] = { VSRAB, VSRAH, VSRAW, 0 },
+        umin_op[4] = { VMINUB, VMINUH, VMINUW, VMINUD },
+        smin_op[4] = { VMINSB, VMINSH, VMINSW, VMINSD },
+        umax_op[4] = { VMAXUB, VMAXUH, VMAXUW, VMAXUD },
+        smax_op[4] = { VMAXSB, VMAXSH, VMAXSW, VMAXSD },
+        shlv_op[4] = { VSLB, VSLH, VSLW, VSLD },
+        shrv_op[4] = { VSRB, VSRH, VSRW, VSRD },
+        sarv_op[4] = { VSRAB, VSRAH, VSRAW, VSRAD },
         mrgh_op[4] = { VMRGHB, VMRGHH, VMRGHW, 0 },
         mrgl_op[4] = { VMRGLB, VMRGLH, VMRGLW, 0 },
-        muleu_op[4] = { VMULEUB, VMULEUH, 0, 0 },
-        mulou_op[4] = { VMULOUB, VMULOUH, 0, 0 },
+        muleu_op[4] = { VMULEUB, VMULEUH, VMULEUW, 0 },
+        mulou_op[4] = { VMULOUB, VMULOUH, VMULOUW, 0 },
         pkum_op[4] = { VPKUHUM, VPKUWUM, 0, 0 },
-        rotl_op[4] = { VRLB, VRLH, VRLW, 0 };
+        rotl_op[4] = { VRLB, VRLH, VRLW, VRLD };
 
     TCGType type = vecl + TCG_TYPE_V64;
     TCGArg a0 = args[0], a1 = args[1], a2 = args[2];
@@ -3089,6 +3143,10 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_sub_vec:
         insn = sub_op[vece];
         break;
+    case INDEX_op_mul_vec:
+        tcg_debug_assert(vece == MO_32 && have_isa_2_07_vsx);
+        insn = VMULUWM;
+        break;
     case INDEX_op_ssadd_vec:
         insn = ssadd_op[vece];
         break;
@@ -3138,6 +3196,9 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         insn = VNOR;
         a2 = a1;
         break;
+    case INDEX_op_orc_vec:
+        insn = VORC;
+        break;
 
     case INDEX_op_cmp_vec:
         switch (args[3]) {
@@ -3218,7 +3279,7 @@ static void expand_vec_cmp(TCGType type, unsigned vece, TCGv_vec v0,
 {
     bool need_swap = false, need_inv = false;
 
-    tcg_debug_assert(vece <= MO_32);
+    tcg_debug_assert(vece <= MO_32 || have_isa_2_07_vsx);
 
     switch (cond) {
     case TCG_COND_EQ:
@@ -3282,6 +3343,7 @@ static void expand_vec_mul(TCGType type, unsigned vece, TCGv_vec v0,
 	break;
 
     case MO_32:
+        tcg_debug_assert(!have_isa_2_07_vsx);
         t3 = tcg_temp_new_vec(type);
         t4 = tcg_temp_new_vec(type);
         tcg_gen_dupi_vec(MO_8, t4, -16);
@@ -3577,6 +3639,11 @@ static void tcg_target_init(TCGContext *s)
             have_isa_2_06_vsx = true;
         }
     }
+    if (hwcap2 & PPC_FEATURE2_ARCH_2_07) {
+        if (hwcap & PPC_FEATURE_HAS_VSX) {
+            have_isa_2_07_vsx = true;
+        }
+    }
 #ifdef PPC_FEATURE2_ARCH_3_00
     if (hwcap2 & PPC_FEATURE2_ARCH_3_00) {
         have_isa_3_00 = true;
-- 
2.17.1


