Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6B869C659
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 09:14:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU1Iy-0002zn-Br; Mon, 20 Feb 2023 03:13:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1pU1It-0002py-Ly; Mon, 20 Feb 2023 03:13:43 -0500
Received: from m12.mail.163.com ([220.181.12.199])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1pU1Ir-0001QY-0M; Mon, 20 Feb 2023 03:13:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Loe6a
 ZHMrzE9iFa8rDoWH/ayBVuYxe1lFz57yi2qNNw=; b=YWFCMWjBySzmf4lXutwkY
 DEuGfDKuS2w25Q10VZ79Q6SeUwW9f2nNnqxyMwLxfAPX6FeJHFH28TrfL/F1URFY
 nWamcKs5TIyoNsXeTp4B5D7lZ90Td4ypS1UdEJMyd1xrenrDe1nwzSgWLyA2qEhg
 p44YnusIiW6VbYvg2fp3Vs=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [218.201.129.20])
 by zwqz-smtp-mta-g2-4 (Coremail) with SMTP id _____wCnPYyDK_NjSU3yAQ--.59158S2;
 Mon, 20 Feb 2023 16:12:52 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v2 1/3] hw: allwinner-i2c: Make the trace message more readable
Date: Mon, 20 Feb 2023 16:12:50 +0800
Message-Id: <20230220081252.25348-1-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnPYyDK_NjSU3yAQ--.59158S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jr4kuw4kKw4UCryfCr43GFg_yoW7Kr17pr
 Z0krsIgr15Kas8Zr1fKF1DJF1rJFyqyr1Iyws7W347uF1xCw13ZrykGF45A390k34Utr45
 GFZ8Za42qFWYya7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piS_M7UUUUU=
X-Originating-IP: [218.201.129.20]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiGgYc7VaEEUbKJwAAsF
Received-SPF: pass client-ip=220.181.12.199;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: qianfan Zhao <qianfanguijin@163.com>

Next is an example when read/write trace enabled:

allwinner_i2c_write write  XADDR(0x04): 0x00
allwinner_i2c_write write   CNTR(0x0c): 0x50 M_STP BUS_EN
allwinner_i2c_write write   CNTR(0x0c): 0xe4 A_ACK M_STA BUS_EN INT_EN
allwinner_i2c_read  read    CNTR(0x0c): 0xcc A_ACK INT_FLAG BUS_EN INT_EN
allwinner_i2c_read  read    STAT(0x10): 0x08 STAT_M_STA_TX

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 hw/i2c/allwinner-i2c.c | 110 ++++++++++++++++++++++++++++++++++++++++-
 hw/i2c/trace-events    |   5 +-
 2 files changed, 110 insertions(+), 5 deletions(-)

diff --git a/hw/i2c/allwinner-i2c.c b/hw/i2c/allwinner-i2c.c
index a435965836..fa650e7e02 100644
--- a/hw/i2c/allwinner-i2c.c
+++ b/hw/i2c/allwinner-i2c.c
@@ -129,6 +129,39 @@ enum {
     STAT_IDLE = 0x1f
 } TWI_STAT_STA;
 
+#define TWI_STAT_STA_DESC(sta)  [sta] = #sta
+static const char *twi_stat_sta_descriptors[] = {
+    TWI_STAT_STA_DESC(STAT_BUS_ERROR),
+    TWI_STAT_STA_DESC(STAT_M_STA_TX),
+    TWI_STAT_STA_DESC(STAT_M_RSTA_TX),
+    TWI_STAT_STA_DESC(STAT_M_ADDR_WR_ACK),
+    TWI_STAT_STA_DESC(STAT_M_ADDR_WR_NACK),
+    TWI_STAT_STA_DESC(STAT_M_DATA_TX_ACK),
+    TWI_STAT_STA_DESC(STAT_M_DATA_TX_NACK),
+    TWI_STAT_STA_DESC(STAT_M_ARB_LOST),
+    TWI_STAT_STA_DESC(STAT_M_ADDR_RD_ACK),
+    TWI_STAT_STA_DESC(STAT_M_ADDR_RD_NACK),
+    TWI_STAT_STA_DESC(STAT_M_DATA_RX_ACK),
+    TWI_STAT_STA_DESC(STAT_M_DATA_RX_NACK),
+    TWI_STAT_STA_DESC(STAT_S_ADDR_WR_ACK),
+    TWI_STAT_STA_DESC(STAT_S_ARB_LOST_AW_ACK),
+    TWI_STAT_STA_DESC(STAT_S_GCA_ACK),
+    TWI_STAT_STA_DESC(STAT_S_ARB_LOST_GCA_ACK),
+    TWI_STAT_STA_DESC(STAT_S_DATA_RX_SA_ACK),
+    TWI_STAT_STA_DESC(STAT_S_DATA_RX_SA_NACK),
+    TWI_STAT_STA_DESC(STAT_S_DATA_RX_GCA_ACK),
+    TWI_STAT_STA_DESC(STAT_S_DATA_RX_GCA_NACK),
+    TWI_STAT_STA_DESC(STAT_S_STP_RSTA),
+    TWI_STAT_STA_DESC(STAT_S_ADDR_RD_ACK),
+    TWI_STAT_STA_DESC(STAT_S_ARB_LOST_AR_ACK),
+    TWI_STAT_STA_DESC(STAT_S_DATA_TX_ACK),
+    TWI_STAT_STA_DESC(STAT_S_DATA_TX_NACK),
+    TWI_STAT_STA_DESC(STAT_S_LB_TX_ACK),
+    TWI_STAT_STA_DESC(STAT_M_2ND_ADDR_WR_ACK),
+    TWI_STAT_STA_DESC(STAT_M_2ND_ADDR_WR_NACK),
+    TWI_STAT_STA_DESC(STAT_IDLE),
+};
+
 static const char *allwinner_i2c_get_regname(unsigned offset)
 {
     switch (offset) {
@@ -155,6 +188,79 @@ static const char *allwinner_i2c_get_regname(unsigned offset)
     }
 }
 
+static const char *twi_cntr_reg_bits[] = {
+    [2] = "A_ACK",
+    [3] = "INT_FLAG",
+    [4] = "M_STP",
+    [5] = "M_STA",
+    [6] = "BUS_EN",
+    [7] = "INT_EN",
+};
+
+static const char *twi_line_ctrl_reg_bits[] = {
+    [5] = "SCL_STATE",
+    [4] = "SDA_STATE",
+    [3] = "SCL_CTL",
+    [2] = "SCL_CTL_EN",
+    [1] = "SDA_CTL",
+    [0] = "SDA_CTL_EN",
+};
+
+static void make_reg_value_bit_descriptors(char *s, size_t sz, uint8_t value,
+                                           const char **desc_arrays,
+                                           size_t array_size)
+{
+    unsigned i = 0;
+
+    for (; i < array_size; i++) {
+        if ((value & (1 << i)) && desc_arrays[i]) {
+            strncat(s, desc_arrays[i], sz - 1);
+            strncat(s, " ", sz - 1);
+        }
+    }
+}
+
+static void make_reg_value_descriptors(char *s, size_t sz, uint8_t addr,
+                                       uint8_t value)
+{
+    switch (addr) {
+    case TWI_CNTR_REG:
+        make_reg_value_bit_descriptors(s, sz, value, twi_cntr_reg_bits,
+                                       ARRAY_SIZE(twi_cntr_reg_bits));
+        break;
+    case TWI_LCR_REG:
+        make_reg_value_bit_descriptors(s, sz, value, twi_line_ctrl_reg_bits,
+                                       ARRAY_SIZE(twi_line_ctrl_reg_bits));
+        break;
+    case TWI_STAT_REG:
+        if (STAT_TO_STA(value) <= STAT_IDLE)
+            strncat(s, twi_stat_sta_descriptors[STAT_TO_STA(value)], sz - 1);
+        break;
+    }
+}
+
+static void allwinner_i2c_trace_read(uint8_t addr, uint8_t value)
+{
+    char desc[256] = { 0 };
+
+    if (trace_event_get_state_backends(TRACE_ALLWINNER_I2C_READ)) {
+       make_reg_value_descriptors(desc, sizeof(desc), addr, value);
+       trace_allwinner_i2c_read(allwinner_i2c_get_regname(addr),
+                                addr, value, desc);
+    }
+}
+
+static void allwinner_i2c_trace_write(uint8_t addr, uint8_t value)
+{
+    char desc[256] = { 0 };
+
+    if (trace_event_get_state_backends(TRACE_ALLWINNER_I2C_WRITE)) {
+        make_reg_value_descriptors(desc, sizeof(desc), addr, value);
+        trace_allwinner_i2c_write(allwinner_i2c_get_regname(addr),
+                                  addr, value, desc);
+    }
+}
+
 static inline bool allwinner_i2c_is_reset(AWI2CState *s)
 {
     return s->srst & TWI_SRST_MASK;
@@ -271,7 +377,7 @@ static uint64_t allwinner_i2c_read(void *opaque, hwaddr offset,
         break;
     }
 
-    trace_allwinner_i2c_read(allwinner_i2c_get_regname(offset), offset, value);
+    allwinner_i2c_trace_read((uint8_t)offset, (uint8_t)value);
 
     return (uint64_t)value;
 }
@@ -283,7 +389,7 @@ static void allwinner_i2c_write(void *opaque, hwaddr offset,
 
     value &= 0xff;
 
-    trace_allwinner_i2c_write(allwinner_i2c_get_regname(offset), offset, value);
+    allwinner_i2c_trace_write((uint8_t)offset, (uint8_t)value);
 
     switch (offset) {
     case TWI_ADDR_REG:
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index 8e88aa24c1..963946bfdb 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -16,9 +16,8 @@ i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
 i2c_ack(void) ""
 
 # allwinner_i2c.c
-
-allwinner_i2c_read(const char* reg_name, uint64_t offset, uint64_t value) "read %s [0x%" PRIx64 "]: -> 0x%" PRIx64
-allwinner_i2c_write(const char* reg_name, uint64_t offset, uint64_t value) "write %s [0x%" PRIx64 "]: <- 0x%" PRIx64
+allwinner_i2c_read(const char *regname, uint8_t addr, uint8_t value, const char *desc)  " read  %6s(0x%02x): 0x%02x %s"
+allwinner_i2c_write(const char *regname, uint8_t addr, uint8_t value, const char *desc) "write %6s(0x%02x): 0x%02x %s"
 
 # aspeed_i2c.c
 
-- 
2.25.1


