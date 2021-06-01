Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2323975F3
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:00:08 +0200 (CEST)
Received: from localhost ([::1]:33690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo5sF-0008B8-G0
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:00:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lo5qn-0007Vn-5X
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:58:37 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:43760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lo5ql-0000ee-7d
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:58:36 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso1027743wmj.2
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 07:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0c7U9YSGHoDKB0a+mdBVqHKkv/WspMF3GKbrs2/yiWs=;
 b=mjfRk8FE985nf+zUr1tlNMdYQWLJ+ITj6eU6qFmNk13acGqpmMKmiaOhHGGIRoGcED
 OR6Ne/Bfd0fCHGiSNu4NLpSntaDwnvcRKh2v8ghUe9LyNDjaFB4BNtgPUCC1BnehOtMF
 wFUB+DNxotRcMtDpPKICES/iYkF+aBzDGFRHY/dqgfpTYIlU1VMQYzFXYufURk5aYeKN
 vRXvMYtn9TijRmgDfBNzRIpHPHY78GiwA9tJRH4LuYSyCP5ALhwxPdrfVMy8UWRhiGkN
 WeANu2f/7smWKqL0Kjol1dpuZF4UklS/2J4fechDQeRxhOPiAJCQfj4Toe37brNfCb+B
 ib9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0c7U9YSGHoDKB0a+mdBVqHKkv/WspMF3GKbrs2/yiWs=;
 b=jc8zqTclUDvR+YYF2LKWkOUN3NfJ/+HNCQjdpXiZYE7BkB9EPYQFsarYP/rHqmBnXt
 29D54R2PJ44DJeSWgEiDnJJSpldgPe2sMFICzdVKFabKL1afhhsgfK8tfm7AaGYNwkzc
 w3Z50ZD0/Sz8z/foxhgSY1elrpOeo3+3T4VD0zZr//DyvC0hikbxGrPZgOpBdwRhMOr9
 q2zGJSZB3Fxzh2gh7XlgS+81koIQyKU6zCFlZDjVU3WPlnhieD90EW1gAD0lvzfIfWec
 AJrBv/l+kc++3pcUZoDS0EmpxYFygVyPyS2IiosP3RljCU1P8z9YahUmNQUDt+Ytwfwd
 OZ5w==
X-Gm-Message-State: AOAM531+X+F7D6z8R353QyhsBTNpVSO9/mxlmdIRkTTn9HMvwfQ9AzwL
 fO0B9Z2totKI36fHnNUpAjde6A==
X-Google-Smtp-Source: ABdhPJxMCLg1JPbwNAskp3ghCH4Y5HUJLbrCg+4v7NgiI2Ky1Xk4XdE3Qq7WV8YiBAAwLw9uE3qvfQ==
X-Received: by 2002:a1c:1b93:: with SMTP id b141mr16036263wmb.8.1622559513192; 
 Tue, 01 Jun 2021 07:58:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 89sm4127457wrq.14.2021.06.01.07.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 07:58:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 757091FF7E;
 Tue,  1 Jun 2021 15:58:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] plugins/api: expose symbol lookup to plugins
Date: Tue,  1 Jun 2021 15:58:24 +0100
Message-Id: <20210601145824.3849-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
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
Cc: minyihh@uci.edu, robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a quality of life helper for plugins so they don't need to
re-implement symbol lookup when dumping an address. The strings are
constant so don't need to be duplicated. One minor tweak is to return
NULL instead of a zero length string to show lookup failed.

Based-on: 20210530063712.6832-4-ma.mandourr@gmail.com
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/qemu-plugin.h |  9 +++++++++
 contrib/plugins/cache.c    | 10 ++++++++--
 plugins/api.c              |  6 ++++++
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 97cdfd7761..dc3496f36c 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -525,6 +525,15 @@ qemu_plugin_register_vcpu_syscall_ret_cb(qemu_plugin_id_t id,
 
 char *qemu_plugin_insn_disas(const struct qemu_plugin_insn *insn);
 
+/**
+ * qemu_plugin_insn_symbol() - best effort symbol lookup
+ * @insn: instruction reference
+ *
+ * Return a static string referring to the symbol. This is dependent
+ * on the binary QEMU is running having provided a symbol table.
+ */
+const char *qemu_plugin_insn_symbol(const struct qemu_plugin_insn *insn);
+
 /**
  * qemu_plugin_vcpu_for_each() - iterate over the existing vCPU
  * @id: plugin ID
diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index 1e323494bf..afaa3d9db5 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -46,6 +46,7 @@ enum AccessResult {
 
 struct InsnData {
     char *disas_str;
+    const char *symbol;
     uint64_t addr;
     uint64_t misses;
 };
@@ -377,10 +378,12 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
         struct InsnData *idata = g_new(struct InsnData, 1);
 
         ddata->disas_str = qemu_plugin_insn_disas(insn);
+        ddata->symbol = qemu_plugin_insn_symbol(insn);
         ddata->misses = 0;
         ddata->addr = effective_addr;
 
         idata->disas_str = g_strdup(ddata->disas_str);
+        idata->symbol = qemu_plugin_insn_symbol(insn);
         idata->misses = 0;
         idata->addr = effective_addr;
 
@@ -397,8 +400,11 @@ static void print_entry(gpointer data)
 {
     struct InsnData *insn = (struct InsnData *) data;
     g_autoptr(GString) xx = g_string_new("");
-    g_string_append_printf(xx, "0x%" PRIx64 ": %s - misses: %lu\n",
-            insn->addr, insn->disas_str, insn->misses);
+    g_string_append_printf(xx, "0x%" PRIx64, insn->addr);
+    if (insn->symbol) {
+        g_string_append_printf(xx, " (%s)", insn->symbol);
+    }
+    g_string_append_printf(xx, ", %lu, %s\n", insn->misses, insn->disas_str);
     qemu_plugin_outs(xx->str);
 }
 
diff --git a/plugins/api.c b/plugins/api.c
index 817c9b6b69..332e2c60e2 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -233,6 +233,12 @@ char *qemu_plugin_insn_disas(const struct qemu_plugin_insn *insn)
     return plugin_disas(cpu, insn->vaddr, insn->data->len);
 }
 
+const char *qemu_plugin_insn_symbol(const struct qemu_plugin_insn *insn)
+{
+    const char *sym = lookup_symbol(insn->vaddr);
+    return sym[0] != 0 ? sym : NULL;
+}
+
 /*
  * The memory queries allow the plugin to query information about a
  * memory access.
-- 
2.20.1


