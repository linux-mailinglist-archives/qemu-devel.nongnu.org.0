Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C64E54C23A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 08:56:22 +0200 (CEST)
Received: from localhost ([::1]:58688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Mwu-0004VE-L1
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 02:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Jianxian.Wen@verisilicon.com>)
 id 1o1Mih-00071J-Sk
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 02:41:40 -0400
Received: from shasxm03.verisilicon.com ([101.89.135.44]:52545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Jianxian.Wen@verisilicon.com>)
 id 1o1Mie-00060a-RX
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 02:41:39 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1655274915; h=from:subject:to:date:message-id;
 bh=nWK/Ho59hLC7YHTm+9UHjbGc4WkoBIr0d8VLGve54dA=;
 b=TNOhGygwLJsYIlzETYxV2c+d+sFTRyY9jvYBtG85S0/qkQHoETsEr3QF3uP5KgrRUgK/zHZA7QW
 6yGkNtYqUokNdepsqvYQiR/GX0Al+cbbGIWA2Zu+Vey06LAl5BLa95lSr+gzYNp+tWtW2z3Di7gmO
 bQSuM6pF1m1JoDdqoFo=
Received: from SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda]) by
 SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa%14]) with mapi id
 14.03.0408.000; Wed, 15 Jun 2022 14:35:14 +0800
From: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>
To: Gerd Hoffmann <kraxel@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Gao, Lu"
 <Lu.Gao@verisilicon.com>
Subject: [PATCH v2] ui/console: allow display device to be labeled with
 given id
Thread-Topic: [PATCH v2] ui/console: allow display device to be labeled with
 given id
Thread-Index: AdiAghGFgCxTW3wKTRGx0p69IMpeOQ==
Date: Wed, 15 Jun 2022 06:35:14 +0000
Message-ID: <4C23C17B8E87E74E906A25A3254A03F4018FC045B0@SHASXM06.verisilicon.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [182.148.15.196]
x-tm-as-product-ver: SMEX-11.0.0.4283-8.100.1062-25628.004
x-tm-as-result: No--4.464700-0.000000-31
x-tm-as-matchedid: 700225-703140-701090-703503-704959-701343-704718-701919-7
 01342-700076-862004-704010-704706-701018-704714-703948-702914-701058-701809
 -701280-702395-188019-701011-702075-701059-701750-148004-148133-42000-42003
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Received-SPF: pass client-ip=101.89.135.44;
 envelope-from=Jianxian.Wen@verisilicon.com; helo=shasxm03.verisilicon.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The update makes it easier to find and specify devices.
They can only be found by device type name without the id field,
for example, devices of the same type have the same label.
The update also adds a head field,
which is useful for devices that support multiple heads,
such as virtio-gpu.

Signed-off-by: Jianxian Wen <jianxian.wen@verisilicon.com>
Signed-off-by: Lu Gao <lu.gao@verisilicon.com>
---
v2 (Gerd review - thanks!):
 - Make the head field conditional, so that it is only used if there are mu=
ltiple heads.

How to reproduce it:
    -display gtk \
    -device bochs-display \
    -device bochs-display,id=3Dbochs1 \
    -device virtio-gpu,max_outputs=3D2 \
    -device virtio-gpu,max_outputs=3D2,id=3Dvgpu1

 include/ui/console.h |  1 +
 ui/console.c         | 41 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index b64d824360..c0520c694c 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -463,6 +463,7 @@ bool qemu_console_is_visible(QemuConsole *con);
 bool qemu_console_is_graphic(QemuConsole *con);
 bool qemu_console_is_fixedsize(QemuConsole *con);
 bool qemu_console_is_gl_blocked(QemuConsole *con);
+bool qemu_console_is_multihead(DeviceState *dev);
 char *qemu_console_get_label(QemuConsole *con);
 int qemu_console_get_index(QemuConsole *con);
 uint32_t qemu_console_get_head(QemuConsole *con);
diff --git a/ui/console.c b/ui/console.c
index 9331b85203..e139f7115e 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2313,11 +2313,50 @@ bool qemu_console_is_gl_blocked(QemuConsole *con)
     return con->gl_block;
 }
=20
+bool qemu_console_is_multihead(DeviceState *dev)
+{
+    QemuConsole *con;
+    Object *obj;
+    uint32_t f =3D 0xffffffff;
+    uint32_t h;
+
+    QTAILQ_FOREACH(con, &consoles, next) {
+        obj =3D object_property_get_link(OBJECT(con),
+                                       "device", &error_abort);
+        if (DEVICE(obj) !=3D dev) {
+            continue;
+        }
+
+        h =3D object_property_get_uint(OBJECT(con),
+                                     "head", &error_abort);
+        if (f =3D=3D 0xffffffff) {
+            f =3D h;
+        } else if (h !=3D f) {
+            return true;
+        }
+    }
+    return false;
+}
+
 char *qemu_console_get_label(QemuConsole *con)
 {
     if (con->console_type =3D=3D GRAPHIC_CONSOLE) {
         if (con->device) {
-            return g_strdup(object_get_typename(con->device));
+            DeviceState *dev;
+            bool multihead;
+
+            dev =3D DEVICE(con->device);
+            multihead =3D qemu_console_is_multihead(dev);
+            if (multihead) {
+                return g_strdup_printf("%s.%d", dev->id ?
+                                       dev->id :
+                                       object_get_typename(con->device),
+                                       con->head);
+            } else {
+                return g_strdup_printf("%s", dev->id ?
+                                       dev->id :
+                                       object_get_typename(con->device));
+            }
         }
         return g_strdup("VGA");
     } else {
--=20
2.33.0

