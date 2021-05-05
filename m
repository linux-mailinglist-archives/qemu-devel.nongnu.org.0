Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD61373F7B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 18:21:16 +0200 (CEST)
Received: from localhost ([::1]:40450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leKGx-0004rc-OM
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 12:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1leK07-00038y-5q
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:03:51 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:43672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1leK05-0000mA-JH
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:03:50 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 b19-20020a05600c06d3b029014258a636e8so1450770wmn.2
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 09:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mhLJd1wAg+mbKgDbWE9h0dMpJv6ERkP2L0spY5MQdj8=;
 b=vTqVgFa99EJpcAz42fb4gb9XVJs/79XtzuVMddYTb9H2rUStmovHMKjGAhHBjnbgSe
 t5Qg78uDhsJZt47Mj0basVbXhkx4Gf5X0TLKOiZgBlwm5cl2DPxRoTNkMgSJ1UiLVeMd
 bMwrYc581JD7wgrZojLjeWBw8LwLh6fnRX6VOunKChSF2Cs4h4QwqLPL2uVU0Q5MGzN1
 xNry0gLIDtTHjyY87luNJnnMptv2stgjE7V2pSb5yKSrHxrCUTWCOCgNAIPoAjlsm0Cs
 YG7VhKpoE1iVPH3ZmYptsXRsAdXujX4TjQVf8D5pm2Y7n8+4vuVsPxaUbdN5XNhAAqpF
 f3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=mhLJd1wAg+mbKgDbWE9h0dMpJv6ERkP2L0spY5MQdj8=;
 b=YjdpKveL4IP7IF/6boDo9KOEEI1Kb5xRm4KrYpznbzfGj7PSm3xJUI93XokHwDP1+7
 v8/4j/FJDzXQmArYM/oBR8Os4oITPVre8/l1m5aujJltX/DvU7kFRqh3KW1Jqz+24C32
 x51aDtV8+aBhprSq2wUHA/9gYNul7DbaziEsd1uWppDGxpCGJkUixa6qipfFz5YS5q7o
 KGLQVtt0NR12WpDO61WD2HlILPSaQwUtY5kxVpn8PmWwbT9lhrPCkt2mkGD568b0XE1h
 YJtAAHQUwrZFJOC+wJ2nj+BxqS2j+qC2BAmPQCZ3MGkULDWwRAYbvLxuxqc0hlZGlnmz
 6jiw==
X-Gm-Message-State: AOAM533UZ3Lfcw4Rky1M+R5woiZ0yFkzEF0Bwu2o7lj1B9T+pVpLupCF
 soyFm+jw3nU6Q/6W9Gl+1t81nnMUYzj6E4to
X-Google-Smtp-Source: ABdhPJzXk/UvANH9PqfpkpT+BEOSEeCYb4kUOjf/9ox+kdu6Tb4Z3htxei6267iOk35HuSHt0G7c3A==
X-Received: by 2002:a05:600c:4982:: with SMTP id
 h2mr33396090wmp.108.1620230627164; 
 Wed, 05 May 2021 09:03:47 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id i14sm5174442wmq.1.2021.05.05.09.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:03:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/m68k: Remove unused variable in ABCD/SBCD memory
 opcodes
Date: Wed,  5 May 2021 18:03:44 +0200
Message-Id: <20210505160344.1394843-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ABCD / SBCD memory opcodes (introduced in commit fb5543d8200)
don't use their "addr" variable.

Remove the unused variable and pass a NULL argument instead to
gen_ea_mode(). This fixes warnings generated when building with
CFLAGS=-O3 (using GCC 10.2.1 20201125):

  target/m68k/translate.c: In function ‘disas_sbcd_mem’:
  target/m68k/translate.c:897:13: warning: ‘addr’ may be used uninitialized in this function [-Wmaybe-uninitialized]
    897 |             delay_set_areg(s, reg0, tmp, false);
        |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  target/m68k/translate.c:1866:21: note: ‘addr’ was declared here
   1866 |     TCGv src, dest, addr;
        |                     ^~~~

  target/m68k/translate.c: In function ‘disas_abcd_mem’:
  target/m68k/translate.c:897:13: warning: ‘addr’ may be used uninitialized in this function [-Wmaybe-uninitialized]
    897 |             delay_set_areg(s, reg0, tmp, false);
        |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  target/m68k/translate.c:1829:21: note: ‘addr’ was declared here
   1829 |     TCGv src, dest, addr;
        |                     ^~~~

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/m68k/translate.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 200018ae6a6..5cdd026a4b2 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -1826,7 +1826,7 @@ DISAS_INSN(abcd_reg)
 
 DISAS_INSN(abcd_mem)
 {
-    TCGv src, dest, addr;
+    TCGv src, dest;
 
     gen_flush_flags(s); /* !Z is sticky */
 
@@ -1835,11 +1835,11 @@ DISAS_INSN(abcd_mem)
     src = gen_ea_mode(env, s, 4, REG(insn, 0), OS_BYTE,
                       NULL_QREG, NULL, EA_LOADU, IS_USER(s));
     dest = gen_ea_mode(env, s, 4, REG(insn, 9), OS_BYTE,
-                       NULL_QREG, &addr, EA_LOADU, IS_USER(s));
+                       NULL_QREG, NULL, EA_LOADU, IS_USER(s));
 
     bcd_add(dest, src);
 
-    gen_ea_mode(env, s, 4, REG(insn, 9), OS_BYTE, dest, &addr,
+    gen_ea_mode(env, s, 4, REG(insn, 9), OS_BYTE, dest, NULL,
                 EA_STORE, IS_USER(s));
 
     bcd_flags(dest);
@@ -1863,7 +1863,7 @@ DISAS_INSN(sbcd_reg)
 
 DISAS_INSN(sbcd_mem)
 {
-    TCGv src, dest, addr;
+    TCGv src, dest;
 
     gen_flush_flags(s); /* !Z is sticky */
 
@@ -1872,11 +1872,11 @@ DISAS_INSN(sbcd_mem)
     src = gen_ea_mode(env, s, 4, REG(insn, 0), OS_BYTE,
                       NULL_QREG, NULL, EA_LOADU, IS_USER(s));
     dest = gen_ea_mode(env, s, 4, REG(insn, 9), OS_BYTE,
-                       NULL_QREG, &addr, EA_LOADU, IS_USER(s));
+                       NULL_QREG, NULL, EA_LOADU, IS_USER(s));
 
     bcd_sub(dest, src);
 
-    gen_ea_mode(env, s, 4, REG(insn, 9), OS_BYTE, dest, &addr,
+    gen_ea_mode(env, s, 4, REG(insn, 9), OS_BYTE, dest, NULL,
                 EA_STORE, IS_USER(s));
 
     bcd_flags(dest);
-- 
2.26.3


