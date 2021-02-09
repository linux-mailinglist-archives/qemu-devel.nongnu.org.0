Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3127315647
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:48:50 +0100 (CET)
Received: from localhost ([::1]:46030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Y4A-0006xU-27
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:48:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Xqn-00038m-0K
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:35:01 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Xql-0001ER-6Q
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:35:00 -0500
Received: by mail-wr1-x42f.google.com with SMTP id l12so23294751wry.2
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 10:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xVvEwjwvlErjN28dnMMVJVw5XumleZ7dCVSrng6Ywq8=;
 b=PPp2xEU9+YPpv2HrLD/8RbqBTRYCOVzwMeAg92gyM0lToejtaFimggEhmpBdfskNkL
 11A4rFzbBYybDl20HLS1ZmjPVPRVJsT0IHnNI2G1T4womuAgdjtTLKq2VDEj7BZ96noy
 IGbPOOCxVzoR1I7n49n1ojyqBP4GSvmeFCxRN4cd71w2MSyAvf0KMFRnicqLQDHKpSFz
 mj98iCdRQr+7HUtDmyCNBYxwkBEPABHOeBDW4ap2K7qFZq0r+p6TAvRPcQ4B9BS+jMyn
 6Brh57+y96ETryAnQc7yCCg6n1n39zcmPqMyoRyrIbwLEZ0vYDRWG/5nEiNh4IZyrwiQ
 tMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xVvEwjwvlErjN28dnMMVJVw5XumleZ7dCVSrng6Ywq8=;
 b=ugbTMZUCRSTuhbT2xLCjRgCbZco8pt6q7Lxn1rSn0loIt8Zvz1qxKabZhxCB9HEoXG
 i+GGR7Xoog12zkvUU4pNklAt8JcyJyomTBa5ceo1KtsHuCW3pe56exgPUnQ6SaTqSX3V
 85NNxByyf6Yot7WKNgpTysBed/eyV6x5X9aa+6HeCbukA4/L1aGDK2JVfPm7M/UcSE+y
 FM17KaqRPYZa+I/E4gA88XdFCIlJjdmL7MbpkQEzM4lHyeCXnVLOU7i7whCzyF/nv0tb
 SzZcofYyd1IIS0GNBl1i2ThsY8pfUcRP20iAwwBvv/wBhjM0prFD2RN+66OOStJ0iyBH
 eL5w==
X-Gm-Message-State: AOAM530uJQ5SP93F9GDgrs0JsXZ7OyyQWchBvVZKcuZYBQiojuY0eX5u
 H0kbbPgBwyr51if5DJm0hN8Vug==
X-Google-Smtp-Source: ABdhPJxZYR9vjglCyM1qWeWcHEf/4DRwic9nF/v/lKMfWjpJBcvHdVp4K7Xsjv/zhjn+84gHkx8/Hw==
X-Received: by 2002:a5d:6883:: with SMTP id h3mr3630486wru.90.1612895697799;
 Tue, 09 Feb 2021 10:34:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c9sm6153728wmb.33.2021.02.09.10.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 10:34:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9922B1FF98;
 Tue,  9 Feb 2021 18:27:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 10/12] accel/tcg: remove CF_NOCACHE and special cases
Date: Tue,  9 Feb 2021 18:27:46 +0000
Message-Id: <20210209182749.31323-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209182749.31323-1-alex.bennee@linaro.org>
References: <20210209182749.31323-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

Now we no longer generate CF_NOCACHE blocks we can remove a bunch of
the special case handling for them. While we are at it we can remove
the unused tb->orig_tb field and save a few bytes on the TB structure.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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
index b2c5003829..27b3042f1d 100644
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
 
@@ -1794,6 +1787,8 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
 {
     PageDesc *p;
     PageDesc *p2 = NULL;
+    void *existing_tb = NULL;
+    uint32_t h;
 
     assert_memory_lock();
 
@@ -1813,25 +1808,20 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
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
@@ -1904,7 +1894,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tb->cs_base = cs_base;
     tb->flags = flags;
     tb->cflags = cflags;
-    tb->orig_tb = NULL;
     tb->trace_vcpu_dstate = *cpu->trace_dstate;
     tcg_ctx->tb_cflags = cflags;
  tb_overflow:
@@ -2443,16 +2432,6 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
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


