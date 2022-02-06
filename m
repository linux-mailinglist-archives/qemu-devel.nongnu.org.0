Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D59B24AAD6A
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 02:52:09 +0100 (CET)
Received: from localhost ([::1]:53120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGWim-0001wA-GI
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 20:52:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3RCf_YQcKCqUaJSYZWJLTTLQJ.HTRVJRZ-IJaJQSTSLSZ.TWL@flex--venture.bounces.google.com>)
 id 1nGWgX-0000OV-8J
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 20:49:49 -0500
Received: from [2607:f8b0:4864:20::a4a] (port=39714
 helo=mail-vk1-xa4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3RCf_YQcKCqUaJSYZWJLTTLQJ.HTRVJRZ-IJaJQSTSLSZ.TWL@flex--venture.bounces.google.com>)
 id 1nGWgU-0003zw-9L
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 20:49:48 -0500
Received: by mail-vk1-xa4a.google.com with SMTP id
 j125-20020a1fd283000000b0032712b9dca0so1400701vkg.6
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 17:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=MmuthQmgfy42s4zXvP1BA/qrN+WfOTjJrqTxKRgXRvg=;
 b=KhADffo72hKDrlOIuxmnospGJm2oVdSWbDtM6TJuHULmyEkWyr4qJSKeUxTa+ZSgTo
 ehjatescGxbODjVlAQ17OBi6SWfFgnWZ57VEEeDrtU627aIFxwou1EGI1Bs9ERLAmDJk
 aj2ws4PEVgV4MBst2tPe6BEA+alqp6BavSZctllijhgkyYV+jafqYQak16Rl8A2Hu7W1
 r1Amitp/beOLzTM/WiDWJBrF6m8mmwRCBP5HuT74P4bSIQh0KbFOuQA6zCGa4x10V6jJ
 ywZIJXfF1ucTm5DHQEys3G7mCHu8Z6FCGhY9bImwePoBDsYu75v67S0W6CuHZVgsHzUa
 gQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=MmuthQmgfy42s4zXvP1BA/qrN+WfOTjJrqTxKRgXRvg=;
 b=cLgMhjUnlDjgSU3dObA8iJ6Grxb77Dfo3N6gXhWYTSJuz79N2wCS+PGwcbVFmSyOS9
 ApPWHFFnA8kd/XKcvgqHCmtDbDl2vduuU5gMH5BjwIBq2tawsyAy+qoEewJoUtld7tDj
 nL9enHTavewkhjqwogolYG8czPrFGEltCDQW9SsUrFGSiaTl19fQX1c85vbMiQunCoUM
 95+kBYJxHEM6sO3BwTD1FJ9ez/TurC4G3uVJK/FFtZDH4CmaBO2NAMDp6pOLWtJc9i0t
 sCoNbwlyfkgCKHam/ryDueeuv2NL1idxNpG7DW4B6PCh2tqGyRCXLryR7QBkT1hGFzyr
 S8Hw==
X-Gm-Message-State: AOAM533aRJ0IM+fFC+EY4V+IL9zbwv5LLHnTzhOJkD4FsDzDOnYGXVgx
 j9xxoBSdISvev3atbQynnLKoYd+Yka+d
X-Google-Smtp-Source: ABdhPJzZ2PS6YNYpEZZE/9bbMYaYRVitJzWekq/XBJd01ozV2ueNGr/axlEl9vNOF4/qlLoLrzADa/Fmyr0u
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:e8fd:ba94:dfb7:128b])
 (user=venture job=sendgmr) by 2002:a05:6902:1085:: with SMTP id
 v5mr5270071ybu.224.1644111684656; Sat, 05 Feb 2022 17:41:24 -0800 (PST)
Date: Sat,  5 Feb 2022 17:41:20 -0800
Message-Id: <20220206014120.2871459-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH v2] tests/qtest: add qtests for npcm7xx sdhci
From: Patrick Venture <venture@google.com>
To: thuth@redhat.com, peter.maydell@linaro.org, lvivier@redhat.com, 
 pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, hskinnemoen@google.com, 
 kfting@nuvoton.com, Shengtan Mao <stmao@google.com>,
 Hao Wu <wuhaotsh@google.com>, 
 Chris Rauer <crauer@google.com>, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a4a;
 envelope-from=3RCf_YQcKCqUaJSYZWJLTTLQJ.HTRVJRZ-IJaJQSTSLSZ.TWL@flex--venture.bounces.google.com;
 helo=mail-vk1-xa4a.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shengtan Mao <stmao@google.com>

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Chris Rauer <crauer@google.com>
Signed-off-by: Shengtan Mao <stmao@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
---
v2:
 * update copyright year
 * check result of open
 * use g_free instead of free
 * move declarations to the top
 * use g_file_open_tmp
---
 tests/qtest/meson.build          |   1 +
 tests/qtest/npcm7xx_sdhci-test.c | 214 +++++++++++++++++++++++++++++++
 2 files changed, 215 insertions(+)
 create mode 100644 tests/qtest/npcm7xx_sdhci-test.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 842b1df420..2b566999cd 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -189,6 +189,7 @@ qtests_npcm7xx = \
    'npcm7xx_gpio-test',
    'npcm7xx_pwm-test',
    'npcm7xx_rng-test',
+   'npcm7xx_sdhci-test',
    'npcm7xx_smbus-test',
    'npcm7xx_timer-test',
    'npcm7xx_watchdog_timer-test'] + \
diff --git a/tests/qtest/npcm7xx_sdhci-test.c b/tests/qtest/npcm7xx_sdhci-test.c
new file mode 100644
index 0000000000..e6f8d9c38c
--- /dev/null
+++ b/tests/qtest/npcm7xx_sdhci-test.c
@@ -0,0 +1,214 @@
+/*
+ * QTests for NPCM7xx SD-3.0 / MMC-4.51 Host Controller
+ *
+ * Copyright (c) 2022 Google LLC
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
+#include "hw/sd/npcm7xx_sdhci.h"
+
+#include "libqos/libqtest.h"
+#include "libqtest-single.h"
+#include "libqos/sdhci-cmd.h"
+
+#define NPCM7XX_MMC_BA 0xF0842000
+#define NPCM7XX_BLK_SIZE 512
+#define NPCM7XX_TEST_IMAGE_SIZE (1 << 30)
+
+char *sd_path;
+
+static QTestState *setup_sd_card(void)
+{
+    QTestState *qts = qtest_initf(
+        "-machine kudo-bmc "
+        "-device sd-card,drive=drive0 "
+        "-drive id=drive0,if=none,file=%s,format=raw,auto-read-only=off",
+        sd_path);
+
+    qtest_writew(qts, NPCM7XX_MMC_BA + SDHC_SWRST, SDHC_RESET_ALL);
+    qtest_writew(qts, NPCM7XX_MMC_BA + SDHC_CLKCON,
+                 SDHC_CLOCK_SDCLK_EN | SDHC_CLOCK_INT_STABLE |
+                     SDHC_CLOCK_INT_EN);
+    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_APP_CMD);
+    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0x41200000, 0, (41 << 8));
+    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_ALL_SEND_CID);
+    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_SEND_RELATIVE_ADDR);
+    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0x45670000, 0,
+                   SDHC_SELECT_DESELECT_CARD);
+
+    return qts;
+}
+
+static void write_sdread(QTestState *qts, const char *msg)
+{
+    int fd, ret;
+    size_t len = strlen(msg);
+    char *rmsg = g_malloc(len);
+
+    /* write message to sd */
+    fd = open(sd_path, O_WRONLY);
+    g_assert(fd >= 0);
+    ret = write(fd, msg, len);
+    close(fd);
+    g_assert(ret == len);
+
+    /* read message using sdhci */
+    ret = sdhci_read_cmd(qts, NPCM7XX_MMC_BA, rmsg, len);
+    g_assert(ret == len);
+    g_assert(!strcmp(rmsg, msg));
+
+    g_free(rmsg);
+}
+
+/* Check MMC can read values from sd */
+static void test_read_sd(void)
+{
+    QTestState *qts = setup_sd_card();
+
+    write_sdread(qts, "hello world");
+    write_sdread(qts, "goodbye");
+
+    qtest_quit(qts);
+}
+
+static void sdwrite_read(QTestState *qts, const char *msg)
+{
+    int fd, ret;
+    size_t len = strlen(msg);
+    char *rmsg = g_malloc(len);
+
+    /* write message using sdhci */
+    sdhci_write_cmd(qts, NPCM7XX_MMC_BA, msg, len, NPCM7XX_BLK_SIZE);
+
+    /* read message from sd */
+    fd = open(sd_path, O_RDONLY);
+    g_assert(fd >= 0);
+    ret = read(fd, rmsg, len);
+    close(fd);
+    g_assert(ret == len);
+
+    g_assert(!strcmp(rmsg, msg));
+
+    g_free(rmsg);
+}
+
+/* Check MMC can write values to sd */
+static void test_write_sd(void)
+{
+    QTestState *qts = setup_sd_card();
+
+    sdwrite_read(qts, "hello world");
+    sdwrite_read(qts, "goodbye");
+
+    qtest_quit(qts);
+}
+
+/* Check SDHCI has correct default values. */
+static void test_reset(void)
+{
+    QTestState *qts = qtest_init("-machine kudo-bmc");
+    uint64_t addr = NPCM7XX_MMC_BA;
+    uint64_t end_addr = addr + NPCM7XX_REG_SIZE;
+    uint16_t prstvals_resets[] = {NPCM7XX_PRSTVALS_0_RESET,
+                                  NPCM7XX_PRSTVALS_1_RESET,
+                                  0,
+                                  NPCM7XX_PRSTVALS_3_RESET,
+                                  0,
+                                  0};
+    int i;
+    uint32_t mask;
+
+    while (addr < end_addr) {
+        switch (addr - NPCM7XX_MMC_BA) {
+        case SDHC_PRNSTS:
+            /*
+             * ignores bits 20 to 24: they are changed when reading registers
+             */
+            mask = 0x1f00000;
+            g_assert_cmphex(qtest_readl(qts, addr) | mask, ==,
+                            NPCM7XX_PRSNTS_RESET | mask);
+            addr += 4;
+            break;
+        case SDHC_BLKGAP:
+            g_assert_cmphex(qtest_readb(qts, addr), ==, NPCM7XX_BLKGAP_RESET);
+            addr += 1;
+            break;
+        case SDHC_CAPAB:
+            g_assert_cmphex(qtest_readq(qts, addr), ==, NPCM7XX_CAPAB_RESET);
+            addr += 8;
+            break;
+        case SDHC_MAXCURR:
+            g_assert_cmphex(qtest_readq(qts, addr), ==, NPCM7XX_MAXCURR_RESET);
+            addr += 8;
+            break;
+        case SDHC_HCVER:
+            g_assert_cmphex(qtest_readw(qts, addr), ==, NPCM7XX_HCVER_RESET);
+            addr += 2;
+            break;
+        case NPCM7XX_PRSTVALS:
+            for (i = 0; i < NPCM7XX_PRSTVALS_SIZE; ++i) {
+                g_assert_cmphex(qtest_readw(qts, addr + 2 * i), ==,
+                                prstvals_resets[i]);
+            }
+            addr += NPCM7XX_PRSTVALS_SIZE * 2;
+            break;
+        default:
+            g_assert_cmphex(qtest_readb(qts, addr), ==, 0);
+            addr += 1;
+        }
+    }
+
+    qtest_quit(qts);
+}
+
+static void drive_destroy(void)
+{
+    unlink(sd_path);
+    g_free(sd_path);
+}
+
+static void drive_create(void)
+{
+    int fd, ret;
+    GError *error = NULL;
+
+    /* Create a temporary raw image */
+    fd = g_file_open_tmp("sdhci_XXXXXX", &sd_path, &error);
+    if (fd == -1) {
+        fprintf(stderr, "unable to create sdhci file: %s\n", error->message);
+        g_error_free(error);
+    }
+    g_assert(sd_path != NULL);
+
+    ret = ftruncate(fd, NPCM7XX_TEST_IMAGE_SIZE);
+    g_assert_cmpint(ret, ==, 0);
+    g_message("%s", sd_path);
+    close(fd);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    drive_create();
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("npcm7xx_sdhci/reset", test_reset);
+    qtest_add_func("npcm7xx_sdhci/write_sd", test_write_sd);
+    qtest_add_func("npcm7xx_sdhci/read_sd", test_read_sd);
+
+    ret = g_test_run();
+    drive_destroy();
+    return ret;
+}
-- 
2.35.0.263.gb82422642f-goog


