Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAA6407EFE
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:35:24 +0200 (CEST)
Received: from localhost ([::1]:50030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTNz-0004X7-PX
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTHn-0008V3-Ka
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:59 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTHl-00052N-A6
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:59 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d6so10903108wrc.11
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iR+hhecIhVQbqLgRtJRf7TAYJMYyVJckrOxOor2tvDk=;
 b=Km1MULYmj0Ny5qAgjgiYt0+8985JQFOmfQjMiOZk5aZYFH+qDq/ZcwEFGh2NwJsC6V
 83JKTq9wwAvowzEwI6OdFmOzrbT4IjNPqyneJiIm/MZ7BBlnjqTgDe3g6I7EIh2LIEW3
 OxGyxtYvKu6pZJ2dZ8f0ycVbt4on/mbF9e6ZOLky6iOQLRHRRZrLRmf/aTZwebE+5b37
 VsxTcBMFO+zIObZsa09JX1tP35aXgWi+qfOs1j8rouAYExe04lMGKO7MC7nnkWLs2AYN
 xC5fAK3JD5HV0/LDOyWKWRsQQ7tb6QZm9uh7HGxv2EcXGxBPE5Yz8rNZBaSndC2FuaAH
 QwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iR+hhecIhVQbqLgRtJRf7TAYJMYyVJckrOxOor2tvDk=;
 b=1SPi5mItjbK9apN2lzOXl/IW3vwWiq/IZh0ZqkQQzIs2UBcUUB5yCNxkEyFnuX7XjH
 UN2XpdfM7dsbDY/NXVkJBk75qBZ8ZQnqj7r2fRGdCsxIU0AcAR4poapU+atYK3+bJrZk
 EBh6j3UO7nsDrv2qpK90DjNDZDdOQCi5JWmYkuLklv6gGcxKQYIKbOVfF9xnvbcUzV+t
 EW3ubOmIec7Wu4s3pRQP8ENgdk4TIQ/kKfYdpNdQ0LYID4x2ycMRTTcXzfG7DnuCY/uF
 vboLBTX1Ayt+xRIfXpE4cK8AWYTcMAMtbHG10STt6m5VV3KLgHTEkCwlIJkvyOjt62ke
 iWIQ==
X-Gm-Message-State: AOAM530heSTkTuCYw5yKH6x0CP+1kbmRdRNw5591xKmvEA4JM34AuTY7
 uDqFbJ9fJzUP6yspb7VzGtVL+pWatIE=
X-Google-Smtp-Source: ABdhPJzU7MuXs4at3A+Bk4aHamvvUrBbPUqIgGbly9mnyE+UFtwmNwza5KGFZJ0vRbGBUkbAHXWtiw==
X-Received: by 2002:adf:b78d:: with SMTP id s13mr8552857wre.344.1631467735871; 
 Sun, 12 Sep 2021 10:28:55 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id r25sm5063147wra.76.2021.09.12.10.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:28:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 17/30] target/mips: Restrict has_work() handler to sysemu
 and TCG
Date: Sun, 12 Sep 2021 19:27:18 +0200
Message-Id: <20210912172731.789788-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to TCG sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 00e0c55d0e4..3639c03f8ea 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -128,6 +128,7 @@ static void mips_cpu_set_pc(CPUState *cs, vaddr value)
     mips_env_set_pc(&cpu->env, value);
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool mips_cpu_has_work(CPUState *cs)
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
@@ -172,6 +173,7 @@ static bool mips_cpu_has_work(CPUState *cs)
     }
     return has_work;
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 #include "cpu-defs.c.inc"
 
@@ -542,6 +544,7 @@ static const struct TCGCPUOps mips_tcg_ops = {
     .tlb_fill = mips_cpu_tlb_fill,
 
 #if !defined(CONFIG_USER_ONLY)
+    .has_work = mips_cpu_has_work,
     .cpu_exec_interrupt = mips_cpu_exec_interrupt,
     .do_interrupt = mips_cpu_do_interrupt,
     .do_transaction_failed = mips_cpu_do_transaction_failed,
@@ -563,7 +566,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_props(dc, mips_cpu_properties);
 
     cc->class_by_name = mips_cpu_class_by_name;
-    cc->has_work = mips_cpu_has_work;
     cc->dump_state = mips_cpu_dump_state;
     cc->set_pc = mips_cpu_set_pc;
     cc->gdb_read_register = mips_cpu_gdb_read_register;
-- 
2.31.1


