Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AEB7C85F
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 18:17:32 +0200 (CEST)
Received: from localhost ([::1]:42452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsrIB-000161-70
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 12:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40380)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hsr8h-000285-I7
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:07:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hsr8f-0000l9-58
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:07:43 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:53438)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hsr8e-0000hJ-BR
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:07:40 -0400
Received: by mail-wm1-x341.google.com with SMTP id x15so61446591wmj.3
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 09:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pb+n1pLkj8AhZKqjkxNnDL9/hWK9uOwVyl2qXfcl7wU=;
 b=XIztQcaB6e4IgC5zUg34kZo9QxfoRF1b9u4s7XH2WcPrWds2uZPwB1mH2wnvGCUrpG
 j3aI+5xraMnBz5zsYggK9XFel73hUEzjd0YllxUknijjDuxvGAxKZhIz2Y5dhfxbRU3u
 HzaKlp8rBWG1D7O/n7tMdvHF/ofBSde3ZzRV8Z6vmJeEPRosimrHp1zBsz518I6HwvQo
 tgRywy4QHhDGppLvjpkn1t1EQ2J7vrAuporeyD6d+VHWU17L/YBvPWebv8O4TG5ghiAC
 J6e4z3WcKs69QzaXdibzOO+Aen0nK8ogLOPwyKd4+Uf3qXJYnlz2i3y/Niuqw+dIScEt
 jskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pb+n1pLkj8AhZKqjkxNnDL9/hWK9uOwVyl2qXfcl7wU=;
 b=eka02mJrQFLQ1YpbpyGDMnBn3PX/l5qO8WaY0n5L0oteNIbawlD1yWJV8F4s1a0fhX
 cJ9vrG6HxT/BfYvHsQmqXi7ImQuBymmhKKl7EKztwFssM9xrEyGrLzzMJqgcFluGmYKQ
 QWBOsZu/n0x+a6tTIJMviNma8+2mEMrYj6yjc17LP9QLZgkdbYjPNVXQImSmFOaCd6ur
 db0K3dj/4W/iEby7iwgFMHXdymZDmDpsvjwJow7AEi35OSnEckPpN/HJJbyEH74MtZo1
 0/UUX8nwfIiJT+bauLnW5xK89LlvHXZpOu8VOu6e2y0Wq9kkwBOihuAdaErmbEWCeWyX
 Q93A==
X-Gm-Message-State: APjAAAVgHRcDpFLWwLm2fAEfF1jrCMDJsZeV3EDMucBCx2OmuRUzZ+Tq
 jMfn1MIrvenONo4yg/yJr+n5XQ==
X-Google-Smtp-Source: APXvYqxI+X30qJ1Xu7RiZ6SBrqxBl1Be3WeRHwQZ3hcPAc8eYZmbcxTWAu4XaQw6cXKv0GnQcBo93A==
X-Received: by 2002:a1c:e90d:: with SMTP id q13mr111014849wmc.89.1564589251509; 
 Wed, 31 Jul 2019 09:07:31 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id p10sm2143420wmk.2.2019.07.31.09.07.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 09:07:28 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D0ABE1FF9E;
 Wed, 31 Jul 2019 17:07:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 17:06:40 +0100
Message-Id: <20190731160719.11396-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731160719.11396-1-alex.bennee@linaro.org>
References: <20190731160719.11396-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH v4 15/54] plugin: add implementation of the api
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
Cc: bobby.prani@gmail.com, cota@braap.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aaron@os.amperecomputing.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[AJB: split from the core code commit]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v4
   - add qemu_plugin_ram_addr_from_host
   - remove _haddr api calls
---
 plugins/Makefile.objs |   1 +
 plugins/api.c         | 299 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 300 insertions(+)
 create mode 100644 plugins/api.c

diff --git a/plugins/Makefile.objs b/plugins/Makefile.objs
index 58940335bca..95baabf3d2f 100644
--- a/plugins/Makefile.objs
+++ b/plugins/Makefile.objs
@@ -4,3 +4,4 @@
 
 obj-y += loader.o
 obj-y += core.o
+obj-y += api.o
diff --git a/plugins/api.c b/plugins/api.c
new file mode 100644
index 00000000000..586bb8789f1
--- /dev/null
+++ b/plugins/api.c
@@ -0,0 +1,299 @@
+/*
+ * QEMU Plugin API
+ *
+ * This provides the API that is available to the plugins to interact
+ * with QEMU. We have to be careful not to expose internal details of
+ * how QEMU works so we abstract out things like translation and
+ * instructions to anonymous data types:
+ *
+ *  qemu_plugin_tb
+ *  qemu_plugin_insn
+ *
+ * Which can then be passed back into the API to do additional things.
+ * As such all the public functions in here are exported in
+ * qemu-plugin.h.
+ *
+ * The general life-cycle of a plugin is:
+ *
+ *  - plugin is loaded, public qemu_plugin_install called
+ *    - the install func registers callbacks for events
+ *    - usually an atexit_cb is registered to dump info at the end
+ *  - when a registered event occurs the plugin is called
+ *     - some events pass additional info
+ *     - during translation the plugin can decide to instrument any
+ *       instruction
+ *  - when QEMU exits all the registered atexit callbacks are called
+ *
+ * Copyright (C) 2017, Emilio G. Cota <cota@braap.org>
+ * Copyright (C) 2019, Linaro
+ *
+ * License: GNU GPL, version 2 or later.
+ *   See the COPYING file in the top-level directory.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/plugin.h"
+#include "cpu.h"
+#include "sysemu/sysemu.h"
+#include "tcg/tcg.h"
+#include "trace/mem-internal.h" /* mem_info macros */
+#include "plugin.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/boards.h"
+#endif
+
+/* Uninstall and Reset handlers */
+
+void qemu_plugin_uninstall(qemu_plugin_id_t id, qemu_plugin_simple_cb_t cb)
+{
+    plugin_reset_uninstall(id, cb, false);
+}
+
+void qemu_plugin_reset(qemu_plugin_id_t id, qemu_plugin_simple_cb_t cb)
+{
+    plugin_reset_uninstall(id, cb, true);
+}
+
+/*
+ * Plugin Register Functions
+ *
+ * This allows the plugin to register callbacks for various events
+ * during the translation.
+ */
+
+void qemu_plugin_register_vcpu_init_cb(qemu_plugin_id_t id,
+                                       qemu_plugin_vcpu_simple_cb_t cb)
+{
+    plugin_register_cb(id, QEMU_PLUGIN_EV_VCPU_INIT, cb);
+}
+
+void qemu_plugin_register_vcpu_exit_cb(qemu_plugin_id_t id,
+                                       qemu_plugin_vcpu_simple_cb_t cb)
+{
+    plugin_register_cb(id, QEMU_PLUGIN_EV_VCPU_EXIT, cb);
+}
+
+void qemu_plugin_register_vcpu_tb_exec_cb(struct qemu_plugin_tb *tb,
+                                          qemu_plugin_vcpu_udata_cb_t cb,
+                                          enum qemu_plugin_cb_flags flags,
+                                          void *udata)
+{
+    plugin_register_dyn_cb__udata(&tb->cbs[PLUGIN_CB_REGULAR],
+                                  cb, flags, udata);
+}
+
+void qemu_plugin_register_vcpu_tb_exec_inline(struct qemu_plugin_tb *tb,
+                                              enum qemu_plugin_op op,
+                                              void *ptr, uint64_t imm)
+{
+    plugin_register_inline_op(&tb->cbs[PLUGIN_CB_INLINE], 0, op, ptr, imm);
+}
+
+void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *insn,
+                                            qemu_plugin_vcpu_udata_cb_t cb,
+                                            enum qemu_plugin_cb_flags flags,
+                                            void *udata)
+{
+    plugin_register_dyn_cb__udata(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_REGULAR],
+        cb, flags, udata);
+}
+
+void qemu_plugin_register_vcpu_insn_exec_inline(struct qemu_plugin_insn *insn,
+                                                enum qemu_plugin_op op,
+                                                void *ptr, uint64_t imm)
+{
+    plugin_register_inline_op(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_INLINE],
+                              0, op, ptr, imm);
+}
+
+
+
+void qemu_plugin_register_vcpu_mem_cb(struct qemu_plugin_insn *insn,
+                                      qemu_plugin_vcpu_mem_cb_t cb,
+                                      enum qemu_plugin_cb_flags flags,
+                                      enum qemu_plugin_mem_rw rw,
+                                      void *udata)
+{
+    plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_REGULAR],
+                                cb, flags, rw, udata);
+}
+
+void qemu_plugin_register_vcpu_mem_inline(struct qemu_plugin_insn *insn,
+                                          enum qemu_plugin_mem_rw rw,
+                                          enum qemu_plugin_op op, void *ptr,
+                                          uint64_t imm)
+{
+    plugin_register_inline_op(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_INLINE],
+        rw, op, ptr, imm);
+}
+
+void qemu_plugin_register_vcpu_tb_trans_cb(qemu_plugin_id_t id,
+                                           qemu_plugin_vcpu_tb_trans_cb_t cb)
+{
+    plugin_register_cb(id, QEMU_PLUGIN_EV_VCPU_TB_TRANS, cb);
+}
+
+void qemu_plugin_register_vcpu_syscall_cb(qemu_plugin_id_t id,
+                                          qemu_plugin_vcpu_syscall_cb_t cb)
+{
+    plugin_register_cb(id, QEMU_PLUGIN_EV_VCPU_SYSCALL, cb);
+}
+
+void
+qemu_plugin_register_vcpu_syscall_ret_cb(qemu_plugin_id_t id,
+                                         qemu_plugin_vcpu_syscall_ret_cb_t cb)
+{
+    plugin_register_cb(id, QEMU_PLUGIN_EV_VCPU_SYSCALL_RET, cb);
+}
+
+/*
+ * Plugin Queries
+ *
+ * These are queries that the plugin can make to gauge information
+ * from our opaque data types. We do not want to leak internal details
+ * here just information useful to the plugin.
+ */
+
+/*
+ * Translation block information:
+ *
+ * A plugin can query the virtual address of the start of the block
+ * and the number of instructions in it. It can also get access to
+ * each translated instruction.
+ */
+
+size_t qemu_plugin_tb_n_insns(const struct qemu_plugin_tb *tb)
+{
+    return tb->n;
+}
+
+uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb)
+{
+    return tb->vaddr;
+}
+
+struct qemu_plugin_insn *
+qemu_plugin_tb_get_insn(const struct qemu_plugin_tb *tb, size_t idx)
+{
+    if (unlikely(idx >= tb->n)) {
+        return NULL;
+    }
+    return g_ptr_array_index(tb->insns, idx);
+}
+
+/*
+ * Instruction information
+ *
+ * These queries allow the plugin to retrieve information about each
+ * instruction being translated.
+ */
+
+const void *qemu_plugin_insn_data(const struct qemu_plugin_insn *insn)
+{
+    return insn->data->data;
+}
+
+size_t qemu_plugin_insn_size(const struct qemu_plugin_insn *insn)
+{
+    return insn->data->len;
+}
+
+uint64_t qemu_plugin_insn_vaddr(const struct qemu_plugin_insn *insn)
+{
+    return insn->vaddr;
+}
+
+void *qemu_plugin_insn_haddr(const struct qemu_plugin_insn *insn)
+{
+    return insn->haddr;
+}
+
+/*
+ * The memory queries allow the plugin to query information about a
+ * memory access.
+ */
+
+unsigned qemu_plugin_mem_size_shift(qemu_plugin_meminfo_t info)
+{
+    return info & TRACE_MEM_SZ_SHIFT_MASK;
+}
+
+bool qemu_plugin_mem_is_sign_extended(qemu_plugin_meminfo_t info)
+{
+    return !!(info & TRACE_MEM_SE);
+}
+
+bool qemu_plugin_mem_is_big_endian(qemu_plugin_meminfo_t info)
+{
+    return !!(info & TRACE_MEM_BE);
+}
+
+bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info)
+{
+    return !!(info & TRACE_MEM_ST);
+}
+
+/*
+ * Virtual Memory queries
+ */
+
+struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
+                                                  uint64_t vaddr)
+{
+    return NULL;
+}
+
+bool qemu_plugin_hwaddr_is_io(struct qemu_plugin_hwaddr *hwaddr)
+{
+    return false;
+}
+
+uint64_t qemu_plugin_hwaddr_to_raddr(const struct qemu_plugin_hwaddr *haddr)
+{
+#if 0 /* XXX FIXME should be SOFTMMU */
+    ram_addr_t ram_addr;
+
+    g_assert(haddr);
+    ram_addr = qemu_ram_addr_from_host(haddr);
+    if (ram_addr == RAM_ADDR_INVALID) {
+        error_report("Bad ram pointer %p", haddr);
+        abort();
+    }
+    return ram_addr;
+#else
+    return 0;
+#endif
+}
+
+/*
+ * Queries to the number and potential maximum number of vCPUs there
+ * will be. This helps the plugin dimension per-vcpu arrays.
+ */
+
+#ifndef CONFIG_USER_ONLY
+static MachineState * get_ms(void)
+{
+    return MACHINE(qdev_get_machine());
+}
+#endif
+
+int qemu_plugin_n_vcpus(void)
+{
+#ifdef CONFIG_USER_ONLY
+    return -1;
+#else
+    return get_ms()->smp.cpus;
+#endif
+}
+
+int qemu_plugin_n_max_vcpus(void)
+{
+#ifdef CONFIG_USER_ONLY
+    return -1;
+#else
+    return get_ms()->smp.max_cpus;
+#endif
+}
-- 
2.20.1


