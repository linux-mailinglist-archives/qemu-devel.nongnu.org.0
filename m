Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0873C2660
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:55:46 +0200 (CEST)
Received: from localhost ([::1]:53220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rur-0002m6-AB
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rms-00037d-U4
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:47:32 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rmp-0004Kc-Qs
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:47:30 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 j16-20020a05600c1c10b0290204b096b0caso6458467wms.1
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4FTfkZOV5J8pPR8DrVAy9dNoascCzZiPQY9J5eWzkN0=;
 b=nU0ohKghbii0NLlOBK+WBV5VD6hSQtU5xy/qQ/be959uCotVO+4Wgk/v6+g8Ip7rG3
 kpKgmFZ/QRI/QpnIdHz5OPPwveEz6Xg5T8VeKhyPeQnXD/0IiZzDJutAmJ73q1g6vBiv
 QOjuuLw780lSW5OhQ7XyH5HBOprIxLKNK7mTtUENz7pEVwz8pZMciLH6j9EUTwh9gtN+
 w4312APv7i8wBFivT0cDq9sP1IOo6EcdV4X6hWEJ1dAD4852U4gr32aT/9KuadBwIIVR
 bx5CPkC9ndW333uPKmtoepbnMWOSRoszIMoEC8zj1FW1AhYEtkAZyPz/Wsrk5yARSFUR
 Vz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4FTfkZOV5J8pPR8DrVAy9dNoascCzZiPQY9J5eWzkN0=;
 b=dpM5EDVxRxIxpTWG/+NLD15IA1n0axNsSjOcs/SZqjj9Pqq5aKXHoc8QOC0pHwR9Td
 PJpcT7G2cLtjySJMo9tflur+9n6RjcUpF4/jNXBLIvwUMr2IlRzX4YkEIX4SK+1RuGDE
 kbrhdBb0vHTQBGROFkqx/Ia4ksTqIgST8tyEI+CWKaZCJUujJScvkjuhMrgVMcYha5Pe
 VcYnIzo+Pn8WjG9vomGDwrAG/Vg92BeA8JgCbsDYb1+QzL/SAHf90FHlzsljbEXFoXNU
 PQly3Yw+70xogVi5D4I5cYGnHGNXBsuCKpk0UV10/q3L34/5B1r9H1cNueR+iI7OlhuP
 Sujw==
X-Gm-Message-State: AOAM533A1SjOyWwIEuNk7rj0UhgnJkcyR4S7sAMTRGGlIIZUMHxmGe7S
 ltmosjolyXXngB7DvjtfIv4Jpg==
X-Google-Smtp-Source: ABdhPJyHcIhkgioDgg+bonko0sQ5+aBuy9Pdq0DM7HCLacLR6oWuCX6RuYNcAuKljQADxPcNGk4F7A==
X-Received: by 2002:a1c:f616:: with SMTP id w22mr39235462wmc.131.1625842046299; 
 Fri, 09 Jul 2021 07:47:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k5sm5407597wmk.11.2021.07.09.07.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:47:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B826F1FFB7;
 Fri,  9 Jul 2021 15:30:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 34/40] contrib/plugins: add execlog to log instruction
 execution and memory access
Date: Fri,  9 Jul 2021 15:29:59 +0100
Message-Id: <20210709143005.1554-35-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
index 3431bc1ce9..3c9209b6b0 100644
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


