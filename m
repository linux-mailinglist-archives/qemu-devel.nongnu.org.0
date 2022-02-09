Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDDD4AF476
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 15:54:10 +0100 (CET)
Received: from localhost ([::1]:39958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHoMC-0002BJ-V3
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 09:54:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHntx-0000JR-Hw
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:24:57 -0500
Received: from [2a00:1450:4864:20::42a] (port=33779
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHntv-0001L2-DX
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:24:57 -0500
Received: by mail-wr1-x42a.google.com with SMTP id e3so4449517wra.0
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dgCjpzddyLR13n942aoYs6/a68SmDhnOYnBtsv8AWc0=;
 b=U7ghHn32q8rEvlrCl0VOpBBboOaj+q2Qc0y3O3ws63NZ9/B8Ri/+V2F6IDsEhTCEyL
 7wboFaZDV6Fv8YXnhWp5JLV89P8tM/UJgsnACFjMMozQ/eyVMSVVv4sL7mkULOVwEXtG
 rS6uo0Vf6Tx6B1EouKpSG5o/U8k48I81f1SoIvQjflRsM+xGB5tQ6yoKbN2LM6havtEn
 koJK2CqHJ3BN2mlCX9mUOC2IE7m9ZBxxCqCmZIQbJ1Z4Gw5X9ixIaqgJqa6PGm12p8gz
 1YPoWqKVgMXQIhZXuxQjx0MgTWzpJ++AXWG45N95MfdMzqBpNfaFxrsrILSZgE89ercC
 PgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dgCjpzddyLR13n942aoYs6/a68SmDhnOYnBtsv8AWc0=;
 b=ZmaFUIlSTiYOHbHjYnBjdzjAoSb+YyXm/L70eQRU7/hm2DYZVojb6h68tD/pYXJ20E
 Q5kuKnGbCkywGqwZZ0krR4lRsBXE/mgPHYJLUuotGKCURjjZBBUOlHbQ1rFRXMwBy3m9
 /qLNM5n5T009/2luo3WfLypKx0GckrXWCoGyTRXvd3WcTR4OtFjujwruwNf4MbbCxSsC
 gG4N2Zxif+x0FCFvalulyOa5OPl/XZGtXTMsnQ4Oyc9W1K2S59fZctjTEb/uJPuQlugr
 MR7UAuZ+nhbkQDn8QjsQfloItDhhbltV95N9NvumodtXDiYy7E3pnf2dTij4df7Q1szp
 30PA==
X-Gm-Message-State: AOAM532uZJvE1JVGsVI8u1goCStGC1WOpGkru1MRQRwCtI+vVSveXVTo
 +hfsBROPQECDXYphiMk2Yws4mQ==
X-Google-Smtp-Source: ABdhPJwa3OVzZQ77VCA0haeImWvSA9flGJ0SLgq4HZVJc5IVfRq8G6ToCa5kywskCuJwTz+3u/G1Cw==
X-Received: by 2002:a05:6000:1548:: with SMTP id
 8mr2270818wry.242.1644416694032; 
 Wed, 09 Feb 2022 06:24:54 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t11sm1788178wrm.46.2022.02.09.06.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:24:49 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 39ACA1FFB8;
 Wed,  9 Feb 2022 14:15:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 21/28] plugins: add helper functions for coverage plugins
Date: Wed,  9 Feb 2022 14:15:22 +0000
Message-Id: <20220209141529.3418384-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209141529.3418384-1-alex.bennee@linaro.org>
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Ivanov Arkady <arkadiy.ivanov@ispras.ru>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Alexandre Iooss <erdnaxe@crans.org>
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
Message-Id: <20220204204335.1689602-22-alex.bennee@linaro.org>

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
index b143b09ce9..91e0c7074c 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -44,6 +44,11 @@
 #ifndef CONFIG_USER_ONLY
 #include "qemu/plugin-memory.h"
 #include "hw/boards.h"
+#else
+#include "qemu.h"
+#ifdef CONFIG_LINUX
+#include "loader.h"
+#endif
 #endif
 
 /* Uninstall and Reset handlers */
@@ -391,3 +396,46 @@ bool qemu_plugin_bool_parse(const char *name, const char *value, bool *ret)
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


