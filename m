Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766BA33F90A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 20:22:16 +0100 (CET)
Received: from localhost ([::1]:35666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMbkF-0005RG-GR
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 15:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1lMbZx-00066J-EJ
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 15:11:37 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:41712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1lMbZu-00084q-8X
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 15:11:37 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 nh23-20020a17090b3657b02900c0d5e235a8so1888097pjb.0
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 12:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3G9dJhhPVQ4RWufG4KKiXsuOdNnoDJci4dv2haWZIFM=;
 b=jYDJruSmI9FXZDZHgXKbmxOBCw5h+oeohU1b1cdc/gdedq/R7aHdOmM/HCUY5qpGk2
 kPL0MGix4EYsMBtD2O8WK/RjGfF7HIkmtJPYeyJCntP4XKmXhbdj8W2leteneG80RQGH
 ugTVq8z42ukaO+Z8EmISUc4fosohcVQLgSv+5X/V1vGP7RkeY9Dx9xtz7FsbNii48NtY
 ijNs4t2QekmjcIIwZAu9hdCuDEaUDvmQXiDYr37s86Herd+XR5UeS7lW22Rdqq88Bbwz
 bLMbHKULq4QaS2czttKjzTXwMysz+GgkFG3Hu1EX38m1I0UUngUwqj9UP5CT8PD4OEFs
 4H7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3G9dJhhPVQ4RWufG4KKiXsuOdNnoDJci4dv2haWZIFM=;
 b=l0XSKCY9sHQe7G/JdY4+S11V5ZuVE05MJVsWMbblHc765VPn7Kkvbyv6rp0YFmgFVU
 yHAJQVNoPWTycoCg/GVc2DpDgeuaBWJX7bOZaRI+N1EFvr97O1cSTk1DXOR5J0zl6REb
 rPa98CXjz/jNi5DJQ4CK5bILR3hbk+If5yl7LF9H6bhyCJEVzHCf4zrqlkKt8i6Yq26X
 0H8WtSSF9hAnlqEbho6ylgKnSCTYK3/Jg+sCv00I6YuuhooR3jslRY+1eIG+rF0I+7y5
 t6aodJXp/bT9RWupSNpefGwufWqZJO3aPOVEmA7PU6N0QYlYtI0diMUYSUzhtUZOU6QG
 CHyg==
X-Gm-Message-State: AOAM530wCbcd3bt1nqX4DJgLnW3XpTztgYRzk63UeAWUlRAEpjDwm1nR
 p0iztuYAQc/kN7F16napy7ufzUE0KrVB8A==
X-Google-Smtp-Source: ABdhPJzmynju2JifUloUQePErLUnB0u4mkYE960oPLIHcWYKMG0OoLmajsMfZDFiUcxoAMFE8XEL/A==
X-Received: by 2002:a17:902:8a97:b029:e6:aa6b:92f1 with SMTP id
 p23-20020a1709028a97b02900e6aa6b92f1mr6036059plo.64.1616008292343; 
 Wed, 17 Mar 2021 12:11:32 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id i20sm19077870pgg.65.2021.03.17.12.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 12:11:31 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] plugins: Move all typedef and type declaration to the
 front of the qemu-plugin.h
Date: Wed, 17 Mar 2021 19:11:15 +0000
Message-Id: <20210317191115.1445-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.29.2.windows.3
In-Reply-To: <20210317191115.1445-1-luoyonggang@gmail.com>
References: <20210317191115.1445-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x1029.google.com
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
Cc: Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/qemu-plugin.h | 187 ++++++++++++++++++-------------------
 1 file changed, 92 insertions(+), 95 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 97cdfd7761..2cb17f3051 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -81,27 +81,6 @@ typedef struct qemu_info_t {
     };
 } qemu_info_t;
 
-/**
- * qemu_plugin_install() - Install a plugin
- * @id: this plugin's opaque ID
- * @info: a block describing some details about the guest
- * @argc: number of arguments
- * @argv: array of arguments (@argc elements)
- *
- * All plugins must export this symbol which is called when the plugin
- * is first loaded. Calling qemu_plugin_uninstall() from this function
- * is a bug.
- *
- * Note: @info is only live during the call. Copy any information we
- * want to keep. @argv remains valid throughout the lifetime of the
- * loaded plugin.
- *
- * Return: 0 on successful loading, !0 for an error.
- */
-QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
-                                           const qemu_info_t *info,
-                                           int argc, char **argv);
-
 /**
  * typedef qemu_plugin_simple_cb_t - simple callback
  * @id: the unique qemu_plugin_id_t
@@ -135,6 +114,98 @@ typedef void (*qemu_plugin_vcpu_simple_cb_t)(qemu_plugin_id_t id,
 typedef void (*qemu_plugin_vcpu_udata_cb_t)(unsigned int vcpu_index,
                                             void *userdata);
 
+/** struct qemu_plugin_tb - Opaque handle for a translation block */
+struct qemu_plugin_tb;
+/** struct qemu_plugin_insn - Opaque handle for a translated instruction */
+struct qemu_plugin_insn;
+
+/**
+ * enum qemu_plugin_cb_flags - type of callback
+ *
+ * @QEMU_PLUGIN_CB_NO_REGS: callback does not access the CPU's regs
+ * @QEMU_PLUGIN_CB_R_REGS: callback reads the CPU's regs
+ * @QEMU_PLUGIN_CB_RW_REGS: callback reads and writes the CPU's regs
+ *
+ * Note: currently unused, plugins cannot read or change system
+ * register state.
+ */
+enum qemu_plugin_cb_flags {
+    QEMU_PLUGIN_CB_NO_REGS,
+    QEMU_PLUGIN_CB_R_REGS,
+    QEMU_PLUGIN_CB_RW_REGS,
+};
+
+enum qemu_plugin_mem_rw {
+    QEMU_PLUGIN_MEM_R = 1,
+    QEMU_PLUGIN_MEM_W,
+    QEMU_PLUGIN_MEM_RW,
+};
+
+/**
+ * typedef qemu_plugin_vcpu_tb_trans_cb_t - translation callback
+ * @id: unique plugin id
+ * @tb: opaque handle used for querying and instrumenting a block.
+ */
+typedef void (*qemu_plugin_vcpu_tb_trans_cb_t)(qemu_plugin_id_t id,
+                                               struct qemu_plugin_tb *tb);
+
+/**
+ * enum qemu_plugin_op - describes an inline op
+ *
+ * @QEMU_PLUGIN_INLINE_ADD_U64: add an immediate value uint64_t
+ *
+ * Note: currently only a single inline op is supported.
+ */
+
+enum qemu_plugin_op {
+    QEMU_PLUGIN_INLINE_ADD_U64,
+};
+
+/**
+ * typedef qemu_plugin_meminfo_t - opaque memory transaction handle
+ *
+ * This can be further queried using the qemu_plugin_mem_* query
+ * functions.
+ */
+typedef uint32_t qemu_plugin_meminfo_t;
+/** struct qemu_plugin_hwaddr - opaque hw address handle */
+struct qemu_plugin_hwaddr;
+
+typedef void
+(*qemu_plugin_vcpu_mem_cb_t)(unsigned int vcpu_index,
+                             qemu_plugin_meminfo_t info, uint64_t vaddr,
+                             void *userdata);
+
+typedef void
+(*qemu_plugin_vcpu_syscall_cb_t)(qemu_plugin_id_t id, unsigned int vcpu_index,
+                                 int64_t num, uint64_t a1, uint64_t a2,
+                                 uint64_t a3, uint64_t a4, uint64_t a5,
+                                 uint64_t a6, uint64_t a7, uint64_t a8);
+typedef void
+(*qemu_plugin_vcpu_syscall_ret_cb_t)(qemu_plugin_id_t id, unsigned int vcpu_idx,
+                                     int64_t num, int64_t ret);
+
+/**
+ * qemu_plugin_install() - Install a plugin
+ * @id: this plugin's opaque ID
+ * @info: a block describing some details about the guest
+ * @argc: number of arguments
+ * @argv: array of arguments (@argc elements)
+ *
+ * All plugins must export this symbol which is called when the plugin
+ * is first loaded. Calling qemu_plugin_uninstall() from this function
+ * is a bug.
+ *
+ * Note: @info is only live during the call. Copy any information we
+ * want to keep. @argv remains valid throughout the lifetime of the
+ * loaded plugin.
+ *
+ * Return: 0 on successful loading, !0 for an error.
+ */
+QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
+                                           const qemu_info_t *info,
+                                           int argc, char **argv);
+
 /**
  * qemu_plugin_uninstall() - Uninstall a plugin
  * @id: this plugin's opaque ID
@@ -205,41 +276,6 @@ void qemu_plugin_register_vcpu_idle_cb(qemu_plugin_id_t id,
 void qemu_plugin_register_vcpu_resume_cb(qemu_plugin_id_t id,
                                          qemu_plugin_vcpu_simple_cb_t cb);
 
-/** struct qemu_plugin_tb - Opaque handle for a translation block */
-struct qemu_plugin_tb;
-/** struct qemu_plugin_insn - Opaque handle for a translated instruction */
-struct qemu_plugin_insn;
-
-/**
- * enum qemu_plugin_cb_flags - type of callback
- *
- * @QEMU_PLUGIN_CB_NO_REGS: callback does not access the CPU's regs
- * @QEMU_PLUGIN_CB_R_REGS: callback reads the CPU's regs
- * @QEMU_PLUGIN_CB_RW_REGS: callback reads and writes the CPU's regs
- *
- * Note: currently unused, plugins cannot read or change system
- * register state.
- */
-enum qemu_plugin_cb_flags {
-    QEMU_PLUGIN_CB_NO_REGS,
-    QEMU_PLUGIN_CB_R_REGS,
-    QEMU_PLUGIN_CB_RW_REGS,
-};
-
-enum qemu_plugin_mem_rw {
-    QEMU_PLUGIN_MEM_R = 1,
-    QEMU_PLUGIN_MEM_W,
-    QEMU_PLUGIN_MEM_RW,
-};
-
-/**
- * typedef qemu_plugin_vcpu_tb_trans_cb_t - translation callback
- * @id: unique plugin id
- * @tb: opaque handle used for querying and instrumenting a block.
- */
-typedef void (*qemu_plugin_vcpu_tb_trans_cb_t)(qemu_plugin_id_t id,
-                                               struct qemu_plugin_tb *tb);
-
 /**
  * qemu_plugin_register_vcpu_tb_trans_cb() - register a translate cb
  * @id: plugin ID
@@ -269,18 +305,6 @@ void qemu_plugin_register_vcpu_tb_exec_cb(struct qemu_plugin_tb *tb,
                                           enum qemu_plugin_cb_flags flags,
                                           void *userdata);
 
-/**
- * enum qemu_plugin_op - describes an inline op
- *
- * @QEMU_PLUGIN_INLINE_ADD_U64: add an immediate value uint64_t
- *
- * Note: currently only a single inline op is supported.
- */
-
-enum qemu_plugin_op {
-    QEMU_PLUGIN_INLINE_ADD_U64,
-};
-
 /**
  * qemu_plugin_register_vcpu_tb_exec_inline() - execution inline op
  * @tb: the opaque qemu_plugin_tb handle for the translation
@@ -393,16 +417,6 @@ uint64_t qemu_plugin_insn_vaddr(const struct qemu_plugin_insn *insn);
  */
 void *qemu_plugin_insn_haddr(const struct qemu_plugin_insn *insn);
 
-/**
- * typedef qemu_plugin_meminfo_t - opaque memory transaction handle
- *
- * This can be further queried using the qemu_plugin_mem_* query
- * functions.
- */
-typedef uint32_t qemu_plugin_meminfo_t;
-/** struct qemu_plugin_hwaddr - opaque hw address handle */
-struct qemu_plugin_hwaddr;
-
 /**
  * qemu_plugin_mem_size_shift() - get size of access
  * @info: opaque memory transaction handle
@@ -480,11 +494,6 @@ uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr);
  */
 const char *qemu_plugin_hwaddr_device_name(const struct qemu_plugin_hwaddr *h);
 
-typedef void
-(*qemu_plugin_vcpu_mem_cb_t)(unsigned int vcpu_index,
-                             qemu_plugin_meminfo_t info, uint64_t vaddr,
-                             void *userdata);
-
 void qemu_plugin_register_vcpu_mem_cb(struct qemu_plugin_insn *insn,
                                       qemu_plugin_vcpu_mem_cb_t cb,
                                       enum qemu_plugin_cb_flags flags,
@@ -496,21 +505,9 @@ void qemu_plugin_register_vcpu_mem_inline(struct qemu_plugin_insn *insn,
                                           enum qemu_plugin_op op, void *ptr,
                                           uint64_t imm);
 
-
-
-typedef void
-(*qemu_plugin_vcpu_syscall_cb_t)(qemu_plugin_id_t id, unsigned int vcpu_index,
-                                 int64_t num, uint64_t a1, uint64_t a2,
-                                 uint64_t a3, uint64_t a4, uint64_t a5,
-                                 uint64_t a6, uint64_t a7, uint64_t a8);
-
 void qemu_plugin_register_vcpu_syscall_cb(qemu_plugin_id_t id,
                                           qemu_plugin_vcpu_syscall_cb_t cb);
 
-typedef void
-(*qemu_plugin_vcpu_syscall_ret_cb_t)(qemu_plugin_id_t id, unsigned int vcpu_idx,
-                                     int64_t num, int64_t ret);
-
 void
 qemu_plugin_register_vcpu_syscall_ret_cb(qemu_plugin_id_t id,
                                          qemu_plugin_vcpu_syscall_ret_cb_t cb);
-- 
2.29.2.windows.3


