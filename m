Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6213AA149
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:28:42 +0200 (CEST)
Received: from localhost ([::1]:36024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYPA-0005QV-J0
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYCJ-0003mw-Cd; Wed, 16 Jun 2021 12:15:23 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYCH-0006GF-6F; Wed, 16 Jun 2021 12:15:23 -0400
Received: by mail-wr1-x432.google.com with SMTP id z8so3300517wrp.12;
 Wed, 16 Jun 2021 09:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5j6k5TR5q8R5g85iAza6lwthsGjXgN7CmoQbjiM/TLc=;
 b=RF08CFAFL2cUXtvWVJrg6DbyykCCRhomZyvwSCXKTu+cHl/IwZ3gtlsydqPmDVTwJu
 TuwkoBkB/yeoglAbuLiq/7hCnAZL4G/BxrIWVqH359o07LK+nh0w58lUr8NLeAQ2Xr0n
 fR2AEF9Q2OJaqUjp9ys0j0deoZ0YrPAUVhIRdBXCTj8XxaZumJ3QCLPjUeA0CatvbpaH
 hYSvvEYNTWWLlpL8gwRybrKT+DGZ+NLIbTkjAGtY4hPCbJ6hNPo+k089X7X+mO4o4IRt
 ZOBDThZuSsgEMi+XArOF2m9F5PiatIWNokeQAFdT+rTf3CC9Inxxx3yJIAsCYAoeHyI2
 cTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5j6k5TR5q8R5g85iAza6lwthsGjXgN7CmoQbjiM/TLc=;
 b=kZdst8jMnbVBiLOuq6KmpBtHc66B9BydmrA0fW52arKU397w69krvrzPE785uLL6hE
 6YiFduuEX/Kt0FF70XPc4hrbC1xlv5uBFr8t2B8+0uDrn3vOrNs/AF82JGD6O/0YEh6i
 1YORo1Sgg5W5vf7pUg6GDCtD2s5tIa+BALzP4sTQCtJJuqfYKEuuzlfTg6mODnCF5nDF
 Ziw9r+lWxtsUo3dhcj75P5x/Lvjw0/jgDr3s3lgbHLirO3TKQT0Dy/yYZSIQ23mgOUVp
 WnUC+/Ht5hVetACLoaBrfRGCPLPJUmLIJoM9htHvqROe2ByHUt73utjIdJuP6AeaFWvd
 TcjA==
X-Gm-Message-State: AOAM531lEo4A52c1cKt71rUnnxltjqXdW/tdBmMy7dEshTRWKfEmE/+z
 6G9H74lpkIin7sje2eEESv6JPMs3aghzGw==
X-Google-Smtp-Source: ABdhPJzFEbZaYUS+F9R2mz1af3Ab7I4bXVkrDTWFljC3z6mZQLbn72XWDGfSww8Uz6M95sDrswQU4w==
X-Received: by 2002:adf:fd90:: with SMTP id d16mr221942wrr.35.1623860118000;
 Wed, 16 Jun 2021 09:15:18 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z5sm2569392wrp.92.2021.06.16.09.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:15:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/13] hw/i2c: Rename i2c_set_slave_address() ->
 i2c_slave_set_address()
Date: Wed, 16 Jun 2021 18:14:17 +0200
Message-Id: <20210616161418.2514095-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616161418.2514095-1-f4bug@amsat.org>
References: <20210616161418.2514095-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Other functions from I2C slave API are named "i2c_slave_XXX()".
Follow that pattern with set_address(). Add docstring along.
No logical change.

Patch created mechanically using:

  $ sed -i s/i2c_set_slave_address/i2c_slave_set_address/ \
    $(git grep -l i2c_set_slave_address)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/i2c/i2c.h | 8 +++++++-
 hw/arm/pxa2xx.c      | 2 +-
 hw/arm/spitz.c       | 4 ++--
 hw/display/ati.c     | 2 +-
 hw/display/sm501.c   | 2 +-
 hw/display/xlnx_dp.c | 2 +-
 hw/i2c/core.c        | 2 +-
 hw/i2c/imx_i2c.c     | 2 +-
 8 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 99635b837a5..2adf521b271 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -79,7 +79,6 @@ struct I2CBus {
 };
 
 I2CBus *i2c_init_bus(DeviceState *parent, const char *name);
-void i2c_set_slave_address(I2CSlave *dev, uint8_t address);
 int i2c_bus_busy(I2CBus *bus);
 int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv);
 void i2c_end_transfer(I2CBus *bus);
@@ -141,6 +140,13 @@ I2CSlave *i2c_slave_create_simple(I2CBus *bus, const char *name, uint8_t addr);
  */
 bool i2c_slave_realize_and_unref(I2CSlave *dev, I2CBus *bus, Error **errp);
 
+/**
+ * Set the I2C bus address of a slave device
+ * @dev: I2C slave device
+ * @address: I2C address of the slave when put on a bus
+ */
+void i2c_slave_set_address(I2CSlave *dev, uint8_t address);
+
 extern const VMStateDescription vmstate_i2c_slave;
 
 #define VMSTATE_I2C_SLAVE(_field, _state) {                          \
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index fdc4955e95b..15a247efae2 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -1437,7 +1437,7 @@ static void pxa2xx_i2c_write(void *opaque, hwaddr addr,
         break;
 
     case ISAR:
-        i2c_set_slave_address(I2C_SLAVE(s->slave), value & 0x7f);
+        i2c_slave_set_address(I2C_SLAVE(s->slave), value & 0x7f);
         break;
 
     case IDBR:
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index b45a929cbd9..c0f0f8193f4 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -769,9 +769,9 @@ static void spitz_wm8750_addr(void *opaque, int line, int level)
 {
     I2CSlave *wm = (I2CSlave *) opaque;
     if (level)
-        i2c_set_slave_address(wm, SPITZ_WM_ADDRH);
+        i2c_slave_set_address(wm, SPITZ_WM_ADDRH);
     else
-        i2c_set_slave_address(wm, SPITZ_WM_ADDRL);
+        i2c_slave_set_address(wm, SPITZ_WM_ADDRL);
 }
 
 static void spitz_i2c_setup(PXA2xxState *cpu)
diff --git a/hw/display/ati.c b/hw/display/ati.c
index 4c3ad8f47b0..31f22754dce 100644
--- a/hw/display/ati.c
+++ b/hw/display/ati.c
@@ -968,7 +968,7 @@ static void ati_vga_realize(PCIDevice *dev, Error **errp)
     I2CBus *i2cbus = i2c_init_bus(DEVICE(s), "ati-vga.ddc");
     bitbang_i2c_init(&s->bbi2c, i2cbus);
     I2CSlave *i2cddc = I2C_SLAVE(qdev_new(TYPE_I2CDDC));
-    i2c_set_slave_address(i2cddc, 0x50);
+    i2c_slave_set_address(i2cddc, 0x50);
     qdev_realize_and_unref(DEVICE(i2cddc), BUS(i2cbus), &error_abort);
 
     /* mmio register space */
diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 569661a0746..663c37e7f28 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1828,7 +1828,7 @@ static void sm501_init(SM501State *s, DeviceState *dev,
     s->i2c_bus = i2c_init_bus(dev, "sm501.i2c");
     /* ddc */
     I2CDDCState *ddc = I2CDDC(qdev_new(TYPE_I2CDDC));
-    i2c_set_slave_address(I2C_SLAVE(ddc), 0x50);
+    i2c_slave_set_address(I2C_SLAVE(ddc), 0x50);
     qdev_realize_and_unref(DEVICE(ddc), BUS(s->i2c_bus), &error_abort);
 
     /* mmio */
diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 4fd6aeb18b5..2bb7a5441ad 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1253,7 +1253,7 @@ static void xlnx_dp_init(Object *obj)
     object_property_add_child(OBJECT(s), "dpcd", OBJECT(s->dpcd));
 
     s->edid = I2CDDC(qdev_new("i2c-ddc"));
-    i2c_set_slave_address(I2C_SLAVE(s->edid), 0x50);
+    i2c_slave_set_address(I2C_SLAVE(s->edid), 0x50);
     object_property_add_child(OBJECT(s), "edid", OBJECT(s->edid));
 
     fifo8_create(&s->rx_fifo, 16);
diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 27a66df7f34..6af24c9e797 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -66,7 +66,7 @@ I2CBus *i2c_init_bus(DeviceState *parent, const char *name)
     return bus;
 }
 
-void i2c_set_slave_address(I2CSlave *dev, uint8_t address)
+void i2c_slave_set_address(I2CSlave *dev, uint8_t address)
 {
     dev->address = address;
 }
diff --git a/hw/i2c/imx_i2c.c b/hw/i2c/imx_i2c.c
index 2e02e1c4faa..9792583fea7 100644
--- a/hw/i2c/imx_i2c.c
+++ b/hw/i2c/imx_i2c.c
@@ -171,7 +171,7 @@ static void imx_i2c_write(void *opaque, hwaddr offset,
     switch (offset) {
     case IADR_ADDR:
         s->iadr = value & IADR_MASK;
-        /* i2c_set_slave_address(s->bus, (uint8_t)s->iadr); */
+        /* i2c_slave_set_address(s->bus, (uint8_t)s->iadr); */
         break;
     case IFDR_ADDR:
         s->ifdr = value & IFDR_MASK;
-- 
2.31.1


