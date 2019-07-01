Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6D52432C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 23:51:14 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42430 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSqBd-0003S1-GC
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 17:51:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hSq4g-0007Sd-Eb
	for qemu-devel@nongnu.org; Mon, 20 May 2019 17:44:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hSq4f-0000BM-Ix
	for qemu-devel@nongnu.org; Mon, 20 May 2019 17:44:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55574)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hSq4d-00009M-JL; Mon, 20 May 2019 17:43:59 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D7029308220B;
	Mon, 20 May 2019 21:43:58 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-28.brq.redhat.com [10.40.204.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8819D1001E6C;
	Mon, 20 May 2019 21:43:55 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 20 May 2019 23:43:40 +0200
Message-Id: <20190520214342.13709-3-philmd@redhat.com>
In-Reply-To: <20190520214342.13709-1-philmd@redhat.com>
References: <20190520214342.13709-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 20 May 2019 21:43:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/4] hw/arm/exynos4: Use the IEC binary prefix
 definitions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It eases code review, unit is explicit.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/exynos4_boards.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index f0c24b7992e..f824eef0d36 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -22,6 +22,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu-common.h"
@@ -60,8 +61,8 @@ static int exynos4_board_smp_bootreg_addr[EXYNOS4_NUM_O=
F_BOARDS] =3D {
 };
=20
 static unsigned long exynos4_board_ram_size[EXYNOS4_NUM_OF_BOARDS] =3D {
-    [EXYNOS4_BOARD_NURI]     =3D 0x40000000,
-    [EXYNOS4_BOARD_SMDKC210] =3D 0x40000000,
+    [EXYNOS4_BOARD_NURI]     =3D 1 * GiB,
+    [EXYNOS4_BOARD_SMDKC210] =3D 1 * GiB,
 };
=20
 static struct arm_boot_info exynos4_board_binfo =3D {
--=20
2.20.1


