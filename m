Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1AC43B07F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:49:54 +0200 (CEST)
Received: from localhost ([::1]:43280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfK1h-0005ix-4D
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJhx-0001sX-Nr
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:29 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJhw-0004fx-1d
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:29 -0400
Received: by mail-wr1-x429.google.com with SMTP id u18so14915690wrg.5
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=86ZYZZNhGDhe4VIPYrvOMI4ML6p9Tw/V+rOGjZWWBFM=;
 b=RVKMExMkXgDv+7oNGqbJ5SfrExL7PTysrl1Y6BoGcNE3VplwfTKxZlF8LL5901JbIc
 bJkHnnaFYSYmFEpIt0ej5+JjN6YESlwp2MP16YP/BNpM9dsiNObkQpc0t/DX6KOw0PN/
 gkDzJ16+Er3QWtBbHjV0Gig4S54YJiuWSkbdSfbjMaNTu1PAkQDURQESEScqeiaXkd7W
 FfwAz/oUmM3/OFtEyp9xVkd0Hp9rp7hI67TyoW36fqsLFSjSt2yqd4y2mCMqjtX29fDc
 1pkLnAsS2beeOOvUzep8JHP/fp4mI3Wpkflchgt1TCxIPNtg/3/4hm6gyyNTBcS/TQ6e
 XcVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=86ZYZZNhGDhe4VIPYrvOMI4ML6p9Tw/V+rOGjZWWBFM=;
 b=RMaWo39wi3ORGY+auG6wzSkykc9y+ajoZ2Tf74+kgikIBKVIcK2Jqh4LAhToH0QlMU
 VCM1G4HK10dXp3HzBs+Wz/iPeGxw8SRSR9iGf4m8H2IacYmr7SqfqBBNvD6Aa2F4IRKD
 Djt/Dz88hoWN3foAykqwjedxlib6ZHBBJvBW0ls9g3WxG+FeZuCo7sNpc+HGWkyaWQJ8
 3bC8Xg8qRG5VAzFJLJ2p4EoPBu9iKzDNFdj7PCKMcmX1WH38rJp41cB3M+HsrW/+Fcl0
 N7pKlHmPH7C+H+6MWCjd9o5ovdXIwrQzd00zFFlB80AX67qNaVUx9Ihz63Z64L4Tph/L
 mhtA==
X-Gm-Message-State: AOAM5336i/jPxDkVC5g5zN5fIb1yer+HA7rwYeKL/2OagrlGvb0OiW2D
 +S7mhnYnWcM4Ro9VwZhRTSkRRg==
X-Google-Smtp-Source: ABdhPJzv1xhMxFs8BsxyYE+KN/LM77iVz6WNmHN3pucA+jVq1HPrs5xq9keakoMCICetwuHxRkG1gw==
X-Received: by 2002:a5d:4742:: with SMTP id o2mr29174076wrs.151.1635244166793; 
 Tue, 26 Oct 2021 03:29:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j20sm173158wmp.27.2021.10.26.03.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:29:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 154581FFAE;
 Tue, 26 Oct 2021 11:22:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 15/28] plugins/cache: split command line arguments into
 name and value
Date: Tue, 26 Oct 2021 11:22:21 +0100
Message-Id: <20211026102234.3961636-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

This way of handling args is more lenient and sets a better framework to
parse boolean command line arguments.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210810134844.166490-4-ma.mandourr@gmail.com>
---
 contrib/plugins/cache.c | 57 ++++++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 27 deletions(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index 908c967a09..ff325beb9f 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -11,6 +11,8 @@
 
 #include <qemu-plugin.h>
 
+#define STRTOLL(x) g_ascii_strtoll(x, NULL, 10)
+
 QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
 
 static enum qemu_plugin_mem_rw rw = QEMU_PLUGIN_MEM_RW;
@@ -746,35 +748,36 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
-        if (g_str_has_prefix(opt, "iblksize=")) {
-            l1_iblksize = g_ascii_strtoll(opt + 9, NULL, 10);
-        } else if (g_str_has_prefix(opt, "iassoc=")) {
-            l1_iassoc = g_ascii_strtoll(opt + 7, NULL, 10);
-        } else if (g_str_has_prefix(opt, "icachesize=")) {
-            l1_icachesize = g_ascii_strtoll(opt + 11, NULL, 10);
-        } else if (g_str_has_prefix(opt, "dblksize=")) {
-            l1_dblksize = g_ascii_strtoll(opt + 9, NULL, 10);
-        } else if (g_str_has_prefix(opt, "dassoc=")) {
-            l1_dassoc = g_ascii_strtoll(opt + 7, NULL, 10);
-        } else if (g_str_has_prefix(opt, "dcachesize=")) {
-            l1_dcachesize = g_ascii_strtoll(opt + 11, NULL, 10);
-        } else if (g_str_has_prefix(opt, "limit=")) {
-            limit = g_ascii_strtoll(opt + 6, NULL, 10);
-        } else if (g_str_has_prefix(opt, "cores=")) {
-            cores = g_ascii_strtoll(opt + 6, NULL, 10);
-        } else if (g_str_has_prefix(opt, "l2cachesize=")) {
-            l2_cachesize = g_ascii_strtoll(opt + 6, NULL, 10);
-        } else if (g_str_has_prefix(opt, "l2blksize=")) {
-            l2_blksize = g_ascii_strtoll(opt + 6, NULL, 10);
-        } else if (g_str_has_prefix(opt, "l2assoc=")) {
-            l2_assoc = g_ascii_strtoll(opt + 6, NULL, 10);
-        } else if (g_str_has_prefix(opt, "evict=")) {
-            gchar *p = opt + 6;
-            if (g_strcmp0(p, "rand") == 0) {
+        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+
+        if (g_strcmp0(tokens[0], "iblksize") == 0) {
+            l1_iblksize = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "iassoc") == 0) {
+            l1_iassoc = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "icachesize") == 0) {
+            l1_icachesize = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "dblksize") == 0) {
+            l1_dblksize = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "dassoc") == 0) {
+            l1_dassoc = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "dcachesize") == 0) {
+            l1_dcachesize = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "limit") == 0) {
+            limit = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "cores") == 0) {
+            cores = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "l2cachesize") == 0) {
+            l2_cachesize = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "l2blksize") == 0) {
+            l2_blksize = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "l2assoc") == 0) {
+            l2_assoc = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "evict") == 0) {
+            if (g_strcmp0(tokens[1], "rand") == 0) {
                 policy = RAND;
-            } else if (g_strcmp0(p, "lru") == 0) {
+            } else if (g_strcmp0(tokens[1], "lru") == 0) {
                 policy = LRU;
-            } else if (g_strcmp0(p, "fifo") == 0) {
+            } else if (g_strcmp0(tokens[1], "fifo") == 0) {
                 policy = FIFO;
             } else {
                 fprintf(stderr, "invalid eviction policy: %s\n", opt);
-- 
2.30.2


