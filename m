Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6954166DFA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 04:43:51 +0100 (CET)
Received: from localhost ([::1]:51772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4zEE-0003no-S0
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 22:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49219)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j4z81-0002HZ-QV
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 22:37:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j4z7z-0008Oi-Eu
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 22:37:24 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:56509 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j4z7x-00087k-Lt; Thu, 20 Feb 2020 22:37:22 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48NxwH576Fz9sSR; Fri, 21 Feb 2020 14:37:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582256223;
 bh=BPtxECqm+DoofpUACmvk5YCWgbDZRCEcXzjUqAUFNNM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D/39LhHa36N0WW6vMShfVyZjQHYQJfu2tJZkYuLbQ7Yum5rmsc9KI+MORRtVRz2B9
 zydE4vC/SbpSybusQkhWgDWn7rBFH9Yd9bWyDzXslliLbzzup+gvFWu99EaeAN+2zb
 A6HYZF4JKz5CHK5Zh8c1XdX5qA+fvK5tdpqziwvQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 14/20] target/ppc: Fix typo in comments
Date: Fri, 21 Feb 2020 14:36:44 +1100
Message-Id: <20200221033650.444386-15-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221033650.444386-1-david@gibson.dropbear.id.au>
References: <20200221033650.444386-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

"Deferred" was misspelled as "differed" in some comments, correct this
typo,

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20200214155748.0896B745953@zero.eik.bme.hu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/fpu_helper.c            | 4 ++--
 target/ppc/translate/fp-impl.inc.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index dc383242f7..ae43b08eb5 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -293,7 +293,7 @@ static void float_invalid_op_vxvc(CPUPPCState *env, b=
ool set_fpcc,
         env->error_code =3D POWERPC_EXCP_FP | POWERPC_EXCP_FP_VXVC;
         /* Update the floating-point enabled exception summary */
         env->fpscr |=3D FP_FEX;
-        /* Exception is differed */
+        /* Exception is deferred */
     }
 }
=20
@@ -644,7 +644,7 @@ static void do_float_check_status(CPUPPCState *env, u=
intptr_t raddr)
=20
     if (cs->exception_index =3D=3D POWERPC_EXCP_PROGRAM &&
         (env->error_code & POWERPC_EXCP_FP)) {
-        /* Differred floating-point exception after target FPR update */
+        /* Deferred floating-point exception after target FPR update */
         if (fp_exceptions_enabled(env)) {
             raise_exception_err_ra(env, cs->exception_index,
                                    env->error_code, raddr);
diff --git a/target/ppc/translate/fp-impl.inc.c b/target/ppc/translate/fp=
-impl.inc.c
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
=20
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
=20
--=20
2.24.1


