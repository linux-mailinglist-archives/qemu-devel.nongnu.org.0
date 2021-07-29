Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1073D9AC4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:03:43 +0200 (CEST)
Received: from localhost ([::1]:42624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uSc-0005zt-C3
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCf-0004Mc-BY
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:14 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:43737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCc-0002Zf-LV
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:13 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 m2-20020a17090a71c2b0290175cf22899cso6744132pjs.2
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DmXl9DvoFiIMYZO3Xai8Zh+D5bFlHeruBJIEw/zNnu0=;
 b=R+5tWCz5jLWqj0lkcMnzXoE28H0K7C2+VvqSLR3EqtgBKwQfnazDd4eye+oivhoeTp
 S0h3DPbErG/b0dH8LonbAc3fojr0qGRgjV7utRSsLN7Y2NGfROdBTgVIyXSPRFfMuBKK
 I0USGl6VpoXSGHOSXx51ozhd/VlR7s3N1Qq4dbfh7Z9awx4R9K2ScSoGN8I+SamogGlJ
 4gYr+oni4OrQgr55/nDLFkMVK/Cd0IYFN53KdIquWd+IpbegA6csv/Zrfb6wfls9bP19
 uYpivBwna41oW1XxNN1rUqwBRpW4j0e1YYjqA622g61qWPhEoIAEhnBm8MiO93cITkHN
 XZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DmXl9DvoFiIMYZO3Xai8Zh+D5bFlHeruBJIEw/zNnu0=;
 b=KEe+L34shjT6Ux3MVO1eNm6DNo+Grqh84PAK8Y+2ECgbcjQR4uKVX7BQ8OqG0kbaPh
 ee7A5J9icT67uZNhaJzFVZJ8xZ/qIMXg1LPKu8+BGgf4vV9wP6/2wfSN9Nquchg/31SG
 LgYHHM42zfn/HIwW4fmcA3yyljPHM6TTRnnz+IIDd2Kj7LHxeL4MkfyLsU9stih/7zjv
 o9b0lhSrGWetJIMTUhn22AvycdWmu5BTNkU09OGikkGqxIdSsbiij7aIkLzl7mwXkYLU
 Tc/FSxBNgBWBQxWeR5oGDaEXKF/4pNzkLHn3jJo64eIpQ8saaldvMhTygTvMmopHJBNm
 sKLA==
X-Gm-Message-State: AOAM533KeHS5ZXIAqt5llbK10Y3LZmCeGPOhze0OVgNLBf+NlJ3tptbL
 O4i33GhgEShgQ7KWTZrxfxCmlBqgW/KWTw==
X-Google-Smtp-Source: ABdhPJyk6KeJUOSmYCLryRXfM0Y7B4X0PJHeu2LFDq+5zdQLwlQoMzsnHtNfCxsHH6icBwZK3FjnGw==
X-Received: by 2002:a17:90a:7d02:: with SMTP id
 g2mr2427227pjl.168.1627519629502; 
 Wed, 28 Jul 2021 17:47:09 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 16/43] target/xtensa: Implement do_unaligned_access
 for user-only
Date: Wed, 28 Jul 2021 14:46:20 -1000
Message-Id: <20210729004647.282017-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/cpu.c    |  2 +-
 target/xtensa/helper.c | 30 +++++++++++++++---------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 58ec3a0862..41816d91f6 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -195,11 +195,11 @@ static const struct TCGCPUOps xtensa_tcg_ops = {
     .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .tlb_fill = xtensa_cpu_tlb_fill,
     .debug_excp_handler = xtensa_breakpoint_handler,
+    .do_unaligned_access = xtensa_cpu_do_unaligned_access,
 
 #ifndef CONFIG_USER_ONLY
     .do_interrupt = xtensa_cpu_do_interrupt,
     .do_transaction_failed = xtensa_cpu_do_transaction_failed,
-    .do_unaligned_access = xtensa_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
 };
 
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index f18ab383fd..a5296399c5 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -242,6 +242,21 @@ void xtensa_cpu_list(void)
     }
 }
 
+void xtensa_cpu_do_unaligned_access(CPUState *cs,
+                                    vaddr addr, MMUAccessType access_type,
+                                    int mmu_idx, uintptr_t retaddr)
+{
+    XtensaCPU *cpu = XTENSA_CPU(cs);
+    CPUXtensaState *env = &cpu->env;
+
+    assert(xtensa_option_enabled(env->config,
+                                 XTENSA_OPTION_UNALIGNED_EXCEPTION));
+    cpu_restore_state(CPU(cpu), retaddr, true);
+    HELPER(exception_cause_vaddr)(env,
+                                  env->pc, LOAD_STORE_ALIGNMENT_CAUSE,
+                                  addr);
+}
+
 #ifdef CONFIG_USER_ONLY
 
 bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
@@ -263,21 +278,6 @@ bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 #else /* !CONFIG_USER_ONLY */
 
-void xtensa_cpu_do_unaligned_access(CPUState *cs,
-                                    vaddr addr, MMUAccessType access_type,
-                                    int mmu_idx, uintptr_t retaddr)
-{
-    XtensaCPU *cpu = XTENSA_CPU(cs);
-    CPUXtensaState *env = &cpu->env;
-
-    assert(xtensa_option_enabled(env->config,
-                                 XTENSA_OPTION_UNALIGNED_EXCEPTION));
-    cpu_restore_state(CPU(cpu), retaddr, true);
-    HELPER(exception_cause_vaddr)(env,
-                                  env->pc, LOAD_STORE_ALIGNMENT_CAUSE,
-                                  addr);
-}
-
 bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr)
-- 
2.25.1


