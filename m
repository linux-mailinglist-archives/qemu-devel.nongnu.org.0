Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FED561078
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 07:08:30 +0200 (CEST)
Received: from localhost ([::1]:32990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6mPl-0005iA-5J
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 01:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6mA7-0003Nj-LS; Thu, 30 Jun 2022 00:52:21 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:59177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6mA2-00072g-OX; Thu, 30 Jun 2022 00:52:19 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 5A8222B058D5;
 Thu, 30 Jun 2022 00:52:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 30 Jun 2022 00:52:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656564731; x=1656568331; bh=If
 BlGNQ55xRfgEnKaeuFbMN9KN+Cv+DuVryreQvC9J0=; b=J8axx3zGIiPYtzuE4X
 gcFcKTzSEhRNkUriv5nuuXBXrqNdAadszHlK+qfdLIE2BqBeEUrVpV+ePkOI3ZaN
 iVtzFHs2P2kV5VFrTxG8vTps1YnCRj+C05K45wshiqS1d/3wMHVkl0zp0keaBjcA
 1gEkUtVL8p0B91espn9zmeJ3d2ott9aYMtEdagVCrwCfn8DlDijC1s+fHTIx3Iwt
 pM/eyyH4MPCtCwmoLBmLmKrbsa6HQgpu/CdmRxEG/tEEl8GzOejW9Wbbb+sCajEv
 0NYy14CWQoBcA8oqvMZf1crQUZRY8+c8BDHoP0tQ2a9kZ8JxbJGlMp+5/tyXmlCT
 pKOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1656564731; x=1656568331; bh=IfB
 lGNQ55xRfgEnKaeuFbMN9KN+Cv+DuVryreQvC9J0=; b=RCXfhpjbCeeXf1GFOTS
 oizrd3nijYe58ZrLF11dnNLN/gKva2FfUl1srsYhol60IVjyaktE5lEBMnZ95ltv
 Liet8CbEdjdD0uVwTOt02xZuW6ac9Jsv3ksf4QSBsPgjVFyUnRhUnoFWVuVR++Th
 VCWQISPJs1Kzsbpap2y5nrZoINhTFC5NNYapsvIWbQrlGkaItx+jt5+Ah5fOTjqh
 4oSNcDVqX+q2QM61VWj4Q+H4Z2yMXJK/N24XU7Onep9qWAmlM87g/y9wc+fIH9fq
 YhElnljwJ1zKI/ckzbOdKBQSoEcATwx5KgonRIB1Y5NbCY9xX4Ca4nxeK3CCr6Vd
 J2A==
X-ME-Sender: <xms:-yu9YieV7AcSpFQlRqM7CWOnagPVrj8jDYHgUjI8diRP1kE2AiX_kA>
 <xme:-yu9YsOnpofRoPot0Z8JbAqpdcGUQEZR9lYPMbkd6JGNNNuzzxCid7uJOvMDdzJxc
 5NfLcMYvJt_iAm-olw>
X-ME-Received: <xmr:-yu9Yjj40jVy3xFrOGTVYtu7-_pNoleEVHdyzI7jyExtnjwLndtuA3VlJj-6WWZyLj5kl2rwdfuO8ufjwoG60jSiY6er4gS4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehtddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceomhgvsehpjhgurdguvghvqeenucggtffrrghtth
 gvrhhnpedvvddvvdeikeetuddtteejleeuudehuddvtedtheetvefhtdeifeeguefgtdeg
 udenucffohhmrghinhepmhgvthgrrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgvsehpjhgurdguvghv
X-ME-Proxy: <xmx:-yu9Yv9rWR5JUJrvO2l9m-O0V_qq-9QKQX1JZhobOngvTQwmmbXYrw>
 <xmx:-yu9YuvZcTCw-X_KJg99aWWI8Eg-uSu_w6J3VBiL1_8IMpE4p2G9Sw>
 <xmx:-yu9YmGHzRlOQiiHfsToIQu0TU0w0ESe5DOJnwr-W5E5dZBnttUJYw>
 <xmx:-yu9YsBekAHT7FxSpa8INjfuEHmj_UIwMSOVhr0hewHJVq1TTuiLAop4yX0>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 00:52:11 -0400 (EDT)
From: Peter Delevoryas <me@pjd.dev>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v3 11/14] hw/misc/aspeed: Add PECI controller
Date: Wed, 29 Jun 2022 21:51:30 -0700
Message-Id: <20220630045133.32251-12-me@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220630045133.32251-1-me@pjd.dev>
References: <20220630045133.32251-1-me@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=me@pjd.dev;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Peter Delevoryas <pdel@fb.com>

This introduces a really basic PECI controller that responses to
commands by always setting the response code to success and then raising
an interrupt to indicate the command is done. This helps avoid getting
hit with constant errors if the driver continuously attempts to send a
command and keeps timing out.

The AST2400 and AST2500 only included registers up to 0x5C, not 0xFC.
They supported PECI 1.1, 2.0, and 3.0. The AST2600 and AST1030 support
PECI 4.0, which includes more read/write buffer registers from 0x80 to
0xFC to support 64-byte mode.

This patch doesn't attempt to handle that, or to create a different
version of the controller for the different generations, since it's only
implementing functionality that is common to all generations.

The basic sequence of events is that the firmware will read and write to
various registers and then trigger a command by setting the FIRE bit in
the command register (similar to the I2C controller).

Then the firmware waits for an interrupt from the PECI controller,
expecting the interrupt status register to be filled in with info on
what happened. If the command was transmitted and received successfully,
then response codes from the host CPU will be found in the data buffer
registers.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed_ast10x0.c       |  12 +++
 hw/arm/aspeed_ast2600.c       |  12 +++
 hw/arm/aspeed_soc.c           |  13 +++
 hw/misc/aspeed_peci.c         | 152 ++++++++++++++++++++++++++++++++++
 hw/misc/meson.build           |   3 +-
 hw/misc/trace-events          |   5 ++
 include/hw/arm/aspeed_soc.h   |   3 +
 include/hw/misc/aspeed_peci.h |  29 +++++++
 8 files changed, 228 insertions(+), 1 deletion(-)
 create mode 100644 hw/misc/aspeed_peci.c
 create mode 100644 include/hw/misc/aspeed_peci.h

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 5df480a21f..56e8de3d89 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -47,6 +47,7 @@ static const hwaddr aspeed_soc_ast1030_memmap[] = {
     [ASPEED_DEV_UART13]    = 0x7E790700,
     [ASPEED_DEV_WDT]       = 0x7E785000,
     [ASPEED_DEV_LPC]       = 0x7E789000,
+    [ASPEED_DEV_PECI]      = 0x7E78B000,
     [ASPEED_DEV_I2C]       = 0x7E7B0000,
 };
 
@@ -75,6 +76,7 @@ static const int aspeed_soc_ast1030_irqmap[] = {
     [ASPEED_DEV_TIMER8]    = 23,
     [ASPEED_DEV_WDT]       = 24,
     [ASPEED_DEV_LPC]       = 35,
+    [ASPEED_DEV_PECI]      = 38,
     [ASPEED_DEV_FMC]       = 39,
     [ASPEED_DEV_PWM]       = 44,
     [ASPEED_DEV_ADC]       = 46,
@@ -133,6 +135,8 @@ static void aspeed_soc_ast1030_init(Object *obj)
 
     object_initialize_child(obj, "lpc", &s->lpc, TYPE_ASPEED_LPC);
 
+    object_initialize_child(obj, "peci", &s->peci, TYPE_ASPEED_PECI);
+
     object_initialize_child(obj, "sbc", &s->sbc, TYPE_ASPEED_SBC);
 
     for (i = 0; i < sc->wdts_num; i++) {
@@ -206,6 +210,14 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
     }
 
+    /* PECI */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->peci), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->peci), 0, sc->memmap[ASPEED_DEV_PECI]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peci), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_PECI));
+
     /* LPC */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->lpc), errp)) {
         return;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index b0a4199b69..85178fabea 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -59,6 +59,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
     [ASPEED_DEV_LPC]       = 0x1E789000,
     [ASPEED_DEV_IBT]       = 0x1E789140,
     [ASPEED_DEV_I2C]       = 0x1E78A000,
+    [ASPEED_DEV_PECI]      = 0x1E78B000,
     [ASPEED_DEV_UART1]     = 0x1E783000,
     [ASPEED_DEV_UART2]     = 0x1E78D000,
     [ASPEED_DEV_UART3]     = 0x1E78E000,
@@ -122,6 +123,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
     [ASPEED_DEV_LPC]       = 35,
     [ASPEED_DEV_IBT]       = 143,
     [ASPEED_DEV_I2C]       = 110,   /* 110 -> 125 */
+    [ASPEED_DEV_PECI]      = 38,
     [ASPEED_DEV_ETH1]      = 2,
     [ASPEED_DEV_ETH2]      = 3,
     [ASPEED_DEV_HACE]      = 4,
@@ -180,6 +182,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
     snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
     object_initialize_child(obj, "i2c", &s->i2c, typename);
 
+    object_initialize_child(obj, "peci", &s->peci, TYPE_ASPEED_PECI);
+
     snprintf(typename, sizeof(typename), "aspeed.fmc-%s", socname);
     object_initialize_child(obj, "fmc", &s->fmc, typename);
 
@@ -388,6 +392,14 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
     }
 
+    /* PECI */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->peci), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->peci), 0, sc->memmap[ASPEED_DEV_PECI]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peci), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_PECI));
+
     /* FMC, The number of CS is set at the board level */
     object_property_set_link(OBJECT(&s->fmc), "dram", OBJECT(s->dram_mr),
                              &error_abort);
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 30574d4276..cb78d9945c 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -45,6 +45,7 @@ static const hwaddr aspeed_soc_ast2400_memmap[] = {
     [ASPEED_DEV_LPC]    = 0x1E789000,
     [ASPEED_DEV_IBT]    = 0x1E789140,
     [ASPEED_DEV_I2C]    = 0x1E78A000,
+    [ASPEED_DEV_PECI]   = 0x1E78B000,
     [ASPEED_DEV_ETH1]   = 0x1E660000,
     [ASPEED_DEV_ETH2]   = 0x1E680000,
     [ASPEED_DEV_UART1]  = 0x1E783000,
@@ -80,6 +81,7 @@ static const hwaddr aspeed_soc_ast2500_memmap[] = {
     [ASPEED_DEV_LPC]    = 0x1E789000,
     [ASPEED_DEV_IBT]    = 0x1E789140,
     [ASPEED_DEV_I2C]    = 0x1E78A000,
+    [ASPEED_DEV_PECI]   = 0x1E78B000,
     [ASPEED_DEV_ETH1]   = 0x1E660000,
     [ASPEED_DEV_ETH2]   = 0x1E680000,
     [ASPEED_DEV_UART1]  = 0x1E783000,
@@ -118,6 +120,7 @@ static const int aspeed_soc_ast2400_irqmap[] = {
     [ASPEED_DEV_PWM]    = 28,
     [ASPEED_DEV_LPC]    = 8,
     [ASPEED_DEV_I2C]    = 12,
+    [ASPEED_DEV_PECI]   = 15,
     [ASPEED_DEV_ETH1]   = 2,
     [ASPEED_DEV_ETH2]   = 3,
     [ASPEED_DEV_XDMA]   = 6,
@@ -174,6 +177,8 @@ static void aspeed_soc_init(Object *obj)
     snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
     object_initialize_child(obj, "i2c", &s->i2c, typename);
 
+    object_initialize_child(obj, "peci", &s->peci, TYPE_ASPEED_PECI);
+
     snprintf(typename, sizeof(typename), "aspeed.fmc-%s", socname);
     object_initialize_child(obj, "fmc", &s->fmc, typename);
 
@@ -316,6 +321,14 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_I2C));
 
+    /* PECI */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->peci), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->peci), 0, sc->memmap[ASPEED_DEV_PECI]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peci), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_PECI));
+
     /* FMC, The number of CS is set at the board level */
     object_property_set_link(OBJECT(&s->fmc), "dram", OBJECT(s->dram_mr),
                              &error_abort);
diff --git a/hw/misc/aspeed_peci.c b/hw/misc/aspeed_peci.c
new file mode 100644
index 0000000000..93cc672e96
--- /dev/null
+++ b/hw/misc/aspeed_peci.c
@@ -0,0 +1,152 @@
+/*
+ * Aspeed PECI Controller
+ *
+ * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
+ *
+ * This code is licensed under the GPL version 2 or later. See the COPYING
+ * file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/irq.h"
+#include "hw/misc/aspeed_peci.h"
+#include "hw/registerfields.h"
+#include "trace.h"
+
+#define ASPEED_PECI_CC_RSP_SUCCESS (0x40U)
+
+/* Command Register */
+REG32(PECI_CMD, 0x08)
+    FIELD(PECI_CMD, FIRE, 0, 1)
+
+/* Interrupt Control Register */
+REG32(PECI_INT_CTRL, 0x18)
+
+/* Interrupt Status Register */
+REG32(PECI_INT_STS, 0x1C)
+    FIELD(PECI_INT_STS, CMD_DONE, 0, 1)
+
+/* Rx/Tx Data Buffer Registers */
+REG32(PECI_WR_DATA0, 0x20)
+REG32(PECI_RD_DATA0, 0x30)
+
+static void aspeed_peci_raise_interrupt(AspeedPECIState *s, uint32_t status)
+{
+    trace_aspeed_peci_raise_interrupt(s->regs[R_PECI_INT_CTRL], status);
+
+    s->regs[R_PECI_INT_STS] = s->regs[R_PECI_INT_CTRL] & status;
+    if (!s->regs[R_PECI_INT_STS]) {
+        return;
+    }
+    qemu_irq_raise(s->irq);
+}
+
+static uint64_t aspeed_peci_read(void *opaque, hwaddr offset, unsigned size)
+{
+    AspeedPECIState *s = ASPEED_PECI(opaque);
+    uint64_t data;
+
+    if (offset >= ASPEED_PECI_NR_REGS << 2) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        return 0;
+    }
+    data = s->regs[offset >> 2];
+
+    trace_aspeed_peci_read(offset, data);
+    return data;
+}
+
+static void aspeed_peci_write(void *opaque, hwaddr offset, uint64_t data,
+                              unsigned size)
+{
+    AspeedPECIState *s = ASPEED_PECI(opaque);
+
+    trace_aspeed_peci_write(offset, data);
+
+    if (offset >= ASPEED_PECI_NR_REGS << 2) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        return;
+    }
+
+    switch (offset) {
+    case A_PECI_INT_STS:
+        s->regs[R_PECI_INT_STS] &= ~data;
+        if (!s->regs[R_PECI_INT_STS]) {
+            qemu_irq_lower(s->irq);
+        }
+        break;
+    case A_PECI_CMD:
+        /*
+         * Only the FIRE bit is writable. Once the command is complete, it
+         * should be cleared. Since we complete the command immediately, the
+         * value is not stored in the register array.
+         */
+        if (!FIELD_EX32(data, PECI_CMD, FIRE)) {
+            break;
+        }
+        if (s->regs[R_PECI_INT_STS]) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Interrupt status must be "
+                          "cleared before firing another command: 0x%08x\n",
+                          __func__, s->regs[R_PECI_INT_STS]);
+            break;
+        }
+        s->regs[R_PECI_RD_DATA0] = ASPEED_PECI_CC_RSP_SUCCESS;
+        s->regs[R_PECI_WR_DATA0] = ASPEED_PECI_CC_RSP_SUCCESS;
+        aspeed_peci_raise_interrupt(s,
+                                    FIELD_DP32(0, PECI_INT_STS, CMD_DONE, 1));
+        break;
+    default:
+        s->regs[offset / sizeof(s->regs[0])] = data;
+        break;
+    }
+}
+
+static const MemoryRegionOps aspeed_peci_ops = {
+    .read = aspeed_peci_read,
+    .write = aspeed_peci_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void aspeed_peci_realize(DeviceState *dev, Error **errp)
+{
+    AspeedPECIState *s = ASPEED_PECI(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_peci_ops, s,
+                          TYPE_ASPEED_PECI, 0x1000);
+    sysbus_init_mmio(sbd, &s->mmio);
+    sysbus_init_irq(sbd, &s->irq);
+}
+
+static void aspeed_peci_reset(DeviceState *dev)
+{
+    AspeedPECIState *s = ASPEED_PECI(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+}
+
+static void aspeed_peci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = aspeed_peci_realize;
+    dc->reset = aspeed_peci_reset;
+    dc->desc = "Aspeed PECI Controller";
+}
+
+static const TypeInfo aspeed_peci_types[] = {
+    {
+        .name = TYPE_ASPEED_PECI,
+        .parent = TYPE_SYS_BUS_DEVICE,
+        .instance_size = sizeof(AspeedPECIState),
+        .class_init = aspeed_peci_class_init,
+        .abstract = false,
+    },
+};
+
+DEFINE_TYPES(aspeed_peci_types);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 132b7b7344..95268eddc0 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -116,7 +116,8 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_scu.c',
   'aspeed_sbc.c',
   'aspeed_sdmc.c',
-  'aspeed_xdma.c'))
+  'aspeed_xdma.c',
+  'aspeed_peci.c'))
 
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
 softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index c5e37b0154..90a0473b06 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -209,6 +209,11 @@ aspeed_i3c_device_write(uint32_t deviceid, uint64_t offset, uint64_t data) "I3C
 aspeed_sdmc_write(uint64_t reg, uint64_t data) "reg @0x%" PRIx64 " data: 0x%" PRIx64
 aspeed_sdmc_read(uint64_t reg, uint64_t data) "reg @0x%" PRIx64 " data: 0x%" PRIx64
 
+# aspeed_peci.c
+aspeed_peci_read(uint64_t offset, uint64_t data) "offset 0x%" PRIx64 " data 0x%" PRIx64
+aspeed_peci_write(uint64_t offset, uint64_t data) "offset 0x%" PRIx64 " data 0x%" PRIx64
+aspeed_peci_raise_interrupt(uint32_t ctrl, uint32_t status) "ctrl 0x%" PRIx32 " status 0x%" PRIx32
+
 # bcm2835_property.c
 bcm2835_mbox_property(uint32_t tag, uint32_t bufsize, size_t resplen) "mbox property tag:0x%08x in_sz:%u out_sz:%zu"
 
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 02a5a9ffcb..f72a8db50b 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -34,6 +34,7 @@
 #include "hw/usb/hcd-ehci.h"
 #include "qom/object.h"
 #include "hw/misc/aspeed_lpc.h"
+#include "hw/misc/aspeed_peci.h"
 
 #define ASPEED_SPIS_NUM  2
 #define ASPEED_EHCIS_NUM 2
@@ -73,6 +74,7 @@ struct AspeedSoCState {
     AspeedSDHCIState sdhci;
     AspeedSDHCIState emmc;
     AspeedLPCState lpc;
+    AspeedPECIState peci;
     uint32_t uart_default;
     Clock *sysclk;
 };
@@ -145,6 +147,7 @@ enum {
     ASPEED_DEV_LPC,
     ASPEED_DEV_IBT,
     ASPEED_DEV_I2C,
+    ASPEED_DEV_PECI,
     ASPEED_DEV_ETH1,
     ASPEED_DEV_ETH2,
     ASPEED_DEV_ETH3,
diff --git a/include/hw/misc/aspeed_peci.h b/include/hw/misc/aspeed_peci.h
new file mode 100644
index 0000000000..8382707d9f
--- /dev/null
+++ b/include/hw/misc/aspeed_peci.h
@@ -0,0 +1,29 @@
+/*
+ * Aspeed PECI Controller
+ *
+ * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
+ *
+ * This code is licensed under the GPL version 2 or later. See the COPYING
+ * file in the top-level directory.
+ */
+
+#ifndef ASPEED_PECI_H
+#define ASPEED_PECI_H
+
+#include "hw/sysbus.h"
+
+#define ASPEED_PECI_NR_REGS ((0xFC + 4) >> 2)
+#define TYPE_ASPEED_PECI "aspeed.peci"
+OBJECT_DECLARE_SIMPLE_TYPE(AspeedPECIState, ASPEED_PECI);
+
+struct AspeedPECIState {
+    /* <private> */
+    SysBusDevice parent;
+
+    MemoryRegion mmio;
+    qemu_irq irq;
+
+    uint32_t regs[ASPEED_PECI_NR_REGS];
+};
+
+#endif
-- 
2.37.0


