Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE67D418C74
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:44:25 +0200 (CEST)
Received: from localhost ([::1]:36296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcsi-0000V3-T0
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcee-0005SA-HS
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:29:54 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcec-00071K-6I
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:29:51 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t8so46619351wri.1
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o/vqGSMOnhzvKGrld2aIeHhcVaK006Y9gzP+FF74z+I=;
 b=XNd8MKI/q2Q4tkPh3KCDOt78/7GagcGlDD8vBUoFfiHY1/wBN5Y1H+0sP7j1m5pxta
 Aq3b98UYKmVPJxjj5ySPB/zOoHIk+xCZAaIfNdU7oFOuVMXU+6F0etpBoiCxdZ8xq2Up
 nsv9YK4e+4W7DyrShSWAQ0RpFxKZfyp5xl8F5iSyHfwp3imUL39HLhoTYQ8tDUznv5PH
 7vkHHVKvGVh/64eNwhi8kcDi/Q5czXhYCTszgLsaMdBWGEm0zB+c3FZfuUDtIHT/NGx5
 CB9d+FXh2xcnAAUhAonkRfo9uV3/0jeN0VRHw6uxTSom4NHaph51IEro2EK/HRvZtHdC
 OLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=o/vqGSMOnhzvKGrld2aIeHhcVaK006Y9gzP+FF74z+I=;
 b=7X8yA9ZzM5kDCQDQ3OS2XLn2dzsBSjKG2Xd3YbMaBQdPFAEUUTrxVShMQP6+3+Io98
 4YygYlZ8o/O2EsU00iIiiO8NkPfGMIo5lxEmoFy9q3J0vaRkEEjXjkEgYGSF7Ei/aF8c
 exWy5RYj/TUWf3PwFb/tIliJOjHwU7zqjhp+MWvrWDzfU2FHlPEmMdiqzSiKoPNjK+91
 bHz1RqHPY7viuPkldim0yHM3xil8G6Pt4Lbw63O1jlgCvRQdhzVgc2uM7tbmEPT0KcXR
 khZMCRbceEUNxOhi5KvNB8IgBkuUjpseIrm94IBBNO5aPYXW/s/EhBRo7cPdGkSsEAoW
 gtGA==
X-Gm-Message-State: AOAM531IqwACq1Jrt0subiBcSXUp2zrbq0kfGlawjEZdnJPXzVNteuGn
 jDjvKWO+VNKsq+3EscrtwmkEgmY46jU=
X-Google-Smtp-Source: ABdhPJxpeiqSvwN67DdkIiy/xz9sJwgULgG2GJU+8dS6U3Y/PoKWfKjSd58qKhvDex7kIZ8Mx/H8AQ==
X-Received: by 2002:adf:a3c3:: with SMTP id m3mr24917528wrb.237.1632695388674; 
 Sun, 26 Sep 2021 15:29:48 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 i18sm15033279wrn.64.2021.09.26.15.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:29:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 32/40] target/rx: Restrict has_work() handler to sysemu
Date: Mon, 27 Sep 2021 00:27:08 +0200
Message-Id: <20210926222716.1732932-33-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/rx/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 25a4aa2976d..ac6b40b2716 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -41,11 +41,13 @@ static void rx_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.pc = tb->pc;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool rx_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request &
         (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIR);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void rx_cpu_reset(DeviceState *dev)
 {
@@ -189,6 +191,7 @@ static const struct TCGCPUOps rx_tcg_ops = {
     .tlb_fill = rx_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = rx_cpu_has_work,
     .cpu_exec_interrupt = rx_cpu_exec_interrupt,
     .do_interrupt = rx_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -206,7 +209,6 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
                                   &rcc->parent_reset);
 
     cc->class_by_name = rx_cpu_class_by_name;
-    cc->has_work = rx_cpu_has_work;
     cc->dump_state = rx_cpu_dump_state;
     cc->set_pc = rx_cpu_set_pc;
 
-- 
2.31.1


