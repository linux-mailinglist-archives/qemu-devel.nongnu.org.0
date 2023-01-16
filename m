Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0236666D370
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 00:57:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHZKw-0002oB-Hk; Mon, 16 Jan 2023 18:56:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHZKu-0002nu-Fw; Mon, 16 Jan 2023 18:56:20 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHZKs-0003nS-R0; Mon, 16 Jan 2023 18:56:20 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id AF43B320093A;
 Mon, 16 Jan 2023 18:56:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 16 Jan 2023 18:56:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1673913376; x=1673999776; bh=Yg
 87V+uFvIXEOuCwR+81glmyot4C0Ue7T6KLQQ4e77o=; b=y/4BYlnuw8cDVm2azS
 s0W/eip7q1MYvEKT3Fl2w80QXc0wBE6VIv0iSIi90MOKPllDyVCIg4p9G/jajK8L
 dCbx80wynBnQJdJ0HVFrOZZzmZBLnsOlxBee3tgJizJ0sNU+Tsl0BrnWzY+Wzp20
 XFIkmttV9hDl3MeNc3PEyojXO5UU/qpWwI4uLQQaqvpL4+RIVMEEjxbM2uy6Z+Iq
 N2Hz6j0eWcFLUGinjnlX6J7R3nvLY+BCTxzIURmUX91+GZIeu5GsLjmnVv5dEMFa
 IFQJNrq9MFrk6bhzWnSpC71iFlcDvzkhq125ASJmce7AVMZnIq9ApfUepGymHL9g
 c4Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673913376; x=1673999776; bh=Yg87V+uFvIXEO
 uCwR+81glmyot4C0Ue7T6KLQQ4e77o=; b=QyOej0il1OPFz///c7z3Bl9gyPom4
 /vC6PMu01qj3Ef9hxaoo4XiGmr5LzvUz3j2EpQXnFo61C/VRW7aMuBRVXIJnaxSk
 SKGIwDGlQsfJlspyHu6mo/5rjPqQavMIoyiSbReUTiiOcqx2Cw7WlhavxUNYxm4H
 QnjAJ8xT7kiObxk0q7z/BoY9/33rYokZMn79jgpbCQFlzSj1lOmje9oMi3xHteC/
 jxNXQ+5V8STqGsBi2pHR1j190e6FUIyuFLzjwLFTfKsn+sm0HC8uzh7H5/zJ+t+v
 RSpoaBGH25k55K0SAxNWRUWLlUhY923YizWN8iWW8UKN6Vm8bLIS2YUgQ==
X-ME-Sender: <xms:H-TFY5NYKZzbNjpnfkM59pA-vii5oXhHvK8VjMHCgEhHK3lyj6U2ZA>
 <xme:H-TFY7_kqAyFLJFuG0ZiE7JdHBR45nVjfa1LxsyxsL7brRdYyFqqPls1IfsUutJB6
 dzRjNZ4W3EvdDEpDFk>
X-ME-Received: <xmr:H-TFY4RX4ZowzFUkDoOxrpr-wP9aRzPgfJYRMSKen5RpkZqPHaolXzDLFEWmyjZRAER8K_VrHVjcNxgz4PgrU5qcCxpzHEMh0PlOiVPhPOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddthedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhgggfestdek
 redtredttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrh
 esphhjugdruggvvheqnecuggftrfgrthhtvghrnhepteelgfeuleeffffffeekiefghfej
 uefgtdfgteeigeekvdefffevieekvdelteevnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:IOTFY1tHJtGh7thtM9X0SMZa6plGsFCAQuRoBWCiYqszVOOrvDaZ9A>
 <xmx:IOTFYxfoj1894Du0MfsgM43ioVwQ-r8dAUeTnKh__w_lOPuh824v-Q>
 <xmx:IOTFYx0Y5WJyEx9jbkebMMkbNBaVKClPWnpmutEqMCfRXsthb8kksw>
 <xmx:IOTFY7scocGJeYI0QR9ku1__kZAMt8PHiQQFcpizese74TRhaL1bEw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jan 2023 18:56:14 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] hw/nvram/eeprom_at24c: Add init_rom field and
 at24c_eeprom_init_rom helper
Date: Mon, 16 Jan 2023 15:56:02 -0800
Message-Id: <20230116235604.55099-4-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116235604.55099-1-peter@pjd.dev>
References: <20230116235604.55099-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=peter@pjd.dev;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Allows users to specify binary data to initialize an EEPROM, allowing users to
emulate data programmed at manufacturing time.

- Added init_rom and init_rom_size attributes to TYPE_AT24C_EE
- Added at24c_eeprom_init_rom helper function to initialize attributes

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/nvram/eeprom_at24c.c         | 37 ++++++++++++++++++++++++++++-----
 include/hw/nvram/eeprom_at24c.h |  2 ++
 2 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 98857e3626b9..bb9ee75864fe 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -50,6 +50,9 @@ struct EEPROMState {
     uint8_t *mem;
 
     BlockBackend *blk;
+
+    const uint8_t *init_rom;
+    uint32_t init_rom_size;
 };
 
 static
@@ -131,13 +134,26 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
 
 I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size)
 {
-    I2CSlave *i2c_dev = i2c_slave_new(TYPE_AT24C_EE, address);
-    DeviceState *dev = DEVICE(i2c_dev);
+    return at24c_eeprom_init_rom(bus, address, rom_size, NULL, 0);
+}
+
+I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
+                                const uint8_t *init_rom, uint32_t init_rom_size)
+{
+    EEPROMState *s;
+
+    s = AT24C_EE(qdev_new(TYPE_AT24C_EE));
+
+    qdev_prop_set_uint8(DEVICE(s), "address", address);
+    qdev_prop_set_uint32(DEVICE(s), "rom-size", rom_size);
 
-    qdev_prop_set_uint32(dev, "rom-size", rom_size);
-    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
+    /* TODO: Model init_rom with QOM properties. */
+    s->init_rom = init_rom;
+    s->init_rom_size = init_rom_size;
 
-    return i2c_dev;
+    i2c_slave_realize_and_unref(I2C_SLAVE(s), bus, &error_abort);
+
+    return I2C_SLAVE(s);
 }
 
 static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
@@ -162,7 +178,14 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    if (ee->init_rom_size > ee->rsize) {
+        error_setg(errp, "%s: init rom is larger than rom: %u > %u",
+                   TYPE_AT24C_EE, ee->init_rom_size, ee->rsize);
+        return;
+    }
+
     ee->mem = g_malloc0(ee->rsize);
+
 }
 
 static
@@ -185,6 +208,10 @@ void at24c_eeprom_reset(DeviceState *state)
         }
         DPRINTK("Reset read backing file\n");
     }
+
+    if (ee->init_rom) {
+        memcpy(ee->mem, ee->init_rom, MIN(ee->init_rom_size, ee->rsize));
+    }
 }
 
 static Property at24c_eeprom_props[] = {
diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
index 79a36b53ca87..e490826ab1d0 100644
--- a/include/hw/nvram/eeprom_at24c.h
+++ b/include/hw/nvram/eeprom_at24c.h
@@ -6,5 +6,7 @@
 #include "hw/i2c/i2c.h"
 
 I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
+I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
+                                const uint8_t *init_rom, uint32_t init_rom_size);
 
 #endif
-- 
2.39.0


