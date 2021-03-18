Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02527340D9C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 19:58:14 +0100 (CET)
Received: from localhost ([::1]:59006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMxqX-0000dR-2G
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 14:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1lMxoe-0007wm-KW
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:56:16 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:41631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1lMxoc-0002LV-Eq
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:56:16 -0400
Received: by mail-pg1-x531.google.com with SMTP id m7so2045476pgj.8
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 11:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3G9dJhhPVQ4RWufG4KKiXsuOdNnoDJci4dv2haWZIFM=;
 b=j0IeJsD3/jYIHJI1+nTfnVAVuvDn28un9fzGUYgegJOnI94y4Ax+MZuzSA02O8EG77
 svCYfrByzYN9prCHCZZnSBmqjOkTKmD9ra+sfH8DIm2aFEwEWXqkUlZpDgqumy91wPyv
 +vQpt6+9k/l9bnySsFnpCC9T06mDw3NFP0uV2DkBjnSn3IJxjkXgwFua+W7vvzpAkjMC
 aLQzH4muf7q9QPfNrXh/YgDmBRSeWtw2MUD2albLe4HklqhDwWE79TENmmQAFFyo6Mgr
 QQOTvacQL9LH+aKfMphdtbMFRqcwqHw4CO/xfwuBgACBDid/2/dpup5P3vwpZ5uowvVV
 ESxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3G9dJhhPVQ4RWufG4KKiXsuOdNnoDJci4dv2haWZIFM=;
 b=acYynVtp51NOlkGpWplUdFfDfSz7RHMz8TAuX24RnJm+1N9AsL5iBwOaO1KXj1bzjv
 9/9dmTCFlYCHh7IwKwogsK/Nxs9oCzplFKoY4O/hd/yGTOFJ50IzvCKe7fO0W0WftJK7
 CDd9pqU0ejb+Va4UM0YPOW4m/Ti42vz9pdgsLt9kAPLOEol4ZG1NtC6BUovhmSeAr5GX
 xXIMfGK4tmQ15xkNtls+mYie7FwPRUY3c4/7AioCuiFwRJPT379q9aHNzsY3sl4noxIn
 JHTXzgDMC9vd56q9Fv2/7BfqcAkIEim0xl2rWEyjE9LQ+H+Ql26QyxiiDLoTYUOKxohf
 d+ew==
X-Gm-Message-State: AOAM530fdJpgzlxvdJR9MWs+4UiCsmxKhWsoBuLfVgupUiIV4aSV19wp
 zcK0wRDCgSonx/9x7NKDMDEacm2lwZY1Sg==
X-Google-Smtp-Source: ABdhPJxIqcOyj1TVfR4NgUm30FYGQCKLaYvnSENPZ7z1flXafNZYAi0u3AJAxNfqxWflc2S5O6w1WA==
X-Received: by 2002:a62:1e46:0:b029:1f3:ad4f:9c6b with SMTP id
 e67-20020a621e460000b02901f3ad4f9c6bmr5577742pfe.64.1616093772354; 
 Thu, 18 Mar 2021 11:56:12 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id q66sm3274784pja.27.2021.03.18.11.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 11:56:11 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] plugins: Move all typedef and type declaration to the
 front of the qemu-plugin.h
Date: Thu, 18 Mar 2021 18:55:55 +0000
Message-Id: <20210318185555.434-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.29.2.windows.3
In-Reply-To: <20210318185555.434-1-luoyonggang@gmail.com>
References: <20210318185555.434-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x531.google.com
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


