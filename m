Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBE843B0A3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:57:31 +0200 (CEST)
Received: from localhost ([::1]:58648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfK94-0007bo-09
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJi9-0002Xb-AO
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:41 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJi7-0004hC-42
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:41 -0400
Received: by mail-wr1-x433.google.com with SMTP id d3so14150250wrh.8
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0q0oTsrrcyyz232kRXErRNjiegCmvWxDxzkNa3qvjnk=;
 b=Xgg8NmXSYGz+QJasmBIhndPgV2KCyZ1WvJeJPF2k1L9TVCOFS0l2RuZUCfFV/Uchjs
 eurfX7Ud4TSm5lefv/jCL7psVeLXStQJPI/pwqjp+89vHjLrGtPyUknpJLxSvBJqSM5A
 ixfNWRlUjLwsfc2CVCoqpjidzdbZl2KjeNeJ3GWP93iRoHSm9yGUTzWkr3GjTKET1mcu
 hgSOyU9Yl0pUz/J88xtWb5xpkVT+vh0lfl5fh23DwsuWlTlSrXXNLBiKSFz7dY2zZ6jt
 Vxwg/wvWOfR3ecrSDXtAac26NJaMB8Di9fOr0zjPN9QvnPc2FDa58lNGMvki9YBOuGNM
 Sbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0q0oTsrrcyyz232kRXErRNjiegCmvWxDxzkNa3qvjnk=;
 b=EZnW++tfzu07PNiwE8XxDIeWLv1eZnFwzQvmyvwEwh/FvSoG3JNWsYdNedQE4dFSaB
 lBtFWwUVFH6NQJSSkJqOPV8NKL6GVv3px8mfGfUxhrSUhMAW/7h2wE6cE40m3C7xHfwm
 kzbI1UB6+8t4wbIxt7PDf91XFVC15nyXNBsBM3VcS09Pzq9NXVb2gApv5rqkpOBJqkQD
 ElKytXwswZYfSDyWKXh3MHrydGfBbnhLv7UkK1Y7LD1QBmkEfZypZyhqmO5emJ+uO5Ki
 0Y2T/YKGDWOldSGEzvJpO4/tmbQbHxtZi1Mkt5MX9nSRRtW/M6kbAgYl/7Ndh0AHG+eb
 Kq4A==
X-Gm-Message-State: AOAM5308ocQmJITExKg+u+4HRVASWc87yjsdatliFT+MKlVKTgkLJ3VK
 KZEUKkUqZf/JxkNMQZjSit+QZA==
X-Google-Smtp-Source: ABdhPJwa019bV4mjH2fo1NgwePyN5T8zLbLAFFf4iEPtlgaNDGLszTWV8BAYJSbfUmgpOwtSZmBZTA==
X-Received: by 2002:adf:f210:: with SMTP id p16mr25681160wro.61.1635244177779; 
 Tue, 26 Oct 2021 03:29:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x2sm204553wmj.3.2021.10.26.03.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:29:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2D06B1FFAF;
 Tue, 26 Oct 2021 11:22:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 16/28] plugins/cache: make L2 emulation optional through
 args
Date: Tue, 26 Oct 2021 11:22:22 +0100
Message-Id: <20211026102234.3961636-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

By default L2 is not enabled and is enabled by either using the
newly-introduced "l2" boolean argument, or by setting any of the L2
cache parameters using args. On specifying "l2=on", the default cache
configuration is used.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210810134844.166490-5-ma.mandourr@gmail.com>
---
 contrib/plugins/cache.c | 76 +++++++++++++++++++++++++++++------------
 1 file changed, 54 insertions(+), 22 deletions(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index ff325beb9f..b9226e7c40 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -97,6 +97,8 @@ void (*metadata_destroy)(Cache *cache);
 
 static int cores;
 static Cache **l1_dcaches, **l1_icaches;
+
+static bool use_l2;
 static Cache **l2_ucaches;
 
 static GMutex *l1_dcache_locks;
@@ -410,7 +412,7 @@ static void vcpu_mem_access(unsigned int vcpu_index, qemu_plugin_meminfo_t info,
     l1_dcaches[cache_idx]->accesses++;
     g_mutex_unlock(&l1_dcache_locks[cache_idx]);
 
-    if (hit_in_l1) {
+    if (hit_in_l1 || !use_l2) {
         /* No need to access L2 */
         return;
     }
@@ -445,7 +447,7 @@ static void vcpu_insn_exec(unsigned int vcpu_index, void *userdata)
     l1_icaches[cache_idx]->accesses++;
     g_mutex_unlock(&l1_icache_locks[cache_idx]);
 
-    if (hit_in_l1) {
+    if (hit_in_l1 || !use_l2) {
         /* No need to access L2 */
         return;
     }
@@ -542,19 +544,25 @@ static void append_stats_line(GString *line, uint64_t l1_daccess,
 
     l1_dmiss_rate = ((double) l1_dmisses) / (l1_daccess) * 100.0;
     l1_imiss_rate = ((double) l1_imisses) / (l1_iaccess) * 100.0;
-    l2_miss_rate =  ((double) l2_misses) / (l2_access) * 100.0;
 
     g_string_append_printf(line, "%-14lu %-12lu %9.4lf%%  %-14lu %-12lu"
-                           " %9.4lf%%  %-12lu %-11lu %10.4lf%%\n",
+                           " %9.4lf%%",
                            l1_daccess,
                            l1_dmisses,
                            l1_daccess ? l1_dmiss_rate : 0.0,
                            l1_iaccess,
                            l1_imisses,
-                           l1_iaccess ? l1_imiss_rate : 0.0,
-                           l2_access,
-                           l2_misses,
-                           l2_access ? l2_miss_rate : 0.0);
+                           l1_iaccess ? l1_imiss_rate : 0.0);
+
+    if (use_l2) {
+        l2_miss_rate =  ((double) l2_misses) / (l2_access) * 100.0;
+        g_string_append_printf(line, "  %-12lu %-11lu %10.4lf%%",
+                               l2_access,
+                               l2_misses,
+                               l2_access ? l2_miss_rate : 0.0);
+    }
+
+    g_string_append(line, "\n");
 }
 
 static void sum_stats(void)
@@ -568,8 +576,10 @@ static void sum_stats(void)
         l1_imem_accesses += l1_icaches[i]->accesses;
         l1_dmem_accesses += l1_dcaches[i]->accesses;
 
-        l2_misses += l2_ucaches[i]->misses;
-        l2_mem_accesses += l2_ucaches[i]->accesses;
+        if (use_l2) {
+            l2_misses += l2_ucaches[i]->misses;
+            l2_mem_accesses += l2_ucaches[i]->accesses;
+        }
     }
 }
 
@@ -604,25 +614,31 @@ static void log_stats(void)
 
     g_autoptr(GString) rep = g_string_new("core #, data accesses, data misses,"
                                           " dmiss rate, insn accesses,"
-                                          " insn misses, imiss rate,"
-                                          " l2 accesses, l2 misses,"
-                                          " l2 miss rate\n");
+                                          " insn misses, imiss rate");
+
+    if (use_l2) {
+        g_string_append(rep, ", l2 accesses, l2 misses, l2 miss rate");
+    }
+
+    g_string_append(rep, "\n");
 
     for (i = 0; i < cores; i++) {
         g_string_append_printf(rep, "%-8d", i);
         dcache = l1_dcaches[i];
         icache = l1_icaches[i];
-        l2_cache = l2_ucaches[i];
+        l2_cache = use_l2 ? l2_ucaches[i] : NULL;
         append_stats_line(rep, dcache->accesses, dcache->misses,
-                icache->accesses, icache->misses, l2_cache->accesses,
-                l2_cache->misses);
+                icache->accesses, icache->misses,
+                l2_cache ? l2_cache->accesses : 0,
+                l2_cache ? l2_cache->misses : 0);
     }
 
     if (cores > 1) {
         sum_stats();
         g_string_append_printf(rep, "%-8s", "sum");
         append_stats_line(rep, l1_dmem_accesses, l1_dmisses,
-                l1_imem_accesses, l1_imisses, l2_mem_accesses, l2_misses);
+                l1_imem_accesses, l1_imisses,
+                l2_cache ? l2_mem_accesses : 0, l2_cache ? l2_misses : 0);
     }
 
     g_string_append(rep, "\n");
@@ -663,6 +679,10 @@ static void log_top_insns(void)
                                insn->disas_str);
     }
 
+    if (!use_l2) {
+        goto finish;
+    }
+
     miss_insns = g_list_sort(miss_insns, l2_cmp);
     g_string_append_printf(rep, "%s", "\naddress, L2 misses, instruction\n");
 
@@ -676,6 +696,7 @@ static void log_top_insns(void)
                                insn->disas_str);
     }
 
+finish:
     qemu_plugin_outs(rep->str);
     g_list_free(miss_insns);
 }
@@ -687,11 +708,14 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
 
     caches_free(l1_dcaches);
     caches_free(l1_icaches);
-    caches_free(l2_ucaches);
 
     g_free(l1_dcache_locks);
     g_free(l1_icache_locks);
-    g_free(l2_ucache_locks);
+
+    if (use_l2) {
+        caches_free(l2_ucaches);
+        g_free(l2_ucache_locks);
+    }
 
     g_hash_table_destroy(miss_ht);
 }
@@ -767,11 +791,19 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
         } else if (g_strcmp0(tokens[0], "cores") == 0) {
             cores = STRTOLL(tokens[1]);
         } else if (g_strcmp0(tokens[0], "l2cachesize") == 0) {
+            use_l2 = true;
             l2_cachesize = STRTOLL(tokens[1]);
         } else if (g_strcmp0(tokens[0], "l2blksize") == 0) {
+            use_l2 = true;
             l2_blksize = STRTOLL(tokens[1]);
         } else if (g_strcmp0(tokens[0], "l2assoc") == 0) {
+            use_l2 = true;
             l2_assoc = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "l2") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &use_l2)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
         } else if (g_strcmp0(tokens[0], "evict") == 0) {
             if (g_strcmp0(tokens[1], "rand") == 0) {
                 policy = RAND;
@@ -807,8 +839,8 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
         return -1;
     }
 
-    l2_ucaches = caches_init(l2_blksize, l2_assoc, l2_cachesize);
-    if (!l2_ucaches) {
+    l2_ucaches = use_l2 ? caches_init(l2_blksize, l2_assoc, l2_cachesize) : NULL;
+    if (!l2_ucaches && use_l2) {
         const char *err = cache_config_error(l2_blksize, l2_assoc, l2_cachesize);
         fprintf(stderr, "L2 cache cannot be constructed from given parameters\n");
         fprintf(stderr, "%s\n", err);
@@ -817,7 +849,7 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 
     l1_dcache_locks = g_new0(GMutex, cores);
     l1_icache_locks = g_new0(GMutex, cores);
-    l2_ucache_locks = g_new0(GMutex, cores);
+    l2_ucache_locks = use_l2 ? g_new0(GMutex, cores) : NULL;
 
     qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
     qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
-- 
2.30.2


