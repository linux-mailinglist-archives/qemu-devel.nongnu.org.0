Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8B83BDA45
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:34:26 +0200 (CEST)
Received: from localhost ([::1]:50394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0n5d-0005sZ-CR
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfP-0005ZS-8s
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:20 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:50848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfM-0007Ft-8K
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:19 -0400
Received: by mail-wm1-x32a.google.com with SMTP id o22so13830354wms.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 08:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eT5up0kian05/LgF6zUXsmuwoQua1u5bvZFkNOmLsvE=;
 b=z2ZmcB7IOrkvFSNxrJM/15GqzpZkc1FyaEBmUdHnLjEZa/wBZ5ENUvlxM1gQPbKk0T
 fMGIvScz+av4k60qcWhGhQrI3OM2GJEO9br2/evaIJhgDoB9UQ1BVIE9sbIeW6kgFOWC
 GdhutuP4PbHSBfHn8i7m0DmCtAehpZjX2+Vdz+W77AHm7DFvv2BkmZN9C/tid+VvB+u8
 QPqfDUc5OwYpmMAEBP/ENMKVOVSbiYw4o1TIsnFrs0L1scRtIK38CJxoWjOHltNOmEpA
 zaUHQXN0V4UcoApF8iBdwGwgpvasBYVSe6ozbcB5REGLnZOzX1FUCZOWRqkOgdJJ40ZA
 bVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eT5up0kian05/LgF6zUXsmuwoQua1u5bvZFkNOmLsvE=;
 b=e4cSBHuOUBzSA21QQAz37y5EzMQ8rfgDwQ4M5Z6A+Qm9EargBqTiKgaA2cmpLopR6S
 vgkfY+oYx8uviIJ3euuEKqL2twc2MF0lcCiZFu/hOnS2TkWNe8wAMlt0o+KeCA9r13vD
 KnZEYaCG2Tu83OOWs9ZutWB6hn7P+r44368IURIrY7N3IrOj9kbWYe90527IwvEJQLjT
 DtC2oTQna7USNVE+j9goAarPZ7+TZyphM+Wp/zf0jUaCYFtnu/02xHVXq+J4gl4dzm2T
 QvrwtJ7OUlaogMlA/pr9XoPpBi19yCnVUtFoQAfFc9v4qo3lolmKSyrteBwphM38+Kiy
 1sww==
X-Gm-Message-State: AOAM532J2MdM2eyO7yWcXc6n33yimQp7UQNUclzSg9NVpL02Eb0UliFL
 OgnxNJh1d501+CwQJAbSvT7NQQ==
X-Google-Smtp-Source: ABdhPJyRnQzJ2zrdKN7/rAncgSLqMT26pdgNdEOHfeU6XVdFuN9TnFjIm1hGnmMEdTZTbTwZxLbAMg==
X-Received: by 2002:a1c:4e0b:: with SMTP id g11mr1273600wmh.167.1625584033697; 
 Tue, 06 Jul 2021 08:07:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n2sm11546551wrx.40.2021.07.06.08.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 08:07:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A03541FFBD;
 Tue,  6 Jul 2021 15:58:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 36/39] plugins/cache: Enable cache parameterization
Date: Tue,  6 Jul 2021 15:58:14 +0100
Message-Id: <20210706145817.24109-37-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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


