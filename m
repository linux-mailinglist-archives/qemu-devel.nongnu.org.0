Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470F3DAEA3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 15:41:34 +0200 (CEST)
Received: from localhost ([::1]:48152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL620-0003q7-U7
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 09:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35539)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iL5mU-0002FP-1o
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:25:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iL5mS-0001H1-KF
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:25:29 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51602)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iL5mS-0001Gh-ED
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:25:28 -0400
Received: by mail-wm1-x342.google.com with SMTP id 7so2584893wme.1
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 06:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=egF3Vw2goo6WaHZI3OIW1Hizhl8BXq2bn64y53glHKg=;
 b=uQx+5Yk6u7tkxbtNEo+L83ysZJDMFfLKDyRd+ZlujWfrz5sp5hF+BAdcbN2v+/Z5O+
 0LoqrxDVpWv1ExC9ATz9iq6Qpx32EIRkK6h2VckKkQORkndDKV88oMwE3wr/LXZis1o4
 rKnIL8gngxkTGIFb/EbT+ismDqUuYu+a2/ipMU/Ta8rnOpsFFqXedvWrxsqf2iHGfELr
 ArVWawPzqXuH6y0dIfv+p+HteunHvCs0t9s5QVbKhD2UBQyLsP96ZbiXrnUaoeXt7+IC
 2gilmdFW+xaD6A3nSUq1wJ4QwSSTpJngv/OSxTVICegrzlXPjHvV7W9oucprdiT3l98G
 prTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=egF3Vw2goo6WaHZI3OIW1Hizhl8BXq2bn64y53glHKg=;
 b=rmnndh2PAYAdp9z5eW1wMQlxkSPYEbZUwomK6bQrnGyzoI5mmiM5lm1iY+8Wgw2mPW
 Ziv8+CYYw/1tsnWXKaAtTIczwwZ5zIIfakh0LFc2MjM1FtmA7+se5oda4OV1x9sQoIqL
 AhK625bASz8ko8X5A+WkHema9BKjrG/gx0U6CweQVDW8H4Fns+iP5Pf7S8l0PufSKOlJ
 iImebL8Xm/zMAUB+t2Boe1rDU81oL8YFqOD7nP29ghTNkpd99SVwBa5RChutFWiL5oh3
 99yu27D+pQefgp2u4GYXfX6LbPjoVYn4eUmrcLmgfgEIip5a/ylPyWahqeLL3VNgdvgm
 JoSQ==
X-Gm-Message-State: APjAAAWjqqWcQhKQ36G42Wr19kNI1/19HWkZwGcUp/LVWkA8fgaGsFmC
 at8yxAsnMHzARA2MkLhM+bCe/A==
X-Google-Smtp-Source: APXvYqzMT6V7ElPiQpWfZKpRSwLsTBZlNqc6sFRtm9pR6Qp0wkT8inQV5xixzZfel5C4yVUdAn4UEw==
X-Received: by 2002:a05:600c:2318:: with SMTP id
 24mr2796054wmo.146.1571318727264; 
 Thu, 17 Oct 2019 06:25:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n22sm1966559wmk.19.2019.10.17.06.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 06:25:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5A2D61FFBC;
 Thu, 17 Oct 2019 14:16:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 37/54] plugin: expand the plugin_init function to include
 an info block
Date: Thu, 17 Oct 2019 14:15:58 +0100
Message-Id: <20191017131615.19660-38-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017131615.19660-1-alex.bennee@linaro.org>
References: <20191017131615.19660-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: aaron@os.amperecomputing.com, cota@braap.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 robert.foley@futurewei.com, peter.puhov@futurewei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This provides a limited amount of info to plugins about the guest
system that will allow them to make some additional decisions on
setup.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v6
  - split and move to pre example plugins
  - checkpatch fixes
---
 include/qemu/qemu-plugin.h | 26 ++++++++++++++++++++++++--
 plugins/loader.c           | 23 +++++++++++++++++++----
 2 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index c213d1dd19..784f1dfc3d 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -38,9 +38,27 @@
 
 typedef uint64_t qemu_plugin_id_t;
 
+typedef struct {
+    /* string describing architecture */
+    const char *target_name;
+    /* is this a full system emulation? */
+    bool system_emulation;
+    union {
+        /*
+         * smp_vcpus may change if vCPUs can be hot-plugged, max_vcpus
+         * is the system-wide limit.
+         */
+        struct {
+            int smp_vcpus;
+            int max_vcpus;
+        } system;
+    };
+} qemu_info_t;
+
 /**
  * qemu_plugin_install() - Install a plugin
  * @id: this plugin's opaque ID
+ * @info: a block describing some details about the guest
  * @argc: number of arguments
  * @argv: array of arguments (@argc elements)
  *
@@ -49,10 +67,14 @@ typedef uint64_t qemu_plugin_id_t;
  * Note: Calling qemu_plugin_uninstall() from this function is a bug. To raise
  * an error during install, return !0.
  *
+ * Note: @info is only live during the call. Copy any information we
+ * want to keep.
+ *
  * Note: @argv remains valid throughout the lifetime of the loaded plugin.
  */
-QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id, int argc,
-                                           char **argv);
+QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
+                                           const qemu_info_t *info,
+                                           int argc, char **argv);
 
 /*
  * Prototypes for the various callback styles we will be registering
diff --git a/plugins/loader.c b/plugins/loader.c
index eaedff577c..ce724ed583 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -28,6 +28,10 @@
 #include "hw/core/cpu.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/boards.h"
+#endif
+
 #include "plugin.h"
 
 /*
@@ -58,7 +62,7 @@ QemuOptsList qemu_plugin_opts = {
     },
 };
 
-typedef int (*qemu_plugin_install_func_t)(qemu_plugin_id_t, int, char **);
+typedef int (*qemu_plugin_install_func_t)(qemu_plugin_id_t, const qemu_info_t *, int, char **);
 
 extern struct qemu_plugin_state plugin;
 
@@ -145,7 +149,7 @@ static uint64_t xorshift64star(uint64_t x)
     return x * UINT64_C(2685821657736338717);
 }
 
-static int plugin_load(struct qemu_plugin_desc *desc)
+static int plugin_load(struct qemu_plugin_desc *desc, const qemu_info_t *info)
 {
     qemu_plugin_install_func_t install;
     struct qemu_plugin_ctx *ctx;
@@ -193,7 +197,7 @@ static int plugin_load(struct qemu_plugin_desc *desc)
     }
     QTAILQ_INSERT_TAIL(&plugin.ctxs, ctx, entry);
     ctx->installing = true;
-    rc = install(ctx->id, desc->argc, desc->argv);
+    rc = install(ctx->id, info, desc->argc, desc->argv);
     ctx->installing = false;
     if (rc) {
         error_report("%s: qemu_plugin_install returned error code %d",
@@ -241,11 +245,22 @@ static void plugin_desc_free(struct qemu_plugin_desc *desc)
 int qemu_plugin_load_list(QemuPluginList *head)
 {
     struct qemu_plugin_desc *desc, *next;
+    g_autofree qemu_info_t *info = g_new0(qemu_info_t, 1);
+
+    info->target_name = TARGET_NAME;
+#ifndef CONFIG_USER_ONLY
+    MachineState *ms = MACHINE(qdev_get_machine());
+    info->system_emulation = true;
+    info->system.smp_vcpus = ms->smp.cpus;
+    info->system.max_vcpus = ms->smp.max_cpus;
+#else
+    info->system_emulation = false;
+#endif
 
     QTAILQ_FOREACH_SAFE(desc, head, entry, next) {
         int err;
 
-        err = plugin_load(desc);
+        err = plugin_load(desc, info);
         if (err) {
             return err;
         }
-- 
2.20.1


