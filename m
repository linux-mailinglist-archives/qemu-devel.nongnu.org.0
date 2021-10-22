Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EED437AA9
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 18:13:20 +0200 (CEST)
Received: from localhost ([::1]:37042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdxAV-0001yG-F6
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 12:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1mdx4x-0003Qe-0B
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 12:07:35 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:43549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1mdx4u-00056u-Av
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 12:07:34 -0400
Received: by mail-lf1-x129.google.com with SMTP id bq11so3741356lfb.10
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 09:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=+InlGJvPCaCvmTuBKMOkWCL9YA+wZbOiycFkKePOVzs=;
 b=MkZC2n7FWMfABKY2MKy5/8ajnuAJ2+ks2aBww6XcutjE/bg1ZlzIdbiSW1hmdiX8X5
 gEI+JUB52Dfp9lmtG5MPQebbN+SQasvKA7YSCWHp/NcjF2iSKzrl9lzGAiGPzPJvwDYD
 DGma7CzpCLTfbEsyU/bD7dj7k65mj1MlsBWZ1xsM7RUsXQOkBsa//5ObsuYiWcMYIXUc
 Ki5bsnu880zVXn6BFy65Oao3rxetVSxWJZz4FgJuUjzb+sSNH0mTe8T0kWjT1R0VIlz6
 iuNNqwdcUmNgpqDf2WTu4poEvFJVxkLUKIYgoDwIrchoQgQlZLg7w4F62BsJHeS0EQzT
 SIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=+InlGJvPCaCvmTuBKMOkWCL9YA+wZbOiycFkKePOVzs=;
 b=Ji61Ce5HKc3YXMJUGgp3M4oovJN+dEwg4aWneKSeZlng6oR9NMjs3vVC8bNJ6850+U
 xCqnM+B4syXo/ywiOuZnlaHZkL43kPBeEi6sE4S+h70Vkkl7HShwloUkKqdTdvYcbvHy
 3qJ0ekJpqdvZeEyYyAClytg5HDbZykyDjsPK80l9b/A1jxyBFNhsrPkbD6MHQvV3DGLd
 q653zveDZMgD6hldG96jn+EmPjBhkn2jC3xjJUVoDxwQTjSwvMEg20CVEtBi28OzbBCP
 R7flYRXQAs88ab7YnjtvFS1c6tJmBSl+UVg9q1oTl2Aric1t26LynieAhaUArFY8YL9L
 ia8Q==
X-Gm-Message-State: AOAM5304UlsEcJr/ge0V4aXxJX9wzvEplhhO+Z/68UQdE5JSbOwzJ7f7
 s6EkZjmqgPvF4PLHFf9Hf3sCM7gCA6tsmg==
X-Google-Smtp-Source: ABdhPJyrWI+d0aCIimvz0QDtbxWBTLHL5vrrirAGKrNXKjMHyaYEtaImvDS8qpULgP13YrczftAcNw==
X-Received: by 2002:a05:6512:36ce:: with SMTP id
 e14mr546137lfs.328.1634918850751; 
 Fri, 22 Oct 2021 09:07:30 -0700 (PDT)
Received: from pc-System-Product-Name.intra.ispras.ru ([85.142.117.226])
 by smtp.gmail.com with ESMTPSA id c15sm766522lff.238.2021.10.22.09.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 09:07:30 -0700 (PDT)
From: NDNF <arkaisp2021@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] contrib/plugins: add a drcov plugin
Date: Fri, 22 Oct 2021 19:07:25 +0300
Message-Id: <163491884553.304355.13246023070235438959.stgit@pc-System-Product-Name>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <163491872706.304355.11795681036780988723.stgit@pc-System-Product-Name>
References: <163491872706.304355.11795681036780988723.stgit@pc-System-Product-Name>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=arkaisp2021@gmail.com; helo=mail-lf1-x129.google.com
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
Cc: arkadiy.ivanov@ispras.ru, alex.bennee@linaro.org, pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds the ability to generate files in drcov format.
Primary goal this script is to have coverage
logfiles thatwork in Lighthouse.

Signed-off-by: Ivanov Arkady <arkadiy.ivanov@ispras.ru>
---
 contrib/plugins/Makefile |    1 
 contrib/plugins/drcov.c  |  152 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 153 insertions(+)
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
index 0000000000..a655f1337c
--- /dev/null
+++ b/contrib/plugins/drcov.c
@@ -0,0 +1,152 @@
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
+static char *file_name = "file.drcov.trace";
+static GMutex lock;
+
+typedef struct {
+    uint32_t start;
+    uint16_t size;
+    uint16_t mod_id;
+    bool exec;
+} bb_entry_t;
+
+static GSList *bbs;
+
+static void printf_header(void)
+{
+    fprintf(fp, "%s", header);
+    const char *path = qemu_plugin_path_to_binary();
+    uint64_t start_code = qemu_plugin_start_code();
+    uint64_t end_code = qemu_plugin_end_code();
+    uint64_t entry = qemu_plugin_entry_code();
+    fprintf(fp, "0, 0x%lx, 0x%lx, 0x%lx, %s\n",
+            start_code, end_code, entry, path);
+    fprintf(fp, "BB Table: %d bbs\n", g_slist_length(bbs));
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
+    if (bb->exec) {
+        printf_char_array32(bb->start);
+        printf_char_array16(bb->size);
+        printf_char_array16(bb->mod_id);
+    }
+
+    g_mutex_unlock(&lock);
+}
+
+static void plugin_exit(qemu_plugin_id_t id, void *p)
+{
+    /* Print function */
+    printf_header();
+    bbs = g_slist_reverse(bbs);
+    g_slist_foreach(bbs, printf_el, NULL);
+
+    /* Clear */
+    g_slist_free_full(bbs, &g_free);
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
+    g_mutex_lock(&lock);
+
+    bb_entry_t *bb = (bb_entry_t *)udata;
+    bb->exec = true;
+
+    g_mutex_unlock(&lock);
+}
+
+static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
+{
+    uint64_t pc = qemu_plugin_tb_vaddr(tb);
+
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
+
+    bbs = g_slist_prepend(bbs, bb);
+    g_mutex_unlock(&lock);
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


