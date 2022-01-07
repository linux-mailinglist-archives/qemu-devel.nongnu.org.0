Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39CC487D98
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 21:19:27 +0100 (CET)
Received: from localhost ([::1]:51360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5vhu-0002RM-Ex
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 15:19:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n5uVI-0007Ds-0k; Fri, 07 Jan 2022 14:02:20 -0500
Received: from [201.28.113.2] (port=59912 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n5uVG-0008Dy-Dx; Fri, 07 Jan 2022 14:02:19 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 7 Jan 2022 15:57:45 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 5718B8001D1;
 Fri,  7 Jan 2022 15:57:45 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 34/37] target/ppc: Move xs{max, min}[cj]dp to use do_helper_XX3
Date: Fri,  7 Jan 2022 15:56:50 -0300
Message-Id: <20220107185653.1609775-35-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107185653.1609775-1-matheus.ferst@eldorado.org.br>
References: <20220107185653.1609775-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 07 Jan 2022 18:57:45.0732 (UTC)
 FILETIME=[7502CC40:01D803F8]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Víctor Colombo <victor.colombo@eldorado.org.br>

Also, fixes these instructions not being capitalized.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/fpu_helper.c             |  8 ++++----
 target/ppc/helper.h                 |  8 ++++----
 target/ppc/translate/vsx-impl.c.inc | 30 ++++-------------------------
 3 files changed, 12 insertions(+), 34 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 75bd7de15a..24072cacee 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2569,8 +2569,8 @@ void helper_##name(CPUPPCState *env,                                          \
     }                                                                         \
 }                                                                             \
 
-VSX_MAX_MINC(xsmaxcdp, 1);
-VSX_MAX_MINC(xsmincdp, 0);
+VSX_MAX_MINC(XSMAXCDP, 1);
+VSX_MAX_MINC(XSMINCDP, 0);
 
 #define VSX_MAX_MINJ(name, max)                                               \
 void helper_##name(CPUPPCState *env,                                          \
@@ -2624,8 +2624,8 @@ void helper_##name(CPUPPCState *env,                                          \
     }                                                                         \
 }                                                                             \
 
-VSX_MAX_MINJ(xsmaxjdp, 1);
-VSX_MAX_MINJ(xsminjdp, 0);
+VSX_MAX_MINJ(XSMAXJDP, 1);
+VSX_MAX_MINJ(XSMINJDP, 0);
 
 /*
  * VSX_CMP - VSX floating point compare
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 1df77748aa..690ba1387e 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -381,10 +381,10 @@ DEF_HELPER_4(xscmpoqp, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscmpuqp, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xsmaxdp, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xsmindp, void, env, vsr, vsr, vsr)
-DEF_HELPER_4(xsmaxcdp, void, env, vsr, vsr, vsr)
-DEF_HELPER_4(xsmincdp, void, env, vsr, vsr, vsr)
-DEF_HELPER_4(xsmaxjdp, void, env, vsr, vsr, vsr)
-DEF_HELPER_4(xsminjdp, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSMAXCDP, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSMINCDP, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSMAXJDP, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSMINJDP, void, env, vsr, vsr, vsr)
 DEF_HELPER_3(xscvdphp, void, env, vsr, vsr)
 DEF_HELPER_4(xscvdpqp, void, env, i32, vsr, vsr)
 DEF_HELPER_3(xscvdpsp, void, env, vsr, vsr)
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index bbe5a70e71..a4b7de5f49 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1183,6 +1183,10 @@ TRANS(XSCMPEQDP, do_helper_XX3, gen_helper_XSCMPEQDP)
 TRANS(XSCMPGEDP, do_helper_XX3, gen_helper_XSCMPGEDP)
 TRANS(XSCMPGTDP, do_helper_XX3, gen_helper_XSCMPGTDP)
 TRANS(XSCMPNEDP, do_helper_XX3, gen_helper_XSCMPNEDP)
+TRANS(XSMAXCDP, do_helper_XX3, gen_helper_XSMAXCDP)
+TRANS(XSMINCDP, do_helper_XX3, gen_helper_XSMINCDP)
+TRANS(XSMAXJDP, do_helper_XX3, gen_helper_XSMAXJDP)
+TRANS(XSMINJDP, do_helper_XX3, gen_helper_XSMINJDP)
 
 static bool trans_XXPERMDI(DisasContext *ctx, arg_XX3_dm *a)
 {
@@ -2456,32 +2460,6 @@ TRANS(XXBLENDVH, do_xxblendv, MO_16)
 TRANS(XXBLENDVW, do_xxblendv, MO_32)
 TRANS(XXBLENDVD, do_xxblendv, MO_64)
 
-static bool do_xsmaxmincjdp(DisasContext *ctx, arg_XX3 *a,
-                            void (*helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
-{
-    TCGv_ptr xt, xa, xb;
-
-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-    REQUIRE_VSX(ctx);
-
-    xt = gen_vsr_ptr(a->xt);
-    xa = gen_vsr_ptr(a->xa);
-    xb = gen_vsr_ptr(a->xb);
-
-    helper(cpu_env, xt, xa, xb);
-
-    tcg_temp_free_ptr(xt);
-    tcg_temp_free_ptr(xa);
-    tcg_temp_free_ptr(xb);
-
-    return true;
-}
-
-TRANS(XSMAXCDP, do_xsmaxmincjdp, gen_helper_xsmaxcdp)
-TRANS(XSMINCDP, do_xsmaxmincjdp, gen_helper_xsmincdp)
-TRANS(XSMAXJDP, do_xsmaxmincjdp, gen_helper_xsmaxjdp)
-TRANS(XSMINJDP, do_xsmaxmincjdp, gen_helper_xsminjdp)
-
 static bool do_helper_X(arg_X *a,
     void (*helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
 {
-- 
2.25.1


