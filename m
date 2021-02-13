Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C52B31ABD3
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 14:34:02 +0100 (CET)
Received: from localhost ([::1]:54934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAv3i-0002gg-0H
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 08:34:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaY-00023s-7s
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:54 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaT-00068Q-HL
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:53 -0500
Received: by mail-wr1-x435.google.com with SMTP id v1so2902940wrd.6
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 05:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XBtLxa+6cxAHsw5aMhaqebCDJwdNEPp+4JCQfAf+5VA=;
 b=Q1wlK/K0yI47CjkCI5FCBLsfRwKJrqIigWzPFsanZOOwVvwLvwQGT0PXkKUTak0DVe
 fXjj4uRVWk/8KpkpO5lbI39XhNGLm0+0AobdL/yDdc+uBIyoFaM/ynupH0xMJE7gx9je
 f6FGYNNe7fkifPqrqJ829YzgVsv8G9a64FwDoNGr4AE1uUnqCoOpaPtdVSy7beKTFMk0
 i9p0Ysr4V4K7yNluWYk0Eq3WhfUd7fTp7krs4e2trVcztDq74/j8xMjIGEO9TLaoQai6
 pv+j06mSTqEqi/jmP73fgCDgXs2rWF8FiDs9v437/utlW+89wUarH1HT9yS5eM6tYUfw
 6Q/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XBtLxa+6cxAHsw5aMhaqebCDJwdNEPp+4JCQfAf+5VA=;
 b=ipdsPzgSsZj0X2/JSZ6957wPNhrQI1YsisTW9eiw0TM7nVga0cuTnGsFGFhe3WteEn
 Hh5dgWESjgPBDHSfP09jDYmpp55WdzsmMbjWIJEcZtg2T7FllLpEnn/2NLz2Z89jBLRS
 3N1n+YQ+WCRFh026kpDsHQo8F1WWbeg3eBgrMkw3mdJTYjo50ZPAJd6djS3M5Bw2gMpc
 HT+Pr+s1e/a6hiy0i93JpHYGLWNHGi0/W0mSHMYmWdFZvMvnuZnXBz2ZlZ87v2sXo0V5
 RgUql93nRONVRpyE9qrJl+eWeioZQnMVYAfnVQ3YyoH0iLxvOW7c7904+DJePFjw5X6E
 Rkbg==
X-Gm-Message-State: AOAM533Tj7Ss/Zmu3qqoRHJhbDgTLnog6MKuNQ8aXWvne04kXxXNSG9o
 DCxBp2QNKcPV5xjWvk09dL7iww==
X-Google-Smtp-Source: ABdhPJx/qQ5uuDh/LfnXW9bKTHqfd8QlKsoxsTc43pAtPlx3aRJXNCyTGKl/1cGZOqKgx7pihsHLMA==
X-Received: by 2002:a5d:628c:: with SMTP id k12mr8694247wru.316.1613221425456; 
 Sat, 13 Feb 2021 05:03:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g1sm14620323wrq.30.2021.02.13.05.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 05:03:40 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 52B3A1FFA9;
 Sat, 13 Feb 2021 13:03:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 19/23] accel/tcg: remove CF_NOCACHE and special cases
Date: Sat, 13 Feb 2021 13:03:21 +0000
Message-Id: <20210213130325.14781-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213130325.14781-1-alex.bennee@linaro.org>
References: <20210213130325.14781-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

Now we no longer generate CF_NOCACHE blocks we can remove a bunch of
the special case handling for them. While we are at it we can remove
the unused tb->orig_tb field and save a few bytes on the TB structure.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210209182749.31323-11-alex.bennee@linaro.org>
Message-Id: <20210210221053.18050-20-alex.bennee@linaro.org>
---
 include/exec/exec-all.h   |  3 ---
 accel/tcg/translate-all.c | 51 ++++++++++++---------------------------
 2 files changed, 15 insertions(+), 39 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index f933c74c44..e08179de34 100644
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
index 7e62d8ad97..0666f9ef14 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -409,12 +409,6 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
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
@@ -1633,8 +1627,7 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
     phys_pc = tb->page_addr[0] + (tb->pc & ~TARGET_PAGE_MASK);
     h = tb_hash_func(phys_pc, tb->pc, tb->flags, tb_cflags(tb) & CF_HASH_MASK,
                      tb->trace_vcpu_dstate);
-    if (!(tb->cflags & CF_NOCACHE) &&
-        !qht_remove(&tb_ctx.htable, tb, h)) {
+    if (!qht_remove(&tb_ctx.htable, tb, h)) {
         return;
     }
 
@@ -1795,6 +1788,8 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
 {
     PageDesc *p;
     PageDesc *p2 = NULL;
+    void *existing_tb = NULL;
+    uint32_t h;
 
     assert_memory_lock();
 
@@ -1814,25 +1809,20 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
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
@@ -1905,7 +1895,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tb->cs_base = cs_base;
     tb->flags = flags;
     tb->cflags = cflags;
-    tb->orig_tb = NULL;
     tb->trace_vcpu_dstate = *cpu->trace_dstate;
     tcg_ctx->tb_cflags = cflags;
  tb_overflow:
@@ -2444,16 +2433,6 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
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


