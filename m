Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6BF424DEE
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 09:11:50 +0200 (CEST)
Received: from localhost ([::1]:40762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNZF-0006E9-Ui
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 03:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNEW-0005Hu-Qh
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:50:28 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:38388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNEQ-00079b-53
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:50:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589418; x=1665125418;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=StlUVH83YTMAmhY7Fh5pKut9uUrAY9cEMohgucbNc7Y=;
 b=kCySMJNZ1t0teV4LU5LKQPBiTyX7D7azmJoibcT8a2Fm8HEbkISKmRQe
 azxQNdy6DHVfncZA+IDdWd130xBSONgQz6OcyMuhx7U9b39HT5RgqrOUd
 VunqBFGtpHYcrUbbFPONDMkgqXXuaLZXWRA1qk8a3PPA683I3OGepPJeE
 w2SDFXSzibnWjTGdruNFpctoafpF3aZlvjPaRTtt/kbUcu08/zTk0D6On
 7cwJa5h5IvFk8Cy2W1KRlPhzl+/shKevktPnNQZSpR9Z7gx8I72BbYLb2
 IuX1Er/4qW4Cmx+YqgNJ7rwITwfo1qAYJocquvKLm3pA9xaOTq1ZLuJfK g==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="285950773"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:50:15 +0800
IronPort-SDR: 5k/5UXryS53k3B2X7zdNIsAhFzYN0mKfVDAzi9YveeBirEF6EAY40Pp7eRzoeWpp0L92w2RDQ1
 C91jogd3Szedxqk4/shSQTuMZksZHmC1e+t8LjlKG6joElPCSTTHtgiMhtSHzLslKIyGrqd8IQ
 hbBZ3Tpbzx0WCosP4DsSLqOGCyoKV8T9kuWsq8tpdlMZ9mGEwW4sj24jHxASRIH59XZihI+vX2
 X80RuYh5kOMewKVjEL6oB33UqU6WW+cJMbW4at+rvjgJUJY2KxNN+Dnft2B33qDF4mCfiiMLSS
 5Yry1qtwTMAKxpyFYTbTBwgg
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:24:37 -0700
IronPort-SDR: 2ggKFr/pOgGwWQCx76jcjMbMOf93S1q6Oh3bjRt1BQjQyIIvBZ72LYzlLOuAKJl295NCLjsx54
 KgnSaN4GhLwq4YLLiBO0sxcuWp3f+6UoXptju8lfLWKvkLQVOj38Ha3A2tA8E0sjhlaKnRePoc
 IyZ/oQwFaJjXO3IqzLjzS3nCwqdwdRCWdhDmqZU7esT8lXJcqk6DzRHFpZELiboeetNa2xHQVO
 X+Wk3e+VPTRzcOowY6yyzP5CCMKd97vAuo/QSWHy6e+vmDi4K8Qg8HnWFS1zTvJ6iMp13/Tib1
 pJc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:50:16 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ2532xWhz1RvmJ
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:50:15 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1633589414; x=1636181415; bh=StlUVH8
 3YTMAmhY7Fh5pKut9uUrAY9cEMohgucbNc7Y=; b=WoJ6h1H6J+v1W2Di/FayZ4n
 Qro1fXZYqXWewOg3Q8HCrYeeO2wrdXNt4xFN5qWcATRYgx8JccLBBgMEYmUMh3sq
 RUKjmpERgkJScEWTXPKUhHn/VO9XK8UATOYSs1bBu52FoSa2y2YIP4zGxksgWy5O
 FWjiFrvgpwx38PM6aiweMqjNRTMZUeLN8nmYL1bixRCwL47fau2LJkTuSz2lWi0a
 NOEWzoMTLMCFISdTPk3n7QcK+vb69G5UUq6zdxsTXECbbhl+/b2tLkX1zQqWm3Bb
 Y8YSgWOP8UHE07+1MohUaZeWtkhdhm8EZY7W4vHD8VW4bRTwXLrNNTUjmkqcM+g=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id fEZs4Zcl3MaO for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:50:14 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ24y34Kjz1RvTg;
 Wed,  6 Oct 2021 23:50:09 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 23/26] hw/char/mchp_pfsoc_mmuart: QOM'ify PolarFire MMUART
Date: Thu,  7 Oct 2021 16:47:48 +1000
Message-Id: <20211007064751.608580-24-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

- Embed SerialMM in MchpPfSoCMMUartState and QOM-initialize it
- Alias SERIAL_MM 'chardev' property on MCHP_PFSOC_UART
- Forward SerialMM sysbus IRQ in mchp_pfsoc_mmuart_realize()
- Add DeviceReset() method
- Add vmstate structure for migration
- Register device in 'input' category
- Keep mchp_pfsoc_mmuart_create() behavior

Note, serial_mm_init() calls qdev_set_legacy_instance_id().
This call is only needed for backwards-compatibility of incoming
migration data with old versions of QEMU which implemented migration
of devices with hand-rolled code. Since this device didn't previously
handle migration at all, then it doesn't need to set the legacy
instance ID.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210925133407.1259392-4-f4bug@amsat.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/char/mchp_pfsoc_mmuart.h | 12 +++-
 hw/char/mchp_pfsoc_mmuart.c         | 97 +++++++++++++++++++++++++----
 2 files changed, 93 insertions(+), 16 deletions(-)

diff --git a/include/hw/char/mchp_pfsoc_mmuart.h b/include/hw/char/mchp_p=
fsoc_mmuart.h
index 864ac1a36b..b0e14ca355 100644
--- a/include/hw/char/mchp_pfsoc_mmuart.h
+++ b/include/hw/char/mchp_pfsoc_mmuart.h
@@ -28,17 +28,23 @@
 #ifndef HW_MCHP_PFSOC_MMUART_H
 #define HW_MCHP_PFSOC_MMUART_H
=20
+#include "hw/sysbus.h"
 #include "hw/char/serial.h"
=20
 #define MCHP_PFSOC_MMUART_REG_COUNT 13
=20
+#define TYPE_MCHP_PFSOC_UART "mchp.pfsoc.uart"
+OBJECT_DECLARE_SIMPLE_TYPE(MchpPfSoCMMUartState, MCHP_PFSOC_UART)
+
 typedef struct MchpPfSoCMMUartState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
     MemoryRegion container;
     MemoryRegion iomem;
-    hwaddr base;
-    qemu_irq irq;
=20
-    SerialMM *serial;
+    SerialMM serial_mm;
=20
     uint32_t reg[MCHP_PFSOC_MMUART_REG_COUNT];
 } MchpPfSoCMMUartState;
diff --git a/hw/char/mchp_pfsoc_mmuart.c b/hw/char/mchp_pfsoc_mmuart.c
index ea58655976..22f3e78eb9 100644
--- a/hw/char/mchp_pfsoc_mmuart.c
+++ b/hw/char/mchp_pfsoc_mmuart.c
@@ -22,8 +22,10 @@
=20
 #include "qemu/osdep.h"
 #include "qemu/log.h"
-#include "chardev/char.h"
+#include "qapi/error.h"
+#include "migration/vmstate.h"
 #include "hw/char/mchp_pfsoc_mmuart.h"
+#include "hw/qdev-properties.h"
=20
 #define REGS_OFFSET 0x20
=20
@@ -67,26 +69,95 @@ static const MemoryRegionOps mchp_pfsoc_mmuart_ops =3D=
 {
     },
 };
=20
-MchpPfSoCMMUartState *mchp_pfsoc_mmuart_create(MemoryRegion *sysmem,
-    hwaddr base, qemu_irq irq, Chardev *chr)
+static void mchp_pfsoc_mmuart_reset(DeviceState *dev)
+{
+    MchpPfSoCMMUartState *s =3D MCHP_PFSOC_UART(dev);
+
+    memset(s->reg, 0, sizeof(s->reg));
+    device_cold_reset(DEVICE(&s->serial_mm));
+}
+
+static void mchp_pfsoc_mmuart_init(Object *obj)
 {
-    MchpPfSoCMMUartState *s;
+    MchpPfSoCMMUartState *s =3D MCHP_PFSOC_UART(obj);
=20
-    s =3D g_new0(MchpPfSoCMMUartState, 1);
+    object_initialize_child(obj, "serial-mm", &s->serial_mm, TYPE_SERIAL=
_MM);
+    object_property_add_alias(obj, "chardev", OBJECT(&s->serial_mm), "ch=
ardev");
+}
=20
-    memory_region_init(&s->container, NULL, "mchp.pfsoc.mmuart", 0x1000)=
;
+static void mchp_pfsoc_mmuart_realize(DeviceState *dev, Error **errp)
+{
+    MchpPfSoCMMUartState *s =3D MCHP_PFSOC_UART(dev);
=20
-    memory_region_init_io(&s->iomem, NULL, &mchp_pfsoc_mmuart_ops, s,
+    qdev_prop_set_uint8(DEVICE(&s->serial_mm), "regshift", 2);
+    qdev_prop_set_uint32(DEVICE(&s->serial_mm), "baudbase", 399193);
+    qdev_prop_set_uint8(DEVICE(&s->serial_mm), "endianness",
+                        DEVICE_LITTLE_ENDIAN);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->serial_mm), errp)) {
+        return;
+    }
+
+    sysbus_pass_irq(SYS_BUS_DEVICE(dev), SYS_BUS_DEVICE(&s->serial_mm));
+
+    memory_region_init(&s->container, OBJECT(s), "mchp.pfsoc.mmuart", 0x=
1000);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container);
+
+    memory_region_add_subregion(&s->container, 0,
+                    sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->serial_mm)=
, 0));
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &mchp_pfsoc_mmuart_ops, =
s,
                           "mchp.pfsoc.mmuart.regs", 0x1000 - REGS_OFFSET=
);
     memory_region_add_subregion(&s->container, REGS_OFFSET, &s->iomem);
+}
=20
-    s->base =3D base;
-    s->irq =3D irq;
+static const VMStateDescription mchp_pfsoc_mmuart_vmstate =3D {
+    .name =3D "mchp.pfsoc.uart",
+    .version_id =3D 0,
+    .minimum_version_id =3D 0,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(reg, MchpPfSoCMMUartState,
+                             MCHP_PFSOC_MMUART_REG_COUNT),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void mchp_pfsoc_mmuart_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(oc);
+
+    dc->realize =3D mchp_pfsoc_mmuart_realize;
+    dc->reset =3D mchp_pfsoc_mmuart_reset;
+    dc->vmsd =3D &mchp_pfsoc_mmuart_vmstate;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+}
+
+static const TypeInfo mchp_pfsoc_mmuart_info =3D {
+    .name          =3D TYPE_MCHP_PFSOC_UART,
+    .parent        =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(MchpPfSoCMMUartState),
+    .instance_init =3D mchp_pfsoc_mmuart_init,
+    .class_init    =3D mchp_pfsoc_mmuart_class_init,
+};
+
+static void mchp_pfsoc_mmuart_register_types(void)
+{
+    type_register_static(&mchp_pfsoc_mmuart_info);
+}
+
+type_init(mchp_pfsoc_mmuart_register_types)
+
+MchpPfSoCMMUartState *mchp_pfsoc_mmuart_create(MemoryRegion *sysmem,
+                                               hwaddr base,
+                                               qemu_irq irq, Chardev *ch=
r)
+{
+    DeviceState *dev =3D qdev_new(TYPE_MCHP_PFSOC_UART);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
=20
-    s->serial =3D serial_mm_init(&s->container, 0, 2, irq, 399193, chr,
-                               DEVICE_LITTLE_ENDIAN);
+    qdev_prop_set_chr(dev, "chardev", chr);
+    sysbus_realize(sbd, &error_fatal);
=20
-    memory_region_add_subregion(sysmem, base, &s->container);
+    memory_region_add_subregion(sysmem, base, sysbus_mmio_get_region(sbd=
, 0));
+    sysbus_connect_irq(sbd, 0, irq);
=20
-    return s;
+    return MCHP_PFSOC_UART(dev);
 }
--=20
2.31.1


