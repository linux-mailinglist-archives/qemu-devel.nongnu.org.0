Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D383A5C7CC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 05:27:20 +0200 (CEST)
Received: from localhost ([::1]:47968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi9Rv-0007TG-VR
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 23:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34978)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hi7Bd-0003BS-Cw
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 21:02:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hi7Bb-0002K5-J6
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 21:02:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46434)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hi7BM-0001l5-Tc; Mon, 01 Jul 2019 21:02:05 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E060A30C133C;
 Tue,  2 Jul 2019 01:00:43 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 865A11001B2D;
 Tue,  2 Jul 2019 01:00:40 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Jul 2019 21:59:00 -0300
Message-Id: <20190702005912.15905-16-philmd@redhat.com>
In-Reply-To: <20190702005912.15905-1-philmd@redhat.com>
References: <20190702005912.15905-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 02 Jul 2019 01:00:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 15/27] hw/block/pflash_cfi02: Document the
 current CFI values
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

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Message-Id: <20190426162624.55977-6-stephen.checkoway@oberlin.edu>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
[PMD: Extracted from bigger patch]
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 1a794fa83c..f1bac480f5 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -550,6 +550,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Er=
ror **errp)
     pfl->wcycle =3D 0;
     pfl->cmd =3D 0;
     pfl->status =3D 0;
+
     /* Hardcoded CFI table (mostly from SG29 Spansion flash) */
     /* Standard "QRY" string */
     pfl->cfi_table[0x10] =3D 'Q';
@@ -575,7 +576,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Er=
ror **errp)
     pfl->cfi_table[0x1D] =3D 0x00;
     /* Vpp max (no Vpp pin) */
     pfl->cfi_table[0x1E] =3D 0x00;
-    /* Reserved */
+    /* Timeout per single byte/word write (128 ms) */
     pfl->cfi_table[0x1F] =3D 0x07;
     /* Timeout for min size buffer write (NA) */
     pfl->cfi_table[0x20] =3D 0x00;
@@ -614,17 +615,25 @@ static void pflash_cfi02_realize(DeviceState *dev, =
Error **errp)
     pfl->cfi_table[0x32] =3D 'R';
     pfl->cfi_table[0x33] =3D 'I';
=20
+    /* Extended version 1.0 */
     pfl->cfi_table[0x34] =3D '1';
     pfl->cfi_table[0x35] =3D '0';
=20
+    /* Address sensitive unlock required. */
     pfl->cfi_table[0x36] =3D 0x00;
+    /* Erase suspend not supported. */
     pfl->cfi_table[0x37] =3D 0x00;
+    /* Sector protect not supported. */
     pfl->cfi_table[0x38] =3D 0x00;
+    /* Temporary sector unprotect not supported. */
     pfl->cfi_table[0x39] =3D 0x00;
=20
+    /* Sector protect/unprotect scheme. */
     pfl->cfi_table[0x3a] =3D 0x00;
=20
+    /* Simultaneous operation not supported. */
     pfl->cfi_table[0x3b] =3D 0x00;
+    /* Burst mode not supported. */
     pfl->cfi_table[0x3c] =3D 0x00;
 }
=20
--=20
2.20.1


