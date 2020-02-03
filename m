Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD03150192
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 07:13:27 +0100 (CET)
Received: from localhost ([::1]:34746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyUz8-0004KC-Bq
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 01:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57090)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iyUxK-0002K6-J9
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 01:11:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iyUxI-0002TM-Hw
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 01:11:34 -0500
Received: from ozlabs.org ([203.11.71.1]:55889)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iyUxH-0002O6-Nj; Mon, 03 Feb 2020 01:11:32 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 489yBl6Snrz9sRs; Mon,  3 Feb 2020 17:11:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1580710287;
 bh=Frx/1gy1/jdn+qDHBx3fnX2Xc/u691yGCivwHhSlhxU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KIvpRdLX/RueaRVKu5SGpdl+ZZ7acXxQ7dyuTR/GMvUNv4ezqOqT/c2TYceDa8Szt
 6pO+TOUe+GmJBDPPpXgf1f3QgNGlIztG9Q1tKfLmsqeD0CKNohzT1KfEmGePs+Zr+d
 2urnKa+eyiVZd+oJKKB6RbLAICOsUXSVIrWL27M4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 01/35] ppc/pnv: use QEMU unit definition MiB
Date: Mon,  3 Feb 2020 17:10:49 +1100
Message-Id: <20200203061123.59150-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200203061123.59150-1-david@gibson.dropbear.id.au>
References: <20200203061123.59150-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20200108090348.21224-2-clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv_pnor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/pnv_pnor.c b/hw/ppc/pnv_pnor.c
index f761d8dc26..060c6e6a31 100644
--- a/hw/ppc/pnv_pnor.c
+++ b/hw/ppc/pnv_pnor.c
@@ -11,6 +11,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
+#include "qemu/units.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "hw/loader.h"
@@ -111,7 +112,7 @@ static void pnv_pnor_realize(DeviceState *dev, Error =
**errp)
 }
=20
 static Property pnv_pnor_properties[] =3D {
-    DEFINE_PROP_INT64("size", PnvPnor, size, 128 << 20),
+    DEFINE_PROP_INT64("size", PnvPnor, size, 128 * MiB),
     DEFINE_PROP_DRIVE("drive", PnvPnor, blk),
     DEFINE_PROP_END_OF_LIST(),
 };
--=20
2.24.1


