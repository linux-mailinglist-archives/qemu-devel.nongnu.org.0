Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B234441558
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 09:33:00 +0100 (CET)
Received: from localhost ([::1]:47450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhSkV-0005A7-76
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 04:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mhSfp-0006TX-76; Mon, 01 Nov 2021 04:28:09 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:36767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mhSfl-00087e-GR; Mon, 01 Nov 2021 04:28:08 -0400
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N6bHC-1mhvtv2LBG-0182lq; Mon, 01
 Nov 2021 09:27:53 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 6/6] hw/input/lasips2: QOM'ify the Lasi PS/2
Date: Mon,  1 Nov 2021 09:27:47 +0100
Message-Id: <20211101082747.2524909-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211101082747.2524909-1-laurent@vivier.eu>
References: <20211101082747.2524909-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vTRIRl9dsWwAtgu7Ui2dNw36goyA8bCbs2YTQGdBdTg2LuUphR7
 aBiA6GbwT8735AEbnyHvLfszB90joxxZMUGsWNZivxvLirBjQNe6meLTaamo7LZcf3tJ0BP
 xTmsp8S1qxKCIXzHyArO5w3AOQKqFncJfS4kHsjLt3wuOnXX0hMiAtBtv7uX3yh01cKCZRM
 Nm7NMWtMy422r5iD90eyw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oWYh5lWFiSM=:xdW6SZ1WAFZbp9rlrPYEnc
 LG7ykr8Suqx7lJ7ok5QIc5VjgvwAmL5LhBK9YoODFKjwA77TopvX7S3Z+EvwRtPwHDH59s67P
 cj2L7DLX8qk3ggiXXOGkMtHgsmLkQuY/Wbf2XovAUaCHhWo9wcMFeBtTdP89k1guqSl+BZaPH
 wGbtL9RBAl993lniH9HpNOxY9U6u+KsKhugGhDMTIdoqB1THitz1qKPgJDKnjdKgdiuo8N51f
 PGfYkdY2mtQ5emXfe9rUEM/campEl1L89Vrc9Uyzsl9SUwv/G33kgXqtHbxR7vt/b5qo+30pe
 LWB7lkgN05U6h1VYl6a1/c8Szc4Czt+skzicQVkrzJt7MZHCTAAaDaZyMv2lhBBtIWECyMvry
 cdYus7wkdDlE1avKOBVJhzR3r5NiuHa6LB0ebl/5ZKsG/6IY8TrB0vszJ2dL2BvAz3nxBM2lj
 QiFyMt/sLVGVIwgOLQJtKA1CZTYkK0IFX6K7ExckZ/dXM6KrWHS+JrtQ1cX+kucw53Logv2H3
 ws9UakWuZrmUuhlDBlToh4GsopFA6w9b54ynmCtCz/0Xj2p9pEa+Ox2k/e5Q0mh8kyOq05VnP
 ijlW5W8lbtq70gsWshSjhHgTmApk+cFUgU0jqFC/zRqoj56agm/LrAWwkDcHAaAyaL59UUerJ
 bMI9JyXMvDCqulNjlB9H9n+/fAKGqty5AQuJXCkHUzmr0CGHxMfbZPR9iCnL068SM0hM=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Message-Id: <20210920064048.2729397-4-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/hppa/lasi.c             | 10 +++++++++-
 hw/input/lasips2.c         | 38 ++++++++++++++++++++++++++++----------
 include/hw/input/lasips2.h | 17 +++++++++++++----
 3 files changed, 50 insertions(+), 15 deletions(-)

diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
index 88c3791eb683..91414748b70d 100644
--- a/hw/hppa/lasi.c
+++ b/hw/hppa/lasi.c
@@ -297,6 +297,7 @@ static int lasi_get_irq(unsigned long hpa)
 DeviceState *lasi_init(MemoryRegion *address_space)
 {
     DeviceState *dev;
+    SysBusDevice *sbd;
     LasiState *s;
 
     dev = qdev_new(TYPE_LASI_CHIP);
@@ -340,7 +341,14 @@ DeviceState *lasi_init(MemoryRegion *address_space)
     /* PS/2 Keyboard/Mouse */
     qemu_irq ps2kbd_irq = qemu_allocate_irq(lasi_set_irq, s,
             lasi_get_irq(LASI_PS2KBD_HPA));
-    lasips2_init(address_space, LASI_PS2KBD_HPA,  ps2kbd_irq);
+
+    sbd = SYS_BUS_DEVICE(qdev_new(TYPE_LASIPS2));
+    sysbus_realize_and_unref(sbd, &error_fatal);
+    memory_region_add_subregion(address_space, LASI_PS2KBD_HPA,
+                                sysbus_mmio_get_region(sbd, 0));
+    memory_region_add_subregion(address_space, LASI_PS2MOU_HPA,
+                                sysbus_mmio_get_region(sbd, 1));
+    sysbus_connect_irq(sbd, 0, ps2kbd_irq);
 
     return dev;
 }
diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 0f8362f17bc1..46cd32316dac 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -243,28 +243,46 @@ static void ps2dev_update_irq(void *opaque, int level)
     lasips2_update_irq(port->parent);
 }
 
-void lasips2_init(MemoryRegion *address_space,
-                  hwaddr base, qemu_irq irq)
+static void lasips2_init(Object *obj)
 {
-    LASIPS2State *s;
+    LASIPS2State *s = LASIPS2(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
-    s = g_malloc0(sizeof(LASIPS2State));
-
-    s->irq = irq;
+    sysbus_init_irq(sbd, &s->irq);
     s->mouse.id = 1;
     s->kbd.parent = s;
     s->mouse.parent = s;
 
-    vmstate_register(NULL, base, &vmstate_lasips2, s);
-
     s->kbd.dev = ps2_kbd_init(ps2dev_update_irq, &s->kbd);
     s->mouse.dev = ps2_mouse_init(ps2dev_update_irq, &s->mouse);
 
     memory_region_init_io(&s->kbd.reg, NULL, &lasips2_reg_ops, &s->kbd,
                           "lasips2-kbd", 0x100);
-    memory_region_add_subregion(address_space, base, &s->kbd.reg);
+    sysbus_init_mmio(sbd, &s->kbd.reg);
 
     memory_region_init_io(&s->mouse.reg, NULL, &lasips2_reg_ops, &s->mouse,
                           "lasips2-mouse", 0x100);
-    memory_region_add_subregion(address_space, base + 0x100, &s->mouse.reg);
+    sysbus_init_mmio(sbd, &s->mouse.reg);
+}
+
+static void lasips2_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->vmsd = &vmstate_lasips2;
 }
+
+static const TypeInfo lasips2_info = {
+    .name          = TYPE_LASIPS2,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(LASIPS2State),
+    .instance_init = lasips2_init,
+    .class_init    = lasips2_class_init,
+};
+
+static void lasips2_register_types(void)
+{
+    type_register_static(&lasips2_info);
+}
+
+type_init(lasips2_register_types)
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index c88f1700162a..834b6d867d9d 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -7,11 +7,11 @@
 #ifndef HW_INPUT_LASIPS2_H
 #define HW_INPUT_LASIPS2_H
 
-#include "exec/hwaddr.h"
+#include "hw/sysbus.h"
 
 #define TYPE_LASIPS2 "lasips2"
+OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2State, LASIPS2)
 
-struct LASIPS2State;
 typedef struct LASIPS2Port {
     struct LASIPS2State *parent;
     MemoryRegion reg;
@@ -23,12 +23,21 @@ typedef struct LASIPS2Port {
     bool irq;
 } LASIPS2Port;
 
+/*
+ * QEMU interface:
+ *  + sysbus MMIO region 0 is the keyboard port interface
+ *  + sysbus MMIO region 1 is the mouse port interface
+ *  + sysbus IRQ 0 is the interrupt line shared between
+ *    keyboard and mouse ports
+ */
 typedef struct LASIPS2State {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
     LASIPS2Port kbd;
     LASIPS2Port mouse;
     qemu_irq irq;
 } LASIPS2State;
 
-void lasips2_init(MemoryRegion *address_space, hwaddr base, qemu_irq irq);
-
 #endif /* HW_INPUT_LASIPS2_H */
-- 
2.31.1


