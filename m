Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C880AF1FF
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 21:44:42 +0200 (CEST)
Received: from localhost ([::1]:44524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7m49-00036C-6r
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 15:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59054)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i7luF-00018u-Gx
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 15:34:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i7luD-0006s8-TL
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 15:34:27 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:60953)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1i7luD-0006rW-L0; Tue, 10 Sep 2019 15:34:25 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N4hBx-1iEPNQ3MF5-011m2z; Tue, 10 Sep 2019 21:34:00 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 21:33:42 +0200
Message-Id: <20190910193347.16000-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910193347.16000-1-laurent@vivier.eu>
References: <20190910193347.16000-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CjZK8pBebTML4bYFbE8l6j1MxC2jkehwW9+d/pnGbmmtkUY1Gmv
 X8EbVg/wPFRfPLiAUjuboblYLsRm8cI1VYugsqElmvzrRkclW2KeB2BXI0U5HDNH+kZMifU
 Q58/nZKNvocLgBji2mrnmzCwn1+6UuyO8Cx0KZfpUz3ZYJdeD0jkF3YdAgZmvIe4Ayp49r5
 b1R4BsnOYOMheV1Cjq/Cw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hXaq7b6hubI=:B7/tONJMx1iSiBD4n2clSf
 3sSjC49/Lv7xqs2er09Cp/CxCD+ket0adMdOfJLXhlshFMUhPaBpFvu+GFgoC3tcJi/u3941J
 l24UeoAQtuGtxCsZ349ZVBe3BJElOdrCR0O7ETCq9hhBTMtZDjb3f1z2QwWSx6EC2kKFyUIz+
 VfKR+G2ia/zUcKVFwuMQBGyBlO4mGd8FDlfP6aOK1whadqfUfkU3X6JotxjqYJJZRZcO4uwFF
 L4GGelDcBhzqyR7FdJiiixgLLLjygV76WTxAnC086WTH0dtyhf4OnpB1t7xqUipQqeM+GCos1
 bGDhP2uNuM82vQ0SElvWN6TMpGd3Rq8vIUWxtPr6WJapC68kI6v13vpbvrj7Yynw9t561qtfc
 AQk3FBOkIQS/W1yINkRLmOsSwSDPlHlvWSyL/aQCh4yD6ke2uy45iqg6mBR3rWw4MWFmZvbQl
 HdvFac+aL90PZ4o+RGheUWJI3ZDnrE2uLzqW0W191E+gXY8ZUFf5sUIqTr0XRU02Mz1M3JdQ6
 ekxI/n83ABzeHzB3FpAQRj+Ij3ypP1qjFIkhI04RUup6EOA4LQO0ztY1Xrwe0nxGmu9a5yfOE
 TQZQY7LpCfTOsq5SOVhTL78MxEpaEpKWtSGC77IxhVkVuSI9zIa5Pcck+7DHF8lwt5NdKp/Eb
 vdjpMB+8D4vKDyK+aHv+jzOLv4mB5+QtPtL47Fx+t4M7qVwEb1k7F5tFhj07Nt0wS27jrchdX
 ALu2X6c6wHhIUhLLepiCGd2/V+TEBWZWAd+WpscUoswtqwOyvO7mKppK3VRRwnFDlq5fuO2ON
 FpwIm7V/kMPLkvo3EaW6nvG/pZ0R315pVofDJtncEDF3z4FIao=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: [Qemu-devel] [PATCH v11 4/9] hw/m68k: implement ADB bus support for
 via
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
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Co-developed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
---
 hw/misc/Kconfig           |   1 +
 hw/misc/mac_via.c         | 198 +++++++++++++++++++++++++++++++++++++-
 include/hw/misc/mac_via.h |   7 ++
 3 files changed, 205 insertions(+), 1 deletion(-)

diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 18a5dc9c09..2164646553 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -123,5 +123,6 @@ config UNIMP
 config MAC_VIA
     bool
     select MOS6522
+    select ADB
 
 source macio/Kconfig
diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index a052259613..2f54db9e1e 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -264,10 +264,16 @@
  * Table 19-10 ADB transaction states
  */
 
+#define ADB_STATE_NEW       0
+#define ADB_STATE_EVEN      1
+#define ADB_STATE_ODD       2
+#define ADB_STATE_IDLE      3
+
 #define VIA1B_vADB_StateMask    (VIA1B_vADBS1 | VIA1B_vADBS2)
 #define VIA1B_vADB_StateShift   4
 
 #define VIA_TIMER_FREQ (783360)
+#define VIA_ADB_POLL_FREQ 50 /* XXX: not real */
 
 /* VIA returns time offset from Jan 1, 1904, not 1970 */
 #define RTC_OFFSET 2082844800
@@ -449,6 +455,181 @@ static void via1_rtc_update(MacVIAState *m)
     }
 }
 
+static int adb_via_poll(MacVIAState *s, int state, uint8_t *data)
+{
+    if (state != ADB_STATE_IDLE) {
+        return 0;
+    }
+
+    if (s->adb_data_in_size < s->adb_data_in_index) {
+        return 0;
+    }
+
+    if (s->adb_data_out_index != 0) {
+        return 0;
+    }
+
+    s->adb_data_in_index = 0;
+    s->adb_data_out_index = 0;
+    s->adb_data_in_size = adb_poll(&s->adb_bus, s->adb_data_in, 0xffff);
+
+    if (s->adb_data_in_size) {
+        *data = s->adb_data_in[s->adb_data_in_index++];
+        qemu_irq_raise(s->adb_data_ready);
+    }
+
+    return s->adb_data_in_size;
+}
+
+static int adb_via_send(MacVIAState *s, int state, uint8_t data)
+{
+    switch (state) {
+    case ADB_STATE_NEW:
+        s->adb_data_out_index = 0;
+        break;
+    case ADB_STATE_EVEN:
+        if ((s->adb_data_out_index & 1) == 0) {
+            return 0;
+        }
+        break;
+    case ADB_STATE_ODD:
+        if (s->adb_data_out_index & 1) {
+            return 0;
+        }
+        break;
+    case ADB_STATE_IDLE:
+        return 0;
+    }
+
+    assert(s->adb_data_out_index < sizeof(s->adb_data_out) - 1);
+
+    s->adb_data_out[s->adb_data_out_index++] = data;
+    qemu_irq_raise(s->adb_data_ready);
+    return 1;
+}
+
+static int adb_via_receive(MacVIAState *s, int state, uint8_t *data)
+{
+    switch (state) {
+    case ADB_STATE_NEW:
+        return 0;
+
+    case ADB_STATE_EVEN:
+        if (s->adb_data_in_size <= 0) {
+            qemu_irq_raise(s->adb_data_ready);
+            return 0;
+        }
+
+        if (s->adb_data_in_index >= s->adb_data_in_size) {
+            *data = 0;
+            qemu_irq_raise(s->adb_data_ready);
+            return 1;
+        }
+
+        if ((s->adb_data_in_index & 1) == 0) {
+            return 0;
+        }
+
+        break;
+
+    case ADB_STATE_ODD:
+        if (s->adb_data_in_size <= 0) {
+            qemu_irq_raise(s->adb_data_ready);
+            return 0;
+        }
+
+        if (s->adb_data_in_index >= s->adb_data_in_size) {
+            *data = 0;
+            qemu_irq_raise(s->adb_data_ready);
+            return 1;
+        }
+
+        if (s->adb_data_in_index & 1) {
+            return 0;
+        }
+
+        break;
+
+    case ADB_STATE_IDLE:
+        if (s->adb_data_out_index == 0) {
+            return 0;
+        }
+
+        s->adb_data_in_size = adb_request(&s->adb_bus, s->adb_data_in,
+                                          s->adb_data_out,
+                                          s->adb_data_out_index);
+        s->adb_data_out_index = 0;
+        s->adb_data_in_index = 0;
+        if (s->adb_data_in_size < 0) {
+            *data = 0xff;
+            qemu_irq_raise(s->adb_data_ready);
+            return -1;
+        }
+
+        if (s->adb_data_in_size == 0) {
+            return 0;
+        }
+
+        break;
+    }
+
+    assert(s->adb_data_in_index < sizeof(s->adb_data_in) - 1);
+
+    *data = s->adb_data_in[s->adb_data_in_index++];
+    qemu_irq_raise(s->adb_data_ready);
+    if (*data == 0xff || *data == 0) {
+        return 0;
+    }
+    return 1;
+}
+
+static void via1_adb_update(MacVIAState *m)
+{
+    MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(&m->mos6522_via1);
+    MOS6522State *s = MOS6522(v1s);
+    int state;
+    int ret;
+
+    state = (s->b & VIA1B_vADB_StateMask) >> VIA1B_vADB_StateShift;
+
+    if (s->acr & VIA1ACR_vShiftOut) {
+        /* output mode */
+        ret = adb_via_send(m, state, s->sr);
+        if (ret > 0) {
+            s->b &= ~VIA1B_vADBInt;
+        } else {
+            s->b |= VIA1B_vADBInt;
+        }
+    } else {
+        /* input mode */
+        ret = adb_via_receive(m, state, &s->sr);
+        if (ret > 0 && s->sr != 0xff) {
+            s->b &= ~VIA1B_vADBInt;
+        } else {
+            s->b |= VIA1B_vADBInt;
+        }
+    }
+}
+
+static void via_adb_poll(void *opaque)
+{
+    MacVIAState *m = opaque;
+    MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(&m->mos6522_via1);
+    MOS6522State *s = MOS6522(v1s);
+    int state;
+
+    if (s->b & VIA1B_vADBInt) {
+        state = (s->b & VIA1B_vADB_StateMask) >> VIA1B_vADB_StateShift;
+        if (adb_via_poll(m, state, &s->sr)) {
+            s->b &= ~VIA1B_vADBInt;
+        }
+    }
+
+    timer_mod(m->adb_poll_timer,
+              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
+              (NANOSECONDS_PER_SECOND / VIA_ADB_POLL_FREQ));
+}
+
 static uint64_t mos6522_q800_via1_read(void *opaque, hwaddr addr, unsigned size)
 {
     MOS6522Q800VIA1State *s = MOS6522_Q800_VIA1(opaque);
@@ -511,6 +692,10 @@ static void mac_via_reset(DeviceState *dev)
 {
     MacVIAState *m = MAC_VIA(dev);
 
+    timer_mod(m->adb_poll_timer,
+              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
+              (NANOSECONDS_PER_SECOND / VIA_ADB_POLL_FREQ));
+
     timer_mod(m->VBL_timer, (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 16630)
               / 16630 * 16630);
 
@@ -549,6 +734,10 @@ static void mac_via_realize(DeviceState *dev, Error **errp)
 
     qemu_get_timedate(&tm, 0);
     m->tick_offset = (uint32_t)mktimegm(&tm) + RTC_OFFSET;
+
+    m->adb_poll_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, via_adb_poll, m);
+    m->adb_data_ready = qdev_get_gpio_in_named(dev, "via1-irq",
+                                               VIA1_IRQ_ADB_READY_BIT);
 }
 
 static void mac_via_init(Object *obj)
@@ -594,7 +783,13 @@ static const VMStateDescription vmstate_mac_via = {
         VMSTATE_UINT8(cmd, MacVIAState),
         VMSTATE_INT32(wprotect, MacVIAState),
         VMSTATE_INT32(alt, MacVIAState),
-        /* external timers */
+        /* ADB */
+        VMSTATE_TIMER_PTR(adb_poll_timer, MacVIAState),
+        VMSTATE_INT32(adb_data_in_size, MacVIAState),
+        VMSTATE_INT32(adb_data_in_index, MacVIAState),
+        VMSTATE_INT32(adb_data_out_index, MacVIAState),
+        VMSTATE_BUFFER(adb_data_in, MacVIAState),
+        VMSTATE_BUFFER(adb_data_out, MacVIAState),
         VMSTATE_TIMER_PTR(one_second_timer, MacVIAState),
         VMSTATE_TIMER_PTR(VBL_timer, MacVIAState),
         VMSTATE_END_OF_LIST()
@@ -626,6 +821,7 @@ static void mos6522_q800_via1_portB_write(MOS6522State *s)
     MacVIAState *m = container_of(v1s, MacVIAState, mos6522_via1);
 
     via1_rtc_update(m);
+    via1_adb_update(m);
 
     v1s->last_b = s->b;
 }
diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
index 69bdecabb0..2181140293 100644
--- a/include/hw/misc/mac_via.h
+++ b/include/hw/misc/mac_via.h
@@ -97,6 +97,13 @@ typedef struct MacVIAState {
 
     /* ADB */
     ADBBusState adb_bus;
+    QEMUTimer *adb_poll_timer;
+    qemu_irq adb_data_ready;
+    int adb_data_in_size;
+    int adb_data_in_index;
+    int adb_data_out_index;
+    uint8_t adb_data_in[128];
+    uint8_t adb_data_out[16];
 
     /* external timers */
     QEMUTimer *one_second_timer;
-- 
2.21.0


