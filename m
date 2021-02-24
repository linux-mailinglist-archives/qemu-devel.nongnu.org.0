Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C710F324462
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 20:07:55 +0100 (CET)
Received: from localhost ([::1]:49050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzVq-0007Gf-MY
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 14:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEzM5-0006X3-09
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:57:49 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:50876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEzM3-0002n2-Fx
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:57:48 -0500
Received: by mail-wm1-x32d.google.com with SMTP id i9so2382509wml.0
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IE7Z1PUDdNGO2QCn3y3Rte5L3sCvv5X28KeN2j6Nh84=;
 b=PSlMnBOHSZobbD7Kxh2s2nH2DPT1yxiOe7qg5yDg5lqjtKD7u4yTYPPxU8bSsh/kLu
 w2sVmvoXqZZ4MuZ8LZxmmeIW9cPGx9/UbRQukiKhteoKMpQFIvnvIrOVlnkxqii9Rcal
 96nh6XOfoFoqC78kasv9rY17mWLfws2GR9rpG3CAA2mKMM9M9BQVi7pu3675mxzCRyoI
 jduxh6cT4qaa1yj5W79w/0EJ7BYCJcTMyMjlCGZV3KJ2dUt7BzJyFWd6TSz4mTSMz0fv
 nvVqTMcFJOIFXIDX7jXL+EdMxoGrSW+j4gWGwWJF+OHXMNorAdAB5Rm0EeoynamSjmPk
 4bRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IE7Z1PUDdNGO2QCn3y3Rte5L3sCvv5X28KeN2j6Nh84=;
 b=QtrqMIkiQzEJHVQ+mrz9FmTdnqDU5qWPcts6lSC4nnm8WUAKuBKnX5EfIY4hSh/HQR
 T0fS63r8Ke0GxPm0Tb4JvDzFclef4+yy8HxVT1UKm7UNVGyNI6do1lyw/uzocVnsqinx
 x2OAZmyysYGTjaPD0ZiwkPgO6/dobVQ3L7kO+9LEg0+YAxepZjYnlbgfiJFp2Y3zYkoI
 VkRuV9ZqihXCjnFMiy04YXrvWfM0RuloSXcTSy6tLHE+NSeFqcgw/6wdO1Awd3ySkcTR
 d8PksnYvg7xi6/tnzsnapGKA3KzAlrc9kedJGsmJ5i087EUPq0a6FymuyACuQoFU9iBa
 PSDA==
X-Gm-Message-State: AOAM533Kgas5XuFTwhDYPKAawJ4hPcg9h2iKzfTFGNTL+vr/qFIn0A8G
 JHnyhBRJ6TGzS58YxrOlcVUcUR2O0RE=
X-Google-Smtp-Source: ABdhPJxpxUDtL6dKwJoS8/0p9Cy9IF3BU7hcFBSRObhMyJXGEnAUKp2Kdx0G74DqHuAK2Pb+cyWHPg==
X-Received: by 2002:a05:600c:4f07:: with SMTP id
 l7mr4916414wmq.141.1614193065872; 
 Wed, 24 Feb 2021 10:57:45 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s23sm4188596wmc.29.2021.02.24.10.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 10:57:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/12] target/mips: Remove unused CPUMIPSState* from MXU
 functions
Date: Wed, 24 Feb 2021 19:56:59 +0100
Message-Id: <20210224185706.3293058-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210224185706.3293058-1-f4bug@amsat.org>
References: <20210224185706.3293058-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 Craig Janeczek <jancraig@amazon.com>,
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


