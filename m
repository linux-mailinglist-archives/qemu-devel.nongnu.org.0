Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B769AAE952
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 13:42:30 +0200 (CEST)
Received: from localhost ([::1]:38310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7eXV-0004xb-HV
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 07:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46211)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i7ePT-0007QY-BP
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 07:34:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i7ePM-0003el-CH
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 07:34:07 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:49305)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1i7ePL-0003eJ-TK; Tue, 10 Sep 2019 07:34:04 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MTiHd-1hiB4g2HPh-00Tyfi; Tue, 10 Sep 2019 13:33:39 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 13:33:21 +0200
Message-Id: <20190910113323.17324-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910113323.17324-1-laurent@vivier.eu>
References: <20190910113323.17324-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FuBG7ru5yu/hPpYtHcgFH5oAtk+AUXcOlcqWIuKLP+4RYUDbTQH
 9dMOGwU562FQSDI0EoGTHbC76IBEgiJJRERWkQfc051H9ZXxvf4KuRp5SF1KKiSSGnP0xvf
 DnG5PE3PDqkyEmasWRWvdp/tgen7lyIx+RQd5rrAsaP8Yz3FgJUs/nh74qPQMzCKMS0z3pu
 bIBTyBAYB6oRmXtgIz95g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:J2H7zZdFvn0=:6dgZWkPAJv6uJAUlj1AEL+
 ZrlRZ23FE4Zr6ijNrOV8a0gF48V0GcrG7E4dYsSTF39de8fgEN2ICEFDkg0Y0M7F90wE7NqjQ
 ndNynPcXISOqBs0Md+i9wh0AbZMd+khxVAZCDeSy86AFDKnQjzVfywDoFd7hWMb7/2NJtQYSz
 zcqWyZBDHvmusTG/iSbvmXMoSw4F+RSucfXiRTIADT9ZhqXxEhfvUvxXkQUIAJQdhC7uI3Cml
 7KzTsJdAxENYdZHxEnFvIEBR9akCa5+IF1tPNaL4oawADgcEfLekmnVI+tTV2G+o1ssf2DthL
 T/CeeNLDTyi7FIDNFc4SYA/IKXDlVeJaMBJ6a5F0IdZOK8oDEka9d5n3KKFhMABzptg7NpMZK
 eC9gho8xu3vNcs2/bIh4C4fQy1abTg1gTi28Ty/nbfK4pbbds/PPK43DEJVO0Ilcl76Mu2Gb9
 F2qtt5BMQ4S5GXyyKbu+8IJk0yEqdMB/5BQQ12lEn5W5szmOeOvUO4D+8oRDDi9OOZu/1zjBp
 JJyObmvjIKGRqirAguxjlMNpQymwj4A/ViwbiW1j8LrB75cpu+ARZu+v4EkbgdB4JK+fAcAAL
 509rd5TvGsNzIPhjsFu1ARWoe58hnaXBTEqYgQXF8iyH7IN/d05YSrgI1E2u/46I9FeEXBwIV
 BKxE++/WZMqqKGwSZHHZDWQO6WM3zPc/fmpIr4gRafFRsZrR3I3DQP8FLUotI/RDB143QWUB0
 1V+7m4DJWClFJDkn5YipHmP7CJmUoRIzn2SpDG9eqnuYfFFvbVN9Eq2KpqDQLXbJ+yAyQHDy2
 xSD4YLbaQM5+p5223qh2HNk+w1Ks2mBI7q4JBl+DO08ZJfCU+7TAACGCkEK5iCYrOBE6teUqB
 86TZ83TErIxiPcvlGhd7VYk9Z2jQe6EvLb6R5e/ng=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-devel] [PATCH v10 7/9] hw/m68k: add Nubus support for macfb
 video card
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Thomas Huth <huth@tuxfamily.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Co-developed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
---
 hw/display/Kconfig         |  1 +
 hw/display/macfb.c         | 56 ++++++++++++++++++++++++++++++++++++++
 include/hw/display/macfb.h | 21 ++++++++++++++
 3 files changed, 78 insertions(+)

diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index 32e8d29003..c500d1fc6d 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -136,3 +136,4 @@ config ATI_VGA
 config MACFB
     bool
     select FRAMEBUFFER
+    depends on NUBUS
diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index d7c5ef296e..f4fa8e3206 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -15,6 +15,7 @@
 #include "hw/sysbus.h"
 #include "ui/console.h"
 #include "ui/pixel_ops.h"
+#include "hw/nubus/nubus.h"
 #include "hw/display/macfb.h"
 #include "qapi/error.h"
 #include "hw/qdev-properties.h"
@@ -382,12 +383,38 @@ static void macfb_sysbus_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &ms->mem_vram);
 }
 
+const uint8_t macfb_rom[] = {
+    255, 0, 0, 0,
+};
+
+static void macfb_nubus_realize(DeviceState *dev, Error **errp)
+{
+    NubusDevice *nd = NUBUS_DEVICE(dev);
+    MacfbNubusState *s = NUBUS_MACFB(dev);
+    MacfbNubusDeviceClass *ndc = MACFB_NUBUS_GET_CLASS(dev);
+    MacfbState *ms = &s->macfb;
+
+    ndc->parent_realize(dev, errp);
+
+    macfb_common_realize(dev, ms, errp);
+    memory_region_add_subregion(&nd->slot_mem, DAFB_BASE, &ms->mem_ctrl);
+    memory_region_add_subregion(&nd->slot_mem, VIDEO_BASE, &ms->mem_vram);
+
+    nubus_register_rom(nd, macfb_rom, sizeof(macfb_rom), 1, 9, 0xf);
+}
+
 static void macfb_sysbus_reset(DeviceState *d)
 {
     MacfbSysBusState *s = MACFB(d);
     macfb_reset(&s->macfb);
 }
 
+static void macfb_nubus_reset(DeviceState *d)
+{
+    MacfbNubusState *s = NUBUS_MACFB(d);
+    macfb_reset(&s->macfb);
+}
+
 static Property macfb_sysbus_properties[] = {
     DEFINE_PROP_UINT32("width", MacfbSysBusState, macfb.width, 640),
     DEFINE_PROP_UINT32("height", MacfbSysBusState, macfb.height, 480),
@@ -395,6 +422,13 @@ static Property macfb_sysbus_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static Property macfb_nubus_properties[] = {
+    DEFINE_PROP_UINT32("width", MacfbNubusState, macfb.width, 640),
+    DEFINE_PROP_UINT32("height", MacfbNubusState, macfb.height, 480),
+    DEFINE_PROP_UINT8("depth", MacfbNubusState, macfb.depth, 8),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void macfb_sysbus_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -406,6 +440,19 @@ static void macfb_sysbus_class_init(ObjectClass *klass, void *data)
     dc->props = macfb_sysbus_properties;
 }
 
+static void macfb_nubus_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    MacfbNubusDeviceClass *ndc = MACFB_NUBUS_DEVICE_CLASS(klass);
+
+    device_class_set_parent_realize(dc, macfb_nubus_realize,
+                                    &ndc->parent_realize);
+    dc->desc = "Nubus Macintosh framebuffer";
+    dc->reset = macfb_nubus_reset;
+    dc->vmsd = &vmstate_macfb;
+    dc->props = macfb_nubus_properties;
+}
+
 static TypeInfo macfb_sysbus_info = {
     .name          = TYPE_MACFB,
     .parent        = TYPE_SYS_BUS_DEVICE,
@@ -413,9 +460,18 @@ static TypeInfo macfb_sysbus_info = {
     .class_init    = macfb_sysbus_class_init,
 };
 
+static TypeInfo macfb_nubus_info = {
+    .name          = TYPE_NUBUS_MACFB,
+    .parent        = TYPE_NUBUS_DEVICE,
+    .instance_size = sizeof(MacfbNubusState),
+    .class_init    = macfb_nubus_class_init,
+    .class_size    = sizeof(MacfbNubusDeviceClass),
+};
+
 static void macfb_register_types(void)
 {
     type_register_static(&macfb_sysbus_info);
+    type_register_static(&macfb_nubus_info);
 }
 
 type_init(macfb_register_types)
diff --git a/include/hw/display/macfb.h b/include/hw/display/macfb.h
index 3fe2592735..26367ae2c4 100644
--- a/include/hw/display/macfb.h
+++ b/include/hw/display/macfb.h
@@ -40,4 +40,25 @@ typedef struct {
     MacfbState macfb;
 } MacfbSysBusState;
 
+#define MACFB_NUBUS_DEVICE_CLASS(class) \
+    OBJECT_CLASS_CHECK(MacfbNubusDeviceClass, (class), TYPE_NUBUS_MACFB)
+#define MACFB_NUBUS_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(MacfbNubusDeviceClass, (obj), TYPE_NUBUS_MACFB)
+
+typedef struct MacfbNubusDeviceClass {
+    DeviceClass parent_class;
+
+    DeviceRealize parent_realize;
+} MacfbNubusDeviceClass;
+
+#define TYPE_NUBUS_MACFB "nubus-macfb"
+#define NUBUS_MACFB(obj) \
+    OBJECT_CHECK(MacfbNubusState, (obj), TYPE_NUBUS_MACFB)
+
+typedef struct {
+    NubusDevice busdev;
+
+    MacfbState macfb;
+} MacfbNubusState;
+
 #endif
-- 
2.21.0


