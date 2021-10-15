Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7A942EE45
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 12:00:19 +0200 (CEST)
Received: from localhost ([::1]:46774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbK0g-000823-Sh
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 06:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1mbJw6-000390-3t
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:55:34 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:34566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1mbJw4-0005i4-Cn
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:55:33 -0400
Received: by mail-lf1-x12e.google.com with SMTP id t9so38620487lfd.1
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 02:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=Qoo1pPiEdbI5MtHJboYvyS1XIILlXI1+9H+BWKPa5BU=;
 b=ZgtnXPaxYQLoTs+lKC+PmURjTNIcLrBX4VPLL7m3VbAWzz25RTREl7P4lrx8IlRZka
 Us46abWrJ0KpVJseYCEad5sfnEqrlg+UIyS9NLpE5tEiFD/QPxAWkJS6Fs5HYtq3ysC6
 AQn5ooe00dZbwBqjSUjMM0jqNqD6lVFeAAe8XzjbynyI7A9L/Dme+XvK205uf+Y9L1nA
 c6EDBzdYITjHFHvdTtVdOBMaxvmDzbm98UWOLrmTBQYn/PRJNya6OglBfPHfePh2oC3Q
 BQ4naQBNXHAdcCb+TPxOrYimiiESiNoh4lHfkfAPT0ROvKUOb5a5UaMK9o0TWL+Elf8v
 T6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Qoo1pPiEdbI5MtHJboYvyS1XIILlXI1+9H+BWKPa5BU=;
 b=IP6+QgOY58fd2XBH0KUFk0v6DXnW+9xo/zWYrkOlsA889jdWT4a5di1NQKAoZmQBuh
 8hWjNzUsdgdrn4U0/4Zvk1bWgoTu+4dpKHGRioehwV20lH4sy8okmCVwDtyUfOw+4RXW
 56Qstfd0to7aYXY7SGKuxAkGR7uXgPPsg+qRIABVXpj3GvWrNc/u2SiuCnMoqgjEfZxv
 EfWOQTRXmJamVUPw/xMdLGz+cuvxDaW+YAhpeNmFoa8SMtTlCdUAi23PoVzjWYJtnrJt
 OQ7u8K1u7MkPgcNqUamkEMG1xUQzAJ3Lg5Y9uNcgp1q9DjvNdTyu4Wh2+GalLnSnt9U6
 jmcw==
X-Gm-Message-State: AOAM530Hv5yUM/w4BwgeYvu32Imjr6DBML6i9KFhIwgsJPc/DViWTDgT
 4QAyCJOrXnls0aYF0nBJ8+yjYqNWjO9pzg==
X-Google-Smtp-Source: ABdhPJw++NfAA4QoNDv6LERiolZ9jgPQWtQceTPlw5kqKWBJD2ei7UMYFj2JG0SQC4FoEE6ZIq5Vhw==
X-Received: by 2002:a2e:3902:: with SMTP id g2mr11827841lja.321.1634291730557; 
 Fri, 15 Oct 2021 02:55:30 -0700 (PDT)
Received: from pc-System-Product-Name.intra.ispras.ru ([85.142.117.226])
 by smtp.gmail.com with ESMTPSA id s11sm459737lfd.95.2021.10.15.02.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 02:55:30 -0700 (PDT)
From: NDNF <arkaisp2021@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] contrib/plugins: add a drcov plugin
Date: Fri, 15 Oct 2021 12:55:26 +0300
Message-Id: <163429172593.439576.18239997817704146254.stgit@pc-System-Product-Name>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <163429165642.439576.16356288759891202632.stgit@pc-System-Product-Name>
References: <163429165642.439576.16356288759891202632.stgit@pc-System-Product-Name>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=arkaisp2021@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: alex.bennee@linaro.org, pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds the ability to generate files in drcov format.
Primary goal this script is to have coverage
logfiles thatwork in Lighthouse.

Signed-off-by: Ivanov Arkady <arkadiy.ivanov@ispras.ru>
---
 contrib/plugins/Makefile |    1 
 contrib/plugins/drcov.c  |  148 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 149 insertions(+)
 create mode 100644 contrib/plugins/drcov.c

diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index 7801b08b0d..0a681efeec 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -17,6 +17,7 @@ NAMES += hotblocks
 NAMES += hotpages
 NAMES += howvec
 NAMES += lockstep
+NAMES += drcov
 
 SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 
diff --git a/contrib/plugins/drcov.c b/contrib/plugins/drcov.c
new file mode 100644
index 0000000000..f94b52ff64
--- /dev/null
+++ b/contrib/plugins/drcov.c
@@ -0,0 +1,148 @@
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
+static char *file_name;
+static GMutex lock;
+
+typedef struct {
+    uint32_t start;
+    uint16_t size;
+    uint16_t mod_id;
+} bb_entry_t;
+
+static GSList *bbs;
+
+static void printf_header(void)
+{
+    g_autoptr(GString) head = g_string_new(header);
+    const char *path = qemu_plugin_path_to_binary();
+    uint64_t start_code = qemu_plugin_start_code();
+    uint64_t end_code = qemu_plugin_end_code();
+    uint64_t entry = qemu_plugin_entry_code();
+    g_string_append_printf(head, "0, 0x%lx, 0x%lx, 0x%lx, %s\n",
+                           start_code, end_code, entry, path);
+    g_string_append_printf(head, "BB Table: %d bbs\n", g_slist_length(bbs));
+    fwrite(head->str, sizeof(char), head->len, fp);
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
+    g_mutex_lock(&lock);
+
+    bb_entry_t *bb = (bb_entry_t *)data;
+    printf_char_array32(bb->start);
+    printf_char_array16(bb->size);
+    printf_char_array16(bb->mod_id);
+
+    g_mutex_unlock(&lock);
+}
+
+static void plugin_exit(qemu_plugin_id_t id, void *p)
+{
+    /* Print function */
+    printf_header();
+    g_slist_foreach(bbs, printf_el, NULL);
+
+    /* Clear */
+    g_slist_free_full(bbs, &g_free);
+    g_free(file_name);
+    fclose(fp);
+}
+
+static void plugin_init(void)
+{
+    fp = fopen(file_name, "wb");
+}
+
+static void vcpu_tb_exec(unsigned int cpu_index, void *udata)
+{
+    bb_entry_t *bb = g_malloc0(sizeof(bb_entry_t));
+    memcpy(bb, udata, sizeof(bb_entry_t));
+
+    g_mutex_lock(&lock);
+    bbs = g_slist_append(bbs, bb);
+    g_mutex_unlock(&lock);
+}
+
+static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
+{
+    bb_entry_t *bb = g_new0(bb_entry_t, 1);
+    uint64_t pc = qemu_plugin_tb_vaddr(tb);
+
+    size_t n = qemu_plugin_tb_n_insns(tb);
+    for (int i = 0; i < n; i++) {
+        bb->size += qemu_plugin_insn_size(qemu_plugin_tb_get_insn(tb, i));
+    }
+
+    bb->start = pc;
+    bb->mod_id = 0;
+
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
+
+    if (!argc) {
+        file_name = "file.drcov.trace";
+    } else {
+        if (g_str_has_prefix(argv[0], "filename=")) {
+            size_t size = strlen(argv[0]) - 9;
+            file_name = g_malloc0(size + 1);
+            strncpy(file_name, argv[0] + 9, size);
+            file_name[size] = '\0';
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


