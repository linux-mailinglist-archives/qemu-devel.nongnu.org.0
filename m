Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C914A572840
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:08:38 +0200 (CEST)
Received: from localhost ([::1]:34472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBN7V-0006gb-Vk
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMuB-0006sa-K9
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:54:51 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMuA-0007Cw-5V
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:54:51 -0400
Received: by mail-wr1-x42c.google.com with SMTP id r10so6670483wrv.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MkJbeZ2YzCPPLGp8kgmOOD9tSwj1sJlRAj5pJts4/Ms=;
 b=P1MxcxvGewwYqY8CxeIi4RA8yTtuHJ0qoDjGLOcwx9QCguT1BteIfhIwZLLmLLZIEN
 rDMhjffbZe16wLsPouSqd3eB+fkr7GAdTscFM8byaxAOQSrw5WYT5k4nBu1UbGRloY+N
 t+XJMnDUek4ZBCLCN3Yqp9zNR3CXx4VsXHNdGWucdB7/eo0EXnEw+BsV3oxcQHs2vjg1
 tGNbk7mvsNybNglMHwIw8eziKXDV8j+RdlDvWYbX9me1h9y4OUKIoOypzkuC47EL8nmZ
 ntv0x5rYDfqsV4vQfdmPS4qE/Es5BtIKAT1+aD/oK7yiMxdtCoLjbkh3wFIzCDY6aVdE
 zAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MkJbeZ2YzCPPLGp8kgmOOD9tSwj1sJlRAj5pJts4/Ms=;
 b=POx4nLW2+cmifmygPfWjzORx1nTpTwxZWW3sC2RmXqzOmVreriui2aS77rtmYFQIbc
 YQdtdyvdMP3oKYWPZ9D3ZbBrOp8O/kMOHqek9c2aXsespxbCRj2PmChlvya2EaBK/LoR
 XcAu0Qtqg629bpZ8VmdOBlYrbQZOAZk6Viln8YvIoO7CIi82AtUKtHg4e/6pqBw3G6Pc
 /iTYUPm5JV/DCPvo//HCJOg4wdlD1gvBhYnR3sQExxTaPwNQAUAm7jSn1o8FRXaE/bWI
 MSGAU6+59NdRaz3Wi+KGPzyS3oKxNCWgtbc4iKhrPCV4BwtNjbObNlFCoYjRIPDqzzZU
 5VWA==
X-Gm-Message-State: AJIora8cpqem4/fx6KCwuiKz2MopeEAJIzrqZbH2hLDbJKXjdHwjVtvZ
 RoTYpHTGl0pkfzT4q9tpsTbgWepzc/+lji4m
X-Google-Smtp-Source: AGRyM1toJHVAITn/+cqSh693FDy3L5E1YbN+GFqcdp5WjWTIcugaAqB13LdmlkV/oHqTZgxeDFRTDQ==
X-Received: by 2002:a5d:5a9d:0:b0:21b:8247:7ec4 with SMTP id
 bp29-20020a5d5a9d000000b0021b82477ec4mr23461268wrb.561.1657659289195; 
 Tue, 12 Jul 2022 13:54:49 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v130-20020a1cac88000000b003a046549a85sm14939wme.37.2022.07.12.13.54.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Jul 2022 13:54:48 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 11/12] target/mips: Simplify UHI_argnlen and UHI_argn
Date: Tue, 12 Jul 2022 22:53:46 +0200
Message-Id: <20220712205347.58372-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712205347.58372-1-f4bug@amsat.org>
References: <20220712205347.58372-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

With semihosting_get_arg, we already have a check vs argc, so
there's no point replicating it -- just check the result vs NULL.
Merge copy_argn_to_target into its caller.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220628111701.677216-8-richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 44 ++++++++++++++----------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index ae4b8849b1..b54267681e 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -198,21 +198,6 @@ static void uhi_fstat_cb(CPUState *cs, uint64_t ret, int err)
     uhi_cb(cs, ret, err);
 }
 
-static int copy_argn_to_target(CPUMIPSState *env, int arg_num,
-                               target_ulong vaddr)
-{
-    int strsize = strlen(semihosting_get_arg(arg_num)) + 1;
-    char *dst = lock_user(VERIFY_WRITE, vaddr, strsize, 0);
-    if (!dst) {
-        report_fault(env);
-    }
-
-    strcpy(dst, semihosting_get_arg(arg_num));
-
-    unlock_user(dst, vaddr, strsize);
-    return 0;
-}
-
 #define GET_TARGET_STRING(p, addr)              \
     do {                                        \
         p = lock_user_string(addr);             \
@@ -285,18 +270,31 @@ void mips_semihosting(CPUMIPSState *env)
         gpr[2] = semihosting_get_argc();
         break;
     case UHI_argnlen:
-        if (gpr[4] >= semihosting_get_argc()) {
-            gpr[2] = -1;
-            return;
+        {
+            const char *s = semihosting_get_arg(gpr[4]);
+            gpr[2] = s ? strlen(s) : -1;
         }
-        gpr[2] = strlen(semihosting_get_arg(gpr[4]));
         break;
     case UHI_argn:
-        if (gpr[4] >= semihosting_get_argc()) {
-            gpr[2] = -1;
-            return;
+        {
+            const char *s = semihosting_get_arg(gpr[4]);
+            target_ulong addr;
+            size_t len;
+
+            if (!s) {
+                gpr[2] = -1;
+                break;
+            }
+            len = strlen(s) + 1;
+            addr = gpr[5];
+            p = lock_user(VERIFY_WRITE, addr, len, 0);
+            if (!p) {
+                report_fault(env);
+            }
+            memcpy(p, s, len);
+            unlock_user(p, addr, len);
+            gpr[2] = 0;
         }
-        gpr[2] = copy_argn_to_target(env, gpr[4], gpr[5]);
         break;
 
     case UHI_plog:
-- 
2.36.1


