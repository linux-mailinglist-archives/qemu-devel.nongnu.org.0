Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9AA5A9087
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:40:47 +0200 (CEST)
Received: from localhost ([::1]:50852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTeog-0008Mu-FP
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4j-0006Q4-4k
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:53:17 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4g-0003Qc-T1
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:53:16 -0400
Received: by mail-wr1-x429.google.com with SMTP id v16so18280055wrm.8
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=qpt+vP7ZY28XWgIAuEmGW0ut/2H0xouGRGTfyPOQPGA=;
 b=qsv0jAFmfbikXIFDy7Wf1ri4KDXrwD1Dc+iSxeOwNCyRY4roa+dqG5XIfbJlDupJ7X
 xyO7h3LQWkxgiwhwrfuKo/gq3CPLpsedrBTLjA2rBMKRJ3JY4IIF+aOTMnUjukBuERHU
 i2jmoFD5HBEQWtSMk0OLnxdHz0wP+9gI5siyqTMmUzNzSMD9dPb9AeCgyh+wiz31uU2Z
 n53jlNDORd4OQ3wYbjGuf1eY3xVjmzFqv37UjGDVTvh6R/5Xp8gwcO38HT9WxYDdoZ1+
 LVL76iB14OcvcTEfzl7UFZao2qisnowVxrA6vouSvGU6xDBODVEH6Qgj0JaQz9yMRBOX
 TTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=qpt+vP7ZY28XWgIAuEmGW0ut/2H0xouGRGTfyPOQPGA=;
 b=I3auZoQysPu4MJ8yx01b4nxuwAqpm5U6+yxCkVu6leGRFmh2BSNH8jJ1ifzRKFTaU0
 XSPRRVONMP/feKyJP3ZttQ7tXd7npkRx2SNfooCht81T1vcFx9aStecSUyDB/hDt47o/
 aUyRtX3Z9D6aP2QcCJdUZfow4sluWaR9LmNX/H6621C815k8DwI54LXUeZV6RQxY0YgN
 q02CR8ws9juTNPtesBFHs/Nbht5awzX5jT650fcXL9o5jciLXz8DPE1TmVTF6tgY7TQw
 RO4SJ8qy1GDNTQR2lCP1oEHAHjhUWQKsB+FRNPjcdEaLeayc2zJf9KSnQOmkkay3vmu6
 s4EQ==
X-Gm-Message-State: ACgBeo22pMc5tbD0OYCxSK0jgTjfrBmKZp/0K2kPuxam4jnG236vrA0u
 4OyIEQEdqzqg5/HwAMCzYhnnwID6hRKWPovx
X-Google-Smtp-Source: AA6agR489PA+QgRo36Gpk+aO59lpYT1T8X/yuwOJiZeopV2PjPnBHLUS58ynoBchu/E3nTwL8jdlEw==
X-Received: by 2002:a5d:64e9:0:b0:220:7dd7:63eb with SMTP id
 g9-20020a5d64e9000000b002207dd763ebmr13504173wri.590.1662015192279; 
 Wed, 31 Aug 2022 23:53:12 -0700 (PDT)
Received: from stoup.. ([87.192.221.83]) by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm8308153wru.76.2022.08.31.23.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 23:53:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 16/20] accel/tcg: Add fast path for translator_ld*
Date: Thu,  1 Sep 2022 07:52:06 +0100
Message-Id: <20220901065210.117081-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901065210.117081-1-richard.henderson@linaro.org>
References: <20220901065210.117081-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cache the translation from guest to host address, so we may
use direct loads when we hit on the primary translation page.

Look up the second translation page only once, during translation.
This obviates another lookup of the second page within tb_gen_code
after translation.

Fixes a bug in that plugin_insn_append should be passed the bytes
in the original memory order, not bswapped by pieces.

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translator.h |  63 +++++++++++--------
 accel/tcg/translate-all.c |  23 +++----
 accel/tcg/translator.c    | 126 +++++++++++++++++++++++++++++---------
 3 files changed, 141 insertions(+), 71 deletions(-)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 69db0f5c21..329a42fe46 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -81,24 +81,14 @@ typedef enum DisasJumpType {
  * Architecture-agnostic disassembly context.
  */
 typedef struct DisasContextBase {
-    const TranslationBlock *tb;
+    TranslationBlock *tb;
     target_ulong pc_first;
     target_ulong pc_next;
     DisasJumpType is_jmp;
     int num_insns;
     int max_insns;
     bool singlestep_enabled;
-#ifdef CONFIG_USER_ONLY
-    /*
-     * Guest address of the last byte of the last protected page.
-     *
-     * Pages containing the translated instructions are made non-writable in
-     * order to achieve consistency in case another thread is modifying the
-     * code while translate_insn() fetches the instruction bytes piecemeal.
-     * Such writer threads are blocked on mmap_lock() in page_unprotect().
-     */
-    target_ulong page_protect_end;
-#endif
+    void *host_addr[2];
 } DisasContextBase;
 
 /**
@@ -183,24 +173,43 @@ bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest);
  * the relevant information at translation time.
  */
 
-#define GEN_TRANSLATOR_LD(fullname, type, load_fn, swap_fn)             \
-    type fullname ## _swap(CPUArchState *env, DisasContextBase *dcbase, \
-                           abi_ptr pc, bool do_swap);                   \
-    static inline type fullname(CPUArchState *env,                      \
-                                DisasContextBase *dcbase, abi_ptr pc)   \
-    {                                                                   \
-        return fullname ## _swap(env, dcbase, pc, false);               \
+uint8_t translator_ldub(CPUArchState *env, DisasContextBase *db, abi_ptr pc);
+uint16_t translator_lduw(CPUArchState *env, DisasContextBase *db, abi_ptr pc);
+uint32_t translator_ldl(CPUArchState *env, DisasContextBase *db, abi_ptr pc);
+uint64_t translator_ldq(CPUArchState *env, DisasContextBase *db, abi_ptr pc);
+
+static inline uint16_t
+translator_lduw_swap(CPUArchState *env, DisasContextBase *db,
+                     abi_ptr pc, bool do_swap)
+{
+    uint16_t ret = translator_lduw(env, db, pc);
+    if (do_swap) {
+        ret = bswap16(ret);
     }
+    return ret;
+}
 
-#define FOR_EACH_TRANSLATOR_LD(F)                                       \
-    F(translator_ldub, uint8_t, cpu_ldub_code, /* no swap */)           \
-    F(translator_lduw, uint16_t, cpu_lduw_code, bswap16)                \
-    F(translator_ldl, uint32_t, cpu_ldl_code, bswap32)                  \
-    F(translator_ldq, uint64_t, cpu_ldq_code, bswap64)
+static inline uint32_t
+translator_ldl_swap(CPUArchState *env, DisasContextBase *db,
+                    abi_ptr pc, bool do_swap)
+{
+    uint32_t ret = translator_ldl(env, db, pc);
+    if (do_swap) {
+        ret = bswap32(ret);
+    }
+    return ret;
+}
 
-FOR_EACH_TRANSLATOR_LD(GEN_TRANSLATOR_LD)
-
-#undef GEN_TRANSLATOR_LD
+static inline uint64_t
+translator_ldq_swap(CPUArchState *env, DisasContextBase *db,
+                    abi_ptr pc, bool do_swap)
+{
+    uint64_t ret = translator_ldq_swap(env, db, pc, false);
+    if (do_swap) {
+        ret = bswap64(ret);
+    }
+    return ret;
+}
 
 /*
  * Return whether addr is on the same page as where disassembly started.
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 587886aa4e..f5e8592d4a 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1385,8 +1385,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 {
     CPUArchState *env = cpu->env_ptr;
     TranslationBlock *tb, *existing_tb;
-    tb_page_addr_t phys_pc, phys_page2;
-    target_ulong virt_page2;
+    tb_page_addr_t phys_pc;
     tcg_insn_unit *gen_code_buf;
     int gen_code_size, search_size, max_insns;
 #ifdef CONFIG_PROFILER
@@ -1429,6 +1428,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tb->flags = flags;
     tb->cflags = cflags;
     tb->trace_vcpu_dstate = *cpu->trace_dstate;
+    tb->page_addr[0] = phys_pc;
+    tb->page_addr[1] = -1;
     tcg_ctx->tb_cflags = cflags;
  tb_overflow:
 
@@ -1622,13 +1623,11 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     }
 
     /*
-     * If the TB is not associated with a physical RAM page then
-     * it must be a temporary one-insn TB, and we have nothing to do
-     * except fill in the page_addr[] fields. Return early before
-     * attempting to link to other TBs or add to the lookup table.
+     * If the TB is not associated with a physical RAM page then it must be
+     * a temporary one-insn TB, and we have nothing left to do. Return early
+     * before attempting to link to other TBs or add to the lookup table.
      */
-    if (phys_pc == -1) {
-        tb->page_addr[0] = tb->page_addr[1] = -1;
+    if (tb->page_addr[0] == -1) {
         return tb;
     }
 
@@ -1639,17 +1638,11 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
      */
     tcg_tb_insert(tb);
 
-    /* check next page if needed */
-    virt_page2 = (pc + tb->size - 1) & TARGET_PAGE_MASK;
-    phys_page2 = -1;
-    if ((pc & TARGET_PAGE_MASK) != virt_page2) {
-        phys_page2 = get_page_addr_code(env, virt_page2);
-    }
     /*
      * No explicit memory barrier is required -- tb_link_page() makes the
      * TB visible in a consistent state.
      */
-    existing_tb = tb_link_page(tb, phys_pc, phys_page2);
+    existing_tb = tb_link_page(tb, tb->page_addr[0], tb->page_addr[1]);
     /* if the TB already exists, discard what we just translated */
     if (unlikely(existing_tb != tb)) {
         uintptr_t orig_aligned = (uintptr_t)gen_code_buf;
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 3eef30d93a..ca8a5f2d83 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -42,15 +42,6 @@ bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
     return ((db->pc_first ^ dest) & TARGET_PAGE_MASK) == 0;
 }
 
-static inline void translator_page_protect(DisasContextBase *dcbase,
-                                           target_ulong pc)
-{
-#ifdef CONFIG_USER_ONLY
-    dcbase->page_protect_end = pc | ~TARGET_PAGE_MASK;
-    page_protect(pc);
-#endif
-}
-
 void translator_loop(CPUState *cpu, TranslationBlock *tb, int max_insns,
                      target_ulong pc, void *host_pc,
                      const TranslatorOps *ops, DisasContextBase *db)
@@ -66,7 +57,12 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int max_insns,
     db->num_insns = 0;
     db->max_insns = max_insns;
     db->singlestep_enabled = cflags & CF_SINGLE_STEP;
-    translator_page_protect(db, db->pc_next);
+    db->host_addr[0] = host_pc;
+    db->host_addr[1] = NULL;
+
+#ifdef CONFIG_USER_ONLY
+    page_protect(pc);
+#endif
 
     ops->init_disas_context(db, cpu);
     tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
@@ -151,31 +147,103 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int max_insns,
 #endif
 }
 
-static inline void translator_maybe_page_protect(DisasContextBase *dcbase,
-                                                 target_ulong pc, size_t len)
+static void *translator_access(CPUArchState *env, DisasContextBase *db,
+                               target_ulong pc, size_t len)
 {
-#ifdef CONFIG_USER_ONLY
-    target_ulong end = pc + len - 1;
+    void *host;
+    target_ulong base, end;
+    TranslationBlock *tb;
 
-    if (end > dcbase->page_protect_end) {
-        translator_page_protect(dcbase, end);
+    tb = db->tb;
+
+    /* Use slow path if first page is MMIO. */
+    if (unlikely(tb->page_addr[0] == -1)) {
+        return NULL;
     }
+
+    end = pc + len - 1;
+    if (likely(is_same_page(db, end))) {
+        host = db->host_addr[0];
+        base = db->pc_first;
+    } else {
+        host = db->host_addr[1];
+        base = TARGET_PAGE_ALIGN(db->pc_first);
+        if (host == NULL) {
+            tb->page_addr[1] =
+                get_page_addr_code_hostp(env, base, &db->host_addr[1]);
+#ifdef CONFIG_USER_ONLY
+            page_protect(end);
 #endif
+            /* We cannot handle MMIO as second page. */
+            assert(tb->page_addr[1] != -1);
+            host = db->host_addr[1];
+        }
+
+        /* Use slow path when crossing pages. */
+        if (is_same_page(db, pc)) {
+            return NULL;
+        }
+    }
+
+    tcg_debug_assert(pc >= base);
+    return host + (pc - base);
 }
 
-#define GEN_TRANSLATOR_LD(fullname, type, load_fn, swap_fn)             \
-    type fullname ## _swap(CPUArchState *env, DisasContextBase *dcbase, \
-                           abi_ptr pc, bool do_swap)                    \
-    {                                                                   \
-        translator_maybe_page_protect(dcbase, pc, sizeof(type));        \
-        type ret = load_fn(env, pc);                                    \
-        if (do_swap) {                                                  \
-            ret = swap_fn(ret);                                         \
-        }                                                               \
-        plugin_insn_append(pc, &ret, sizeof(ret));                      \
-        return ret;                                                     \
+uint8_t translator_ldub(CPUArchState *env, DisasContextBase *db, abi_ptr pc)
+{
+    uint8_t ret;
+    void *p = translator_access(env, db, pc, sizeof(ret));
+
+    if (p) {
+        plugin_insn_append(pc, p, sizeof(ret));
+        return ldub_p(p);
     }
+    ret = cpu_ldub_code(env, pc);
+    plugin_insn_append(pc, &ret, sizeof(ret));
+    return ret;
+}
 
-FOR_EACH_TRANSLATOR_LD(GEN_TRANSLATOR_LD)
+uint16_t translator_lduw(CPUArchState *env, DisasContextBase *db, abi_ptr pc)
+{
+    uint16_t ret, plug;
+    void *p = translator_access(env, db, pc, sizeof(ret));
 
-#undef GEN_TRANSLATOR_LD
+    if (p) {
+        plugin_insn_append(pc, p, sizeof(ret));
+        return lduw_p(p);
+    }
+    ret = cpu_lduw_code(env, pc);
+    plug = tswap16(ret);
+    plugin_insn_append(pc, &plug, sizeof(ret));
+    return ret;
+}
+
+uint32_t translator_ldl(CPUArchState *env, DisasContextBase *db, abi_ptr pc)
+{
+    uint32_t ret, plug;
+    void *p = translator_access(env, db, pc, sizeof(ret));
+
+    if (p) {
+        plugin_insn_append(pc, p, sizeof(ret));
+        return ldl_p(p);
+    }
+    ret = cpu_ldl_code(env, pc);
+    plug = tswap32(ret);
+    plugin_insn_append(pc, &plug, sizeof(ret));
+    return ret;
+}
+
+uint64_t translator_ldq(CPUArchState *env, DisasContextBase *db, abi_ptr pc)
+{
+    uint64_t ret, plug;
+    void *p = translator_access(env, db, pc, sizeof(ret));
+
+    if (p) {
+        plugin_insn_append(pc, p, sizeof(ret));
+        return ldq_p(p);
+    }
+    ret = cpu_ldq_code(env, pc);
+    plug = tswap64(ret);
+    plugin_insn_append(pc, &plug, sizeof(ret));
+    return ret;
+}
-- 
2.34.1


