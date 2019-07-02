Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658DD5C7C8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 05:25:15 +0200 (CEST)
Received: from localhost ([::1]:47956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi9Pu-0005Yv-Gc
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 23:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35239)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hi7CM-0003Qo-92
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 21:03:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hi7CE-0003Bh-Ja
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 21:03:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42604)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hi7Bo-0001l0-1P; Mon, 01 Jul 2019 21:02:32 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F2E4230C4069;
 Tue,  2 Jul 2019 01:00:39 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E4E8D1001B36;
 Tue,  2 Jul 2019 01:00:35 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Jul 2019 21:58:59 -0300
Message-Id: <20190702005912.15905-15-philmd@redhat.com>
In-Reply-To: <20190702005912.15905-1-philmd@redhat.com>
References: <20190702005912.15905-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 02 Jul 2019 01:00:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 14/27] hw/block/pflash_cfi02: Remove pointless
 local variable
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can directly use pfl->total_len, remove the local 'chip_len'
variable.

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Message-Id: <20190426162624.55977-6-stephen.checkoway@oberlin.edu>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
[PMD: Extracted from bigger patch]
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 4be3837be5..1a794fa83c 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -409,7 +409,7 @@ static void pflash_write(void *opaque, hwaddr offset,=
 uint64_t value,
             /* Chip erase */
             DPRINTF("%s: start chip erase\n", __func__);
             if (!pfl->ro) {
-                memset(pfl->storage, 0xFF, pfl->chip_len);
+                memset(pfl->storage, 0xff, pfl->chip_len);
                 pflash_update(pfl, 0, pfl->chip_len);
             }
             set_dq7(pfl, 0x00);
@@ -490,7 +490,6 @@ static const MemoryRegionOps pflash_cfi02_ops =3D {
 static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
 {
     PFlashCFI02 *pfl =3D PFLASH_CFI02(dev);
-    uint32_t chip_len;
     int ret;
     Error *local_err =3D NULL;
=20
@@ -507,18 +506,17 @@ static void pflash_cfi02_realize(DeviceState *dev, =
Error **errp)
         return;
     }
=20
-    chip_len =3D pfl->sector_len * pfl->nb_blocs;
+    pfl->chip_len =3D pfl->sector_len * pfl->nb_blocs;
=20
     memory_region_init_rom_device(&pfl->orig_mem, OBJECT(pfl),
                                   &pflash_cfi02_ops, pfl, pfl->name,
-                                  chip_len, &local_err);
+                                  pfl->chip_len, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
     }
=20
     pfl->storage =3D memory_region_get_ram_ptr(&pfl->orig_mem);
-    pfl->chip_len =3D chip_len;
=20
     if (pfl->blk) {
         uint64_t perm;
@@ -533,8 +531,8 @@ static void pflash_cfi02_realize(DeviceState *dev, Er=
ror **errp)
     }
=20
     if (pfl->blk) {
-        if (!blk_check_size_and_read_all(pfl->blk, pfl->storage, chip_le=
n,
-                                         errp)) {
+        if (!blk_check_size_and_read_all(pfl->blk, pfl->storage,
+                                         pfl->chip_len, errp)) {
             vmstate_unregister_ram(&pfl->orig_mem, DEVICE(pfl));
             return;
         }
@@ -594,7 +592,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Er=
ror **errp)
     /* Max timeout for chip erase */
     pfl->cfi_table[0x26] =3D 0x0D;
     /* Device size */
-    pfl->cfi_table[0x27] =3D ctz32(chip_len);
+    pfl->cfi_table[0x27] =3D ctz32(pfl->chip_len);
     /* Flash device interface (8 & 16 bits) */
     pfl->cfi_table[0x28] =3D 0x02;
     pfl->cfi_table[0x29] =3D 0x00;
--=20
2.20.1


