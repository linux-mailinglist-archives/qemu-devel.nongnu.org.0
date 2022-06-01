Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABBC53AE83
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 23:29:41 +0200 (CEST)
Received: from localhost ([::1]:58796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwVuO-0007xl-2c
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 17:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nwVaC-0000rZ-AV; Wed, 01 Jun 2022 17:08:48 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:42125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nwVaA-000231-C2; Wed, 01 Jun 2022 17:08:48 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 8E5C75C00DF;
 Wed,  1 Jun 2022 17:08:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 01 Jun 2022 17:08:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1654117725; x=
 1654204125; bh=yHag3Mw2Igm/V+Ga8CJmUAjug2qRue6O68IO4p2OnYc=; b=k
 XhCj158JJ7bO7xnkbUBQ+Z5WKyKNEVYk9lZZmk9FKeF5+OrhgLVS1mx5XMNcEl7A
 4dLP/3FzcYqm81iSvwVnJg+HoDk/ipmnoL7A+v/5M/I42MVAMbRT380k/kT+XzXw
 Dp/OklDgxpgzhLdoeFVEN2NxtQQKA6lMsytHzkDgb578cL8Uh6uaekLvKC+A/DM0
 OwSIukO+RqSqkL1qu5WcZ/6c8mzUKfgEcgDi8hgPlqH3ONmTpnM4Ja5zpCwOl8N+
 sgHn3RzJfsbBMF9gLBjk8MCcbFLi7sd7DiQL42+GKrfHrnVbTzcjhxq9baTP9PCE
 10Jg/vog1lnF3t9ML6/kQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1654117725; x=1654204125; bh=yHag3Mw2Igm/V
 +Ga8CJmUAjug2qRue6O68IO4p2OnYc=; b=I+QCtp+XhYrK77ZdU5pavaZBDPJ3O
 ZhoFuAYuMV4LOfpBbfMnObWb2PDDKll6ocbAT4JHaRk30zrUBXD0Bb0P3iFQZoOs
 9STLvcnYXFcRFGpbfOKqCVVOFCesqFm/tX2hZjl8I5I9cJEoE7pIabi5EYZ/acbc
 gC6v9/QFh9TATXlEM679occxSofg+wDvPe2Ap6pHVKA3cqi3F+6rmuErlPhbEPza
 oKh3jLOm9kCP/noiuUM/Ia+fvcY/IjX1sShNr0RykAtoZF3T+1Y5VfQL3rrI1A2h
 nCc1sbiuB/aWd0UKrqYpjVvfDmL0FYUjYGXSWP+JdRyCylBz6gZ9ZHhRQ==
X-ME-Sender: <xms:XdWXYrzmzZDEwrhHKkJQ8agUH1EgjIAruZ8-oYpKmyorefm7-DdtZw>
 <xme:XdWXYjRCPqrbTdMZWTHdwIoQXOyH-qx4Jp9uc3QzTqOKV3riFPY1s84oaSEO81fTj
 Yqdm6nzIJ87jkz__ok>
X-ME-Received: <xmr:XdWXYlVATYPUpFihxzXeVpZesrFVA_D0DCeZzgK6u9FeV2T3EYZCV_4RYY6UKsBX3gVxIY9bwSvF0nVPjbLi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrledtgdduheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:XdWXYlgu8JioUvJNdk0yDIbFB5S6dH58AnPeVvUIKk-685U-wW8Duw>
 <xmx:XdWXYtCPSi08BsoqtUcbssytrLcMp7ZvdFmcFSaXliQu_zO8TQFHgg>
 <xmx:XdWXYuK3mrpE9r_L7gNzCSPKBbdffuTsV04pApvhlsqQO3WzOc89iA>
 <xmx:XdWXYiKHtudzZqgRCibJEZy0rnKa0s7mJaoK8AyOMLfnyOQv0RIDfQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Jun 2022 17:08:43 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-arm@nongnu.org,
 Peter Delevoryas <pdel@fb.com>, Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [RFC PATCH v2 4/6] hw/i2c: add asynchronous send
Date: Wed,  1 Jun 2022 23:08:29 +0200
Message-Id: <20220601210831.67259-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601210831.67259-1-its@irrelevant.dk>
References: <20220601210831.67259-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add an asynchronous version of i2c_send() that requires the slave to
explicitly acknowledge on the bus with i2c_ack().

The current master must use the new i2c_start_send_async() to indicate
that it wants to do an asynchronous transfer. This allows the i2c core
to check if the target slave supports this or not. This approach relies
on adding a new enum i2c_event member, which is why a bunch of other
devices needs changes in their event handling switches.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/arm/pxa2xx.c            |  2 ++
 hw/display/sii9022.c       |  2 ++
 hw/display/ssd0303.c       |  2 ++
 hw/i2c/core.c              | 36 +++++++++++++++++++++++++++++++++++-
 hw/i2c/smbus_slave.c       |  4 ++++
 hw/i2c/trace-events        |  2 ++
 hw/misc/ibm-cffps.c        |  2 ++
 hw/misc/ir35221.c          |  2 ++
 hw/nvram/eeprom_at24c.c    |  2 ++
 hw/sensor/lsm303dlhc_mag.c |  2 ++
 include/hw/i2c/i2c.h       | 16 ++++++++++++++++
 11 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index f4f687df68ef..93dda83d7aa9 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -1305,6 +1305,8 @@ static int pxa2xx_i2c_event(I2CSlave *i2c, enum i2c_event event)
     case I2C_NACK:
         s->status |= 1 << 1;				/* set ACKNAK */
         break;
+    default:
+        return -1;
     }
     pxa2xx_i2c_update(s);
 
diff --git a/hw/display/sii9022.c b/hw/display/sii9022.c
index b591a5878901..664fd4046d82 100644
--- a/hw/display/sii9022.c
+++ b/hw/display/sii9022.c
@@ -76,6 +76,8 @@ static int sii9022_event(I2CSlave *i2c, enum i2c_event event)
         break;
     case I2C_NACK:
         break;
+    default:
+        return -1;
     }
 
     return 0;
diff --git a/hw/display/ssd0303.c b/hw/display/ssd0303.c
index aeae22da9c29..d67b0ad7b529 100644
--- a/hw/display/ssd0303.c
+++ b/hw/display/ssd0303.c
@@ -196,6 +196,8 @@ static int ssd0303_event(I2CSlave *i2c, enum i2c_event event)
     case I2C_NACK:
         /* Nothing to do.  */
         break;
+    default:
+        return -1;
     }
 
     return 0;
diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 145dce60782a..d4ba8146bffb 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -161,7 +161,8 @@ static int i2c_do_start_transfer(I2CBus *bus, uint8_t address,
            start condition.  */
 
         if (sc->event) {
-            trace_i2c_event("start", s->address);
+            trace_i2c_event(event == I2C_START_SEND ? "start" : "start_async",
+                            s->address);
             rv = sc->event(s, event);
             if (rv && !bus->broadcast) {
                 if (bus_scanned) {
@@ -212,6 +213,11 @@ int i2c_start_send(I2CBus *bus, uint8_t address)
     return i2c_do_start_transfer(bus, address, I2C_START_SEND);
 }
 
+int i2c_start_send_async(I2CBus *bus, uint8_t address)
+{
+    return i2c_do_start_transfer(bus, address, I2C_START_SEND_ASYNC);
+}
+
 void i2c_end_transfer(I2CBus *bus)
 {
     I2CSlaveClass *sc;
@@ -261,6 +267,23 @@ int i2c_send(I2CBus *bus, uint8_t data)
     return ret ? -1 : 0;
 }
 
+int i2c_send_async(I2CBus *bus, uint8_t data)
+{
+    I2CNode *node = QLIST_FIRST(&bus->current_devs);
+    I2CSlave *slave = node->elt;
+    I2CSlaveClass *sc = I2C_SLAVE_GET_CLASS(slave);
+
+    if (!sc->send_async) {
+        return -1;
+    }
+
+    trace_i2c_send_async(slave->address, data);
+
+    sc->send_async(slave, data);
+
+    return 0;
+}
+
 uint8_t i2c_recv(I2CBus *bus)
 {
     uint8_t data = 0xff;
@@ -297,6 +320,17 @@ void i2c_nack(I2CBus *bus)
     }
 }
 
+void i2c_ack(I2CBus *bus)
+{
+    if (!bus->bh) {
+        return;
+    }
+
+    trace_i2c_ack();
+
+    qemu_bh_schedule(bus->bh);
+}
+
 static int i2c_slave_post_load(void *opaque, int version_id)
 {
     I2CSlave *dev = opaque;
diff --git a/hw/i2c/smbus_slave.c b/hw/i2c/smbus_slave.c
index 5d10e27664db..feb3ec633350 100644
--- a/hw/i2c/smbus_slave.c
+++ b/hw/i2c/smbus_slave.c
@@ -143,6 +143,10 @@ static int smbus_i2c_event(I2CSlave *s, enum i2c_event event)
             dev->mode = SMBUS_CONFUSED;
             break;
         }
+        break;
+
+    default:
+        return -1;
     }
 
     return 0;
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index 209275ed2dc8..af181d43ee64 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -4,7 +4,9 @@
 
 i2c_event(const char *event, uint8_t address) "%s(addr:0x%02x)"
 i2c_send(uint8_t address, uint8_t data) "send(addr:0x%02x) data:0x%02x"
+i2c_send_async(uint8_t address, uint8_t data) "send_async(addr:0x%02x) data:0x%02x"
 i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
+i2c_ack(void) ""
 
 # aspeed_i2c.c
 
diff --git a/hw/misc/ibm-cffps.c b/hw/misc/ibm-cffps.c
index 042155bb7838..d69a727fd5f9 100644
--- a/hw/misc/ibm-cffps.c
+++ b/hw/misc/ibm-cffps.c
@@ -152,6 +152,8 @@ static int ibm_cffps_event(I2CSlave *i2c, enum i2c_event event)
     case I2C_FINISH:
          s->pointer = 0xFF;
         break;
+    default:
+        return -1;
     }
 
     s->len = 0;
diff --git a/hw/misc/ir35221.c b/hw/misc/ir35221.c
index 5e01d3655059..c46b9ee1c3bf 100644
--- a/hw/misc/ir35221.c
+++ b/hw/misc/ir35221.c
@@ -117,6 +117,8 @@ static int ir35221_event(I2CSlave *i2c, enum i2c_event event)
     case I2C_FINISH:
          s->pointer = 0xFF;
         break;
+    default:
+        return -1;
     }
 
     s->len = 0;
diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 01a3093600fa..d695f6ae894a 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -75,6 +75,8 @@ int at24c_eeprom_event(I2CSlave *s, enum i2c_event event)
         break;
     case I2C_NACK:
         break;
+    default:
+        return -1;
     }
     return 0;
 }
diff --git a/hw/sensor/lsm303dlhc_mag.c b/hw/sensor/lsm303dlhc_mag.c
index 4c98ddbf207c..bb8d48b2fdb0 100644
--- a/hw/sensor/lsm303dlhc_mag.c
+++ b/hw/sensor/lsm303dlhc_mag.c
@@ -427,6 +427,8 @@ static int lsm303dlhc_mag_event(I2CSlave *i2c, enum i2c_event event)
         break;
     case I2C_NACK:
         break;
+    default:
+        return -1;
     }
 
     s->len = 0;
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index be8bb8b78a60..9b9581d23097 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -12,6 +12,7 @@
 enum i2c_event {
     I2C_START_RECV,
     I2C_START_SEND,
+    I2C_START_SEND_ASYNC,
     I2C_FINISH,
     I2C_NACK /* Masker NACKed a receive byte.  */
 };
@@ -28,6 +29,9 @@ struct I2CSlaveClass {
     /* Master to slave. Returns non-zero for a NAK, 0 for success. */
     int (*send)(I2CSlave *s, uint8_t data);
 
+    /* Master to slave (asynchronous). Receiving slave must call i2c_ack(). */
+    void (*send_async)(I2CSlave *s, uint8_t data);
+
     /*
      * Slave to master.  This cannot fail, the device should always
      * return something here.
@@ -127,11 +131,23 @@ int i2c_start_recv(I2CBus *bus, uint8_t address);
  */
 int i2c_start_send(I2CBus *bus, uint8_t address);
 
+/**
+ * i2c_start_send_async: start an asynchronous 'send' transfer on an I2C bus.
+ *
+ * @bus: #I2CBus to be used
+ * @address: address of the slave
+ *
+ * Return: 0 on success, -1 on error
+ */
+int i2c_start_send_async(I2CBus *bus, uint8_t address);
+
 void i2c_end_transfer(I2CBus *bus);
 void i2c_nack(I2CBus *bus);
+void i2c_ack(I2CBus *bus);
 void i2c_bus_master(I2CBus *bus, QEMUBH *bh);
 void i2c_bus_release(I2CBus *bus);
 int i2c_send(I2CBus *bus, uint8_t data);
+int i2c_send_async(I2CBus *bus, uint8_t data);
 uint8_t i2c_recv(I2CBus *bus);
 bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
                   I2CNodeList *current_devs);
-- 
2.36.1


