Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5753BDA5E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:39:49 +0200 (CEST)
Received: from localhost ([::1]:40924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0nAq-0001DX-6c
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mpA-0002Rf-Fg
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:17:24 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:50903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mot-0004ug-Q1
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:17:21 -0400
Received: by mail-wm1-x332.google.com with SMTP id o22so13853242wms.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 08:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/yrF+ayxgdtoFcLg/iX/tWy6wtd8uBatUI5DIaKry1g=;
 b=Z8G+Urw5Oy8loHPpxKNmYuiNAuc7Xmmm3JbA2hQUzOJnQm/Xnq+Tk9IDgVwGuSlE47
 7LXh+Zxjd/VlolPocPPNp+xjByj+tMajbJWTyjVrzSeYSrf/DHI8HRBUNEv1H1rfGPB1
 m1qxzjgseITsOQ9ExNI0QY2u5sBN14CId8C9XaUihluwKpyuj02zMUsYstfrDY5rh/X+
 XbUH5Z1wu4z1PMU1Nwfo6OV2UW/iCoN2gd3Q/PFtQ0UOrPDsYyztv77DR3APtHNQ8Hce
 uUYoVwBTrTxtt/Az/biI9JnhOtdFrSdlcLAQtNCkRXeKh1q40dWQmJw+Q4fHXEN+ikKc
 iZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/yrF+ayxgdtoFcLg/iX/tWy6wtd8uBatUI5DIaKry1g=;
 b=PVpvcpiubsPye47LA49S1OQfEWykp+j7GoN15gimskwTlDRcgUQLfVQtUfH1OB5w5O
 V4hXEHS7c7Smc+xO9OfLnYimEWX2h6+g1FRN6RePmCfDprcV0xuUarMExJXjjiVzWbGP
 KusRejDRwSak8P49ChY4P0xZ1ZSBCWlM0EaoK7d3JEodh0AuptZkbAT+nnU8IF1JURNi
 hBghzowRY0TvsrFVZFJOr+KIiqf44p47dXtmvfd0wFx/SYSAJ+b4yATWQjyeOB3G4yHr
 rX3ctfrFPefgbauyF4lQCm2J2En4gctPlbuX6SiZvIZ/rHeqXLz/3Y5A9adkLHZSHNgF
 LqyA==
X-Gm-Message-State: AOAM5317xO/mVNg0f2HbZIoXk1gEeL8JV5hsFaVrMVuYw684Wh2d+6sX
 /dGUv+o7mYEzkUEDbidDnMxX/A==
X-Google-Smtp-Source: ABdhPJw8Ncdfkp//ObEPFuvbXILZFlDbo9kfqPH5iTFKtcIIGhAq6FExLU6X3KCsznbK1bN5/IiTZA==
X-Received: by 2002:a05:600c:3794:: with SMTP id
 o20mr16552503wmr.0.1625584625989; 
 Tue, 06 Jul 2021 08:17:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y66sm16314795wmy.39.2021.07.06.08.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 08:17:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 889B31FFBC;
 Tue,  6 Jul 2021 15:58:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 35/39] plugins: Added a new cache modelling plugin
Date: Tue,  6 Jul 2021 15:58:13 +0100
Message-Id: <20210706145817.24109-36-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Added a cache modelling plugin that uses a static configuration used in
many of the commercial microprocessors and uses random eviction policy.

The purpose of the plugin is to identify the most cache-thrashing
instructions for both instruction cache and data cache.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623125458.450462-2-ma.mandourr@gmail.com>
---
 contrib/plugins/cache.c  | 419 +++++++++++++++++++++++++++++++++++++++
 contrib/plugins/Makefile |   1 +
 2 files changed, 420 insertions(+)
 create mode 100644 contrib/plugins/cache.c

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
new file mode 100644
index 0000000000..e9955cdc3a
--- /dev/null
+++ b/contrib/plugins/cache.c
@@ -0,0 +1,419 @@
+/*
+ * Copyright (C) 2021, Mahmoud Mandour <ma.mandourr@gmail.com>
+ *
+ * License: GNU GPL, version 2 or later.
+ *   See the COPYING file in the top-level directory.
+ */
+
+#include <inttypes.h>
+#include <stdio.h>
+#include <glib.h>
+
+#include <qemu-plugin.h>
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+
+static enum qemu_plugin_mem_rw rw = QEMU_PLUGIN_MEM_RW;
+
+static GHashTable *miss_ht;
+
+static GMutex mtx;
+static GRand *rng;
+
+static int limit;
+static bool sys;
+
+static uint64_t dmem_accesses;
+static uint64_t dmisses;
+
+static uint64_t imem_accesses;
+static uint64_t imisses;
+
+/*
+ * A CacheSet is a set of cache blocks. A memory block that maps to a set can be
+ * put in any of the blocks inside the set. The number of block per set is
+ * called the associativity (assoc).
+ *
+ * Each block contains the the stored tag and a valid bit. Since this is not
+ * a functional simulator, the data itself is not stored. We only identify
+ * whether a block is in the cache or not by searching for its tag.
+ *
+ * In order to search for memory data in the cache, the set identifier and tag
+ * are extracted from the address and the set is probed to see whether a tag
+ * match occur.
+ *
+ * An address is logically divided into three portions: The block offset,
+ * the set number, and the tag.
+ *
+ * The set number is used to identify the set in which the block may exist.
+ * The tag is compared against all the tags of a set to search for a match. If a
+ * match is found, then the access is a hit.
+ */
+
+typedef struct {
+    uint64_t tag;
+    bool valid;
+} CacheBlock;
+
+typedef struct {
+    CacheBlock *blocks;
+} CacheSet;
+
+typedef struct {
+    CacheSet *sets;
+    int num_sets;
+    int cachesize;
+    int assoc;
+    int blksize_shift;
+    uint64_t set_mask;
+    uint64_t tag_mask;
+} Cache;
+
+typedef struct {
+    char *disas_str;
+    const char *symbol;
+    uint64_t addr;
+    uint64_t dmisses;
+    uint64_t imisses;
+} InsnData;
+
+Cache *dcache, *icache;
+
+static int pow_of_two(int num)
+{
+    g_assert((num & (num - 1)) == 0);
+    int ret = 0;
+    while (num /= 2) {
+        ret++;
+    }
+    return ret;
+}
+
+static inline uint64_t extract_tag(Cache *cache, uint64_t addr)
+{
+    return addr & cache->tag_mask;
+}
+
+static inline uint64_t extract_set(Cache *cache, uint64_t addr)
+{
+    return (addr & cache->set_mask) >> cache->blksize_shift;
+}
+
+static Cache *cache_init(int blksize, int assoc, int cachesize)
+{
+    Cache *cache;
+    int i;
+    uint64_t blk_mask;
+
+    cache = g_new(Cache, 1);
+    cache->assoc = assoc;
+    cache->cachesize = cachesize;
+    cache->num_sets = cachesize / (blksize * assoc);
+    cache->sets = g_new(CacheSet, cache->num_sets);
+    cache->blksize_shift = pow_of_two(blksize);
+
+    for (i = 0; i < cache->num_sets; i++) {
+        cache->sets[i].blocks = g_new0(CacheBlock, assoc);
+    }
+
+    blk_mask = blksize - 1;
+    cache->set_mask = ((cache->num_sets - 1) << cache->blksize_shift);
+    cache->tag_mask = ~(cache->set_mask | blk_mask);
+    return cache;
+}
+
+static int get_invalid_block(Cache *cache, uint64_t set)
+{
+    int i;
+
+    for (i = 0; i < cache->assoc; i++) {
+        if (!cache->sets[set].blocks[i].valid) {
+            return i;
+        }
+    }
+
+    return -1;
+}
+
+static int get_replaced_block(Cache *cache)
+{
+    return g_rand_int_range(rng, 0, cache->assoc);
+}
+
+static bool in_cache(Cache *cache, uint64_t addr)
+{
+    int i;
+    uint64_t tag, set;
+
+    tag = extract_tag(cache, addr);
+    set = extract_set(cache, addr);
+
+    for (i = 0; i < cache->assoc; i++) {
+        if (cache->sets[set].blocks[i].tag == tag &&
+                cache->sets[set].blocks[i].valid) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
+/**
+ * access_cache(): Simulate a cache access
+ * @cache: The cache under simulation
+ * @addr: The address of the requested memory location
+ *
+ * Returns true if the requsted data is hit in the cache and false when missed.
+ * The cache is updated on miss for the next access.
+ */
+static bool access_cache(Cache *cache, uint64_t addr)
+{
+    uint64_t tag, set;
+    int replaced_blk;
+
+    if (in_cache(cache, addr)) {
+        return true;
+    }
+
+    tag = extract_tag(cache, addr);
+    set = extract_set(cache, addr);
+
+    replaced_blk = get_invalid_block(cache, set);
+
+    if (replaced_blk == -1) {
+        replaced_blk = get_replaced_block(cache);
+    }
+
+    cache->sets[set].blocks[replaced_blk].tag = tag;
+    cache->sets[set].blocks[replaced_blk].valid = true;
+
+    return false;
+}
+
+static void vcpu_mem_access(unsigned int vcpu_index, qemu_plugin_meminfo_t info,
+                            uint64_t vaddr, void *userdata)
+{
+    uint64_t effective_addr;
+    struct qemu_plugin_hwaddr *hwaddr;
+    InsnData *insn;
+
+    g_mutex_lock(&mtx);
+    hwaddr = qemu_plugin_get_hwaddr(info, vaddr);
+    if (hwaddr && qemu_plugin_hwaddr_is_io(hwaddr)) {
+        g_mutex_unlock(&mtx);
+        return;
+    }
+
+    effective_addr = hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) : vaddr;
+
+    if (!access_cache(dcache, effective_addr)) {
+        insn = (InsnData *) userdata;
+        insn->dmisses++;
+        dmisses++;
+    }
+    dmem_accesses++;
+    g_mutex_unlock(&mtx);
+}
+
+static void vcpu_insn_exec(unsigned int vcpu_index, void *userdata)
+{
+    uint64_t insn_addr;
+    InsnData *insn;
+
+    g_mutex_lock(&mtx);
+    insn_addr = ((InsnData *) userdata)->addr;
+
+    if (!access_cache(icache, insn_addr)) {
+        insn = (InsnData *) userdata;
+        insn->imisses++;
+        imisses++;
+    }
+    imem_accesses++;
+    g_mutex_unlock(&mtx);
+}
+
+static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
+{
+    size_t n_insns;
+    size_t i;
+    InsnData *data;
+
+    n_insns = qemu_plugin_tb_n_insns(tb);
+    for (i = 0; i < n_insns; i++) {
+        struct qemu_plugin_insn *insn = qemu_plugin_tb_get_insn(tb, i);
+        uint64_t effective_addr;
+
+        if (sys) {
+            effective_addr = (uint64_t) qemu_plugin_insn_haddr(insn);
+        } else {
+            effective_addr = (uint64_t) qemu_plugin_insn_vaddr(insn);
+        }
+
+        /*
+         * Instructions might get translated multiple times, we do not create
+         * new entries for those instructions. Instead, we fetch the same
+         * entry from the hash table and register it for the callback again.
+         */
+        g_mutex_lock(&mtx);
+        data = g_hash_table_lookup(miss_ht, GUINT_TO_POINTER(effective_addr));
+        if (data == NULL) {
+            data = g_new0(InsnData, 1);
+            data->disas_str = qemu_plugin_insn_disas(insn);
+            data->symbol = qemu_plugin_insn_symbol(insn);
+            data->addr = effective_addr;
+            g_hash_table_insert(miss_ht, GUINT_TO_POINTER(effective_addr),
+                               (gpointer) data);
+        }
+        g_mutex_unlock(&mtx);
+
+        qemu_plugin_register_vcpu_mem_cb(insn, vcpu_mem_access,
+                                         QEMU_PLUGIN_CB_NO_REGS,
+                                         rw, data);
+
+        qemu_plugin_register_vcpu_insn_exec_cb(insn, vcpu_insn_exec,
+                                               QEMU_PLUGIN_CB_NO_REGS, data);
+    }
+}
+
+static void insn_free(gpointer data)
+{
+    InsnData *insn = (InsnData *) data;
+    g_free(insn->disas_str);
+    g_free(insn);
+}
+
+static void cache_free(Cache *cache)
+{
+    for (int i = 0; i < cache->num_sets; i++) {
+        g_free(cache->sets[i].blocks);
+    }
+
+    g_free(cache->sets);
+    g_free(cache);
+}
+
+static int dcmp(gconstpointer a, gconstpointer b)
+{
+    InsnData *insn_a = (InsnData *) a;
+    InsnData *insn_b = (InsnData *) b;
+
+    return insn_a->dmisses < insn_b->dmisses ? 1 : -1;
+}
+
+static int icmp(gconstpointer a, gconstpointer b)
+{
+    InsnData *insn_a = (InsnData *) a;
+    InsnData *insn_b = (InsnData *) b;
+
+    return insn_a->imisses < insn_b->imisses ? 1 : -1;
+}
+
+static void log_stats()
+{
+    g_autoptr(GString) rep = g_string_new("");
+    g_string_append_printf(rep,
+        "Data accesses: %lu, Misses: %lu\nMiss rate: %lf%%\n\n",
+        dmem_accesses,
+        dmisses,
+        ((double) dmisses / (double) dmem_accesses) * 100.0);
+
+    g_string_append_printf(rep,
+        "Instruction accesses: %lu, Misses: %lu\nMiss rate: %lf%%\n\n",
+        imem_accesses,
+        imisses,
+        ((double) imisses / (double) imem_accesses) * 100.0);
+
+    qemu_plugin_outs(rep->str);
+}
+
+static void log_top_insns()
+{
+    int i;
+    GList *curr, *miss_insns;
+    InsnData *insn;
+
+    miss_insns = g_hash_table_get_values(miss_ht);
+    miss_insns = g_list_sort(miss_insns, dcmp);
+    g_autoptr(GString) rep = g_string_new("");
+    g_string_append_printf(rep, "%s", "address, data misses, instruction\n");
+
+    for (curr = miss_insns, i = 0; curr && i < limit; i++, curr = curr->next) {
+        insn = (InsnData *) curr->data;
+        g_string_append_printf(rep, "0x%" PRIx64, insn->addr);
+        if (insn->symbol) {
+            g_string_append_printf(rep, " (%s)", insn->symbol);
+        }
+        g_string_append_printf(rep, ", %ld, %s\n", insn->dmisses,
+                               insn->disas_str);
+    }
+
+    miss_insns = g_list_sort(miss_insns, icmp);
+    g_string_append_printf(rep, "%s", "\naddress, fetch misses, instruction\n");
+
+    for (curr = miss_insns, i = 0; curr && i < limit; i++, curr = curr->next) {
+        insn = (InsnData *) curr->data;
+        g_string_append_printf(rep, "0x%" PRIx64, insn->addr);
+        if (insn->symbol) {
+            g_string_append_printf(rep, " (%s)", insn->symbol);
+        }
+        g_string_append_printf(rep, ", %ld, %s\n", insn->imisses,
+                               insn->disas_str);
+    }
+
+    qemu_plugin_outs(rep->str);
+    g_list_free(miss_insns);
+}
+
+static void plugin_exit(qemu_plugin_id_t id, void *p)
+{
+    log_stats();
+    log_top_insns();
+
+    cache_free(dcache);
+    cache_free(icache);
+
+    g_hash_table_destroy(miss_ht);
+}
+
+QEMU_PLUGIN_EXPORT
+int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
+                        int argc, char **argv)
+{
+    int i;
+    int iassoc, iblksize, icachesize;
+    int dassoc, dblksize, dcachesize;
+
+    limit = 32;
+    sys = info->system_emulation;
+
+    dassoc = 8;
+    dblksize = 64;
+    dcachesize = dblksize * dassoc * 32;
+
+    iassoc = 8;
+    iblksize = 64;
+    icachesize = iblksize * iassoc * 32;
+
+
+    for (i = 0; i < argc; i++) {
+        char *opt = argv[i];
+        if (g_str_has_prefix(opt, "limit=")) {
+            limit = g_ascii_strtoll(opt + 6, NULL, 10);
+        } else {
+            fprintf(stderr, "option parsing failed: %s\n", opt);
+            return -1;
+        }
+    }
+
+    dcache = cache_init(dblksize, dassoc, dcachesize);
+    icache = cache_init(iblksize, iassoc, icachesize);
+
+    rng = g_rand_new();
+
+    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
+    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
+
+    miss_ht = g_hash_table_new_full(NULL, g_direct_equal, NULL, insn_free);
+
+    return 0;
+}
diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index 6ac67aacaf..2294f889ac 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -19,6 +19,7 @@ NAMES += hotpages
 NAMES += howvec
 NAMES += lockstep
 NAMES += hwprofile
+NAMES += cache
 
 SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 
-- 
2.20.1


