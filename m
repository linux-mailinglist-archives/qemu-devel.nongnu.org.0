Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C398D620463
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 01:00:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osC0s-0004CQ-8A; Mon, 07 Nov 2022 18:58:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC0q-0004BB-5P
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:58:44 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC0m-0000mJ-Aq
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:58:43 -0500
Received: by mail-wr1-x434.google.com with SMTP id o4so18533850wrq.6
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 15:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CT2Moauv807B/rlILDZo2huTDc6KLxUQ9xta6J885G0=;
 b=Zcb9HdcyiWBeCWUgtNHb4+0RfE8ypTlGOHYuB7Qb/j2WYR7YcmPtvCHwSqEZweTbzb
 Ifr3+KPYHtwH9Nvf0TL8iprZV+MKhb3DkTY6t67ddBzPXn+QMGnEagcWsuGly6wUFSsE
 xZhZmhA7rAcwXJkODG+3x2MduIuF6vT1lT5DfHgGKvMS1nQWbK4ArD2llN0z2KRo5wW0
 Jyo4NT+TfYwHnCOJ3LpAIa1jQt+8unkAjGmCi0am+dN5KDuFgegoTtDgpVTheiegBPjl
 o5q9Ut8aYQBzDsJmFDBfKrfUhSorlFzzXo8qwz+JqIJHZvATWtvGAn3sM1RFjVr8aX1y
 HH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CT2Moauv807B/rlILDZo2huTDc6KLxUQ9xta6J885G0=;
 b=q1rE6+VM89KeK+SeiQ3hRMfXCJEVFVI2Fhyr3omU67U3SP10UbKS+ZKSutDEYffeVf
 ZvcUZTxX/QFtxEf3c4S45ulaAN9t2x62S4/0TCQTXojZ2PHryfrDMJ8CrFkn+F+5xcEU
 BbrRpMTFeqggUlVjobg6mxl5CkDf/rpWmrZMcKLPD00QYiiQdrosJ7JWVIrMlHUfgMNt
 eVRSbaNXAFSGqL/JZqOrl/glyhDt95d1V8m7txPSglH4+/IosA8jr0xo36pw5BRjvOlc
 Zn+s+33qR/ADLly+f/05ActfFLsyLyWxKi+tCwg+V358bV+FTfE2+OnA1awT7YF/FXdJ
 vXIg==
X-Gm-Message-State: ACrzQf3O4dgYR4sPfIjs+rkiIRMrdRWcU0qImxvvaNm9ryObPcCNXYU8
 7mCLo2MKiP+sOBQyhrCy+54Q0bjTs+VVTQ==
X-Google-Smtp-Source: AMsMyM79CzKazoZAU7xl8vDOmQTcnR//FJeAIO67emllOvT/Za9tacczI9GRgYU7CR/wABf+63ON/Q==
X-Received: by 2002:a05:6000:15cd:b0:236:9701:7939 with SMTP id
 y13-20020a05600015cd00b0023697017939mr32789939wry.248.1667865518724; 
 Mon, 07 Nov 2022 15:58:38 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g12-20020adffc8c000000b0022cd96b3ba6sm9826641wrr.90.2022.11.07.15.58.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Nov 2022 15:58:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Subject: [PULL 03/14] target/mips: Enable LBX/LWX/* instructions for Octeon
Date: Tue,  8 Nov 2022 00:58:11 +0100
Message-Id: <20221107235822.71458-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235822.71458-1-philmd@linaro.org>
References: <20221107235822.71458-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

This patch changes condition and function name for enabling
indexed load instructions for Octeon vCPUs. Octeons do not
have DSP extension, but implement LBX-and-others.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <166728058455.229236.13834649461181619195.stgit@pasha-ThinkPad-X280>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/tcg/translate.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 2f2d707a12..4c4bd0823d 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -12173,12 +12173,16 @@ enum {
 #include "nanomips_translate.c.inc"
 
 /* MIPSDSP functions. */
-static void gen_mipsdsp_ld(DisasContext *ctx, uint32_t opc,
-                           int rd, int base, int offset)
+
+/* Indexed load is not for DSP only */
+static void gen_mips_lx(DisasContext *ctx, uint32_t opc,
+                        int rd, int base, int offset)
 {
     TCGv t0;
 
-    check_dsp(ctx);
+    if (!(ctx->insn_flags & INSN_OCTEON)) {
+        check_dsp(ctx);
+    }
     t0 = tcg_temp_new();
 
     if (base == 0) {
@@ -14523,7 +14527,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
         case OPC_LBUX:
         case OPC_LHX:
         case OPC_LWX:
-            gen_mipsdsp_ld(ctx, op2, rd, rs, rt);
+            gen_mips_lx(ctx, op2, rd, rs, rt);
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK LX");
-- 
2.38.1


