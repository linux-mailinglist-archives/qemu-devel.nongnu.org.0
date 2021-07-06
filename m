Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AFB3BDA2E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:28:37 +0200 (CEST)
Received: from localhost ([::1]:59032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0n00-0000uE-VF
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfA-0005Bd-AT
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:05 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:50851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mf8-00074p-3M
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:04 -0400
Received: by mail-wm1-x32f.google.com with SMTP id o22so13829826wms.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cuu/+/i+aE9OJCzoepBYKpRGSdrNqPNpgdExXOyA0HU=;
 b=dxI468LD9eFnEdL2WauVBfS++cx+JUM9NJqXLrquTiqzq7y7PO3wshPqfnxj/rs7wS
 S+SNCJdioXp0uVe3qW1EmOLWHy5EjgfD/muc/bLKJtd1H81pVrrNHDjGlWyGnw2SgXY8
 mV+kjQ4b4umPmnVYTQbY4M+6AnW1+shsgRJ1yhnfBWt90L60piSvJCflnxKHjuUN80Op
 1h9TUvmaGyFmuIDq0jie5QFO6TZLAMAhkIww0Cb70bV0PnYGyr3c1c1J+EjMvxY8A1LN
 6IZFwvIBQ8S8LICh/GcuQaCzji1sbUDsp3OWmsv/jcWqDNAa+YtTm1eiwde8PYS+g6ip
 o0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cuu/+/i+aE9OJCzoepBYKpRGSdrNqPNpgdExXOyA0HU=;
 b=F7yeBiqg/e4D2CaLXZKt1h6F1+iyDZAhW5xEn/zu+cbTaRySifsieBAQxhHNbAtrQS
 oeM6g9CWs8NmFKOscDtbkLQU/NQ8N5iS2yf1phg1qJ9lrhuH1T83h+ShC/98O6ok6OyY
 4i7MolroQZIJ5z7Ii8LM2rOgvsLGcX0fr0bp7olbSZdYDd6tikM2cyDOPHsGHjrzeCj/
 qefOPrEgqCqtL8QONDJVg4JQi1228DVm9m0Bk+5l0HklRNk78o+6TTpS25Xdkn09Stth
 fBkfBwnBr3/4Adi0yQ7JrELy7Gk7SEb5dGGIxROX0dtlHIevxJn4T7+MO+ITpdz/Zxeg
 Zr9w==
X-Gm-Message-State: AOAM532TG2pgm6s4k9+7X0HNAjJXyBLdZj34F24i5asxPbJb9Gz/LU8z
 LK437tFxqGJvp4c4TyN9E83QOg==
X-Google-Smtp-Source: ABdhPJzaBKh1ML7Z9W+KJRWfhn6lLNRfAPB0HlvIr6Ji7trjfYWchB7ULd8sahiCSt6J5V+FQkaxGg==
X-Received: by 2002:a05:600c:b48:: with SMTP id
 k8mr1339787wmr.180.1625584020590; 
 Tue, 06 Jul 2021 08:07:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a12sm2942694wrh.26.2021.07.06.08.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 08:06:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 56B711FFBA;
 Tue,  6 Jul 2021 15:58:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 33/39] contrib/plugins: add execlog to log instruction
 execution and memory access
Date: Tue,  6 Jul 2021 15:58:11 +0100
Message-Id: <20210706145817.24109-34-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Alexandre Iooss <erdnaxe@crans.org>

Log instruction execution and memory access to a file.
This plugin can be used for reverse engineering or for side-channel analysis
using QEMU.

Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210702081307.1653644-2-erdnaxe@crans.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/execlog.c | 153 ++++++++++++++++++++++++++++++++++++++
 MAINTAINERS               |   1 +
 contrib/plugins/Makefile  |   1 +
 3 files changed, 155 insertions(+)
 create mode 100644 contrib/plugins/execlog.c

diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
new file mode 100644
index 0000000000..2de9f0d7d4
--- /dev/null
+++ b/contrib/plugins/execlog.c
@@ -0,0 +1,153 @@
+/*
+ * Copyright (C) 2021, Alexandre Iooss <erdnaxe@crans.org>
+ *
+ * Log instruction execution with memory access.
+ *
+ * License: GNU GPL, version 2 or later.
+ *   See the COPYING file in the top-level directory.
+ */
+#include <glib.h>
+#include <inttypes.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include <qemu-plugin.h>
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+
+/* Store last executed instruction on each vCPU as a GString */
+GArray *last_exec;
+
+/**
+ * Add memory read or write information to current instruction log
+ */
+static void vcpu_mem(unsigned int cpu_index, qemu_plugin_meminfo_t info,
+                     uint64_t vaddr, void *udata)
+{
+    GString *s;
+
+    /* Find vCPU in array */
+    g_assert(cpu_index < last_exec->len);
+    s = g_array_index(last_exec, GString *, cpu_index);
+
+    /* Indicate type of memory access */
+    if (qemu_plugin_mem_is_store(info)) {
+        g_string_append(s, ", store");
+    } else {
+        g_string_append(s, ", load");
+    }
+
+    /* If full system emulation log physical address and device name */
+    struct qemu_plugin_hwaddr *hwaddr = qemu_plugin_get_hwaddr(info, vaddr);
+    if (hwaddr) {
+        uint64_t addr = qemu_plugin_hwaddr_phys_addr(hwaddr);
+        const char *name = qemu_plugin_hwaddr_device_name(hwaddr);
+        g_string_append_printf(s, ", 0x%08"PRIx64", %s", addr, name);
+    } else {
+        g_string_append_printf(s, ", 0x%08"PRIx64, vaddr);
+    }
+}
+
+/**
+ * Log instruction execution
+ */
+static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
+{
+    GString *s;
+
+    /* Find or create vCPU in array */
+    while (cpu_index >= last_exec->len) {
+        s = g_string_new(NULL);
+        g_array_append_val(last_exec, s);
+    }
+    s = g_array_index(last_exec, GString *, cpu_index);
+
+    /* Print previous instruction in cache */
+    if (s->len) {
+        qemu_plugin_outs(s->str);
+        qemu_plugin_outs("s\n");
+    }
+
+    /* Store new instruction in cache */
+    /* vcpu_mem will add memory access information to last_exec */
+    g_string_printf(s, "%u, ", cpu_index);
+    g_string_append(s, (char *)udata);
+}
+
+/**
+ * On translation block new translation
+ *
+ * QEMU convert code by translation block (TB). By hooking here we can then hook
+ * a callback on each instruction and memory access.
+ */
+static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
+{
+    struct qemu_plugin_insn *insn;
+    uint64_t insn_vaddr;
+    uint32_t insn_opcode;
+    char *insn_disas;
+
+    size_t n = qemu_plugin_tb_n_insns(tb);
+    for (size_t i = 0; i < n; i++) {
+        /*
+         * `insn` is shared between translations in QEMU, copy needed data here.
+         * `output` is never freed as it might be used multiple times during
+         * the emulation lifetime.
+         * We only consider the first 32 bits of the instruction, this may be
+         * a limitation for CISC architectures.
+         */
+        insn = qemu_plugin_tb_get_insn(tb, i);
+        insn_vaddr = qemu_plugin_insn_vaddr(insn);
+        insn_opcode = *((uint32_t *)qemu_plugin_insn_data(insn));
+        insn_disas = qemu_plugin_insn_disas(insn);
+        char *output = g_strdup_printf("0x%"PRIx64", 0x%"PRIx32", \"%s\"",
+                                       insn_vaddr, insn_opcode, insn_disas);
+
+        /* Register callback on memory read or write */
+        qemu_plugin_register_vcpu_mem_cb(insn, vcpu_mem,
+                                         QEMU_PLUGIN_CB_NO_REGS,
+                                         QEMU_PLUGIN_MEM_RW, NULL);
+
+        /* Register callback on instruction */
+        qemu_plugin_register_vcpu_insn_exec_cb(insn, vcpu_insn_exec,
+                                               QEMU_PLUGIN_CB_NO_REGS, output);
+    }
+}
+
+/**
+ * On plugin exit, print last instruction in cache
+ */
+static void plugin_exit(qemu_plugin_id_t id, void *p)
+{
+    guint i;
+    GString *s;
+    for (i = 0; i < last_exec->len; i++) {
+        s = g_array_index(last_exec, GString *, i);
+        if (s->str) {
+            qemu_plugin_outs(s->str);
+            qemu_plugin_outs("\n");
+        }
+    }
+}
+
+/**
+ * Install the plugin
+ */
+QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
+                                           const qemu_info_t *info, int argc,
+                                           char **argv)
+{
+    /*
+     * Initialize dynamic array to cache vCPU instruction. In user mode
+     * we don't know the size before emulation.
+     */
+    last_exec = g_array_new(FALSE, FALSE, sizeof(GString *));
+
+    /* Register translation block and exit callbacks */
+    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
+    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
+
+    return 0;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 684142e12e..ee456e5fb4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2981,6 +2981,7 @@ F: include/tcg/
 
 TCG Plugins
 M: Alex Bennée <alex.bennee@linaro.org>
+R: Alexandre Iooss <erdnaxe@crans.org>
 S: Maintained
 F: docs/devel/tcg-plugins.rst
 F: plugins/
diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index 17e6e2ec4f..6ac67aacaf 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -13,6 +13,7 @@ include $(BUILD_DIR)/config-host.mak
 VPATH += $(SRC_PATH)/contrib/plugins
 
 NAMES :=
+NAMES += execlog
 NAMES += hotblocks
 NAMES += hotpages
 NAMES += howvec
-- 
2.20.1


