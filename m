Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA864128AF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:12:24 +0200 (CEST)
Received: from localhost ([::1]:41918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRWS-0004Zl-1O
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR7V-0005DA-0N
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:46:38 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR7T-0002zD-ID
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:46:36 -0400
Received: by mail-wr1-x430.google.com with SMTP id d6so33418008wrc.11
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FSh6oWLMIgLLqTTqDcEll1Q32OdPIjqXmSpoO2tYnP4=;
 b=CSYfuQgEGr1P/ImdWdV/+6Ny7RtT4du9pw+0i0l/xJTZX7u0rwTy68fb0AeYVIARaJ
 9/aaGeX+AYDL6BKFwr8hsyKr9CxECF6dwPJx2OGBYqU1knTnwdG8/CYSy7hfAjvDlw73
 6L/pKLxAKblbX/VtoYO8kZD0RgcWiiCZt2vZ5IhkcbKblgY/BV/iYz4W52GtyE2eaXtg
 Wq+4HNJCOss/4OdIyyFPWhqY7vLcRmNiUYVxr1MCvICqgq4kpENT9ezOATDI5BaHW9V+
 jmG8G3LSB6hstBQ1QNhB3Rixqj9lBjj/AyS8o1RG4e/JJd5vvZQCUsGkJnQ7xYWWTCCG
 h1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FSh6oWLMIgLLqTTqDcEll1Q32OdPIjqXmSpoO2tYnP4=;
 b=xdm1RZVfkf/BgbqSLrDpaciRCMUWftRC5Vu6QsEsgPp8GFnDem+GaIQIZcNUwvzuIW
 pltfUBz0UcFg45NcpWEXJciVye5gxRZNSYELHPZbKoG1oVdSOr2I07QaR5Bg9G1OPKr6
 G9JIzGwLolwPKo7rTD8jpz6HG89rECQL1qYlxVH4vDbj58wpP2fSjf4SWBTSANdmKHCW
 HwhBYws77AD4xOf7KHX27r3Ovkp+G90Eg1gppVdq/YdyaOYjs2oUtcOQHTsCvt5Ac5vL
 /+dCt/SHLUYq5SiYvKQCKuJODavbUuPERzk0O9TH0tdBeohwpEZFPxbCiQrS/ME1HEiD
 0r/Q==
X-Gm-Message-State: AOAM533Q+oPn+HurwNzOK26RFapLIFHlksj3hOq/ZcO9DIYqXpDLLsBs
 SUIrPHmSmOzF12S/faHt6UHXZTfQ9ZM=
X-Google-Smtp-Source: ABdhPJwSm8TBDSoIqISABflKhkyxJol0VAi3w1ycqhUpkjlskgtB0WAY7QY3N+AhpjtEe2yvI5RRrg==
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr10474263wry.292.1632174394073; 
 Mon, 20 Sep 2021 14:46:34 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 j134sm850886wmj.27.2021.09.20.14.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:46:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 23/31] target/riscv: Restrict has_work() handler to sysemu
 and TCG
Date: Mon, 20 Sep 2021 23:44:39 +0200
Message-Id: <20210920214447.2998623-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

Restrict has_work() to TCG sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/riscv/cpu.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 13575c14085..abb555a8bdb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -335,9 +335,9 @@ static void riscv_cpu_synchronize_from_tb(CPUState *cs,
     env->pc = tb->pc;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool riscv_cpu_has_work(CPUState *cs)
 {
-#ifndef CONFIG_USER_ONLY
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     /*
@@ -345,10 +345,8 @@ static bool riscv_cpu_has_work(CPUState *cs)
      * mode and delegation registers, but respect individual enables
      */
     return (env->mip & env->mie) != 0;
-#else
-    return true;
-#endif
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
                           target_ulong *data)
@@ -647,6 +645,7 @@ static const struct TCGCPUOps riscv_tcg_ops = {
     .tlb_fill = riscv_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = riscv_cpu_has_work,
     .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
     .do_interrupt = riscv_cpu_do_interrupt,
     .do_transaction_failed = riscv_cpu_do_transaction_failed,
@@ -666,7 +665,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_reset(dc, riscv_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = riscv_cpu_class_by_name;
-    cc->has_work = riscv_cpu_has_work;
     cc->dump_state = riscv_cpu_dump_state;
     cc->set_pc = riscv_cpu_set_pc;
     cc->gdb_read_register = riscv_cpu_gdb_read_register;
-- 
2.31.1


