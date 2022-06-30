Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4876561065
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 06:54:52 +0200 (CEST)
Received: from localhost ([::1]:39234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6mCZ-0005my-LL
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 00:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6m9n-0002mh-Cr; Thu, 30 Jun 2022 00:51:59 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:34417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6m9i-0006z9-Nl; Thu, 30 Jun 2022 00:51:59 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 60C1B2B058D5;
 Thu, 30 Jun 2022 00:51:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 30 Jun 2022 00:51:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656564711; x=
 1656568311; bh=0kG+8k8+jwRBEnusbY0O5k5Da+OQhvCmlBfhwijFieI=; b=o
 SRp+4iB1zFFNgA9ByS1fGKEvXPFwUKhW/8N3wZ7FEXpk9sfrNCrbEz5ytnXXgfwk
 wBVc13nPLAWmthQhZ3yXd5QHgd2JWJRaU2v8fdcaNapOBABg92PZxhh2Ud9CMIxO
 n8Fcvhv8b/OrtZYbkfJIq9J+C3UUri7YIoVh8GabkJ//ub772BbNhnJJcD5K8bwG
 BKzDnM68UooJ1yS/Y4glZasf5nn2dGWyWI/Kwps6R3gUQLh416yyRCWPMxjLQB4k
 MnfolQ6EtkCmxgNBUug6/fRLZ9qdMXBHqEIrJoHXHNZofSNwjxevZUtpdIV1n9cJ
 6TJ4sv8gvwlKNZP5xWm2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2; t=
 1656564711; x=1656568311; bh=0kG+8k8+jwRBEnusbY0O5k5Da+OQhvCmlBf
 hwijFieI=; b=AGyoEP4RIIyhZcnO5vbm+wbmKzXNA09B9+ziTas+FuHcFse/LYC
 WeqIkTbDUGlRg3njTT/OhpALhs4QMY6Np6W6Mphq9+c23v/GCHIrzxUhj3kEqIqn
 qkXm2rOGcqW1Se8/czp27JwFzb5Y+bIV1u2l0orUs0iVVaDmrxWJvwvPaqbYFX1G
 +ShwINJfPUR3pyh/al2gkDzfEUEuTN/ecdrIco1RIVw1PfsTFbu0wuhKsYgxImEk
 u/KdIbzKcxQ1IIACviOnua2lvbkZGTxxfi1sSdKZM7lMWy4pBEXuMtC3/8wtL9nm
 PllNJcRAqAyhhhh+qEnzkbrAy8gFJ08fpnQ==
X-ME-Sender: <xms:5yu9YgxEAMR1QtaQx-ZI8iVyPv2-QSaves3wfdd80Bwau4sRLPdlkQ>
 <xme:5yu9YkTdRRwjcdjNvNDX1xtlZiST6zLJdXYePWjSgTqR1CkQKOq3Z1XVGNoL115HM
 Vy3K0gR4HkbTFvrxvk>
X-ME-Received: <xmr:5yu9YiWmmrj1Ed_H7_Jirh_7mooloGyu_r7nEKnEg68n8DpxJYzrF-XZfVUtUvF_uIPrstx4NG68SUv7u60sctQwIdkT9y6a>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehtddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefr
 vghtvghrucffvghlvghvohhrhigrshcuoehmvgesphhjugdruggvvheqnecuggftrfgrth
 htvghrnhepffevudejfeehteegkedtieelhfffvefgleelveejledvvdehfeduudefteek
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 gvsehpjhgurdguvghv
X-ME-Proxy: <xmx:5yu9YuhnHRBdY7LIU-L5a373CH8K_oKKhwhKSjGxblLjpEKrmJfNGQ>
 <xmx:5yu9YiByA353FFsFW8li4ubWDaECqwE0OYz09DCIXLrsSznbithWRw>
 <xmx:5yu9YvLzZja6tllPVDGYHp_8Zhj_gb6SH0i3T9GeLs6GqtJGapZhSg>
 <xmx:5yu9Yu1hA3V3DdvrlAJ8UiJsoFsy2o9y7Bu-JIkKGRt325ylCqRSJ1pwY4Q>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 00:51:51 -0400 (EDT)
From: Peter Delevoryas <me@pjd.dev>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v3 05/14] hw/i2c: add asynchronous send
Date: Wed, 29 Jun 2022 21:51:24 -0700
Message-Id: <20220630045133.32251-6-me@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220630045133.32251-1-me@pjd.dev>
References: <20220630045133.32251-1-me@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Klaus Jensen <k.jensen@samsung.com>

Add an asynchronous version of i2c_send() that requires the slave to
explicitly acknowledge on the bus with i2c_ack().

The current master must use the new i2c_start_send_async() to indicate
that it wants to do an asynchronous transfer. This allows the i2c core
to check if the target slave supports this or not. This approach relies
on adding a new enum i2c_event member, which is why a bunch of other
devices needs changes in their event handling switches.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Message-Id: <20220601210831.67259-5-its@irrelevant.dk>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/pxa2xx.c            |  2 ++
 hw/display/sii9022.c       |  2 ++
 hw/display/ssd0303.c       |  2 ++
 hw/i2c/core.c              | 36 +++++++++++++++++++++++++++++++++++-
 hw/i2c/smbus_slave.c       |  4 ++++
 hw/i2c/trace-events        |  2 ++
 hw/nvram/eeprom_at24c.c    |  2 ++
 hw/sensor/lsm303dlhc_mag.c |  2 ++
 include/hw/i2c/i2c.h       | 16 ++++++++++++++++
 9 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index f4f687df68..93dda83d7a 100644
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
index b591a58789..664fd4046d 100644
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
index aeae22da9c..d67b0ad7b5 100644
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
index 145dce6078..d4ba8146bf 100644
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
index 5d10e27664..feb3ec6333 100644
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
index 209275ed2d..af181d43ee 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -4,7 +4,9 @@
 
 i2c_event(const char *event, uint8_t address) "%s(addr:0x%02x)"
 i2c_send(uint8_t address, uint8_t data) "send(addr:0x%02x) data:0x%02x"
+i2c_send_async(uint8_t address, uint8_t data) "send_async(addr:0x%02x) data:0x%02x"
 i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
+i2c_ack(void) ""
 
 # aspeed_i2c.c
 
diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 01a3093600..d695f6ae89 100644
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
index 4c98ddbf20..bb8d48b2fd 100644
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
index be8bb8b78a..9b9581d230 100644
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
2.37.0


