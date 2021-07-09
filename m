Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CDF3C2669
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:57:26 +0200 (CEST)
Received: from localhost ([::1]:59628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rwT-00076I-2l
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rmv-00039y-Jk
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:47:34 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rms-0004M8-N4
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:47:33 -0400
Received: by mail-wr1-x42c.google.com with SMTP id i94so12482507wri.4
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eT5up0kian05/LgF6zUXsmuwoQua1u5bvZFkNOmLsvE=;
 b=HqRm/nOiGe9kv/5+eXTf6KPC7nU0wjKYhOJWd7skhDKzWLhdNWBAtuUINu+qyqqCGc
 4nU0/CWn4YkSfPkupYDLvixzq3XeSNuOCzZVhiu5qKTL0dzshIUtTKXwxniHDjqhKZOh
 I7Ekr44EbUrGPszeGXqhSJkDrrNP0AC6YLDv+eGbMn/KxlpE7S1Fs1+o9sgBPUGlljIc
 5O0yeYZjrZ2LqFKklVk8oKQf5AgkBQV+tW7ZL6+DK2FZloj300CrhsUqn1sQ8b6L35f4
 6qdJWYSp5ffedH0qn7zHbhWssKRLQ5qsIYus+uxly4vMprP3pBk6/gU9qqBUsWzzGPLh
 n5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eT5up0kian05/LgF6zUXsmuwoQua1u5bvZFkNOmLsvE=;
 b=PQh4rQquuxfB+cgY2M1/gpK87+iA+GPmXMDGirkNIT/c1IK674n+EGuWYqyr16xvCK
 fL8QcDRBjAIchCiUyv8cSSkhvlzPMC0yfCsj3Ccsp+TFCiBvAQQ7nQP/lHko9oGlzlf9
 JxYMQvecJKYkCk3kbvRtR2dmmfxi2EBYtrjusrThH9f9idZZi4SgUUsMoiCGeVYccMSe
 xvOIkKZAQY15J7XZXRE0ynZfQWvI9LJ4uWw+5sl2s+vWxXk3bNxJtWOkVN4gV4vr0Wyv
 gO5OCJGVxhILAO++9ZpjFTy4Rlv9Nv51hhu+Bv5V6PCGWk0I/HVEn8sNMNuo14hN2/4n
 mXGw==
X-Gm-Message-State: AOAM533pRK4HaZk5wUGmZm2kjOtV0ucerHNL/8TyMjYid73n+iyT8KnC
 YlT9dfiq0bbEumR9KODiqmEU+Q==
X-Google-Smtp-Source: ABdhPJwP3oq4QNbwr4Cc2hQ/rFJCYha8S0P76RVpLiCRl39Tw3Y9vM8np9EdDk5i6OPU45a2ZmRtig==
X-Received: by 2002:a5d:52d0:: with SMTP id r16mr41373236wrv.323.1625842048980; 
 Fri, 09 Jul 2021 07:47:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d3sm5367948wrx.77.2021.07.09.07.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:47:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4FBB51FFBB;
 Fri,  9 Jul 2021 15:30:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 37/40] plugins/cache: Enable cache parameterization
Date: Fri,  9 Jul 2021 15:30:02 +0100
Message-Id: <20210709143005.1554-38-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

Enabled configuring both icache and dcache parameters using plugin
parameters.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623125458.450462-3-ma.mandourr@gmail.com>
---
 contrib/plugins/cache.c | 47 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index e9955cdc3a..b550ef31b0 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -99,8 +99,28 @@ static inline uint64_t extract_set(Cache *cache, uint64_t addr)
     return (addr & cache->set_mask) >> cache->blksize_shift;
 }
 
+static const char *cache_config_error(int blksize, int assoc, int cachesize)
+{
+    if (cachesize % blksize != 0) {
+        return "cache size must be divisible by block size";
+    } else if (cachesize % (blksize * assoc) != 0) {
+        return "cache size must be divisible by set size (assoc * block size)";
+    } else {
+        return NULL;
+    }
+}
+
+static bool bad_cache_params(int blksize, int assoc, int cachesize)
+{
+    return (cachesize % blksize) != 0 || (cachesize % (blksize * assoc) != 0);
+}
+
 static Cache *cache_init(int blksize, int assoc, int cachesize)
 {
+    if (bad_cache_params(blksize, assoc, cachesize)) {
+        return NULL;
+    }
+
     Cache *cache;
     int i;
     uint64_t blk_mask;
@@ -397,7 +417,19 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
-        if (g_str_has_prefix(opt, "limit=")) {
+        if (g_str_has_prefix(opt, "iblksize=")) {
+            iblksize = g_ascii_strtoll(opt + 9, NULL, 10);
+        } else if (g_str_has_prefix(opt, "iassoc=")) {
+            iassoc = g_ascii_strtoll(opt + 7, NULL, 10);
+        } else if (g_str_has_prefix(opt, "icachesize=")) {
+            icachesize = g_ascii_strtoll(opt + 11, NULL, 10);
+        } else if (g_str_has_prefix(opt, "dblksize=")) {
+            dblksize = g_ascii_strtoll(opt + 9, NULL, 10);
+        } else if (g_str_has_prefix(opt, "dassoc=")) {
+            dassoc = g_ascii_strtoll(opt + 7, NULL, 10);
+        } else if (g_str_has_prefix(opt, "dcachesize=")) {
+            dcachesize = g_ascii_strtoll(opt + 11, NULL, 10);
+        } else if (g_str_has_prefix(opt, "limit=")) {
             limit = g_ascii_strtoll(opt + 6, NULL, 10);
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
@@ -406,7 +438,20 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
     }
 
     dcache = cache_init(dblksize, dassoc, dcachesize);
+    if (!dcache) {
+        const char *err = cache_config_error(dblksize, dassoc, dcachesize);
+        fprintf(stderr, "dcache cannot be constructed from given parameters\n");
+        fprintf(stderr, "%s\n", err);
+        return -1;
+    }
+
     icache = cache_init(iblksize, iassoc, icachesize);
+    if (!icache) {
+        const char *err = cache_config_error(iblksize, iassoc, icachesize);
+        fprintf(stderr, "icache cannot be constructed from given parameters\n");
+        fprintf(stderr, "%s\n", err);
+        return -1;
+    }
 
     rng = g_rand_new();
 
-- 
2.20.1


