Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15330388533
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 05:25:42 +0200 (CEST)
Received: from localhost ([::1]:33110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljCq4-0005e2-VW
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 23:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1ljCpD-0004xd-O9
 for qemu-devel@nongnu.org; Tue, 18 May 2021 23:24:47 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1ljCp8-0002jW-44
 for qemu-devel@nongnu.org; Tue, 18 May 2021 23:24:47 -0400
Received: by mail-wr1-x435.google.com with SMTP id x8so12321809wrq.9
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 20:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ll72BrYeL0r2l17o+PneiMvZGla9vfMJ4EKZ7zu6Kro=;
 b=vFl12YT8xvMsF8qRSj+DMUn7WkAPg7I3ILzkkdEIVT3auyEmtqMTgAehjGP0peX+ok
 kcL3s8BjUJwRzZfket/uGfDMVO2sFcelcYXRziZA42RjcvwHSWds+63jgWVKlnz5YRW6
 B5qcGk0IAy95CWmZRh0aLRz0JMBrDbN/3IioLXA2Ck0wmb1cdGNMgVF2jvWKAj/SLFDs
 AXCWe5cf4Y2LgOKQlWe5bBi8JActLOvfCvH6KbSbKTF/1u3u7xINGJ/JKXg8aaFT7aVp
 o6R5Ok+DLVcnDsIpF0gJJZrplUA6o30c4Bh7CVrBd8YoHF1q0TKwqh0fAeLTJuZU1xg4
 IFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ll72BrYeL0r2l17o+PneiMvZGla9vfMJ4EKZ7zu6Kro=;
 b=jKDli6J7xJ+snyRqI5oTGcm4GmyMhxhZuu92OPgTXD42ViZZa9v6XnNSM+gqK6rNRH
 Bhmxe7NSx4aSfKSBtK8uaah9BmLehA2y6rks75bF1vZnrTilf6y7Ij4iNYbewEUvHlDf
 pyLJNSKZH0ftGZivnOJFdVxroIDUdol3eywdD+TNDpHaUyaFrXcwHY5BPg5PXHcbncwd
 0ZBZcSa4Ks/fFVjeQ0cwv3qMHDiT2hVjhwW3HYHzKZiDPkWsegj/Ru8OJy8BUSSrLusQ
 xx6YAwv9JKtx6OFR3uGMcUpFm/AG0yhe9h7uRGdExGh23OGfNym1MwZWdfW/todIL8nm
 OFyw==
X-Gm-Message-State: AOAM532fDM4F5fIn2Ezdbg/GN4PBTaKph84B+ppan/XFVaQk7+TL85w5
 eI5bYsP4gpNi3hwAmom7f855O6NSilof3Q==
X-Google-Smtp-Source: ABdhPJwCzDaab/D3yu7DcXtEFWtyZELhEl8ivGPODrUiEYtmMwfMAnHJ0pHe7jEbn2dYHsq3T1tSyQ==
X-Received: by 2002:adf:ce09:: with SMTP id p9mr11616665wrn.114.1621394678205; 
 Tue, 18 May 2021 20:24:38 -0700 (PDT)
Received: from localhost.localdomain ([41.238.37.184])
 by smtp.googlemail.com with ESMTPSA id z66sm4673226wmc.4.2021.05.18.20.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 20:24:37 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4] plugins/syscall: Added a table-like summary output
Date: Wed, 19 May 2021 05:24:09 +0200
Message-Id: <20210519032409.3041-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x435.google.com
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
v3 -> v4: Added a missing ``static`` that was causing a compilation 
          error. Otherwise, everything else is left in place.
 tests/plugin/syscall.c | 98 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 93 insertions(+), 5 deletions(-)

diff --git a/tests/plugin/syscall.c b/tests/plugin/syscall.c
index 53ee2ab6c4..6dd71092e1 100644
--- a/tests/plugin/syscall.c
+++ b/tests/plugin/syscall.c
@@ -16,32 +16,120 @@
 
 QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
 
+typedef struct {
+    int64_t num;
+    int64_t calls;
+    int64_t errors;
+} SyscallStats;
+
+static GMutex lock;
+static GHashTable *statistics;
+
+static SyscallStats *get_or_create_entry(int64_t num)
+{
+    SyscallStats *entry =
+        (SyscallStats *) g_hash_table_lookup(statistics, GINT_TO_POINTER(num));
+
+    if (!entry) {
+        entry = g_new0(SyscallStats, 1);
+        entry->num = num;
+        g_hash_table_insert(statistics, GINT_TO_POINTER(num), (gpointer) entry);
+    }
+
+    return entry;
+}
+
 static void vcpu_syscall(qemu_plugin_id_t id, unsigned int vcpu_index,
                          int64_t num, uint64_t a1, uint64_t a2,
                          uint64_t a3, uint64_t a4, uint64_t a5,
                          uint64_t a6, uint64_t a7, uint64_t a8)
 {
-    g_autofree gchar *out = g_strdup_printf("syscall #%" PRIi64 "\n", num);
-    qemu_plugin_outs(out);
+    if (statistics) {
+        SyscallStats *entry;
+        g_mutex_lock(&lock);
+        entry = get_or_create_entry(num);
+        entry->calls++;
+        g_mutex_unlock(&lock);
+    } else {
+        g_autofree gchar *out = g_strdup_printf("syscall #%" PRIi64 "\n", num);
+        qemu_plugin_outs(out);
+    }
 }
 
 static void vcpu_syscall_ret(qemu_plugin_id_t id, unsigned int vcpu_idx,
                              int64_t num, int64_t ret)
+{
+    if (statistics) {
+        SyscallStats *entry;
+
+        g_mutex_lock(&lock);
+        /* Should always return an existent entry. */
+        entry = get_or_create_entry(num);
+        if (ret < 0) {
+            entry->errors++;
+        }
+        g_mutex_unlock(&lock);
+    } else {
+        g_autofree gchar *out;
+        out = g_strdup_printf("syscall #%" PRIi64 " returned -> %" PRIi64 "\n",
+                num, ret);
+        qemu_plugin_outs(out);
+    }
+}
+
+static void print_entry(gpointer val, gpointer user_data)
 {
     g_autofree gchar *out;
-    out = g_strdup_printf("syscall #%" PRIi64 " returned -> %" PRIi64 "\n",
-            num, ret);
+    SyscallStats *entry = (SyscallStats *) val;
+    int64_t syscall_num = entry->num;
+    out = g_strdup_printf(
+        "%-13" PRIi64 "%-6" PRIi64 " %" PRIi64 "\n",
+        syscall_num, entry->calls, entry->errors);
     qemu_plugin_outs(out);
 }
 
+static gint comp_func(gconstpointer ea, gconstpointer eb)
+{
+    SyscallStats *ent_a = (SyscallStats *) ea;
+    SyscallStats *ent_b = (SyscallStats *) eb;
+
+    return ent_a->calls > ent_b->calls ? -1 : 1;
+}
+
 /* ************************************************************************* */
+static void plugin_exit(qemu_plugin_id_t id, void *p)
+{
+    if (!statistics) {
+        return;
+    }
+
+    g_mutex_lock(&lock);
+    GList *entries = g_hash_table_get_values(statistics);
+    entries = g_list_sort(entries, comp_func);
+    qemu_plugin_outs("syscall no.  calls  errors\n");
 
-static void plugin_exit(qemu_plugin_id_t id, void *p) {}
+    g_list_foreach(entries, print_entry, NULL);
+
+    g_list_free(entries);
+    g_hash_table_destroy(statistics);
+    g_mutex_unlock(&lock);
+}
 
 QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            const qemu_info_t *info,
                                            int argc, char **argv)
 {
+    if (argc == 0) {
+        statistics = g_hash_table_new_full(NULL, g_direct_equal, NULL, g_free);
+    } else {
+        for (int i = 0; i < argc; i++) {
+            if (g_strcmp0(argv[i], "print") != 0) {
+                fprintf(stderr, "unsupported argument: %s\n", argv[i]);
+                return -1;
+            }
+        }
+    }
+
     qemu_plugin_register_vcpu_syscall_cb(id, vcpu_syscall);
     qemu_plugin_register_vcpu_syscall_ret_cb(id, vcpu_syscall_ret);
     qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
-- 
2.25.1


