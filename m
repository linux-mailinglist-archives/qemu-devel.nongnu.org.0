Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC40D5AB52
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jun 2019 15:10:45 +0200 (CEST)
Received: from localhost ([::1]:39536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhD7t-0005Sp-4E
	for lists+qemu-devel@lfdr.de; Sat, 29 Jun 2019 09:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41188)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hhCy9-0007yu-I6
 for qemu-devel@nongnu.org; Sat, 29 Jun 2019 09:00:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hhCy7-0003ap-It
 for qemu-devel@nongnu.org; Sat, 29 Jun 2019 09:00:41 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37611)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hhCy7-0003T2-8T
 for qemu-devel@nongnu.org; Sat, 29 Jun 2019 09:00:39 -0400
Received: by mail-wm1-x32a.google.com with SMTP id f17so11452541wme.2
 for <qemu-devel@nongnu.org>; Sat, 29 Jun 2019 06:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/l8VSdI/ZnCmcUNvp0NF0YlpXDS7XSXwgcTE4BAP/Rg=;
 b=NCQH50kiuLXO+OByOi51T77pwOTvm+nVmhyvNxwbujZkLwGCNK+HeJaaT6cs2RVwk8
 2XZSQBs1h8+xCm14TlXRGjbCk03Nu5pVtXqlfPuwyo8HhEY7UWxtfC+D1CjVIp/BsNM3
 Y5bHojFgB3/2Aydz8upwrRC4eMDnbFY2nfXvZ2zO2JQ7iY2eqHQn7Y4g8iQP65vytl4n
 1GjoaL34tAcFZNJ7tXRdloLPjVLZmIKLQrdioxHXYOtq+IMKtch+sJYPGi4phkkOjOlY
 34KhCR6HeuMP5bgnyQwHL+Nci8Mj+MKFU5VEIAwtyDtVve/lsIQ9eam2lgzUh0/aOKe6
 8hVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/l8VSdI/ZnCmcUNvp0NF0YlpXDS7XSXwgcTE4BAP/Rg=;
 b=ose3zdZ+0fx7QLHu6LE3GSQo3lDr6avwn1YV2+XCuRToexwd9OMhsuGBuHyc0EFM3w
 rTvTcxYIFNxVPd+ds9G8gdZQHXsD+oiqLRF8hGkk6UEUBmXXyC31ZqdD8lXvk/up66/W
 xBvUR7biiibNTMx06GaJOy7OLNkKIsN3oe8aaIOv9qPEbhm08WWWsNXPqWbJgQDSuiQA
 aEWs1m2/inVYx04P80EjA+5KTHAIlOcgpKRgo1iUWUM2wpJ0C+goKPC+ZMicwsc1Eqqc
 F83ibLywMtnU+PWHWRLH4T1pSHfho24AUBDV7cL8X7C1KZ9jkLblZoW3liCwo8/VLoyE
 sj1A==
X-Gm-Message-State: APjAAAW8tSNbwd3FVK7luWNPHBWNZhwGNQlic/GE8cbBk4R2DTVhec1g
 +7WSJyXK5CWGiZA9Zw9wxdVrC+Wy8D77jA==
X-Google-Smtp-Source: APXvYqxVt/WrJXBczg/g7l5jmblfZfpG7y+Kj00d1+qmECGNrqseSDBi6rrJro/Uv0Qb24wZaxvpGw==
X-Received: by 2002:a1c:cb4d:: with SMTP id b74mr11190515wmg.43.1561813230188; 
 Sat, 29 Jun 2019 06:00:30 -0700 (PDT)
Received: from localhost.localdomain (93-34-153-63.ip50.fastwebnet.it.
 [93.34.153.63])
 by smtp.gmail.com with ESMTPSA id d10sm4937676wro.18.2019.06.29.06.00.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 06:00:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 29 Jun 2019 15:00:12 +0200
Message-Id: <20190629130017.2973-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190629130017.2973-1-richard.henderson@linaro.org>
References: <20190629130017.2973-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32a
Subject: [Qemu-devel] [PATCH v6 11/16] tcg/ppc: Support vector multiply
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mark.cave-ayland@ilande.co.uk, amarkovic@wavecomp.com, hsp.cat7@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For Altivec, this is always an expansion.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
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
index fa680dd6a0..db24a11987 100644
--- a/tcg/ppc/tcg-target.opc.h
+++ b/tcg/ppc/tcg-target.opc.h
@@ -3,3 +3,11 @@
  * emitted by tcg_expand_vec_op.  For those familiar with GCC internals,
  * consider these to be UNSPEC with names.
  */
+
+DEF(ppc_mrgh_vec, 1, 2, 0, IMPLVEC)
+DEF(ppc_mrgl_vec, 1, 2, 0, IMPLVEC)
+DEF(ppc_msum_vec, 1, 3, 0, IMPLVEC)
+DEF(ppc_muleu_vec, 1, 2, 0, IMPLVEC)
+DEF(ppc_mulou_vec, 1, 2, 0, IMPLVEC)
+DEF(ppc_pkum_vec, 1, 2, 0, IMPLVEC)
+DEF(ppc_rotl_vec, 1, 2, 0, IMPLVEC)
diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
index 7ddef950f7..cb604b76a3 100644
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
@@ -2878,6 +2897,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_sarv_vec:
         return vece <= MO_32;
     case INDEX_op_cmp_vec:
+    case INDEX_op_mul_vec:
     case INDEX_op_shli_vec:
     case INDEX_op_shri_vec:
     case INDEX_op_sari_vec:
@@ -2990,7 +3010,13 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -3079,6 +3105,29 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -3148,6 +3197,53 @@ static void expand_vec_cmp(TCGType type, unsigned vece, TCGv_vec v0,
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
@@ -3174,6 +3270,10 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
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
@@ -3220,6 +3320,8 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     static const TCGTargetOpDef v_r = { .args_ct_str = { "v", "r" } };
     static const TCGTargetOpDef v_v = { .args_ct_str = { "v", "v" } };
     static const TCGTargetOpDef v_v_v = { .args_ct_str = { "v", "v", "v" } };
+    static const TCGTargetOpDef v_v_v_v
+        = { .args_ct_str = { "v", "v", "v", "v" } };
 
     switch (op) {
     case INDEX_op_goto_ptr:
@@ -3375,6 +3477,12 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
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
@@ -3383,6 +3491,8 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_st_vec:
     case INDEX_op_dupm_vec:
         return &v_r;
+    case INDEX_op_ppc_msum_vec:
+        return &v_v_v_v;
 
     default:
         return NULL;
-- 
2.17.1


