Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2F13C8743
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:22:38 +0200 (CEST)
Received: from localhost ([::1]:32938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gib-0005Ol-7K
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUr-0006b2-Vw
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:26 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUq-0003zd-6w
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:25 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso3599288wmc.1
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4RUje/NtLDQsjrm5Fp/QYjd0g9AvH8bzaEhpNLm1Wos=;
 b=D5xXGwNOt3XBk7rj9xcR7F3s0IyPbvJHbQBYWSZozT7jIdZQ8FfZULzpbzyTLa/uJA
 2BVBrvF4Z8jm4L+lhpTQJfqgL/S4uI+rRVWOPUVJX3cdrQAp6YTtKJRLocpg5NmGt/wG
 HZ+LwdTePmrZpHVvm1nLL4ViWgpgu/ZCXMiBzIncPX0DLrB0yAuDo3gUnOOkGBZNkunl
 jevhToEH3naiApUFFm+bxVLZ+KGWweOIMjWLVnd+3NFQOPE58FUy4+DNCz+JAW4pDp2F
 teghh+3hvqhSJFukFMg3zMNu1Bx2fSe4pyp3Haovb3DYtMd0a3HafvRGEhmhYl0YzU6L
 A93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4RUje/NtLDQsjrm5Fp/QYjd0g9AvH8bzaEhpNLm1Wos=;
 b=HDxaWv+AXvOz9Xrm07rg9hCXZzHYAgVm4s4jX4zslTwq3RhrVqrQcVcB/iGzUYIaMz
 uSCQuyIRikUkm1/hZV/W/yY3QB9LcP58xpFMGmZYz4vToilS0aZ6rY3PVW4nzL/0XkQc
 zWDZhg30oPUey0R0EY0U8pSQpIIJF8BIgGcaIps3PaKjcMc4ysZFQLEz2n+2Q4mAGNZD
 Bgs8OtPBXdQ70EVpQapMbSRu6TH8vMOjuY4ygGvPCkuyxQGlKTm6ljj1JHNYQjjvWm/9
 ggNa3fZbNxVvJkYf8utoyu6GnSbx+iv8E47dAp98hfeiQnsrOWrxK5k6wKqRCAF9cqwG
 Nwyg==
X-Gm-Message-State: AOAM532KRo5DbGHrHrK1+j2OcXW4E1KlZJi4JnvSw+AgFnKw/M5tIyvs
 FLh3NcTEeOQ6c8BgmHebWQm10Q==
X-Google-Smtp-Source: ABdhPJzf2lctl/m5DsezoxccWHmAss7gArO8Na00WvpFHZHo1tXJUvuP4yu0OKcZ5vxfpquqzem44Q==
X-Received: by 2002:a05:600c:3b86:: with SMTP id
 n6mr12160543wms.28.1626275297464; 
 Wed, 14 Jul 2021 08:08:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d14sm2986492wrs.49.2021.07.14.08.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:08:15 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1500D1FFC2;
 Wed, 14 Jul 2021 16:00:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 41/44] plugins/cache: Enable cache parameterization
Date: Wed, 14 Jul 2021 16:00:33 +0100
Message-Id: <20210714150036.21060-42-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Enabled configuring both icache and dcache parameters using plugin
parameters.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623125458.450462-3-ma.mandourr@gmail.com>
Message-Id: <20210709143005.1554-38-alex.bennee@linaro.org>

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


