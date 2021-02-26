Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFC1326021
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 10:37:38 +0100 (CET)
Received: from localhost ([::1]:40560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFZZ3-00018B-TU
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 04:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZTN-0004Lv-LB
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:31:46 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:34007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZTK-00035y-6K
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:31:43 -0500
Received: by mail-ed1-x533.google.com with SMTP id b13so957970edx.1
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 01:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IE7Z1PUDdNGO2QCn3y3Rte5L3sCvv5X28KeN2j6Nh84=;
 b=d9YnfqowGVI63dmS+ch4Ud1nohzDgAX9IxNSEjCBJEFPdqa8xBy4QMBEw0FKmZWdKe
 uHJ192Zt+CAnTtsZYaG0zt6+RWDsZ5eI7UjWLxpnlP9I+XNqJSto1Pw5+DRy2yGJ+3i8
 SxZaRMIn8/dTIDGN7a31cUGFy05zlhN1g/hIdlHt9lF5A3099iB6qGsNVr4V1rtg1wC+
 uRUavG5O8Q3hojZhvjnBmpmdXRdEDpn315nlEdLP8mpaasNAwNIBVWTRZo9iamhL5f3/
 r8yn1iMtjokU8UEL9v66vkCoaUq3PO35o8e8RRmWgL+0q10kzVRekyzpBImE/YBi7feB
 qX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IE7Z1PUDdNGO2QCn3y3Rte5L3sCvv5X28KeN2j6Nh84=;
 b=pGOhoBl9BNWS0CZnvfRgHQJN4QnVDuumLPDpPvfsGFhy5VkVdxerNADYTdOCUV7C1l
 ApKlVq3bw5b669Zw4ilD6PISiT8ku9chCzYUjHginh7OWgGB8JVpbDnFGTtvf3gcvl0V
 FrDLrJeBDLuhHSlxzRsPTAotUz4uh3AK/B6ntIl/bHhlr3bMxbVqmqCIhJ1GapzUZF3n
 7ciRiPLH1UdRokrwXWeISTI9m09xsDcLYxR8aUoS5u98Nj0TzkVDBFK3Lyj1d4bax3MV
 BSpe9dej6JtjPHyZCqhowDOR/8GSShJFsZutC22RaWHCplW9FRdsMYSYtt3yBY4TnJ03
 Ldww==
X-Gm-Message-State: AOAM533Tf96Whivy7U2Tn4zPrZWedxYsPx85n6KQFcag4Ri5E1x8eboj
 nZNE6EJOBjfe7+PTp1XEc3RybSNdiDI=
X-Google-Smtp-Source: ABdhPJzhnrUfLbzOhhaYCSUmouHqR3xg+JTS4izsu+GPquoN9Ut2UlyCMuqLwkn+0PxPFWfgCx7tRQ==
X-Received: by 2002:a50:fd84:: with SMTP id o4mr2236246edt.382.1614331899621; 
 Fri, 26 Feb 2021 01:31:39 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q22sm4998214ejy.5.2021.02.26.01.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 01:31:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/13] target/mips: Remove unused CPUMIPSState* from MXU
 functions
Date: Fri, 26 Feb 2021 10:31:02 +0100
Message-Id: <20210226093111.3865906-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226093111.3865906-1-f4bug@amsat.org>
References: <20210226093111.3865906-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

None of these MXU functions use their CPUMIPSState* env argument,
remove it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index a53ce6adb9a..6f5ccd667da 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -25694,7 +25694,7 @@ static void gen_mxu_S32ALNI(DisasContext *ctx)
  * =======================
  */
 
-static void decode_opc_mxu__pool00(CPUMIPSState *env, DisasContext *ctx)
+static void decode_opc_mxu__pool00(DisasContext *ctx)
 {
     uint32_t opcode = extract32(ctx->opcode, 18, 3);
 
@@ -25718,7 +25718,7 @@ static void decode_opc_mxu__pool00(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
-static void decode_opc_mxu__pool04(CPUMIPSState *env, DisasContext *ctx)
+static void decode_opc_mxu__pool04(DisasContext *ctx)
 {
     uint32_t opcode = extract32(ctx->opcode, 20, 1);
 
@@ -25734,7 +25734,7 @@ static void decode_opc_mxu__pool04(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
-static void decode_opc_mxu__pool16(CPUMIPSState *env, DisasContext *ctx)
+static void decode_opc_mxu__pool16(DisasContext *ctx)
 {
     uint32_t opcode = extract32(ctx->opcode, 18, 3);
 
@@ -25761,7 +25761,7 @@ static void decode_opc_mxu__pool16(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
-static void decode_opc_mxu__pool19(CPUMIPSState *env, DisasContext *ctx)
+static void decode_opc_mxu__pool19(DisasContext *ctx)
 {
     uint32_t opcode = extract32(ctx->opcode, 22, 2);
 
@@ -25780,7 +25780,7 @@ static void decode_opc_mxu__pool19(CPUMIPSState *env, DisasContext *ctx)
 /*
  * Main MXU decoding function
  */
-static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
+static void decode_opc_mxu(DisasContext *ctx)
 {
     uint32_t opcode = extract32(ctx->opcode, 0, 6);
 
@@ -25817,7 +25817,7 @@ static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
 
         switch (opcode) {
         case OPC_MXU__POOL00:
-            decode_opc_mxu__pool00(env, ctx);
+            decode_opc_mxu__pool00(ctx);
             break;
         case OPC_MXU_D16MUL:
             gen_mxu_d16mul(ctx);
@@ -25826,16 +25826,16 @@ static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
             gen_mxu_d16mac(ctx);
             break;
         case OPC_MXU__POOL04:
-            decode_opc_mxu__pool04(env, ctx);
+            decode_opc_mxu__pool04(ctx);
             break;
         case OPC_MXU_S8LDD:
             gen_mxu_s8ldd(ctx);
             break;
         case OPC_MXU__POOL16:
-            decode_opc_mxu__pool16(env, ctx);
+            decode_opc_mxu__pool16(ctx);
             break;
         case OPC_MXU__POOL19:
-            decode_opc_mxu__pool19(env, ctx);
+            decode_opc_mxu__pool19(ctx);
             break;
         default:
             MIPS_INVAL("decode_opc_mxu");
@@ -26995,7 +26995,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
 #endif
 #if !defined(TARGET_MIPS64)
         if (ctx->insn_flags & ASE_MXU) {
-            decode_opc_mxu(env, ctx);
+            decode_opc_mxu(ctx);
             break;
         }
 #endif
-- 
2.26.2


