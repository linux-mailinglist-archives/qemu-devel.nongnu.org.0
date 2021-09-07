Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB2740318B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 01:31:13 +0200 (CEST)
Received: from localhost ([::1]:35764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNkYZ-0007JP-9l
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 19:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3K_U3YQgKCgY20nguzynmuumrk.iuswks0-jk1krtutmt0.uxm@flex--wuhaotsh.bounces.google.com>)
 id 1mNkUD-0000YI-6O
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 19:26:41 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:48657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3K_U3YQgKCgY20nguzynmuumrk.iuswks0-jk1krtutmt0.uxm@flex--wuhaotsh.bounces.google.com>)
 id 1mNkU9-000447-8D
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 19:26:40 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 41-20020a17090a0fac00b00195a5a61ab8so133513pjz.3
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 16:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=9xim941WBnIcXYlQ9IFTFIRwBApRHpg14MxJtUOAHZE=;
 b=qQnUsgGZS6cn5DLJBsCfICuguycywVHRgDJBZZ/kkzFb6JMhtBAjmhPKVAdx6fL10e
 jq6bPWcjF8LdiQ345UkUhz7JPipNX23pezDcrij7DT0PZFCit1y34IJ5s+Py+8Syy7kF
 2O4lO90n3XrcoeDjGPpE7T1gxCKLPE5aMw0kj2giP+a4m9uobCFvUDkabf1Gsdjbp5Vu
 2bwjwf+Y22G6wFuhM4s3L+gQSFWHI9keuAYv/OHurJ3QHuMo9xN4mNlKNsR25Ywjl/uv
 O8twK7MnXqx8uzBxLK6pf6IV/DraoDbSWE4LaeByphxabdwHoMlaNcRAW2OEexa16rPQ
 VgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9xim941WBnIcXYlQ9IFTFIRwBApRHpg14MxJtUOAHZE=;
 b=SZGVGTejjApFNXWbf5k/BxsM0y/metAGr19mvkkXbQtvNKYuMlhhmYGgI3BTrgaQzq
 0hU785c0nXy6V0REqwETH0SWm5dhSUOB1oHHewmoJo4VKtdleMyPKpGhKLNx+cIJgnu9
 zaU14pR0beGpBVoO1bfNy36ekTQx+q99Sj5zLAN42STyp6LfI3smA60f7fQAUtWYkYqK
 n7Il1QaDkGycmYnS/TfRPYSuCyUQom0tht+atRhmeI0HhWDe/3MGy64Uvi/LH/aFHC6i
 aMslrqWIwbbVJpWfBkwDGXPjhmzBnG/Itc9ATYlbdKqzCOAN6zMb/wk6PivZSNO5o7GO
 8r9Q==
X-Gm-Message-State: AOAM530GW3b1O6MpHJIZlZuoCcmySa3+5j4DDDGUhTv6G0gULzky4OC6
 spJx977BglkX36EbOfv6hKCZj0VyH45ZNg==
X-Google-Smtp-Source: ABdhPJy14cnAYhMPTGAOkLKMzVnPKy/oO6YU+mjBpuSLDToy296UIXcvvamjys7q2NB9gyIWMXsF+tn+H9UP2A==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:6508:b0:139:f0fd:ca8 with SMTP id
 b8-20020a170902650800b00139f0fd0ca8mr473359plk.5.1631057195194; Tue, 07 Sep
 2021 16:26:35 -0700 (PDT)
Date: Tue,  7 Sep 2021 16:25:55 -0700
In-Reply-To: <20210907232555.3268967-1-wuhaotsh@google.com>
Message-Id: <20210907232555.3268967-5-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210907232555.3268967-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
Subject: [PATCH 4/4] tests/qtest: add qtests for npcm7xx sdhci
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, f4bug@amsat.org, bin.meng@windriver.com, 
 qemu-block@nongnu.org, Shengtan Mao <stmao@google.com>,
 Chris Rauer <crauer@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3K_U3YQgKCgY20nguzynmuumrk.iuswks0-jk1krtutmt0.uxm@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
---
 tests/qtest/meson.build          |   1 +
 tests/qtest/npcm7xx_sdhci-test.c | 201 +++++++++++++++++++++++++++++++
 2 files changed, 202 insertions(+)
 create mode 100644 tests/qtest/npcm7xx_sdhci-test.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 757bb8499a..ef9c904779 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -157,6 +157,7 @@ qtests_npcm7xx = \
    'npcm7xx_gpio-test',
    'npcm7xx_pwm-test',
    'npcm7xx_rng-test',
+   'npcm7xx_sdhci-test',
    'npcm7xx_smbus-test',
    'npcm7xx_timer-test',
    'npcm7xx_watchdog_timer-test'] + \
diff --git a/tests/qtest/npcm7xx_sdhci-test.c b/tests/qtest/npcm7xx_sdhci-test.c
new file mode 100644
index 0000000000..5c4e78fda4
--- /dev/null
+++ b/tests/qtest/npcm7xx_sdhci-test.c
@@ -0,0 +1,201 @@
+/*
+ * QTests for NPCM7xx SD-3.0 / MMC-4.51 Host Controller
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
+        "-machine quanta-gbs-bmc "
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
+    size_t len = strlen(msg);
+    char *rmsg = g_malloc(len);
+
+    /* write message to sd */
+    int fd = open(sd_path, O_WRONLY);
+    int ret = write(fd, msg, len);
+    close(fd);
+    g_assert(ret == len);
+
+    /* read message using sdhci */
+    ret = sdhci_read_cmd(qts, NPCM7XX_MMC_BA, rmsg, len);
+    g_assert(ret == len);
+    g_assert(!strcmp(rmsg, msg));
+
+    free(rmsg);
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
+    size_t len = strlen(msg);
+    char *rmsg = g_malloc(len);
+
+    /* write message using sdhci */
+    sdhci_write_cmd(qts, NPCM7XX_MMC_BA, msg, len, NPCM7XX_BLK_SIZE);
+
+    /* read message from sd */
+    int fd = open(sd_path, O_RDONLY);
+    int ret = read(fd, rmsg, len);
+    close(fd);
+    g_assert(ret == len);
+
+    g_assert(!strcmp(rmsg, msg));
+
+    free(rmsg);
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
+    QTestState *qts = qtest_init("-machine quanta-gbs-bmc");
+
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
+    while (addr < end_addr) {
+        switch (addr - NPCM7XX_MMC_BA) {
+        case SDHC_PRNSTS:
+            /* ignores bits 20 to 24: they are changed when reading registers */
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
+    sd_path = g_strdup("/tmp/qtest.XXXXXX");
+
+    /* Create a temporary raw image */
+    fd = mkstemp(sd_path);
+    g_assert_cmpint(fd, >=, 0);
+    ret = ftruncate(fd, NPCM7XX_TEST_IMAGE_SIZE);
+    g_assert_cmpint(ret, ==, 0);
+    g_message("%s", sd_path);
+    close(fd);
+}
+
+int main(int argc, char **argv)
+{
+    drive_create();
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("npcm7xx_sdhci/reset", test_reset);
+    qtest_add_func("npcm7xx_sdhci/write_sd", test_write_sd);
+    qtest_add_func("npcm7xx_sdhci/read_sd", test_read_sd);
+
+    int ret = g_test_run();
+    drive_destroy();
+    return ret;
+}
-- 
2.33.0.153.gba50c8fa24-goog


