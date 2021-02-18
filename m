Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F0A31E853
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 11:01:17 +0100 (CET)
Received: from localhost ([::1]:40378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCg7X-00064A-UW
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 05:01:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfzW-0004UM-2x
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:52:58 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfzP-0000zx-9u
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:52:53 -0500
Received: by mail-wm1-x330.google.com with SMTP id n10so2410592wmq.0
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 01:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=82V7f/olgmCGUJKKkrUSBKvz0iIm47HIR/CWbYHF7lk=;
 b=DSfFJZ4hNipRSOrhVCLln5V4QfPs+pjv5ScV5r0D5eoKn1gVf3G5f2d/0ySYjcOlFz
 6MziG5tKDAfd4KS0N1kvP78EIqyoy438U+/O/Ds6zkx3aLQR1YD5S9SZ4bIZ5uVlUerk
 IrgDWDT4fG6BTlODg8+HR+bw5/QSS1QmJeePbFKFKyiGhE23UAXL7x5Swc39K9UD/dL8
 1PqiKYUs5WXG5jCQQ7WpjhPEa645A7pUmiCnyg28xGrLFkNroLu8L0WgnB8ih1CrVEhY
 m3amJS60fDiCT0mtq/GaVovMXt/69c6bQSxy/v76WEL0iep0jDt8TrYpfFukBbFSFZXC
 gRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=82V7f/olgmCGUJKKkrUSBKvz0iIm47HIR/CWbYHF7lk=;
 b=qcCPzMVqmb2uPdMbcS6K1guItEh5nXagYs2YBg9g2jTbHK40soC823SCHE3RLMip6J
 tEGJvyBgXZWRNh23W4JPojtK+1pakHKH6TOL1j+uBiMVlE5AJT8+hgxSuu27090x/aqe
 OMTC+W2a9dnMWgBMJB976iK8fHAbMgwtN776aOB4D9tWtWrYcZ8WtDcwaJejJPUnYNWa
 YbP0RL9qhVC3lmdXv6i4kA7t1ZdCx7U6BQygh9CJx2SoIsIOB7CavVYAn4xop0fBzUCK
 uSq5kL/hZV53d2qXGOwAvaxCwtZAwGefvUfLHoQU3FxFSBZnvrWHN/6MDbgeCVW74uha
 cXBQ==
X-Gm-Message-State: AOAM5305fOi39qerTLgFx/81iQJdinaWn6erwTk6bNtfIiZRxyD9KScC
 Cr+dvQENtP/JzJb5XposBFfneA==
X-Google-Smtp-Source: ABdhPJyTOBpCvNKXLCQ4MSHBl4wnTMIVxdT0OHpULKuPy7j5v9gcTventkXbgA2DKdAqjzG3M1UQAA==
X-Received: by 2002:a1c:e142:: with SMTP id y63mr2754338wmg.163.1613641969980; 
 Thu, 18 Feb 2021 01:52:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m23sm6669575wmc.31.2021.02.18.01.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 01:52:46 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C07A41FFA9;
 Thu, 18 Feb 2021 09:47:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 19/23] accel/tcg: remove CF_NOCACHE and special cases
Date: Thu, 18 Feb 2021 09:47:02 +0000
Message-Id: <20210218094706.23038-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210218094706.23038-1-alex.bennee@linaro.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now we no longer generate CF_NOCACHE blocks we can remove a bunch of
the special case handling for them. While we are at it we can remove
the unused tb->orig_tb field and save a few bytes on the TB structure.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210213130325.14781-20-alex.bennee@linaro.org>

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index d30c7a84f6..665fe68607 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -454,7 +454,6 @@ struct TranslationBlock {
     uint32_t cflags;    /* compile flags */
 #define CF_COUNT_MASK  0x00007fff
 #define CF_LAST_IO     0x00008000 /* Last insn may be an IO access.  */
-#define CF_NOCACHE     0x00010000 /* To be freed after execution */
 #define CF_USE_ICOUNT  0x00020000
 #define CF_INVALID     0x00040000 /* TB is stale. Set with @jmp_lock held */
 #define CF_PARALLEL    0x00080000 /* Generate code for a parallel context */
@@ -469,8 +468,6 @@ struct TranslationBlock {
 
     struct tb_tc tc;
 
-    /* original tb when cflags has CF_NOCACHE */
-    struct TranslationBlock *orig_tb;
     /* first and second physical page containing code. The lower bit
        of the pointer tells the index in page_next[].
        The list is protected by the TB's page('s) lock(s) */
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 72b3c663c5..464b3c3394 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -410,12 +410,6 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
         TranslationBlock *tb = tcg_tb_lookup(host_pc);
         if (tb) {
             cpu_restore_state_from_tb(cpu, tb, host_pc, will_exit);
-            if (tb_cflags(tb) & CF_NOCACHE) {
-                /* one-shot translation, invalidate it immediately */
-                tb_phys_invalidate(tb, -1);
-                tcg_tb_remove(tb);
-                tb_destroy(tb);
-            }
             return true;
         }
     }
@@ -1634,8 +1628,7 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
     phys_pc = tb->page_addr[0] + (tb->pc & ~TARGET_PAGE_MASK);
     h = tb_hash_func(phys_pc, tb->pc, tb->flags, tb_cflags(tb) & CF_HASH_MASK,
                      tb->trace_vcpu_dstate);
-    if (!(tb->cflags & CF_NOCACHE) &&
-        !qht_remove(&tb_ctx.htable, tb, h)) {
+    if (!qht_remove(&tb_ctx.htable, tb, h)) {
         return;
     }
 
@@ -1796,6 +1789,8 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
 {
     PageDesc *p;
     PageDesc *p2 = NULL;
+    void *existing_tb = NULL;
+    uint32_t h;
 
     assert_memory_lock();
 
@@ -1815,25 +1810,20 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
         tb->page_addr[1] = -1;
     }
 
-    if (!(tb->cflags & CF_NOCACHE)) {
-        void *existing_tb = NULL;
-        uint32_t h;
-
-        /* add in the hash table */
-        h = tb_hash_func(phys_pc, tb->pc, tb->flags, tb->cflags & CF_HASH_MASK,
-                         tb->trace_vcpu_dstate);
-        qht_insert(&tb_ctx.htable, tb, h, &existing_tb);
+    /* add in the hash table */
+    h = tb_hash_func(phys_pc, tb->pc, tb->flags, tb->cflags & CF_HASH_MASK,
+                     tb->trace_vcpu_dstate);
+    qht_insert(&tb_ctx.htable, tb, h, &existing_tb);
 
-        /* remove TB from the page(s) if we couldn't insert it */
-        if (unlikely(existing_tb)) {
-            tb_page_remove(p, tb);
-            invalidate_page_bitmap(p);
-            if (p2) {
-                tb_page_remove(p2, tb);
-                invalidate_page_bitmap(p2);
-            }
-            tb = existing_tb;
+    /* remove TB from the page(s) if we couldn't insert it */
+    if (unlikely(existing_tb)) {
+        tb_page_remove(p, tb);
+        invalidate_page_bitmap(p);
+        if (p2) {
+            tb_page_remove(p2, tb);
+            invalidate_page_bitmap(p2);
         }
+        tb = existing_tb;
     }
 
     if (p2 && p2 != p) {
@@ -1906,7 +1896,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tb->cs_base = cs_base;
     tb->flags = flags;
     tb->cflags = cflags;
-    tb->orig_tb = NULL;
     tb->trace_vcpu_dstate = *cpu->trace_dstate;
     tcg_ctx->tb_cflags = cflags;
  tb_overflow:
@@ -2445,16 +2434,6 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
     /* Generate a new TB executing the I/O insn.  */
     cpu->cflags_next_tb = curr_cflags() | CF_LAST_IO | n;
 
-    if (tb_cflags(tb) & CF_NOCACHE) {
-        if (tb->orig_tb) {
-            /* Invalidate original TB if this TB was generated in
-             * cpu_exec_nocache() */
-            tb_phys_invalidate(tb->orig_tb, -1);
-        }
-        tcg_tb_remove(tb);
-        tb_destroy(tb);
-    }
-
     qemu_log_mask_and_addr(CPU_LOG_EXEC, tb->pc,
                            "cpu_io_recompile: rewound execution of TB to "
                            TARGET_FMT_lx "\n", tb->pc);
-- 
2.20.1


