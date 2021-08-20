Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAAB3F2E09
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 16:25:36 +0200 (CEST)
Received: from localhost ([::1]:43844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH5Sh-0004UK-CK
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 10:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mH5Jr-0005C1-Ld
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:16:32 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:34343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mH5Jm-0000s2-3b
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:16:27 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so1442785wmh.1
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 07:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FqnCqUbvKoythDShE33NAc32UKogIt9FfTN8uVIQDlA=;
 b=Vp/8mNtoHnmDeG4nOC4hb6GmzqJ+m1HrEHyi9Ix9v+jPQL8iddfKZi8NLlhMteAuvC
 /0mqvdWswsaGmIrUnK5elrbM8U5tTc+PIWad5JsXpxdXJa9iojTGQqRu/ASEJyEhS/fJ
 dyHEUQyWu/kmKfal+Ree1jckB5TLDZc2GTKGvCMjmSuNcekNL0JIBFmZfqvTn3EJqzKC
 tAiAVX92dfbV7Q+1kIeU8WQE5gy963RnMjb5OuaRjRrKkrzJkLU9v213F97EZSt68weJ
 +KilgpXH2Q91kyYuQbInqGCyx6NMsXK77UDmtRSJvTb95EEGT4/8wvzqPvygAE6e7OWs
 6E6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FqnCqUbvKoythDShE33NAc32UKogIt9FfTN8uVIQDlA=;
 b=nfhvZwVkjt6VjUinH7IOV8355oPd++kmvzxxH8PQWgvIJ59fURoqxN6ynzYfeIaKhV
 ZWx0pSGRdFM8HzOloijh6EnyhORphU/TmwJ2vqZjq0Yk6Y2mTciF3Ms047S2R5eowKRD
 A/+WIKK71dx2xhtm33mxNsu3J7NH4ih/XnWzET9xVdM1GnQDKJEOm9HwpIle+xoaKspK
 cuIo0DGG6VSZ6ipsKH8cEGxg5+Pn7IRJ1boSkMw8rDwMH3OfR2cu84gP/xBJpVKs+QzK
 6G/EOJBnH6Nc8lsPJ7ulN7bISE6NXQRpCrF5Uw9SicC8Ge9Ds2cqhX3nJQtT3C8HwC/B
 qP5Q==
X-Gm-Message-State: AOAM533ZTN33C6c6SejKismmWClk1EsghbF1cPByQFo8c18EBh5pGr9s
 dDsD00ntix+e3/hzrOZaFGE5lIXOVMkwMw==
X-Google-Smtp-Source: ABdhPJx6g2jVBLUvFZzmyFdPYXu1Cq7a/YRmi+AqKUTlr+awZJQ/nN83v9ittgmdZ+RqLqSiLCHJxQ==
X-Received: by 2002:a7b:cf31:: with SMTP id m17mr4190287wmg.109.1629468980919; 
 Fri, 20 Aug 2021 07:16:20 -0700 (PDT)
Received: from laral.fritz.box
 (dslb-088-066-221-248.088.066.pools.vodafone-ip.de. [88.66.221.248])
 by smtp.gmail.com with ESMTPSA id a133sm10578968wme.5.2021.08.20.07.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 07:16:20 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/i386: Added changed priority check for VIRQ
Date: Fri, 20 Aug 2021 16:15:58 +0200
Message-Id: <20210820141558.9031-5-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820141558.9031-1-laramglazier@gmail.com>
References: <20210820141558.9031-1-laramglazier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=laramglazier@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: pbonzini@redhat.com, Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Writes to cr8 affect v_tpr. This could set or unset an interrupt
request as the priority might have changed.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/cpu.h                    | 15 +++++++++++++++
 target/i386/tcg/sysemu/misc_helper.c |  7 +++++++
 target/i386/tcg/sysemu/svm_helper.c  | 15 ---------------
 3 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d26df6de6b..69e722253d 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2245,6 +2245,21 @@ static inline uint64_t cr4_reserved_bits(CPUX86State *env)
     return reserved_bits;
 }
 
+static inline bool ctl_has_irq(CPUX86State *env)
+{
+    uint32_t int_prio;
+    uint32_t tpr;
+
+    int_prio = (env->int_ctl & V_INTR_PRIO_MASK) >> V_INTR_PRIO_SHIFT;
+    tpr = env->int_ctl & V_TPR_MASK;
+
+    if (env->int_ctl & V_IGN_TPR_MASK) {
+        return (env->int_ctl & V_IRQ_MASK);
+    }
+
+    return (env->int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
+}
+
 #if defined(TARGET_X86_64) && \
     defined(CONFIG_USER_ONLY) && \
     defined(CONFIG_LINUX)
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index 91b0fc916b..9ccaa054c4 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -122,6 +122,13 @@ void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
             qemu_mutex_unlock_iothread();
         }
         env->int_ctl = (env->int_ctl & ~V_TPR_MASK) | (t0 & V_TPR_MASK);
+
+        CPUState *cs = env_cpu(env);
+        if (ctl_has_irq(env)) {
+            cpu_interrupt(cs, CPU_INTERRUPT_VIRQ);
+        } else {
+            cpu_reset_interrupt(cs, CPU_INTERRUPT_VIRQ);
+        }
         break;
     default:
         env->cr[reg] = t0;
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index cbd3f086c4..312f10f1e4 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -76,21 +76,6 @@ static inline void svm_load_seg_cache(CPUX86State *env, hwaddr addr,
                            sc->base, sc->limit, sc->flags);
 }
 
-static inline bool ctl_has_irq(CPUX86State *env)
-{
-    uint32_t int_prio;
-    uint32_t tpr;
-
-    int_prio = (env->int_ctl & V_INTR_PRIO_MASK) >> V_INTR_PRIO_SHIFT;
-    tpr = env->int_ctl & V_TPR_MASK;
-
-    if (env->int_ctl & V_IGN_TPR_MASK) {
-        return env->int_ctl & V_IRQ_MASK;
-    }
-
-    return (env->int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
-}
-
 static inline bool is_efer_invalid_state (CPUX86State *env)
 {
     if (!(env->efer & MSR_EFER_SVME)) {
-- 
2.25.1


