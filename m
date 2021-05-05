Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ADE373797
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:32:39 +0200 (CEST)
Received: from localhost ([::1]:51238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDtW-0000d8-8u
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leDkX-0000v3-3R
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:23:22 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leDkJ-00056x-NZ
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:23:19 -0400
Received: by mail-wr1-x433.google.com with SMTP id d4so1018950wru.7
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 02:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LZutPtgpTaHldKZk578MIAzGwCkCBrqhiKcMaWSBcng=;
 b=TiFI+UyGZ7w1cyvlAinQVZaEUeY9HCRwQaJXkTgqrMH+3X6hASYTeXshyLEmC0ivr0
 GdaRL5SW6M3hIGQj7W6aHu2IDD/a7rGjkQgcOw0Sk4Uo85SREAFWZ27fQ8HNsHJcKXIc
 weyj1A8oDlpFI2mUUkKeVcyp8S1G3NCH+v4yGFg8KC/bunPf/FCAE6Xrb2ar3lkmvPp6
 KigP3FClwL/vDIAP9qbd/9FRAnN135odlZnkr54wf4gcpYjrDgSp4Uv+CX+PIa2SKCqA
 X/O3Mdg2g7zzyaWnaTIDDNSMHX7YlLwDMz3H8r2+GZYAHEV7h83qREmu4p+gdtMg8ufL
 rPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LZutPtgpTaHldKZk578MIAzGwCkCBrqhiKcMaWSBcng=;
 b=GQM+JAm/D4AqjYzl6Zxma/7nZBFpi6rihlJMGQUQvEMZRnOhjn+1ri+3OHcZ59iVCp
 aUQbEq2lP/Np3QTIBx601j6Gl2gXtABfjOjlbHgRDvwf5LHRQEdMxQZ9goX6HgwUTuNn
 /jjfXX6UqYCgxoZZ7O5t3g7xVPeAu4qjxD+1zd6zxtOtqqWNlMtSZ9GDHlyS+4VZmy2s
 0GPaDWMzomd/QhZpGVgW0GwnWhkXiFziDB5P9+/t/fZHDK6BEjJ3vGn8OcISs+M8VhFj
 vKHNcd6ljiyzd1rWYT/txsOzJ1ojLxDPKcs8znJuq+xvY1DdP0SGXXrD91Mzklx3dDcA
 yxKA==
X-Gm-Message-State: AOAM533fhuT8jGa+dDWs6AbF8bZunOZlzNodtjJK9+s0D3qRhk/fry7H
 5sKrrdvPOAG/2Aw/8wnlOZ8AbQ==
X-Google-Smtp-Source: ABdhPJzXwfqJ+SGVkmBcw05TcjXmB0udbrBA5oECDFen+o6ShPGVfrwjJ1wJg1Yw2oQw7h4WO9p31A==
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr36770964wrj.328.1620206582722; 
 Wed, 05 May 2021 02:23:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b8sm19307077wrx.15.2021.05.05.02.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 02:23:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F24E81FF8C;
 Wed,  5 May 2021 10:22:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/7] plugins: Move all typedef and type declaration to the
 front of the qemu-plugin.h
Date: Wed,  5 May 2021 10:22:54 +0100
Message-Id: <20210505092259.8202-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210505092259.8202-1-alex.bennee@linaro.org>
References: <20210505092259.8202-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, minyihh@uci.edu,
 robhenry@microsoft.com, vilanova@imperial.ac.uk, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 mohamad.gebai@gmail.com, kuhn.chenqun@huawei.com,
 matheus.ferst@eldorado.org.br, Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210318185555.434-3-luoyonggang@gmail.com>
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
2.20.1


