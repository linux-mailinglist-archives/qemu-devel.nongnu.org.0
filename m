Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 246DB67F526
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 07:07:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLeLd-0002KY-2x; Sat, 28 Jan 2023 01:05:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pLeLa-0002K5-U3; Sat, 28 Jan 2023 01:05:54 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pLeLY-0007Vn-Vr; Sat, 28 Jan 2023 01:05:54 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 32A345C06D1;
 Sat, 28 Jan 2023 01:05:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sat, 28 Jan 2023 01:05:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1674885952; x=
 1674972352; bh=jf6ILXzGt4f+cwWOHbp15S/XgmP9rRs79WrjUZM2PIw=; b=j
 PKHzuHLou4Rn6iwI6KR758dBzhmd5qxRt1YyQMzbeRdiuJT1TuL4Yd3keGGhpQz7
 aCv795GJfKSLQBr/SHvw3NCROOWNl/9VgNg4kp7vvQAMqNVCPSahHjlmtzen71wb
 GB5MCohZ3yneC/iN7MzUQQRCLs8AVSIDXtEfOxBzaPPoB1lEhH+OU7l8Wfz9pfo9
 H99VpVtmucjJbdlZAz5bitARhIbNnrfIHO0kWQHdtYP4UAKz9ZjjbRj2LP0sJVWV
 EHuM9cJU/+aDWMc6835D9nv/xsC2aUkkutnE5013GinaNwq7qRGSMD0GPURai6xx
 kmVLkBU8EQbJ38ShikLBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674885952; x=
 1674972352; bh=jf6ILXzGt4f+cwWOHbp15S/XgmP9rRs79WrjUZM2PIw=; b=C
 nHhC4D4XydUoW9j1x0jcKutNY6vH5hUqa2kVBq1iqeiI+zSx+4a/8DXJyYeEWsZJ
 qrsadKp5FFGqs9De85nrCeiJkSGY6ntLvu+j6C6JsIBtaUvZYIwPrrqdlBBZu0f0
 rLcVyEW0TfgP09Lsfz5xHr2DZ9W89FoxI148Fea4jwD2MvQlUSMWEPakTMC12uuf
 X3+cWJ9N4+Ei4VKSXAGuCyrZAuF3mDx05foDfsxbawJrgH1laTLhu3Oj8DwbkJgF
 WAp4AqoR6ZJyX6L7hc4cm18d227bFG4BK15djiFNSbbh+aVTrLn5Y8Q3pBBU5NP8
 SnaRkA3ze2PY+N7LPJLXQ==
X-ME-Sender: <xms:QLvUY00q7Wmbuxo0ITuMtDgZGtLQO5TZ5ffAvLBh6xGfIynRbYBsog>
 <xme:QLvUY_FM7jrLG2I7Y5wTfo-4wOr-Ahor5pNSiq3VWn1Mbbvp7Zc912C5_k3p_ACo-
 XnzrN5mhqRF_W5QcAA>
X-ME-Received: <xmr:QLvUY86gIxT5g7QZu5_X5EoigA3R2hih_Ca9ewBfPdGAm9dnTcLiPWASC21EDt0h3ht6_E0v7Z2HfZtnm2L-ldboymrC17-3jXOz9t6M4ao>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvjedgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhggtgfgseht
 keertdertdejnecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvghtvg
 hrsehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpedvhfevvefhtddvueevudelvedt
 ieehvdejjeeuvedtudegjeeileetheekgfeggeenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:QLvUY933b7zQlSCTThd0J8Rndr4bKFPVWXJ5QP-7rhUTBrh8HAFJbA>
 <xmx:QLvUY3HbXDYLZK3ielx6LcenYxQdAGZ7vDtPO9QVzqsPhUZETQ0UQg>
 <xmx:QLvUY2-Rw13dP6CP--LqPXDZ-2U_z6o34-IdiFPWoZnRqE75Zq5gVQ>
 <xmx:QLvUY-DJlgVCGorUsmaS0XFt-MBBYUJeknuYeaax_jrlpLlOto7cXQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Jan 2023 01:05:50 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org,
 cminyard@mvista.com
Subject: [PATCH v5 3/5] hw/nvram/eeprom_at24c: Add init_rom field and
 at24c_eeprom_init_rom helper
Date: Fri, 27 Jan 2023 22:05:41 -0800
Message-Id: <20230128060543.95582-4-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230128060543.95582-1-peter@pjd.dev>
References: <20230128060543.95582-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=peter@pjd.dev;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
- If -drive property is provided, it overrides init_rom data

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Corey Minyard <cminyard@mvista.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Ninad Palsule <ninadpalsule@us.ibm.com>
---
 hw/nvram/eeprom_at24c.c         | 36 ++++++++++++++++++++++++++++-----
 include/hw/nvram/eeprom_at24c.h | 16 +++++++++++++++
 2 files changed, 47 insertions(+), 5 deletions(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 98857e3626b9..05598699dc2b 100644
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
@@ -131,19 +134,37 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
 
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
+    s = AT24C_EE(i2c_slave_new(TYPE_AT24C_EE, address));
+
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
 {
     EEPROMState *ee = AT24C_EE(dev);
 
+    if (ee->init_rom_size > ee->rsize) {
+        error_setg(errp, "%s: init rom is larger than rom: %u > %u",
+                   TYPE_AT24C_EE, ee->init_rom_size, ee->rsize);
+        return;
+    }
+
     if (ee->blk) {
         int64_t len = blk_getlength(ee->blk);
 
@@ -163,6 +184,7 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
     }
 
     ee->mem = g_malloc0(ee->rsize);
+
 }
 
 static
@@ -176,6 +198,10 @@ void at24c_eeprom_reset(DeviceState *state)
 
     memset(ee->mem, 0, ee->rsize);
 
+    if (ee->init_rom) {
+        memcpy(ee->mem, ee->init_rom, MIN(ee->init_rom_size, ee->rsize));
+    }
+
     if (ee->blk) {
         int ret = blk_pread(ee->blk, 0, ee->rsize, ee->mem, 0);
 
diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
index 196db309d451..acb9857b2add 100644
--- a/include/hw/nvram/eeprom_at24c.h
+++ b/include/hw/nvram/eeprom_at24c.h
@@ -20,4 +20,20 @@
  */
 I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
 
+
+/*
+ * Create and realize an AT24C EEPROM device on the heap with initial data.
+ * @bus: I2C bus to put it on
+ * @address: I2C address of the EEPROM slave when put on a bus
+ * @rom_size: size of the EEPROM
+ * @init_rom: Array of bytes to initialize EEPROM memory with
+ * @init_rom_size: Size of @init_rom, must be less than or equal to @rom_size
+ *
+ * Create the device state structure, initialize it, put it on the specified
+ * @bus, and drop the reference to it (the device is realized). Copies the data
+ * from @init_rom to the beginning of the EEPROM memory buffer.
+ */
+I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
+                                const uint8_t *init_rom, uint32_t init_rom_size);
+
 #endif
-- 
2.39.0


