Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B47416FC2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:57:53 +0200 (CEST)
Received: from localhost ([::1]:42050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThxo-0002mK-P6
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThhA-0005Qe-Ra
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:40:40 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThh8-0007Lh-VJ
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:40:40 -0400
Received: by mail-wr1-x42c.google.com with SMTP id t8so25632686wri.1
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FoSlQqSQ8ZbPbrlQxUB8XNqV2UVRF3KYNvOO8ZgTpHU=;
 b=e2rjeBReLlbDcXAeJ/Cb9Yn5v9MGsAeSRheiCavE1hU1Wv+UI1pnvHTj0fZQqwCGQ/
 S3xfunAeKPbEm+6rvV48GPUzAgvLd8ZFvNGFwRCbeY88vffmZ50SmpvSxMRU9m9foy2y
 hoXaSipiwwdgvSq1BYaiM0/VZlGe94i4SrDW3PVAseH9bV2DXtKLNHRcnAAHRj1oskZ1
 8KDTjzTxYFiTg7XUhyXrAMEm15JCMC3JSwBmASitL2joxL4fxC85Q6OkDgeIeZCEiUFg
 K6TJYsiLb+RhsAWG1u9i8NoyMHZXc+bU9sPU/spqF2snZD5kPV9RS6E9AqmKcZICatR7
 CJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FoSlQqSQ8ZbPbrlQxUB8XNqV2UVRF3KYNvOO8ZgTpHU=;
 b=DGrDih2MmXdU0zHMQ/FrUW3wQCrBbZJCf9itE9YKuQG5HYrK+nnzrfoVZln0jCQZia
 9o97kSQODIwh2tLd/9CYC9CyNSk+AOmP89rA9KNtZnb/JDQVcjlR/n7HxbiOY3HTKRz5
 T3+WNHL6psR8Ipi4jSI1eFLVxgbzjZlT8CPJCdXgNCbHcetNLJi8JmSJvV6LiPrMIwGa
 jJAjWNyF6FCCvdsiYHJ44C6KH2zOnZLrQhtzHHU5JsDgVQSxh0k2nEsZ2Cqwl+DuCMuA
 a+TSPy4o8+ELEw3oWOPjYBrg4myWOSOUCuvil0zpJBfKkiBttNVwqnNHuNezso2Ytitt
 3+fQ==
X-Gm-Message-State: AOAM532kY6MKNrm2mae2BvpN6JKn9GrGOkKET51sVm2+gDRXgf5UESmn
 SDgz8PY6ceS+O7XWZIyFAL3Qg73aFXM=
X-Google-Smtp-Source: ABdhPJxWcoBj6SCR5xO0qwLtIk6dqPprv8b3kvSgYvBzRvwxFpS1rYYwFwqP3o2oAip5FjrDfegeRg==
X-Received: by 2002:a1c:2246:: with SMTP id i67mr1015259wmi.157.1632476437444; 
 Fri, 24 Sep 2021 02:40:37 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 z13sm8769199wrs.90.2021.09.24.02.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:40:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 23/40] target/i386: Restrict has_work() handler to sysemu
 and TCG
Date: Fri, 24 Sep 2021 11:38:30 +0200
Message-Id: <20210924093847.1014331-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
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
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to TCG sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/cpu.c         | 6 ------
 target/i386/tcg/tcg-cpu.c | 8 +++++++-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6b029f1bdf1..36a1c5f3fd2 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6554,11 +6554,6 @@ int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
     return 0;
 }
 
-static bool x86_cpu_has_work(CPUState *cs)
-{
-    return x86_cpu_pending_interrupt(cs, cs->interrupt_request) != 0;
-}
-
 static void x86_disas_set_info(CPUState *cs, disassemble_info *info)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -6763,7 +6758,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = x86_cpu_class_by_name;
     cc->parse_features = x86_cpu_parse_featurestr;
-    cc->has_work = x86_cpu_has_work;
     cc->dump_state = x86_cpu_dump_state;
     cc->set_pc = x86_cpu_set_pc;
     cc->gdb_read_register = x86_cpu_gdb_read_register;
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 3ecfae34cb5..aef050d0898 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -55,6 +55,11 @@ static void x86_cpu_synchronize_from_tb(CPUState *cs,
 }
 
 #ifndef CONFIG_USER_ONLY
+static bool x86_cpu_has_work(CPUState *cs)
+{
+    return x86_cpu_pending_interrupt(cs, cs->interrupt_request) != 0;
+}
+
 static bool x86_debug_check_breakpoint(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -63,7 +68,7 @@ static bool x86_debug_check_breakpoint(CPUState *cs)
     /* RF disables all architectural breakpoints. */
     return !(env->eflags & RF_MASK);
 }
-#endif
+#endif /* CONFIG_USER_ONLY */
 
 #include "hw/core/tcg-cpu-ops.h"
 
@@ -76,6 +81,7 @@ static const struct TCGCPUOps x86_tcg_ops = {
 #ifdef CONFIG_USER_ONLY
     .fake_user_interrupt = x86_cpu_do_interrupt,
 #else
+    .has_work = x86_cpu_has_work,
     .do_interrupt = x86_cpu_do_interrupt,
     .cpu_exec_interrupt = x86_cpu_exec_interrupt,
     .debug_excp_handler = breakpoint_handler,
-- 
2.31.1


