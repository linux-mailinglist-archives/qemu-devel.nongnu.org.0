Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD79428BCF
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 13:13:44 +0200 (CEST)
Received: from localhost ([::1]:35072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZtFV-0002mV-EW
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 07:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1mZtDV-0000jT-FV
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 07:11:37 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:33584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1mZtDS-0007vt-Es
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 07:11:36 -0400
Received: by mail-lf1-x132.google.com with SMTP id j21so54391451lfe.0
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 04:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=thKMvx2/Oik4deTXCBKXlDjROfopMKfjIXTbpftNZkI=;
 b=NiuP47YXvRiFIlqgoKy1zO0ugOe1HhreGSbCdvDCmg6uyise3x/VhqqJGN0e0phNNp
 xc1X3hrlle7S7jXJPQZ/NxrDKUpO0IqBEkhJ8gKPensDGvnbAR0LaBOO0yrKohXuAVk4
 gHAvJs5yT40OIzn6PyPyHQrP3F1xI22hggbTfBxLva5IvY2mDrzfMFzhzY3PiixGny8E
 RGNshcyvRA2oveXYw1MKHiffE239/J2GhX1LX8fM5coZo8MJLbfN7aMdfEx2skyJc9aN
 hIsc6irj1hpR8Sg4Aei0CX2BM5Naqaynnwu/ZmvgPCb1fbQDWKWYxW/gZUQoZy44FZbK
 PXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=thKMvx2/Oik4deTXCBKXlDjROfopMKfjIXTbpftNZkI=;
 b=wdplbmMCIHhj53l28e93A4d2hRKftkJn45mPPbA1boIXvJTj1ErlgaRCwRggzbwfqJ
 reYmh9bd5PKsb4uqRZMF+wNCUDk2Rv9gfSLvHCR8wLNMPok8SMi2gRX6Rck2k7jl+Qnr
 KpvBWiUd2T1juMTdthRexJzeGa0olW3B8yFtUgtHMOAB8c3lfHLTdwOV5xrPCuIbVuB/
 wsMykY2wsXXhyw6rBUhc4HKFHuam++oydman7mXmkgxlIjtQZHbpQwGQaid88coX6sP1
 uXM/ZPli1+uEFQw2TgvOdG52xz//q0O3xZFMHbHtrAddNYUrfikYvBGHYIk5q64lDYeX
 8i2A==
X-Gm-Message-State: AOAM530tbPs3szaqd8ESnvVZbRMEDv9r3VilFbSxqhW/AP47IjJrkh1I
 LWwjg83UFqFTL6wPBUxUgxUOijGa0PkXbw==
X-Google-Smtp-Source: ABdhPJzVw3vjasGHs0xai1b0lgDbVYRLMvRuwsBMWhbd1CwZZqs2MREXVxTX4oHayx9Q4s9plODGnQ==
X-Received: by 2002:a2e:94cd:: with SMTP id r13mr22117517ljh.529.1633950691701; 
 Mon, 11 Oct 2021 04:11:31 -0700 (PDT)
Received: from pc-System-Product-Name.intra.ispras.ru ([85.142.117.226])
 by smtp.gmail.com with ESMTPSA id v62sm705333lfa.23.2021.10.11.04.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 04:11:31 -0700 (PDT)
From: Arkadiy <arkaisp2021@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] contrib/plugins: add a drcov plugin
Date: Mon, 11 Oct 2021 14:11:30 +0300
Message-Id: <20211011111130.170178-1-arkaisp2021@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=arkaisp2021@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: NDNF <arkaisp2021@gmail.com>, Ivanov Arkady <arkadiy.ivanov@ispras.ru>,
 alex.bennee@linaro.org, pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: NDNF <arkaisp2021@gmail.com>

This patch adds the ability to generate files in drcov format.
Primary goal this script is to have coverage
logfiles thatwork in Lighthouse.
Problems:
    - The path to the executable file is not specified.
    - base, end, entry take incorrect values.
      (Lighthouse + IDA Pro anyway work).

Signed-off-by: Ivanov Arkady <arkadiy.ivanov@ispras.ru>
---
 contrib/plugins/Makefile |   1 +
 contrib/plugins/drcov.c  | 112 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)
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
index 0000000000..d6a7d131c0
--- /dev/null
+++ b/contrib/plugins/drcov.c
@@ -0,0 +1,112 @@
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
+
+typedef struct {
+    uint32_t start;
+    uint16_t size;
+    uint16_t mod_id;
+} bb_entry_t;
+
+static GSList *bbs;
+
+static void printfHeader()
+{
+    g_autoptr(GString) head = g_string_new("");
+    g_string_append(head, header);
+    g_string_append_printf(head, "0, 0x%x, 0x%x, 0x%x, %s\n",
+                           0, 0xffffffff, 0, "path");
+    g_string_append_printf(head, "BB Table: %d bbs\n", g_slist_length(bbs));
+    fwrite(head->str, sizeof(char), head->len, fp);
+}
+
+static void printfCharArray32(uint32_t data)
+{
+    const uint8_t *bytes = (const uint8_t *)(&data);
+    fwrite(bytes, sizeof(char), sizeof(data), fp);
+}
+
+static void printfCharArray16(uint16_t data)
+{
+    const uint8_t *bytes = (const uint8_t *)(&data);
+    fwrite(bytes, sizeof(char), sizeof(data), fp);
+}
+
+
+static void printf_el(gpointer data, gpointer user_data)
+{
+    bb_entry_t *bb = (bb_entry_t *)data;
+    printfCharArray32(bb->start);
+    printfCharArray16(bb->size);
+    printfCharArray16(bb->mod_id);
+}
+
+static void plugin_exit(qemu_plugin_id_t id, void *p)
+{
+    /* Print function */
+    printfHeader();
+    g_slist_foreach(bbs, printf_el, NULL);
+
+    /* Clear */
+    g_slist_free_full(bbs, &g_free);
+    fclose(fp);
+}
+
+static void plugin_init(void)
+{
+    fp = fopen("file.drcov.trace", "wb");
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
+    bbs = g_slist_append(bbs, bb);
+
+}
+
+QEMU_PLUGIN_EXPORT
+int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
+                        int argc, char **argv)
+{
+    plugin_init();
+
+    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
+    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
+    return 0;
+}
-- 
2.25.1


