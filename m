Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9600F426157
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 02:31:56 +0200 (CEST)
Received: from localhost ([::1]:49248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYdnn-0006iR-Ap
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 20:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3TJBfYQgKCvszxkdrwvkjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--wuhaotsh.bounces.google.com>)
 id 1mYdiz-0001F7-U5
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 20:26:57 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:48866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3TJBfYQgKCvszxkdrwvkjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--wuhaotsh.bounces.google.com>)
 id 1mYdiw-0004T4-RT
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 20:26:57 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 w185-20020a6362c2000000b0029566b18a88so642509pgb.15
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 17:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=0Pk1xr9m80aiN/9IWBqlSuI3WUsuIGy1RGGrydo7VGE=;
 b=cprXQeOb2X82DNCHQhO06Ej/agTW3o5PMeGtJBX+J9QRXgGjQqOesraMI/kkAgVv51
 HILJJoI61yVTyrZaKnO7kHXXBWKeeOIWcCu+FawDSWZ2/JhOPq31nXHYIPd48RdlE4Ks
 ont3kxVM66yaI/3vi6kfHNo/2fdVhbr6D+1bSH9jA1ukn+rKJyRBPvcPfRupU+Y7ee3B
 o3rgPJSyxzhclYnnBi5mWIv4VRMgygITUyQf/F2HBQ4NsiR3qqlbuwrVNX6kACPZ44LX
 80cvdwKoN8ARPCq9K4riYm5LxWX2YipcekgZrlKGixrvP5kMd5N/yQEowH7x0TGaYAAs
 0sIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=0Pk1xr9m80aiN/9IWBqlSuI3WUsuIGy1RGGrydo7VGE=;
 b=oFKZKQqc7+2qE/B2TpCSQhmqhCdfL36MwSPhNhi3A/c9xN/gRFMryhcoZpT8tCxH+C
 AMa7yNL5Mnz/UDbzQPZi3DcIIK2GRaO5AUEFlgi9WR3rykGzXPApIdB5RdyCnCz+zVPz
 PxzyWqcvySTX0IcTei/K1NhoNsEPqihabLpS5WnTtPE/rE1Q/ckBicO4s6JkUckLzRQ+
 ThaDNPmmHR48mKksXa6O1zHi/rbDqYO7itKxrpSbD1c8ZLO0GSM9LKhpJav15JsWHycA
 Q/3hxjap0ozpk9WOV+j3IW2FdJYlQPcS1quIkBgyBmx7ICoi1FvsAimdAMiiVwo65Os8
 pDFA==
X-Gm-Message-State: AOAM530mn7B/TV1CVF9UefFYkGIa49T6nHoPpQ0rv2dvsqqFlSGWjfbf
 adQ8EpKldXyHN08now29cCyrjuXzNDYBJA==
X-Google-Smtp-Source: ABdhPJx7RI0K3oXEFTXflh4gMciedMSIRVQSN4mhdH/KKm5GhNAk0ZCcEXuRDdrBs8xwotRaxeOunDzODRb+7w==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:3ee4:: with SMTP id
 k91mr194129pjc.1.1633652812656; Thu, 07 Oct 2021 17:26:52 -0700 (PDT)
Date: Thu,  7 Oct 2021 17:26:27 -0700
In-Reply-To: <20211008002628.1958285-1-wuhaotsh@google.com>
Message-Id: <20211008002628.1958285-5-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211008002628.1958285-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 4/5] tests/qtest/libqos: add SDHCI commands
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, f4bug@amsat.org, bin.meng@windriver.com, 
 qemu-block@nongnu.org, maoshengtan2011@gmail.com, 
 Shengtan Mao <stmao@google.com>, Chris Rauer <crauer@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3TJBfYQgKCvszxkdrwvkjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shengtan Mao <stmao@google.com>

Signed-off-by: Shengtan Mao <stmao@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Chris Rauer <crauer@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 tests/qtest/libqos/meson.build |   1 +
 tests/qtest/libqos/sdhci-cmd.c | 116 +++++++++++++++++++++++++++++++++
 tests/qtest/libqos/sdhci-cmd.h |  70 ++++++++++++++++++++
 3 files changed, 187 insertions(+)
 create mode 100644 tests/qtest/libqos/sdhci-cmd.c
 create mode 100644 tests/qtest/libqos/sdhci-cmd.h

diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
index 1f5c8f1053..4af1f04787 100644
--- a/tests/qtest/libqos/meson.build
+++ b/tests/qtest/libqos/meson.build
@@ -5,6 +5,7 @@ libqos_srcs = files('../libqtest.c',
         'fw_cfg.c',
         'malloc.c',
         'libqos.c',
+        'sdhci-cmd.c',
 
         # spapr
         'malloc-spapr.c',
diff --git a/tests/qtest/libqos/sdhci-cmd.c b/tests/qtest/libqos/sdhci-cmd.c
new file mode 100644
index 0000000000..2d9e518341
--- /dev/null
+++ b/tests/qtest/libqos/sdhci-cmd.c
@@ -0,0 +1,116 @@
+/*
+ * MMC Host Controller Commands
+ *
+ * Copyright (c) 2021 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+#include "sdhci-cmd.h"
+#include "libqtest.h"
+
+static ssize_t read_fifo(QTestState *qts, uint64_t reg, char *msg, size_t count)
+{
+    uint32_t mask = 0xff;
+    size_t index = 0;
+    uint32_t msg_frag;
+    int size;
+    while (index < count) {
+        size = count - index;
+        if (size > 4) {
+            size = 4;
+        }
+        msg_frag = qtest_readl(qts, reg);
+        while (size > 0) {
+            msg[index] = msg_frag & mask;
+            if (msg[index++] == 0) {
+                return index;
+            }
+            msg_frag >>= 8;
+            --size;
+        }
+    }
+    return index;
+}
+
+static void write_fifo(QTestState *qts, uint64_t reg, const char *msg,
+                       size_t count)
+{
+    size_t index = 0;
+    uint32_t msg_frag;
+    int size;
+    int frag_i;
+    while (index < count) {
+        size = count - index;
+        if (size > 4) {
+            size = 4;
+        }
+        msg_frag = 0;
+        frag_i = 0;
+        while (frag_i < size) {
+            msg_frag |= ((uint32_t)msg[index++]) << (frag_i * 8);
+            ++frag_i;
+        }
+        qtest_writel(qts, reg, msg_frag);
+    }
+}
+
+static void fill_block(QTestState *qts, uint64_t reg, int count)
+{
+    while (--count >= 0) {
+        qtest_writel(qts, reg, 0);
+    }
+}
+
+void sdhci_cmd_regs(QTestState *qts, uint64_t base_addr, uint16_t blksize,
+                    uint16_t blkcnt, uint32_t argument, uint16_t trnmod,
+                    uint16_t cmdreg)
+{
+    qtest_writew(qts, base_addr + SDHC_BLKSIZE, blksize);
+    qtest_writew(qts, base_addr + SDHC_BLKCNT, blkcnt);
+    qtest_writel(qts, base_addr + SDHC_ARGUMENT, argument);
+    qtest_writew(qts, base_addr + SDHC_TRNMOD, trnmod);
+    qtest_writew(qts, base_addr + SDHC_CMDREG, cmdreg);
+}
+
+ssize_t sdhci_read_cmd(QTestState *qts, uint64_t base_addr, char *msg,
+                       size_t count)
+{
+    sdhci_cmd_regs(qts, base_addr, count, 1, 0,
+                   SDHC_TRNS_MULTI | SDHC_TRNS_READ | SDHC_TRNS_BLK_CNT_EN,
+                   SDHC_READ_MULTIPLE_BLOCK | SDHC_CMD_DATA_PRESENT);
+
+    /* read sd fifo_buffer */
+    ssize_t bytes_read = read_fifo(qts, base_addr + SDHC_BDATA, msg, count);
+
+    sdhci_cmd_regs(qts, base_addr, 0, 0, 0,
+                   SDHC_TRNS_MULTI | SDHC_TRNS_READ | SDHC_TRNS_BLK_CNT_EN,
+                   SDHC_STOP_TRANSMISSION);
+
+    return bytes_read;
+}
+
+void sdhci_write_cmd(QTestState *qts, uint64_t base_addr, const char *msg,
+                     size_t count, size_t blksize)
+{
+    sdhci_cmd_regs(qts, base_addr, blksize, 1, 0,
+                   SDHC_TRNS_MULTI | SDHC_TRNS_WRITE | SDHC_TRNS_BLK_CNT_EN,
+                   SDHC_WRITE_MULTIPLE_BLOCK | SDHC_CMD_DATA_PRESENT);
+
+    /* write to sd fifo_buffer */
+    write_fifo(qts, base_addr + SDHC_BDATA, msg, count);
+    fill_block(qts, base_addr + SDHC_BDATA, (blksize - count) / 4);
+
+    sdhci_cmd_regs(qts, base_addr, 0, 0, 0,
+                   SDHC_TRNS_MULTI | SDHC_TRNS_WRITE | SDHC_TRNS_BLK_CNT_EN,
+                   SDHC_STOP_TRANSMISSION);
+}
diff --git a/tests/qtest/libqos/sdhci-cmd.h b/tests/qtest/libqos/sdhci-cmd.h
new file mode 100644
index 0000000000..64763c5a2a
--- /dev/null
+++ b/tests/qtest/libqos/sdhci-cmd.h
@@ -0,0 +1,70 @@
+/*
+ * MMC Host Controller Commands
+ *
+ * Copyright (c) 2021 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "libqtest.h"
+
+/* more details at hw/sd/sdhci-internal.h */
+#define SDHC_BLKSIZE 0x04
+#define SDHC_BLKCNT 0x06
+#define SDHC_ARGUMENT 0x08
+#define SDHC_TRNMOD 0x0C
+#define SDHC_CMDREG 0x0E
+#define SDHC_BDATA 0x20
+#define SDHC_PRNSTS 0x24
+#define SDHC_BLKGAP 0x2A
+#define SDHC_CLKCON 0x2C
+#define SDHC_SWRST 0x2F
+#define SDHC_CAPAB 0x40
+#define SDHC_MAXCURR 0x48
+#define SDHC_HCVER 0xFE
+
+/* TRNSMOD Reg */
+#define SDHC_TRNS_BLK_CNT_EN 0x0002
+#define SDHC_TRNS_READ 0x0010
+#define SDHC_TRNS_WRITE 0x0000
+#define SDHC_TRNS_MULTI 0x0020
+
+/* CMD Reg */
+#define SDHC_CMD_DATA_PRESENT (1 << 5)
+#define SDHC_ALL_SEND_CID (2 << 8)
+#define SDHC_SEND_RELATIVE_ADDR (3 << 8)
+#define SDHC_SELECT_DESELECT_CARD (7 << 8)
+#define SDHC_SEND_CSD (9 << 8)
+#define SDHC_STOP_TRANSMISSION (12 << 8)
+#define SDHC_READ_MULTIPLE_BLOCK (18 << 8)
+#define SDHC_WRITE_MULTIPLE_BLOCK (25 << 8)
+#define SDHC_APP_CMD (55 << 8)
+
+/* SWRST Reg */
+#define SDHC_RESET_ALL 0x01
+
+/* CLKCTRL Reg */
+#define SDHC_CLOCK_INT_EN 0x0001
+#define SDHC_CLOCK_INT_STABLE 0x0002
+#define SDHC_CLOCK_SDCLK_EN (1 << 2)
+
+/* Set registers needed to send commands to SD */
+void sdhci_cmd_regs(QTestState *qts, uint64_t base_addr, uint16_t blksize,
+                    uint16_t blkcnt, uint32_t argument, uint16_t trnmod,
+                    uint16_t cmdreg);
+
+/* Read at most 1 block of SD using non-DMA  */
+ssize_t sdhci_read_cmd(QTestState *qts, uint64_t base_addr, char *msg,
+                       size_t count);
+
+/* Write at most 1 block of SD using non-DMA  */
+void sdhci_write_cmd(QTestState *qts, uint64_t base_addr, const char *msg,
+                     size_t count, size_t blksize);
-- 
2.33.0.882.g93a45727a2-goog


