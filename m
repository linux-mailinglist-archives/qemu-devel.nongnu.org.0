Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3908225F5
	for <lists+qemu-devel@lfdr.de>; Sun, 19 May 2019 06:36:44 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43753 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSDYx-0001wY-UE
	for lists+qemu-devel@lfdr.de; Sun, 19 May 2019 00:36:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hSDSo-0005xg-Fa
	for qemu-devel@nongnu.org; Sun, 19 May 2019 00:30:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hSDEQ-0004mH-Vl
	for qemu-devel@nongnu.org; Sun, 19 May 2019 00:15:32 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:43228)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hSDEQ-0004lP-I3
	for qemu-devel@nongnu.org; Sun, 19 May 2019 00:15:30 -0400
Received: by mail-pg1-x542.google.com with SMTP id t22so5140092pgi.10
	for <qemu-devel@nongnu.org>; Sat, 18 May 2019 21:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fTrWQvU6AxYkKMinL21lSwX4DniTxfJCDaDFb9S03jI=;
	b=AgUxub1DrMQK8SaSS4EBSasKgXOW1Qq89FI8sMdzApCqgHK18V1QCfDvhZ73z3lF3k
	/eeiyT8kdrj+2gQ/Kt1JQ4D5n85cPgemrahs8pwdoiCiL1M3pbt4l5wU4PJdgeLk5sOV
	R0p3Mkcfk8Kae0f8ncgxZIPpN80lLLioASW1iuVqDc2eipG5Q9d2qTv1vh3x9Min2Fqy
	HXcQwnyr43bV89Ax6Nv1FKQnTGPpYSAjIkEBbZTmh7AwXYLrT/r508nObZeYJQ3lSRnz
	/JmuEHji9ovgLTwG4prbJ3nbT/BkthPOxYXSe3ip5Kqy5sXqLf5vzyhYAYO5SxazVZNv
	ZgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fTrWQvU6AxYkKMinL21lSwX4DniTxfJCDaDFb9S03jI=;
	b=QrNPWwQjyy/T5cFyrsiVGYTvOkHBgbtVL6shmZKvTbHqpaxhEnT3CtQCkqxsrMD1QS
	cykM+ssMRg/nSvb8ac4qI/dMtnMf4vz/Ql9IidCRVIXuDlPBUAAfzF6zwW2ygwOVQYbt
	epWCfbtKFGZdZaVveP80VyXxjlSyEIyy1ak2MZuUpzhsq51J8D8UVAO9mwteZiIQ6fPF
	KTvSnjL3rN51MqLSsowsmLL8k0ae+7+6fis1zYCiwwj3/6s7HpG71bZLuC5RRONajQsD
	CmQvIAsWSYYmF60qOmNNc0IunnIItxk1yWVJdiAVPESrQfyVMNfJeyV5UZbIFcY7xy7B
	0vTQ==
X-Gm-Message-State: APjAAAX35wCo2F2AEDfbCVRWiesn57923J9gv25HeoMDvW/OnQLtwnpJ
	5Inr2m4+ev1l9THTezqMaMpVIU/WsNY=
X-Google-Smtp-Source: APXvYqz9R+sYix21Ikf03cfxpmbbQMZW0QWQsxRQMvlvcRsi5lWStYLanWlOHF7jXl8Z3zroy5XMGQ==
X-Received: by 2002:a65:478a:: with SMTP id e10mr67994729pgs.310.1558239328640;
	Sat, 18 May 2019 21:15:28 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231]) by smtp.gmail.com with ESMTPSA id
	k63sm19381200pfb.108.2019.05.18.21.15.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 May 2019 21:15:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 18 May 2019 21:15:18 -0700
Message-Id: <20190519041522.12327-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190519041522.12327-1-richard.henderson@linaro.org>
References: <20190519041522.12327-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-devel] [PATCH v4 3/7] tcg/ppc: Support vector multiply
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

For Altivec, this is always an expansion.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.h     |   2 +-
 tcg/ppc/tcg-target.opc.h |   8 +++
 tcg/ppc/tcg-target.inc.c | 112 ++++++++++++++++++++++++++++++++++++++-
 3 files changed, 120 insertions(+), 2 deletions(-)

diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index 766706fd30..a130192cbd 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -154,7 +154,7 @@ extern bool have_isa_3_00;
 #define TCG_TARGET_HAS_shs_vec          0
 #define TCG_TARGET_HAS_shv_vec          1
 #define TCG_TARGET_HAS_cmp_vec          1
-#define TCG_TARGET_HAS_mul_vec          0
+#define TCG_TARGET_HAS_mul_vec          1
 #define TCG_TARGET_HAS_sat_vec          1
 #define TCG_TARGET_HAS_minmax_vec       1
 #define TCG_TARGET_HAS_bitsel_vec       0
diff --git a/tcg/ppc/tcg-target.opc.h b/tcg/ppc/tcg-target.opc.h
index 4816a6c3d4..5c6a5ad52c 100644
--- a/tcg/ppc/tcg-target.opc.h
+++ b/tcg/ppc/tcg-target.opc.h
@@ -1,3 +1,11 @@
 /* Target-specific opcodes for host vector expansion.  These will be
    emitted by tcg_expand_vec_op.  For those familiar with GCC internals,
    consider these to be UNSPEC with names.  */
+
+DEF(ppc_mrgh_vec, 1, 2, 0, IMPLVEC)
+DEF(ppc_mrgl_vec, 1, 2, 0, IMPLVEC)
+DEF(ppc_msum_vec, 1, 3, 0, IMPLVEC)
+DEF(ppc_muleu_vec, 1, 2, 0, IMPLVEC)
+DEF(ppc_mulou_vec, 1, 2, 0, IMPLVEC)
+DEF(ppc_pkum_vec, 1, 2, 0, IMPLVEC)
+DEF(ppc_rotl_vec, 1, 2, 0, IMPLVEC)
diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
index 62a8c428e0..9d58db9eb1 100644
--- a/tcg/ppc/tcg-target.inc.c
+++ b/tcg/ppc/tcg-target.inc.c
@@ -526,6 +526,25 @@ static int tcg_target_const_match(tcg_target_long val, TCGType type,
 #define VSRAB      VX4(772)
 #define VSRAH      VX4(836)
 #define VSRAW      VX4(900)
+#define VRLB       VX4(4)
+#define VRLH       VX4(68)
+#define VRLW       VX4(132)
+
+#define VMULEUB    VX4(520)
+#define VMULEUH    VX4(584)
+#define VMULOUB    VX4(8)
+#define VMULOUH    VX4(72)
+#define VMSUMUHM   VX4(38)
+
+#define VMRGHB     VX4(12)
+#define VMRGHH     VX4(76)
+#define VMRGHW     VX4(140)
+#define VMRGLB     VX4(268)
+#define VMRGLH     VX4(332)
+#define VMRGLW     VX4(396)
+
+#define VPKUHUM    VX4(14)
+#define VPKUWUM    VX4(78)
 
 #define VAND       VX4(1028)
 #define VANDC      VX4(1092)
@@ -2892,6 +2911,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_sarv_vec:
         return vece <= MO_32;
     case INDEX_op_cmp_vec:
+    case INDEX_op_mul_vec:
     case INDEX_op_shli_vec:
     case INDEX_op_shri_vec:
     case INDEX_op_sari_vec:
@@ -3005,7 +3025,13 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         smax_op[4] = { VMAXSB, VMAXSH, VMAXSW, 0 },
         shlv_op[4] = { VSLB, VSLH, VSLW, 0 },
         shrv_op[4] = { VSRB, VSRH, VSRW, 0 },
-        sarv_op[4] = { VSRAB, VSRAH, VSRAW, 0 };
+        sarv_op[4] = { VSRAB, VSRAH, VSRAW, 0 },
+        mrgh_op[4] = { VMRGHB, VMRGHH, VMRGHW, 0 },
+        mrgl_op[4] = { VMRGLB, VMRGLH, VMRGLW, 0 },
+        muleu_op[4] = { VMULEUB, VMULEUH, 0, 0 },
+        mulou_op[4] = { VMULOUB, VMULOUH, 0, 0 },
+        pkum_op[4] = { VPKUHUM, VPKUWUM, 0, 0 },
+        rotl_op[4] = { VRLB, VRLH, VRLW, 0 };
 
     TCGType type = vecl + TCG_TYPE_V64;
     TCGArg a0 = args[0], a1 = args[1], a2 = args[2];
@@ -3094,6 +3120,29 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
+    case INDEX_op_ppc_mrgh_vec:
+        insn = mrgh_op[vece];
+        break;
+    case INDEX_op_ppc_mrgl_vec:
+        insn = mrgl_op[vece];
+        break;
+    case INDEX_op_ppc_muleu_vec:
+        insn = muleu_op[vece];
+        break;
+    case INDEX_op_ppc_mulou_vec:
+        insn = mulou_op[vece];
+        break;
+    case INDEX_op_ppc_pkum_vec:
+        insn = pkum_op[vece];
+        break;
+    case INDEX_op_ppc_rotl_vec:
+        insn = rotl_op[vece];
+        break;
+    case INDEX_op_ppc_msum_vec:
+        tcg_debug_assert(vece == MO_16);
+        tcg_out32(s, VMSUMUHM | VRT(a0) | VRA(a1) | VRB(a2) | VRC(args[3]));
+        return;
+
     case INDEX_op_mov_vec:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_dupi_vec: /* Always emitted via tcg_out_movi.  */
     case INDEX_op_dup_vec:  /* Always emitted via tcg_out_dup_vec.  */
@@ -3163,6 +3212,53 @@ static void expand_vec_cmp(TCGType type, unsigned vece, TCGv_vec v0,
     }
 }
 
+static void expand_vec_mul(TCGType type, unsigned vece, TCGv_vec v0,
+                           TCGv_vec v1, TCGv_vec v2)
+{
+    TCGv_vec t1 = tcg_temp_new_vec(type);
+    TCGv_vec t2 = tcg_temp_new_vec(type);
+    TCGv_vec t3, t4;
+
+    switch (vece) {
+    case MO_8:
+    case MO_16:
+        vec_gen_3(INDEX_op_ppc_muleu_vec, type, vece, tcgv_vec_arg(t1),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(v2));
+        vec_gen_3(INDEX_op_ppc_mulou_vec, type, vece, tcgv_vec_arg(t2),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(v2));
+        vec_gen_3(INDEX_op_ppc_mrgh_vec, type, vece + 1, tcgv_vec_arg(v0),
+                  tcgv_vec_arg(t1), tcgv_vec_arg(t2));
+        vec_gen_3(INDEX_op_ppc_mrgl_vec, type, vece + 1, tcgv_vec_arg(t1),
+                  tcgv_vec_arg(t1), tcgv_vec_arg(t2));
+        vec_gen_3(INDEX_op_ppc_pkum_vec, type, vece, tcgv_vec_arg(v0),
+                  tcgv_vec_arg(v0), tcgv_vec_arg(t1));
+	break;
+
+    case MO_32:
+        t3 = tcg_temp_new_vec(type);
+        t4 = tcg_temp_new_vec(type);
+        tcg_gen_dupi_vec(MO_8, t4, -16);
+        vec_gen_3(INDEX_op_ppc_rotl_vec, type, MO_32, tcgv_vec_arg(t1),
+                  tcgv_vec_arg(v2), tcgv_vec_arg(t4));
+        vec_gen_3(INDEX_op_ppc_mulou_vec, type, MO_16, tcgv_vec_arg(t2),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(v2));
+        tcg_gen_dupi_vec(MO_8, t3, 0);
+        vec_gen_4(INDEX_op_ppc_msum_vec, type, MO_16, tcgv_vec_arg(t3),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(t1), tcgv_vec_arg(t3));
+        vec_gen_3(INDEX_op_shlv_vec, type, MO_32, tcgv_vec_arg(t3),
+                  tcgv_vec_arg(t3), tcgv_vec_arg(t4));
+        tcg_gen_add_vec(MO_32, v0, t2, t3);
+        tcg_temp_free_vec(t3);
+        tcg_temp_free_vec(t4);
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+    tcg_temp_free_vec(t1);
+    tcg_temp_free_vec(t2);
+}
+
 void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
                        TCGArg a0, ...)
 {
@@ -3189,6 +3285,10 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
         v2 = temp_tcgv_vec(arg_temp(a2));
         expand_vec_cmp(type, vece, v0, v1, v2, va_arg(va, TCGArg));
         break;
+    case INDEX_op_mul_vec:
+        v2 = temp_tcgv_vec(arg_temp(a2));
+        expand_vec_mul(type, vece, v0, v1, v2);
+        break;
     default:
         g_assert_not_reached();
     }
@@ -3235,6 +3335,8 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     static const TCGTargetOpDef v_r = { .args_ct_str = { "v", "r" } };
     static const TCGTargetOpDef v_v = { .args_ct_str = { "v", "v" } };
     static const TCGTargetOpDef v_v_v = { .args_ct_str = { "v", "v", "v" } };
+    static const TCGTargetOpDef v_v_v_v
+        = { .args_ct_str = { "v", "v", "v", "v" } };
 
     switch (op) {
     case INDEX_op_goto_ptr:
@@ -3390,6 +3492,12 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shlv_vec:
     case INDEX_op_shrv_vec:
     case INDEX_op_sarv_vec:
+    case INDEX_op_ppc_mrgh_vec:
+    case INDEX_op_ppc_mrgl_vec:
+    case INDEX_op_ppc_muleu_vec:
+    case INDEX_op_ppc_mulou_vec:
+    case INDEX_op_ppc_pkum_vec:
+    case INDEX_op_ppc_rotl_vec:
         return &v_v_v;
     case INDEX_op_not_vec:
     case INDEX_op_dup_vec:
@@ -3398,6 +3506,8 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_st_vec:
     case INDEX_op_dupm_vec:
         return &v_r;
+    case INDEX_op_ppc_msum_vec:
+        return &v_v_v_v;
 
     default:
         return NULL;
-- 
2.17.1


