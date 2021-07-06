Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0028A3BD988
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:08:49 +0200 (CEST)
Received: from localhost ([::1]:50708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mgq-0008OH-WA
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mXB-0004z5-US
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:58:49 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:51923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mX5-00026C-53
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:58:49 -0400
Received: by mail-wm1-x333.google.com with SMTP id n33so6294864wms.1
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 07:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8GBODLRjljT2CqIfm6ictSx8Ob2rK1eePeAxvgZ3b20=;
 b=OVJ7M9exKqvDYUNcA4vrWpaO99Xl+zQQxin5pBBf1TbzEIdZ9icYqn3+kVlEu/IXiW
 dC333Y2+nSH+v+zVyCY653wi4VIyKwm54ReQEXyEU1EP8FnDtEUIG+k2oQ8nJA2fGS2e
 1TbnhDNc849PdDK7Z9LtNC78eT3pGtzuQSrUBqi8b/JgGsOqWKlkttsaD3UO/wTl6mUh
 yuhBZb5VLA3TTMPW+gCVBpKfCzStctlKw+tkKxAqnGC1koy5As34Rh6pb8z+wtxl8iqv
 sWJjxeqhv8LzyOa/X/+akNxI3nck4xZxOhVmF/3M6oyoh+jZxeeeAxhg8B+NZylLAk+M
 Ke9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8GBODLRjljT2CqIfm6ictSx8Ob2rK1eePeAxvgZ3b20=;
 b=Y3eBCA6VQbLDGfFTNzQmaojDenNFeSjtFGZ+pnHk2v0hB7X04a0pAR/uNaHngX7tFx
 ejFEpgDbvaFYvH81IslKamb7lWLxaG7xHuhyrMbB1mrtEB363u/tkmDGy0bQEnhlnCx3
 /W33Uo8CrH11wX7M6KIrg0dUWnxyuupRrZXWzK+DjavIO3fMyc+edWbAJjBw+hejJgzv
 WYXDbCCaWclGSfD1a41e/QVQsbL5mb2lWnSwJ1H3XGA11fM0uFDqeXguW7TKoXpvfcTo
 6Cgqr8OJOcyoGumJLpg0w8dmmveNGC6UqbfRRULsgu5aNKRTp6Bc+a0UWk/8fgyPy2j1
 k6+Q==
X-Gm-Message-State: AOAM533Z6az4HU+5Ho4GAiL8d+CvThj7EzBPgOub/5J+SR6r90sHvpIk
 7MuQSDTQeTzhHwGGRxT9p4UjvQ==
X-Google-Smtp-Source: ABdhPJysrlygsNy+44e2NtrhYT3eJoccXtqoh2eKbbRaD7xXUVJn086q96tMgoaJAzZfDMb2xTd6rg==
X-Received: by 2002:a05:600c:1c19:: with SMTP id
 j25mr1295989wms.166.1625583517660; 
 Tue, 06 Jul 2021 07:58:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o11sm15336535wmq.1.2021.07.06.07.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 07:58:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B63611FF8C;
 Tue,  6 Jul 2021 15:58:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 37/39] plugins/cache: Added FIFO and LRU eviction policies
Date: Tue,  6 Jul 2021 15:58:15 +0100
Message-Id: <20210706145817.24109-38-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

Implemented FIFO and LRU eviction policies. Now one of the three
eviction policies can be chosen as an argument. On not specifying an
argument, LRU is used by default.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623125458.450462-4-ma.mandourr@gmail.com>
---
 contrib/plugins/cache.c | 203 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 190 insertions(+), 13 deletions(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index b550ef31b0..bf0d2f6097 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -29,6 +29,14 @@ static uint64_t dmisses;
 static uint64_t imem_accesses;
 static uint64_t imisses;
 
+enum EvictionPolicy {
+    LRU,
+    FIFO,
+    RAND,
+};
+
+enum EvictionPolicy policy;
+
 /*
  * A CacheSet is a set of cache blocks. A memory block that maps to a set can be
  * put in any of the blocks inside the set. The number of block per set is
@@ -48,6 +56,8 @@ static uint64_t imisses;
  * The set number is used to identify the set in which the block may exist.
  * The tag is compared against all the tags of a set to search for a match. If a
  * match is found, then the access is a hit.
+ *
+ * The CacheSet also contains bookkeaping information about eviction details.
  */
 
 typedef struct {
@@ -57,6 +67,9 @@ typedef struct {
 
 typedef struct {
     CacheBlock *blocks;
+    uint64_t *lru_priorities;
+    uint64_t lru_gen_counter;
+    GQueue *fifo_queue;
 } CacheSet;
 
 typedef struct {
@@ -77,6 +90,12 @@ typedef struct {
     uint64_t imisses;
 } InsnData;
 
+void (*update_hit)(Cache *cache, int set, int blk);
+void (*update_miss)(Cache *cache, int set, int blk);
+
+void (*metadata_init)(Cache *cache);
+void (*metadata_destroy)(Cache *cache);
+
 Cache *dcache, *icache;
 
 static int pow_of_two(int num)
@@ -89,6 +108,103 @@ static int pow_of_two(int num)
     return ret;
 }
 
+/*
+ * LRU evection policy: For each set, a generation counter is maintained
+ * alongside a priority array.
+ *
+ * On each set access, the generation counter is incremented.
+ *
+ * On a cache hit: The hit-block is assigned the current generation counter,
+ * indicating that it is the most recently used block.
+ *
+ * On a cache miss: The block with the least priority is searched and replaced
+ * with the newly-cached block, of which the priority is set to the current
+ * generation number.
+ */
+
+static void lru_priorities_init(Cache *cache)
+{
+    int i;
+
+    for (i = 0; i < cache->num_sets; i++) {
+        cache->sets[i].lru_priorities = g_new0(uint64_t, cache->assoc);
+        cache->sets[i].lru_gen_counter = 0;
+    }
+}
+
+static void lru_update_blk(Cache *cache, int set_idx, int blk_idx)
+{
+    CacheSet *set = &cache->sets[set_idx];
+    set->lru_priorities[blk_idx] = cache->sets[set_idx].lru_gen_counter;
+    set->lru_gen_counter++;
+}
+
+static int lru_get_lru_block(Cache *cache, int set_idx)
+{
+    int i, min_idx, min_priority;
+
+    min_priority = cache->sets[set_idx].lru_priorities[0];
+    min_idx = 0;
+
+    for (i = 1; i < cache->assoc; i++) {
+        if (cache->sets[set_idx].lru_priorities[i] < min_priority) {
+            min_priority = cache->sets[set_idx].lru_priorities[i];
+            min_idx = i;
+        }
+    }
+    return min_idx;
+}
+
+static void lru_priorities_destroy(Cache *cache)
+{
+    int i;
+
+    for (i = 0; i < cache->num_sets; i++) {
+        g_free(cache->sets[i].lru_priorities);
+    }
+}
+
+/*
+ * FIFO eviction policy: a FIFO queue is maintained for each CacheSet that
+ * stores accesses to the cache.
+ *
+ * On a compulsory miss: The block index is enqueued to the fifo_queue to
+ * indicate that it's the latest cached block.
+ *
+ * On a conflict miss: The first-in block is removed from the cache and the new
+ * block is put in its place and enqueued to the FIFO queue.
+ */
+
+static void fifo_init(Cache *cache)
+{
+    int i;
+
+    for (i = 0; i < cache->num_sets; i++) {
+        cache->sets[i].fifo_queue = g_queue_new();
+    }
+}
+
+static int fifo_get_first_block(Cache *cache, int set)
+{
+    GQueue *q = cache->sets[set].fifo_queue;
+    return GPOINTER_TO_INT(g_queue_pop_tail(q));
+}
+
+static void fifo_update_on_miss(Cache *cache, int set, int blk_idx)
+{
+    GQueue *q = cache->sets[set].fifo_queue;
+    g_queue_push_head(q, GINT_TO_POINTER(blk_idx));
+}
+
+static void fifo_destroy(Cache *cache)
+{
+    int i;
+
+    for (i = 0; i < cache->assoc; i++) {
+        g_queue_free(cache->sets[i].fifo_queue);
+    }
+}
+
 static inline uint64_t extract_tag(Cache *cache, uint64_t addr)
 {
     return addr & cache->tag_mask;
@@ -139,6 +255,11 @@ static Cache *cache_init(int blksize, int assoc, int cachesize)
     blk_mask = blksize - 1;
     cache->set_mask = ((cache->num_sets - 1) << cache->blksize_shift);
     cache->tag_mask = ~(cache->set_mask | blk_mask);
+
+    if (metadata_init) {
+        metadata_init(cache);
+    }
+
     return cache;
 }
 
@@ -155,12 +276,21 @@ static int get_invalid_block(Cache *cache, uint64_t set)
     return -1;
 }
 
-static int get_replaced_block(Cache *cache)
+static int get_replaced_block(Cache *cache, int set)
 {
-    return g_rand_int_range(rng, 0, cache->assoc);
+    switch (policy) {
+    case RAND:
+        return g_rand_int_range(rng, 0, cache->assoc);
+    case LRU:
+        return lru_get_lru_block(cache, set);
+    case FIFO:
+        return fifo_get_first_block(cache, set);
+    default:
+        g_assert_not_reached();
+    }
 }
 
-static bool in_cache(Cache *cache, uint64_t addr)
+static int in_cache(Cache *cache, uint64_t addr)
 {
     int i;
     uint64_t tag, set;
@@ -171,11 +301,11 @@ static bool in_cache(Cache *cache, uint64_t addr)
     for (i = 0; i < cache->assoc; i++) {
         if (cache->sets[set].blocks[i].tag == tag &&
                 cache->sets[set].blocks[i].valid) {
-            return true;
+            return i;
         }
     }
 
-    return false;
+    return -1;
 }
 
 /**
@@ -188,20 +318,28 @@ static bool in_cache(Cache *cache, uint64_t addr)
  */
 static bool access_cache(Cache *cache, uint64_t addr)
 {
+    int hit_blk, replaced_blk;
     uint64_t tag, set;
-    int replaced_blk;
-
-    if (in_cache(cache, addr)) {
-        return true;
-    }
 
     tag = extract_tag(cache, addr);
     set = extract_set(cache, addr);
 
+    hit_blk = in_cache(cache, addr);
+    if (hit_blk != -1) {
+        if (update_hit) {
+            update_hit(cache, set, hit_blk);
+        }
+        return true;
+    }
+
     replaced_blk = get_invalid_block(cache, set);
 
     if (replaced_blk == -1) {
-        replaced_blk = get_replaced_block(cache);
+        replaced_blk = get_replaced_block(cache, set);
+    }
+
+    if (update_miss) {
+        update_miss(cache, set, replaced_blk);
     }
 
     cache->sets[set].blocks[replaced_blk].tag = tag;
@@ -308,6 +446,10 @@ static void cache_free(Cache *cache)
         g_free(cache->sets[i].blocks);
     }
 
+    if (metadata_destroy) {
+        metadata_destroy(cache);
+    }
+
     g_free(cache->sets);
     g_free(cache);
 }
@@ -395,6 +537,28 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     g_hash_table_destroy(miss_ht);
 }
 
+static void policy_init()
+{
+    switch (policy) {
+    case LRU:
+        update_hit = lru_update_blk;
+        update_miss = lru_update_blk;
+        metadata_init = lru_priorities_init;
+        metadata_destroy = lru_priorities_destroy;
+        break;
+    case FIFO:
+        update_miss = fifo_update_on_miss;
+        metadata_init = fifo_init;
+        metadata_destroy = fifo_destroy;
+        break;
+    case RAND:
+        rng = g_rand_new();
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 QEMU_PLUGIN_EXPORT
 int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
                         int argc, char **argv)
@@ -414,6 +578,7 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
     iblksize = 64;
     icachesize = iblksize * iassoc * 32;
 
+    policy = LRU;
 
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
@@ -431,12 +596,26 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
             dcachesize = g_ascii_strtoll(opt + 11, NULL, 10);
         } else if (g_str_has_prefix(opt, "limit=")) {
             limit = g_ascii_strtoll(opt + 6, NULL, 10);
+        } else if (g_str_has_prefix(opt, "evict=")) {
+            gchar *p = opt + 6;
+            if (g_strcmp0(p, "rand") == 0) {
+                policy = RAND;
+            } else if (g_strcmp0(p, "lru") == 0) {
+                policy = LRU;
+            } else if (g_strcmp0(p, "fifo") == 0) {
+                policy = FIFO;
+            } else {
+                fprintf(stderr, "invalid eviction policy: %s\n", opt);
+                return -1;
+            }
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
         }
     }
 
+    policy_init();
+
     dcache = cache_init(dblksize, dassoc, dcachesize);
     if (!dcache) {
         const char *err = cache_config_error(dblksize, dassoc, dcachesize);
@@ -453,8 +632,6 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
         return -1;
     }
 
-    rng = g_rand_new();
-
     qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
     qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
 
-- 
2.20.1


