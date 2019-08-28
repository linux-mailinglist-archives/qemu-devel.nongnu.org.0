Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEC6A07DB
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 18:51:22 +0200 (CEST)
Received: from localhost ([::1]:38556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i31AH-0004dm-3s
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 12:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34813)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i30nF-0007HE-38
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:27:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i30nC-0008EV-Vx
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:27:32 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:57967 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i30n9-00080R-1Q
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:27:29 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 0802F1A22C7;
 Wed, 28 Aug 2019 18:27:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 945871A22A9;
 Wed, 28 Aug 2019 18:27:00 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 18:26:48 +0200
Message-Id: <1567009614-12438-25-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567009614-12438-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1567009614-12438-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v2 24/30] target/mips: Clean up handling of CP0
 register 25
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
Cc: arikalo@wavecomp.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Clean up handling of CP0 register 25.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/translate.c | 64 ++++++++++++++++++++++++-------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 732b38d..df6aa9e 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7466,35 +7466,35 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_25:
         switch (sel) {
-        case 0:
+        case CP0_REG25__PERFCTL0:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Performance0));
             register_name = "Performance0";
             break;
-        case 1:
+        case CP0_REG25__PERFCNT0:
             /* gen_helper_mfc0_performance1(arg); */
             register_name = "Performance1";
             goto cp0_unimplemented;
-        case 2:
+        case CP0_REG25__PERFCTL1:
             /* gen_helper_mfc0_performance2(arg); */
             register_name = "Performance2";
             goto cp0_unimplemented;
-        case 3:
+        case CP0_REG25__PERFCNT1:
             /* gen_helper_mfc0_performance3(arg); */
             register_name = "Performance3";
             goto cp0_unimplemented;
-        case 4:
+        case CP0_REG25__PERFCTL2:
             /* gen_helper_mfc0_performance4(arg); */
             register_name = "Performance4";
             goto cp0_unimplemented;
-        case 5:
+        case CP0_REG25__PERFCNT2:
             /* gen_helper_mfc0_performance5(arg); */
             register_name = "Performance5";
             goto cp0_unimplemented;
-        case 6:
+        case CP0_REG25__PERFCTL3:
             /* gen_helper_mfc0_performance6(arg); */
             register_name = "Performance6";
             goto cp0_unimplemented;
-        case 7:
+        case CP0_REG25__PERFCNT3:
             /* gen_helper_mfc0_performance7(arg); */
             register_name = "Performance7";
             goto cp0_unimplemented;
@@ -8228,35 +8228,35 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_25:
         switch (sel) {
-        case 0:
+        case CP0_REG25__PERFCTL0:
             gen_helper_mtc0_performance0(cpu_env, arg);
             register_name = "Performance0";
             break;
-        case 1:
+        case CP0_REG25__PERFCNT0:
             /* gen_helper_mtc0_performance1(arg); */
             register_name = "Performance1";
             goto cp0_unimplemented;
-        case 2:
+        case CP0_REG25__PERFCTL1:
             /* gen_helper_mtc0_performance2(arg); */
             register_name = "Performance2";
             goto cp0_unimplemented;
-        case 3:
+        case CP0_REG25__PERFCNT1:
             /* gen_helper_mtc0_performance3(arg); */
             register_name = "Performance3";
             goto cp0_unimplemented;
-        case 4:
+        case CP0_REG25__PERFCTL2:
             /* gen_helper_mtc0_performance4(arg); */
             register_name = "Performance4";
             goto cp0_unimplemented;
-        case 5:
+        case CP0_REG25__PERFCNT2:
             /* gen_helper_mtc0_performance5(arg); */
             register_name = "Performance5";
             goto cp0_unimplemented;
-        case 6:
+        case CP0_REG25__PERFCTL3:
             /* gen_helper_mtc0_performance6(arg); */
             register_name = "Performance6";
             goto cp0_unimplemented;
-        case 7:
+        case CP0_REG25__PERFCNT3:
             /* gen_helper_mtc0_performance7(arg); */
             register_name = "Performance7";
             goto cp0_unimplemented;
@@ -8968,35 +8968,35 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_25:
         switch (sel) {
-        case 0:
+        case CP0_REG25__PERFCTL0:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Performance0));
             register_name = "Performance0";
             break;
-        case 1:
+        case CP0_REG25__PERFCNT0:
             /* gen_helper_dmfc0_performance1(arg); */
             register_name = "Performance1";
             goto cp0_unimplemented;
-        case 2:
+        case CP0_REG25__PERFCTL1:
             /* gen_helper_dmfc0_performance2(arg); */
             register_name = "Performance2";
             goto cp0_unimplemented;
-        case 3:
+        case CP0_REG25__PERFCNT1:
             /* gen_helper_dmfc0_performance3(arg); */
             register_name = "Performance3";
             goto cp0_unimplemented;
-        case 4:
+        case CP0_REG25__PERFCTL2:
             /* gen_helper_dmfc0_performance4(arg); */
             register_name = "Performance4";
             goto cp0_unimplemented;
-        case 5:
+        case CP0_REG25__PERFCNT2:
             /* gen_helper_dmfc0_performance5(arg); */
             register_name = "Performance5";
             goto cp0_unimplemented;
-        case 6:
+        case CP0_REG25__PERFCTL3:
             /* gen_helper_dmfc0_performance6(arg); */
             register_name = "Performance6";
             goto cp0_unimplemented;
-        case 7:
+        case CP0_REG25__PERFCNT3:
             /* gen_helper_dmfc0_performance7(arg); */
             register_name = "Performance7";
             goto cp0_unimplemented;
@@ -9712,35 +9712,35 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_25:
         switch (sel) {
-        case 0:
+        case CP0_REG25__PERFCTL0:
             gen_helper_mtc0_performance0(cpu_env, arg);
             register_name = "Performance0";
             break;
-        case 1:
+        case CP0_REG25__PERFCNT0:
             /* gen_helper_mtc0_performance1(cpu_env, arg); */
             register_name = "Performance1";
             goto cp0_unimplemented;
-        case 2:
+        case CP0_REG25__PERFCTL1:
             /* gen_helper_mtc0_performance2(cpu_env, arg); */
             register_name = "Performance2";
             goto cp0_unimplemented;
-        case 3:
+        case CP0_REG25__PERFCNT1:
             /* gen_helper_mtc0_performance3(cpu_env, arg); */
             register_name = "Performance3";
             goto cp0_unimplemented;
-        case 4:
+        case CP0_REG25__PERFCTL2:
             /* gen_helper_mtc0_performance4(cpu_env, arg); */
             register_name = "Performance4";
             goto cp0_unimplemented;
-        case 5:
+        case CP0_REG25__PERFCNT2:
             /* gen_helper_mtc0_performance5(cpu_env, arg); */
             register_name = "Performance5";
             goto cp0_unimplemented;
-        case 6:
+        case CP0_REG25__PERFCTL3:
             /* gen_helper_mtc0_performance6(cpu_env, arg); */
             register_name = "Performance6";
             goto cp0_unimplemented;
-        case 7:
+        case CP0_REG25__PERFCNT3:
             /* gen_helper_mtc0_performance7(cpu_env, arg); */
             register_name = "Performance7";
             goto cp0_unimplemented;
-- 
2.7.4


