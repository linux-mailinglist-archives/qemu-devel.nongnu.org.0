Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EEF55F458
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 05:54:12 +0200 (CEST)
Received: from localhost ([::1]:38914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6OmI-0005yC-4U
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 23:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVW-0007xG-Og; Tue, 28 Jun 2022 23:36:50 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:50806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVU-0006oR-G3; Tue, 28 Jun 2022 23:36:50 -0400
Received: by mail-pj1-x1030.google.com with SMTP id go6so14472565pjb.0;
 Tue, 28 Jun 2022 20:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SzQWwnUtME47hns+L0n+YQNwQXFOjidePehK/A5S+y4=;
 b=nb6kKEeO2Z7RtR+nTKvVFvGj2OFiKtwG9R9+JLzG4tE0CFG5Z27OSFtRkQ/vCYrzZX
 Cg7FuVfBLu7hhUvMyX1lA/4HpUOCLyB/GS/7C1pFQoSUInGlLnMZ16/6rxMuKrUDJmvY
 eg3h9yWlwODcBLZ+DOv+ARc3+WoA2owvmmUuICnwbSfqwJNx0rZBTXNt+bTvFgUjuCe1
 9bJLft1GnUUwVIyqbvVIqb5kQKENQx0cVF+SWOAiuwaHXxc+L52VsYIXADtujzU+jHBe
 TiNnQP3acqQF8fGM7rC/i7TVVBhfsHcI/Jrs3jxEeXySfFT/NM47Z8QgOgK5K6Xxzl2T
 wLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SzQWwnUtME47hns+L0n+YQNwQXFOjidePehK/A5S+y4=;
 b=nwj5ZpCi6APNyF9F6Wj3t15RUcyN+7Vfnaxk2d+gf9zJVKnpM4+6Ln12O0Xahh+Q+h
 XuhxgiSk2cpm/aVy3Ea4LAOpJscSbtwBD+MR4xjYw4BaXUqPos3EIVm7vZzYl1Fueu9s
 sja3Qtv3xpI4JxbhpAdwyGjYozfA/JXIOvimklta911H/NxSQ1oqDHJObU2g75i/gK7q
 trsTSB0O89/CQzYgN+iTYgxBFT7IXLQkWcYPYkBrFZ4H/IpOID0szI2VP4rMvOxZxPEm
 RvtSGfquw/qlrM5T9FhQt2r90OEhKfOg8hsVJGn0EosU/3vQOsNfefRAhhYcIAgz6dsJ
 y3aw==
X-Gm-Message-State: AJIora8f5BwCTJcGj59iDFjmE/CRF+/MUBu5q8ru09GY7hbDkgAtLaJB
 W24T0gNOQzUFyAsshg7Yzs6e4eSvQC8Pww==
X-Google-Smtp-Source: AGRyM1uVxpx51DiHh9q0K/Nnql0Jn5lLvVM99HL/APrrOMpqiHDNBOgFQSX+cZCAzQjRmzlz7XR4wQ==
X-Received: by 2002:a17:903:22c7:b0:16a:7114:feb4 with SMTP id
 y7-20020a17090322c700b0016a7114feb4mr7010122plg.22.1656473806400; 
 Tue, 28 Jun 2022 20:36:46 -0700 (PDT)
Received: from localhost (fwdproxy-prn-012.fbsv.net.
 [2a03:2880:ff:c::face:b00c]) by smtp.gmail.com with ESMTPSA id
 h5-20020a170902f7c500b00163bfaf0b17sm6774673plw.233.2022.06.28.20.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 20:36:46 -0700 (PDT)
From: Peter Delevoryas <peterdelevoryas@gmail.com>
X-Google-Original-From: Peter Delevoryas <pdel@fb.com>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v2 12/13] hw/misc/aspeed: Add intel-me
Date: Tue, 28 Jun 2022 20:36:33 -0700
Message-Id: <20220629033634.3850922-13-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629033634.3850922-1-pdel@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=peterdelevoryas@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
index af0b9c5dbf..089668ff6c 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -272,3 +272,11 @@ virt_ctrl_instance_init(void *dev) "ctrl: %p"
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
2.30.2


