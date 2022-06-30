Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4F6561082
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 07:16:00 +0200 (CEST)
Received: from localhost ([::1]:43482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6mX2-00056p-0e
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 01:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6mAF-0003Zk-NE; Thu, 30 Jun 2022 00:52:27 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:49213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6mA9-00073O-Ov; Thu, 30 Jun 2022 00:52:27 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 5D59E2B058FC;
 Thu, 30 Jun 2022 00:52:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 30 Jun 2022 00:52:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656564738; x=1656568338; bh=Zg
 XC7nI9x+hlJrthfs0GdYoIqYuE9xKR+qshCuVM6hg=; b=YKv3YLOwk4O1StS44X
 KFJcYLhrpCbuwSV7flEB/A7/lqFgJXxIti8LMh5JsahBXbeWJX68IXtk2V4ywK/p
 0PETfyODB1cmViMW+CpDbv1B8d/aMBsshO/DVWofMZBJ3YPVmmFCa3+YHf44/vgA
 26fLmDqYHno2Mym8YbVt0BZJX5YhU2IF/R4rt7hqIU4/xCQ+IUJNZR4xgXeJJWHx
 Mi16Y9IxPwZYDFZ00ZCbTzBO8boC68pnXhh0frw7xS4+h0wF7uvl6T/8+5KIcWgf
 h8xO84b9ao1Tl00w32SJQFhIidGvBnTEgAP7X/NBvYC4Zwh5S7mZ6l6hdfeu8Fh+
 L3Yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1656564738; x=1656568338; bh=ZgX
 C7nI9x+hlJrthfs0GdYoIqYuE9xKR+qshCuVM6hg=; b=sE6NZNoP3cS94oWtL2L
 2zwBDuIwq3XOnVnXTF9MAvjSLco64Dymq0KVIdnOqk/TF/gdpqsRCgO+W22xei56
 HtIGWkcUCMm+cOOT8X5Uzd7zrJCHiY554PYulg1XA7npvfPb6L30gNPP4EPLxzOA
 F7KYYY9bj2Z5hbd3cMJr+O8scuSuWw/JQh/oZGYDLmi8vlTVRcBoKz+gIZADiSPy
 AP1lYBnRcHuNNDasFQIZXWB6m9rM1RK8mRYn8vaLzowgSfevErN+Dc1RiGdE53lz
 W+1rPpz4oW0L+tG83hZOkqXzG2sTNSXnN4gQxaB5AVln77Byo0IsYJnbCEEhytWy
 TkA==
X-ME-Sender: <xms:Aiy9YsJ_NYpMsH4tGZZORHJrD1g8XbDPyhpw-XK3Y_T0VVlkZR0mAQ>
 <xme:Aiy9YsLNXTRUUvPg9XuRT-yS5EEgERdSlclcSPBZZPyUNxm_qHJeHDv-vvYJQKLHw
 RRofzu7oF42HP99o9U>
X-ME-Received: <xmr:Aiy9Yss_BXXYV9JUOV1Q3HFozScFxjPG3k5AVeU_GCvzeAEi6O9Cm1fYXkaLOnI_ka7wDQpBPGBQA7YhO7MQPtiAnwpdtj0S>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehtddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceomhgvsehpjhgurdguvghvqeenucggtffrrghtth
 gvrhhnpedvvddvvdeikeetuddtteejleeuudehuddvtedtheetvefhtdeifeeguefgtdeg
 udenucffohhmrghinhepmhgvthgrrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgvsehpjhgurdguvghv
X-ME-Proxy: <xmx:Aiy9Ypb3k6h9BDJq7DeB1BHq5qkEEGRhfGUFLURdW-qe_8Ygnta3kQ>
 <xmx:Aiy9Yjbz_EX0cqL3yEO-wtX5VIHIkd1ATlkiME4WpVCYQe-WBJP49Q>
 <xmx:Aiy9YlCu5JnOvmouo3PcZBIYFogweOAfwN83jU5ies7OJuMB00sYjw>
 <xmx:Aiy9YhOxfwAdw20cV0FihbVcUpRYow9iISpjwlxCk2wnl1Oi23KuwLAagXg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 00:52:18 -0400 (EDT)
From: Peter Delevoryas <me@pjd.dev>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v3 13/14] hw/misc/aspeed: Add intel-me
Date: Wed, 29 Jun 2022 21:51:32 -0700
Message-Id: <20220630045133.32251-14-me@pjd.dev>
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

The Intel Management Engine is an IPMI endpoint that responds to various
IPMI commands. In this commit, I've added some very basic functionality that
will respond back with a respond code of zero (success), while also setting
an appropriate response NetFN (request NetFN + 1), a matching command ID and
sequence number, and the 2 standard checksums. Other data is not provided,
but the model here could be extended to respond to more kinds of requests.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 MAINTAINERS          |   1 +
 hw/misc/intel_me.c   | 162 +++++++++++++++++++++++++++++++++++++++++++
 hw/misc/meson.build  |   3 +-
 hw/misc/trace-events |   8 +++
 4 files changed, 173 insertions(+), 1 deletion(-)
 create mode 100644 hw/misc/intel_me.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3ffd473db1..3220644bb5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1068,6 +1068,7 @@ F: include/hw/net/ftgmac100.h
 F: docs/system/arm/aspeed.rst
 F: tests/qtest/*aspeed*
 F: hw/misc/fby35_sb_cpld.c
+F: hw/misc/intel_me.c
 
 NRF51
 M: Joel Stanley <joel@jms.id.au>
diff --git a/hw/misc/intel_me.c b/hw/misc/intel_me.c
new file mode 100644
index 0000000000..933ae45101
--- /dev/null
+++ b/hw/misc/intel_me.c
@@ -0,0 +1,162 @@
+/*
+ * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
+ *
+ * This code is licensed under the GPL version 2 or later. See the COPYING
+ * file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+#include "hw/i2c/i2c.h"
+#include "trace.h"
+
+#define TYPE_INTEL_ME "intel-me"
+OBJECT_DECLARE_SIMPLE_TYPE(IntelMEState, INTEL_ME);
+
+struct IntelMEState {
+    I2CSlave parent_obj;
+
+    I2CBus *bus;
+    QEMUBH *bh;
+    int rx_len;
+    int tx_len;
+    int tx_pos;
+    uint8_t rx_buf[512];
+    uint8_t tx_buf[512];
+};
+
+static void intel_me_bh(void *opaque)
+{
+    IntelMEState *s = opaque;
+    I2CSlave *i2c = I2C_SLAVE(s);
+    uint8_t target_addr;
+
+    assert(s->bus->bh == s->bh);
+
+    switch (s->tx_pos) {
+    case 0:
+        target_addr = s->tx_buf[s->tx_pos++];
+        trace_intel_me_tx_start(i2c->address, target_addr);
+        if (i2c_start_send_async(s->bus, target_addr) != 0) {
+            break;
+        }
+        return;
+    default:
+        if (s->tx_pos >= s->tx_len) {
+            break;
+        }
+        trace_intel_me_tx_data(i2c->address, s->tx_buf[s->tx_pos]);
+        if (i2c_send_async(s->bus, s->tx_buf[s->tx_pos++]) != 0) {
+            break;
+        }
+        return;
+    }
+
+    trace_intel_me_tx_end(i2c->address);
+    i2c_end_transfer(s->bus);
+    i2c_bus_release(s->bus);
+    s->tx_len = 0;
+    s->tx_pos = 0;
+    memset(s->tx_buf, 0, sizeof(s->tx_buf));
+}
+
+static void intel_me_realize(DeviceState *dev, Error **errp)
+{
+    IntelMEState *s = INTEL_ME(dev);
+
+    s->bus = I2C_BUS(qdev_get_parent_bus(dev));
+    s->bh = qemu_bh_new(intel_me_bh, s);
+    s->rx_len = 0;
+    s->tx_len = 0;
+    s->tx_pos = 0;
+    memset(s->rx_buf, 0, sizeof(s->rx_buf));
+    memset(s->tx_buf, 0, sizeof(s->tx_buf));
+}
+
+static uint8_t checksum(const uint8_t *ptr, int len)
+{
+    int sum = 0;
+
+    for (int i = 0; i < len; i++) {
+        sum += ptr[i];
+    }
+
+    return 256 - sum;
+}
+
+static int intel_me_i2c_event(I2CSlave *i2c, enum i2c_event event)
+{
+    IntelMEState *s = INTEL_ME(i2c);
+
+    switch (event) {
+    case I2C_START_RECV:
+        break;
+    case I2C_START_SEND:
+        trace_intel_me_rx_start(i2c->address);
+        s->rx_len = 0;
+        memset(s->rx_buf, 0, sizeof(s->rx_buf));
+        break;
+    case I2C_START_SEND_ASYNC:
+        break;
+    case I2C_FINISH:
+        trace_intel_me_rx_end(i2c->address);
+        s->tx_len = 10;
+        s->tx_pos = 0;
+        s->tx_buf[0] = s->rx_buf[2];
+        s->tx_buf[1] = ((s->rx_buf[0] >> 2) + 1) << 2;
+        s->tx_buf[2] = checksum(s->tx_buf, 2);
+        s->tx_buf[3] = i2c->address;
+        s->tx_buf[4] = (s->rx_buf[3] >> 2) << 2;
+        s->tx_buf[5] = s->rx_buf[4];
+        s->tx_buf[6] = 0x00;
+        s->tx_buf[7] = 0x55;
+        s->tx_buf[8] = 0x00;
+        s->tx_buf[9] = checksum(s->tx_buf, s->tx_len - 1);
+        s->tx_buf[0] >>= 1;
+        i2c_bus_master(s->bus, s->bh);
+        break;
+    case I2C_NACK:
+        break;
+    }
+
+    return 0;
+}
+
+static uint8_t intel_me_i2c_recv(I2CSlave *i2c)
+{
+    return 0xff;
+}
+
+static int intel_me_i2c_send(I2CSlave *i2c, uint8_t data)
+{
+    IntelMEState *s = INTEL_ME(i2c);
+
+    trace_intel_me_rx_data(i2c->address, data);
+
+    assert(s->rx_len < sizeof(s->rx_buf));
+    s->rx_buf[s->rx_len++] = data;
+
+    return 0;
+}
+
+static void intel_me_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    I2CSlaveClass *i2c = I2C_SLAVE_CLASS(oc);
+
+    dc->realize = intel_me_realize;
+    i2c->event = intel_me_i2c_event;
+    i2c->recv = intel_me_i2c_recv;
+    i2c->send = intel_me_i2c_send;
+}
+
+static const TypeInfo types[] = {
+    {
+        .name = TYPE_INTEL_ME,
+        .parent = TYPE_I2C_SLAVE,
+        .instance_size = sizeof(IntelMEState),
+        .class_init = intel_me_class_init,
+    },
+};
+
+DEFINE_TYPES(types);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 948e25c440..165b9dce6d 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -118,7 +118,8 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_sdmc.c',
   'aspeed_xdma.c',
   'aspeed_peci.c',
-  'fby35_sb_cpld.c'))
+  'fby35_sb_cpld.c',
+  'intel_me.c'))
 
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
 softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 90a0473b06..7ca23bcf27 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -273,3 +273,11 @@ virt_ctrl_instance_init(void *dev) "ctrl: %p"
 lasi_chip_mem_valid(uint64_t addr, uint32_t val) "access to addr 0x%"PRIx64" is %d"
 lasi_chip_read(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
 lasi_chip_write(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
+
+# intel_me.c
+intel_me_rx_start(uint8_t addr) "addr 0x%02x"
+intel_me_rx_data(uint8_t addr, uint8_t data) "addr 0x%02x data 0x%02x"
+intel_me_rx_end(uint8_t addr) "addr 0x%02x"
+intel_me_tx_start(uint8_t addr, uint8_t target_addr) "addr 0x%02x target_addr 0x%02x"
+intel_me_tx_data(uint8_t addr, uint8_t data) "addr 0x%02x data 0x%02x"
+intel_me_tx_end(uint8_t addr) "addr 0x%02x"
-- 
2.37.0


