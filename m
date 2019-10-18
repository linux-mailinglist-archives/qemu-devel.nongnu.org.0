Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9346DC9EA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 17:55:47 +0200 (CEST)
Received: from localhost ([::1]:42284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLUbS-0006lc-MK
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 11:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44627)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUPx-0001fK-T8
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 11:43:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUPw-0007cO-DV
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 11:43:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47180)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iLUPt-0007WW-CM; Fri, 18 Oct 2019 11:43:49 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6DC5410DCC99;
 Fri, 18 Oct 2019 15:43:48 +0000 (UTC)
Received: from localhost (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7785F100EA05;
 Fri, 18 Oct 2019 15:43:42 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/14] omap-i2c: remove PROP_PTR
Date: Fri, 18 Oct 2019 17:42:09 +0200
Message-Id: <20191018154212.13458-12-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-1-marcandre.lureau@redhat.com>
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Fri, 18 Oct 2019 15:43:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since clock are not QOM objects, replace PROP_PTR of clocks with
setters methods.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/arm/omap1.c        |  2 +-
 hw/arm/omap2.c        |  8 ++++----
 hw/i2c/omap_i2c.c     | 19 ++++++++++++-------
 include/hw/arm/omap.h |  9 +++++++++
 4 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index c5583b10e0..fe55c44c7e 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -4032,7 +4032,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryReg=
ion *system_memory,
=20
     s->i2c[0] =3D qdev_create(NULL, "omap_i2c");
     qdev_prop_set_uint8(s->i2c[0], "revision", 0x11);
-    qdev_prop_set_ptr(s->i2c[0], "fclk", omap_findclk(s, "mpuper_ck"));
+    omap_i2c_set_fclk(OMAP_I2C(s->i2c[0]), omap_findclk(s, "mpuper_ck"))=
;
     qdev_init_nofail(s->i2c[0]);
     busdev =3D SYS_BUS_DEVICE(s->i2c[0]);
     sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(s->ih[1], OMAP_INT_I2=
C));
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index 726a628e64..046fb6ffb5 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -2428,8 +2428,8 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRe=
gion *sysmem,
=20
     s->i2c[0] =3D qdev_create(NULL, "omap_i2c");
     qdev_prop_set_uint8(s->i2c[0], "revision", 0x34);
-    qdev_prop_set_ptr(s->i2c[0], "iclk", omap_findclk(s, "i2c1.iclk"));
-    qdev_prop_set_ptr(s->i2c[0], "fclk", omap_findclk(s, "i2c1.fclk"));
+    omap_i2c_set_iclk(OMAP_I2C(s->i2c[0]), omap_findclk(s, "i2c1.iclk"))=
;
+    omap_i2c_set_fclk(OMAP_I2C(s->i2c[0]), omap_findclk(s, "i2c1.fclk"))=
;
     qdev_init_nofail(s->i2c[0]);
     busdev =3D SYS_BUS_DEVICE(s->i2c[0]);
     sysbus_connect_irq(busdev, 0,
@@ -2440,8 +2440,8 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRe=
gion *sysmem,
=20
     s->i2c[1] =3D qdev_create(NULL, "omap_i2c");
     qdev_prop_set_uint8(s->i2c[1], "revision", 0x34);
-    qdev_prop_set_ptr(s->i2c[1], "iclk", omap_findclk(s, "i2c2.iclk"));
-    qdev_prop_set_ptr(s->i2c[1], "fclk", omap_findclk(s, "i2c2.fclk"));
+    omap_i2c_set_iclk(OMAP_I2C(s->i2c[1]), omap_findclk(s, "i2c2.iclk"))=
;
+    omap_i2c_set_fclk(OMAP_I2C(s->i2c[1]), omap_findclk(s, "i2c2.fclk"))=
;
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
 #define OMAP2_INTR_REV	0x34
 #define OMAP2_GC_REV	0x34
@@ -504,10 +501,18 @@ static void omap_i2c_realize(DeviceState *dev, Erro=
r **errp)
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
index 6b7897ba27..08ee0c7702 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -77,6 +77,15 @@ typedef struct omap_intr_handler_s omap_intr_handler;
 void omap_intc_set_iclk(omap_intr_handler *intc, omap_clk clk);
 void omap_intc_set_fclk(omap_intr_handler *intc, omap_clk clk);
=20
+/* omap_i2c.c */
+#define TYPE_OMAP_I2C "omap_i2c"
+#define OMAP_I2C(obj) OBJECT_CHECK(OMAPI2CState, (obj), TYPE_OMAP_I2C)
+
+typedef struct OMAPI2CState OMAPI2CState;
+
+void omap_i2c_set_iclk(OMAPI2CState *i2c, omap_clk clk);
+void omap_i2c_set_fclk(OMAPI2CState *i2c, omap_clk clk);
+
 /* OMAP2 l4 Interconnect */
 struct omap_l4_s;
 struct omap_l4_region_s {
--=20
2.23.0.606.g08da6496b6


