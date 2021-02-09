Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5F03145F3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 03:00:58 +0100 (CET)
Received: from localhost ([::1]:41230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9IKo-0002A4-0a
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 21:00:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3qOshYAMKCg8sytv33v0t.r315t19-stAt0232v29.36v@flex--dje.bounces.google.com>)
 id 1l9IFx-0007Mh-Hw
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 20:55:57 -0500
Received: from mail-vk1-xa49.google.com ([2607:f8b0:4864:20::a49]:38941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3qOshYAMKCg8sytv33v0t.r315t19-stAt0232v29.36v@flex--dje.bounces.google.com>)
 id 1l9IFu-0006ZA-H9
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 20:55:57 -0500
Received: by mail-vk1-xa49.google.com with SMTP id y127so1690461vkc.6
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 17:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=8XrBvvp7p2k5XmWyyWIVxNBDKau5mCCJd69EwXm4HNg=;
 b=HvR8go+sYyoHtOqH1MwfbXbekhAj+28rFkMZ67T5B0V19Ha0Mgr2/m1iquozyI1/Hc
 0TkfiqCRgHqwYgbENCdIaPNymyvtOwVoWrY+Gctd4Qu1Du848SzXgwN1xTFoLwuBol+1
 +Nl3rQytUkv8Q4UJpcyH5ewBdLNbspbZanThJvV8KY0ssXZd0StkON4/BczL5AsMJvvO
 1Ypp3GTpknJsvLbZYj24nCuJKy2F+NQNfG09+4UNOewMmLjLFJYzEG+aKpuIVbOjbgj5
 BsWxUp6RzkoCQ+gmS5KF4tnyUifD8+fXzne57n7wmlK85iexl+wV9LNhWvKSj7mHIFPc
 C3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=8XrBvvp7p2k5XmWyyWIVxNBDKau5mCCJd69EwXm4HNg=;
 b=fJGdFaaMy9IL1+3TuT1EvsTOHOyeVGZ05CQtv9dArPYf8HFQBIywPKyRKlaFq83I0I
 6NaEw5+uF0/CSQOu4G4dIfsss6cGHyPBtfw40rUEvDRj8M2Pbe+DKAtNXMcojAJ1tBTe
 9s47k0EDN9InIHFjxwBVNuWn8Ob1L8asv1VHsq3A4UqeeVPj5CBvop5VKW8QcjoI0Btp
 w3Wimlwtd6fFhMzy2lM0LeQ+UwjUddsRa/Djh9VJUGTk627sEvCVxjAIp2IlPTmoO1kb
 9vyv9o+sRujBw7ij79kZ3jNUn5pn+PD+M6Cdd4CdnEOEWkZoaIcL1sbqJGgLIPB2vPCy
 xvTA==
X-Gm-Message-State: AOAM532Rfs9xhqtJj6QzHyem3mh0Pk5Mo9RGXTV3FBUvZuVC0voXterd
 0nKo/DppkHOGTlFvayraHtB+AJ/Gv82ImuN8vtieRtWS366zAe6355x040GJSQ+qphIp+LUjztq
 L5SoIuk+fCwzUwH7LH8Q6iBPa1bSuVHolkxd60x2JfR8fT8QS1wdi
X-Google-Smtp-Source: ABdhPJyF/+EBLzlQ5oGaTBWqSJfSXbLwy3Po0pSN0qA6Ws/ePrYSiyjhLlgDIcu5mVPpERZBi/EPzv0=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:e459:49a8:64d6:2427])
 (user=dje job=sendgmr) by 2002:a05:6122:1206:: with SMTP id
 v6mr12346709vkc.21.1612835752936; Mon, 08 Feb 2021 17:55:52 -0800 (PST)
Date: Mon,  8 Feb 2021 17:55:41 -0800
In-Reply-To: <20210209015541.778833-1-dje@google.com>
Message-Id: <20210209015541.778833-4-dje@google.com>
Mime-Version: 1.0
References: <20210209015541.778833-1-dje@google.com>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
Subject: [PATCH v3 3/3] tests/qtests: Add npcm7xx emc model test
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hao Wu <wuhaotsh@google.com>, Avi Fishman <avi.fishman@nuvoton.com>, 
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a49;
 envelope-from=3qOshYAMKCg8sytv33v0t.r315t19-stAt0232v29.36v@flex--dje.bounces.google.com;
 helo=mail-vk1-xa49.google.com
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
Reply-to:  Doug Evans <dje@google.com>
From:  Doug Evans via <qemu-devel@nongnu.org>

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Avi Fishman <avi.fishman@nuvoton.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Doug Evans <dje@google.com>
---

Differences from v2:
- remove use of C99 mixed decls/statements

 tests/qtest/meson.build        |   1 +
 tests/qtest/npcm7xx_emc-test.c | 812 +++++++++++++++++++++++++++++++++
 2 files changed, 813 insertions(+)
 create mode 100644 tests/qtest/npcm7xx_emc-test.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c83bc211b6..f7c369f3d5 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -136,6 +136,7 @@ qtests_sparc64 = \
 
 qtests_npcm7xx = \
   ['npcm7xx_adc-test',
+   'npcm7xx_emc-test',
    'npcm7xx_gpio-test',
    'npcm7xx_pwm-test',
    'npcm7xx_rng-test',
diff --git a/tests/qtest/npcm7xx_emc-test.c b/tests/qtest/npcm7xx_emc-test.c
new file mode 100644
index 0000000000..95712dc3b5
--- /dev/null
+++ b/tests/qtest/npcm7xx_emc-test.c
@@ -0,0 +1,812 @@
+/*
+ * QTests for Nuvoton NPCM7xx EMC Modules.
+ *
+ * Copyright 2020 Google LLC
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
+#include "qemu-common.h"
+#include "libqos/libqos.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qnum.h"
+#include "qemu/bitops.h"
+#include "qemu/iov.h"
+
+/* Name of the emc device. */
+#define TYPE_NPCM7XX_EMC "npcm7xx-emc"
+
+/* Timeout for various operations, in seconds. */
+#define TIMEOUT_SECONDS 10
+
+/* Address in memory of the descriptor. */
+#define DESC_ADDR (1 << 20) /* 1 MiB */
+
+/* Address in memory of the data packet. */
+#define DATA_ADDR (DESC_ADDR + 4096)
+
+#define CRC_LENGTH 4
+
+#define NUM_TX_DESCRIPTORS 3
+#define NUM_RX_DESCRIPTORS 2
+
+/* Size of tx,rx test buffers. */
+#define TX_DATA_LEN 64
+#define RX_DATA_LEN 64
+
+#define TX_STEP_COUNT 10000
+#define RX_STEP_COUNT 10000
+
+/* 32-bit register indices. */
+typedef enum NPCM7xxPWMRegister {
+    /* Control registers. */
+    REG_CAMCMR,
+    REG_CAMEN,
+
+    /* There are 16 CAMn[ML] registers. */
+    REG_CAMM_BASE,
+    REG_CAML_BASE,
+
+    REG_TXDLSA = 0x22,
+    REG_RXDLSA,
+    REG_MCMDR,
+    REG_MIID,
+    REG_MIIDA,
+    REG_FFTCR,
+    REG_TSDR,
+    REG_RSDR,
+    REG_DMARFC,
+    REG_MIEN,
+
+    /* Status registers. */
+    REG_MISTA,
+    REG_MGSTA,
+    REG_MPCNT,
+    REG_MRPC,
+    REG_MRPCC,
+    REG_MREPC,
+    REG_DMARFS,
+    REG_CTXDSA,
+    REG_CTXBSA,
+    REG_CRXDSA,
+    REG_CRXBSA,
+
+    NPCM7XX_NUM_EMC_REGS,
+} NPCM7xxPWMRegister;
+
+enum { NUM_CAMML_REGS = 16 };
+
+/* REG_CAMCMR fields */
+/* Enable CAM Compare */
+#define REG_CAMCMR_ECMP (1 << 4)
+/* Accept Unicast Packet */
+#define REG_CAMCMR_AUP (1 << 0)
+
+/* REG_MCMDR fields */
+/* Software Reset */
+#define REG_MCMDR_SWR (1 << 24)
+/* Frame Transmission On */
+#define REG_MCMDR_TXON (1 << 8)
+/* Accept Long Packet */
+#define REG_MCMDR_ALP (1 << 1)
+/* Frame Reception On */
+#define REG_MCMDR_RXON (1 << 0)
+
+/* REG_MIEN fields */
+/* Enable Transmit Completion Interrupt */
+#define REG_MIEN_ENTXCP (1 << 18)
+/* Enable Transmit Interrupt */
+#define REG_MIEN_ENTXINTR (1 << 16)
+/* Enable Receive Good Interrupt */
+#define REG_MIEN_ENRXGD (1 << 4)
+/* ENable Receive Interrupt */
+#define REG_MIEN_ENRXINTR (1 << 0)
+
+/* REG_MISTA fields */
+/* Transmit Bus Error Interrupt */
+#define REG_MISTA_TXBERR (1 << 24)
+/* Transmit Descriptor Unavailable Interrupt */
+#define REG_MISTA_TDU (1 << 23)
+/* Transmit Completion Interrupt */
+#define REG_MISTA_TXCP (1 << 18)
+/* Transmit Interrupt */
+#define REG_MISTA_TXINTR (1 << 16)
+/* Receive Bus Error Interrupt */
+#define REG_MISTA_RXBERR (1 << 11)
+/* Receive Descriptor Unavailable Interrupt */
+#define REG_MISTA_RDU (1 << 10)
+/* DMA Early Notification Interrupt */
+#define REG_MISTA_DENI (1 << 9)
+/* Maximum Frame Length Interrupt */
+#define REG_MISTA_DFOI (1 << 8)
+/* Receive Good Interrupt */
+#define REG_MISTA_RXGD (1 << 4)
+/* Packet Too Long Interrupt */
+#define REG_MISTA_PTLE (1 << 3)
+/* Receive Interrupt */
+#define REG_MISTA_RXINTR (1 << 0)
+
+typedef struct NPCM7xxEMCTxDesc NPCM7xxEMCTxDesc;
+typedef struct NPCM7xxEMCRxDesc NPCM7xxEMCRxDesc;
+
+struct NPCM7xxEMCTxDesc {
+    uint32_t flags;
+    uint32_t txbsa;
+    uint32_t status_and_length;
+    uint32_t ntxdsa;
+};
+
+struct NPCM7xxEMCRxDesc {
+    uint32_t status_and_length;
+    uint32_t rxbsa;
+    uint32_t reserved;
+    uint32_t nrxdsa;
+};
+
+/* NPCM7xxEMCTxDesc.flags values */
+/* Owner: 0 = cpu, 1 = emc */
+#define TX_DESC_FLAG_OWNER_MASK (1 << 31)
+/* Transmit interrupt enable */
+#define TX_DESC_FLAG_INTEN (1 << 2)
+
+/* NPCM7xxEMCTxDesc.status_and_length values */
+/* Transmission complete */
+#define TX_DESC_STATUS_TXCP (1 << 19)
+/* Transmit interrupt */
+#define TX_DESC_STATUS_TXINTR (1 << 16)
+
+/* NPCM7xxEMCRxDesc.status_and_length values */
+/* Owner: 0b00 = cpu, 0b10 = emc */
+#define RX_DESC_STATUS_OWNER_SHIFT 30
+#define RX_DESC_STATUS_OWNER_MASK 0xc0000000
+/* Frame Reception Complete */
+#define RX_DESC_STATUS_RXGD (1 << 20)
+/* Packet too long */
+#define RX_DESC_STATUS_PTLE (1 << 19)
+/* Receive Interrupt */
+#define RX_DESC_STATUS_RXINTR (1 << 16)
+
+#define RX_DESC_PKT_LEN(word) ((uint32_t) (word) & 0xffff)
+
+typedef struct EMCModule {
+    int rx_irq;
+    int tx_irq;
+    uint64_t base_addr;
+} EMCModule;
+
+typedef struct TestData {
+    const EMCModule *module;
+} TestData;
+
+static const EMCModule emc_module_list[] = {
+    {
+        .rx_irq     = 15,
+        .tx_irq     = 16,
+        .base_addr  = 0xf0825000
+    },
+    {
+        .rx_irq     = 114,
+        .tx_irq     = 115,
+        .base_addr  = 0xf0826000
+    }
+};
+
+/* Returns the index of the EMC module. */
+static int emc_module_index(const EMCModule *mod)
+{
+    ptrdiff_t diff = mod - emc_module_list;
+
+    g_assert_true(diff >= 0 && diff < ARRAY_SIZE(emc_module_list));
+
+    return diff;
+}
+
+static void packet_test_clear(void *sockets)
+{
+    int *test_sockets = sockets;
+
+    close(test_sockets[0]);
+    g_free(test_sockets);
+}
+
+static int *packet_test_init(int module_num, GString *cmd_line)
+{
+    int *test_sockets = g_new(int, 2);
+    int ret = socketpair(PF_UNIX, SOCK_STREAM, 0, test_sockets);
+    g_assert_cmpint(ret, != , -1);
+
+    /*
+     * KISS and use -nic. We specify two nics (both emc{0,1}) because there's
+     * currently no way to specify only emc1: The driver implicitly relies on
+     * emc[i] == nd_table[i].
+     */
+    if (module_num == 0) {
+        g_string_append_printf(cmd_line,
+                               " -nic socket,fd=%d,model=" TYPE_NPCM7XX_EMC " "
+                               " -nic user,model=" TYPE_NPCM7XX_EMC " ",
+                               test_sockets[1]);
+    } else {
+        g_string_append_printf(cmd_line,
+                               " -nic user,model=" TYPE_NPCM7XX_EMC " "
+                               " -nic socket,fd=%d,model=" TYPE_NPCM7XX_EMC " ",
+                               test_sockets[1]);
+    }
+
+    g_test_queue_destroy(packet_test_clear, test_sockets);
+    return test_sockets;
+}
+
+static uint32_t emc_read(QTestState *qts, const EMCModule *mod,
+        NPCM7xxPWMRegister regno)
+{
+    return qtest_readl(qts, mod->base_addr + regno * sizeof(uint32_t));
+}
+
+static void emc_write(QTestState *qts, const EMCModule *mod,
+        NPCM7xxPWMRegister regno, uint32_t value)
+{
+    qtest_writel(qts, mod->base_addr + regno * sizeof(uint32_t), value);
+}
+
+/*
+ * Reset the EMC module.
+ * The module must be reset before, e.g., TXDLSA,RXDLSA are changed.
+ */
+static bool emc_soft_reset(QTestState *qts, const EMCModule *mod)
+{
+    uint32_t val;
+    uint64_t end_time;
+
+    emc_write(qts, mod, REG_MCMDR, REG_MCMDR_SWR);
+
+    /*
+     * Wait for device to reset as the linux driver does.
+     * During reset the AHB reads 0 for all registers. So first wait for
+     * something that resets to non-zero, and then wait for SWR becoming 0.
+     */
+    end_time = g_get_monotonic_time() + TIMEOUT_SECONDS * G_TIME_SPAN_SECOND;
+
+    do {
+        qtest_clock_step(qts, 100);
+        val = emc_read(qts, mod, REG_FFTCR);
+    } while (val == 0 && g_get_monotonic_time() < end_time);
+    if (val != 0) {
+        do {
+            qtest_clock_step(qts, 100);
+            val = emc_read(qts, mod, REG_MCMDR);
+            if ((val & REG_MCMDR_SWR) == 0) {
+                /*
+                 * N.B. The CAMs have been reset here, so macaddr matching of
+                 * incoming packets will not work.
+                 */
+                return true;
+            }
+        } while (g_get_monotonic_time() < end_time);
+    }
+
+    g_message("%s: Timeout expired", __func__);
+    return false;
+}
+
+/* Check emc registers are reset to default value. */
+static void test_init(gconstpointer test_data)
+{
+    const TestData *td = test_data;
+    const EMCModule *mod = td->module;
+    QTestState *qts = qtest_init("-machine quanta-gsj");
+    int i;
+
+#define CHECK_REG(regno, value) \
+  do { \
+    g_assert_cmphex(emc_read(qts, mod, (regno)), ==, (value)); \
+  } while (0)
+
+    CHECK_REG(REG_CAMCMR, 0);
+    CHECK_REG(REG_CAMEN, 0);
+    CHECK_REG(REG_TXDLSA, 0xfffffffc);
+    CHECK_REG(REG_RXDLSA, 0xfffffffc);
+    CHECK_REG(REG_MCMDR, 0);
+    CHECK_REG(REG_MIID, 0);
+    CHECK_REG(REG_MIIDA, 0x00900000);
+    CHECK_REG(REG_FFTCR, 0x0101);
+    CHECK_REG(REG_DMARFC, 0x0800);
+    CHECK_REG(REG_MIEN, 0);
+    CHECK_REG(REG_MISTA, 0);
+    CHECK_REG(REG_MGSTA, 0);
+    CHECK_REG(REG_MPCNT, 0x7fff);
+    CHECK_REG(REG_MRPC, 0);
+    CHECK_REG(REG_MRPCC, 0);
+    CHECK_REG(REG_MREPC, 0);
+    CHECK_REG(REG_DMARFS, 0);
+    CHECK_REG(REG_CTXDSA, 0);
+    CHECK_REG(REG_CTXBSA, 0);
+    CHECK_REG(REG_CRXDSA, 0);
+    CHECK_REG(REG_CRXBSA, 0);
+
+#undef CHECK_REG
+
+    for (i = 0; i < NUM_CAMML_REGS; ++i) {
+        g_assert_cmpuint(emc_read(qts, mod, REG_CAMM_BASE + i * 2), ==,
+                         0);
+        g_assert_cmpuint(emc_read(qts, mod, REG_CAML_BASE + i * 2), ==,
+                         0);
+    }
+
+    qtest_quit(qts);
+}
+
+static bool emc_wait_irq(QTestState *qts, const EMCModule *mod, int step,
+                         bool is_tx)
+{
+    uint64_t end_time =
+        g_get_monotonic_time() + TIMEOUT_SECONDS * G_TIME_SPAN_SECOND;
+
+    do {
+        if (qtest_get_irq(qts, is_tx ? mod->tx_irq : mod->rx_irq)) {
+            return true;
+        }
+        qtest_clock_step(qts, step);
+    } while (g_get_monotonic_time() < end_time);
+
+    g_message("%s: Timeout expired", __func__);
+    return false;
+}
+
+static bool emc_wait_mista(QTestState *qts, const EMCModule *mod, int step,
+                           uint32_t flag)
+{
+    uint64_t end_time =
+        g_get_monotonic_time() + TIMEOUT_SECONDS * G_TIME_SPAN_SECOND;
+
+    do {
+        uint32_t mista = emc_read(qts, mod, REG_MISTA);
+        if (mista & flag) {
+            return true;
+        }
+        qtest_clock_step(qts, step);
+    } while (g_get_monotonic_time() < end_time);
+
+    g_message("%s: Timeout expired", __func__);
+    return false;
+}
+
+static bool wait_socket_readable(int fd)
+{
+    fd_set read_fds;
+    struct timeval tv;
+    int rv;
+
+    FD_ZERO(&read_fds);
+    FD_SET(fd, &read_fds);
+    tv.tv_sec = TIMEOUT_SECONDS;
+    tv.tv_usec = 0;
+    rv = select(fd + 1, &read_fds, NULL, NULL, &tv);
+    if (rv == -1) {
+        perror("select");
+    } else if (rv == 0) {
+        g_message("%s: Timeout expired", __func__);
+    }
+    return rv == 1;
+}
+
+static void init_tx_desc(NPCM7xxEMCTxDesc *desc, size_t count,
+                         uint32_t desc_addr)
+{
+    g_assert(count >= 2);
+    memset(&desc[0], 0, sizeof(*desc) * count);
+    /* Leave the last one alone, owned by the cpu -> stops transmission. */
+    for (size_t i = 0; i < count - 1; ++i) {
+        desc[i].flags =
+            cpu_to_le32(TX_DESC_FLAG_OWNER_MASK | /* owner = 1: emc */
+                        TX_DESC_FLAG_INTEN |
+                        0 | /* crc append = 0 */
+                        0 /* padding enable = 0 */);
+        desc[i].status_and_length =
+            cpu_to_le32(0 | /* collision count = 0 */
+                        0 | /* SQE = 0 */
+                        0 | /* PAU = 0 */
+                        0 | /* TXHA = 0 */
+                        0 | /* LC = 0 */
+                        0 | /* TXABT = 0 */
+                        0 | /* NCS = 0 */
+                        0 | /* EXDEF = 0 */
+                        0 | /* TXCP = 0 */
+                        0 | /* DEF = 0 */
+                        0 | /* TXINTR = 0 */
+                        0 /* length filled in later */);
+        desc[i].ntxdsa = cpu_to_le32(desc_addr + (i + 1) * sizeof(*desc));
+    }
+}
+
+static void enable_tx(QTestState *qts, const EMCModule *mod,
+                      const NPCM7xxEMCTxDesc *desc, size_t count,
+                      uint32_t desc_addr, uint32_t mien_flags)
+{
+    /* Write the descriptors to guest memory. */
+    qtest_memwrite(qts, desc_addr, desc, sizeof(*desc) * count);
+
+    /* Trigger sending the packet. */
+    /* The module must be reset before changing TXDLSA. */
+    g_assert(emc_soft_reset(qts, mod));
+    emc_write(qts, mod, REG_TXDLSA, desc_addr);
+    emc_write(qts, mod, REG_CTXDSA, ~0);
+    emc_write(qts, mod, REG_MIEN, REG_MIEN_ENTXCP | mien_flags);
+    {
+        uint32_t mcmdr = emc_read(qts, mod, REG_MCMDR);
+        mcmdr |= REG_MCMDR_TXON;
+        emc_write(qts, mod, REG_MCMDR, mcmdr);
+    }
+
+    /* Prod the device to send the packet. */
+    emc_write(qts, mod, REG_TSDR, 1);
+}
+
+static void emc_send_verify1(QTestState *qts, const EMCModule *mod, int fd,
+                             bool with_irq, uint32_t desc_addr,
+                             uint32_t next_desc_addr,
+                             const char *test_data, int test_size)
+{
+    NPCM7xxEMCTxDesc result_desc;
+    uint32_t expected_mask, expected_value, recv_len;
+    int ret;
+    char buffer[TX_DATA_LEN];
+
+    g_assert(wait_socket_readable(fd));
+
+    /* Read the descriptor back. */
+    qtest_memread(qts, desc_addr, &result_desc, sizeof(result_desc));
+    /* Descriptor should be owned by cpu now. */
+    g_assert((result_desc.flags & TX_DESC_FLAG_OWNER_MASK) == 0);
+    /* Test the status bits, ignoring the length field. */
+    expected_mask = 0xffff << 16;
+    expected_value = TX_DESC_STATUS_TXCP;
+    if (with_irq) {
+        expected_value |= TX_DESC_STATUS_TXINTR;
+    }
+    g_assert_cmphex((result_desc.status_and_length & expected_mask), ==,
+                    expected_value);
+
+    /* Check data sent to the backend. */
+    recv_len = ~0;
+    ret = qemu_recv(fd, &recv_len, sizeof(recv_len), MSG_DONTWAIT);
+    g_assert_cmpint(ret, == , sizeof(recv_len));
+
+    g_assert(wait_socket_readable(fd));
+    memset(buffer, 0xff, sizeof(buffer));
+    ret = qemu_recv(fd, buffer, test_size, MSG_DONTWAIT);
+    g_assert_cmpmem(buffer, ret, test_data, test_size);
+}
+
+static void emc_send_verify(QTestState *qts, const EMCModule *mod, int fd,
+                            bool with_irq)
+{
+    NPCM7xxEMCTxDesc desc[NUM_TX_DESCRIPTORS];
+    uint32_t desc_addr = DESC_ADDR;
+    static const char test1_data[] = "TEST1";
+    static const char test2_data[] = "Testing 1 2 3 ...";
+    uint32_t data1_addr = DATA_ADDR;
+    uint32_t data2_addr = data1_addr + sizeof(test1_data);
+    bool got_tdu;
+    uint32_t end_desc_addr;
+
+    /* Prepare test data buffer. */
+    qtest_memwrite(qts, data1_addr, test1_data, sizeof(test1_data));
+    qtest_memwrite(qts, data2_addr, test2_data, sizeof(test2_data));
+
+    init_tx_desc(&desc[0], NUM_TX_DESCRIPTORS, desc_addr);
+    desc[0].txbsa = cpu_to_le32(data1_addr);
+    desc[0].status_and_length |= sizeof(test1_data);
+    desc[1].txbsa = cpu_to_le32(data2_addr);
+    desc[1].status_and_length |= sizeof(test2_data);
+
+    enable_tx(qts, mod, &desc[0], NUM_TX_DESCRIPTORS, desc_addr,
+              with_irq ? REG_MIEN_ENTXINTR : 0);
+
+    /*
+     * It's problematic to observe the interrupt for each packet.
+     * Instead just wait until all the packets go out.
+     */
+    got_tdu = false;
+    while (!got_tdu) {
+        if (with_irq) {
+            g_assert_true(emc_wait_irq(qts, mod, TX_STEP_COUNT,
+                                       /*is_tx=*/true));
+        } else {
+            g_assert_true(emc_wait_mista(qts, mod, TX_STEP_COUNT,
+                                         REG_MISTA_TXINTR));
+        }
+        got_tdu = !!(emc_read(qts, mod, REG_MISTA) & REG_MISTA_TDU);
+        /* If we don't have TDU yet, reset the interrupt. */
+        if (!got_tdu) {
+            emc_write(qts, mod, REG_MISTA,
+                      emc_read(qts, mod, REG_MISTA) & 0xffff0000);
+        }
+    }
+
+    end_desc_addr = desc_addr + 2 * sizeof(desc[0]);
+    g_assert_cmphex(emc_read(qts, mod, REG_CTXDSA), ==, end_desc_addr);
+    g_assert_cmphex(emc_read(qts, mod, REG_MISTA), ==,
+                    REG_MISTA_TXCP | REG_MISTA_TXINTR | REG_MISTA_TDU);
+
+    emc_send_verify1(qts, mod, fd, with_irq,
+                     desc_addr, end_desc_addr,
+                     test1_data, sizeof(test1_data));
+    emc_send_verify1(qts, mod, fd, with_irq,
+                     desc_addr + sizeof(desc[0]), end_desc_addr,
+                     test2_data, sizeof(test2_data));
+}
+
+static void init_rx_desc(NPCM7xxEMCRxDesc *desc, size_t count,
+                         uint32_t desc_addr, uint32_t data_addr)
+{
+    g_assert_true(count >= 2);
+    memset(desc, 0, sizeof(*desc) * count);
+    desc[0].rxbsa = cpu_to_le32(data_addr);
+    desc[0].status_and_length =
+        cpu_to_le32(0b10 << RX_DESC_STATUS_OWNER_SHIFT | /* owner = 10: emc */
+                    0 | /* RP = 0 */
+                    0 | /* ALIE = 0 */
+                    0 | /* RXGD = 0 */
+                    0 | /* PTLE = 0 */
+                    0 | /* CRCE = 0 */
+                    0 | /* RXINTR = 0 */
+                    0   /* length (filled in later) */);
+    /* Leave the last one alone, owned by the cpu -> stops transmission. */
+    desc[0].nrxdsa = cpu_to_le32(desc_addr + sizeof(*desc));
+}
+
+static void enable_rx(QTestState *qts, const EMCModule *mod,
+                      const NPCM7xxEMCRxDesc *desc, size_t count,
+                      uint32_t desc_addr, uint32_t mien_flags,
+                      uint32_t mcmdr_flags)
+{
+    /*
+     * Write the descriptor to guest memory.
+     * FWIW, IWBN if the docs said the buffer needs to be at least DMARFC
+     * bytes.
+     */
+    qtest_memwrite(qts, desc_addr, desc, sizeof(*desc) * count);
+
+    /* Trigger receiving the packet. */
+    /* The module must be reset before changing RXDLSA. */
+    g_assert(emc_soft_reset(qts, mod));
+    emc_write(qts, mod, REG_RXDLSA, desc_addr);
+    emc_write(qts, mod, REG_MIEN, REG_MIEN_ENRXGD | mien_flags);
+
+    /*
+     * We don't know what the device's macaddr is, so just accept all
+     * unicast packets (AUP).
+     */
+    emc_write(qts, mod, REG_CAMCMR, REG_CAMCMR_AUP);
+    emc_write(qts, mod, REG_CAMEN, 1 << 0);
+    {
+        uint32_t mcmdr = emc_read(qts, mod, REG_MCMDR);
+        mcmdr |= REG_MCMDR_RXON | mcmdr_flags;
+        emc_write(qts, mod, REG_MCMDR, mcmdr);
+    }
+
+    /* Prod the device to accept a packet. */
+    emc_write(qts, mod, REG_RSDR, 1);
+}
+
+static void emc_recv_verify(QTestState *qts, const EMCModule *mod, int fd,
+                            bool with_irq)
+{
+    NPCM7xxEMCRxDesc desc[NUM_RX_DESCRIPTORS];
+    uint32_t desc_addr = DESC_ADDR;
+    uint32_t data_addr = DATA_ADDR;
+    int ret;
+    uint32_t expected_mask, expected_value;
+    NPCM7xxEMCRxDesc result_desc;
+
+    /* Prepare test data buffer. */
+    const char test[RX_DATA_LEN] = "TEST";
+    int len = htonl(sizeof(test));
+    const struct iovec iov[] = {
+        {
+            .iov_base = &len,
+            .iov_len = sizeof(len),
+        },{
+            .iov_base = (char *) test,
+            .iov_len = sizeof(test),
+        },
+    };
+
+    /*
+     * Reset the device BEFORE sending a test packet, otherwise the packet
+     * may get swallowed by an active device of an earlier test.
+     */
+    init_rx_desc(&desc[0], NUM_RX_DESCRIPTORS, desc_addr, data_addr);
+    enable_rx(qts, mod, &desc[0], NUM_RX_DESCRIPTORS, desc_addr,
+              with_irq ? REG_MIEN_ENRXINTR : 0, 0);
+
+    /* Send test packet to device's socket. */
+    ret = iov_send(fd, iov, 2, 0, sizeof(len) + sizeof(test));
+    g_assert_cmpint(ret, == , sizeof(test) + sizeof(len));
+
+    /* Wait for RX interrupt. */
+    if (with_irq) {
+        g_assert_true(emc_wait_irq(qts, mod, RX_STEP_COUNT, /*is_tx=*/false));
+    } else {
+        g_assert_true(emc_wait_mista(qts, mod, RX_STEP_COUNT, REG_MISTA_RXGD));
+    }
+
+    g_assert_cmphex(emc_read(qts, mod, REG_CRXDSA), ==,
+                    desc_addr + sizeof(desc[0]));
+
+    expected_mask = 0xffff;
+    expected_value = (REG_MISTA_DENI |
+                      REG_MISTA_RXGD |
+                      REG_MISTA_RXINTR);
+    g_assert_cmphex((emc_read(qts, mod, REG_MISTA) & expected_mask),
+                    ==, expected_value);
+
+    /* Read the descriptor back. */
+    qtest_memread(qts, desc_addr, &result_desc, sizeof(result_desc));
+    /* Descriptor should be owned by cpu now. */
+    g_assert((result_desc.status_and_length & RX_DESC_STATUS_OWNER_MASK) == 0);
+    /* Test the status bits, ignoring the length field. */
+    expected_mask = 0xffff << 16;
+    expected_value = RX_DESC_STATUS_RXGD;
+    if (with_irq) {
+        expected_value |= RX_DESC_STATUS_RXINTR;
+    }
+    g_assert_cmphex((result_desc.status_and_length & expected_mask), ==,
+                    expected_value);
+    g_assert_cmpint(RX_DESC_PKT_LEN(result_desc.status_and_length), ==,
+                    RX_DATA_LEN + CRC_LENGTH);
+
+    {
+        char buffer[RX_DATA_LEN];
+        qtest_memread(qts, data_addr, buffer, sizeof(buffer));
+        g_assert_cmpstr(buffer, == , "TEST");
+    }
+}
+
+static void emc_test_ptle(QTestState *qts, const EMCModule *mod, int fd)
+{
+    NPCM7xxEMCRxDesc desc[NUM_RX_DESCRIPTORS];
+    uint32_t desc_addr = DESC_ADDR;
+    uint32_t data_addr = DATA_ADDR;
+    int ret;
+    NPCM7xxEMCRxDesc result_desc;
+    uint32_t expected_mask, expected_value;
+
+    /* Prepare test data buffer. */
+#define PTLE_DATA_LEN 1600
+    char test_data[PTLE_DATA_LEN];
+    int len = htonl(sizeof(test_data));
+    const struct iovec iov[] = {
+        {
+            .iov_base = &len,
+            .iov_len = sizeof(len),
+        },{
+            .iov_base = (char *) test_data,
+            .iov_len = sizeof(test_data),
+        },
+    };
+    memset(test_data, 42, sizeof(test_data));
+
+    /*
+     * Reset the device BEFORE sending a test packet, otherwise the packet
+     * may get swallowed by an active device of an earlier test.
+     */
+    init_rx_desc(&desc[0], NUM_RX_DESCRIPTORS, desc_addr, data_addr);
+    enable_rx(qts, mod, &desc[0], NUM_RX_DESCRIPTORS, desc_addr,
+              REG_MIEN_ENRXINTR, REG_MCMDR_ALP);
+
+    /* Send test packet to device's socket. */
+    ret = iov_send(fd, iov, 2, 0, sizeof(len) + sizeof(test_data));
+    g_assert_cmpint(ret, == , sizeof(test_data) + sizeof(len));
+
+    /* Wait for RX interrupt. */
+    g_assert_true(emc_wait_irq(qts, mod, RX_STEP_COUNT, /*is_tx=*/false));
+
+    /* Read the descriptor back. */
+    qtest_memread(qts, desc_addr, &result_desc, sizeof(result_desc));
+    /* Descriptor should be owned by cpu now. */
+    g_assert((result_desc.status_and_length & RX_DESC_STATUS_OWNER_MASK) == 0);
+    /* Test the status bits, ignoring the length field. */
+    expected_mask = 0xffff << 16;
+    expected_value = (RX_DESC_STATUS_RXGD |
+                      RX_DESC_STATUS_PTLE |
+                      RX_DESC_STATUS_RXINTR);
+    g_assert_cmphex((result_desc.status_and_length & expected_mask), ==,
+                    expected_value);
+    g_assert_cmpint(RX_DESC_PKT_LEN(result_desc.status_and_length), ==,
+                    PTLE_DATA_LEN + CRC_LENGTH);
+
+    {
+        char buffer[PTLE_DATA_LEN];
+        qtest_memread(qts, data_addr, buffer, sizeof(buffer));
+        g_assert(memcmp(buffer, test_data, PTLE_DATA_LEN) == 0);
+    }
+}
+
+static void test_tx(gconstpointer test_data)
+{
+    const TestData *td = test_data;
+    GString *cmd_line = g_string_new("-machine quanta-gsj");
+    int *test_sockets = packet_test_init(emc_module_index(td->module),
+                                         cmd_line);
+    QTestState *qts = qtest_init(cmd_line->str);
+
+    /*
+     * TODO: For pedantic correctness test_sockets[0] should be closed after
+     * the fork and before the exec, but that will require some harness
+     * improvements.
+     */
+    close(test_sockets[1]);
+    /* Defensive programming */
+    test_sockets[1] = -1;
+
+    qtest_irq_intercept_in(qts, "/machine/soc/a9mpcore/gic");
+
+    emc_send_verify(qts, td->module, test_sockets[0], /*with_irq=*/false);
+    emc_send_verify(qts, td->module, test_sockets[0], /*with_irq=*/true);
+
+    qtest_quit(qts);
+}
+
+static void test_rx(gconstpointer test_data)
+{
+    const TestData *td = test_data;
+    GString *cmd_line = g_string_new("-machine quanta-gsj");
+    int *test_sockets = packet_test_init(emc_module_index(td->module),
+                                         cmd_line);
+    QTestState *qts = qtest_init(cmd_line->str);
+
+    /*
+     * TODO: For pedantic correctness test_sockets[0] should be closed after
+     * the fork and before the exec, but that will require some harness
+     * improvements.
+     */
+    close(test_sockets[1]);
+    /* Defensive programming */
+    test_sockets[1] = -1;
+
+    qtest_irq_intercept_in(qts, "/machine/soc/a9mpcore/gic");
+
+    emc_recv_verify(qts, td->module, test_sockets[0], /*with_irq=*/false);
+    emc_recv_verify(qts, td->module, test_sockets[0], /*with_irq=*/true);
+    emc_test_ptle(qts, td->module, test_sockets[0]);
+
+    qtest_quit(qts);
+}
+
+static void emc_add_test(const char *name, const TestData* td,
+        GTestDataFunc fn)
+{
+    g_autofree char *full_name = g_strdup_printf(
+            "npcm7xx_emc/emc[%d]/%s", emc_module_index(td->module), name);
+    qtest_add_data_func(full_name, td, fn);
+}
+#define add_test(name, td) emc_add_test(#name, td, test_##name)
+
+int main(int argc, char **argv)
+{
+    TestData test_data_list[ARRAY_SIZE(emc_module_list)];
+
+    g_test_init(&argc, &argv, NULL);
+
+    for (int i = 0; i < ARRAY_SIZE(emc_module_list); ++i) {
+        TestData *td = &test_data_list[i];
+
+        td->module = &emc_module_list[i];
+
+        add_test(init, td);
+        add_test(tx, td);
+        add_test(rx, td);
+    }
+
+    return g_test_run();
+}
-- 
2.30.0.478.g8a0d178c01-goog


