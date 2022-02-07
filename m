Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B4C4AC2B3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 16:13:33 +0100 (CET)
Received: from localhost ([::1]:56390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH5hr-0002c0-D2
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 10:13:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1nH5ZK-0004Pw-98; Mon, 07 Feb 2022 10:04:42 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:50263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1nH5ZD-0004eJ-RO; Mon, 07 Feb 2022 10:04:38 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 3B3BE32019B4;
 Mon,  7 Feb 2022 10:04:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 07 Feb 2022 10:04:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=7MjPO5nUgLFK0Cvckcmu3g8aLoa3V5
 +ZQlcgb0uJvoE=; b=SeVOcPo9R09RynfzyZ7UA27yQB85OdMuFph1LWz07yuWmx
 shTJIUo1kdX2BbplS3k0ggY35w387k/cNUINbqe85SWSSVhHNZaCONkCpo0+rQlP
 w77tNNyeR1lLvxW3Sx3z3wvWsgWSCJwL1ta0QPlYL4eeR3phW534rmuv00uFDKrY
 w0Zagd6Jf+IJh+7aNTMFB9YKxtqvUgPuSJo/lW9k2yv0C0P++hopZCX3Jb/ftYEK
 AB3vfWoAgUIHMX+aR0JlQ50lTCPYX9bPGt6tLw5BS1jVh0NbO2LICMXvIL57ccuR
 KhPPvkAqFeA3H3OEBTqC5atBdgogiow6vtdhrpVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7MjPO5
 nUgLFK0Cvckcmu3g8aLoa3V5+ZQlcgb0uJvoE=; b=m7ojEBZCcDb1ESP8XcUb1+
 g6rv+gsfrNRWI5FWdRM8sS7IqNqwqpNdMcL6RywwqDU746uJ+k3ArviMvZv7AVpk
 5KPee0HhKMINgPlZaVeZT/WIJwUjYK1yUyxdQ8ERU7CyTLRyT8wzDTQt11BPqKXu
 +JrPBOgri+H9WQ+hITvmQWEEsHczo+/fyCfofH6O4b67DLGcN7XhmEzG1gqqVOfz
 LwCgXfv4VAc4wTUIdQS14jiWVwXvnLTHjp+k38bb0gm5deKSDa7T0KYg4upf/d3C
 3y6zfM2ApJKxdcY81+FVHRxI1Fy3OTU2sAOQBzGD7jhbr+U1A8sk1j/Ufz5fOUrA
 ==
X-ME-Sender: <xms:_zQBYgnQpfin5z--0wfcfrLE5yG0yL7PuEd_DumarR4Pdie6zjQWQA>
 <xme:_zQBYv3Fw7VW-fHefO2NEeGSJEBjSSVahnMuCkKtKM7lKfjcILyl-O0vSTfSLXl_Q
 VChAPNbIMbkD9_wgg>
X-ME-Received: <xmr:_zQBYury2Co97epfpnBqt7FXzu1Bun6mNs1A_VvvR1q_mrJ4X9p0K7dI3JmaoEYfh1yY1QBcWf5doAPid8kh00RaFIhUQA2bxPGxDRUXdA88xVu9s0kvXnzGLMjuROJ9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucevlhhushhtvghrufhiiigvpedunecurfgr
 rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:_zQBYskVOUlxU4Atv_I0-Wclyf99JTiIXIdcNESDFsIwe5C1BacusQ>
 <xmx:_zQBYu2gcBasiq3YWJHojJXLVP_P8B2knxrnLvHMsGOM--AC6eyrUw>
 <xmx:_zQBYjsP7B-MJ4wafWegvvXvpBcTUJTHwgnl2jcaAqaMq1YmoRf_SA>
 <xmx:_zQBYhQOF6Sjd3lSaEgVSpafHeMnCvUaIo-rSO7kwFP5DvgMU5rYAg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 10:04:29 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw: aspeed_gpio: Support the AST2600's indexed register
 interface
Date: Tue,  8 Feb 2022 01:34:09 +1030
Message-Id: <20220207150409.358888-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220207150409.358888-1-andrew@aj.id.au>
References: <20220207150409.358888-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=andrew@aj.id.au;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, openbmc@lists.ozlabs.org, qemu-arm@nongnu.org,
 clg@kaod.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A new register interface was added to the AST2600 GPIO controller that
allows a single 32 bit register to drive configuration of up to 208
GPIOs. This makes way for a very simple driver implementation in
early-boot firmware such as u-boot. The old register interface required
drivers implement a tedious data model, but allowed efficient multi-line
bit-banging.

Either way, the hardware model in qemu becomes quite complex, though it
would have been less so had the new interface been the only one
available.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/gpio/aspeed_gpio.c         | 202 +++++++++++++++++++++++++++++++++-
 include/hw/gpio/aspeed_gpio.h |   3 +
 2 files changed, 202 insertions(+), 3 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 1d4d1aedc4b5..cee1a9a2e065 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -160,7 +160,42 @@
 #define GPIO_YZAAAB_DIRECTION      (0x1E4 >> 2)
 #define GPIO_AC_DATA_VALUE         (0x1E8 >> 2)
 #define GPIO_AC_DIRECTION          (0x1EC >> 2)
-#define GPIO_3_3V_MEM_SIZE         0x1F0
+#define GPIO_INDEX                 (0x2AC >> 2)
+#define  GPIO_INDEX_DATA_SHIFT     20
+#define  GPIO_INDEX_DATA_LEN       12
+#define   GPIO_INDEX_DATA_DATA     20
+#define   GPIO_INDEX_DATA_DIR      20
+#define   GPIO_INDEX_DATA_IRQ_EN   20
+#define   GPIO_INDEX_DATA_IRQ_TY0  21
+#define   GPIO_INDEX_DATA_IRQ_TY1  22
+#define   GPIO_INDEX_DATA_IRQ_TY2  23
+#define   GPIO_INDEX_DATA_IRQ_STS  24
+#define   GPIO_INDEX_DATA_DB1      20
+#define   GPIO_INDEX_DATA_DB2      21
+#define   GPIO_INDEX_DATA_TOL      20
+#define   GPIO_INDEX_DATA_SRC0     20
+#define   GPIO_INDEX_DATA_SRC1     20
+#define   GPIO_INDEX_DATA_INPUT    20
+#define   GPIO_INDEX_DATA_WR_SRC   20
+#define  GPIO_INDEX_TYPE_SHIFT     16
+#define  GPIO_INDEX_TYPE_LEN       4
+#define   GPIO_INDEX_TYPE_DATA     0
+#define   GPIO_INDEX_TYPE_DIR      1
+#define   GPIO_INDEX_TYPE_IRQ      2
+#define   GPIO_INDEX_TYPE_DEBOUNCE 3
+#define   GPIO_INDEX_TYPE_TOL      4
+#define   GPIO_INDEX_TYPE_SRC      5
+#define   GPIO_INDEX_TYPE_INPUT    6
+#define   GPIO_INDEX_TYPE_RSVD     7
+#define   GPIO_INDEX_TYPE_WR_SRC   8
+#define   GPIO_INDEX_TYPE_RD_SRC   9
+#define  GPIO_INDEX_CMD_SHIFT      12
+#define  GPIO_INDEX_CMD_LEN        1
+#define   GPIO_INDEX_CMD_WRITE     0
+#define   GPIO_INDEX_CMD_READ      1
+#define  GPIO_INDEX_NR_SHIFT       0
+#define  GPIO_INDEX_NR_LEN         8
+#define GPIO_3_3V_MEM_SIZE         0x2B0
 #define GPIO_3_3V_REG_ARRAY_SIZE   (GPIO_3_3V_MEM_SIZE >> 2)
 
 /* AST2600 only - 1.8V gpios */
@@ -571,6 +606,11 @@ static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
         return (uint64_t) s->debounce_regs[idx];
     }
 
+    /* This is a (new, indirect) register interface for configuring GPIOs */
+    if (agc->have_index_reg && idx == GPIO_INDEX) {
+        return (uint64_t) s->index;
+    }
+
     reg = &agc->reg_table[idx];
     if (reg->set_idx >= agc->nr_gpio_sets) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: no getter for offset 0x%"
@@ -581,8 +621,73 @@ static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
     return aspeed_gpio_set_read(s, reg);
 }
 
-static void aspeed_gpio_set_write(AspeedGPIOState *s, const AspeedGPIOReg *reg,
-                                  uint32_t data)
+static int aspeed_gpio_set_offset_read(AspeedGPIOState *s, int set, enum GPIORegType reg,
+                                       int offset)
+{
+    return !!(aspeed_gpio_set_read(s, &(AspeedGPIOReg){set, reg}) & BIT(offset));
+}
+
+static const enum GPIORegType aspeed_gpio_index_type_map[] = {
+   [GPIO_INDEX_TYPE_DATA] = gpio_reg_data_value,
+   [GPIO_INDEX_TYPE_DIR] = gpio_reg_direction,
+   [GPIO_INDEX_TYPE_TOL] = gpio_reg_reset_tolerant,
+   [GPIO_INDEX_TYPE_INPUT] = gpio_reg_input_mask,
+   [GPIO_INDEX_TYPE_WR_SRC] = gpio_reg_input_mask /* See GPIO2AC doc */
+};
+
+static void
+aspeed_gpio_index_read(AspeedGPIOState *s, uint32_t type, uint32_t number)
+{
+    int pin = number % 32;
+    int set = number / 32;
+
+    /* Clear the data field so we can OR into it without further data dependencies */
+    s->index = deposit32(s->index, GPIO_INDEX_DATA_SHIFT, GPIO_INDEX_DATA_LEN, 0);
+
+    switch (type) {
+    case GPIO_INDEX_TYPE_DATA:
+    case GPIO_INDEX_TYPE_DIR:
+    case GPIO_INDEX_TYPE_TOL:
+    case GPIO_INDEX_TYPE_INPUT:
+    case GPIO_INDEX_TYPE_WR_SRC:
+    {
+        enum GPIORegType reg = aspeed_gpio_index_type_map[type];
+        s->index |= deposit32(0, GPIO_INDEX_DATA_SHIFT, GPIO_INDEX_DATA_LEN,
+                              aspeed_gpio_set_offset_read(s, set, reg, pin));
+        break;
+    }
+    case GPIO_INDEX_TYPE_IRQ:
+        s->index |= deposit32(0, GPIO_INDEX_DATA_IRQ_EN, 1,
+                        aspeed_gpio_set_offset_read(s, set, gpio_reg_int_enable, pin));
+        s->index |= deposit32(0, GPIO_INDEX_DATA_IRQ_TY0, 1,
+                        aspeed_gpio_set_offset_read(s, set, gpio_reg_int_sens_0, pin));
+        s->index |= deposit32(0, GPIO_INDEX_DATA_IRQ_TY1, 1,
+                        aspeed_gpio_set_offset_read(s, set, gpio_reg_int_sens_1, pin));
+        s->index |= deposit32(0, GPIO_INDEX_DATA_IRQ_TY2, 1,
+                        aspeed_gpio_set_offset_read(s, set, gpio_reg_int_sens_2, pin));
+        s->index |= deposit32(0, GPIO_INDEX_DATA_IRQ_STS, 1,
+                        aspeed_gpio_set_offset_read(s, set, gpio_reg_int_status, pin));
+        break;
+    case GPIO_INDEX_TYPE_DEBOUNCE:
+        s->index |= deposit32(0, GPIO_INDEX_DATA_DB1, 1,
+                        aspeed_gpio_set_offset_read(s, set, gpio_reg_debounce_1, pin));
+        s->index |= deposit32(0, GPIO_INDEX_DATA_DB2, 1,
+                        aspeed_gpio_set_offset_read(s, set, gpio_reg_debounce_2, pin));
+        break;
+    case GPIO_INDEX_TYPE_SRC:
+        s->index |= deposit32(0, GPIO_INDEX_DATA_SRC0, 1,
+                        aspeed_gpio_set_offset_read(s, set, gpio_reg_cmd_source_0, pin));
+        s->index |= deposit32(0, GPIO_INDEX_DATA_SRC1, 1,
+                        aspeed_gpio_set_offset_read(s, set, gpio_reg_cmd_source_1, pin));
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: no such command type: %" PRIu32 "\n",
+                      __func__, type);
+    }
+}
+
+static void
+aspeed_gpio_set_write(AspeedGPIOState *s, const AspeedGPIOReg *reg, uint32_t data)
 {
     AspeedGPIOClass *agc = ASPEED_GPIO_GET_CLASS(s);
     const GPIOSetProperties *props;
@@ -677,6 +782,87 @@ static void aspeed_gpio_set_write(AspeedGPIOState *s, const AspeedGPIOReg *reg,
     aspeed_gpio_update(s, set, set->data_value);
 }
 
+static void
+aspeed_gpio_set_offset_write(AspeedGPIOState *s, int set, enum GPIORegType reg,
+                             int offset, int val)
+{
+    AspeedGPIOReg agr = { set, reg };
+    uint32_t data;
+
+    data = aspeed_gpio_set_read(s, &agr);
+    data = deposit32(data, offset, 1, val);
+    aspeed_gpio_set_write(s, &agr, data);
+}
+
+static void
+aspeed_gpio_index_write(AspeedGPIOState *s, uint32_t type, uint32_t number, uint32_t data)
+{
+    int pin = number % 32;
+    int set = number / 32;
+
+    switch (type) {
+    case GPIO_INDEX_TYPE_DATA:
+    case GPIO_INDEX_TYPE_DIR:
+    case GPIO_INDEX_TYPE_TOL:
+    case GPIO_INDEX_TYPE_INPUT:
+    case GPIO_INDEX_TYPE_WR_SRC:
+    {
+        enum GPIORegType reg = aspeed_gpio_index_type_map[type];
+        aspeed_gpio_set_offset_write(s, set, reg, pin, data);
+        break;
+    }
+    case GPIO_INDEX_TYPE_IRQ:
+        aspeed_gpio_set_offset_write(s, set, gpio_reg_int_enable, pin,
+                                     extract32(data, GPIO_INDEX_DATA_IRQ_EN, 1));
+        aspeed_gpio_set_offset_write(s, set, gpio_reg_int_sens_0, pin,
+                                     extract32(data, GPIO_INDEX_DATA_IRQ_TY0, 1));
+        aspeed_gpio_set_offset_write(s, set, gpio_reg_int_sens_1, pin,
+                                     extract32(data, GPIO_INDEX_DATA_IRQ_TY1, 1));
+        aspeed_gpio_set_offset_write(s, set, gpio_reg_int_sens_2, pin,
+                                     extract32(data, GPIO_INDEX_DATA_IRQ_TY2, 1));
+        aspeed_gpio_set_offset_write(s, set, gpio_reg_int_status, pin,
+                                     extract32(data, GPIO_INDEX_DATA_IRQ_STS, 1));
+        break;
+    case GPIO_INDEX_TYPE_DEBOUNCE:
+        aspeed_gpio_set_offset_write(s, set, gpio_reg_debounce_1, pin,
+                                     extract32(data, GPIO_INDEX_DATA_DB1, 1));
+        aspeed_gpio_set_offset_write(s, set, gpio_reg_debounce_2, pin,
+                                     extract32(data, GPIO_INDEX_DATA_DB2, 1));
+        break;
+    case GPIO_INDEX_TYPE_SRC:
+        aspeed_gpio_set_offset_write(s, set, gpio_reg_cmd_source_0, pin,
+                                     extract32(data, GPIO_INDEX_DATA_SRC0, 1));
+        aspeed_gpio_set_offset_write(s, set, gpio_reg_cmd_source_1, pin,
+                                     extract32(data, GPIO_INDEX_DATA_SRC1, 1));
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: no such command type: %" PRIu32 "\n",
+                      __func__, type);
+    };
+}
+
+static void aspeed_gpio_index_command(AspeedGPIOState *s, uint32_t index)
+{
+    uint32_t command, number, type;
+
+    s->index = index;
+
+    command = extract32(index, GPIO_INDEX_CMD_SHIFT, GPIO_INDEX_CMD_LEN);
+    number = extract32(index, GPIO_INDEX_NR_SHIFT, GPIO_INDEX_NR_LEN);
+    type = extract32(index, GPIO_INDEX_TYPE_SHIFT, GPIO_INDEX_TYPE_LEN);
+
+    if (command == GPIO_INDEX_CMD_WRITE) {
+        uint32_t data;
+
+        data = extract32(index, GPIO_INDEX_DATA_SHIFT, GPIO_INDEX_DATA_LEN);
+        aspeed_gpio_index_write(s, type, number, data);
+
+        return;
+    }
+
+    aspeed_gpio_index_read(s, type, number);
+}
+
 static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
                               uint32_t size)
 {
@@ -692,6 +878,12 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
         return;
     }
 
+    /* This is a (new, indirect) register interface for configuring GPIOs */
+    if (agc->have_index_reg && idx == GPIO_INDEX) {
+        aspeed_gpio_index_command(s, data);
+        return;
+    }
+
     reg = &agc->reg_table[idx];
     if (reg->set_idx >= agc->nr_gpio_sets) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: no setter for offset 0x%"
@@ -930,6 +1122,7 @@ static void aspeed_gpio_ast2400_class_init(ObjectClass *klass, void *data)
     agc->nr_gpio_pins = 216;
     agc->nr_gpio_sets = 7;
     agc->reg_table = aspeed_3_3v_gpios;
+    agc->have_index_reg = false;
 }
 
 static void aspeed_gpio_2500_class_init(ObjectClass *klass, void *data)
@@ -940,6 +1133,7 @@ static void aspeed_gpio_2500_class_init(ObjectClass *klass, void *data)
     agc->nr_gpio_pins = 228;
     agc->nr_gpio_sets = 8;
     agc->reg_table = aspeed_3_3v_gpios;
+    agc->have_index_reg = false;
 }
 
 static void aspeed_gpio_ast2600_3_3v_class_init(ObjectClass *klass, void *data)
@@ -950,6 +1144,7 @@ static void aspeed_gpio_ast2600_3_3v_class_init(ObjectClass *klass, void *data)
     agc->nr_gpio_pins = 208;
     agc->nr_gpio_sets = 7;
     agc->reg_table = aspeed_3_3v_gpios;
+    agc->have_index_reg = true;
 }
 
 static void aspeed_gpio_ast2600_1_8v_class_init(ObjectClass *klass, void *data)
@@ -960,6 +1155,7 @@ static void aspeed_gpio_ast2600_1_8v_class_init(ObjectClass *klass, void *data)
     agc->nr_gpio_pins = 36;
     agc->nr_gpio_sets = 2;
     agc->reg_table = aspeed_1_8v_gpios;
+    agc->have_index_reg = true;
 }
 
 static const TypeInfo aspeed_gpio_info = {
diff --git a/include/hw/gpio/aspeed_gpio.h b/include/hw/gpio/aspeed_gpio.h
index 801846befb3b..57188fcb4098 100644
--- a/include/hw/gpio/aspeed_gpio.h
+++ b/include/hw/gpio/aspeed_gpio.h
@@ -61,6 +61,7 @@ struct AspeedGPIOClass {
     uint32_t nr_gpio_pins;
     uint32_t nr_gpio_sets;
     const AspeedGPIOReg *reg_table;
+    bool have_index_reg;
 };
 
 struct AspeedGPIOState {
@@ -91,6 +92,8 @@ struct AspeedGPIOState {
         uint32_t debounce_2;
         uint32_t input_mask;
     } sets[ASPEED_GPIO_MAX_NR_SETS];
+
+    uint32_t index;
 };
 
 #endif /* _ASPEED_GPIO_H_ */
-- 
2.32.0


