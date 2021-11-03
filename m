Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF794446FB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:22:52 +0100 (CET)
Received: from localhost ([::1]:42412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJyN-0003Qz-T5
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJoG-0005Sb-Ae
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:12:24 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJoD-00074Y-VS
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:12:23 -0400
Received: by mail-wr1-x431.google.com with SMTP id d13so4625460wrf.11
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rK81rLaycn75GU/7jkMSQO8ubSWMfzaA7wAThWraCKQ=;
 b=KkZzVEsghPmvFIB0mj4Nsty7/IzoL2ZJklu/F47q0bK3s7plDiC7gtV7EEwkyegzS7
 nMf6eWz/iitxYhlrKZcgahbf05D8TlU5rFOBcsUhMvfXxBM8WBCTk2Rrr0r635kHcYK/
 AJU6oYKz0Jq7/NagsPYqAwrGGcNYaf10GB906g8EGAt9qOU1RvbDZVu15CgU8XYZ6vVg
 IxbzHRA3ExnTc7OtApK6yUwGT746j+YPk0+TJ/uNxBdulR1iLKrIz8A1QxdZYW3OPf3O
 l3Mmoq5kIuJHJmLGsf8hHHtBTNFYxWBtIXSsb3qg1V1nheBLMddrhMooCxERLJldti7I
 S/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rK81rLaycn75GU/7jkMSQO8ubSWMfzaA7wAThWraCKQ=;
 b=OhG+eSaHGokfuwk5TP9fItkEzrPc/yMkePOY/Lnjm/rUL5c4mZ7PNzF1jYp5G9wlt/
 TbTFitdoiOR6Q+gEf1d0BV9Wf33RAuyubDeVSGSJo831F3GC16LJg4y67C8TED89uJx1
 ZTlZY+lZMtPwC5Ebmp46z17290h3hVE3OTk9QP8/qubz0JOFQ8VfAHpNEJ+8+pptN6aW
 enHIEDEuthKM2tLNo7G/lk4VIdQoMcW61kxowYjHr+KCv5drKECVMO902JwN4yEIMwtk
 5Q2vOCkKH7pHIJi4/wne1upzfSvRDCrGYSbQaVv+QMUF2Zi9fO0/dU0CiOh+wWyuKoNC
 uDnw==
X-Gm-Message-State: AOAM533740ljHMirfEMlLR0+p1Al/mrGs4rh/mRRXiICYN3tBydnmBBv
 5M8eWQ2xqkUJrPHmK6we6bxUqnXJbzcZ6g==
X-Google-Smtp-Source: ABdhPJzBoWIbNp8maYWAAgFuwTkZJihy3vWEYhWgZ/hH5aExdim42vDHMPEuhD34ahp356qkonHgIQ==
X-Received: by 2002:a05:6000:1868:: with SMTP id
 d8mr21410229wri.285.1635959540584; 
 Wed, 03 Nov 2021 10:12:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u16sm5719960wmc.21.2021.11.03.10.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:12:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 84FBC1FFAA;
 Wed,  3 Nov 2021 17:05:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 12/21] plugins/cache: split command line arguments into name
 and value
Date: Wed,  3 Nov 2021 17:05:49 +0000
Message-Id: <20211103170558.717981-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211103170558.717981-1-alex.bennee@linaro.org>
References: <20211103170558.717981-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

This way of handling args is more lenient and sets a better framework to
parse boolean command line arguments.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210810134844.166490-4-ma.mandourr@gmail.com>
Message-Id: <20211026102234.3961636-16-alex.bennee@linaro.org>

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


