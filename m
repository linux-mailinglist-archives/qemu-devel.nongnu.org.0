Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824814B1080
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 15:34:33 +0100 (CET)
Received: from localhost ([::1]:55864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIAWm-0006BC-Gh
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 09:34:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nI8sO-0006ET-UB; Thu, 10 Feb 2022 07:48:45 -0500
Received: from [187.72.171.209] (port=62981 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nI8sM-0001y3-R8; Thu, 10 Feb 2022 07:48:44 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 10 Feb 2022 09:35:34 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 635FB800172;
 Thu, 10 Feb 2022 09:35:34 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 34/37] target/ppc: Move xs{max,
 min}[cj]dp to use do_helper_XX3
Date: Thu, 10 Feb 2022 09:34:44 -0300
Message-Id: <20220210123447.3933301-35-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210123447.3933301-1-matheus.ferst@eldorado.org.br>
References: <20220210123447.3933301-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Feb 2022 12:35:34.0740 (UTC)
 FILETIME=[B31E9940:01D81E7A]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
index 8181e19e28..41f5748074 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2568,8 +2568,8 @@ void helper_##name(CPUPPCState *env,                                          \
     }                                                                         \
 }                                                                             \
 
-VSX_MAX_MINC(xsmaxcdp, 1);
-VSX_MAX_MINC(xsmincdp, 0);
+VSX_MAX_MINC(XSMAXCDP, 1);
+VSX_MAX_MINC(XSMINCDP, 0);
 
 #define VSX_MAX_MINJ(name, max)                                               \
 void helper_##name(CPUPPCState *env,                                          \
@@ -2623,8 +2623,8 @@ void helper_##name(CPUPPCState *env,                                          \
     }                                                                         \
 }                                                                             \
 
-VSX_MAX_MINJ(xsmaxjdp, 1);
-VSX_MAX_MINJ(xsminjdp, 0);
+VSX_MAX_MINJ(XSMAXJDP, 1);
+VSX_MAX_MINJ(XSMINJDP, 0);
 
 /*
  * VSX_CMP - VSX floating point compare
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 775dc74ef8..d67f14cd16 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -380,10 +380,10 @@ DEF_HELPER_4(xscmpoqp, void, env, i32, vsr, vsr)
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
index 3ac41a6958..2e1267e8a3 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2492,32 +2492,10 @@ static bool do_helper_XX3(DisasContext *ctx, arg_XX3 *a,
 TRANS(XSCMPEQDP, do_helper_XX3, gen_helper_XSCMPEQDP)
 TRANS(XSCMPGEDP, do_helper_XX3, gen_helper_XSCMPGEDP)
 TRANS(XSCMPGTDP, do_helper_XX3, gen_helper_XSCMPGTDP)
-
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
+TRANS(XSMAXCDP, do_helper_XX3, gen_helper_XSMAXCDP)
+TRANS(XSMINCDP, do_helper_XX3, gen_helper_XSMINCDP)
+TRANS(XSMAXJDP, do_helper_XX3, gen_helper_XSMAXJDP)
+TRANS(XSMINJDP, do_helper_XX3, gen_helper_XSMINJDP)
 
 static bool do_helper_X(arg_X *a,
     void (*helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
-- 
2.31.1


