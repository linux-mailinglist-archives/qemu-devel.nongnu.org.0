Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FB76EDBAE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 08:37:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prCHp-0004NU-W3; Tue, 25 Apr 2023 02:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1prCHK-0004K4-IH; Tue, 25 Apr 2023 02:35:54 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1prCHH-0003Ao-2R; Tue, 25 Apr 2023 02:35:54 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 4E4745C017D;
 Tue, 25 Apr 2023 02:35:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 25 Apr 2023 02:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1682404548; x=1682490948; bh=JmgudCPhwrcz2Bdk/JGujzRUC
 UcMwMpYILpdyL7sgKc=; b=DIykhEJQLcCM65Pvou/CDnqX8u+cQ0WmjPhretsZt
 UnpBiuc0dFGd+ucppy+62pJwd24L00L0mEDLPtr9NGw3JwGuVzkSvBebwRTK3U+K
 g8FImJnx7SpW/m1KP1sXSCRcHRH3/azJ9I9U3tqb8ZDE/PI7SKmXk93rRGi4FCPJ
 IRvB5CKKIhlw1t6zk4V+T55ci64VTnZicKXEzw3DBFbKO5xKodtIJzVy2lZTL8s3
 hNfe9but58TCwkSa6EoN0poLcC+1E0J2RKA3/h6CV3zQTabLurA/bXTbqHdWxMbo
 1PIff1yMtH/OWTbXlwveYCak95mWjBUSQL0q0NaUHWHBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1682404548; x=1682490948; bh=JmgudCPhwrcz2Bdk/JGujzRUCUcMwMpYILp
 dyL7sgKc=; b=elMLfunaq7BkthQQr+xkJbqueBxSLn5utVFFl6khut75M1Wk+db
 of4FVxqKkIXUF8YMUXQnil9GmHwNluSmuBVrkdlmeBIkexph4g4ARG6/lxNxqjYN
 zMZBZeXMYmc2bmwbiThi1sEz5XEd7VJpQn5yopljKl1DFty8SH6aJ6VUFgHK81lS
 R/Yov8EDCUJ3kMJSsFO/OnO8Pn5lqlnpUvVg396fhtRBoLfO68l1IlPQJoFf0sGm
 Thux+erC3BjimRsUoxvB0UopSrmaOexaKApPS5OS8EhPOV3l5EATskxninJmYZpp
 hgugOXpt/Kf7BT+PwdS7vGAapOWG501e6vA==
X-ME-Sender: <xms:xHRHZLiMo2Rk4eZyE4gjeKqzogOhfTL-GaQCJ_wulJUNjmrUXFUi7g>
 <xme:xHRHZIBWplt1JtunS1c_8F6gXOrBjMBZOQkg77tBIdHKiIBqVNYHEuzIE1zu0eSmO
 EoZptFpQNLuh1N0yLo>
X-ME-Received: <xmr:xHRHZLEs6ix-5w5TZmuU5_KTi-jyiJszaToQO8fC-mrAwuVwGwqnKeH72Ykcjk12pqv5n-cesn4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduuddgudduvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhl
 rghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrf
 grthhtvghrnhepffekgfetgefhudelffetiedvgefggeetgeekgfdvveevieetfeekudeg
 ieelveffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdr
 ughk
X-ME-Proxy: <xmx:xHRHZIR563mUWgFSq3ZI7U0WUqFZa73Zhdzz1ny4kHdzRSzLbTOCFw>
 <xmx:xHRHZIwZYzId1vENipc5y-KlKzjmcb6zi2hT8cqLW4eaqJ9uwwqfQg>
 <xmx:xHRHZO5EHPOEAQMs6wBBFf1F1rfJxW49sb4-bbqLa92L1chmAJIYlQ>
 <xmx:xHRHZEhGA5L1xPe8gi5VUZZ8P4VQ5fQx9ODH7PYpGlVeTA0QaxGYYg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 02:35:45 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Corey Minyard <cminyard@mvista.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Klaus Jensen <its@irrelevant.dk>, qemu-arm@nongnu.org,
 Peter Delevoryas <peter@pjd.dev>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Lior Weintraub <liorw@pliops.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Matt Johnston <matt@codeconstruct.com.au>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v2 1/3] hw/i2c: add mctp core
Date: Tue, 25 Apr 2023 08:35:38 +0200
Message-Id: <20230425063540.46143-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425063540.46143-1-its@irrelevant.dk>
References: <20230425063540.46143-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=19993; i=k.jensen@samsung.com;
 h=from:subject; bh=YxOtC2LyTCrYIvOm1bfwTslr6qOmwjCDGuaiK4gDIKI=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGRHdLqQT/YFgnATXmAqEwPpxw425GFJ2ZlyD
 7ADx3Dw/0fwg4kBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJkR3S6AAoJEE3hrzFt
 Tw3p+CQH/ivetHQdYVijK892lyVD3nibdWvtGhQcPuVdLe0fNLrLP5XR83vE4WGa/X0jasigCRn
 3KmQbNcOCu63ntaM6ARG+oJT1BqCnrodoYiHmnVkf9KJQknFfEXBtC6vsTY2jPF0kL8Vaw0n8X6
 zPaFuxnG8Cl4Q7SQVPrPKPwAYL1N9GW0fYIhwZNtdMQ+A85VEgSq6UkFfvWd39aqOGixd3akfg2
 OdSeFsEU6a9uNffpk6jI8wIX/ZWm8UwGc0n1+nt1ZHisDx+k2/m9oKLcNJV1O8KHeKakip03doh
 D55NY7KJTr0qIb9pLWgRK1lngJoZeLd0O6ggkvuDD8Yyq4Hzy8hyI6jQ
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Klaus Jensen <k.jensen@samsung.com>

Add an abstract MCTP over I2C endpoint model. This implements MCTP
control message handling as well as handling the actual I2C transport
(packetization).

Devices are intended to derive from this and implement the class
methods.

Parts of this implementation is inspired by code[1] previously posted by
Jonathan Cameron.

  [1]: https://lore.kernel.org/qemu-devel/20220520170128.4436-1-Jonathan.Cameron@huawei.com/

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 MAINTAINERS                   |   7 +
 hw/arm/Kconfig                |   1 +
 hw/i2c/Kconfig                |   4 +
 hw/i2c/mctp.c                 | 352 ++++++++++++++++++++++++++++++++++
 hw/i2c/meson.build            |   1 +
 hw/i2c/smbus_master.c         |  28 +++
 hw/i2c/trace-events           |  12 ++
 include/hw/i2c/mctp.h         | 114 +++++++++++
 include/hw/i2c/smbus_master.h |   3 +
 include/net/mctp.h            |  43 +++++
 10 files changed, 565 insertions(+)
 create mode 100644 hw/i2c/mctp.c
 create mode 100644 include/hw/i2c/mctp.h
 create mode 100644 include/net/mctp.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 24154f5721c7..054aad1f3e97 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3339,6 +3339,13 @@ F: tests/qtest/adm1272-test.c
 F: tests/qtest/max34451-test.c
 F: tests/qtest/isl_pmbus_vr-test.c
 
+MCTP I2C Transport
+M: Klaus Jensen <k.jensen@samsung.com>
+S: Maintained
+F: hw/i2c/mctp.c
+F: include/hw/i2c/mctp.h
+F: include/net/mctp.h
+
 Firmware schema specifications
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Daniel P. Berrange <berrange@redhat.com>
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index b53bd7f0b2a0..d7ecbc99e5ee 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -457,6 +457,7 @@ config ASPEED_SOC
     select DS1338
     select FTGMAC100
     select I2C
+    select MCTP_I2C
     select DPS310
     select PCA9552
     select SERIAL
diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
index 14886b35dac2..3415e8421ab1 100644
--- a/hw/i2c/Kconfig
+++ b/hw/i2c/Kconfig
@@ -45,3 +45,7 @@ config PCA954X
 config PMBUS
     bool
     select SMBUS
+
+config MCTP_I2C
+    bool
+    select I2C
diff --git a/hw/i2c/mctp.c b/hw/i2c/mctp.c
new file mode 100644
index 000000000000..0f4045d0d685
--- /dev/null
+++ b/hw/i2c/mctp.c
@@ -0,0 +1,352 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * SPDX-FileCopyrightText: Copyright (c) 2022 Samsung Electronics Co., Ltd.
+ * SPDX-FileContributor: Klaus Jensen <k.jensen@samsung.com>
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+
+#include "hw/qdev-properties.h"
+#include "hw/i2c/i2c.h"
+#include "hw/i2c/smbus_master.h"
+#include "hw/i2c/mctp.h"
+
+#include "trace.h"
+
+void i2c_mctp_schedule_send(MCTPI2CEndpoint *mctp)
+{
+    I2CBus *i2c = I2C_BUS(qdev_get_parent_bus(DEVICE(mctp)));
+
+    mctp->tx.state = I2C_MCTP_STATE_TX_START_SEND;
+
+    i2c_bus_master(i2c, mctp->tx.bh);
+}
+
+static void i2c_mctp_tx(void *opaque)
+{
+    DeviceState *dev = DEVICE(opaque);
+    I2CBus *i2c = I2C_BUS(qdev_get_parent_bus(dev));
+    I2CSlave *slave = I2C_SLAVE(dev);
+    MCTPI2CEndpoint *mctp = MCTP_I2C_ENDPOINT(dev);
+    MCTPI2CEndpointClass *mc = MCTP_I2C_ENDPOINT_GET_CLASS(mctp);
+    MCTPI2CPacket *pkt = (MCTPI2CPacket *)mctp->buffer;
+    uint8_t flags = 0;
+
+    switch (mctp->tx.state) {
+    case I2C_MCTP_STATE_TX_SEND_BYTE:
+        if (mctp->pos < mctp->len) {
+            uint8_t byte = mctp->buffer[mctp->pos];
+
+            trace_i2c_mctp_tx_send_byte(mctp->pos, byte);
+
+            /* send next byte */
+            i2c_send_async(i2c, byte);
+
+            mctp->pos++;
+
+            break;
+        }
+
+        /* packet sent */
+        i2c_end_transfer(i2c);
+
+        /* end of any control data */
+        mctp->len = 0;
+
+        /* fall through */
+
+    case I2C_MCTP_STATE_TX_START_SEND:
+        if (mctp->tx.is_control) {
+            /* packet payload is already in buffer */
+            flags |= MCTP_H_FLAGS_SOM | MCTP_H_FLAGS_EOM;
+        } else {
+            /* get message bytes from derived device */
+            mctp->len = mc->get_message_bytes(mctp, pkt->mctp.payload,
+                                              I2C_MCTP_MAXMTU, &flags);
+        }
+
+        if (!mctp->len) {
+            trace_i2c_mctp_tx_done();
+
+            /* no more packets needed; release the bus */
+            i2c_bus_release(i2c);
+
+            mctp->state = I2C_MCTP_STATE_IDLE;
+            mctp->tx.is_control = false;
+
+            break;
+        }
+
+        mctp->state = I2C_MCTP_STATE_TX;
+
+        pkt->i2c = (MCTPI2CPacketHeader) {
+            .dest = mctp->tx.addr & ~0x1,
+            .prot = 0xf,
+            .byte_count = 5 + mctp->len,
+            .source = slave->address << 1 | 0x1,
+        };
+
+        pkt->mctp.hdr = (MCTPPacketHeader) {
+            .version = 0x1,
+            .eid.dest = mctp->tx.eid,
+            .eid.source = mctp->my_eid,
+            .flags = flags | (mctp->tx.pktseq++ & 0x3) << 4 | mctp->tx.flags,
+        };
+
+        mctp->len += sizeof(MCTPI2CPacket);
+        assert(mctp->len < I2C_MCTP_MAX_LENGTH);
+
+        mctp->buffer[mctp->len] = i2c_smbus_pec(0, mctp->buffer, mctp->len);
+        mctp->len++;
+
+        trace_i2c_mctp_tx_start_send(mctp->len);
+
+        i2c_start_send_async(i2c, pkt->i2c.dest >> 1);
+
+        /* already "sent" the destination slave address */
+        mctp->pos = 1;
+
+        mctp->tx.state = I2C_MCTP_STATE_TX_SEND_BYTE;
+
+        break;
+    }
+}
+
+#define i2c_mctp_control_data(buf) \
+    (i2c_mctp_payload(buf) + offsetof(MCTPControlMessage, data))
+
+static void i2c_mctp_handle_control_set_eid(MCTPI2CEndpoint *mctp, uint8_t eid)
+{
+    mctp->my_eid = eid;
+
+    uint8_t buf[] = {
+        0x0, 0x0, eid, 0x0,
+    };
+
+    memcpy(i2c_mctp_control_data(mctp->buffer), buf, sizeof(buf));
+    mctp->len += sizeof(buf);
+}
+
+static void i2c_mctp_handle_control_get_eid(MCTPI2CEndpoint *mctp)
+{
+    uint8_t buf[] = {
+        0x0, mctp->my_eid, 0x0, 0x0,
+    };
+
+    memcpy(i2c_mctp_control_data(mctp->buffer), buf, sizeof(buf));
+    mctp->len += sizeof(buf);
+}
+
+static void i2c_mctp_handle_control_get_version(MCTPI2CEndpoint *mctp)
+{
+    uint8_t buf[] = {
+        0x0, 0x1, 0x0, 0x1, 0x3, 0x1,
+    };
+
+    memcpy(i2c_mctp_control_data(mctp->buffer), buf, sizeof(buf));
+    mctp->len += sizeof(buf);
+}
+
+enum {
+    MCTP_CONTROL_SET_EID                    = 0x01,
+    MCTP_CONTROL_GET_EID                    = 0x02,
+    MCTP_CONTROL_GET_VERSION                = 0x04,
+    MCTP_CONTROL_GET_MESSAGE_TYPE_SUPPORT   = 0x05,
+};
+
+static void i2c_mctp_handle_control(MCTPI2CEndpoint *mctp)
+{
+    MCTPI2CEndpointClass *mc = MCTP_I2C_ENDPOINT_GET_CLASS(mctp);
+    MCTPControlMessage *msg = (MCTPControlMessage *)i2c_mctp_payload(mctp->buffer);
+
+    /* clear Rq/D */
+    msg->flags &= 0x1f;
+
+    mctp->len = sizeof(MCTPControlMessage);
+
+    trace_i2c_mctp_handle_control(msg->command);
+
+    switch (msg->command) {
+    case MCTP_CONTROL_SET_EID:
+        i2c_mctp_handle_control_set_eid(mctp, msg->data[1]);
+        break;
+
+    case MCTP_CONTROL_GET_EID:
+        i2c_mctp_handle_control_get_eid(mctp);
+        break;
+
+    case MCTP_CONTROL_GET_VERSION:
+        i2c_mctp_handle_control_get_version(mctp);
+        break;
+
+    case MCTP_CONTROL_GET_MESSAGE_TYPE_SUPPORT:
+        mctp->len += mc->get_message_types(mctp, i2c_mctp_control_data(mctp->buffer),
+                                           MCTP_BASELINE_MTU - mctp->len);
+        break;
+
+    default:
+        trace_i2c_mctp_unhandled_control(msg->command);
+
+        msg->data[0] = MCTP_CONTROL_ERROR_UNSUPPORTED_CMD;
+        mctp->len++;
+
+        break;
+    }
+
+    assert(mctp->len <= MCTP_BASELINE_MTU);
+
+    i2c_mctp_schedule_send(mctp);
+}
+
+static int i2c_mctp_event_cb(I2CSlave *i2c, enum i2c_event event)
+{
+    MCTPI2CEndpoint *mctp = MCTP_I2C_ENDPOINT(i2c);
+    MCTPI2CEndpointClass *mc = MCTP_I2C_ENDPOINT_GET_CLASS(mctp);
+    MCTPI2CPacket *pkt = (MCTPI2CPacket *)mctp->buffer;
+    size_t payload_len;
+    uint8_t pec;
+
+    switch (event) {
+    case I2C_START_SEND:
+        if (mctp->state == I2C_MCTP_STATE_IDLE) {
+            mctp->state = I2C_MCTP_STATE_RX_STARTED;
+        } else if (mctp->state != I2C_MCTP_STATE_RX) {
+            return -1;
+        }
+
+        /* the i2c core eats the slave address, so put it back in */
+        pkt->i2c.dest = i2c->address << 1;
+        mctp->len = 1;
+
+        return 0;
+
+    case I2C_FINISH:
+        if (mctp->len < sizeof(MCTPI2CPacket) + 1) {
+            trace_i2c_mctp_drop("short packet");
+            goto drop;
+        }
+
+        payload_len = mctp->len - (1 + offsetof(MCTPI2CPacket, mctp.payload));
+
+        if (pkt->i2c.byte_count + 3 != mctp->len - 1) {
+            trace_i2c_mctp_drop_invalid_length(pkt->i2c.byte_count + 3,
+                                               mctp->len - 1);
+            goto drop;
+        }
+
+        pec = i2c_smbus_pec(0, mctp->buffer, mctp->len - 1);
+        if (mctp->buffer[mctp->len - 1] != pec) {
+            trace_i2c_mctp_drop_invalid_pec(mctp->buffer[mctp->len - 1], pec);
+            goto drop;
+        }
+
+        if (pkt->mctp.hdr.eid.dest != mctp->my_eid) {
+            trace_i2c_mctp_drop_invalid_eid(pkt->mctp.hdr.eid.dest,
+                                            mctp->my_eid);
+            goto drop;
+        }
+
+        if (pkt->mctp.hdr.flags & MCTP_H_FLAGS_SOM) {
+            mctp->tx.is_control = false;
+
+            if (mctp->state == I2C_MCTP_STATE_RX) {
+                mc->reset_message(mctp);
+            }
+
+            mctp->state = I2C_MCTP_STATE_RX;
+
+            mctp->tx.addr = pkt->i2c.source;
+            mctp->tx.eid = pkt->mctp.hdr.eid.source;
+            mctp->tx.flags = pkt->mctp.hdr.flags & 0x7;
+            mctp->tx.pktseq = (pkt->mctp.hdr.flags >> 4) & 0x3;
+
+            if ((pkt->mctp.payload[0] & 0x7f) == MCTP_MESSAGE_TYPE_CONTROL) {
+                mctp->tx.is_control = true;
+
+                i2c_mctp_handle_control(mctp);
+
+                return 0;
+            }
+        } else if (mctp->state == I2C_MCTP_STATE_RX_STARTED) {
+            trace_i2c_mctp_drop("expected SOM");
+            goto drop;
+        } else if (((pkt->mctp.hdr.flags >> 4) & 0x3) != (++mctp->tx.pktseq & 0x3)) {
+            trace_i2c_mctp_drop_invalid_pktseq((pkt->mctp.hdr.flags >> 4) & 0x3,
+                                               mctp->tx.pktseq & 0x3);
+            goto drop;
+        }
+
+        mc->put_message_bytes(mctp, i2c_mctp_payload(mctp->buffer), payload_len);
+
+        if (pkt->mctp.hdr.flags & MCTP_H_FLAGS_EOM) {
+            mc->handle_message(mctp);
+            mctp->state = I2C_MCTP_STATE_WAIT_TX;
+        }
+
+        return 0;
+
+    default:
+        return -1;
+    }
+
+drop:
+    mc->reset_message(mctp);
+
+    mctp->state = I2C_MCTP_STATE_IDLE;
+
+    return 0;
+}
+
+static int i2c_mctp_send_cb(I2CSlave *i2c, uint8_t data)
+{
+    MCTPI2CEndpoint *mctp = MCTP_I2C_ENDPOINT(i2c);
+
+    if (mctp->len < I2C_MCTP_MAX_LENGTH) {
+        mctp->buffer[mctp->len++] = data;
+        return 0;
+    }
+
+    return -1;
+}
+
+static void i2c_mctp_instance_init(Object *obj)
+{
+    MCTPI2CEndpoint *mctp = MCTP_I2C_ENDPOINT(obj);
+
+    mctp->tx.bh = qemu_bh_new(i2c_mctp_tx, mctp);
+}
+
+static Property mctp_i2c_props[] = {
+    DEFINE_PROP_UINT8("eid", MCTPI2CEndpoint, my_eid, 0x9),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void i2c_mctp_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    I2CSlaveClass *k = I2C_SLAVE_CLASS(oc);
+
+    k->event = i2c_mctp_event_cb;
+    k->send = i2c_mctp_send_cb;
+
+    device_class_set_props(dc, mctp_i2c_props);
+}
+
+static const TypeInfo i2c_mctp_info = {
+    .name = TYPE_MCTP_I2C_ENDPOINT,
+    .parent = TYPE_I2C_SLAVE,
+    .abstract = true,
+    .instance_init = i2c_mctp_instance_init,
+    .instance_size = sizeof(MCTPI2CEndpoint),
+    .class_init = i2c_mctp_class_init,
+    .class_size = sizeof(MCTPI2CEndpointClass),
+};
+
+static void register_types(void)
+{
+    type_register_static(&i2c_mctp_info);
+}
+
+type_init(register_types)
diff --git a/hw/i2c/meson.build b/hw/i2c/meson.build
index 3996564c25c6..fd1f9022fd96 100644
--- a/hw/i2c/meson.build
+++ b/hw/i2c/meson.build
@@ -1,5 +1,6 @@
 i2c_ss = ss.source_set()
 i2c_ss.add(when: 'CONFIG_I2C', if_true: files('core.c'))
+i2c_ss.add(when: 'CONFIG_MCTP_I2C', if_true: files('mctp.c'))
 i2c_ss.add(when: 'CONFIG_SMBUS', if_true: files('smbus_slave.c', 'smbus_master.c'))
 i2c_ss.add(when: 'CONFIG_ACPI_SMBUS', if_true: files('pm_smbus.c'))
 i2c_ss.add(when: 'CONFIG_ACPI_ICH9', if_true: files('smbus_ich9.c'))
diff --git a/hw/i2c/smbus_master.c b/hw/i2c/smbus_master.c
index 6a53c34e70b7..47f9eb24e033 100644
--- a/hw/i2c/smbus_master.c
+++ b/hw/i2c/smbus_master.c
@@ -15,6 +15,34 @@
 #include "hw/i2c/i2c.h"
 #include "hw/i2c/smbus_master.h"
 
+static uint8_t crc8(uint16_t data)
+{
+#define POLY (0x1070U << 3)
+    int i;
+
+    for (i = 0; i < 8; i++) {
+        if (data & 0x8000) {
+            data = data ^ POLY;
+        }
+
+        data = data << 1;
+    }
+
+    return (uint8_t)(data >> 8);
+#undef POLY
+}
+
+uint8_t i2c_smbus_pec(uint8_t crc, uint8_t *buf, size_t len)
+{
+    int i;
+
+    for (i = 0; i < len; i++) {
+        crc = crc8((crc ^ buf[i]) << 8);
+    }
+
+    return crc;
+}
+
 /* Master device commands.  */
 int smbus_quick_command(I2CBus *bus, uint8_t addr, int read)
 {
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index 8e88aa24c1ac..2e3065a99873 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -45,3 +45,15 @@ npcm7xx_smbus_recv_fifo(const char *id, uint8_t received, uint8_t expected) "%s
 
 pca954x_write_bytes(uint8_t value) "PCA954X write data: 0x%02x"
 pca954x_read_data(uint8_t value) "PCA954X read data: 0x%02x"
+
+# mctp.c
+i2c_mctp_tx_start_send(size_t len) "len %zu"
+i2c_mctp_tx_send_byte(size_t pos, uint8_t byte) "pos %zu byte 0x%"PRIx8""
+i2c_mctp_tx_done(void) "packet sent"
+i2c_mctp_handle_control(uint8_t command) "command 0x%"PRIx8""
+i2c_mctp_unhandled_control(uint8_t command) "command 0x%"PRIx8""
+i2c_mctp_drop(const char *reason) "%s"
+i2c_mctp_drop_invalid_length(unsigned byte_count, size_t expected) "byte_count %u expected %zu"
+i2c_mctp_drop_invalid_pec(uint8_t pec, uint8_t expected) "pec 0x%"PRIx8" expected 0x%"PRIx8""
+i2c_mctp_drop_invalid_eid(uint8_t eid, uint8_t expected) "eid 0x%"PRIx8" expected 0x%"PRIx8""
+i2c_mctp_drop_invalid_pktseq(uint8_t pktseq, uint8_t expected) "pktseq 0x%"PRIx8" expected 0x%"PRIx8""
diff --git a/include/hw/i2c/mctp.h b/include/hw/i2c/mctp.h
new file mode 100644
index 000000000000..c53ee6a3b61b
--- /dev/null
+++ b/include/hw/i2c/mctp.h
@@ -0,0 +1,114 @@
+#ifndef QEMU_I2C_MCTP_H
+#define QEMU_I2C_MCTP_H
+
+#include "qom/object.h"
+#include "hw/qdev-core.h"
+#include "net/mctp.h"
+
+typedef struct MCTPI2CPacketHeader {
+    uint8_t dest;
+    uint8_t prot;
+    uint8_t byte_count;
+    uint8_t source;
+} MCTPI2CPacketHeader;
+
+typedef struct MCTPI2CPacket {
+    MCTPI2CPacketHeader i2c;
+    MCTPPacket          mctp;
+} MCTPI2CPacket;
+
+#define i2c_mctp_payload(buf) (buf + offsetof(MCTPI2CPacket, mctp.payload))
+
+#define TYPE_MCTP_I2C_ENDPOINT "mctp-i2c-endpoint"
+OBJECT_DECLARE_TYPE(MCTPI2CEndpoint, MCTPI2CEndpointClass, MCTP_I2C_ENDPOINT)
+
+struct MCTPI2CEndpointClass {
+    I2CSlaveClass parent_class;
+
+    int (*put_message_bytes)(MCTPI2CEndpoint *mctp, uint8_t *buf, size_t len);
+    size_t (*get_message_bytes)(MCTPI2CEndpoint *mctp, uint8_t *buf,
+                                size_t maxlen, uint8_t *mctp_flags);
+
+    void (*handle_message)(MCTPI2CEndpoint *mctp);
+    void (*reset_message)(MCTPI2CEndpoint *mctp);
+
+    size_t (*get_message_types)(MCTPI2CEndpoint *mctp, uint8_t *data,
+                                size_t maxlen);
+};
+
+/*
+ * Maximum value of the SMBus Block Write "Byte Count" field (8 bits).
+ *
+ * This is the count of bytes that follow the Byte Count field and up to, but
+ * not including, the PEC byte.
+ */
+#define I2C_MCTP_MAXBLOCK 255
+
+/*
+ * Maximum Transmission Unit under I2C.
+ *
+ * This is for the MCTP Packet Payload (255, subtracting the 4 byte MCTP Packet
+ * Header or the 1 byte MCTP/I2C piggy-backed source address).
+ */
+#define I2C_MCTP_MAXMTU (I2C_MCTP_MAXBLOCK - (sizeof(MCTPPacketHeader) + 1))
+
+/*
+ * Maximum length of an MCTP/I2C packet.
+ *
+ * This is the sum of the three I2C header bytes (Destination target address,
+ * Command Code and Byte Count), the maximum number of bytes in a message (255)
+ * and the 1 byte Packet Error Code.
+ */
+#define I2C_MCTP_MAX_LENGTH (3 + I2C_MCTP_MAXBLOCK + 1)
+
+/*
+ * Maximum length of an MCTP/I2C Control Message.
+ *
+ * This is the 64 byte MCTP Baseline Maximum Transmission Unit, adding the
+ * combined MCTP/I2C headers and the trailing 1 byte PEC.
+ */
+#define I2C_MCTP_CONTROL_MAX_LENGTH \
+    (sizeof(MCTPI2CPacket) + MCTP_BASELINE_MTU + 1)
+
+typedef enum {
+    I2C_MCTP_STATE_IDLE,
+    I2C_MCTP_STATE_RX_STARTED,
+    I2C_MCTP_STATE_RX,
+    I2C_MCTP_STATE_WAIT_TX,
+    I2C_MCTP_STATE_TX,
+} MCTPState;
+
+typedef enum {
+    I2C_MCTP_STATE_TX_START_SEND,
+    I2C_MCTP_STATE_TX_SEND_BYTE,
+} MCTPTxState;
+
+typedef struct MCTPI2CEndpoint {
+    I2CSlave parent_obj;
+    I2CBus *i2c;
+
+    MCTPState state;
+
+    /* mctp endpoint identifier */
+    uint8_t my_eid;
+
+    uint8_t  buffer[I2C_MCTP_MAX_LENGTH];
+    uint64_t pos;
+    size_t   len;
+
+    struct {
+        MCTPTxState state;
+        bool is_control;
+
+        uint8_t eid;
+        uint8_t addr;
+        uint8_t pktseq;
+        uint8_t flags;
+
+        QEMUBH *bh;
+    } tx;
+} MCTPI2CEndpoint;
+
+void i2c_mctp_schedule_send(MCTPI2CEndpoint *mctp);
+
+#endif /* QEMU_I2C_MCTP_H */
diff --git a/include/hw/i2c/smbus_master.h b/include/hw/i2c/smbus_master.h
index bb13bc423c22..ea5eff3a2cd0 100644
--- a/include/hw/i2c/smbus_master.h
+++ b/include/hw/i2c/smbus_master.h
@@ -27,6 +27,9 @@
 
 #include "hw/i2c/i2c.h"
 
+/* SMBus PEC */
+uint8_t i2c_smbus_pec(uint8_t crc, uint8_t *buf, size_t len);
+
 /* Master device commands.  */
 int smbus_quick_command(I2CBus *bus, uint8_t addr, int read);
 int smbus_receive_byte(I2CBus *bus, uint8_t addr);
diff --git a/include/net/mctp.h b/include/net/mctp.h
new file mode 100644
index 000000000000..c936224ecf60
--- /dev/null
+++ b/include/net/mctp.h
@@ -0,0 +1,43 @@
+#ifndef QEMU_MCTP_H
+#define QEMU_MCTP_H
+
+#define MCTP_BASELINE_MTU 64
+
+enum {
+    MCTP_H_FLAGS_EOM = 1 << 6,
+    MCTP_H_FLAGS_SOM = 1 << 7,
+};
+
+enum {
+    MCTP_MESSAGE_TYPE_CONTROL   = 0x0,
+    MCTP_MESSAGE_TYPE_NMI       = 0x4,
+
+    MCTP_MESSAGE_IC             = 1 << 7,
+};
+
+typedef struct MCTPPacketHeader {
+    uint8_t version;
+    struct {
+        uint8_t dest;
+        uint8_t source;
+    } eid;
+    uint8_t flags;
+} MCTPPacketHeader;
+
+typedef struct MCTPPacket {
+    MCTPPacketHeader hdr;
+    uint8_t          payload[];
+} MCTPPacket;
+
+typedef struct MCTPControlMessage {
+    uint8_t type;
+    uint8_t flags;
+    uint8_t command;
+    uint8_t data[];
+} MCTPControlMessage;
+
+enum {
+    MCTP_CONTROL_ERROR_UNSUPPORTED_CMD = 0x5,
+};
+
+#endif /* QEMU_MCTP_H */
-- 
2.40.0


