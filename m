Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB284128CB
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:24:43 +0200 (CEST)
Received: from localhost ([::1]:46762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRiM-0001go-Of
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR81-0006R0-3t
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:47:11 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR7z-0003Q9-Lv
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:47:08 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i23so33603262wrb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F6iT0mYKdizTZwY+Alp0nWU9C8rVfDyZdw7MbXpCAAA=;
 b=Tyxc9eLFkeYJdojgIyuM4bw2U4FTBhzD9h2ccY3ujNwWeY+Vel6Y5tNo2HoE5ZmQzH
 YJBd+3lLpwAAakStc4w6aLcTUm4eygiKh5XS9NgSC1bfTZXocViDkggZDrWDPvMT94+s
 kE84wYfg1iDWeSSZceoVBlWixU9gPNC0EDJiIa8tB74m+Ssg8IHAt0VK+UcrCg/e4SEn
 5GhVLlNrhvuLd4NQynDDhxKAoo8zNMM/WypKi/b6rktJFkWKNRtJiANxpvo/7FbRI5Ql
 EC7qNoxMPNuA9PDT6NiT8LcY94D4DNmzlCKFudXfn3nK1NhWvSRXPL1RhJ7dSzsZOHao
 nVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=F6iT0mYKdizTZwY+Alp0nWU9C8rVfDyZdw7MbXpCAAA=;
 b=vrjL8bDONVj4Tzlc2id1rEk3k8XKuyckQakqV9IfYqKWiC2T9/okHoeg2bjK4t5Lqu
 W+vett/4Hbycg0gJieiQPKQ5Tc84dGak9WWdsu7Q7z07NNWN7Bxb0U1VhVs5nO/mrYDl
 T1wzkq0pusGAB3T0U6HiP9s9/dO8u49BYg99VkndhoqMT9jkui3juC0kK5px6blzIiPf
 3L4/+M/lqVm1pU9y5e3dl1JETLL2M5zIZcLDuhhUDPrV3cHi3p+JRS0uX4LVw0EoXf9m
 mdK400TA07M+i9oONvCoCchya+Wh5IaR75SCRa2lXZuqYvaJClLdTfcOI4HzDamx13Lp
 cDyw==
X-Gm-Message-State: AOAM531kVk05w1V+ChrvegzpNpHaBTcRHoTkzov7r79IitdRzvvIQLo/
 vJBXaAVKYXHjZ0qoK9edF4m0Yb40QWs=
X-Google-Smtp-Source: ABdhPJzxbVt6a8xXkBu/CtYSdFkRFxnjAU66PDG/iBh3IWbVr4lFDuJVYRiIwTPWwudj+x/6UrDp7g==
X-Received: by 2002:a05:6000:1a52:: with SMTP id
 t18mr30410973wry.21.1632174426088; 
 Mon, 20 Sep 2021 14:47:06 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 a77sm678969wme.28.2021.09.20.14.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:47:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 30/31] target/xtensa: Restrict has_work() handler to sysemu
Date: Mon, 20 Sep 2021 23:44:46 +0200
Message-Id: <20210920214447.2998623-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 target/xtensa/cpu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index c1cbd03595e..5cb19a88819 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -43,18 +43,17 @@ static void xtensa_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+#ifndef CONFIG_USER_ONLY
+
 static bool xtensa_cpu_has_work(CPUState *cs)
 {
-#ifndef CONFIG_USER_ONLY
     XtensaCPU *cpu = XTENSA_CPU(cs);
 
     return !cpu->env.runstall && cpu->env.pending_irq_level;
-#else
-    return true;
-#endif
 }
 
-#ifdef CONFIG_USER_ONLY
+#else /* CONFIG_USER_ONLY*/
+
 static bool abi_call0;
 
 void xtensa_set_abi_call0(void)
@@ -66,7 +65,8 @@ bool xtensa_abi_call0(void)
 {
     return abi_call0;
 }
-#endif
+
+#endif /* CONFIG_USER_ONLY */
 
 static void xtensa_cpu_reset(DeviceState *dev)
 {
@@ -196,6 +196,7 @@ static const struct TCGCPUOps xtensa_tcg_ops = {
     .debug_excp_handler = xtensa_breakpoint_handler,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = xtensa_cpu_has_work,
     .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .do_interrupt = xtensa_cpu_do_interrupt,
     .do_transaction_failed = xtensa_cpu_do_transaction_failed,
@@ -215,7 +216,6 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, xtensa_cpu_reset, &xcc->parent_reset);
 
     cc->class_by_name = xtensa_cpu_class_by_name;
-    cc->has_work = xtensa_cpu_has_work;
     cc->dump_state = xtensa_cpu_dump_state;
     cc->set_pc = xtensa_cpu_set_pc;
     cc->gdb_read_register = xtensa_cpu_gdb_read_register;
-- 
2.31.1


