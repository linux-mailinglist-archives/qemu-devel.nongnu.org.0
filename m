Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF005C7D9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 05:34:56 +0200 (CEST)
Received: from localhost ([::1]:48080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi9ZH-0006KG-HS
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 23:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35448)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hi7DJ-0003bX-7y
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 21:04:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hi7DA-00044x-Rj
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 21:04:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35956)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hi7Cq-0001yP-0t; Mon, 01 Jul 2019 21:03:39 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 78E653179B4E;
 Tue,  2 Jul 2019 01:00:57 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF9981001B2D;
 Tue,  2 Jul 2019 01:00:48 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Jul 2019 21:59:02 -0300
Message-Id: <20190702005912.15905-18-philmd@redhat.com>
In-Reply-To: <20190702005912.15905-1-philmd@redhat.com>
References: <20190702005912.15905-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 02 Jul 2019 01:00:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 17/27] hw/block/pflash_cfi02: Document 'Page
 Mode' operations are not supported
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

The 'page mode' feature entry was implicitly set as zero
(not supported). Document it exists, so we won't discard
it if we squeeze the CFI table.

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Message-Id: <20190426162624.55977-6-stephen.checkoway@oberlin.edu>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
[PMD: Extracted from bigger patch]
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 23d05a6308..01d9c5d75a 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -637,7 +637,9 @@ static void pflash_cfi02_realize(DeviceState *dev, Er=
ror **errp)
     pfl->cfi_table[0x0a + pri_ofs] =3D 0x00;
     /* Burst mode not supported. */
     pfl->cfi_table[0x0b + pri_ofs] =3D 0x00;
-    assert(0x0b + pri_ofs < ARRAY_SIZE(pfl->cfi_table));
+    /* Page mode not supported. */
+    pfl->cfi_table[0x0c + pri_ofs] =3D 0x00;
+    assert(0x0c + pri_ofs < ARRAY_SIZE(pfl->cfi_table));
 }
=20
 static Property pflash_cfi02_properties[] =3D {
--=20
2.20.1


