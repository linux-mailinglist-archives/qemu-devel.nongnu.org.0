Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7862138FFF2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 13:29:03 +0200 (CEST)
Received: from localhost ([::1]:56548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llVF8-0002NI-9E
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 07:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llVB1-0002ZN-P6
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:24:47 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:54006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llVAy-00030S-2M
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:24:47 -0400
Received: by mail-wm1-x330.google.com with SMTP id h3so3780627wmq.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 04:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B4E52WDV0HW4Iobfoi2xYeceYAjvoonRNwFWdGg8quo=;
 b=HHHBgodqQKorGQoxF7p67opM8ah/Ku5a+lArwA/oxHddUaA0/LfRgWjhHTHIittwfg
 aSfQM29m2fZfxhisFSKXCewSCCK4NpO2z5zJSV+Ax12KQHRQqg1suiWt2rwLxo1gd3Dq
 4Dt5PYM+QTh+B3K4kBoc34f0r7KRPjl7WFurfvVLrlhnq+yws3s1J2YpRc8zpnTxT54O
 D4eGa15di9uWWpJUpAUBTyKTkYlsjma6Bdb8Are4tab+TC4nAL33Ntk8whp3fNvOUWMH
 FU/Cy3mU2cnLI6WxWMM/VDzTUB+7GVsK6g/puR0BhnfY01XXpISm6ypMHOik+Yjo8IsR
 +DRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B4E52WDV0HW4Iobfoi2xYeceYAjvoonRNwFWdGg8quo=;
 b=PxhbY36bf2j+9EBfSWAFXOG5/cKyH50fCQZPADa1Ss83COYmX3TlLT8TFm8B8LhdOp
 wcMZwHAnpfjlz0YgtHbd/xciutTxCb9NYgGa4xaOw839dxAfcEFYA7YbfWOZfb5CXqhR
 XjAl0uH//uL7XNjHVFlLEB4CKCFuFb88fObYQA/fiw2ItJH7uqRe8oTSxUTZFDCdKQhW
 evgtn3zcg6vDtKeKZMIIa04ej5MYoNyaq17WRvClUVToUXzr0mOAMcTXyEtFLIkI37eO
 uig435TSq6lGD7yZHWXT4PvP9MSLywOny7H/mj0Q+kinm5wjwuYX06j38XWcF/3FeGgv
 ThWQ==
X-Gm-Message-State: AOAM532ggksJ9pKOAmEpp0aQyxkougAgg4CGFBRTANY5SYFmT6Noobyb
 LjujX9dm9WbVdht9y1b5sj4xQg==
X-Google-Smtp-Source: ABdhPJzxoUvP2MAyTx876Qoh2CsGNP5jJLevQK22N8xMxr7u8ZieYrbNYfQGIEX2gTzPX8HNhl8JcQ==
X-Received: by 2002:a1c:f016:: with SMTP id a22mr6044499wmb.65.1621941882682; 
 Tue, 25 May 2021 04:24:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f12sm15723616wre.88.2021.05.25.04.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 04:24:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 653621FF93;
 Tue, 25 May 2021 12:24:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 7/7] plugins/syscall: Added a table-like summary output
Date: Tue, 25 May 2021 12:24:31 +0100
Message-Id: <20210525112431.22005-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525112431.22005-1-alex.bennee@linaro.org>
References: <20210525112431.22005-1-alex.bennee@linaro.org>
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Added a table-like output which contains the total number of calls
for each used syscall along with the number of errors that occurred.

Per-call tracing is still available through supplying the argument
``print`` to the plugin.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210519032409.3041-1-ma.mandourr@gmail.com>
Message-Id: <20210520174303.12310-9-alex.bennee@linaro.org>

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
2.20.1


