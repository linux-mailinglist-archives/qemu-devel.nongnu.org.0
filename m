Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43553465EC
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 19:42:37 +0200 (CEST)
Received: from localhost ([::1]:53836 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbqDk-0005uV-AS
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 13:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58618)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hbpqh-0005az-JX
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:18:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hbpqd-00075s-WE
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:18:46 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40809)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hbpqd-0006c2-Iu
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:18:43 -0400
Received: by mail-wr1-x42e.google.com with SMTP id p11so3330376wre.7
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 10:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q0g+J0COJWGb6iPQMwKOFR9aEmXrXmgB9rcv6IsahSA=;
 b=thCBkPLZn2OyMi7jzH1+rFIWqAmnnlae6qtM3JHYhegd4nIlQyqEfDh5QI0BsQYeHR
 Xj2fqCdLZGdeTYkzEeN2F1pKjfoMdKctAe0A/Rggke/nxqXRu7XY3uFeh6C70v8ZQpl+
 hVo+Sl1mUfSmN54kp3UYDnu8yhlLbCXX5crvoXVxwr9XhAheMc3+5lqUAAgKDX4iXvIM
 S0JvspdCIQlRIjPzqhu0xkkqy+54ymFoPcvV27eKNi962xBQQqSnt8TjVPkuYfwgKZBJ
 PtjH3b28PsZCIQKAEs+JBoPOdDd0+KyYwm+nOwrQiLERyfFak4k17+WNtNgp8DSY7HQC
 f87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q0g+J0COJWGb6iPQMwKOFR9aEmXrXmgB9rcv6IsahSA=;
 b=sf9a1E0A2sae/FgeeAF1zDLggX8b4CnKpAIAxUuKDmowlCUaiXczAIaUZ3n4ECbanx
 Jgh3PzmQhiKB5gxFEjX7pDsXhqRoqQK71BR36v3ViEIoU2XEbR3O95D+WHK2QMQmwkpi
 aJgDlz/9DPtJMHVbySOB1CIMmJoXdterMhuoNOZjfxIrrbc2hT+TesSpW+NUc260VmFI
 /TM397rx7m9F0pzZJvJDZKywNyyuQ0r+gtLyda3SRIFughZqfyNGYVdnvGX37QLY6mjU
 AYF8Fm6CDxIGwiKxUne3xGdAtqM0qvW+itpLI2914Qu+97lY67a77PwQdYgcVTjo6RWY
 Kajg==
X-Gm-Message-State: APjAAAWmy9xFxsc9TC2KzjRN2hyDUb1cvoO0ssKTOKBJHqWGQT+DwzDI
 lNxEy4Lf2DM69taUwZIwYh/8svsdWzY=
X-Google-Smtp-Source: APXvYqzake6QIVTv4bpS0cBgTdnAxv3DGFGNBUmfdmaidi5Zq2a3/dMizsC1Nh4af4tY2LhsDdl1ew==
X-Received: by 2002:adf:bac5:: with SMTP id w5mr51292878wrg.124.1560532708568; 
 Fri, 14 Jun 2019 10:18:28 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id v204sm5792081wma.20.2019.06.14.10.18.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 10:18:26 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 975771FFC5;
 Fri, 14 Jun 2019 18:12:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 14 Jun 2019 18:11:56 +0100
Message-Id: <20190614171200.21078-47-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614171200.21078-1-alex.bennee@linaro.org>
References: <20190614171200.21078-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42e
Subject: [Qemu-devel] [PATCH v3 46/50] tests/plugin: add hotpages plugin to
 breakdown memory access patterns
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This plugin gives a break down of access patterns grouped into pages.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/plugin/Makefile   |   1 +
 tests/plugin/hotpages.c | 152 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 153 insertions(+)
 create mode 100644 tests/plugin/hotpages.c

diff --git a/tests/plugin/Makefile b/tests/plugin/Makefile
index 3656429d46..75467b6db8 100644
--- a/tests/plugin/Makefile
+++ b/tests/plugin/Makefile
@@ -12,6 +12,7 @@ NAMES += insn
 NAMES += mem
 NAMES += hotblocks
 NAMES += howvec
+NAMES += hotpages
 
 SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 
diff --git a/tests/plugin/hotpages.c b/tests/plugin/hotpages.c
new file mode 100644
index 0000000000..ddeaad077b
--- /dev/null
+++ b/tests/plugin/hotpages.c
@@ -0,0 +1,152 @@
+/*
+ * Copyright (C) 2019, Alex Bennée <alex.bennee@linaro.org>
+ *
+ * Hot Pages - show which pages saw the most memory accesses.
+ *
+ * License: GNU GPL, version 2 or later.
+ *   See the COPYING file in the top-level directory.
+ */
+
+#include <inttypes.h>
+#include <assert.h>
+#include <stdlib.h>
+#include <inttypes.h>
+#include <string.h>
+#include <unistd.h>
+#include <stdio.h>
+#include <glib.h>
+
+#include <qemu-plugin.h>
+
+#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
+
+static bool do_inline;
+static uint64_t page_size;
+static uint64_t page_mask;
+static int stdout_fd;
+static int limit = 50;
+static enum qemu_plugin_mem_rw rw = QEMU_PLUGIN_MEM_RW;
+
+typedef struct {
+    uint64_t page_address;
+    int cpu_read;
+    int cpu_write;
+    uint64_t reads;
+    uint64_t writes;
+} PageCounters;
+
+static GMutex lock;
+static GHashTable *pages;
+
+static gint cmp_access_count(gconstpointer a, gconstpointer b)
+{
+    PageCounters *ea = (PageCounters *) a;
+    PageCounters *eb = (PageCounters *) b;
+    return (ea->reads + ea->writes) > (eb->reads + eb->writes) ? -1 : 1;
+}
+
+
+static void plugin_exit(qemu_plugin_id_t id, void *p)
+{
+    GString *report = g_string_new("Pages:\n");
+    int i;
+    GList *counts;
+
+    counts = g_hash_table_get_values(pages);
+    if (counts && g_list_next(counts)) {
+        GList *it;
+
+        g_string_append_printf(report,"Individual Instructions:\n");
+
+        it = g_list_sort(counts, cmp_access_count);
+
+        for (i = 0; i < limit && it->next; i++, it = it->next) {
+            PageCounters *rec = (PageCounters *) it->data;
+            g_string_append_printf(report, "Page: %"PRIx64" cpus:%#04x/%#04x %"PRId64"/%"PRId64"\n",
+                                   rec->page_address,
+                                   rec->cpu_read, rec->cpu_write,
+                                   rec->reads, rec->writes);
+        }
+        g_list_free(it);
+    }
+
+    dprintf(stdout_fd, "%s", report->str);
+    g_string_free(report, true);
+}
+
+static void plugin_init(void)
+{
+    page_mask = (page_size - 1);
+    pages = g_hash_table_new(NULL, g_direct_equal);
+}
+
+static void vcpu_haddr(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo,
+                       uint64_t vaddr, void *haddr, void *udata)
+{
+    uint64_t page = (uint64_t) haddr & page_mask;
+    PageCounters *count;
+
+    g_mutex_lock(&lock);
+    count = (PageCounters *) g_hash_table_lookup(pages, GUINT_TO_POINTER(page));
+
+    if (!count) {
+        count = g_new0(PageCounters, 1);
+        count->page_address = page;
+        g_hash_table_insert(pages, GUINT_TO_POINTER(page), (gpointer) count);
+    }
+    if (qemu_plugin_mem_is_store(meminfo)) {
+        count->writes++;
+        count->cpu_write |= (1 << cpu_index);
+    } else {
+        count->reads++;
+        count->cpu_read |= (1 << cpu_index);
+    }
+
+    g_mutex_unlock(&lock);
+}
+
+static void vcpu_tb_trans(qemu_plugin_id_t id, unsigned int cpu_index,
+                          struct qemu_plugin_tb *tb)
+{
+    size_t n = qemu_plugin_tb_n_insns(tb);
+    size_t i;
+
+    for (i = 0; i < n; i++) {
+        struct qemu_plugin_insn *insn = qemu_plugin_tb_get_insn(tb, i);
+        qemu_plugin_register_vcpu_mem_haddr_cb(insn, vcpu_haddr,
+                                               QEMU_PLUGIN_CB_NO_REGS,
+                                               rw, NULL);
+    }
+}
+
+static GOptionEntry entries[] =
+{
+    { "pagesize", 'r', 0, G_OPTION_ARG_INT, &page_size, "Page Size", "N" },
+    { "inline", 'i', 0, G_OPTION_ARG_NONE, &do_inline, "Inline counters", NULL },
+    { NULL }
+};
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id, int argc,
+                                           char **argv)
+{
+    GOptionContext *context;
+    GError *error;
+
+    context = g_option_context_new ("- hot pages tool");
+    g_option_context_add_main_entries (context, entries, NULL);
+    if (!g_option_context_parse (context, &argc, &argv, &error))
+    {
+        dprintf(stdout_fd, "option parsing failed: %s\n", error->message);
+        return -1;
+    }
+
+    /* to be used when in the exit hook */
+    stdout_fd = dup(STDOUT_FILENO);
+    assert(stdout_fd);
+
+    plugin_init();
+
+    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
+    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
+    return 0;
+}
-- 
2.20.1


