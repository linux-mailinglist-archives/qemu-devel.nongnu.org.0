Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A624B5AF7A3
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 00:07:40 +0200 (CEST)
Received: from localhost ([::1]:36088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVgjL-0007B9-QJ
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 18:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oVeYb-0004Z3-B6; Tue, 06 Sep 2022 15:48:25 -0400
Received: from mout.gmx.net ([212.227.17.20]:49283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oVeYZ-000856-CI; Tue, 06 Sep 2022 15:48:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662493699;
 bh=+YoYIKdyFLKunPxdaBIY/1hDHzwPMqOoiBiMjWntGtM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=fhaGYTqlgaXe5FJMNjuVK4+tcOmxOo4vDlpqYLXMnYGddXm0iNp7LnB8U8znOF3Eq
 2DhcqkO3TOfx0zIV0/nDacSKdsKIcsCV+K3RbgvEBcqrVosGcyBTNv3mi/pKoom79W
 C9jVMankfg3QiV8x5UqBQMbOxv/kFs4fwop8C3nk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from btm-mobil4.fritz.box ([88.72.97.126]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N79yG-1pRrva3BzY-017XNF; Tue, 06
 Sep 2022 21:48:19 +0200
From: Arwed Meyer <arwed.meyer@gmx.de>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Arwed Meyer <arwed.meyer@gmx.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 3/4] msmouse: Add pnp data
Date: Tue,  6 Sep 2022 21:47:54 +0200
Message-Id: <20220906194755.98090-4-arwed.meyer@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906194755.98090-1-arwed.meyer@gmx.de>
References: <20220906194755.98090-1-arwed.meyer@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5EJlky3Cq8Ied6qsW9+DPF9tHLy7z+axD3/FRDlpnea9F3Muujy
 Qqop2c2IUX+KYuywit75Bqf1aJ4s70SW+cn4Ol4tSFcHJx3XKN3xkAoKnuKHhsaWTgZNvlG
 +pOmeUmyECvnWV26zFMg3Bo9i6jZG13+5XUwRyCxpf4X4bRmo4ucLgabB3XCOocC7uv+q7/
 hFDUx+fD/P6jFKnZSBmEQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1pR2JFxSwLE=:0XNCTL/2wajoVmv8KY/Yh1
 WjNyvCd2WEGOPX2dz40gcC7nfS2WF3GThQGPdIJy+Wij1AuK5rXIv58MluA1f4CALiGw0LN4O
 Wc6ynP8a96xcIHYCSXJ8xr931TGhzR9eR27B47Mq5Eq6UdNn4VzI4asT/O9R/0Ap1sWUXvVV2
 tEyKP0JCE/oMmdAtFDcgQcGxxTWrEg1nBZYfrDFRgAd1KGi+bJzE0KcdK3RIVK8V3UqmRnMzK
 8hR3WHpGHAQ/vxFM4fae+sKrAikpnAUguKyHosjW/gYbkRsmyuui/b1SrWAhnW1jS26b2t7l3
 v7E9osTiOvvUtS6nEDc98Byo3lqvFJ+AlPLMyspNZmiany196FNLHQfFKesFoopYBriwy7pFp
 PfJomrdBvBockT/BHi1LEli0KNnSnT8hBvXUgkJ35dmeZVCoExeIVTC/Vsa6q8WthFFuB2zOs
 dspJfJRF4OAHIrLHMYl795bVdDBEv3BhocaLWGgvfCTvDs8dogw7Z2yCXdtbtMAThW2/HepSm
 aDXN+UyxGoMveZJcoBkiHn/Qb+KqxWz6WEu6iRL86QVHv/mX/adAZUny8IZ8Q/ZdYLrD5Y3ZX
 Di1HSbxZZsY9qQdoOLU0NbWJ9dRrE9ql1Ad/n4h6usXnJGEYzN20t5ziOpwpDViYY798VtFVl
 fYWtU2HljHl2tAM47VliBrlBVM4/0F7OnaaZ4dVTMNGHWHGrPBpcTbw8mp6nj/0rP2vNrsLbx
 9vSmTcLaolN7apWP4SDIuDBktHTP2K8T8FCNcaW1p+UOKBMlvVvrnyeCxqOlHrCAN1ESCQQQe
 5vhdnL35z6HqMCJ69ukMlD1NAx+sdFpi2xjGqNc8dpa/gKmYunTuvDUYQ0W18cZBbRi5bpc/1
 mL2X6FxT2QAxJsP2QmR8zqoLMO3m/DE/QvNG31gs8dnijcq8aOgpyGWdsscILhSzpyc8I/L5+
 kKXhtlsXW66HPJsR7Dxshhsw0iFG6yaMSc6o1EOWI0mn/uLK/Rhh2zT+9OzeiAsaFJXjvkjLC
 aXwEa1i2NEJWOEI4JvUnQwlPBdd13BvbQhcEsBUERiHcv0hAMVBn7T4+dDp8kxXg4a42b5oUZ
 e6Ht0shhh9AmDo7yXzMpO25yTOJRgqZwz3AmoaKysoD3d9pFX2Tdtacq01BGGpZCWAluD11J0
 IZH8lAygclPkbxQ9yAbTdfb4oA
Received-SPF: pass client-ip=212.227.17.20; envelope-from=arwed.meyer@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 06 Sep 2022 18:00:42 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make msmouse send serial pnp data.
Enables you to see nice qemu device name in Win9x.

Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
=2D--
 chardev/msmouse.c | 101 +++++++++++++++++++++++++++++++---------------
 1 file changed, 68 insertions(+), 33 deletions(-)

diff --git a/chardev/msmouse.c b/chardev/msmouse.c
index 0ecf26a436..b4ddaee778 100644
=2D-- a/chardev/msmouse.c
+++ b/chardev/msmouse.c
@@ -24,6 +24,7 @@

 #include "qemu/osdep.h"
 #include "qemu/module.h"
+#include "qemu/fifo8.h"
 #include "chardev/char.h"
 #include "chardev/char-serial.h"
 #include "ui/console.h"
@@ -34,6 +35,25 @@
 #define MSMOUSE_HI2(n)  (((n) & 0xc0) >> 6)
 #define MSMOUSE_PWR(cm) (cm & (CHR_TIOCM_RTS | CHR_TIOCM_DTR))

+/* Serial PnP for 6 bit devices/mice sends all ASCII chars - 0x20 */
+#define M(c) (c - 0x20)
+/* Serial fifo size. */
+#define MSMOUSE_BUF_SZ 64
+
+/* Mouse ID: Send "M3" cause we behave like a 3 button logitech mouse. */
+const uint8_t mouse_id[] =3D {'M', '3'};
+/*
+ * PnP start "(", PnP version (1.0), vendor ID, product ID, '\\',
+ * serial ID (omitted), '\\', MS class name, '\\', driver ID (omitted), '=
\\',
+ * product description, checksum, ")"
+ * Missing parts are inserted later.
+ */
+const uint8_t pnp_data[] =3D {M('('), 1, '$', M('Q'), M('M'), M('U'),
+                         M('0'), M('0'), M('0'), M('1'),
+                         M('\\'), M('\\'),
+                         M('M'), M('O'), M('U'), M('S'), M('E'),
+                         M('\\'), M('\\')};
+
 struct MouseChardev {
     Chardev parent;

@@ -42,8 +62,7 @@ struct MouseChardev {
     int axis[INPUT_AXIS__MAX];
     bool btns[INPUT_BUTTON__MAX];
     bool btnc[INPUT_BUTTON__MAX];
-    uint8_t outbuf[32];
-    int outlen;
+    Fifo8 outbuf;
 };
 typedef struct MouseChardev MouseChardev;

@@ -54,21 +73,15 @@ DECLARE_INSTANCE_CHECKER(MouseChardev, MOUSE_CHARDEV,
 static void msmouse_chr_accept_input(Chardev *chr)
 {
     MouseChardev *mouse =3D MOUSE_CHARDEV(chr);
-    int len;
+    uint32_t len_out, len;

-    len =3D qemu_chr_be_can_write(chr);
-    if (len > mouse->outlen) {
-        len =3D mouse->outlen;
-    }
-    if (!len) {
+    len_out =3D qemu_chr_be_can_write(chr);
+    if (!len_out || fifo8_is_empty(&mouse->outbuf)) {
         return;
     }
-
-    qemu_chr_be_write(chr, mouse->outbuf, len);
-    mouse->outlen -=3D len;
-    if (mouse->outlen) {
-        memmove(mouse->outbuf, mouse->outbuf + len, mouse->outlen);
-    }
+    len =3D MIN(fifo8_num_used(&mouse->outbuf), len_out);
+    qemu_chr_be_write(chr, fifo8_pop_buf(&mouse->outbuf, len, &len_out),
+            len_out);
 }

 static void msmouse_queue_event(MouseChardev *mouse)
@@ -94,12 +107,11 @@ static void msmouse_queue_event(MouseChardev *mouse)
         mouse->btnc[INPUT_BUTTON_MIDDLE]) {
         bytes[3] |=3D (mouse->btns[INPUT_BUTTON_MIDDLE] ? 0x20 : 0x00);
         mouse->btnc[INPUT_BUTTON_MIDDLE] =3D false;
-        count =3D 4;
+        count++;
     }

-    if (mouse->outlen <=3D sizeof(mouse->outbuf) - count) {
-        memcpy(mouse->outbuf + mouse->outlen, bytes, count);
-        mouse->outlen +=3D count;
+    if (fifo8_num_free(&mouse->outbuf) >=3D count) {
+        fifo8_push_all(&mouse->outbuf, bytes, count);
     } else {
         /* queue full -> drop event */
     }
@@ -155,11 +167,22 @@ static int msmouse_chr_write(struct Chardev *s, cons=
t uint8_t *buf, int len)
     return len;
 }

+static QemuInputHandler msmouse_handler =3D {
+    .name  =3D "QEMU Microsoft Mouse",
+    .mask  =3D INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,
+    .event =3D msmouse_input_event,
+    .sync  =3D msmouse_input_sync,
+};
+
 static int msmouse_ioctl(Chardev *chr, int cmd, void *arg)
 {
     MouseChardev *mouse =3D MOUSE_CHARDEV(chr);
-    int c;
+    int c, i, j;
+    uint8_t bytes[MSMOUSE_BUF_SZ / 2];
     int *targ =3D (int *)arg;
+    const uint8_t hexchr[16] =3D {M('0'), M('1'), M('2'), M('3'), M('4'),=
 M('5'),
+                             M('6'), M('7'), M('8'), M('9'), M('A'), M('B=
'),
+                             M('C'), M('D'), M('E'), M('F')};

     switch (cmd) {
     case CHR_IOCTL_SERIAL_SET_TIOCM:
@@ -168,13 +191,30 @@ static int msmouse_ioctl(Chardev *chr, int cmd, void=
 *arg)
         if (MSMOUSE_PWR(mouse->tiocm)) {
             if (!MSMOUSE_PWR(c)) {
                 /*
-                 * Power on after reset: send "M3"
-                 * cause we behave like a 3 button logitech
-                 * mouse.
+                 * Power on after reset: Send ID and PnP data
+                 * No need to check fifo space as it is empty at this poi=
nt.
+                 */
+                fifo8_push_all(&mouse->outbuf, mouse_id, sizeof(mouse_id)=
);
+                /* Add PnP data: */
+                fifo8_push_all(&mouse->outbuf, pnp_data, sizeof(pnp_data)=
);
+                /*
+                 * Add device description from qemu handler name.
+                 * Make sure this all fits into the queue beforehand!
                  */
-                mouse->outbuf[0] =3D 'M';
-                mouse->outbuf[1] =3D '3';
-                mouse->outlen =3D 2;
+                c =3D M(')');
+                for (i =3D 0; msmouse_handler.name[i]; i++) {
+                    bytes[i] =3D M(msmouse_handler.name[i]);
+                    c +=3D bytes[i];
+                }
+                /* Calc more of checksum */
+                for (j =3D 0; j < sizeof(pnp_data); j++) {
+                    c +=3D pnp_data[j];
+                }
+                c &=3D 0xff;
+                bytes[i++] =3D hexchr[c >> 4];
+                bytes[i++] =3D hexchr[c & 0x0f];
+                bytes[i++] =3D M(')');
+                fifo8_push_all(&mouse->outbuf, bytes, i);
                 /* Start sending data to serial. */
                 msmouse_chr_accept_input(chr);
             }
@@ -184,7 +224,7 @@ static int msmouse_ioctl(Chardev *chr, int cmd, void *=
arg)
          * Reset mouse buffers on power down.
          * Mouse won't send anything without power.
          */
-        mouse->outlen =3D 0;
+        fifo8_reset(&mouse->outbuf);
         memset(mouse->axis, 0, sizeof(mouse->axis));
         for (c =3D INPUT_BUTTON__MAX - 1; c >=3D 0; c--) {
             mouse->btns[c] =3D false;
@@ -206,15 +246,9 @@ static void char_msmouse_finalize(Object *obj)
     MouseChardev *mouse =3D MOUSE_CHARDEV(obj);

     qemu_input_handler_unregister(mouse->hs);
+    fifo8_destroy(&mouse->outbuf);
 }

-static QemuInputHandler msmouse_handler =3D {
-    .name  =3D "QEMU Microsoft Mouse",
-    .mask  =3D INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,
-    .event =3D msmouse_input_event,
-    .sync  =3D msmouse_input_sync,
-};
-
 static void msmouse_chr_open(Chardev *chr,
                              ChardevBackend *backend,
                              bool *be_opened,
@@ -226,6 +260,7 @@ static void msmouse_chr_open(Chardev *chr,
     mouse->hs =3D qemu_input_handler_register((DeviceState *)mouse,
                                             &msmouse_handler);
     mouse->tiocm =3D 0;
+    fifo8_create(&mouse->outbuf, MSMOUSE_BUF_SZ);
 }

 static void char_msmouse_class_init(ObjectClass *oc, void *data)
=2D-
2.34.1


