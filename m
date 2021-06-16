Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DA13AA66D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 23:58:43 +0200 (CEST)
Received: from localhost ([::1]:48164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltdYY-00024E-8y
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 17:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdKQ-0002ZN-Cn; Wed, 16 Jun 2021 17:44:06 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdKO-0006nG-MP; Wed, 16 Jun 2021 17:44:06 -0400
Received: by mail-wr1-x42f.google.com with SMTP id r9so4241276wrz.10;
 Wed, 16 Jun 2021 14:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eoP4CL94JaZlg7eqmYc7iZiTJ8FoF/Caiy1Z28ZBDWs=;
 b=qV7V8ajq5SO9Dkmn7fJaakBUZiAJ7MexVY4MKZtdyXMF53pDkpRGEFZ9moMRN4GXXT
 L7GUmh/CnoP5N18MipnoYVe3MYotZMhcfDzoeWmgWDLHHiy5h3Q/muwK3LoJIXkUoIBX
 2BSRyDDlzGQKmcoj7HCemZYsKnEuYsjscw1XA7nRDIU6dv00cuk0TDofVEb74bYOkGGO
 cqVpDK8I4/5RjkQCxNDXGNPFoRJBkeaw36mYVNMLsSGISyRBYMRt0DW7DWQoKqPiDazn
 dbOaUzG5nF+y8AL025uYmo+toNdI6bYWofAMxb/pnyjn3dxLECO1Kq49iQ0R6OTBlt3f
 6kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eoP4CL94JaZlg7eqmYc7iZiTJ8FoF/Caiy1Z28ZBDWs=;
 b=m/9CxIXKiAA0tOcvht0OPLl3uVgkd9D9T3UANqZxf7/ttzQNAODzePfHDX8FcLClr7
 n7EjdMvGmMJYu3bRpfgrRGvf48Tcqk0lXU4JgxF6XYmJT3lgIzYznLaS9CpyTIwZuxEh
 gC9KpRgxgQi9YwjFFO/KHJWJiDsJbTMkJ4nF/+2gfAmf10tO03pEgrigbmHuRdpUn0jB
 40qosvD05lZ+/6BKSSWy4LtCOkBvmRb/LAnjNcORBfY6qFsDr8zVQKYcBSM6cD5cBL8L
 8OpZsUZED5kIDlXKINT5YQta/nlogo6zAW0e+vgRDXM7PaH3fmtggDD3wtOfEraI7vtb
 QnjA==
X-Gm-Message-State: AOAM531LV6cHaYYtbQ4AeylSpqzAoHGUtIZJFJpVvMXocNQa9Dqpr+L3
 ZyL3GraXrxCz6STDwzcxhful5xTLY7sV5g==
X-Google-Smtp-Source: ABdhPJxlqd1oARoHp1skaocwW7kWZzUBf6Jc4VP6k2JZ3tNSxR0pb2AGQBk7ItHUk/Yhn1pavLtq+A==
X-Received: by 2002:adf:fa08:: with SMTP id m8mr1360256wrr.319.1623879842361; 
 Wed, 16 Jun 2021 14:44:02 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z6sm503498wrl.15.2021.06.16.14.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 14:44:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/15] hw/i2c: Rename i2c_set_slave_address() ->
 i2c_slave_set_address()
Date: Wed, 16 Jun 2021 23:42:51 +0200
Message-Id: <20210616214254.2647796-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616214254.2647796-1-f4bug@amsat.org>
References: <20210616214254.2647796-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Other functions from I2C slave API are named "i2c_slave_XXX()".
Follow that pattern with set_address(). Add docstring along.
No logical change.

Patch created mechanically using:

  $ sed -i s/i2c_set_slave_address/i2c_slave_set_address/ \
    $(git grep -l i2c_set_slave_address)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
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


