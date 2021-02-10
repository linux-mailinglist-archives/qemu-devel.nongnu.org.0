Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5973B31734D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:27:51 +0100 (CET)
Received: from localhost ([::1]:54380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9xxe-0004tT-De
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:27:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xqW-000735-H1
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:20:28 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:34320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xqL-0006ri-5N
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:20:28 -0500
Received: by mail-wm1-x329.google.com with SMTP id o10so4637377wmc.1
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iIGttXBi7A2QRRl9A62rr2JtZ8SZ+5Uy9wRQiTVHIjk=;
 b=sKjMSOEnpDuClrP+bjAn3ZKUE5pTIbg4O0ig9ut0qyqzW8ENyEJ2Iq0n6ML5abHcRI
 B42UMT8yAnL1s9izqA94FnXo9hNC2W3FClVZ9xrlyz82ZM0rj+llr//1wqExICCmiyfd
 GwCXNK58zYA40OAMbHXuw8yhpoy9AYu9KAizciIrlezLFnRa8xNtew6N+kwVZ5Oph81j
 zrUvqvvSlErMt9P8/zj2VHrGcB6GmSwWMcWjGrfA6y4H0bAuHJkRbkpjoTIX79TiyXdn
 YBZvSYmj7xyB+F2pJCIy/u/zO9UUtNq9HI7Slx9RVMvA8zvzQN4PB/veUGX+8aydJjZU
 rjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iIGttXBi7A2QRRl9A62rr2JtZ8SZ+5Uy9wRQiTVHIjk=;
 b=ozX407S/z3QgyKtUCSz625RrkGvNlVeqLHsb1RCy09RUMWiO99gmvqDyCgFSJcDW0+
 NtDRy4Yop/gSFFAoPp0IL1Wx/jaovnRtZUd4fRczIvo7b2pNksDgcDzN3i+3kMfBqsus
 P9YkbeOW3n7vysX+d2V5K6whGrQYpWYSFha28pIIY6gfW2dBMExIe8nwkDcNJf/QUG09
 4ZJ3PODWY9T4OaoLdYwdlmswJxCokHdDeftITwYoBiF7LmxbnfpBZ4iZ9V3FINMHxsw2
 owiwj+ciZckwYYmwPsoKSXQBtgYaF8e5o4R5XHc4tl3nu3bYJYIuTbnpvdi5OfGp0TqI
 zV8w==
X-Gm-Message-State: AOAM532HR8O7OAwPKy7eOL8J9Fv76ZlAxZXgErIWwrxcO65ZdDA739Fa
 05I6+KUToCvZhhk2PLTd8RUivQ==
X-Google-Smtp-Source: ABdhPJywzwnnjNnc8jtL4nSDdw8yzoZ7kmzvb3uW9Z02NIu/Ak4fS/cTsth3W+eN3ETSOnmc0faYuA==
X-Received: by 2002:a05:600c:230c:: with SMTP id
 12mr1268447wmo.30.1612995613713; 
 Wed, 10 Feb 2021 14:20:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p4sm3138111wma.36.2021.02.10.14.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:20:12 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8E3E61FFA9;
 Wed, 10 Feb 2021 22:10:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/21] accel/tcg: allow plugin instrumentation to be
 disable via cflags
Date: Wed, 10 Feb 2021 22:10:52 +0000
Message-Id: <20210210221053.18050-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210210221053.18050-1-alex.bennee@linaro.org>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210209182749.31323-12-alex.bennee@linaro.org>

---
v2
  - squashed CH_HASHMASK to ~CF_INVALID
---
 include/exec/exec-all.h   |  6 +++---
 accel/tcg/translate-all.c | 17 ++++++++---------
 accel/tcg/translator.c    |  2 +-
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index e08179de34..299282cc59 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -454,14 +454,14 @@ struct TranslationBlock {
     uint32_t cflags;    /* compile flags */
 #define CF_COUNT_MASK  0x00007fff
 #define CF_LAST_IO     0x00008000 /* Last insn may be an IO access.  */
+#define CF_NOINSTR     0x00010000 /* Disable instrumentation of TB */
 #define CF_USE_ICOUNT  0x00020000
 #define CF_INVALID     0x00040000 /* TB is stale. Set with @jmp_lock held */
 #define CF_PARALLEL    0x00080000 /* Generate code for a parallel context */
 #define CF_CLUSTER_MASK 0xff000000 /* Top 8 bits are cluster ID */
 #define CF_CLUSTER_SHIFT 24
-/* cflags' mask for hashing/comparison */
-#define CF_HASH_MASK   \
-    (CF_COUNT_MASK | CF_LAST_IO | CF_USE_ICOUNT | CF_PARALLEL | CF_CLUSTER_MASK)
+/* cflags' mask for hashing/comparison, basically ignore CF_INVALID */
+#define CF_HASH_MASK   (~CF_INVALID)
 
     /* Per-vCPU dynamic tracing state used to generate this TB */
     uint32_t trace_vcpu_dstate;
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 0666f9ef14..32a3d8fe24 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2399,7 +2399,8 @@ void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr)
 }
 
 #ifndef CONFIG_USER_ONLY
-/* in deterministic execution mode, instructions doing device I/Os
+/*
+ * In deterministic execution mode, instructions doing device I/Os
  * must be at the end of the TB.
  *
  * Called by softmmu_template.h, with iothread mutex not held.
@@ -2430,19 +2431,17 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
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


