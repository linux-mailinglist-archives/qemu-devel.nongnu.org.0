Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2964B3C1A29
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:52:01 +0200 (CEST)
Received: from localhost ([::1]:47464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1a40-0002Sr-3M
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWg-0002p1-Dg
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:34 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:33701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWd-0007Z4-8P
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:34 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso5413840wme.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eT5up0kian05/LgF6zUXsmuwoQua1u5bvZFkNOmLsvE=;
 b=jRMaDYlz+3LwvnfLdgSG0hEiOhcpv/nRCUHNqeTmuX+n4sf5GzhUFnM70kQqEdT0p+
 LqUN6KSNKprNyfXdaan9o8Dvk+VNQeZO8Omc5z49ekVYFW474oHgYfbyniSVHzB9UZhk
 phbJkdVfLculrMC+tUVrqWfJqIE2yqcL/taJfUGOXl1iY788/a6XKi8KJZXGSbBG6xwo
 tB/wwIZfaaFpRsMslPBnE9dd7ISDbXc3q+aEdo/JVayAy/PawtiCGPL8TbnMtqeGOsEw
 7nOv7dI456zmhdgqSENWtBvGl5fzu6zOtOJQnUV6ylv2gShVN32Qo0ej6rkCDmfkGdCf
 L7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eT5up0kian05/LgF6zUXsmuwoQua1u5bvZFkNOmLsvE=;
 b=J37ZvKoUofPGGH+uXAgYj97Eb0MlWEosA7+U0HgJQjJbYoRx36FDTrA7z1kHAsnhZU
 N4vUt+GiSVsQo2DNw6Sg6xyRO/6w3LkKn+z04Yi5MHWjCTLUmfsmqm7ZAfJOq4vfG3Av
 WKjD+yguC+SIM19RC8fJiRevNffA5C7Y3z5gxb1//EMLOmufMvbUzCvRJhFrvc8iHyqK
 k4TvKeqI3/8tI+sW0RSfM72o6oDk2QdPMljY/bH8t2kMSKxVO8Cpbs5AkrEYzDvJC+Ao
 6fD9Hq5qEkdaKDHSDB4+qRD3XGimERlMK/nlBi8vvex/i9/E70yuVsNr4Tr48qoCRe3a
 eNqw==
X-Gm-Message-State: AOAM533lzZ2Pa8NZsJytRIy2YhNNbMyEZNXfKNMV4ciEq9TAF6nnksNi
 3C9JS4t6JqgP+3qE69GMogXghQ==
X-Google-Smtp-Source: ABdhPJzHYlKHddVBSZM81eyFiG2MPQy0FIpAXFpSSFsnGnVZpIrrCUhu+7kXQAG3JUgLtMvwqUo6ZA==
X-Received: by 2002:a1c:1d82:: with SMTP id d124mr7044308wmd.68.1625771849827; 
 Thu, 08 Jul 2021 12:17:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v18sm3589427wrr.54.2021.07.08.12.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:17:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C73AA1FF8C;
 Thu,  8 Jul 2021 20:09:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 36/39] plugins/cache: Enable cache parameterization
Date: Thu,  8 Jul 2021 20:09:38 +0100
Message-Id: <20210708190941.16980-37-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
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


