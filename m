Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBF5383A89
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:52:07 +0200 (CEST)
Received: from localhost ([::1]:47228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligTO-00023r-0B
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifyp-0001mJ-NK
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:32 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifyg-0002B6-JL
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:27 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x8so7035984wrq.9
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W7tjTvDwpWeS7WRwmPx5p6DYd0bz3KPUyEjh0yy6O08=;
 b=N7WKU6lvxE7z/9mK6cVnNVSyu81zH7h2ofEcLmiJkm+Cfd2vMLrdOWTzunkCkKHyfh
 sVVORNdrYREn7R2NOWVYy+KqleyogWs/E//7oiTLVWanOVOBoPUErETGum2NFJb9Rctw
 qtHMC/GY+fZLTYRaj+Ambj1SAXwS3MgCdFEeTXsxgB7BMg+y3mEfYAPROgnl/vcQd9tB
 EjtYhub4MfTtQ6XOtLnJiki2TLROl28qnV9OqLrxd9bsrqBZsm7oow/qUMSudn0N+Jpm
 QykHEpzkbr+Ls5D700yDA1oXrObMcoBI4ew3Rl2GLnMrPm7HVTe/Cu0+xasze3Xq7O8Z
 WpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W7tjTvDwpWeS7WRwmPx5p6DYd0bz3KPUyEjh0yy6O08=;
 b=lB3U6PhU2pr63XummyPBGrFcjpM/D9nbXPrnW2ZTng9fz5h93Kr6A2ohbCn5SnVSGD
 LjUYvGfM8fXK9nQE/HJRFJGPaMJSEVbKi6pev25VoBwp5WJ0VD/W9i5FejU+SDqbuoTW
 psMVMAdP9JQkz/pG+FY6zQVhH0IFzgsHl853GWBqBjUtIMSHoiubXRG3yUV83mf+pPzi
 jLC0dCLz2Jj1iVk9M3l+B5vPdLM0E0ZoleSrZL9UohrRDPgGhu7foQu4lWufa0XALjlx
 CoLuVhFcePHQDt87PTUGJdcX+vn8zcm+zPY0MN0IbIbFVWlERxd7QQDDMhSR0Lz1zqaJ
 cyyw==
X-Gm-Message-State: AOAM532ENdP/nSQcTryc8ihog8S+Wzm8jsCDUdu95REZab+WDA1dcMJU
 LgOBsO1HXDmCEM08obn5Odjvow==
X-Google-Smtp-Source: ABdhPJx/I+/T+Fz/szJK3mvYk3tJihY853S8L0X7gxfx4apbBrvVNrLvxKKfWYrZWqm5Ra/8adx2Fg==
X-Received: by 2002:adf:e38c:: with SMTP id e12mr580800wrm.128.1621268420071; 
 Mon, 17 May 2021 09:20:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f14sm5599450wry.40.2021.05.17.09.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:20:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BBFD81FFB1;
 Mon, 17 May 2021 17:10:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 27/29] plugins: Move all typedef and type declaration to the
 front of the qemu-plugin.h
Date: Mon, 17 May 2021 17:10:20 +0100
Message-Id: <20210517161022.13984-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210318185555.434-3-luoyonggang@gmail.com>
Message-Id: <20210505092259.8202-3-alex.bennee@linaro.org>

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
2.20.1


