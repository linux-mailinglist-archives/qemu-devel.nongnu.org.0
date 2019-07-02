Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B84C5C77F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 04:55:59 +0200 (CEST)
Received: from localhost ([::1]:47628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi8xa-00015k-Je
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 22:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53815)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hi6US-0001pY-9R
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 20:18:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hi6TW-0007gY-Md
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 20:16:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44544)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hi6Sc-0007I1-34; Mon, 01 Jul 2019 20:15:50 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F3E2C30860DE;
 Tue,  2 Jul 2019 00:15:48 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E552A1001943;
 Tue,  2 Jul 2019 00:15:28 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Jul 2019 02:12:59 +0200
Message-Id: <20190702001301.4768-8-philmd@redhat.com>
In-Reply-To: <20190702001301.4768-1-philmd@redhat.com>
References: <20190702001301.4768-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 02 Jul 2019 00:15:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 7/9] hw/block/pflash_cfi01: Improve command
 comments
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair23@gmail.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index c1b02219b2..f50d0a9d37 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -208,11 +208,11 @@ static uint32_t pflash_devid_query(PFlashCFI01 *pfl=
, hwaddr offset)
      * Offsets 2/3 are block lock status, is not emulated.
      */
     switch (boff & 0xFF) {
-    case 0:
+    case 0: /* Manufacturer ID */
         resp =3D pfl->ident0;
         trace_pflash_manufacturer_id(resp);
         break;
-    case 1:
+    case 1: /* Device ID */
         resp =3D pfl->ident1;
         trace_pflash_device_id(resp);
         break;
@@ -456,11 +456,11 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr o=
ffset,
     case 0:
         /* read mode */
         switch (cmd) {
-        case 0x10: /* Single Byte Program */
-        case 0x40: /* Single Byte Program */
+        case 0x10: /* Single Byte Program (setup) */
+        case 0x40: /* Single Byte Program (setup) [Intel] */
             DPRINTF("%s: Single Byte Program\n", __func__);
             break;
-        case 0x20: /* Block erase */
+        case 0x20: /* Block erase (setup) */
             p =3D pfl->storage;
             offset &=3D ~(pfl->sector_len - 1);
=20
@@ -516,8 +516,8 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr off=
set,
         break;
     case 1:
         switch (pfl->cmd) {
-        case 0x10: /* Single Byte Program */
-        case 0x40: /* Single Byte Program */
+        case 0x10: /* Single Byte Program (confirm) */
+        case 0x40: /* Single Byte Program (confirm) [Intel] */
             DPRINTF("%s: Single Byte Program\n", __func__);
             if (!pfl->ro) {
                 pflash_data_write(pfl, offset, value, width, be);
@@ -528,7 +528,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr off=
set,
             pfl->status |=3D 0x80; /* Ready! */
             pfl->wcycle =3D 0;
         break;
-        case 0x20: /* Block erase */
+        case 0x20: /* Block erase (confirm) */
         case 0x28:
             if (cmd =3D=3D 0xd0) { /* confirm */
                 pfl->wcycle =3D 0;
--=20
2.20.1


