Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E324446C4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:12:31 +0100 (CET)
Received: from localhost ([::1]:34034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJoM-00044c-Dp
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJiP-0003wf-HP
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:21 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:44719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJiL-0003lh-GT
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:20 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso2360663wme.3
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PJG6gdZB2EJbdv/Yjd6QTnykYCxkitP2mIWHAYJwzvc=;
 b=uBJ4nGAVOVeCNoicnZ1acgbSifQwQeWdwpp1a4nxEtVRgPDpHwhyZZWAomwWiNYpIq
 VKg7i3C1AXDwMGZ+wuhNivf+Iw6Fsxs268osRhOg+V9A4Ga/asLB3ONRbZLpFho6dCcG
 7BTiqiYZMvsaBHY/O/ZONFaX+y23b9/2ObFz9L4d9qjzfbo5qJBr62YkE2bmNGzOFp7D
 ChCh+9qW6Eqz4DOqUoQw7L6+WyOai2KwMZk/LmHeNGDswwQ1zDEwpdZcXwq3zh0R/S8f
 DIyxH6u1Gg7mqpsbArieb32MpWuVj5Pz+zh//t+5Mtq7mT8s7qGXB48ILeJx/x62yc8w
 NbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PJG6gdZB2EJbdv/Yjd6QTnykYCxkitP2mIWHAYJwzvc=;
 b=jCsUOrrOSrdEenv+pMmjFiafElY6Zth1gp5uFMifnDbS6mbKlzbtPiFwDuEGkaCJ9k
 CdFSgBBt+xurzeaebWec6TH0Gh69z9yN+9HKphmXx5ZCIK60UHhPhp7Tds44C+AJSESW
 dTLnVkX0lCPJkFzpzfqItub+6PhkYz3QjnXe7TKzJwe4h18EuUb8Shlb4fgvrgZNiras
 bWk9RsNhY4qp5nZDvgjjJlF/gToiLgGzJTTc4eZD4aahcvkz0BcKu3kitUrNx8d3SW7E
 MoUOIhn0tKODZZicppeupoY0DDUXyyHwTGtKjjSvrGobM/O5viv/Jb1Ohdq7jr26okv+
 yjOA==
X-Gm-Message-State: AOAM530vUzeiEZmJLY0BHXUUcMlUR+1S1r6QZwQ7zvrdB1Etr14E2bX3
 CyXnMitGSWnwNk1i+H4KNw/UCQ==
X-Google-Smtp-Source: ABdhPJwEFvPTFWiV1tpdJA4zXgf+0GqxYQuzabmtIX7erE7K6I5q3NgYWQDxcAko1Qh6Q9FN3K/o2A==
X-Received: by 2002:a05:600c:202:: with SMTP id
 2mr16580058wmi.167.1635959174613; 
 Wed, 03 Nov 2021 10:06:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v185sm5952132wme.35.2021.11.03.10.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:06:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6ED211FFA9;
 Wed,  3 Nov 2021 17:05:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 11/21] plugins/cache: implement unified L2 cache emulation
Date: Wed,  3 Nov 2021 17:05:48 +0000
Message-Id: <20211103170558.717981-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211103170558.717981-1-alex.bennee@linaro.org>
References: <20211103170558.717981-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

This adds an implementation of a simple L2 configuration, in which a
unified L2 cache (stores both blocks of instructions and data) is
maintained for each core separately, with no inter-core interaction
taken in account. The L2 cache is used as a backup for L1 and is only
accessed if the wanted block does not exist in L1.

In terms of multi-threaded user-space emulation, the same approximation
of L1 is done, a static number of caches is maintained, and each and
every memory access initiated by a thread will have to go through one of
the available caches.

An atomic increment is used to maintain the number of L2 misses per
instruction.

The default cache parameters of L2 caches is:

    2MB cache size
    16-way associativity
    64-byte blocks

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210810134844.166490-3-ma.mandourr@gmail.com>
Message-Id: <20211026102234.3961636-15-alex.bennee@linaro.org>

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index a255e26e25..908c967a09 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -82,8 +82,9 @@ typedef struct {
     char *disas_str;
     const char *symbol;
     uint64_t addr;
-    uint64_t dmisses;
-    uint64_t imisses;
+    uint64_t l1_dmisses;
+    uint64_t l1_imisses;
+    uint64_t l2_misses;
 } InsnData;
 
 void (*update_hit)(Cache *cache, int set, int blk);
@@ -93,15 +94,20 @@ void (*metadata_init)(Cache *cache);
 void (*metadata_destroy)(Cache *cache);
 
 static int cores;
-static Cache **dcaches, **icaches;
+static Cache **l1_dcaches, **l1_icaches;
+static Cache **l2_ucaches;
 
-static GMutex *dcache_locks;
-static GMutex *icache_locks;
+static GMutex *l1_dcache_locks;
+static GMutex *l1_icache_locks;
+static GMutex *l2_ucache_locks;
 
-static uint64_t all_dmem_accesses;
-static uint64_t all_imem_accesses;
-static uint64_t all_imisses;
-static uint64_t all_dmisses;
+static uint64_t l1_dmem_accesses;
+static uint64_t l1_imem_accesses;
+static uint64_t l1_imisses;
+static uint64_t l1_dmisses;
+
+static uint64_t l2_mem_accesses;
+static uint64_t l2_misses;
 
 static int pow_of_two(int num)
 {
@@ -382,6 +388,7 @@ static void vcpu_mem_access(unsigned int vcpu_index, qemu_plugin_meminfo_t info,
     struct qemu_plugin_hwaddr *hwaddr;
     int cache_idx;
     InsnData *insn;
+    bool hit_in_l1;
 
     hwaddr = qemu_plugin_get_hwaddr(info, vaddr);
     if (hwaddr && qemu_plugin_hwaddr_is_io(hwaddr)) {
@@ -391,14 +398,29 @@ static void vcpu_mem_access(unsigned int vcpu_index, qemu_plugin_meminfo_t info,
     effective_addr = hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) : vaddr;
     cache_idx = vcpu_index % cores;
 
-    g_mutex_lock(&dcache_locks[cache_idx]);
-    if (!access_cache(dcaches[cache_idx], effective_addr)) {
+    g_mutex_lock(&l1_dcache_locks[cache_idx]);
+    hit_in_l1 = access_cache(l1_dcaches[cache_idx], effective_addr);
+    if (!hit_in_l1) {
+        insn = (InsnData *) userdata;
+        __atomic_fetch_add(&insn->l1_dmisses, 1, __ATOMIC_SEQ_CST);
+        l1_dcaches[cache_idx]->misses++;
+    }
+    l1_dcaches[cache_idx]->accesses++;
+    g_mutex_unlock(&l1_dcache_locks[cache_idx]);
+
+    if (hit_in_l1) {
+        /* No need to access L2 */
+        return;
+    }
+
+    g_mutex_lock(&l2_ucache_locks[cache_idx]);
+    if (!access_cache(l2_ucaches[cache_idx], effective_addr)) {
         insn = (InsnData *) userdata;
-        __atomic_fetch_add(&insn->dmisses, 1, __ATOMIC_SEQ_CST);
-        dcaches[cache_idx]->misses++;
+        __atomic_fetch_add(&insn->l2_misses, 1, __ATOMIC_SEQ_CST);
+        l2_ucaches[cache_idx]->misses++;
     }
-    dcaches[cache_idx]->accesses++;
-    g_mutex_unlock(&dcache_locks[cache_idx]);
+    l2_ucaches[cache_idx]->accesses++;
+    g_mutex_unlock(&l2_ucache_locks[cache_idx]);
 }
 
 static void vcpu_insn_exec(unsigned int vcpu_index, void *userdata)
@@ -406,18 +428,34 @@ static void vcpu_insn_exec(unsigned int vcpu_index, void *userdata)
     uint64_t insn_addr;
     InsnData *insn;
     int cache_idx;
+    bool hit_in_l1;
 
     insn_addr = ((InsnData *) userdata)->addr;
 
     cache_idx = vcpu_index % cores;
-    g_mutex_lock(&icache_locks[cache_idx]);
-    if (!access_cache(icaches[cache_idx], insn_addr)) {
+    g_mutex_lock(&l1_icache_locks[cache_idx]);
+    hit_in_l1 = access_cache(l1_icaches[cache_idx], insn_addr);
+    if (!hit_in_l1) {
+        insn = (InsnData *) userdata;
+        __atomic_fetch_add(&insn->l1_imisses, 1, __ATOMIC_SEQ_CST);
+        l1_icaches[cache_idx]->misses++;
+    }
+    l1_icaches[cache_idx]->accesses++;
+    g_mutex_unlock(&l1_icache_locks[cache_idx]);
+
+    if (hit_in_l1) {
+        /* No need to access L2 */
+        return;
+    }
+
+    g_mutex_lock(&l2_ucache_locks[cache_idx]);
+    if (!access_cache(l2_ucaches[cache_idx], insn_addr)) {
         insn = (InsnData *) userdata;
-        __atomic_fetch_add(&insn->imisses, 1, __ATOMIC_SEQ_CST);
-        icaches[cache_idx]->misses++;
+        __atomic_fetch_add(&insn->l2_misses, 1, __ATOMIC_SEQ_CST);
+        l2_ucaches[cache_idx]->misses++;
     }
-    icaches[cache_idx]->accesses++;
-    g_mutex_unlock(&icache_locks[cache_idx]);
+    l2_ucaches[cache_idx]->accesses++;
+    g_mutex_unlock(&l2_ucache_locks[cache_idx]);
 }
 
 static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
@@ -493,30 +531,28 @@ static void caches_free(Cache **caches)
     }
 }
 
-static int dcmp(gconstpointer a, gconstpointer b)
-{
-    InsnData *insn_a = (InsnData *) a;
-    InsnData *insn_b = (InsnData *) b;
-
-    return insn_a->dmisses < insn_b->dmisses ? 1 : -1;
-}
-
-static void append_stats_line(GString *line, uint64_t daccess, uint64_t dmisses,
-                              uint64_t iaccess, uint64_t imisses)
+static void append_stats_line(GString *line, uint64_t l1_daccess,
+                              uint64_t l1_dmisses, uint64_t l1_iaccess,
+                              uint64_t l1_imisses,  uint64_t l2_access,
+                              uint64_t l2_misses)
 {
-    double dmiss_rate, imiss_rate;
+    double l1_dmiss_rate, l1_imiss_rate, l2_miss_rate;
 
-    dmiss_rate = ((double) dmisses) / (daccess) * 100.0;
-    imiss_rate = ((double) imisses) / (iaccess) * 100.0;
+    l1_dmiss_rate = ((double) l1_dmisses) / (l1_daccess) * 100.0;
+    l1_imiss_rate = ((double) l1_imisses) / (l1_iaccess) * 100.0;
+    l2_miss_rate =  ((double) l2_misses) / (l2_access) * 100.0;
 
     g_string_append_printf(line, "%-14lu %-12lu %9.4lf%%  %-14lu %-12lu"
-                           " %9.4lf%%\n",
-                           daccess,
-                           dmisses,
-                           daccess ? dmiss_rate : 0.0,
-                           iaccess,
-                           imisses,
-                           iaccess ? imiss_rate : 0.0);
+                           " %9.4lf%%  %-12lu %-11lu %10.4lf%%\n",
+                           l1_daccess,
+                           l1_dmisses,
+                           l1_daccess ? l1_dmiss_rate : 0.0,
+                           l1_iaccess,
+                           l1_imisses,
+                           l1_iaccess ? l1_imiss_rate : 0.0,
+                           l2_access,
+                           l2_misses,
+                           l2_access ? l2_miss_rate : 0.0);
 }
 
 static void sum_stats(void)
@@ -525,43 +561,66 @@ static void sum_stats(void)
 
     g_assert(cores > 1);
     for (i = 0; i < cores; i++) {
-        all_imisses += icaches[i]->misses;
-        all_dmisses += dcaches[i]->misses;
-        all_imem_accesses += icaches[i]->accesses;
-        all_dmem_accesses += dcaches[i]->accesses;
+        l1_imisses += l1_icaches[i]->misses;
+        l1_dmisses += l1_dcaches[i]->misses;
+        l1_imem_accesses += l1_icaches[i]->accesses;
+        l1_dmem_accesses += l1_dcaches[i]->accesses;
+
+        l2_misses += l2_ucaches[i]->misses;
+        l2_mem_accesses += l2_ucaches[i]->accesses;
     }
 }
 
+static int dcmp(gconstpointer a, gconstpointer b)
+{
+    InsnData *insn_a = (InsnData *) a;
+    InsnData *insn_b = (InsnData *) b;
+
+    return insn_a->l1_dmisses < insn_b->l1_dmisses ? 1 : -1;
+}
+
 static int icmp(gconstpointer a, gconstpointer b)
 {
     InsnData *insn_a = (InsnData *) a;
     InsnData *insn_b = (InsnData *) b;
 
-    return insn_a->imisses < insn_b->imisses ? 1 : -1;
+    return insn_a->l1_imisses < insn_b->l1_imisses ? 1 : -1;
+}
+
+static int l2_cmp(gconstpointer a, gconstpointer b)
+{
+    InsnData *insn_a = (InsnData *) a;
+    InsnData *insn_b = (InsnData *) b;
+
+    return insn_a->l2_misses < insn_b->l2_misses ? 1 : -1;
 }
 
 static void log_stats(void)
 {
     int i;
-    Cache *icache, *dcache;
+    Cache *icache, *dcache, *l2_cache;
 
     g_autoptr(GString) rep = g_string_new("core #, data accesses, data misses,"
                                           " dmiss rate, insn accesses,"
-                                          " insn misses, imiss rate\n");
+                                          " insn misses, imiss rate,"
+                                          " l2 accesses, l2 misses,"
+                                          " l2 miss rate\n");
 
     for (i = 0; i < cores; i++) {
         g_string_append_printf(rep, "%-8d", i);
-        dcache = dcaches[i];
-        icache = icaches[i];
+        dcache = l1_dcaches[i];
+        icache = l1_icaches[i];
+        l2_cache = l2_ucaches[i];
         append_stats_line(rep, dcache->accesses, dcache->misses,
-                icache->accesses, icache->misses);
+                icache->accesses, icache->misses, l2_cache->accesses,
+                l2_cache->misses);
     }
 
     if (cores > 1) {
         sum_stats();
         g_string_append_printf(rep, "%-8s", "sum");
-        append_stats_line(rep, all_dmem_accesses, all_dmisses,
-                all_imem_accesses, all_imisses);
+        append_stats_line(rep, l1_dmem_accesses, l1_dmisses,
+                l1_imem_accesses, l1_imisses, l2_mem_accesses, l2_misses);
     }
 
     g_string_append(rep, "\n");
@@ -585,7 +644,7 @@ static void log_top_insns(void)
         if (insn->symbol) {
             g_string_append_printf(rep, " (%s)", insn->symbol);
         }
-        g_string_append_printf(rep, ", %ld, %s\n", insn->dmisses,
+        g_string_append_printf(rep, ", %ld, %s\n", insn->l1_dmisses,
                                insn->disas_str);
     }
 
@@ -598,7 +657,20 @@ static void log_top_insns(void)
         if (insn->symbol) {
             g_string_append_printf(rep, " (%s)", insn->symbol);
         }
-        g_string_append_printf(rep, ", %ld, %s\n", insn->imisses,
+        g_string_append_printf(rep, ", %ld, %s\n", insn->l1_imisses,
+                               insn->disas_str);
+    }
+
+    miss_insns = g_list_sort(miss_insns, l2_cmp);
+    g_string_append_printf(rep, "%s", "\naddress, L2 misses, instruction\n");
+
+    for (curr = miss_insns, i = 0; curr && i < limit; i++, curr = curr->next) {
+        insn = (InsnData *) curr->data;
+        g_string_append_printf(rep, "0x%" PRIx64, insn->addr);
+        if (insn->symbol) {
+            g_string_append_printf(rep, " (%s)", insn->symbol);
+        }
+        g_string_append_printf(rep, ", %ld, %s\n", insn->l2_misses,
                                insn->disas_str);
     }
 
@@ -611,11 +683,13 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     log_stats();
     log_top_insns();
 
-    caches_free(dcaches);
-    caches_free(icaches);
+    caches_free(l1_dcaches);
+    caches_free(l1_icaches);
+    caches_free(l2_ucaches);
 
-    g_free(dcache_locks);
-    g_free(icache_locks);
+    g_free(l1_dcache_locks);
+    g_free(l1_icache_locks);
+    g_free(l2_ucache_locks);
 
     g_hash_table_destroy(miss_ht);
 }
@@ -647,19 +721,24 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
                         int argc, char **argv)
 {
     int i;
-    int iassoc, iblksize, icachesize;
-    int dassoc, dblksize, dcachesize;
+    int l1_iassoc, l1_iblksize, l1_icachesize;
+    int l1_dassoc, l1_dblksize, l1_dcachesize;
+    int l2_assoc, l2_blksize, l2_cachesize;
 
     limit = 32;
     sys = info->system_emulation;
 
-    dassoc = 8;
-    dblksize = 64;
-    dcachesize = dblksize * dassoc * 32;
+    l1_dassoc = 8;
+    l1_dblksize = 64;
+    l1_dcachesize = l1_dblksize * l1_dassoc * 32;
+
+    l1_iassoc = 8;
+    l1_iblksize = 64;
+    l1_icachesize = l1_iblksize * l1_iassoc * 32;
 
-    iassoc = 8;
-    iblksize = 64;
-    icachesize = iblksize * iassoc * 32;
+    l2_assoc = 16;
+    l2_blksize = 64;
+    l2_cachesize = l2_assoc * l2_blksize * 2048;
 
     policy = LRU;
 
@@ -668,21 +747,27 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
         if (g_str_has_prefix(opt, "iblksize=")) {
-            iblksize = g_ascii_strtoll(opt + 9, NULL, 10);
+            l1_iblksize = g_ascii_strtoll(opt + 9, NULL, 10);
         } else if (g_str_has_prefix(opt, "iassoc=")) {
-            iassoc = g_ascii_strtoll(opt + 7, NULL, 10);
+            l1_iassoc = g_ascii_strtoll(opt + 7, NULL, 10);
         } else if (g_str_has_prefix(opt, "icachesize=")) {
-            icachesize = g_ascii_strtoll(opt + 11, NULL, 10);
+            l1_icachesize = g_ascii_strtoll(opt + 11, NULL, 10);
         } else if (g_str_has_prefix(opt, "dblksize=")) {
-            dblksize = g_ascii_strtoll(opt + 9, NULL, 10);
+            l1_dblksize = g_ascii_strtoll(opt + 9, NULL, 10);
         } else if (g_str_has_prefix(opt, "dassoc=")) {
-            dassoc = g_ascii_strtoll(opt + 7, NULL, 10);
+            l1_dassoc = g_ascii_strtoll(opt + 7, NULL, 10);
         } else if (g_str_has_prefix(opt, "dcachesize=")) {
-            dcachesize = g_ascii_strtoll(opt + 11, NULL, 10);
+            l1_dcachesize = g_ascii_strtoll(opt + 11, NULL, 10);
         } else if (g_str_has_prefix(opt, "limit=")) {
             limit = g_ascii_strtoll(opt + 6, NULL, 10);
         } else if (g_str_has_prefix(opt, "cores=")) {
             cores = g_ascii_strtoll(opt + 6, NULL, 10);
+        } else if (g_str_has_prefix(opt, "l2cachesize=")) {
+            l2_cachesize = g_ascii_strtoll(opt + 6, NULL, 10);
+        } else if (g_str_has_prefix(opt, "l2blksize=")) {
+            l2_blksize = g_ascii_strtoll(opt + 6, NULL, 10);
+        } else if (g_str_has_prefix(opt, "l2assoc=")) {
+            l2_assoc = g_ascii_strtoll(opt + 6, NULL, 10);
         } else if (g_str_has_prefix(opt, "evict=")) {
             gchar *p = opt + 6;
             if (g_strcmp0(p, "rand") == 0) {
@@ -703,24 +788,33 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 
     policy_init();
 
-    dcaches = caches_init(dblksize, dassoc, dcachesize);
-    if (!dcaches) {
-        const char *err = cache_config_error(dblksize, dassoc, dcachesize);
+    l1_dcaches = caches_init(l1_dblksize, l1_dassoc, l1_dcachesize);
+    if (!l1_dcaches) {
+        const char *err = cache_config_error(l1_dblksize, l1_dassoc, l1_dcachesize);
         fprintf(stderr, "dcache cannot be constructed from given parameters\n");
         fprintf(stderr, "%s\n", err);
         return -1;
     }
 
-    icaches = caches_init(iblksize, iassoc, icachesize);
-    if (!icaches) {
-        const char *err = cache_config_error(iblksize, iassoc, icachesize);
+    l1_icaches = caches_init(l1_iblksize, l1_iassoc, l1_icachesize);
+    if (!l1_icaches) {
+        const char *err = cache_config_error(l1_iblksize, l1_iassoc, l1_icachesize);
         fprintf(stderr, "icache cannot be constructed from given parameters\n");
         fprintf(stderr, "%s\n", err);
         return -1;
     }
 
-    dcache_locks = g_new0(GMutex, cores);
-    icache_locks = g_new0(GMutex, cores);
+    l2_ucaches = caches_init(l2_blksize, l2_assoc, l2_cachesize);
+    if (!l2_ucaches) {
+        const char *err = cache_config_error(l2_blksize, l2_assoc, l2_cachesize);
+        fprintf(stderr, "L2 cache cannot be constructed from given parameters\n");
+        fprintf(stderr, "%s\n", err);
+        return -1;
+    }
+
+    l1_dcache_locks = g_new0(GMutex, cores);
+    l1_icache_locks = g_new0(GMutex, cores);
+    l2_ucache_locks = g_new0(GMutex, cores);
 
     qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
     qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
-- 
2.30.2


