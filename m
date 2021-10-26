Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB8343B060
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:42:57 +0200 (CEST)
Received: from localhost ([::1]:52780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJuy-0001cn-3C
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJhu-0001i0-IE
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:26 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:42836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJhs-0004fL-Kv
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:26 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 b82-20020a1c8055000000b0032ccc728d63so376385wmd.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=okvwrtf08W8uarrzKrlBybF3KpHoBrIYOL+cAd6cfzU=;
 b=BOynbW+GsXxu9VhXl9s03GXdghsmfqm+gD1jshUy90EthV19NGWGRulsuAonBvjnZK
 8WoWzE8S8/zAkSdc64Q530pbtmyhF/T0uKb5mX71jtvb9g3+5TH0d9ORG1++DWNyEVsR
 qYI1zoc+4TwMxAL7CWkPMLziuXR3joa+bpEyKA+ewe+ryuwg49na5PnFdbivYGYO6a2Y
 VJaFr66HQ+lM8zn3OjoRzrRz9u+MZCvKIwq9CdXOo45291SxZzUo3Zu0na0jx60272OZ
 t4HAWN1Lcj3tprMeuXy/Kvp7CFTWFzoVYNaPwc+RAAjbmTXUDEuzQ3PJu/PVpkKOFDZq
 yJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=okvwrtf08W8uarrzKrlBybF3KpHoBrIYOL+cAd6cfzU=;
 b=F/eMP590Ad/g9OzxzX1fsJrBathTfAt2aJ3ocyjdAKIv9a9EaoHeElXSx6f1HYs0dj
 WqSX31VQUQJR/wwl4bBCALMSh4tsIGsRFola5lrNKyB67Qe/gPpmnN/+5a7fe57qsYba
 x+kiQFOVcPpQg63wuTfpCzG7Byxol75L0iCwEgxCpO8XgEDnptD2tzwJn0QZ04kHcaoV
 Gd3YLNcyK5uSwtTTXrp2rE0/A3r7TBmm72dh5Lbb4EoKIlOAmAEI5BmxZjLx6/RZmX3O
 9ctvnB3BIOgJb65tkcJ63MSABzHBCp0m3ZjTvAXmQ66SGMgW9oDjXyzeXgjyRpsOLN1I
 qLWQ==
X-Gm-Message-State: AOAM533//JoMtyVJbIFXvIfF16v7x7vnxgXk2L+fIxeJ0DiiqVtFCqh4
 i+vBJiSMuwwoY8p90IZalzsbmA==
X-Google-Smtp-Source: ABdhPJx68hTW0xUygxIl9EuCAmSa86JZyIFPqZOIEKMmVwLgH44O7DHFbh3+v/ypS8jWWbARX/mlrg==
X-Received: by 2002:a1c:7f4a:: with SMTP id a71mr19988887wmd.177.1635244163219; 
 Tue, 26 Oct 2021 03:29:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o10sm192309wmr.31.2021.10.26.03.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:29:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3DCE71FFBC;
 Tue, 26 Oct 2021 11:22:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 26/28] contrib/plugins: add a drcov plugin
Date: Tue, 26 Oct 2021 11:22:32 +0100
Message-Id: <20211026102234.3961636-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

This patch adds the ability to generate files in drcov format. Primary
goal this script is to have coverage logfiles thatwork in Lighthouse.

Signed-off-by: Ivanov Arkady <arkadiy.ivanov@ispras.ru>
Message-Id: <163491884553.304355.13246023070235438959.stgit@pc-System-Product-Name>
[AJB: use g_ptr_array instead of slist]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/drcov.c  | 163 +++++++++++++++++++++++++++++++++++++++
 contrib/plugins/Makefile |   1 +
 2 files changed, 164 insertions(+)
 create mode 100644 contrib/plugins/drcov.c

diff --git a/contrib/plugins/drcov.c b/contrib/plugins/drcov.c
new file mode 100644
index 0000000000..b4a855adaf
--- /dev/null
+++ b/contrib/plugins/drcov.c
@@ -0,0 +1,163 @@
+/*
+ * Copyright (C) 2021, Ivanov Arkady <arkadiy.ivanov@ispras.ru>
+ *
+ * Drcov - a DynamoRIO-based tool that collects coverage information
+ * from a binary. Primary goal this script is to have coverage log
+ * files that work in Lighthouse.
+ *
+ * License: GNU GPL, version 2 or later.
+ *   See the COPYING file in the top-level directory.
+ */
+
+#include <inttypes.h>
+#include <assert.h>
+#include <stdlib.h>
+#include <inttypes.h>
+#include <string.h>
+#include <unistd.h>
+#include <stdio.h>
+#include <glib.h>
+
+#include <qemu-plugin.h>
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+
+static char header[] = "DRCOV VERSION: 2\n"
+                "DRCOV FLAVOR: drcov-64\n"
+                "Module Table: version 2, count 1\n"
+                "Columns: id, base, end, entry, path\n";
+
+static FILE *fp;
+static const char *file_name = "file.drcov.trace";
+static GMutex lock;
+
+typedef struct {
+    uint32_t start;
+    uint16_t size;
+    uint16_t mod_id;
+    bool     exec;
+} bb_entry_t;
+
+/* Translated blocks */
+static GPtrArray *blocks;
+
+static void printf_header(unsigned long count)
+{
+    fprintf(fp, "%s", header);
+    const char *path = qemu_plugin_path_to_binary();
+    uint64_t start_code = qemu_plugin_start_code();
+    uint64_t end_code = qemu_plugin_end_code();
+    uint64_t entry = qemu_plugin_entry_code();
+    fprintf(fp, "0, 0x%lx, 0x%lx, 0x%lx, %s\n",
+            start_code, end_code, entry, path);
+    fprintf(fp, "BB Table: %ld bbs\n", count);
+}
+
+static void printf_char_array32(uint32_t data)
+{
+    const uint8_t *bytes = (const uint8_t *)(&data);
+    fwrite(bytes, sizeof(char), sizeof(data), fp);
+}
+
+static void printf_char_array16(uint16_t data)
+{
+    const uint8_t *bytes = (const uint8_t *)(&data);
+    fwrite(bytes, sizeof(char), sizeof(data), fp);
+}
+
+
+static void printf_el(gpointer data, gpointer user_data)
+{
+    bb_entry_t *bb = (bb_entry_t *)data;
+    if (bb->exec) {
+        printf_char_array32(bb->start);
+        printf_char_array16(bb->size);
+        printf_char_array16(bb->mod_id);
+    }
+    g_free(bb);
+}
+
+static void count_block(gpointer data, gpointer user_data)
+{
+    unsigned long *count = (unsigned long *) user_data;
+    bb_entry_t *bb = (bb_entry_t *)data;
+    if (bb->exec) {
+        *count = *count + 1;
+    }
+}
+
+static void plugin_exit(qemu_plugin_id_t id, void *p)
+{
+    unsigned long count = 0;
+    g_mutex_lock(&lock);
+    g_ptr_array_foreach(blocks, count_block, &count);
+
+    /* Print function */
+    printf_header(count);
+    g_ptr_array_foreach(blocks, printf_el, NULL);
+
+    /* Clear */
+    g_ptr_array_free(blocks, true);
+
+    fclose(fp);
+
+    g_mutex_unlock(&lock);
+}
+
+static void plugin_init(void)
+{
+    fp = fopen(file_name, "wb");
+    blocks = g_ptr_array_sized_new(128);
+}
+
+static void vcpu_tb_exec(unsigned int cpu_index, void *udata)
+{
+    bb_entry_t *bb = (bb_entry_t *) udata;
+
+    g_mutex_lock(&lock);
+    bb->exec = true;
+    g_mutex_unlock(&lock);
+}
+
+static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
+{
+    uint64_t pc = qemu_plugin_tb_vaddr(tb);
+    size_t n = qemu_plugin_tb_n_insns(tb);
+
+    g_mutex_lock(&lock);
+
+    bb_entry_t *bb = g_new0(bb_entry_t, 1);
+    for (int i = 0; i < n; i++) {
+        bb->size += qemu_plugin_insn_size(qemu_plugin_tb_get_insn(tb, i));
+    }
+
+    bb->start = pc;
+    bb->mod_id = 0;
+    bb->exec = false;
+    g_ptr_array_add(blocks, bb);
+
+    g_mutex_unlock(&lock);
+    qemu_plugin_register_vcpu_tb_exec_cb(tb, vcpu_tb_exec,
+                                         QEMU_PLUGIN_CB_NO_REGS,
+                                         (void *)bb);
+
+}
+
+QEMU_PLUGIN_EXPORT
+int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
+                        int argc, char **argv)
+{
+    for (int i = 0; i < argc; i++) {
+        g_autofree char **tokens = g_strsplit(argv[i], "=", 2);
+        if (g_strcmp0(tokens[0], "filename") == 0) {
+            file_name = g_strdup(tokens[1]);
+        }
+    }
+
+    plugin_init();
+
+    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
+    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
+
+    return 0;
+}
diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index 54ac5ccd9f..df3499f4f2 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -20,6 +20,7 @@ NAMES += howvec
 NAMES += lockstep
 NAMES += hwprofile
 NAMES += cache
+NAMES += drcov
 
 SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 
-- 
2.30.2


