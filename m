Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1A24994B8
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:59:33 +0100 (CET)
Received: from localhost ([::1]:40936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC6R2-0002iL-Mc
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:59:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5ru-0005Mh-FN
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:23:14 -0500
Received: from [2a00:1450:4864:20::52b] (port=33322
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5rs-0004Ka-IL
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:23:14 -0500
Received: by mail-ed1-x52b.google.com with SMTP id b13so58872958edn.0
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qvlq4EbF8sgpZEXEh1QmS3gXAHV79S6jhTAWHRC4jv8=;
 b=etxNXnuUJrQpaJhYhP7rdnRc8BimFvRUStAgcvPd135BngaZ04tq85MoKS/ItIRObb
 2PMHDzpqo/bZcMKu8KunCNUO1OwBUtWff9HGfPQX4fmc8fUtBJxEAaIpHdgnmcCsKg0x
 MBGgJuO2gseKG5wLNAZTFShjBIFdqr/jXb3SJwUsxawDz4aNib6Q8jX+XHF6S1C/i7OP
 OsH9mMDicV2YQUL2AzVOEAN0CP61K274iQcFqYxZAL0p39P75hhN09ufbt2ac/Z2hoBV
 aLFPHgQPuyFkPcKGcQ9JueJY0KfMXaT2VmYr+lxTpzDnt+g0Iisdy5ACcGMDQziTZjYP
 dMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qvlq4EbF8sgpZEXEh1QmS3gXAHV79S6jhTAWHRC4jv8=;
 b=GTU7wcSiqWf9H59Q+PlQHc8mPryJhUGkjidIHyRNIJ+JJTC1Hj+qt2+6RL61JoHize
 nHCuu9Gu7xuUsqYjM8Qf+NjWo4i5dnP+w7DtUS3miaoUeI0yNIns+jYf6u20TL0/2CRn
 QycWM4TNIYOSi+naxrGxXtx6fSxaOBPHvCF3jukg/CWUn1dtz9MVo7dEjitxEXQR0976
 X1ey9X/TIuLRyN6GtSGfa6K1pQbpY1sGrRKWROjlzbrCReu5yAzrvFwaF1cWjh1/il9r
 rwrG+rNnr01GeqKxuuXljR/FREGbKq2wJaqGAswalKhOgXCKNJr0uN6hdXlH8gRv5Wiv
 BvNA==
X-Gm-Message-State: AOAM5315g6m+RDjROzc01M0H5yhq6smTBulKGUR1cC/eQ5TyBfsw8L2F
 ZuRmaugYGbYBg+OK5rCQ53YEEg==
X-Google-Smtp-Source: ABdhPJzVRcMvcQISBLW6Np+8/QR/b+gJ0+PoxFRyZnflmL/FM2wu9ttdlgJ0YU3xnbilm+yzFLnA/A==
X-Received: by 2002:a05:6402:230e:: with SMTP id
 l14mr17299621eda.370.1643055791270; 
 Mon, 24 Jan 2022 12:23:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h1sm5252189ejt.122.2022.01.24.12.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 12:23:07 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 745A31FFC9;
 Mon, 24 Jan 2022 20:16:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 18/22] contrib/plugins: add a drcov plugin
Date: Mon, 24 Jan 2022 20:16:04 +0000
Message-Id: <20220124201608.604599-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124201608.604599-1-alex.bennee@linaro.org>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
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
index 576ed5875a..7eed5d51f8 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -21,6 +21,7 @@ NAMES += lockstep
 NAMES += hwprofile
 NAMES += cache
 NAMES += stxp-plugin
+NAMES += drcov
 
 SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 
-- 
2.30.2


