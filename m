Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFE2400DAE
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 02:16:56 +0200 (CEST)
Received: from localhost ([::1]:43184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMfqB-00071x-Be
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 20:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfXZ-0000O0-E8
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:57:41 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfXX-0008WL-Rh
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:57:41 -0400
Received: by mail-wr1-x42a.google.com with SMTP id z4so4045217wrr.6
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xbkBh1p97u6mIkTKAA2kHg2qUMQVayjkKn9c7GCbY1E=;
 b=liicJy3HDokXxTxtoAkZF3mKr3GJOuPJWh+VuvrskAiQVhGnR+kud/sJi/EdWg0ZWe
 oVZsuM0Yy+jvpNxjxoIKFQDTZO93/V8mJmd/ql56zFlwtTq3EdDDAI23sWGD0rc6KZ75
 nJslE40hnXxb3HcTaF0F0+pAGjiUZBzq3c5hIgbdTjB6JNViUeOYWZtIuYSfTEP0IFNK
 4Dkwll+iltiCtPt2hy2sekL/FD3lV+gXlEgi5JU6g+mC4K2WrxJdAIVyrlzCaDCm+3pB
 7Bj15StYpg2UpgcFE4gbYEH+Gyg3ucIHbUzV7dQaaVt1ZgIQZuo7oFezoL+jHQhcBrbA
 FbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xbkBh1p97u6mIkTKAA2kHg2qUMQVayjkKn9c7GCbY1E=;
 b=RqhF4U8KlS7nE6XVboxz0utvGnEWm84RpNxNqhlstHQobBbwkOXhFpG7+illYUBLKB
 5dGgL7uAmwnMKiHhdrVIc5dcnv3d3j2lqgq/ubCSeZi2nQ7N+MmCBmTJj+nRu7jgWMf+
 AB/dtjJ+WqhO2QCOuBvGci+nlSOfBfSVBpVAxyDz+nVjtiTYdqBUV7t0iB3hJfGMBBSi
 y2gLFeBOgMqyZC74I1xvTMTg6ER5rdwFEzarmx50m3ApM/8YGcRB0Wim/nHUoc7C7WEM
 nSLUchAvvixSz3ee743iBWUAbAlmThnd0UNPjlwGWyfhMqdVf2JZjjsHSrjFumSUMVVq
 h6lQ==
X-Gm-Message-State: AOAM531EftOiXdnYMjYz7Pyej7UCPiYpdBrNyxEQxji//6h2Y19tIVzm
 L+uK23TB0kUgQwj4n+TS0q5+lL3QfKk=
X-Google-Smtp-Source: ABdhPJzJey5n/hPtlOgCqkrUJcGPbn4g5ZR3cVbbnEc9rubNanAorF6S6RoCOlvK7bwPvncfQvzZCQ==
X-Received: by 2002:adf:e712:: with SMTP id c18mr5856448wrm.438.1630799858327; 
 Sat, 04 Sep 2021 16:57:38 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id r25sm2243268wrc.26.2021.09.04.16.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:57:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/24] target/xtensa: Restrict cpu_exec_interrupt() handler
 to sysemu
Date: Sun,  5 Sep 2021 01:55:40 +0200
Message-Id: <20210904235542.1092641-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904235542.1092641-1-f4bug@amsat.org>
References: <20210904235542.1092641-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/xtensa/cpu.h        | 4 ++--
 target/xtensa/cpu.c        | 2 +-
 target/xtensa/exc_helper.c | 7 ++-----
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 1e0cb1535ca..cbb720e7cca 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -566,14 +566,14 @@ struct XtensaCPU {
 bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr);
+#ifndef CONFIG_USER_ONLY
 void xtensa_cpu_do_interrupt(CPUState *cpu);
 bool xtensa_cpu_exec_interrupt(CPUState *cpu, int interrupt_request);
-#ifndef CONFIG_USER_ONLY
 void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       unsigned size, MMUAccessType access_type,
                                       int mmu_idx, MemTxAttrs attrs,
                                       MemTxResult response, uintptr_t retaddr);
-#endif /* !CONFIG_USER_ONLY */
+#endif
 void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void xtensa_count_regs(const XtensaConfig *config,
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 58ec3a08622..c1cbd03595e 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -192,11 +192,11 @@ static const struct SysemuCPUOps xtensa_sysemu_ops = {
 
 static const struct TCGCPUOps xtensa_tcg_ops = {
     .initialize = xtensa_translate_init,
-    .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .tlb_fill = xtensa_cpu_tlb_fill,
     .debug_excp_handler = xtensa_breakpoint_handler,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .do_interrupt = xtensa_cpu_do_interrupt,
     .do_transaction_failed = xtensa_cpu_do_transaction_failed,
     .do_unaligned_access = xtensa_cpu_do_unaligned_access,
diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
index 10e75ab070d..9bc7f50d355 100644
--- a/target/xtensa/exc_helper.c
+++ b/target/xtensa/exc_helper.c
@@ -255,11 +255,6 @@ void xtensa_cpu_do_interrupt(CPUState *cs)
     }
     check_interrupts(env);
 }
-#else
-void xtensa_cpu_do_interrupt(CPUState *cs)
-{
-}
-#endif
 
 bool xtensa_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
@@ -270,3 +265,5 @@ bool xtensa_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return false;
 }
+
+#endif /* !CONFIG_USER_ONLY */
-- 
2.31.1


