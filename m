Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42406317349
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:26:02 +0100 (CET)
Received: from localhost ([::1]:49328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9xvt-00024M-9N
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:26:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhb-0006BQ-2C
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:15 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:50619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhO-0003DM-A1
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:14 -0500
Received: by mail-wm1-x334.google.com with SMTP id 190so3197766wmz.0
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cA1mms/KC7D4GEashRpyD31vpirMAJEbz5RpC4ZLHNc=;
 b=b45mrV1t6o43kheVyTrkaCTikMh1zbavGNZDTu9wfKjqCWugBEpyoxxzpuMyZKYCVN
 qNgiYRBNi+4fq3qi7OrU0yADLkluKClWuDpY1TuZnNGclJ+sUIhlHFiEs3AhEfjTS7Tz
 oUEHpFYZNMLo0lEgYhRvsiaBBzG/yh5BdJ3FXc4xIO+IxZCAcMUQ+3vNvDxt8PDqvDZL
 +T6E8lvDDHbJwDYoEonoVrBW8qKzzE4D2riCJSs/IsGN17NxPDIl1MvYNxeIJKFGcGaQ
 lpJ4KAzmhGgIYpsGFE7BZFeOO11fNJs5gWPwLX+8Ijpc6XYlnGKrjqia0Ao0v2erDwBU
 mYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cA1mms/KC7D4GEashRpyD31vpirMAJEbz5RpC4ZLHNc=;
 b=dcfcjJeXcSKu7wY3xwwmBbcx3WJ3G15yLGD5VpBIG9sj8ugs4gR9DV4oBoGsgxZ111
 y6WtlTVoeG5PlsbWCK/UF8ozA0PddwfmZYy9hYcKDwRJRnknUr0r5slwWls0C+VybElm
 lE7vT+aRey07646v+JtCSKHORQ3B8zD/bH/8nx1QmtLeV8+PY0nwjsGVRk0epz9PNwHn
 G2eXF7wHRrbUxRZfOZEkKZwZfIUSI9+kgXk5drJ5Mr4xtUTAmB6ehjQWmDH4Ios79ZQJ
 yOVo2tmk9yUpTJeFVxYK4c8hv5HMSfZ0cIStBkh+WymJ369m0lYaXnjM89XoWQatRovi
 IHDA==
X-Gm-Message-State: AOAM532vCA4cMGSwjhcFftdyYPSVkFDdfiYX7ZxAaVGdUPUA5Jie2FLQ
 ZxewkJ8qp7yOgn7e6pCyyNXngA==
X-Google-Smtp-Source: ABdhPJwyX8q+56hR9eWrWDUV/aK9W212eYVGarmElb48B7qw7V+56U5Qccdmj1XhkjxmkQoAsK4pgw==
X-Received: by 2002:a1c:c904:: with SMTP id f4mr1233652wmb.14.1612995059599;
 Wed, 10 Feb 2021 14:10:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j17sm4536846wmc.28.2021.02.10.14.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:10:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CB42D1FF8F;
 Wed, 10 Feb 2021 22:10:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 03/21] plugins: new hwprofile plugin
Date: Wed, 10 Feb 2021 22:10:35 +0000
Message-Id: <20210210221053.18050-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210210221053.18050-1-alex.bennee@linaro.org>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Robert Foley <robert.foley@linaro.org>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a plugin intended to help with profiling access to various
bits of system hardware. It only really makes sense for system
emulation.

It takes advantage of the recently exposed helper API that allows us
to see the device name (memory region name) associated with a device.

You can specify arg=read or arg=write to limit the tracking to just
reads or writes (by default it does both).

The pattern option:

  -plugin ./tests/plugin/libhwprofile.so,arg=pattern

will allow you to see the access pattern to devices, eg:

  gic_cpu @ 0xffffffc010040000
    off:00000000, 8, 1, 8, 1
    off:00000000, 4, 1, 4, 1
    off:00000000, 2, 1, 2, 1
    off:00000000, 1, 1, 1, 1

The source option:

  -plugin ./tests/plugin/libhwprofile.so,arg=source

will track the virtual source address of the instruction making the
access:

  pl011 @ 0xffffffc010031000
    pc:ffffffc0104c785c, 1, 4, 0, 0
    pc:ffffffc0104c7898, 1, 4, 0, 0
    pc:ffffffc010512bcc, 2, 1867, 0, 0

You cannot mix source and pattern.

Finally the match option allow you to limit the tracking to just the
devices you care about.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Robert Foley <robert.foley@linaro.org>
Tested-by: Robert Foley <robert.foley@linaro.org>
Message-Id: <20200713200415.26214-12-alex.bennee@linaro.org>

---
vN
  - add some notes to tcg-plugins.rst
---
 docs/devel/tcg-plugins.rst  |  34 ++++
 contrib/plugins/hwprofile.c | 305 ++++++++++++++++++++++++++++++++++++
 contrib/plugins/Makefile    |   1 +
 3 files changed, 340 insertions(+)
 create mode 100644 contrib/plugins/hwprofile.c

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 0568dfa6a4..39ce86ed96 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -280,3 +280,37 @@ which will eventually report::
     previously @ 0x000000ffd08098/5 (809900593 insns)
     previously @ 0x000000ffd080c0/1 (809900588 insns)
 
+- contrib/plugins/hwprofile
+
+The hwprofile tool can only be used with system emulation and allows
+the user to see what hardware is accessed how often. It has a number of options:
+
+ * arg=read or arg=write
+
+ By default the plugin tracks both reads and writes. You can use one
+ of these options to limit the tracking to just one class of accesses.
+
+ * arg=source
+
+ Will include a detailed break down of what the guest PC that made the
+ access was. Not compatible with arg=pattern. Example output::
+
+   cirrus-low-memory @ 0xfffffd00000a0000
+    pc:fffffc0000005cdc, 1, 256
+    pc:fffffc0000005ce8, 1, 256
+    pc:fffffc0000005cec, 1, 256
+
+ * arg=pattern
+
+ Instead break down the accesses based on the offset into the HW
+ region. This can be useful for seeing the most used registers of a
+ device. Example output::
+
+    pci0-conf @ 0xfffffd01fe000000
+      off:00000004, 1, 1
+      off:00000010, 1, 3
+      off:00000014, 1, 3
+      off:00000018, 1, 2
+      off:0000001c, 1, 2
+      off:00000020, 1, 2
+      ...
diff --git a/contrib/plugins/hwprofile.c b/contrib/plugins/hwprofile.c
new file mode 100644
index 0000000000..6dac1d5f85
--- /dev/null
+++ b/contrib/plugins/hwprofile.c
@@ -0,0 +1,305 @@
+/*
+ * Copyright (C) 2020, Alex Bennée <alex.bennee@linaro.org>
+ *
+ * HW Profile - breakdown access patterns for IO to devices
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
+QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+
+#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
+
+typedef struct {
+    uint64_t cpu_read;
+    uint64_t cpu_write;
+    uint64_t reads;
+    uint64_t writes;
+} IOCounts;
+
+typedef struct {
+    uint64_t off_or_pc;
+    IOCounts counts;
+} IOLocationCounts;
+
+typedef struct {
+    const char *name;
+    uint64_t   base;
+    IOCounts   totals;
+    GHashTable *detail;
+} DeviceCounts;
+
+static GMutex lock;
+static GHashTable *devices;
+
+/* track the access pattern to a piece of HW */
+static bool pattern;
+/* track the source address of access to HW */
+static bool source;
+/* track only matched regions of HW */
+static bool check_match;
+static gchar **matches;
+
+static enum qemu_plugin_mem_rw rw = QEMU_PLUGIN_MEM_RW;
+
+static inline bool track_reads(void)
+{
+    return rw == QEMU_PLUGIN_MEM_RW || rw == QEMU_PLUGIN_MEM_R;
+}
+
+static inline bool track_writes(void)
+{
+    return rw == QEMU_PLUGIN_MEM_RW || rw == QEMU_PLUGIN_MEM_W;
+}
+
+static void plugin_init(void)
+{
+    devices = g_hash_table_new(NULL, NULL);
+}
+
+static gint sort_cmp(gconstpointer a, gconstpointer b)
+{
+    DeviceCounts *ea = (DeviceCounts *) a;
+    DeviceCounts *eb = (DeviceCounts *) b;
+    return ea->totals.reads + ea->totals.writes >
+           eb->totals.reads + eb->totals.writes ? -1 : 1;
+}
+
+static gint sort_loc(gconstpointer a, gconstpointer b)
+{
+    IOLocationCounts *ea = (IOLocationCounts *) a;
+    IOLocationCounts *eb = (IOLocationCounts *) b;
+    return ea->off_or_pc > eb->off_or_pc;
+}
+
+static void fmt_iocount_record(GString *s, IOCounts *rec)
+{
+    if (track_reads()) {
+        g_string_append_printf(s, ", %"PRIx64", %"PRId64,
+                               rec->cpu_read, rec->reads);
+    }
+    if (track_writes()) {
+        g_string_append_printf(s, ", %"PRIx64", %"PRId64,
+                               rec->cpu_write, rec->writes);
+    }
+}
+
+static void fmt_dev_record(GString *s, DeviceCounts *rec)
+{
+    g_string_append_printf(s, "%s, 0x%"PRIx64,
+                           rec->name, rec->base);
+    fmt_iocount_record(s, &rec->totals);
+    g_string_append_c(s, '\n');
+}
+
+static void plugin_exit(qemu_plugin_id_t id, void *p)
+{
+    g_autoptr(GString) report = g_string_new("");
+    GList *counts;
+
+    if (!(pattern || source)) {
+        g_string_printf(report, "Device, Address");
+        if (track_reads()) {
+            g_string_append_printf(report, ", RCPUs, Reads");
+        }
+        if (track_writes()) {
+            g_string_append_printf(report, ",  WCPUs, Writes");
+        }
+        g_string_append_c(report, '\n');
+    }
+
+    counts = g_hash_table_get_values(devices);
+    if (counts && g_list_next(counts)) {
+        GList *it;
+
+        it = g_list_sort(counts, sort_cmp);
+
+        while (it) {
+            DeviceCounts *rec = (DeviceCounts *) it->data;
+            if (rec->detail) {
+                GList *accesses = g_hash_table_get_values(rec->detail);
+                GList *io_it = g_list_sort(accesses, sort_loc);
+                const char *prefix = pattern ? "off" : "pc";
+                g_string_append_printf(report, "%s @ 0x%"PRIx64"\n",
+                                       rec->name, rec->base);
+                while (io_it) {
+                    IOLocationCounts *loc = (IOLocationCounts *) io_it->data;
+                    g_string_append_printf(report, "  %s:%08"PRIx64,
+                                           prefix, loc->off_or_pc);
+                    fmt_iocount_record(report, &loc->counts);
+                    g_string_append_c(report, '\n');
+                    io_it = io_it->next;
+                }
+            } else {
+                fmt_dev_record(report, rec);
+            }
+            it = it->next;
+        };
+        g_list_free(it);
+    }
+
+    qemu_plugin_outs(report->str);
+}
+
+static DeviceCounts *new_count(const char *name, uint64_t base)
+{
+    DeviceCounts *count = g_new0(DeviceCounts, 1);
+    count->name = name;
+    count->base = base;
+    if (pattern || source) {
+        count->detail = g_hash_table_new(NULL, NULL);
+    }
+    g_hash_table_insert(devices, (gpointer) name, count);
+    return count;
+}
+
+static IOLocationCounts *new_location(GHashTable *table, uint64_t off_or_pc)
+{
+    IOLocationCounts *loc = g_new0(IOLocationCounts, 1);
+    loc->off_or_pc = off_or_pc;
+    g_hash_table_insert(table, (gpointer) off_or_pc, loc);
+    return loc;
+}
+
+static void hwprofile_match_hit(DeviceCounts *rec, uint64_t off)
+{
+    g_autoptr(GString) report = g_string_new("hwprofile: match @ offset");
+    g_string_append_printf(report, "%"PRIx64", previous hits\n", off);
+    fmt_dev_record(report, rec);
+    qemu_plugin_outs(report->str);
+}
+
+static void inc_count(IOCounts *count, bool is_write, unsigned int cpu_index)
+{
+    if (is_write) {
+        count->writes++;
+        count->cpu_write |= (1 << cpu_index);
+    } else {
+        count->reads++;
+        count->cpu_read |= (1 << cpu_index);
+    }
+}
+
+static void vcpu_haddr(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo,
+                       uint64_t vaddr, void *udata)
+{
+    struct qemu_plugin_hwaddr *hwaddr = qemu_plugin_get_hwaddr(meminfo, vaddr);
+
+    if (!hwaddr || !qemu_plugin_hwaddr_is_io(hwaddr)) {
+        return;
+    } else {
+        const char *name = qemu_plugin_hwaddr_device_name(hwaddr);
+        uint64_t off = qemu_plugin_hwaddr_device_offset(hwaddr);
+        bool is_write = qemu_plugin_mem_is_store(meminfo);
+        DeviceCounts *counts;
+
+        g_mutex_lock(&lock);
+        counts = (DeviceCounts *) g_hash_table_lookup(devices, name);
+
+        if (!counts) {
+            uint64_t base = vaddr - off;
+            counts = new_count(name, base);
+        }
+
+        if (check_match) {
+            if (g_strv_contains((const char * const *)matches, counts->name)) {
+                hwprofile_match_hit(counts, off);
+                inc_count(&counts->totals, is_write, cpu_index);
+            }
+        } else {
+            inc_count(&counts->totals, is_write, cpu_index);
+        }
+
+        /* either track offsets or source of access */
+        if (source) {
+            off = (uint64_t) udata;
+        }
+
+        if (pattern || source) {
+            IOLocationCounts *io_count = g_hash_table_lookup(counts->detail,
+                                                             (gpointer) off);
+            if (!io_count) {
+                io_count = new_location(counts->detail, off);
+            }
+            inc_count(&io_count->counts, is_write, cpu_index);
+        }
+
+        g_mutex_unlock(&lock);
+    }
+}
+
+static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
+{
+    size_t n = qemu_plugin_tb_n_insns(tb);
+    size_t i;
+
+    for (i = 0; i < n; i++) {
+        struct qemu_plugin_insn *insn = qemu_plugin_tb_get_insn(tb, i);
+        gpointer udata = (gpointer) (source ? qemu_plugin_insn_vaddr(insn) : 0);
+        qemu_plugin_register_vcpu_mem_cb(insn, vcpu_haddr,
+                                         QEMU_PLUGIN_CB_NO_REGS,
+                                         rw, udata);
+    }
+}
+
+QEMU_PLUGIN_EXPORT
+int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
+                        int argc, char **argv)
+{
+    int i;
+
+    for (i = 0; i < argc; i++) {
+        char *opt = argv[i];
+        if (g_strcmp0(opt, "read") == 0) {
+            rw = QEMU_PLUGIN_MEM_R;
+        } else if (g_strcmp0(opt, "write") == 0) {
+            rw = QEMU_PLUGIN_MEM_W;
+        } else if (g_strcmp0(opt, "pattern") == 0) {
+            pattern = true;
+        } else if (g_strcmp0(opt, "source") == 0) {
+            source = true;
+        } else if (g_str_has_prefix(opt, "match")) {
+            gchar **parts = g_strsplit(opt, "=", 2);
+            check_match = true;
+            matches = g_strsplit(parts[1], ",", -1);
+            g_strfreev(parts);
+        } else {
+            fprintf(stderr, "option parsing failed: %s\n", opt);
+            return -1;
+        }
+    }
+
+    if (source && pattern) {
+        fprintf(stderr, "can only currently track either source or pattern.\n");
+        return -1;
+    }
+
+    if (!info->system_emulation) {
+        fprintf(stderr, "hwprofile: plugin only useful for system emulation\n");
+        return -1;
+    }
+
+    /* Just warn about overflow */
+    if (info->system.smp_vcpus > 64 ||
+        info->system.max_vcpus > 64) {
+        fprintf(stderr, "hwprofile: can only track up to 64 CPUs\n");
+    }
+
+    plugin_init();
+
+    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
+    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
+    return 0;
+}
diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index 7801b08b0d..b9d7935e5e 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -17,6 +17,7 @@ NAMES += hotblocks
 NAMES += hotpages
 NAMES += howvec
 NAMES += lockstep
+NAMES += hwprofile
 
 SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 
-- 
2.20.1


