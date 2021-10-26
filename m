Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75B243B031
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:38:22 +0200 (CEST)
Received: from localhost ([::1]:39016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJqX-0000sX-O6
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbf-0001AF-14
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:59 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbd-0007So-8Z
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:58 -0400
Received: by mail-wr1-x42b.google.com with SMTP id i9so2433509wrc.3
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nAdmbpsGRI7IIKYGmTuV2CO734xKeZibs75jIXQLIvc=;
 b=uAisMZJQ2TAlgHbNEkmuPsJ3fcUv/gugiWHuZ8C6F0oRW+grAj6xNXLlzc3Rpwu6Dq
 klbgdrgkIRkKIAWI/obEZyN1+bSbSjgTqe1kxVRfsjhZOvj4v8MG9VGaO3nN2NSkmBLV
 HbHmviekIrK8hqZdSrZy6aq6axHfLjnuXfFsxp9F8pxBO7YExEYG6RyUReegBoUeEnx1
 jkSywOnZDlcdIwNjtm6rXmVzNlgZbcUQL8cett90cTawEUgR179NBOLcJwKKN4JFFwo8
 d0dMUevNW8Q1yZvfANN8GCahvlKDVfiVhfkpZiIl/EhQ7uNQ2Fg1+d9Tj9OsoKi+b1cA
 VjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nAdmbpsGRI7IIKYGmTuV2CO734xKeZibs75jIXQLIvc=;
 b=jQNLVfr4DaWMPIqMvVYIq6YXqecIpA6I35U+jHhvASiRVdCcT57gGneD3fep3PUEXJ
 zouP8E0Rs7KKUZPwB2YjSq0SLUQbUpqLJ/Czf1CUD5hN94zld1bYi8ar8gOfwyaiUeOS
 yWgFtg897LnNe67MhlGUdUzJUG/prZVLhkWlDPm55ESu7WUHNaugizAy+oXCs9CmehPF
 MQCrbFuLTIh1+6OEcsOY/wI1Mrs80GZjkI4LBJ+NAFAXJcXLyTcp1GSujCtAxkkGAblB
 sDzYmh8gy2fnkH1RgBde8uMt6lkAHflHs5JZTXinX9AIBukMZK+k6moS5o0ROvZ6wYWy
 mZpQ==
X-Gm-Message-State: AOAM533kK9qoc7UZNIJKl78ec3siwU+OEaOpAuq2gkSU8Cmc+oNGUbBD
 EI//QYe+XrdSEhFqA1N4TYDfhg==
X-Google-Smtp-Source: ABdhPJzJmEPUvKbMH7ueYeDwncu9SBtNpfaTwSkRQ6kLYO68UC4UMZ3RkyBE5ZbQ6xs7X6n0q7L7MQ==
X-Received: by 2002:adf:a413:: with SMTP id d19mr31502352wra.246.1635243775913; 
 Tue, 26 Oct 2021 03:22:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p21sm196958wmc.11.2021.10.26.03.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:22:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 21E8B1FFBB;
 Tue, 26 Oct 2021 11:22:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 25/28] plugins: add helper functions for coverage plugins
Date: Tue, 26 Oct 2021 11:22:31 +0100
Message-Id: <20211026102234.3961636-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
 Ivanov Arkady <arkadiy.ivanov@ispras.ru>, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
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


