Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A7515CED6
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 01:02:52 +0100 (CET)
Received: from localhost ([::1]:32916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2ORX-0001Ec-DN
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 19:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37795)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1j2OQf-0000GV-GL
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 19:01:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1j2OQd-0001CD-R9
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 19:01:56 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:51035)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1j2OQd-0000o1-Kk; Thu, 13 Feb 2020 19:01:55 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8B73C747DF7;
 Fri, 14 Feb 2020 01:01:43 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6D67F747DCF; Fri, 14 Feb 2020 01:01:43 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Fri, 14 Feb 2020 00:57:34 +0100
Subject: [PATCH] target/ppc: Fix typo in comments
To: qemu-devel@nongnu.org
Message-Id: <20200214000143.6D67F747DCF@zero.eik.bme.hu>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
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
Cc: qemu-trivial@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Deferred" was misspelled as "differed" in some comments, correct this
typo,

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 target/ppc/fpu_helper.c            | 2 +-
 target/ppc/translate/fp-impl.inc.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index dc383242f7..5182764df3 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -293,7 +293,7 @@ static void float_invalid_op_vxvc(CPUPPCState *env, bool set_fpcc,
         env->error_code = POWERPC_EXCP_FP | POWERPC_EXCP_FP_VXVC;
         /* Update the floating-point enabled exception summary */
         env->fpscr |= FP_FEX;
-        /* Exception is differed */
+        /* Exception is deferred */
     }
 }
 
diff --git a/target/ppc/translate/fp-impl.inc.c b/target/ppc/translate/fp-impl.inc.c
index d8e27bf4d5..9f7868ee28 100644
--- a/target/ppc/translate/fp-impl.inc.c
+++ b/target/ppc/translate/fp-impl.inc.c
@@ -781,7 +781,7 @@ static void gen_mtfsb1(DisasContext *ctx)
         tcg_gen_trunc_tl_i32(cpu_crf[1], cpu_fpscr);
         tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
     }
-    /* We can raise a differed exception */
+    /* We can raise a deferred exception */
     gen_helper_float_check_status(cpu_env);
 }
 
@@ -817,7 +817,7 @@ static void gen_mtfsf(DisasContext *ctx)
         tcg_gen_trunc_tl_i32(cpu_crf[1], cpu_fpscr);
         tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
     }
-    /* We can raise a differed exception */
+    /* We can raise a deferred exception */
     gen_helper_float_check_status(cpu_env);
     tcg_temp_free_i64(t1);
 }
@@ -850,7 +850,7 @@ static void gen_mtfsfi(DisasContext *ctx)
         tcg_gen_trunc_tl_i32(cpu_crf[1], cpu_fpscr);
         tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
     }
-    /* We can raise a differed exception */
+    /* We can raise a deferred exception */
     gen_helper_float_check_status(cpu_env);
 }
 
-- 
2.21.1


