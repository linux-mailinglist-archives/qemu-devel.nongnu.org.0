Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E7C5C7A6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 05:17:07 +0200 (CEST)
Received: from localhost ([::1]:47876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi9Hq-0006dd-Th
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 23:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34762)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hi7Aq-00034G-7G
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 21:01:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hi7A8-0001lK-Br
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 21:01:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58026)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hi79L-0001H9-GI; Mon, 01 Jul 2019 21:00:00 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 35D17B5C13;
 Tue,  2 Jul 2019 00:59:55 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DDA261001B2D;
 Tue,  2 Jul 2019 00:59:51 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Jul 2019 21:58:52 -0300
Message-Id: <20190702005912.15905-8-philmd@redhat.com>
In-Reply-To: <20190702005912.15905-1-philmd@redhat.com>
References: <20190702005912.15905-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 02 Jul 2019 00:59:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 07/27] hw/block/pflash_cfi02: Simplify a
 statement using fall through
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
Message-Id: <20190426162624.55977-3-stephen.checkoway@oberlin.edu>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
[PMD: Extracted from bigger patch]
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index e9eea0ec08..9e8c28af8f 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -239,10 +239,10 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwadd=
r offset,
         case 0x0E:
         case 0x0F:
             ret =3D boff & 0x01 ? pfl->ident3 : pfl->ident2;
-            if (ret =3D=3D (uint8_t)-1) {
-                goto flash_read;
+            if (ret !=3D (uint8_t)-1) {
+                break;
             }
-            break;
+            /* Fall through to data read. */
         default:
             goto flash_read;
         }
--=20
2.20.1


