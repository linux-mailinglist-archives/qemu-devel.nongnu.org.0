Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C831360ED4
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 17:21:47 +0200 (CEST)
Received: from localhost ([::1]:37540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX3oQ-0003lv-EO
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 11:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lX3n3-0002vc-Jw
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:20:21 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lX3n1-0006yE-Rt
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:20:21 -0400
Received: by mail-wr1-x430.google.com with SMTP id g9so7672627wrx.0
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 08:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cmh19EwdHtfs1kt3c+HhVstM1lLGdbDqXZlij1llPJE=;
 b=lwTf9xhjYAWTkkM+wLLJqQyPt5vTFkBq3s0GwvRqtaH4vbSr+vXdml7JpCZ9M072o+
 QIwQDOLvWrXO8vvaikiuyFJVok3jn1Ymdok+9m7yhgS2ccdWjVZXm45uCkpbo9uZMYAg
 sCcoTf+srnEuqvlW0+oq/UbIcoDaI7s8M6amnHbOv5TrfN4NNM/g2NbP58nraZfwlcv5
 6EQOyEEZACzvPvzSAUceioVRBFWd9MNCCMCxLOXJYL+GdMHqHO8Fp+kCfwK0Dnfi4om7
 WNjL6+mWjO9tWN/AKY+GGIUqXM505zNBqe+NuEDDYn4/WgXNV2i19AWv6uXMLHzUshy0
 j0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cmh19EwdHtfs1kt3c+HhVstM1lLGdbDqXZlij1llPJE=;
 b=aSW4tG7Cm8gPxWK/oH0gH1C4P+AJVCaN1p1pypE7sgLw+9DbSX8c6IPhX03LzYsG+A
 27EOXExa3PntmwPSMxqlLksQUjavNabxbMw773RDYB7JEfQYORdOvNBNmi6FFP6K97bT
 Q7YqndppIOXUvMu5yvdVTkq4ga+bB+yOuRK32sFvnvVnKtSOlqLSEchqGf2p8fYFji+F
 6mZ7lRzD9FXje6JvotAXkjy0rfnUS+4Z4bOGtboMhXyQVqXDwKlw3JV1OShUpG6jRgBm
 Q0Ll/zmtjdGWzh/hD1PIidMUrNIa68RVNx7acKvjAqB24eXYFoGnmXTBXhAZutusOdEL
 lM2A==
X-Gm-Message-State: AOAM532RRektkZRhQ72xsQBkw233khf7sKdDtUg/SMcbq9cjOeG2eU4o
 1oJ+c/g0FTuB2MOrwf8ztE1yLyYJ4Xw=
X-Google-Smtp-Source: ABdhPJym3Ls3lLqxR+R5w4Zt/URqndhmKQgTO0r4q3Qp806R+gaANQBX6TBnN269Jt3+MhpFP4Ps6A==
X-Received: by 2002:adf:fdcd:: with SMTP id i13mr4043238wrs.185.1618500017157; 
 Thu, 15 Apr 2021 08:20:17 -0700 (PDT)
Received: from localhost.localdomain ([41.36.15.230])
 by smtp.googlemail.com with ESMTPSA id a8sm4150577wrh.91.2021.04.15.08.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 08:20:16 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] plugins/syscall: Added a table-like summary output
Date: Thu, 15 Apr 2021 17:18:49 +0200
Message-Id: <20210415151849.26740-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added a table-like output which contains the total number of calls
for each used syscall along with the number of errors that occurred.

Per-call tracing is still available through supplying the argument
``print`` to the plugin.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 tests/plugin/syscall.c | 94 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 88 insertions(+), 6 deletions(-)

diff --git a/tests/plugin/syscall.c b/tests/plugin/syscall.c
index 53ee2ab6c4..b92340c636 100644
--- a/tests/plugin/syscall.c
+++ b/tests/plugin/syscall.c
@@ -16,32 +16,114 @@
 
 QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
 
+typedef struct {
+    int64_t calls;
+    int64_t errors;
+} SyscallStats;
+
+static GHashTable *syscalls_statistics;
+
+static bool percall_print;
+
 static void vcpu_syscall(qemu_plugin_id_t id, unsigned int vcpu_index,
                          int64_t num, uint64_t a1, uint64_t a2,
                          uint64_t a3, uint64_t a4, uint64_t a5,
                          uint64_t a6, uint64_t a7, uint64_t a8)
 {
-    g_autofree gchar *out = g_strdup_printf("syscall #%" PRIi64 "\n", num);
-    qemu_plugin_outs(out);
+    if (!percall_print) {
+        SyscallStats *syscall_entry;
+
+        syscall_entry =
+            (SyscallStats *) g_hash_table_lookup(syscalls_statistics,
+                                                  GINT_TO_POINTER(num));
+
+        if (!syscall_entry) {
+            syscall_entry = g_new(SyscallStats, 1);
+            syscall_entry->calls = 1;
+            syscall_entry->errors = 0;
+
+            g_hash_table_insert(syscalls_statistics, GINT_TO_POINTER(num),
+                                (gpointer) syscall_entry);
+        } else {
+            syscall_entry->calls++;
+        }
+    } else {
+        g_autofree gchar *out = g_strdup_printf("syscall #%" PRIi64 "\n", num);
+        qemu_plugin_outs(out);
+    }
 }
 
 static void vcpu_syscall_ret(qemu_plugin_id_t id, unsigned int vcpu_idx,
                              int64_t num, int64_t ret)
+{
+    if (!percall_print) {
+        SyscallStats *syscall_entry;
+
+        syscall_entry =
+            (SyscallStats *) g_hash_table_lookup(syscalls_statistics,
+                                                  GINT_TO_POINTER(num));
+        if (!syscall_entry) {
+            qemu_plugin_outs(g_strdup_printf("%" PRIi64 "\n", num));
+        }
+        if (ret < 0) {
+            syscall_entry->errors++;
+        }
+    } else {
+        g_autofree gchar *out;
+        out = g_strdup_printf("syscall #%" PRIi64 " returned -> %" PRIi64 "\n",
+                num, ret);
+        qemu_plugin_outs(out);
+    }
+}
+
+/* ************************************************************************* */
+
+void print_entry(gpointer key, gpointer val, gpointer user_data)
 {
     g_autofree gchar *out;
-    out = g_strdup_printf("syscall #%" PRIi64 " returned -> %" PRIi64 "\n",
-            num, ret);
+    int64_t syscall_num = (int64_t) key;
+    SyscallStats *syscall_entry = (SyscallStats *) val;
+    out = g_strdup_printf(
+        "%-13" PRIi64 "%-6" PRIi64 " %" PRIi64 "\n",
+        syscall_num, syscall_entry->calls, syscall_entry->errors);
     qemu_plugin_outs(out);
 }
 
-/* ************************************************************************* */
+static void plugin_exit(qemu_plugin_id_t id, void *p)
+{
+    if (!percall_print) {
+        qemu_plugin_outs("syscall no.  calls  errors\n");
+        g_hash_table_foreach(syscalls_statistics, &print_entry, NULL);
+    }
+}
 
-static void plugin_exit(qemu_plugin_id_t id, void *p) {}
+void free_entry(gpointer entry)
+{
+    g_free(entry);
+}
 
 QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            const qemu_info_t *info,
                                            int argc, char **argv)
 {
+    int i;
+
+    for (i = 0; i < argc; i++) {
+        char *opt = argv[i];
+        if (g_strcmp0(opt, "print") == 0) {
+            percall_print = true;
+        } else {
+            fprintf(stderr, "unsupported argument: %s\n", opt);
+            return -1;
+        }
+    }
+
+    if (!percall_print) {
+        syscalls_statistics =
+            g_hash_table_new_full(g_direct_hash, g_direct_equal,
+                    NULL, &free_entry);
+    }
+
     qemu_plugin_register_vcpu_syscall_cb(id, vcpu_syscall);
     qemu_plugin_register_vcpu_syscall_ret_cb(id, vcpu_syscall_ret);
     qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
-- 
2.25.1


