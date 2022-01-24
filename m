Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A544994A3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:46:26 +0100 (CET)
Received: from localhost ([::1]:49302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC6EL-0005T2-CF
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:46:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lZ-0006wq-Ia
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:41 -0500
Received: from [2a00:1450:4864:20::636] (port=34762
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lW-0003IE-Av
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:41 -0500
Received: by mail-ej1-x636.google.com with SMTP id h7so24656618ejf.1
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nAdmbpsGRI7IIKYGmTuV2CO734xKeZibs75jIXQLIvc=;
 b=FPBHcTlPEWAg1AU/XKC5CB/h5g7WHu53iNXIIHMDKBdVsX3gvcNiFqhsYCg8QnNsQm
 4biQ7o2l8up04+Ld+SoRaU2SwaKPZcwl5jlUvrombVhgsm86kCMqiiljHcJhzcA+uzB+
 mAX+4vYa25OBNnZ+igwKNFJ+LWwb8tWHnbVpujPy7prZBemyUMK5UoKrjALyupSxQ3mX
 alG1Up9552ETe/UnCryTnYeS904WkAzUQQN+Fl2xgEQpJaLvtG1vSHkuXZur6YLPL1pB
 iwed5CsuiqP/Q/0jk/ajiI65XcuUAvQWs+qoccyOmC5MTW4Yo7lh/8u+gWh4yYWhy4PG
 R9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nAdmbpsGRI7IIKYGmTuV2CO734xKeZibs75jIXQLIvc=;
 b=32McKIctaJy7X6RVgFbjzrSQLycbNZLdIQNxd3H1WP5fPqxBbWQsgiC9dWfkwO5KLQ
 imwSozDzT3cEjz7bF3lxVF8H5o3B2gdwMWPqUFfj1UYv3UPi1Wk3eFre2X7lIpLQqWHL
 fM5buUfUPP36wi68SUQljIi5CuCXzJLkitj5RxWyQlTNHdVDvmwOI+2GwrynCtm7jYih
 24TiaCeSLxhx7vC/Udtb/03dkk0+RYD4HQ5TiJKxtaJUOtoPlCUmrPT0SwboBsFPESk+
 GYSSWPnpsD+SSg3BnoLALPCfZqEM+cnFEL3EtOPV9x68c9fWpYavvJdq0EHhgGljuwlh
 dbRw==
X-Gm-Message-State: AOAM532whcXF9r5AtPZwtd3hYQvd/0v1BDBLiOxt6OB2DOOAgYYIV2tH
 iYWktm5L+fLTygebsbrb5pkjag==
X-Google-Smtp-Source: ABdhPJyBwvP/a7qyznqUnopqNGQgz3MVUw0uiB0VtRCoogFvJj3onTy2D8HyQ08ec+p57YajNJmUxQ==
X-Received: by 2002:a17:906:4785:: with SMTP id
 cw5mr8338734ejc.406.1643055394332; 
 Mon, 24 Jan 2022 12:16:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w8sm5283925ejq.220.2022.01.24.12.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 12:16:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 61B9B1FFB8;
 Mon, 24 Jan 2022 20:16:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 17/22] plugins: add helper functions for coverage plugins
Date: Mon, 24 Jan 2022 20:16:03 +0000
Message-Id: <20220124201608.604599-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124201608.604599-1-alex.bennee@linaro.org>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alexandre Iooss <erdnaxe@crans.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, Luke.Craig@ll.mit.edu,
 Ivanov Arkady <arkadiy.ivanov@ispras.ru>, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ivanov Arkady <arkadiy.ivanov@ispras.ru>

Which provide information about:
- start_code.
- end_code.
- entry.
- path to the executable binary.

Signed-off-by: Ivanov Arkady <arkadiy.ivanov@ispras.ru>
Message-Id: <163491883461.304355.8210754161847179432.stgit@pc-System-Product-Name>
[AJB: reword title, better descriptions, defaults, rm export, fix include]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/qemu-plugin.h   | 34 ++++++++++++++++++++++++++
 plugins/api.c                | 46 ++++++++++++++++++++++++++++++++++++
 plugins/qemu-plugins.symbols |  4 ++++
 3 files changed, 84 insertions(+)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 5f1017201f..535ddbf0ae 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -590,4 +590,38 @@ void qemu_plugin_outs(const char *string);
  */
 bool qemu_plugin_bool_parse(const char *name, const char *val, bool *ret);
 
+/**
+ * qemu_plugin_path_to_binary() - path to binary file being executed
+ *
+ * Return a string representing the path to the binary. For user-mode
+ * this is the main executable. For system emulation we currently
+ * return NULL. The user should g_free() the string once no longer
+ * needed.
+ */
+const char *qemu_plugin_path_to_binary(void);
+
+/**
+ * qemu_plugin_start_code() - returns start of text segment
+ *
+ * Returns the nominal start address of the main text segment in
+ * user-mode. Currently returns 0 for system emulation.
+ */
+uint64_t qemu_plugin_start_code(void);
+
+/**
+ * qemu_plugin_end_code() - returns end of text segment
+ *
+ * Returns the nominal end address of the main text segment in
+ * user-mode. Currently returns 0 for system emulation.
+ */
+uint64_t qemu_plugin_end_code(void);
+
+/**
+ * qemu_plugin_entry_code() - returns start address for module
+ *
+ * Returns the nominal entry address of the main text segment in
+ * user-mode. Currently returns 0 for system emulation.
+ */
+uint64_t qemu_plugin_entry_code(void);
+
 #endif /* QEMU_PLUGIN_API_H */
diff --git a/plugins/api.c b/plugins/api.c
index b143b09ce9..e6a2c9dde3 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -44,6 +44,9 @@
 #ifndef CONFIG_USER_ONLY
 #include "qemu/plugin-memory.h"
 #include "hw/boards.h"
+#else
+#include "qemu.h"
+#include "loader.h"
 #endif
 
 /* Uninstall and Reset handlers */
@@ -391,3 +394,46 @@ bool qemu_plugin_bool_parse(const char *name, const char *value, bool *ret)
 {
     return name && value && qapi_bool_parse(name, value, ret, NULL);
 }
+
+/*
+ * Binary path, start and end locations
+ */
+const char *qemu_plugin_path_to_binary(void)
+{
+    char *path = NULL;
+#ifdef CONFIG_USER_ONLY
+    TaskState *ts = (TaskState *) current_cpu->opaque;
+    path = g_strdup(ts->bprm->filename);
+#endif
+    return path;
+}
+
+uint64_t qemu_plugin_start_code(void)
+{
+    uint64_t start = 0;
+#ifdef CONFIG_USER_ONLY
+    TaskState *ts = (TaskState *) current_cpu->opaque;
+    start = ts->info->start_code;
+#endif
+    return start;
+}
+
+uint64_t qemu_plugin_end_code(void)
+{
+    uint64_t end = 0;
+#ifdef CONFIG_USER_ONLY
+    TaskState *ts = (TaskState *) current_cpu->opaque;
+    end = ts->info->end_code;
+#endif
+    return end;
+}
+
+uint64_t qemu_plugin_entry_code(void)
+{
+    uint64_t entry = 0;
+#ifdef CONFIG_USER_ONLY
+    TaskState *ts = (TaskState *) current_cpu->opaque;
+    entry = ts->info->entry;
+#endif
+    return entry;
+}
diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index 4834756ba3..71f6c90549 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -1,5 +1,7 @@
 {
   qemu_plugin_bool_parse;
+  qemu_plugin_end_code;
+  qemu_plugin_entry_code;
   qemu_plugin_get_hwaddr;
   qemu_plugin_hwaddr_device_name;
   qemu_plugin_hwaddr_is_io;
@@ -17,6 +19,7 @@
   qemu_plugin_n_max_vcpus;
   qemu_plugin_n_vcpus;
   qemu_plugin_outs;
+  qemu_plugin_path_to_binary;
   qemu_plugin_register_atexit_cb;
   qemu_plugin_register_flush_cb;
   qemu_plugin_register_vcpu_exit_cb;
@@ -33,6 +36,7 @@
   qemu_plugin_register_vcpu_tb_exec_inline;
   qemu_plugin_register_vcpu_tb_trans_cb;
   qemu_plugin_reset;
+  qemu_plugin_start_code;
   qemu_plugin_tb_get_insn;
   qemu_plugin_tb_n_insns;
   qemu_plugin_tb_vaddr;
-- 
2.30.2


