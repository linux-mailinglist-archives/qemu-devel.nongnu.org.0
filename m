Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29128403CD6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:49:59 +0200 (CEST)
Received: from localhost ([::1]:35812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzpm-0006eY-63
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNzc2-0004FV-3b
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:35:46 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:57983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNzbz-0003w7-CQ
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:35:45 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MFsdD-1mAXE341QF-00HPZ2; Wed, 08
 Sep 2021 17:35:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 05/12] mac_via: move ADB variables to MOS6522Q800VIA1State
Date: Wed,  8 Sep 2021 17:35:22 +0200
Message-Id: <20210908153529.453843-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908153529.453843-1-laurent@vivier.eu>
References: <20210908153529.453843-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nHQmfAZUuZh7bO3TQBPyhqWl03kGc1Y0IWLugypBLoAiNjLrt/8
 p5mUZj3UZ8k4dgHANYgf/Q7odrezL5z7gBzSsEKjqiWOTC/eBuMmFL2ADijQs+u6qUutefn
 DqdoySXIBHiTz0l0hJgwgD3pEBgPhacC9p2FcKFsLXjNCQv5NkHqtQnWIH8ox9A9W+9OtAJ
 rRg4VizsNYiX4NWqThXZw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iyKBu01v1v4=:HHD3BTEX/GTsAs79ozzRLr
 7rkVEMvgSF3MHeBb0KwS1as1Qn2kFM2n3qKxikPtc9kTBoYh8Ia66H/sqZxDkCX2BTyT4Tewz
 dR7ECrF+424V2QdSkpwfCgoK5hUArsorABCrklX1OjD7w3w/loMuCHnIx7Cx4YmxFdbmx1I4c
 PGHZ3f0/StlyvF//yagSInLlLlNMQ6omxe9MIgqiAmN6tsxOJZLFFlTzkRKcLfu4wC8YqLKBX
 AU5R9inuTOqdSfoT/Lo6KFiPiJ/cZJxoG8eZaloPW7aeRxWaKwWSjqjDZNralvxTwvD4YjpN+
 i5p1a275sWRQLJlvJgD5UdVtHvl/mEGxQDyIpBcr7PYFch/ZtaRi1gWggnWIyXOWo4IvmWn5N
 cisbjKX9dyxvC/Qpx89DlZRV2s5WHojpVtqAaXkLSI/mJ50aOmhqqVJrciVNqNX+TZe46G3M6
 E5tiZrvxrVqm81Xiv527nSxxRBwY8ecTecYcDZQhttSCGxx/r75emEW8SsNWIl08AyTV+S+Zz
 LJFusGfNetLITchud4Dpaoi3KFRGoH1YEiA5xnHL4UdFRu4aHxOtv97SjmegfRGIrm//aIbW0
 /pJMcR1k5XnhieDbYWVZZsqa74uibAcSemB1Iju+RIifeYRPZNU1UxjpCizwxT6FcRt3I6MTX
 LQyv6HlhvoAJ1/B4tRuHan8CQQhcN6E426t96r87N2Iz7bYB1Ai1rKOoA5iz9vE6MSuFm55gD
 8wq0XSebvqdFFbQOwytFVqIt4LItQDg0fuhnIQ==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

The ADB is accessed using clock and data pins on q800 VIA1 port B and so can be
moved to MOS6522Q800VIA1State.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210830102447.10806-6-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/misc/mac_via.h |  20 ++---
 hw/m68k/q800.c            |   6 +-
 hw/misc/mac_via.c         | 169 +++++++++++++++++++-------------------
 3 files changed, 96 insertions(+), 99 deletions(-)

diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
index b2c499ed6b5b..182dcb742235 100644
--- a/include/hw/misc/mac_via.h
+++ b/include/hw/misc/mac_via.h
@@ -56,6 +56,16 @@ struct MOS6522Q800VIA1State {
     int wprotect;
     int alt;
 
+    /* ADB */
+    ADBBusState adb_bus;
+    qemu_irq adb_data_ready;
+    int adb_data_in_size;
+    int adb_data_in_index;
+    int adb_data_out_index;
+    uint8_t adb_data_in[128];
+    uint8_t adb_data_out[16];
+    uint8_t adb_autopoll_cmd;
+
     /* external timers */
     QEMUTimer *one_second_timer;
     int64_t next_second;
@@ -102,16 +112,6 @@ struct MacVIAState {
     /* VIAs */
     MOS6522Q800VIA1State mos6522_via1;
     MOS6522Q800VIA2State mos6522_via2;
-
-    /* ADB */
-    ADBBusState adb_bus;
-    qemu_irq adb_data_ready;
-    int adb_data_in_size;
-    int adb_data_in_index;
-    int adb_data_out_index;
-    uint8_t adb_data_in[128];
-    uint8_t adb_data_out[16];
-    uint8_t adb_autopoll_cmd;
 };
 
 #endif
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index ac0a13060b4a..e14f68f19b13 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -225,7 +225,7 @@ static void q800_init(MachineState *machine)
     hwaddr parameters_base;
     CPUState *cs;
     DeviceState *dev;
-    DeviceState *via_dev;
+    DeviceState *via_dev, *via1_dev;
     DeviceState *escc_orgate;
     SysBusESPState *sysbus_esp;
     ESPState *esp;
@@ -285,8 +285,8 @@ static void q800_init(MachineState *machine)
     qdev_connect_gpio_out_named(DEVICE(sysbus), "irq", 1,
                                 qdev_get_gpio_in(glue, 1));
 
-
-    adb_bus = qdev_get_child_bus(via_dev, "adb.0");
+    via1_dev = DEVICE(MOS6522_Q800_VIA1(&MAC_VIA(via_dev)->mos6522_via1));
+    adb_bus = qdev_get_child_bus(DEVICE(via1_dev), "adb.0");
     dev = qdev_new(TYPE_ADB_KEYBOARD);
     qdev_realize_and_unref(dev, adb_bus, &error_fatal);
     dev = qdev_new(TYPE_ADB_MOUSE);
diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 3978e6b44136..b4a65480fdc8 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -595,10 +595,9 @@ static void via1_rtc_update(MOS6522Q800VIA1State *v1s)
 
 static void adb_via_poll(void *opaque)
 {
-    MacVIAState *m = opaque;
-    MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(&m->mos6522_via1);
+    MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(opaque);
     MOS6522State *s = MOS6522(v1s);
-    ADBBusState *adb_bus = &m->adb_bus;
+    ADBBusState *adb_bus = &v1s->adb_bus;
     uint8_t obuf[9];
     uint8_t *data = &s->sr;
     int olen;
@@ -610,50 +609,50 @@ static void adb_via_poll(void *opaque)
      */
     adb_autopoll_block(adb_bus);
 
-    if (m->adb_data_in_size > 0 && m->adb_data_in_index == 0) {
+    if (v1s->adb_data_in_size > 0 && v1s->adb_data_in_index == 0) {
         /*
          * For older Linux kernels that switch to IDLE mode after sending the
          * ADB command, detect if there is an existing response and return that
          * as a a "fake" autopoll reply or bus timeout accordingly
          */
-        *data = m->adb_data_out[0];
-        olen = m->adb_data_in_size;
+        *data = v1s->adb_data_out[0];
+        olen = v1s->adb_data_in_size;
 
         s->b &= ~VIA1B_vADBInt;
-        qemu_irq_raise(m->adb_data_ready);
+        qemu_irq_raise(v1s->adb_data_ready);
     } else {
         /*
          * Otherwise poll as normal
          */
-        m->adb_data_in_index = 0;
-        m->adb_data_out_index = 0;
+        v1s->adb_data_in_index = 0;
+        v1s->adb_data_out_index = 0;
         olen = adb_poll(adb_bus, obuf, adb_bus->autopoll_mask);
 
         if (olen > 0) {
             /* Autopoll response */
             *data = obuf[0];
             olen--;
-            memcpy(m->adb_data_in, &obuf[1], olen);
-            m->adb_data_in_size = olen;
+            memcpy(v1s->adb_data_in, &obuf[1], olen);
+            v1s->adb_data_in_size = olen;
 
             s->b &= ~VIA1B_vADBInt;
-            qemu_irq_raise(m->adb_data_ready);
+            qemu_irq_raise(v1s->adb_data_ready);
         } else {
-            *data = m->adb_autopoll_cmd;
+            *data = v1s->adb_autopoll_cmd;
             obuf[0] = 0xff;
             obuf[1] = 0xff;
             olen = 2;
 
-            memcpy(m->adb_data_in, obuf, olen);
-            m->adb_data_in_size = olen;
+            memcpy(v1s->adb_data_in, obuf, olen);
+            v1s->adb_data_in_size = olen;
 
             s->b &= ~VIA1B_vADBInt;
-            qemu_irq_raise(m->adb_data_ready);
+            qemu_irq_raise(v1s->adb_data_ready);
         }
     }
 
     trace_via1_adb_poll(*data, (s->b & VIA1B_vADBInt) ? "+" : "-",
-                        adb_bus->status, m->adb_data_in_index, olen);
+                        adb_bus->status, v1s->adb_data_in_index, olen);
 }
 
 static int adb_via_send_len(uint8_t data)
@@ -686,11 +685,10 @@ static int adb_via_send_len(uint8_t data)
     }
 }
 
-static void adb_via_send(MacVIAState *s, int state, uint8_t data)
+static void adb_via_send(MOS6522Q800VIA1State *v1s, int state, uint8_t data)
 {
-    MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(&s->mos6522_via1);
     MOS6522State *ms = MOS6522(v1s);
-    ADBBusState *adb_bus = &s->adb_bus;
+    ADBBusState *adb_bus = &v1s->adb_bus;
     uint16_t autopoll_mask;
 
     switch (state) {
@@ -706,22 +704,22 @@ static void adb_via_send(MacVIAState *s, int state, uint8_t data)
             ms->b &= ~VIA1B_vADBInt;
         } else {
             ms->b |= VIA1B_vADBInt;
-            s->adb_data_out_index = 0;
-            s->adb_data_out[s->adb_data_out_index++] = data;
+            v1s->adb_data_out_index = 0;
+            v1s->adb_data_out[v1s->adb_data_out_index++] = data;
         }
 
         trace_via1_adb_send(" NEW", data, (ms->b & VIA1B_vADBInt) ? "+" : "-");
-        qemu_irq_raise(s->adb_data_ready);
+        qemu_irq_raise(v1s->adb_data_ready);
         break;
 
     case ADB_STATE_EVEN:
     case ADB_STATE_ODD:
         ms->b |= VIA1B_vADBInt;
-        s->adb_data_out[s->adb_data_out_index++] = data;
+        v1s->adb_data_out[v1s->adb_data_out_index++] = data;
 
         trace_via1_adb_send(state == ADB_STATE_EVEN ? "EVEN" : " ODD",
                             data, (ms->b & VIA1B_vADBInt) ? "+" : "-");
-        qemu_irq_raise(s->adb_data_ready);
+        qemu_irq_raise(v1s->adb_data_ready);
         break;
 
     case ADB_STATE_IDLE:
@@ -729,40 +727,39 @@ static void adb_via_send(MacVIAState *s, int state, uint8_t data)
     }
 
     /* If the command is complete, execute it */
-    if (s->adb_data_out_index == adb_via_send_len(s->adb_data_out[0])) {
-        s->adb_data_in_size = adb_request(adb_bus, s->adb_data_in,
-                                          s->adb_data_out,
-                                          s->adb_data_out_index);
-        s->adb_data_in_index = 0;
+    if (v1s->adb_data_out_index == adb_via_send_len(v1s->adb_data_out[0])) {
+        v1s->adb_data_in_size = adb_request(adb_bus, v1s->adb_data_in,
+                                            v1s->adb_data_out,
+                                            v1s->adb_data_out_index);
+        v1s->adb_data_in_index = 0;
 
         if (adb_bus->status & ADB_STATUS_BUSTIMEOUT) {
             /*
              * Bus timeout (but allow first EVEN and ODD byte to indicate
              * timeout via vADBInt and SRQ status)
              */
-            s->adb_data_in[0] = 0xff;
-            s->adb_data_in[1] = 0xff;
-            s->adb_data_in_size = 2;
+            v1s->adb_data_in[0] = 0xff;
+            v1s->adb_data_in[1] = 0xff;
+            v1s->adb_data_in_size = 2;
         }
 
         /*
          * If last command is TALK, store it for use by autopoll and adjust
          * the autopoll mask accordingly
          */
-        if ((s->adb_data_out[0] & 0xc) == 0xc) {
-            s->adb_autopoll_cmd = s->adb_data_out[0];
+        if ((v1s->adb_data_out[0] & 0xc) == 0xc) {
+            v1s->adb_autopoll_cmd = v1s->adb_data_out[0];
 
-            autopoll_mask = 1 << (s->adb_autopoll_cmd >> 4);
+            autopoll_mask = 1 << (v1s->adb_autopoll_cmd >> 4);
             adb_set_autopoll_mask(adb_bus, autopoll_mask);
         }
     }
 }
 
-static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
+static void adb_via_receive(MOS6522Q800VIA1State *v1s, int state, uint8_t *data)
 {
-    MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(&s->mos6522_via1);
     MOS6522State *ms = MOS6522(v1s);
-    ADBBusState *adb_bus = &s->adb_bus;
+    ADBBusState *adb_bus = &v1s->adb_bus;
     uint16_t pending;
 
     switch (state) {
@@ -776,16 +773,16 @@ static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
 
         trace_via1_adb_receive("IDLE", *data,
                         (ms->b & VIA1B_vADBInt) ? "+" : "-", adb_bus->status,
-                        s->adb_data_in_index, s->adb_data_in_size);
+                        v1s->adb_data_in_index, v1s->adb_data_in_size);
 
         break;
 
     case ADB_STATE_EVEN:
     case ADB_STATE_ODD:
-        switch (s->adb_data_in_index) {
+        switch (v1s->adb_data_in_index) {
         case 0:
             /* First EVEN byte: vADBInt indicates bus timeout */
-            *data = s->adb_data_in[s->adb_data_in_index];
+            *data = v1s->adb_data_in[v1s->adb_data_in_index];
             if (adb_bus->status & ADB_STATUS_BUSTIMEOUT) {
                 ms->b &= ~VIA1B_vADBInt;
             } else {
@@ -794,16 +791,16 @@ static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
 
             trace_via1_adb_receive(state == ADB_STATE_EVEN ? "EVEN" : " ODD",
                                    *data, (ms->b & VIA1B_vADBInt) ? "+" : "-",
-                                   adb_bus->status, s->adb_data_in_index,
-                                   s->adb_data_in_size);
+                                   adb_bus->status, v1s->adb_data_in_index,
+                                   v1s->adb_data_in_size);
 
-            s->adb_data_in_index++;
+            v1s->adb_data_in_index++;
             break;
 
         case 1:
             /* First ODD byte: vADBInt indicates SRQ */
-            *data = s->adb_data_in[s->adb_data_in_index];
-            pending = adb_bus->pending & ~(1 << (s->adb_autopoll_cmd >> 4));
+            *data = v1s->adb_data_in[v1s->adb_data_in_index];
+            pending = adb_bus->pending & ~(1 << (v1s->adb_autopoll_cmd >> 4));
             if (pending) {
                 ms->b &= ~VIA1B_vADBInt;
             } else {
@@ -812,10 +809,10 @@ static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
 
             trace_via1_adb_receive(state == ADB_STATE_EVEN ? "EVEN" : " ODD",
                                    *data, (ms->b & VIA1B_vADBInt) ? "+" : "-",
-                                   adb_bus->status, s->adb_data_in_index,
-                                   s->adb_data_in_size);
+                                   adb_bus->status, v1s->adb_data_in_index,
+                                   v1s->adb_data_in_size);
 
-            s->adb_data_in_index++;
+            v1s->adb_data_in_index++;
             break;
 
         default:
@@ -825,11 +822,11 @@ static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
              * end of the poll reply, so provide these extra bytes below to
              * keep it happy
              */
-            if (s->adb_data_in_index < s->adb_data_in_size) {
+            if (v1s->adb_data_in_index < v1s->adb_data_in_size) {
                 /* Next data byte */
-                *data = s->adb_data_in[s->adb_data_in_index];
+                *data = v1s->adb_data_in[v1s->adb_data_in_index];
                 ms->b |= VIA1B_vADBInt;
-            } else if (s->adb_data_in_index == s->adb_data_in_size) {
+            } else if (v1s->adb_data_in_index == v1s->adb_data_in_size) {
                 if (adb_bus->status & ADB_STATUS_BUSTIMEOUT) {
                     /* Bus timeout (no more data) */
                     *data = 0xff;
@@ -848,23 +845,22 @@ static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
 
             trace_via1_adb_receive(state == ADB_STATE_EVEN ? "EVEN" : " ODD",
                                    *data, (ms->b & VIA1B_vADBInt) ? "+" : "-",
-                                   adb_bus->status, s->adb_data_in_index,
-                                   s->adb_data_in_size);
+                                   adb_bus->status, v1s->adb_data_in_index,
+                                   v1s->adb_data_in_size);
 
-            if (s->adb_data_in_index <= s->adb_data_in_size) {
-                s->adb_data_in_index++;
+            if (v1s->adb_data_in_index <= v1s->adb_data_in_size) {
+                v1s->adb_data_in_index++;
             }
             break;
         }
 
-        qemu_irq_raise(s->adb_data_ready);
+        qemu_irq_raise(v1s->adb_data_ready);
         break;
     }
 }
 
-static void via1_adb_update(MacVIAState *m)
+static void via1_adb_update(MOS6522Q800VIA1State *v1s)
 {
-    MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(&m->mos6522_via1);
     MOS6522State *s = MOS6522(v1s);
     int oldstate, state;
 
@@ -874,10 +870,10 @@ static void via1_adb_update(MacVIAState *m)
     if (state != oldstate) {
         if (s->acr & VIA1ACR_vShiftOut) {
             /* output mode */
-            adb_via_send(m, state, s->sr);
+            adb_via_send(v1s, state, s->sr);
         } else {
             /* input mode */
-            adb_via_receive(m, state, &s->sr);
+            adb_via_receive(v1s, state, &s->sr);
         }
     }
 }
@@ -895,7 +891,6 @@ static void mos6522_q800_via1_write(void *opaque, hwaddr addr, uint64_t val,
                                     unsigned size)
 {
     MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(opaque);
-    MacVIAState *m = container_of(v1s, MacVIAState, mos6522_via1);
     MOS6522State *ms = MOS6522(v1s);
 
     addr = (addr >> 9) & 0xf;
@@ -904,7 +899,7 @@ static void mos6522_q800_via1_write(void *opaque, hwaddr addr, uint64_t val,
     switch (addr) {
     case VIA_REG_B:
         via1_rtc_update(v1s);
-        via1_adb_update(m);
+        via1_adb_update(v1s);
 
         v1s->last_b = ms->b;
         break;
@@ -954,7 +949,7 @@ static void mac_via_reset(DeviceState *dev)
 {
     MacVIAState *m = MAC_VIA(dev);
     MOS6522Q800VIA1State *v1s = &m->mos6522_via1;
-    ADBBusState *adb_bus = &m->adb_bus;
+    ADBBusState *adb_bus = &v1s->adb_bus;
 
     adb_set_autopoll_enabled(adb_bus, true);
 
@@ -967,17 +962,10 @@ static void mac_via_realize(DeviceState *dev, Error **errp)
     MacVIAState *m = MAC_VIA(dev);
     MOS6522Q800VIA1State *v1s = &m->mos6522_via1;
     MOS6522State *ms;
-    ADBBusState *adb_bus = &m->adb_bus;
+    ADBBusState *adb_bus = &v1s->adb_bus;
     struct tm tm;
     int ret;
 
-    /* Init VIAs 1 and 2 */
-    object_initialize_child(OBJECT(dev), "via1", &m->mos6522_via1,
-                            TYPE_MOS6522_Q800_VIA1);
-
-    object_initialize_child(OBJECT(dev), "via2", &m->mos6522_via2,
-                            TYPE_MOS6522_Q800_VIA2);
-
     /* Pass through mos6522 output IRQs */
     ms = MOS6522(&m->mos6522_via1);
     object_property_add_alias(OBJECT(dev), "irq[0]", OBJECT(ms),
@@ -1006,9 +994,9 @@ static void mac_via_realize(DeviceState *dev, Error **errp)
     qemu_get_timedate(&tm, 0);
     v1s->tick_offset = (uint32_t)mktimegm(&tm) + RTC_OFFSET;
 
-    adb_register_autopoll_callback(adb_bus, adb_via_poll, m);
-    m->adb_data_ready = qdev_get_gpio_in_named(dev, "via1-irq",
-                                               VIA1_IRQ_ADB_READY_BIT);
+    adb_register_autopoll_callback(adb_bus, adb_via_poll, v1s);
+    v1s->adb_data_ready = qdev_get_gpio_in_named(dev, "via1-irq",
+                                                 VIA1_IRQ_ADB_READY_BIT);
 
     if (v1s->blk) {
         int64_t len = blk_getlength(v1s->blk);
@@ -1049,9 +1037,12 @@ static void mac_via_init(Object *obj)
                           &m->mos6522_via2, "via2", VIA_SIZE);
     memory_region_add_subregion(&m->mmio, VIA_SIZE, &m->via2mem);
 
-    /* ADB */
-    qbus_create_inplace((BusState *)&m->adb_bus, sizeof(m->adb_bus),
-                        TYPE_ADB_BUS, DEVICE(obj), "adb.0");
+    /* Init VIAs 1 and 2 */
+    object_initialize_child(obj, "via1", &m->mos6522_via1,
+                            TYPE_MOS6522_Q800_VIA1);
+
+    object_initialize_child(obj, "via2", &m->mos6522_via2,
+                            TYPE_MOS6522_Q800_VIA2);
 }
 
 static void via1_postload_update_cb(void *opaque, bool running, RunState state)
@@ -1086,13 +1077,6 @@ static const VMStateDescription vmstate_mac_via = {
         VMSTATE_INT64(mos6522_via1.next_second, MacVIAState),
         VMSTATE_TIMER_PTR(mos6522_via1.sixty_hz_timer, MacVIAState),
         VMSTATE_INT64(mos6522_via1.next_sixty_hz, MacVIAState),
-        /* ADB */
-        VMSTATE_INT32(adb_data_in_size, MacVIAState),
-        VMSTATE_INT32(adb_data_in_index, MacVIAState),
-        VMSTATE_INT32(adb_data_out_index, MacVIAState),
-        VMSTATE_BUFFER(adb_data_in, MacVIAState),
-        VMSTATE_BUFFER(adb_data_out, MacVIAState),
-        VMSTATE_UINT8(adb_autopoll_cmd, MacVIAState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -1130,6 +1114,12 @@ static void mos6522_q800_via1_reset(DeviceState *dev)
 
 static void mos6522_q800_via1_init(Object *obj)
 {
+    MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(obj);
+
+    /* ADB */
+    qbus_create_inplace((BusState *)&v1s->adb_bus, sizeof(v1s->adb_bus),
+                        TYPE_ADB_BUS, DEVICE(v1s), "adb.0");
+
     qdev_init_gpio_in_named(DEVICE(obj), via1_irq_request, "via1-irq",
                             VIA1_IRQ_NB);
 }
@@ -1153,6 +1143,13 @@ static const VMStateDescription vmstate_q800_via1 = {
         VMSTATE_UINT8(cmd, MOS6522Q800VIA1State),
         VMSTATE_INT32(wprotect, MOS6522Q800VIA1State),
         VMSTATE_INT32(alt, MOS6522Q800VIA1State),
+        /* ADB */
+        VMSTATE_INT32(adb_data_in_size, MOS6522Q800VIA1State),
+        VMSTATE_INT32(adb_data_in_index, MOS6522Q800VIA1State),
+        VMSTATE_INT32(adb_data_out_index, MOS6522Q800VIA1State),
+        VMSTATE_BUFFER(adb_data_in, MOS6522Q800VIA1State),
+        VMSTATE_BUFFER(adb_data_out, MOS6522Q800VIA1State),
+        VMSTATE_UINT8(adb_autopoll_cmd, MOS6522Q800VIA1State),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.31.1


