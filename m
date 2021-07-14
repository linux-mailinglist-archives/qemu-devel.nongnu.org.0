Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F1F3C87D5
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:37:58 +0200 (CEST)
Received: from localhost ([::1]:54246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gxS-0005Lr-0q
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3geY-00058a-OE
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:18:26 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:44921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3geR-0002ME-64
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:18:26 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l8-20020a05600c1d08b02902333d79327aso1058136wms.3
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FhX5dKUeoAw4Avo4Bx+F54Vk4MazsUl3jFdSxJfzYgY=;
 b=fNA6w6XezS7hV16sLARY7m6EXEDo46AAujls5eE1sKfTI2eXfJKvq25yq5aC9CRIjE
 IKJ1zZZO9TwoCK8pzmI2i+S3WdiYMjPMTplbos/ewEp9vj1IF4C3drxDILqDtzR1AR5d
 vE6OUafbmenrkANAjP5okNJFh+1tnEhizy3jfzIHzDPAalV/L/ovQTIq77uuRwEZZixD
 quf1RhlI2je+e/ya8rcd6EYAxO9mcUv0c6DurR9BjddSWwAW/fuLNmWAv8B+9/BxW7pj
 Ojnf5a1A+eodkpVNtFbVmKuklmxWNKn7kZ60gf1H4x4qD2eHTFfjeZ7fq5adQMXHNVL2
 Hi1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FhX5dKUeoAw4Avo4Bx+F54Vk4MazsUl3jFdSxJfzYgY=;
 b=rJ5qg+1+BLT01D9gwyEv/kQQRp5BuT6K7L75AoFj1x2oNxViat9K7JMmUl5JGuvJ26
 w1k+OBKjEibFUwt9WXNI/qF4J1x2nJSU7HzW1A3auT9CdVWFQAYRBHmKQV/QXs3FilBF
 WXdo9U6I6BEdKk7l3tlrzvFzwB9nMGcJlYf1++UrV1J/uimFt0Ovjr8oN7ntBGPWZ3U+
 AJtF10bC3Ak3StSPCR9ikxZNZpmCRzxTqlcFAG6GL/is1UxiN59N9Rdx+JBvl7lXTJW3
 Hr4UnIllGiheligEzEhwUAh3ozxC0pw4XtcxdEWTrHBfRQTrwEA5RUHHOFzREQv4RAcS
 F2Lw==
X-Gm-Message-State: AOAM532GjV+vmc849X79TBqqDi3ldU+Jtnq0FpV+gL8j3C4WaT+1e3Lg
 3UxDU7Q4kYbWfpJ3guCEeLuv7Q==
X-Google-Smtp-Source: ABdhPJyU3E3hBb7NVLxnREFqKuobWUHCwkMHapaFLCbyVaDkQL9DGkpTlzoJpuBhl41ZY7aHsrPs/A==
X-Received: by 2002:a05:600c:364c:: with SMTP id
 y12mr4669638wmq.78.1626275896951; 
 Wed, 14 Jul 2021 08:18:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x9sm3064016wrm.82.2021.07.14.08.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:18:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C52D41FF7E;
 Wed, 14 Jul 2021 16:00:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 38/44] contrib/plugins: add execlog to log instruction
 execution and memory access
Date: Wed, 14 Jul 2021 16:00:30 +0100
Message-Id: <20210714150036.21060-39-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexandre Iooss <erdnaxe@crans.org>

Log instruction execution and memory access to a file.
This plugin can be used for reverse engineering or for side-channel analysis
using QEMU.

Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210702081307.1653644-2-erdnaxe@crans.org>
Message-Id: <20210709143005.1554-35-alex.bennee@linaro.org>

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
index c340bb02b0..83b55030ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3017,6 +3017,7 @@ F: include/tcg/
 
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


