Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B736E534ABE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 09:23:03 +0200 (CEST)
Received: from localhost ([::1]:59386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu7pm-0003EA-No
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 03:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Jianxian.Wen@verisilicon.com>)
 id 1nu7mq-0001xF-Nr
 for qemu-devel@nongnu.org; Thu, 26 May 2022 03:20:02 -0400
Received: from shasxm03.verisilicon.com ([101.89.135.44]:27556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Jianxian.Wen@verisilicon.com>)
 id 1nu7mo-0006Br-AL
 for qemu-devel@nongnu.org; Thu, 26 May 2022 03:20:00 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1653548894; h=from:subject:to:date:message-id;
 bh=tN4Gyap79ebadlVSxmTufxmqonQjP7Za8APA0CHYcYw=;
 b=KA27GZ0KF9XxYdSnlAu2+CxfsyqMRWs2vQisdkk1f3LdFTSjXK9xXRPv39M+QmjDb2Zpj63o+xS
 KSZD7+3dCMsJXE3w/d4OPzEvnwKUTj4z4iTi/ZSJ/qPRvPJhC5ZbP4augAzmNOjE2O+Ie0IT+m58w
 4McP8YVHN1POwjqBKwU=
Received: from SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda]) by
 SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa%14]) with mapi id
 14.03.0408.000; Thu, 26 May 2022 15:08:13 +0800
From: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>
To: Gerd Hoffmann <kraxel@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Gao, Lu"
 <Lu.Gao@verisilicon.com>
Subject: [PATCH] ui/console: allow display device to be labeled with given id
Thread-Topic: [PATCH] ui/console: allow display device to be labeled with
 given id
Thread-Index: Adhwz10WhgIRStTES16qcCUu3E8S0w==
Date: Thu, 26 May 2022 07:08:14 +0000
Message-ID: <4C23C17B8E87E74E906A25A3254A03F4018FC0021E@SHASXM06.verisilicon.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.166.68]
x-tm-as-product-ver: SMEX-11.0.0.4283-8.100.1062-25628.004
x-tm-as-result: No--1.011100-0.000000-31
x-tm-as-matchedid: 700225-703140-701090-703503-704959-701343-704718-701919-7
 01342-700076-862004-703948-702914-701058-701280-702395-188019-701011-702075
 -63-148004-148133-42000-42003-63
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
How to reproduce it:
    -display gtk \
    -device bochs-display,id=3Dbochs0 \
    -device bochs-display,id=3Dbochs1 \
    -device virtio-gpu,max_outputs=3D2 \
    -device virtio-gpu,max_outputs=3D2,id=3Dvgpu1

 ui/console.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/ui/console.c b/ui/console.c
index 36c80cd1de..d0226c765e 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2323,7 +2323,16 @@ char *qemu_console_get_label(QemuConsole *con)
 {
     if (con->console_type =3D=3D GRAPHIC_CONSOLE) {
         if (con->device) {
-            return g_strdup(object_get_typename(con->device));
+            DeviceState *dev;
+
+            dev =3D DEVICE(con->device);
+            if (dev->id) {
+                return g_strdup_printf("%s.%d", dev->id, con->head);
+            } else {
+                return g_strdup_printf("%s.%d",
+                                       object_get_typename(con->device),
+                                       con->head);
+            }
         }
         return g_strdup("VGA");
     } else {
--=20
2.33.0

