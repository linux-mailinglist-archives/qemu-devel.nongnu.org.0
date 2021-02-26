Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4E032601B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 10:34:49 +0100 (CET)
Received: from localhost ([::1]:60318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFZWK-000608-RC
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 04:34:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZTQ-0004Mx-RG
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:31:48 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:37052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZTO-00038E-MV
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:31:47 -0500
Received: by mail-ej1-x62d.google.com with SMTP id b21so2654949eja.4
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 01:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3wgVFWl1ooSOtrFHyjc6vBbkl1t0wg7aCFfvYF/8BTs=;
 b=suANzPieQMU2MYZRZXrnxZQSGRDwqJFW9HyCDRw+Ehxl0CnbLkAtVaVg+8MiSI+cs0
 npRxMTFW0AG8dRKZaEFsmINN+Plrqea77IClgk08g6acCa4NkU2Vb3+r1zL+M5IQaI2G
 pMeGjI2WeqKQFeWchVB9Q03ZFp6iOpmJ1mjBYD+HyQ8d/owMxVpObT1HfM7qvyDTzRSR
 Y3i2a0CNlbFe53zgtr0YcT8WMz0ggP3WeCF6ju6QtM/VbNwl6Z4seL5DupqiF1ryw0VF
 ovptH3PJO4tEs17Ys6rSyTQUupVm6JV4xQY34Yit42tj5iQEaQXgUpIdVxEtQNQp4sjM
 isHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3wgVFWl1ooSOtrFHyjc6vBbkl1t0wg7aCFfvYF/8BTs=;
 b=P0I19T/MqPOmXjl2Zfcrs5P3R6ILAYwfpF0swEQ4uSaQGksD3giJLRxAd7LsLIuj2t
 EH8ov+Zgznf5YJK/o3JrN1sCwT8c0NghZhJi1C04uA6Dl8/9+ZKYyHcd5nXSUxZr/M8o
 ZU6XtR83cD5AOi/pQOrEH4of4curZ5idegU6T8GfWhspW9ZJy1iv5trvfbXXGprI+7XK
 05bGmWRVxXXJM2oSB33DrkLWdMn32VHDosh1VEhaIrH2bttW7FOyu0978YMYG8oeCoao
 Tmvs63YZpRLLW9g8X+LijpXnvkYJibq8lbX4EmOr0NYzFiXPm/gco/YJc4FIxD2jLxQl
 Bl8Q==
X-Gm-Message-State: AOAM533poq8V0rUfNvqD//JSTg7Wo9UVx6xJMENzFykE1z7biUIv+xQ+
 6LtxR9MXGIvwlfAdluXktOcwRsKTh8c=
X-Google-Smtp-Source: ABdhPJxYp5wVgJtcpO8f/TU5Tt/jEW0EY2SBnyJTSNL9MaJPZT3grd5TFaxoRv2X+RH3z2BI8aQ8XA==
X-Received: by 2002:a17:906:184e:: with SMTP id
 w14mr2426127eje.56.1614331904771; 
 Fri, 26 Feb 2021 01:31:44 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y8sm4964046edd.97.2021.02.26.01.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 01:31:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/13] target/mips: Pass instruction opcode to
 decode_opc_mxu()
Date: Fri, 26 Feb 2021 10:31:03 +0100
Message-Id: <20210226093111.3865906-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226093111.3865906-1-f4bug@amsat.org>
References: <20210226093111.3865906-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62d.google.com
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

In the next commit we'll make decode_opc_mxu() match decodetree
prototype by returning a boolean. First pass ctx->opcode as an
argument.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 6f5ccd667da..9e875fa4a25 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -25780,17 +25780,17 @@ static void decode_opc_mxu__pool19(DisasContext *ctx)
 /*
  * Main MXU decoding function
  */
-static void decode_opc_mxu(DisasContext *ctx)
+static void decode_opc_mxu(DisasContext *ctx, uint32_t insn)
 {
-    uint32_t opcode = extract32(ctx->opcode, 0, 6);
+    uint32_t opcode = extract32(insn, 0, 6);
 
     if (opcode == OPC__MXU_MUL) {
         uint32_t  rs, rt, rd, op1;
 
-        rs = extract32(ctx->opcode, 21, 5);
-        rt = extract32(ctx->opcode, 16, 5);
-        rd = extract32(ctx->opcode, 11, 5);
-        op1 = MASK_SPECIAL2(ctx->opcode);
+        rs = extract32(insn, 21, 5);
+        rt = extract32(insn, 16, 5);
+        rd = extract32(insn, 11, 5);
+        op1 = MASK_SPECIAL2(insn);
 
         gen_arith(ctx, op1, rd, rs, rt);
 
@@ -26995,7 +26995,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
 #endif
 #if !defined(TARGET_MIPS64)
         if (ctx->insn_flags & ASE_MXU) {
-            decode_opc_mxu(ctx);
+            decode_opc_mxu(ctx, ctx->opcode);
             break;
         }
 #endif
-- 
2.26.2


