Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B10A3155F8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:33:47 +0100 (CET)
Received: from localhost ([::1]:42760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Xpa-0000EG-BK
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:33:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Xk6-00038l-Vl
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:28:07 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Xk4-0007qk-MM
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:28:06 -0500
Received: by mail-wr1-x431.google.com with SMTP id h12so6941456wrw.6
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 10:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ejLSBmEQiH4mLxCrVBrlwMdu2X7JBwiJC91YTaurGZo=;
 b=v4Xmtq1gJdLVt3rca/xSQKRIVOBb3Y3fQ2RPC5hYgNysb+D7mDKuL5cbb8EHSSHwC6
 i8L4E/XO7bD8NHpCVwg1I91wukMQItLHncmQ1je4LfmVfnP4ajENSenjBvkglcGQrGyS
 L9h1WUXgaoI9tSHHnNEp2DbKu75C3YK9Nnx+aFzyXD4N9mcn6OkLjD4O+NLbFMUCMaMI
 3We6TVc/KDr0K/mZn9LecgsyqCMswqShvT5G3Sc2aES16qItEkjCh17wssHX/RxVB5Wc
 OGmI6yfxKjp1cc5/abLt8o/BMJjbB4xG5czwWoUlV4QImiHJdYi+LZVErrC1bqB1wExq
 ZO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ejLSBmEQiH4mLxCrVBrlwMdu2X7JBwiJC91YTaurGZo=;
 b=UaNZy0F1EzBeni0mPk9h1F923CFmIuPk+AHyWyxnjeiZbzcZg5Gzr06KvvUZX3cLyM
 ejKisHVAHDt6v0zdE9LGUS9OytB+JAmIhX5xgJHD4pveRNDN+kFgTJ/s+txTZAusbMRc
 qRQFs3IeYDi0KXI8HRSjkEMo8IvlN3d5ZdnP+Q6fPqpAZkBpSC/7qrInn3XO1SkwUEVg
 Rz3FPlX3YETHzTt/81W7msHMh3Sw5b0KavFzkiwgmiYwFDmE9h3qkdgqmukUn6yiXtqc
 B0uE03isHzJ/dHyoiRm5EkEH+7yaujqOIGX4XPhhxvemWfugaMjnISq4IgPhw9BMS4qy
 SD6w==
X-Gm-Message-State: AOAM533Pwt0fcd00FVKlos6lSqi9a/7SjIXV5m7ffD+3oeVWAb96P4z+
 5+T0Z1NnRpA8AHc7m50Urd0ZPQ==
X-Google-Smtp-Source: ABdhPJw9CH28g3a0LXcl6kJba93mm+NOA5lVAnY+oIRbY2OU/T6txORT0wUdGXREFSFLNTAyWUzK+A==
X-Received: by 2002:adf:f68e:: with SMTP id v14mr26750428wrp.273.1612895283368; 
 Tue, 09 Feb 2021 10:28:03 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c22sm180528wrb.91.2021.02.09.10.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 10:27:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D236A1FF99;
 Tue,  9 Feb 2021 18:27:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 11/12] accel/tcg: allow plugin instrumentation to be
 disable via cflags
Date: Tue,  9 Feb 2021 18:27:47 +0000
Message-Id: <20210209182749.31323-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209182749.31323-1-alex.bennee@linaro.org>
References: <20210209182749.31323-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When icount is enabled and we recompile an MMIO access we end up
double counting the instruction execution. To avoid this we introduce
the CF_NOINSTR cflag which disables instrumentation for the next TB.
As this is part of the hashed compile flags we will only execute the
generated TB while coming out of a cpu_io_recompile.

While we are at it delete the old TODO. We might as well keep the
translation handy as it's likely you will repeatedly hit it on each
MMIO access.

Reported-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/exec-all.h   |  3 ++-
 accel/tcg/translate-all.c | 17 ++++++++---------
 accel/tcg/translator.c    |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index e08179de34..ebf015e22d 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -454,6 +454,7 @@ struct TranslationBlock {
     uint32_t cflags;    /* compile flags */
 #define CF_COUNT_MASK  0x00007fff
 #define CF_LAST_IO     0x00008000 /* Last insn may be an IO access.  */
+#define CF_NOINSTR     0x00010000 /* Disable instrumentation of TB */
 #define CF_USE_ICOUNT  0x00020000
 #define CF_INVALID     0x00040000 /* TB is stale. Set with @jmp_lock held */
 #define CF_PARALLEL    0x00080000 /* Generate code for a parallel context */
@@ -461,7 +462,7 @@ struct TranslationBlock {
 #define CF_CLUSTER_SHIFT 24
 /* cflags' mask for hashing/comparison */
 #define CF_HASH_MASK   \
-    (CF_COUNT_MASK | CF_LAST_IO | CF_USE_ICOUNT | CF_PARALLEL | CF_CLUSTER_MASK)
+    (CF_COUNT_MASK | CF_LAST_IO | CF_NOINSTR | CF_USE_ICOUNT | CF_PARALLEL | CF_CLUSTER_MASK)
 
     /* Per-vCPU dynamic tracing state used to generate this TB */
     uint32_t trace_vcpu_dstate;
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 27b3042f1d..3dee698457 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2398,7 +2398,8 @@ void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr)
 }
 
 #ifndef CONFIG_USER_ONLY
-/* in deterministic execution mode, instructions doing device I/Os
+/*
+ * In deterministic execution mode, instructions doing device I/Os
  * must be at the end of the TB.
  *
  * Called by softmmu_template.h, with iothread mutex not held.
@@ -2429,19 +2430,17 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
         n = 2;
     }
 
-    /* Generate a new TB executing the I/O insn.  */
-    cpu->cflags_next_tb = curr_cflags() | CF_LAST_IO | n;
+    /*
+     * Exit the loop and potentially generate a new TB executing the
+     * just the I/O insns. We also disable instrumentation so we don't
+     * double count the instruction.
+     */
+    cpu->cflags_next_tb = curr_cflags() | CF_NOINSTR | CF_LAST_IO | n;
 
     qemu_log_mask_and_addr(CPU_LOG_EXEC, tb->pc,
                            "cpu_io_recompile: rewound execution of TB to "
                            TARGET_FMT_lx "\n", tb->pc);
 
-    /* TODO: If env->pc != tb->pc (i.e. the faulting instruction was not
-     * the first in the TB) then we end up generating a whole new TB and
-     *  repeating the fault, which is horribly inefficient.
-     *  Better would be to execute just this insn uncached, or generate a
-     *  second new TB.
-     */
     cpu_loop_exit_noexc(cpu);
 }
 
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index a49a794065..14d1ea795d 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -58,7 +58,7 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
     ops->tb_start(db, cpu);
     tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
 
-    plugin_enabled = plugin_gen_tb_start(cpu, tb);
+    plugin_enabled = !(tb_cflags(db->tb) & CF_NOINSTR) && plugin_gen_tb_start(cpu, tb);
 
     while (true) {
         db->num_insns++;
-- 
2.20.1


