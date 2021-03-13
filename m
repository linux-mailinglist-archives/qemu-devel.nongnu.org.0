Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1878C33A0D9
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 21:02:27 +0100 (CET)
Received: from localhost ([::1]:37444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLASv-0004ey-G4
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 15:02:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAGa-0007uf-9L
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:42 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAGY-0007Ct-7u
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:39 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso17791197wmi.3
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4tbqQvnoVK3lZGspNq95Zwb17LCzzHK2/0Y4sp/YjBI=;
 b=HT/a0geU2rb7M0JmAJ/0nozYbNgVZxfxOWrJDO7rNvkRo2wXWReZ+1Jip5f29msVi4
 2zLkyYNgDSe36wwVX2czaF2GGnsJExzcOvNWxPa0TGENq/hZQdCESzal3ci79IMN3fJM
 0kwVcsH/5srYuOm7p01dEHkAv0Jvnsm4qc0sqJBwX1tHs43JxFxBlBsTwPnSu1q7A3c7
 jwFs8di2ohvSdoacQ8qibMFMIxKt99pDfBvV9ZRQT+MNgZarJpbhMslzCEAiLRjDNok9
 ITou/Op1AFYm/XSHlGNT5f31AMW0MjFhVBdpuAyrVzxbvy9sM2qcG7Xl4R0KGCgx4vGX
 dVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4tbqQvnoVK3lZGspNq95Zwb17LCzzHK2/0Y4sp/YjBI=;
 b=p13wUJjcA1wif5l+tP5Hi0ZMcBHYJfuUEAbY6/qRIbKEYBM9ZkhGtwiOOGr+Ab3v8z
 Mb7sUb30goGMgIzmPNJHmOg4mUWj8EEmH284Gvt3vcGxL9GxuTB1/90qBKXQwYUAy1IH
 PEzSEhN3eAIru7pIYuWqfeRzNURSpgSsBrUOqXPs7JZFKFPdq5c7Y6tYZ2NXLGFXqTm1
 CMOIxt0++nlrw5GWE6qKEkjjUgqLv7WYhLkU/o4B30HDH3P77BDalMYsrdPGkdft+7ZY
 LL3MPOzC0k4vBhmZ0Z9RMrSExknsq6Tlu2pbRRe7nj/dj2p0WQxJDHHC7ODP31cMlqvU
 y7ew==
X-Gm-Message-State: AOAM531ZA8BujJWfYfTZ8SUcPhaDZnNQutJR9TgXbr3RmRq/Zt1FBAbs
 JWU7DZh3Acooae2Ym+rVMPkidiOPhNLtHA==
X-Google-Smtp-Source: ABdhPJyQZUAas6RUOIB8vshTChzZdGoNqb1Gelo/lyEmtha9ucoN5lbZQ/MjXFkBsjF+RsnsIL+QXA==
X-Received: by 2002:a05:600c:19ce:: with SMTP id
 u14mr18195273wmq.109.1615664976587; 
 Sat, 13 Mar 2021 11:49:36 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s8sm13823193wrn.97.2021.03.13.11.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:49:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/27] target/mips: Move MUL opcode check from decode_mxu() to
 decode_legacy()
Date: Sat, 13 Mar 2021 20:48:15 +0100
Message-Id: <20210313194829.2193621-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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

Move the check for MUL opcode from decode_opc_mxu() callee
to decode_opc_legacy() caller, so we can simplify the ifdef'ry
and elide the call in few commits.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index ad09321de84..17cf608d0bd 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -25783,19 +25783,6 @@ static void decode_opc_mxu(DisasContext *ctx, uint32_t insn)
 {
     uint32_t opcode = extract32(insn, 0, 6);
 
-    if (MASK_SPECIAL2(insn) == OPC_MUL) {
-        uint32_t  rs, rt, rd, op1;
-
-        rs = extract32(insn, 21, 5);
-        rt = extract32(insn, 16, 5);
-        rd = extract32(insn, 11, 5);
-        op1 = MASK_SPECIAL2(insn);
-
-        gen_arith(ctx, op1, rd, rs, rt);
-
-        return;
-    }
-
     if (opcode == OPC_MXU_S32M2I) {
         gen_mxu_s32m2i(ctx);
         return;
@@ -26994,7 +26981,11 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
 #endif
 #if !defined(TARGET_MIPS64)
         if (ctx->insn_flags & ASE_MXU) {
-            decode_opc_mxu(ctx, ctx->opcode);
+            if (MASK_SPECIAL2(ctx->opcode) == OPC_MUL) {
+                gen_arith(ctx, OPC_MUL, rd, rs, rt);
+            } else {
+                decode_opc_mxu(ctx, ctx->opcode);
+            }
             break;
         }
 #endif
-- 
2.26.2


