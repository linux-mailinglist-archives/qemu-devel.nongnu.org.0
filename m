Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E9833EA71
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 08:23:45 +0100 (CET)
Received: from localhost ([::1]:57162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMQWu-0005Ah-9M
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 03:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVc-0003UA-US
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:24 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:41049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVa-0007rZ-Ve
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:24 -0400
Received: by mail-ej1-x633.google.com with SMTP id lr13so907173ejb.8
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 00:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/MsPYBm57DQLiBlktTb2qPsZxAfsZ5w/VN9k4u6Nxq8=;
 b=zEIvbP6YrSwaEwjLsS7E8X7QHFVknUKc9VNx8etRBrlVWTxLUYMXT1U3pfSz0S/vjV
 bEU/P7HuEp5nmab62SmcgsgSH7ql5SpF7Z4tF+OtMLhTZChgm/RLMs6zaz/oji96IdZY
 D9QwfwkueME2/TEWAJwsrqBFI6HPo+PAJF1v7Ck0APOtePrMmluyJR86VG8fSMtYAy1J
 m08hR/DxQyhD1fensEGhOb/qW3guEmJmPoLH4rCHL+q3LuDxEJj0qj7eUCZwlvlhcy4A
 4d9a1KDb5TB5pfjkEsnyL3DcMkcbctkFGBaCMhiuhpbQ6GeS6IiFDZQj5SJpB73D3mAD
 4yTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/MsPYBm57DQLiBlktTb2qPsZxAfsZ5w/VN9k4u6Nxq8=;
 b=OV2GjcNo8n+uBWe74el/ZzqTXvCZpF2jH9iC2ygKOukZIizHU4HfaCip6+Mb6SG+D3
 Pck3XApEFBPQiAgoxvCMMmsA9PMMLAwSqiPKgfD/lT0d+NZ5v8tzyyWeemD+XqeGqgtL
 l1hsC+pfaPePHI1QD194Qx3LxFLYTLVFnbrwQ0RjIwOEVunt9O0gUFekYOu+y9Jlhe34
 oPcf4af4J6tIcZ8MsRyuRjUErJEIl5XLZkluOfbG1CoQIJqchSuuKNWorKjRWPcNgupU
 ThUNlc67pcKZGUcqJ6uZ3wEZ+eUXa/u+Y0CuVjPgBBELBFT4FNgC8nx8gX4ErhcfNKm/
 1+Zg==
X-Gm-Message-State: AOAM530R0TukJBUvxa/pvk0sDXDLxjSspha7LVAFU6NQaEgH+cZUbDTb
 OleJJ8cc7be0mFqk5tLFmcBTFA==
X-Google-Smtp-Source: ABdhPJwHEb3T3solJjKrCfQuAKkBECPSfyBd0UXTyIQG6AVGnX+r1zRRo5Wm+hZTvFsy0uqlfprQCg==
X-Received: by 2002:a17:906:c45a:: with SMTP id
 ck26mr33208496ejb.125.1615965741643; 
 Wed, 17 Mar 2021 00:22:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id bh4sm4179545ejb.24.2021.03.17.00.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 00:22:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D47051FF8C;
 Wed, 17 Mar 2021 07:22:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 02/15] plugins: new syscalls plugin
Date: Wed, 17 Mar 2021 07:22:03 +0000
Message-Id: <20210317072216.16316-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317072216.16316-1-alex.bennee@linaro.org>
References: <20210317072216.16316-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Matthias Weckbecker <matthias@weckbecker.name>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matthias Weckbecker <matthias@weckbecker.name>

This commit adds a new syscalls plugin that displays the syscalls
as they are executed and returned. This plugin outputs the number
of the syscall as well as the syscall return value.

Works in *-user only.

Essentially, this commit restores:

  https://lists.gnu.org/archive/html/qemu-devel/2018-06/msg00846.html

by using the new QEMU plugin API.

Signed-off-by: Matthias Weckbecker <matthias@weckbecker.name>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200812115816.4454-1-matthias@weckbecker.name>
Message-Id: <20210312172821.31647-2-alex.bennee@linaro.org>

diff --git a/tests/plugin/syscall.c b/tests/plugin/syscall.c
new file mode 100644
index 0000000000..53ee2ab6c4
--- /dev/null
+++ b/tests/plugin/syscall.c
@@ -0,0 +1,49 @@
+/*
+ * Copyright (C) 2020, Matthias Weckbecker <matthias@weckbecker.name>
+ *
+ * License: GNU GPL, version 2 or later.
+ *   See the COPYING file in the top-level directory.
+ */
+#include <inttypes.h>
+#include <assert.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <stdio.h>
+#include <glib.h>
+
+#include <qemu-plugin.h>
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+
+static void vcpu_syscall(qemu_plugin_id_t id, unsigned int vcpu_index,
+                         int64_t num, uint64_t a1, uint64_t a2,
+                         uint64_t a3, uint64_t a4, uint64_t a5,
+                         uint64_t a6, uint64_t a7, uint64_t a8)
+{
+    g_autofree gchar *out = g_strdup_printf("syscall #%" PRIi64 "\n", num);
+    qemu_plugin_outs(out);
+}
+
+static void vcpu_syscall_ret(qemu_plugin_id_t id, unsigned int vcpu_idx,
+                             int64_t num, int64_t ret)
+{
+    g_autofree gchar *out;
+    out = g_strdup_printf("syscall #%" PRIi64 " returned -> %" PRIi64 "\n",
+            num, ret);
+    qemu_plugin_outs(out);
+}
+
+/* ************************************************************************* */
+
+static void plugin_exit(qemu_plugin_id_t id, void *p) {}
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
+                                           const qemu_info_t *info,
+                                           int argc, char **argv)
+{
+    qemu_plugin_register_vcpu_syscall_cb(id, vcpu_syscall);
+    qemu_plugin_register_vcpu_syscall_ret_cb(id, vcpu_syscall_ret);
+    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
+    return 0;
+}
diff --git a/tests/plugin/meson.build b/tests/plugin/meson.build
index 1eacfa6e35..2bbfc4b19e 100644
--- a/tests/plugin/meson.build
+++ b/tests/plugin/meson.build
@@ -1,5 +1,5 @@
 t = []
-foreach i : ['bb', 'empty', 'insn', 'mem']
+foreach i : ['bb', 'empty', 'insn', 'mem', 'syscall']
   t += shared_module(i, files(i + '.c'),
                      include_directories: '../../include/qemu',
                      dependencies: glib)
-- 
2.20.1


