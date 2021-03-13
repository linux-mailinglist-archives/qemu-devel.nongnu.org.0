Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728B233A0E2
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 21:06:06 +0100 (CET)
Received: from localhost ([::1]:51434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAWT-0001wx-Fg
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 15:06:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAGL-0007X2-4x
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:25 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAGJ-00077W-Im
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:24 -0500
Received: by mail-wr1-x431.google.com with SMTP id o16so3607748wrn.0
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7sfsMyoeWthmDEq+zoogz2A6903r3yzybeu6ACTL9Tk=;
 b=gEUeiU9sJAFrOHXHeiydkvdn00KXpr7lUxtndc4whQ8JHxknr7yAvnhgZJs89N5m84
 6UFvodk4ZySVwR9z4MkyjRK2KT0S9K9mxt0/GyDiCmOE5asGLecX0piJ0C/LcjMx7+oy
 W/rtsSwB7awCK5oVix88pG6i+wbx89luHhKCEyLAB32w0afd7jBr6sA/yjLo+g7lPomx
 oy3V3Fhel/hsRtZKUkWhjRMHY30mq3QxZOVQNv9bsJtIarutgV8OiBHimng845CB3AZV
 8Ku0Ve2+5Y+GI1W2+gSFNiZodqhfhiCEZMMw+rLgnipmcs4Vatri/sN83+iDNN+a59pB
 4MMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7sfsMyoeWthmDEq+zoogz2A6903r3yzybeu6ACTL9Tk=;
 b=rGgkjU65H62RuErrEBAxDrnB6L83E4jVSBZj9kJ2hGycHVDdcVeynKsPPOQNYDlBQK
 3MnM8xzpmD18cZRxUlvpCIGZThqy46w5BVPi/BYKW0TjLOPqgYNrWA2K0Zgulubt9E8e
 7/C/IyRonoKRT9RIrrHov2iTPU58bnez9k+uk3F+eD6PqRnmIDdc0B0iVsiH/CmM46+U
 Mpw/nvdpYkXNQjwjnVHZZWRqD4luOi1rLztknG4WzX2XfaJUBEjeMqLJbZOv5o3Q9XVH
 LcTH+imqytRdngcm7/0YW56TdOYNvqmVNObHvYSrhDgw6ricE8EdV2zi/YV1iDHDtB0h
 JwxA==
X-Gm-Message-State: AOAM531QDfxlqf1y87p1kh0DrDtgS/z2ml5UDkd8P7d7bv2mhOczApZv
 3WbK4AcGZSaeeRvmJqTXB67CtoVFQwmmnA==
X-Google-Smtp-Source: ABdhPJxphDNCy+60QLr0KZMdjpxfsHb0veARUQLz812qKoewVpSp6gV53Npo0fTKHlDPm0u2j3DzdA==
X-Received: by 2002:a5d:6b50:: with SMTP id x16mr4367193wrw.379.1615664961932; 
 Sat, 13 Mar 2021 11:49:21 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id q15sm13223790wrr.58.2021.03.13.11.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:49:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/27] target/mips: Remove unused CPUMIPSState* from MXU
 functions
Date: Sat, 13 Mar 2021 20:48:12 +0100
Message-Id: <20210313194829.2193621-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
index 2b9438eaff2..9c06a0df814 100644
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


