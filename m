Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0C26323D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 09:36:13 +0200 (CEST)
Received: from localhost ([::1]:47482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkkfb-0005zw-Pn
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 03:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46743)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <th.huth@gmail.com>) id 1hkkcS-0004FT-Ea
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 03:32:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <th.huth@gmail.com>) id 1hkkcQ-0001NO-NA
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 03:32:56 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:36992)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <th.huth@gmail.com>) id 1hkkcQ-0001Mn-GO
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 03:32:54 -0400
Received: by mail-wm1-f42.google.com with SMTP id f17so2037529wme.2
 for <qemu-devel@nongnu.org>; Tue, 09 Jul 2019 00:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J7UHSP3WSTSih2fPRDWL6AZMfZuBolPVoNwNdxAMZtA=;
 b=RTfG/epgPwEdcbHbFq/5vsmguDHqonOjy5BVJG4ZnsRxxXKlI4pHWF/zwifKpGlkid
 8jw6Gq+0D/6/Fl977dXVIoO3kqW/hCSgCBL9S+Ot0K7A98rpv9MYS1FIoZlek4uKZy4Q
 HxcMctSG2duGcjKmr4cg1wBbLwoE6isdrGsviND8ZjiUTeXUeg3gfPANeR8mnaP0k+jj
 SlFiAP05A9zCc70v5zXPFEpS7TlI1ad7H3EPKUVnN5F1+6D9UROb0HhaPlXx2hHR+7sq
 w8QqrTRu3MdOzSMVGjVHfSJfai6itpCGoEMUhoPkcgtDexRSTfU2huRLKhDnRmmrdK5X
 opGA==
X-Gm-Message-State: APjAAAW/z048mh8233+qZD/OVLhke8rltDxWLHVUPTpLebz1hRWbq3bo
 NYpK+VimYFPDGjffXhhPZsWssxdUNDU=
X-Google-Smtp-Source: APXvYqzJtHcP5qydnkqGTEKW97jp7mFE0euyAsGOUJ2OguSwGuc+Mqe4eYcvjK/JK0rzVpBZiaHWHg==
X-Received: by 2002:a1c:63d7:: with SMTP id x206mr20877142wmb.19.1562657573126; 
 Tue, 09 Jul 2019 00:32:53 -0700 (PDT)
Received: from thl530.multi.box (pD95752BD.dip0.t-ipconnect.de.
 [217.87.82.189])
 by smtp.gmail.com with ESMTPSA id l2sm1529208wmj.4.2019.07.09.00.32.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 00:32:52 -0700 (PDT)
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org
Date: Tue,  9 Jul 2019 09:32:18 +0200
Message-Id: <20190709073222.26370-3-huth@tuxfamily.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190709073222.26370-1-huth@tuxfamily.org>
References: <20190709073222.26370-1-huth@tuxfamily.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.42
Subject: [Qemu-devel] [PATCH v4 2/6] m68k: Add NeXTcube keyboard device
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is likely still quite incomplete (e.g. mouse and interrupts are not
implemented yet), but it is good enough for keyboard input at the firmware
monitor.
This code has been taken from Bryce Lanham's GSoC 2011 NeXT branch at

 https://github.com/blanham/qemu-NeXT/blob/next-cube/hw/next-kbd.c

and altered to fit the latest interface of the current QEMU (e.g. to use
memory_region_init_io() instead of cpu_register_physical_memory()).

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 hw/m68k/Makefile.objs       |   1 +
 hw/m68k/next-kbd.c          | 284 ++++++++++++++++++++++++++++++++++++
 include/hw/m68k/next-cube.h |   2 +
 3 files changed, 287 insertions(+)
 create mode 100644 hw/m68k/next-kbd.c

diff --git a/hw/m68k/Makefile.objs b/hw/m68k/Makefile.objs
index 482f8477b4..688002cac1 100644
--- a/hw/m68k/Makefile.objs
+++ b/hw/m68k/Makefile.objs
@@ -1,2 +1,3 @@
 obj-$(CONFIG_AN5206) += an5206.o mcf5206.o
 obj-$(CONFIG_MCF5208) += mcf5208.o mcf_intc.o
+obj-$(CONFIG_NEXTCUBE) += next-kbd.o
diff --git a/hw/m68k/next-kbd.c b/hw/m68k/next-kbd.c
new file mode 100644
index 0000000000..c866562382
--- /dev/null
+++ b/hw/m68k/next-kbd.c
@@ -0,0 +1,284 @@
+/*
+ * QEMU NeXT Keyboard/Mouse emulation
+ *
+ * Copyright (c) 2011 Bryce Lanham
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+/*
+ * This is admittedly hackish, but works well enough for basic input. Mouse
+ * support will be added once we can boot something that needs the mouse.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "exec/address-spaces.h"
+#include "hw/hw.h"
+#include "hw/sysbus.h"
+#include "hw/m68k/next-cube.h"
+#include "ui/console.h"
+#include "sysemu/sysemu.h"
+
+#define NEXTKBD(obj) OBJECT_CHECK(NextKBDState, (obj), TYPE_NEXTKBD)
+
+/* following defintions from next68k netbsd */
+#define CSR_INT 0x00800000
+#define CSR_DATA 0x00400000
+
+#define KD_KEYMASK    0x007f
+#define KD_DIRECTION  0x0080 /* pressed or released */
+#define KD_CNTL       0x0100
+#define KD_LSHIFT     0x0200
+#define KD_RSHIFT     0x0400
+#define KD_LCOMM      0x0800
+#define KD_RCOMM      0x1000
+#define KD_LALT       0x2000
+#define KD_RALT       0x4000
+#define KD_VALID      0x8000 /* only set for scancode keys ? */
+#define KD_MODS       0x4f00
+
+#define KBD_QUEUE_SIZE 256
+
+typedef struct {
+    uint8_t data[KBD_QUEUE_SIZE];
+    int rptr, wptr, count;
+} KBDQueue;
+
+
+typedef struct NextKBDState {
+    SysBusDevice sbd;
+    MemoryRegion mr;
+    KBDQueue queue;
+    uint16_t shift;
+} NextKBDState;
+
+static void queue_code(void *opaque, int code);
+
+/* lots of magic numbers here */
+static uint32_t kbd_read_byte(void *opaque, hwaddr addr)
+{
+    switch (addr & 0x3) {
+    case 0x0:   /* 0xe000 */
+        return 0x80 | 0x20;
+
+    case 0x1:   /* 0xe001 */
+        return 0x80 | 0x40 | 0x20 | 0x10;
+
+    case 0x2:   /* 0xe002 */
+        /* returning 0x40 caused mach to hang */
+        return 0x10 | 0x2 | 0x1;
+
+    default:
+        qemu_log_mask(LOG_UNIMP, "NeXT kbd read byte %"HWADDR_PRIx"\n", addr);
+    }
+
+    return 0;
+}
+
+static uint32_t kbd_read_word(void *opaque, hwaddr addr)
+{
+    qemu_log_mask(LOG_UNIMP, "NeXT kbd read word %"HWADDR_PRIx"\n", addr);
+    return 0;
+}
+
+/* even more magic numbers */
+static uint32_t kbd_read_long(void *opaque, hwaddr addr)
+{
+    int key = 0;
+    NextKBDState *s = NEXTKBD(opaque);
+    KBDQueue *q = &s->queue;
+
+    switch (addr & 0xf) {
+    case 0x0:   /* 0xe000 */
+        return 0xA0F09300;
+
+    case 0x8:   /* 0xe008 */
+        /* get keycode from buffer */
+        if (q->count > 0) {
+            key = q->data[q->rptr];
+            if (++q->rptr == KBD_QUEUE_SIZE) {
+                q->rptr = 0;
+            }
+
+            q->count--;
+
+            if (s->shift) {
+                key |= s->shift;
+            }
+
+            if (key & 0x80) {
+                return 0;
+            } else {
+                return 0x10000000 | KD_VALID | key;
+            }
+        } else {
+            return 0;
+        }
+
+    default:
+        qemu_log_mask(LOG_UNIMP, "NeXT kbd read long %"HWADDR_PRIx"\n", addr);
+        return 0;
+    }
+}
+
+static uint64_t kbd_readfn(void *opaque, hwaddr addr, unsigned size)
+{
+    switch (size) {
+    case 1:
+        return kbd_read_byte(opaque, addr);
+    case 2:
+        return kbd_read_word(opaque, addr);
+    case 4:
+        return kbd_read_long(opaque, addr);
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void kbd_writefn(void *opaque, hwaddr addr, uint64_t value,
+                        unsigned size)
+{
+    qemu_log_mask(LOG_UNIMP, "NeXT kbd write: size=%u addr=0x%"HWADDR_PRIx
+                  "val=0x%"PRIx64"\n", size, addr, value);
+}
+
+static const MemoryRegionOps kbd_ops = {
+    .read = kbd_readfn,
+    .write = kbd_writefn,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 4,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void nextkbd_event(void *opaque, int ch)
+{
+    /*
+     * Will want to set vars for caps/num lock
+     * if (ch & 0x80) -> key release
+     * there's also e0 escaped scancodes that might need to be handled
+     */
+    queue_code(opaque, ch);
+}
+
+static const unsigned char next_keycodes[128] = {
+    0x00, 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x50, 0x4F,
+    0x4E, 0x1E, 0x1F, 0x20, 0x1D, 0x1C, 0x1B, 0x00,
+    0x42, 0x43, 0x44, 0x45, 0x48, 0x47, 0x46, 0x06,
+    0x07, 0x08, 0x00, 0x00, 0x2A, 0x00, 0x39, 0x3A,
+    0x3B, 0x3C, 0x3D, 0x40, 0x3F, 0x3E, 0x2D, 0x2C,
+    0x2B, 0x26, 0x00, 0x00, 0x31, 0x32, 0x33, 0x34,
+    0x35, 0x37, 0x36, 0x2e, 0x2f, 0x30, 0x00, 0x00,
+    0x00, 0x38, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
+};
+
+static void queue_code(void *opaque, int code)
+{
+    NextKBDState *s = NEXTKBD(opaque);
+    KBDQueue *q = &s->queue;
+    int key = code & KD_KEYMASK;
+    int release = code & 0x80;
+    static int ext;
+
+    if (code == 0xE0) {
+        ext = 1;
+    }
+
+    if (code == 0x2A || code == 0x1D || code == 0x36) {
+        if (code == 0x2A) {
+            s->shift = KD_LSHIFT;
+        } else if (code == 0x36) {
+            s->shift = KD_RSHIFT;
+            ext = 0;
+        } else if (code == 0x1D && !ext) {
+            s->shift = KD_LCOMM;
+        } else if (code == 0x1D && ext) {
+            ext = 0;
+            s->shift = KD_RCOMM;
+        }
+        return;
+    } else if (code == (0x2A | 0x80) || code == (0x1D | 0x80) ||
+               code == (0x36 | 0x80)) {
+        s->shift = 0;
+        return;
+    }
+
+    if (q->count >= KBD_QUEUE_SIZE) {
+        return;
+    }
+
+    q->data[q->wptr] = next_keycodes[key] | release;
+
+    if (++q->wptr == KBD_QUEUE_SIZE) {
+        q->wptr = 0;
+    }
+
+    q->count++;
+
+    /*
+     * might need to actually trigger the NeXT irq, but as the keyboard works
+     * at the moment, I'll worry about it later
+     */
+    /* s->update_irq(s->update_arg, 1); */
+}
+
+static void nextkbd_reset(DeviceState *dev)
+{
+    NextKBDState *nks = NEXTKBD(dev);
+
+    memset(&nks->queue, 0, sizeof(KBDQueue));
+    nks->shift = 0;
+}
+
+static void nextkbd_realize(DeviceState *dev, Error **errp)
+{
+    NextKBDState *s = NEXTKBD(dev);
+
+    memory_region_init_io(&s->mr, OBJECT(dev), &kbd_ops, s, "next.kbd", 0x1000);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mr);
+
+    qemu_add_kbd_event_handler(nextkbd_event, s);
+}
+
+static void nextkbd_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+    dc->realize = nextkbd_realize;
+    dc->reset = nextkbd_reset;
+}
+
+static const TypeInfo nextkbd_info = {
+    .name          = TYPE_NEXTKBD,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(NextKBDState),
+    .class_init    = nextkbd_class_init,
+};
+
+static void nextkbd_register_types(void)
+{
+    type_register_static(&nextkbd_info);
+}
+
+type_init(nextkbd_register_types)
diff --git a/include/hw/m68k/next-cube.h b/include/hw/m68k/next-cube.h
index 090c7c51aa..37f7ce3e34 100644
--- a/include/hw/m68k/next-cube.h
+++ b/include/hw/m68k/next-cube.h
@@ -4,4 +4,6 @@
 
 #define TYPE_NEXTFB "next-fb"
 
+#define TYPE_NEXTKBD "next-kbd"
+
 #endif /* NEXT_CUBE_H */
-- 
2.21.0


