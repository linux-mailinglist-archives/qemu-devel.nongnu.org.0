Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E054A4079BB
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 19:06:38 +0200 (CEST)
Received: from localhost ([::1]:57360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6Sb-0002Lq-Us
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 13:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6Id-0000F2-2H
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:56:19 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:35482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6Ib-0003Bf-J8
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:56:18 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 z9-20020a7bc149000000b002e8861aff59so3753426wmi.0
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HTLBpMUvcY2BxzZIjZoxS//8tbEgCAlf+xtbD3ElAZQ=;
 b=b/LlVW3DhSiwv4vtUi6kR3E4BEfkT610OdllyqrQjfOqyPhC8WcRWqw/IMFEe+q6ua
 2iT+miGT1UTaIl+FHImTDpllZGZejkgZoB7pCHeEeC496EFU7mPGf2FxjadSUJijNhKB
 +dScjGJs4L4ghaadKYIVAQiH4uqO1enr3sGyxD5oI6kYoWMpT6oZTTbT+AY0MwKOnY2h
 P/ojAmEbuqR5I/dltpSc5LAAPbVMDyAHtcN+Pjl0AXOqbk7LBNoDzr2Qr9vSzX/cgv5Y
 pL5Zmp8izpI3YO13k3LxoXfIWNyhQrV7nRmMb6tFmwXmJ4m1zyBfnbjMTZm6jekNx5Dh
 RxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HTLBpMUvcY2BxzZIjZoxS//8tbEgCAlf+xtbD3ElAZQ=;
 b=KwPMzxCrNdtcpt0S1oLO1w1AyqJ8lH7gXL1Vj/aGvGFFoi2qeglnB1vp+3ah35gr3j
 oeAzL0kOFfRO4ddcypVimPRd4CNFf6V/WRpNjdGlfg4jCs0nCPMTlsAcFY3EwNuZ8sWa
 +sYq56jUfjCFIQ6mIJnSzVPVrOX+jjxix5QQt9rqhJI+IQHeR4SzOdQu4FaPbcyngJB8
 2sQ9nlKnb5C22v+cyD49e8ChGPb6jbpXbt3Tn96pxSNYDBUNJROdyIzcfqPnqhNplKkn
 G2xelwVHqvL7FGeFhnj9xuybjb+bZNScujAMIPDsNtq8yaIipUzC+/c52ii8qqDVaTvK
 03aw==
X-Gm-Message-State: AOAM530skjU6yCUtYamMk3ImdFOd0NAhHrMBHsAMVgP5Liju/sGEYQfI
 sq0WyiLFeEqwdhKepMCeIqOqkl6A4vI=
X-Google-Smtp-Source: ABdhPJwHxU0kAm+AuDowrvrYIxotU4CgV4C5OfRKcNUwvBZy5ePZ4CODF0tpBQ/1WlD5C6ZYuplMWg==
X-Received: by 2002:a7b:c351:: with SMTP id l17mr3394778wmj.120.1631379375961; 
 Sat, 11 Sep 2021 09:56:15 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id s14sm1913896wmc.25.2021.09.11.09.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:56:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/24] target/sparc: Restrict cpu_exec_interrupt() handler
 to sysemu
Date: Sat, 11 Sep 2021 18:54:30 +0200
Message-Id: <20210911165434.531552-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210911165434.531552-1-f4bug@amsat.org>
References: <20210911165434.531552-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sparc/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index da6b30ec747..5a8a4ce7506 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -77,6 +77,7 @@ static void sparc_cpu_reset(DeviceState *dev)
     env->cache_control = 0;
 }
 
+#ifndef CONFIG_USER_ONLY
 static bool sparc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     if (interrupt_request & CPU_INTERRUPT_HARD) {
@@ -96,6 +97,7 @@ static bool sparc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return false;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void cpu_sparc_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
@@ -863,10 +865,10 @@ static const struct SysemuCPUOps sparc_sysemu_ops = {
 static const struct TCGCPUOps sparc_tcg_ops = {
     .initialize = sparc_tcg_init,
     .synchronize_from_tb = sparc_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
     .tlb_fill = sparc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
     .do_interrupt = sparc_cpu_do_interrupt,
     .do_transaction_failed = sparc_cpu_do_transaction_failed,
     .do_unaligned_access = sparc_cpu_do_unaligned_access,
-- 
2.31.1


