Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E92E2127C4E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 15:10:23 +0100 (CET)
Received: from localhost ([::1]:56524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiIz0-0004r1-JM
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 09:10:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41157)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iiIh3-0002uI-Om
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:51:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iiIh2-00056Z-Az
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:51:49 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:36827
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iiIh2-00053s-2X
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:51:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576849907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTLGGZTG/MbrCo09iXWWajxYfTfsjukrIuoneCAyU6I=;
 b=WDZXVSunZB2082Y5Vw+VCWe4cBPeSRO+TBQU35kg6ZFIvaNExfwAae7vvqJG+QtKEnLQTo
 FXa11yFgH7xy+DeWu5of0oDa0zCKY5eO2oO1/OiWEEh2aORdcxRF0v/jafXuYfYpkgbux+
 O0rR6cXOl3VUB3IhPgL4+2prk0q8x6A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-JMxB_jG_PLilbXDZjG22EA-1; Fri, 20 Dec 2019 08:51:46 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 610CC91221;
 Fri, 20 Dec 2019 13:51:45 +0000 (UTC)
Received: from localhost (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4DFD63BB5;
 Fri, 20 Dec 2019 13:51:43 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 33/37] omap-i2c: remove PROP_PTR
Date: Fri, 20 Dec 2019 17:45:57 +0400
Message-Id: <20191220134601.571905-34-marcandre.lureau@redhat.com>
In-Reply-To: <20191220134601.571905-1-marcandre.lureau@redhat.com>
References: <20191220134601.571905-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: JMxB_jG_PLilbXDZjG22EA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since clocks are not QOM objects, replace PROP_PTR of clocks with
setters methods.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Corey Minyard <cminyard@mvista.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/omap1.c        |  2 +-
 hw/arm/omap2.c        |  8 ++++----
 hw/i2c/omap_i2c.c     | 19 ++++++++++++-------
 include/hw/arm/omap.h | 13 +++++++++++++
 4 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 1afd1d3d7f..807e5f70d1 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -4030,7 +4030,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryRegio=
n *dram,
=20
     s->i2c[0] =3D qdev_create(NULL, "omap_i2c");
     qdev_prop_set_uint8(s->i2c[0], "revision", 0x11);
-    qdev_prop_set_ptr(s->i2c[0], "fclk", omap_findclk(s, "mpuper_ck"));
+    omap_i2c_set_fclk(OMAP_I2C(s->i2c[0]), omap_findclk(s, "mpuper_ck"));
     qdev_init_nofail(s->i2c[0]);
     busdev =3D SYS_BUS_DEVICE(s->i2c[0]);
     sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(s->ih[1], OMAP_INT_I2C)=
);
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index 1d7cc435ef..171e2d0472 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -2425,8 +2425,8 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRegi=
on *sdram,
=20
     s->i2c[0] =3D qdev_create(NULL, "omap_i2c");
     qdev_prop_set_uint8(s->i2c[0], "revision", 0x34);
-    qdev_prop_set_ptr(s->i2c[0], "iclk", omap_findclk(s, "i2c1.iclk"));
-    qdev_prop_set_ptr(s->i2c[0], "fclk", omap_findclk(s, "i2c1.fclk"));
+    omap_i2c_set_iclk(OMAP_I2C(s->i2c[0]), omap_findclk(s, "i2c1.iclk"));
+    omap_i2c_set_fclk(OMAP_I2C(s->i2c[0]), omap_findclk(s, "i2c1.fclk"));
     qdev_init_nofail(s->i2c[0]);
     busdev =3D SYS_BUS_DEVICE(s->i2c[0]);
     sysbus_connect_irq(busdev, 0,
@@ -2437,8 +2437,8 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRegi=
on *sdram,
=20
     s->i2c[1] =3D qdev_create(NULL, "omap_i2c");
     qdev_prop_set_uint8(s->i2c[1], "revision", 0x34);
-    qdev_prop_set_ptr(s->i2c[1], "iclk", omap_findclk(s, "i2c2.iclk"));
-    qdev_prop_set_ptr(s->i2c[1], "fclk", omap_findclk(s, "i2c2.fclk"));
+    omap_i2c_set_iclk(OMAP_I2C(s->i2c[1]), omap_findclk(s, "i2c2.iclk"));
+    omap_i2c_set_fclk(OMAP_I2C(s->i2c[1]), omap_findclk(s, "i2c2.fclk"));
     qdev_init_nofail(s->i2c[1]);
     busdev =3D SYS_BUS_DEVICE(s->i2c[1]);
     sysbus_connect_irq(busdev, 0,
diff --git a/hw/i2c/omap_i2c.c b/hw/i2c/omap_i2c.c
index 3ba965a58f..3ccbd5cc2c 100644
--- a/hw/i2c/omap_i2c.c
+++ b/hw/i2c/omap_i2c.c
@@ -28,10 +28,7 @@
 #include "qemu/error-report.h"
 #include "qapi/error.h"
=20
-#define TYPE_OMAP_I2C "omap_i2c"
-#define OMAP_I2C(obj) OBJECT_CHECK(OMAPI2CState, (obj), TYPE_OMAP_I2C)
-
-typedef struct OMAPI2CState {
+struct OMAPI2CState {
     SysBusDevice parent_obj;
=20
     MemoryRegion iomem;
@@ -56,7 +53,7 @@ typedef struct OMAPI2CState {
     uint8_t divider;
     uint8_t times[2];
     uint16_t test;
-} OMAPI2CState;
+};
=20
 #define OMAP2_INTR_REV=090x34
 #define OMAP2_GC_REV=090x34
@@ -504,10 +501,18 @@ static void omap_i2c_realize(DeviceState *dev, Error =
**errp)
     }
 }
=20
+void omap_i2c_set_iclk(OMAPI2CState *i2c, omap_clk clk)
+{
+    i2c->iclk =3D clk;
+}
+
+void omap_i2c_set_fclk(OMAPI2CState *i2c, omap_clk clk)
+{
+    i2c->fclk =3D clk;
+}
+
 static Property omap_i2c_properties[] =3D {
     DEFINE_PROP_UINT8("revision", OMAPI2CState, revision, 0),
-    DEFINE_PROP_PTR("iclk", OMAPI2CState, iclk),
-    DEFINE_PROP_PTR("fclk", OMAPI2CState, fclk),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index bcecf19f89..39a295ba20 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -81,6 +81,19 @@ typedef struct omap_intr_handler_s omap_intr_handler;
 void omap_intc_set_iclk(omap_intr_handler *intc, omap_clk clk);
 void omap_intc_set_fclk(omap_intr_handler *intc, omap_clk clk);
=20
+/* omap_i2c.c */
+#define TYPE_OMAP_I2C "omap_i2c"
+#define OMAP_I2C(obj) OBJECT_CHECK(OMAPI2CState, (obj), TYPE_OMAP_I2C)
+
+typedef struct OMAPI2CState OMAPI2CState;
+
+/*
+ * TODO: Ideally we should have a clock framework that
+ * let us wire these clocks up with QOM properties or links.
+ */
+void omap_i2c_set_iclk(OMAPI2CState *i2c, omap_clk clk);
+void omap_i2c_set_fclk(OMAPI2CState *i2c, omap_clk clk);
+
 /* OMAP2 l4 Interconnect */
 struct omap_l4_s;
 struct omap_l4_region_s {
--=20
2.24.0.308.g228f53135a


