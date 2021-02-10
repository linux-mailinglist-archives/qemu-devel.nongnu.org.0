Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F99317316
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:16:56 +0100 (CET)
Received: from localhost ([::1]:57636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9xn5-0001QL-HA
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:16:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3f1gkYAgKCsgA8vo276vu22uzs.q204s08-rs9sz121u18.25u@flex--wuhaotsh.bounces.google.com>)
 id 1l9xbt-0000nJ-Hg
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:05:22 -0500
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:54821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3f1gkYAgKCsgA8vo276vu22uzs.q204s08-rs9sz121u18.25u@flex--wuhaotsh.bounces.google.com>)
 id 1l9xbP-0000lh-Gf
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:05:21 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id 11so4038390ybl.21
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=lkJaFs3WnULhgRItfWvZTgWe9bxQXhY3fXEQi+JNkSE=;
 b=H5bVe/XK7iYP2RJMPo6CPeifYPHA1LJZBdCRAoeZ+rD6nZfJWrfp3TQhC4w/IMpNTP
 Z46/aIvsHqnt98iuzyHrkYnHCq+EATF3WE/YGSFFmVnEpMoB9+bazc1W/znT/fEG9Pre
 a2ttsgr/0vgKX6XdjAuMUka7Qr7TJ2vDjgF97rcjiUdcy37amMC7hgbcIkY3gWcnYiPu
 z7qrkEE8aRnCD6NDKV8ekueuibfM+DfcAED/CnSBgwoQms0ilmfyKup7O0gn1/y4EtN4
 idUtvkXexAg0ECh2sa6k4BhT8JQRF0ZYwibinZG43ESfuZpjnKCDGNKeHT2U3tjDsGEM
 xCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=lkJaFs3WnULhgRItfWvZTgWe9bxQXhY3fXEQi+JNkSE=;
 b=uMqDfl7UoMCCPZfNpitGJdi1XFhOiZV1X4O9RrsiiY5keeXSnJvMKrHSTZyEbKWNv0
 xYWy5Lf/eFQFC/4CGX91NvqHapxb6k1rb/vLsFwURpoGxEoN3nIWjf/H6ggc6TLyzPfG
 o+8xaBVNpDAamMQ/7O0CY0UCiv1qLRtNeeKjCMdS6KZkuM8t54GhYMrHS2hv8RASNWOP
 xK0MCzsjCfxIA/vX5BbX4znHR20/lRf1s25ePqDyyXBl6qxlN2+XM9AMxTzJlxkU3g4s
 E91ZV7kf2gh9Abk5qaDGo4w5QhyH5N0rNDGp6O+ZuhDW4ezhGVozwG6nuawjrWz5foGw
 fj1Q==
X-Gm-Message-State: AOAM531oxRuTevEDvl75uzfVDNSMmWRZdJyD5b5KitFfqPJdJfaX5hAP
 WR72wU7KH50l/QSyc/hKJ94BkhSFSD4sZA==
X-Google-Smtp-Source: ABdhPJw+xR8kypj37D4V+r65cvcqWuO9a/wRsU+gUNb/ifJvATsjVIfAHysPlWWBZGUeiDGhZpg1pBETAj1wUA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a25:800f:: with SMTP id
 m15mr6990666ybk.325.1612994687586; Wed, 10 Feb 2021 14:04:47 -0800 (PST)
Date: Wed, 10 Feb 2021 14:04:26 -0800
In-Reply-To: <20210210220426.3577804-1-wuhaotsh@google.com>
Message-Id: <20210210220426.3577804-6-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210210220426.3577804-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
Subject: [PATCH v3 5/5] hw/i2c: Implement NPCM7XX SMBus Module FIFO Mode
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 venture@google.com, dje@google.com, cminyard@mvista.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3f1gkYAgKCsgA8vo276vu22uzs.q204s08-rs9sz121u18.25u@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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
Reply-to:  Hao Wu <wuhaotsh@google.com>
From:  Hao Wu via <qemu-devel@nongnu.org>

This patch implements the FIFO mode of the SMBus module. In FIFO, the
user transmits or receives at most 16 bytes at a time. The FIFO mode
allows the module to transmit large amount of data faster than single
byte mode.

Since we only added the device in a patch that is only a few commits
away in the same patch set. We do not increase the VMstate version
number in this special case.

Reviewed-by: Doug Evans<dje@google.com>
Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Corey Minyard <cminyard@mvista.com>
Ack-by: Corey Minyard <cminyard@mvista.com>

diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
index a465740623..6b2f9e1aaa 100644
--- a/hw/i2c/npcm7xx_smbus.c
+++ b/hw/i2c/npcm7xx_smbus.c
@@ -129,14 +129,45 @@ enum NPCM7xxSMBusBank1Register {
 #define NPCM7XX_ADDR_EN             BIT(7)
 #define NPCM7XX_ADDR_A(rv)          extract8((rv), 0, 6)
 
+/* FIFO Mode Register Fields */
+/* FIF_CTL fields */
+#define NPCM7XX_SMBFIF_CTL_FIFO_EN          BIT(4)
+#define NPCM7XX_SMBFIF_CTL_FAIR_RDY_IE      BIT(2)
+#define NPCM7XX_SMBFIF_CTL_FAIR_RDY         BIT(1)
+#define NPCM7XX_SMBFIF_CTL_FAIR_BUSY        BIT(0)
+/* FIF_CTS fields */
+#define NPCM7XX_SMBFIF_CTS_STR              BIT(7)
+#define NPCM7XX_SMBFIF_CTS_CLR_FIFO         BIT(6)
+#define NPCM7XX_SMBFIF_CTS_RFTE_IE          BIT(3)
+#define NPCM7XX_SMBFIF_CTS_RXF_TXE          BIT(1)
+/* TXF_CTL fields */
+#define NPCM7XX_SMBTXF_CTL_THR_TXIE         BIT(6)
+#define NPCM7XX_SMBTXF_CTL_TX_THR(rv)       extract8((rv), 0, 5)
+/* T_OUT fields */
+#define NPCM7XX_SMBT_OUT_ST                 BIT(7)
+#define NPCM7XX_SMBT_OUT_IE                 BIT(6)
+#define NPCM7XX_SMBT_OUT_CLKDIV(rv)         extract8((rv), 0, 6)
+/* TXF_STS fields */
+#define NPCM7XX_SMBTXF_STS_TX_THST          BIT(6)
+#define NPCM7XX_SMBTXF_STS_TX_BYTES(rv)     extract8((rv), 0, 5)
+/* RXF_STS fields */
+#define NPCM7XX_SMBRXF_STS_RX_THST          BIT(6)
+#define NPCM7XX_SMBRXF_STS_RX_BYTES(rv)     extract8((rv), 0, 5)
+/* RXF_CTL fields */
+#define NPCM7XX_SMBRXF_CTL_THR_RXIE         BIT(6)
+#define NPCM7XX_SMBRXF_CTL_LAST             BIT(5)
+#define NPCM7XX_SMBRXF_CTL_RX_THR(rv)       extract8((rv), 0, 5)
+
 #define KEEP_OLD_BIT(o, n, b)       (((n) & (~(b))) | ((o) & (b)))
 #define WRITE_ONE_CLEAR(o, n, b)    ((n) & (b) ? (o) & (~(b)) : (o))
 
 #define NPCM7XX_SMBUS_ENABLED(s)    ((s)->ctl2 & NPCM7XX_SMBCTL2_ENABLE)
+#define NPCM7XX_SMBUS_FIFO_ENABLED(s) ((s)->fif_ctl & \
+                                       NPCM7XX_SMBFIF_CTL_FIFO_EN)
 
 /* VERSION fields values, read-only. */
 #define NPCM7XX_SMBUS_VERSION_NUMBER 1
-#define NPCM7XX_SMBUS_VERSION_FIFO_SUPPORTED 0
+#define NPCM7XX_SMBUS_VERSION_FIFO_SUPPORTED 1
 
 /* Reset values */
 #define NPCM7XX_SMB_ST_INIT_VAL     0x00
@@ -151,6 +182,14 @@ enum NPCM7xxSMBusBank1Register {
 #define NPCM7XX_SMB_ADDR_INIT_VAL   0x00
 #define NPCM7XX_SMB_SCLLT_INIT_VAL  0x00
 #define NPCM7XX_SMB_SCLHT_INIT_VAL  0x00
+#define NPCM7XX_SMB_FIF_CTL_INIT_VAL 0x00
+#define NPCM7XX_SMB_FIF_CTS_INIT_VAL 0x00
+#define NPCM7XX_SMB_FAIR_PER_INIT_VAL 0x00
+#define NPCM7XX_SMB_TXF_CTL_INIT_VAL 0x00
+#define NPCM7XX_SMB_T_OUT_INIT_VAL 0x3f
+#define NPCM7XX_SMB_TXF_STS_INIT_VAL 0x00
+#define NPCM7XX_SMB_RXF_STS_INIT_VAL 0x00
+#define NPCM7XX_SMB_RXF_CTL_INIT_VAL 0x01
 
 static uint8_t npcm7xx_smbus_get_version(void)
 {
@@ -171,7 +210,13 @@ static void npcm7xx_smbus_update_irq(NPCM7xxSMBusState *s)
                    (s->ctl1 & NPCM7XX_SMBCTL1_STASTRE &&
                     s->st & NPCM7XX_SMBST_SDAST) ||
                    (s->ctl1 & NPCM7XX_SMBCTL1_EOBINTE &&
-                    s->cst3 & NPCM7XX_SMBCST3_EO_BUSY));
+                    s->cst3 & NPCM7XX_SMBCST3_EO_BUSY) ||
+                   (s->rxf_ctl & NPCM7XX_SMBRXF_CTL_THR_RXIE &&
+                    s->rxf_sts & NPCM7XX_SMBRXF_STS_RX_THST) ||
+                   (s->txf_ctl & NPCM7XX_SMBTXF_CTL_THR_TXIE &&
+                    s->txf_sts & NPCM7XX_SMBTXF_STS_TX_THST) ||
+                   (s->fif_cts & NPCM7XX_SMBFIF_CTS_RFTE_IE &&
+                    s->fif_cts & NPCM7XX_SMBFIF_CTS_RXF_TXE));
 
         if (level) {
             s->cst2 |= NPCM7XX_SMBCST2_INTSTS;
@@ -189,6 +234,13 @@ static void npcm7xx_smbus_nack(NPCM7xxSMBusState *s)
     s->status = NPCM7XX_SMBUS_STATUS_NEGACK;
 }
 
+static void npcm7xx_smbus_clear_buffer(NPCM7xxSMBusState *s)
+{
+    s->fif_cts &= ~NPCM7XX_SMBFIF_CTS_RXF_TXE;
+    s->txf_sts = 0;
+    s->rxf_sts = 0;
+}
+
 static void npcm7xx_smbus_send_byte(NPCM7xxSMBusState *s, uint8_t value)
 {
     int rv = i2c_send(s->bus, value);
@@ -197,6 +249,15 @@ static void npcm7xx_smbus_send_byte(NPCM7xxSMBusState *s, uint8_t value)
         npcm7xx_smbus_nack(s);
     } else {
         s->st |= NPCM7XX_SMBST_SDAST;
+        if (NPCM7XX_SMBUS_FIFO_ENABLED(s)) {
+            s->fif_cts |= NPCM7XX_SMBFIF_CTS_RXF_TXE;
+            if (NPCM7XX_SMBTXF_STS_TX_BYTES(s->txf_sts) ==
+                NPCM7XX_SMBTXF_CTL_TX_THR(s->txf_ctl)) {
+                s->txf_sts = NPCM7XX_SMBTXF_STS_TX_THST;
+            } else {
+                s->txf_sts = 0;
+            }
+        }
     }
     trace_npcm7xx_smbus_send_byte((DEVICE(s)->canonical_path), value, !rv);
     npcm7xx_smbus_update_irq(s);
@@ -215,6 +276,67 @@ static void npcm7xx_smbus_recv_byte(NPCM7xxSMBusState *s)
     npcm7xx_smbus_update_irq(s);
 }
 
+static void npcm7xx_smbus_recv_fifo(NPCM7xxSMBusState *s)
+{
+    uint8_t expected_bytes = NPCM7XX_SMBRXF_CTL_RX_THR(s->rxf_ctl);
+    uint8_t received_bytes = NPCM7XX_SMBRXF_STS_RX_BYTES(s->rxf_sts);
+    uint8_t pos;
+
+    if (received_bytes == expected_bytes) {
+        return;
+    }
+
+    while (received_bytes < expected_bytes &&
+           received_bytes < NPCM7XX_SMBUS_FIFO_SIZE) {
+        pos = (s->rx_cur + received_bytes) % NPCM7XX_SMBUS_FIFO_SIZE;
+        s->rx_fifo[pos] = i2c_recv(s->bus);
+        trace_npcm7xx_smbus_recv_byte((DEVICE(s)->canonical_path),
+                                      s->rx_fifo[pos]);
+        ++received_bytes;
+    }
+
+    trace_npcm7xx_smbus_recv_fifo((DEVICE(s)->canonical_path),
+                                  received_bytes, expected_bytes);
+    s->rxf_sts = received_bytes;
+    if (unlikely(received_bytes < expected_bytes)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid rx_thr value: 0x%02x\n",
+                      DEVICE(s)->canonical_path, expected_bytes);
+        return;
+    }
+
+    s->rxf_sts |= NPCM7XX_SMBRXF_STS_RX_THST;
+    if (s->rxf_ctl & NPCM7XX_SMBRXF_CTL_LAST) {
+        trace_npcm7xx_smbus_nack(DEVICE(s)->canonical_path);
+        i2c_nack(s->bus);
+        s->rxf_ctl &= ~NPCM7XX_SMBRXF_CTL_LAST;
+    }
+    if (received_bytes == NPCM7XX_SMBUS_FIFO_SIZE) {
+        s->st |= NPCM7XX_SMBST_SDAST;
+        s->fif_cts |= NPCM7XX_SMBFIF_CTS_RXF_TXE;
+    } else if (!(s->rxf_ctl & NPCM7XX_SMBRXF_CTL_THR_RXIE)) {
+        s->st |= NPCM7XX_SMBST_SDAST;
+    } else {
+        s->st &= ~NPCM7XX_SMBST_SDAST;
+    }
+    npcm7xx_smbus_update_irq(s);
+}
+
+static void npcm7xx_smbus_read_byte_fifo(NPCM7xxSMBusState *s)
+{
+    uint8_t received_bytes = NPCM7XX_SMBRXF_STS_RX_BYTES(s->rxf_sts);
+
+    if (received_bytes == 0) {
+        npcm7xx_smbus_recv_fifo(s);
+        return;
+    }
+
+    s->sda = s->rx_fifo[s->rx_cur];
+    s->rx_cur = (s->rx_cur + 1u) % NPCM7XX_SMBUS_FIFO_SIZE;
+    --s->rxf_sts;
+    npcm7xx_smbus_update_irq(s);
+}
+
 static void npcm7xx_smbus_start(NPCM7xxSMBusState *s)
 {
     /*
@@ -228,6 +350,9 @@ static void npcm7xx_smbus_start(NPCM7xxSMBusState *s)
     if (available) {
         s->st |= NPCM7XX_SMBST_MODE | NPCM7XX_SMBST_XMIT | NPCM7XX_SMBST_SDAST;
         s->cst |= NPCM7XX_SMBCST_BUSY;
+        if (NPCM7XX_SMBUS_FIFO_ENABLED(s)) {
+            s->fif_cts |= NPCM7XX_SMBFIF_CTS_RXF_TXE;
+        }
     } else {
         s->st &= ~NPCM7XX_SMBST_MODE;
         s->cst &= ~NPCM7XX_SMBCST_BUSY;
@@ -279,7 +404,15 @@ static void npcm7xx_smbus_send_address(NPCM7xxSMBusState *s, uint8_t value)
             s->st |= NPCM7XX_SMBST_SDAST;
         }
     } else if (recv) {
-        npcm7xx_smbus_recv_byte(s);
+        s->st |= NPCM7XX_SMBST_SDAST;
+        if (NPCM7XX_SMBUS_FIFO_ENABLED(s)) {
+            npcm7xx_smbus_recv_fifo(s);
+        } else {
+            npcm7xx_smbus_recv_byte(s);
+        }
+    } else if (NPCM7XX_SMBUS_FIFO_ENABLED(s)) {
+        s->st |= NPCM7XX_SMBST_SDAST;
+        s->fif_cts |= NPCM7XX_SMBFIF_CTS_RXF_TXE;
     }
     npcm7xx_smbus_update_irq(s);
 }
@@ -322,11 +455,31 @@ static uint8_t npcm7xx_smbus_read_sda(NPCM7xxSMBusState *s)
 
     switch (s->status) {
     case NPCM7XX_SMBUS_STATUS_STOPPING_LAST_RECEIVE:
-        npcm7xx_smbus_execute_stop(s);
+        if (NPCM7XX_SMBUS_FIFO_ENABLED(s)) {
+            if (NPCM7XX_SMBRXF_STS_RX_BYTES(s->rxf_sts) <= 1) {
+                npcm7xx_smbus_execute_stop(s);
+            }
+            if (NPCM7XX_SMBRXF_STS_RX_BYTES(s->rxf_sts) == 0) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "%s: read to SDA with an empty rx-fifo buffer, "
+                              "result undefined: %u\n",
+                              DEVICE(s)->canonical_path, s->sda);
+                break;
+            }
+            npcm7xx_smbus_read_byte_fifo(s);
+            value = s->sda;
+        } else {
+            npcm7xx_smbus_execute_stop(s);
+        }
         break;
 
     case NPCM7XX_SMBUS_STATUS_RECEIVING:
-        npcm7xx_smbus_recv_byte(s);
+        if (NPCM7XX_SMBUS_FIFO_ENABLED(s)) {
+            npcm7xx_smbus_read_byte_fifo(s);
+            value = s->sda;
+        } else {
+            npcm7xx_smbus_recv_byte(s);
+        }
         break;
 
     default:
@@ -372,8 +525,12 @@ static void npcm7xx_smbus_write_st(NPCM7xxSMBusState *s, uint8_t value)
     }
 
     if (value & NPCM7XX_SMBST_STASTR &&
-            s->status == NPCM7XX_SMBUS_STATUS_RECEIVING) {
-        npcm7xx_smbus_recv_byte(s);
+        s->status == NPCM7XX_SMBUS_STATUS_RECEIVING) {
+        if (NPCM7XX_SMBUS_FIFO_ENABLED(s)) {
+            npcm7xx_smbus_recv_fifo(s);
+        } else {
+            npcm7xx_smbus_recv_byte(s);
+        }
     }
 
     npcm7xx_smbus_update_irq(s);
@@ -419,6 +576,7 @@ static void npcm7xx_smbus_write_ctl2(NPCM7xxSMBusState *s, uint8_t value)
         s->st = 0;
         s->cst3 = s->cst3 & (~NPCM7XX_SMBCST3_EO_BUSY);
         s->cst = 0;
+        npcm7xx_smbus_clear_buffer(s);
     }
 }
 
@@ -431,6 +589,70 @@ static void npcm7xx_smbus_write_ctl3(NPCM7xxSMBusState *s, uint8_t value)
                             NPCM7XX_SMBCTL3_SCL_LVL | NPCM7XX_SMBCTL3_SDA_LVL);
 }
 
+static void npcm7xx_smbus_write_fif_ctl(NPCM7xxSMBusState *s, uint8_t value)
+{
+    uint8_t new_ctl = value;
+
+    new_ctl = KEEP_OLD_BIT(s->fif_ctl, new_ctl, NPCM7XX_SMBFIF_CTL_FAIR_RDY);
+    new_ctl = WRITE_ONE_CLEAR(new_ctl, value, NPCM7XX_SMBFIF_CTL_FAIR_RDY);
+    new_ctl = KEEP_OLD_BIT(s->fif_ctl, new_ctl, NPCM7XX_SMBFIF_CTL_FAIR_BUSY);
+    s->fif_ctl = new_ctl;
+}
+
+static void npcm7xx_smbus_write_fif_cts(NPCM7xxSMBusState *s, uint8_t value)
+{
+    s->fif_cts = WRITE_ONE_CLEAR(s->fif_cts, value, NPCM7XX_SMBFIF_CTS_STR);
+    s->fif_cts = WRITE_ONE_CLEAR(s->fif_cts, value, NPCM7XX_SMBFIF_CTS_RXF_TXE);
+    s->fif_cts = KEEP_OLD_BIT(value, s->fif_cts, NPCM7XX_SMBFIF_CTS_RFTE_IE);
+
+    if (value & NPCM7XX_SMBFIF_CTS_CLR_FIFO) {
+        npcm7xx_smbus_clear_buffer(s);
+    }
+}
+
+static void npcm7xx_smbus_write_txf_ctl(NPCM7xxSMBusState *s, uint8_t value)
+{
+    s->txf_ctl = value;
+}
+
+static void npcm7xx_smbus_write_t_out(NPCM7xxSMBusState *s, uint8_t value)
+{
+    uint8_t new_t_out = value;
+
+    if ((value & NPCM7XX_SMBT_OUT_ST) || (!(s->t_out & NPCM7XX_SMBT_OUT_ST))) {
+        new_t_out &= ~NPCM7XX_SMBT_OUT_ST;
+    } else {
+        new_t_out |= NPCM7XX_SMBT_OUT_ST;
+    }
+
+    s->t_out = new_t_out;
+}
+
+static void npcm7xx_smbus_write_txf_sts(NPCM7xxSMBusState *s, uint8_t value)
+{
+    s->txf_sts = WRITE_ONE_CLEAR(s->txf_sts, value, NPCM7XX_SMBTXF_STS_TX_THST);
+}
+
+static void npcm7xx_smbus_write_rxf_sts(NPCM7xxSMBusState *s, uint8_t value)
+{
+    if (value & NPCM7XX_SMBRXF_STS_RX_THST) {
+        s->rxf_sts &= ~NPCM7XX_SMBRXF_STS_RX_THST;
+        if (s->status == NPCM7XX_SMBUS_STATUS_RECEIVING) {
+            npcm7xx_smbus_recv_fifo(s);
+        }
+    }
+}
+
+static void npcm7xx_smbus_write_rxf_ctl(NPCM7xxSMBusState *s, uint8_t value)
+{
+    uint8_t new_ctl = value;
+
+    if (!(value & NPCM7XX_SMBRXF_CTL_LAST)) {
+        new_ctl = KEEP_OLD_BIT(s->rxf_ctl, new_ctl, NPCM7XX_SMBRXF_CTL_LAST);
+    }
+    s->rxf_ctl = new_ctl;
+}
+
 static uint64_t npcm7xx_smbus_read(void *opaque, hwaddr offset, unsigned size)
 {
     NPCM7xxSMBusState *s = opaque;
@@ -487,9 +709,41 @@ static uint64_t npcm7xx_smbus_read(void *opaque, hwaddr offset, unsigned size)
     default:
         if (bank) {
             /* Bank 1 */
-            qemu_log_mask(LOG_GUEST_ERROR,
-                    "%s: read from invalid offset 0x%" HWADDR_PRIx "\n",
-                    DEVICE(s)->canonical_path, offset);
+            switch (offset) {
+            case NPCM7XX_SMB_FIF_CTS:
+                value = s->fif_cts;
+                break;
+
+            case NPCM7XX_SMB_FAIR_PER:
+                value = s->fair_per;
+                break;
+
+            case NPCM7XX_SMB_TXF_CTL:
+                value = s->txf_ctl;
+                break;
+
+            case NPCM7XX_SMB_T_OUT:
+                value = s->t_out;
+                break;
+
+            case NPCM7XX_SMB_TXF_STS:
+                value = s->txf_sts;
+                break;
+
+            case NPCM7XX_SMB_RXF_STS:
+                value = s->rxf_sts;
+                break;
+
+            case NPCM7XX_SMB_RXF_CTL:
+                value = s->rxf_ctl;
+                break;
+
+            default:
+                qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: read from invalid offset 0x%" HWADDR_PRIx "\n",
+                        DEVICE(s)->canonical_path, offset);
+                break;
+            }
         } else {
             /* Bank 0 */
             switch (offset) {
@@ -537,6 +791,10 @@ static uint64_t npcm7xx_smbus_read(void *opaque, hwaddr offset, unsigned size)
                 value = s->scllt;
                 break;
 
+            case NPCM7XX_SMB_FIF_CTL:
+                value = s->fif_ctl;
+                break;
+
             case NPCM7XX_SMB_SCLHT:
                 value = s->sclht;
                 break;
@@ -618,9 +876,41 @@ static void npcm7xx_smbus_write(void *opaque, hwaddr offset, uint64_t value,
     default:
         if (bank) {
             /* Bank 1 */
-            qemu_log_mask(LOG_GUEST_ERROR,
-                    "%s: write to invalid offset 0x%" HWADDR_PRIx "\n",
-                    DEVICE(s)->canonical_path, offset);
+            switch (offset) {
+            case NPCM7XX_SMB_FIF_CTS:
+                npcm7xx_smbus_write_fif_cts(s, value);
+                break;
+
+            case NPCM7XX_SMB_FAIR_PER:
+                s->fair_per = value;
+                break;
+
+            case NPCM7XX_SMB_TXF_CTL:
+                npcm7xx_smbus_write_txf_ctl(s, value);
+                break;
+
+            case NPCM7XX_SMB_T_OUT:
+                npcm7xx_smbus_write_t_out(s, value);
+                break;
+
+            case NPCM7XX_SMB_TXF_STS:
+                npcm7xx_smbus_write_txf_sts(s, value);
+                break;
+
+            case NPCM7XX_SMB_RXF_STS:
+                npcm7xx_smbus_write_rxf_sts(s, value);
+                break;
+
+            case NPCM7XX_SMB_RXF_CTL:
+                npcm7xx_smbus_write_rxf_ctl(s, value);
+                break;
+
+            default:
+                qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: write to invalid offset 0x%" HWADDR_PRIx "\n",
+                        DEVICE(s)->canonical_path, offset);
+                break;
+            }
         } else {
             /* Bank 0 */
             switch (offset) {
@@ -668,6 +958,10 @@ static void npcm7xx_smbus_write(void *opaque, hwaddr offset, uint64_t value,
                 s->scllt = value;
                 break;
 
+            case NPCM7XX_SMB_FIF_CTL:
+                npcm7xx_smbus_write_fif_ctl(s, value);
+                break;
+
             case NPCM7XX_SMB_SCLHT:
                 s->sclht = value;
                 break;
@@ -714,7 +1008,18 @@ static void npcm7xx_smbus_enter_reset(Object *obj, ResetType type)
     s->scllt = NPCM7XX_SMB_SCLLT_INIT_VAL;
     s->sclht = NPCM7XX_SMB_SCLHT_INIT_VAL;
 
+    s->fif_ctl = NPCM7XX_SMB_FIF_CTL_INIT_VAL;
+    s->fif_cts = NPCM7XX_SMB_FIF_CTS_INIT_VAL;
+    s->fair_per = NPCM7XX_SMB_FAIR_PER_INIT_VAL;
+    s->txf_ctl = NPCM7XX_SMB_TXF_CTL_INIT_VAL;
+    s->t_out = NPCM7XX_SMB_T_OUT_INIT_VAL;
+    s->txf_sts = NPCM7XX_SMB_TXF_STS_INIT_VAL;
+    s->rxf_sts = NPCM7XX_SMB_RXF_STS_INIT_VAL;
+    s->rxf_ctl = NPCM7XX_SMB_RXF_CTL_INIT_VAL;
+
+    npcm7xx_smbus_clear_buffer(s);
     s->status = NPCM7XX_SMBUS_STATUS_IDLE;
+    s->rx_cur = 0;
 }
 
 static void npcm7xx_smbus_hold_reset(Object *obj)
@@ -756,6 +1061,17 @@ static const VMStateDescription vmstate_npcm7xx_smbus = {
         VMSTATE_UINT8_ARRAY(addr, NPCM7xxSMBusState, NPCM7XX_SMBUS_NR_ADDRS),
         VMSTATE_UINT8(scllt, NPCM7xxSMBusState),
         VMSTATE_UINT8(sclht, NPCM7xxSMBusState),
+        VMSTATE_UINT8(fif_ctl, NPCM7xxSMBusState),
+        VMSTATE_UINT8(fif_cts, NPCM7xxSMBusState),
+        VMSTATE_UINT8(fair_per, NPCM7xxSMBusState),
+        VMSTATE_UINT8(txf_ctl, NPCM7xxSMBusState),
+        VMSTATE_UINT8(t_out, NPCM7xxSMBusState),
+        VMSTATE_UINT8(txf_sts, NPCM7xxSMBusState),
+        VMSTATE_UINT8(rxf_sts, NPCM7xxSMBusState),
+        VMSTATE_UINT8(rxf_ctl, NPCM7xxSMBusState),
+        VMSTATE_UINT8_ARRAY(rx_fifo, NPCM7xxSMBusState,
+                            NPCM7XX_SMBUS_FIFO_SIZE),
+        VMSTATE_UINT8(rx_cur, NPCM7xxSMBusState),
         VMSTATE_END_OF_LIST(),
     },
 };
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index c3bb70ad04..82fe6f965f 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -25,3 +25,4 @@ npcm7xx_smbus_send_byte(const char *id, uint8_t value, int success) "%s send byt
 npcm7xx_smbus_recv_byte(const char *id, uint8_t value) "%s recv byte: 0x%02x"
 npcm7xx_smbus_stop(const char *id) "%s stopping"
 npcm7xx_smbus_nack(const char *id) "%s nacking"
+npcm7xx_smbus_recv_fifo(const char *id, uint8_t received, uint8_t expected) "%s recv fifo: received %u, expected %u"
diff --git a/include/hw/i2c/npcm7xx_smbus.h b/include/hw/i2c/npcm7xx_smbus.h
index b9761a6993..7d59ee917e 100644
--- a/include/hw/i2c/npcm7xx_smbus.h
+++ b/include/hw/i2c/npcm7xx_smbus.h
@@ -27,6 +27,9 @@
  */
 #define NPCM7XX_SMBUS_NR_ADDRS 10
 
+/* Size of the FIFO buffer. */
+#define NPCM7XX_SMBUS_FIFO_SIZE 16
+
 typedef enum NPCM7xxSMBusStatus {
     NPCM7XX_SMBUS_STATUS_IDLE,
     NPCM7XX_SMBUS_STATUS_SENDING,
@@ -53,6 +56,16 @@ typedef enum NPCM7xxSMBusStatus {
  * @addr: The SMBus module's own addresses on the I2C bus.
  * @scllt: The SCL low time register.
  * @sclht: The SCL high time register.
+ * @fif_ctl: The FIFO control register.
+ * @fif_cts: The FIFO control status register.
+ * @fair_per: The fair preriod register.
+ * @txf_ctl: The transmit FIFO control register.
+ * @t_out: The SMBus timeout register.
+ * @txf_sts: The transmit FIFO status register.
+ * @rxf_sts: The receive FIFO status register.
+ * @rxf_ctl: The receive FIFO control register.
+ * @rx_fifo: The FIFO buffer for receiving in FIFO mode.
+ * @rx_cur: The current position of rx_fifo.
  * @status: The current status of the SMBus.
  */
 typedef struct NPCM7xxSMBusState {
@@ -78,6 +91,18 @@ typedef struct NPCM7xxSMBusState {
     uint8_t      scllt;
     uint8_t      sclht;
 
+    uint8_t      fif_ctl;
+    uint8_t      fif_cts;
+    uint8_t      fair_per;
+    uint8_t      txf_ctl;
+    uint8_t      t_out;
+    uint8_t      txf_sts;
+    uint8_t      rxf_sts;
+    uint8_t      rxf_ctl;
+
+    uint8_t      rx_fifo[NPCM7XX_SMBUS_FIFO_SIZE];
+    uint8_t      rx_cur;
+
     NPCM7xxSMBusStatus status;
 } NPCM7xxSMBusState;
 
diff --git a/tests/qtest/npcm7xx_smbus-test.c b/tests/qtest/npcm7xx_smbus-test.c
index 4594b107df..4f9f493872 100644
--- a/tests/qtest/npcm7xx_smbus-test.c
+++ b/tests/qtest/npcm7xx_smbus-test.c
@@ -132,6 +132,44 @@ enum NPCM7xxSMBusBank1Register {
 #define ADDR_EN             BIT(7)
 #define ADDR_A(rv)          extract8((rv), 0, 6)
 
+/* FIF_CTL fields */
+#define FIF_CTL_FIFO_EN         BIT(4)
+
+/* FIF_CTS fields */
+#define FIF_CTS_CLR_FIFO        BIT(6)
+#define FIF_CTS_RFTE_IE         BIT(3)
+#define FIF_CTS_RXF_TXE         BIT(1)
+
+/* TXF_CTL fields */
+#define TXF_CTL_THR_TXIE        BIT(6)
+#define TXF_CTL_TX_THR(rv)      extract8((rv), 0, 5)
+
+/* TXF_STS fields */
+#define TXF_STS_TX_THST         BIT(6)
+#define TXF_STS_TX_BYTES(rv)    extract8((rv), 0, 5)
+
+/* RXF_CTL fields */
+#define RXF_CTL_THR_RXIE        BIT(6)
+#define RXF_CTL_LAST            BIT(5)
+#define RXF_CTL_RX_THR(rv)      extract8((rv), 0, 5)
+
+/* RXF_STS fields */
+#define RXF_STS_RX_THST         BIT(6)
+#define RXF_STS_RX_BYTES(rv)    extract8((rv), 0, 5)
+
+
+static void choose_bank(QTestState *qts, uint64_t base_addr, uint8_t bank)
+{
+    uint8_t ctl3 = qtest_readb(qts, base_addr + OFFSET_CTL3);
+
+    if (bank) {
+        ctl3 |= CTL3_BNK_SEL;
+    } else {
+        ctl3 &= ~CTL3_BNK_SEL;
+    }
+
+    qtest_writeb(qts, base_addr + OFFSET_CTL3, ctl3);
+}
 
 static void check_running(QTestState *qts, uint64_t base_addr)
 {
@@ -203,10 +241,33 @@ static void send_byte(QTestState *qts, uint64_t base_addr, uint8_t byte)
     qtest_writeb(qts, base_addr + OFFSET_SDA, byte);
 }
 
+static bool check_recv(QTestState *qts, uint64_t base_addr)
+{
+    uint8_t st, fif_ctl, rxf_ctl, rxf_sts;
+    bool fifo;
+
+    st = qtest_readb(qts, base_addr + OFFSET_ST);
+    choose_bank(qts, base_addr, 0);
+    fif_ctl = qtest_readb(qts, base_addr + OFFSET_FIF_CTL);
+    fifo = fif_ctl & FIF_CTL_FIFO_EN;
+    if (!fifo) {
+        return st == (ST_MODE | ST_SDAST);
+    }
+
+    choose_bank(qts, base_addr, 1);
+    rxf_ctl = qtest_readb(qts, base_addr + OFFSET_RXF_CTL);
+    rxf_sts = qtest_readb(qts, base_addr + OFFSET_RXF_STS);
+
+    if ((rxf_ctl & RXF_CTL_THR_RXIE) && RXF_STS_RX_BYTES(rxf_sts) < 16) {
+        return st == ST_MODE;
+    } else {
+        return st == (ST_MODE | ST_SDAST);
+    }
+}
+
 static uint8_t recv_byte(QTestState *qts, uint64_t base_addr)
 {
-    g_assert_cmphex(qtest_readb(qts, base_addr + OFFSET_ST), ==,
-                    ST_MODE | ST_SDAST);
+    g_assert_true(check_recv(qts, base_addr));
     return qtest_readb(qts, base_addr + OFFSET_SDA);
 }
 
@@ -229,7 +290,7 @@ static void send_address(QTestState *qts, uint64_t base_addr, uint8_t addr,
         qtest_writeb(qts, base_addr + OFFSET_ST, ST_STASTR);
         st = qtest_readb(qts, base_addr + OFFSET_ST);
         if (recv) {
-            g_assert_cmphex(st, ==, ST_MODE | ST_SDAST);
+            g_assert_true(check_recv(qts, base_addr));
         } else {
             g_assert_cmphex(st, ==, ST_MODE | ST_XMIT | ST_SDAST);
         }
@@ -251,6 +312,29 @@ static void send_nack(QTestState *qts, uint64_t base_addr)
     qtest_writeb(qts, base_addr + OFFSET_CTL1, ctl1);
 }
 
+static void start_fifo_mode(QTestState *qts, uint64_t base_addr)
+{
+    choose_bank(qts, base_addr, 0);
+    qtest_writeb(qts, base_addr + OFFSET_FIF_CTL, FIF_CTL_FIFO_EN);
+    g_assert_true(qtest_readb(qts, base_addr + OFFSET_FIF_CTL) &
+                  FIF_CTL_FIFO_EN);
+    choose_bank(qts, base_addr, 1);
+    qtest_writeb(qts, base_addr + OFFSET_FIF_CTS,
+                 FIF_CTS_CLR_FIFO | FIF_CTS_RFTE_IE);
+    g_assert_cmphex(qtest_readb(qts, base_addr + OFFSET_FIF_CTS), ==,
+                    FIF_CTS_RFTE_IE);
+    g_assert_cmphex(qtest_readb(qts, base_addr + OFFSET_TXF_STS), ==, 0);
+    g_assert_cmphex(qtest_readb(qts, base_addr + OFFSET_RXF_STS), ==, 0);
+}
+
+static void start_recv_fifo(QTestState *qts, uint64_t base_addr, uint8_t bytes)
+{
+    choose_bank(qts, base_addr, 1);
+    qtest_writeb(qts, base_addr + OFFSET_TXF_CTL, 0);
+    qtest_writeb(qts, base_addr + OFFSET_RXF_CTL,
+                 RXF_CTL_THR_RXIE | RXF_CTL_LAST | bytes);
+}
+
 /* Check the SMBus's status is set correctly when disabled. */
 static void test_disable_bus(gconstpointer data)
 {
@@ -324,6 +408,64 @@ static void test_single_mode(gconstpointer data)
     qtest_quit(qts);
 }
 
+/* Check the SMBus can send and receive bytes in FIFO mode. */
+static void test_fifo_mode(gconstpointer data)
+{
+    intptr_t index = (intptr_t)data;
+    uint64_t base_addr = SMBUS_ADDR(index);
+    int irq = SMBUS_IRQ(index);
+    uint8_t value = 0x60;
+    QTestState *qts = qtest_init("-machine npcm750-evb");
+
+    qtest_irq_intercept_in(qts, "/machine/soc/a9mpcore/gic");
+    enable_bus(qts, base_addr);
+    start_fifo_mode(qts, base_addr);
+    g_assert_false(qtest_get_irq(qts, irq));
+
+    /* Sending */
+    start_transfer(qts, base_addr);
+    send_address(qts, base_addr, EVB_DEVICE_ADDR, false, true);
+    choose_bank(qts, base_addr, 1);
+    g_assert_true(qtest_readb(qts, base_addr + OFFSET_FIF_CTS) &
+                  FIF_CTS_RXF_TXE);
+    qtest_writeb(qts, base_addr + OFFSET_TXF_CTL, TXF_CTL_THR_TXIE);
+    send_byte(qts, base_addr, TMP105_REG_CONFIG);
+    send_byte(qts, base_addr, value);
+    g_assert_true(qtest_readb(qts, base_addr + OFFSET_FIF_CTS) &
+                  FIF_CTS_RXF_TXE);
+    g_assert_true(qtest_readb(qts, base_addr + OFFSET_TXF_STS) &
+                  TXF_STS_TX_THST);
+    g_assert_cmpuint(TXF_STS_TX_BYTES(
+                        qtest_readb(qts, base_addr + OFFSET_TXF_STS)), ==, 0);
+    g_assert_true(qtest_get_irq(qts, irq));
+    stop_transfer(qts, base_addr);
+    check_stopped(qts, base_addr);
+
+    /* Receiving */
+    start_fifo_mode(qts, base_addr);
+    start_transfer(qts, base_addr);
+    send_address(qts, base_addr, EVB_DEVICE_ADDR, false, true);
+    send_byte(qts, base_addr, TMP105_REG_CONFIG);
+    start_transfer(qts, base_addr);
+    qtest_writeb(qts, base_addr + OFFSET_FIF_CTS, FIF_CTS_RXF_TXE);
+    start_recv_fifo(qts, base_addr, 1);
+    send_address(qts, base_addr, EVB_DEVICE_ADDR, true, true);
+    g_assert_false(qtest_readb(qts, base_addr + OFFSET_FIF_CTS) &
+                   FIF_CTS_RXF_TXE);
+    g_assert_true(qtest_readb(qts, base_addr + OFFSET_RXF_STS) &
+                  RXF_STS_RX_THST);
+    g_assert_cmpuint(RXF_STS_RX_BYTES(
+                        qtest_readb(qts, base_addr + OFFSET_RXF_STS)), ==, 1);
+    send_nack(qts, base_addr);
+    stop_transfer(qts, base_addr);
+    check_running(qts, base_addr);
+    g_assert_cmphex(recv_byte(qts, base_addr), ==, value);
+    g_assert_cmpuint(RXF_STS_RX_BYTES(
+                        qtest_readb(qts, base_addr + OFFSET_RXF_STS)), ==, 0);
+    check_stopped(qts, base_addr);
+    qtest_quit(qts);
+}
+
 static void smbus_add_test(const char *name, int index, GTestDataFunc fn)
 {
     g_autofree char *full_name = g_strdup_printf(
@@ -346,6 +488,7 @@ int main(int argc, char **argv)
 
     for (i = 0; i < ARRAY_SIZE(evb_bus_list); ++i) {
         add_test(single_mode, evb_bus_list[i]);
+        add_test(fifo_mode, evb_bus_list[i]);
     }
 
     return g_test_run();
-- 
2.30.0.478.g8a0d178c01-goog


