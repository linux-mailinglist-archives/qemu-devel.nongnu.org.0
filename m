Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DA914E89F
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 07:11:11 +0100 (CET)
Received: from localhost ([::1]:48680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixPWI-00006E-OU
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 01:11:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59032)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ixPUo-0006ag-6n
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 01:09:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ixPUn-0000Iy-4z
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 01:09:37 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52549 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ixPUm-0008UT-6B; Fri, 31 Jan 2020 01:09:37 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4886Hr4mb5z9sNx; Fri, 31 Jan 2020 17:09:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1580450968;
 bh=Frx/1gy1/jdn+qDHBx3fnX2Xc/u691yGCivwHhSlhxU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ikYEIpBqZig/hbRNMevfhO2ISKbe387ZMiJfPLypKS2ZK+IqbFQi0u1duLM0G1ATJ
 p9eW6YjtrAEfyowwM8KhER9tGZoarOTZrChGQZJ8Mf/yLEI1gBRbMgNVRXuC719ku0
 UewX4PRhuFQe0vdy2qRIl95XdAcssmuUfF/ulfNA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 01/34] ppc/pnv: use QEMU unit definition MiB
Date: Fri, 31 Jan 2020 17:08:51 +1100
Message-Id: <20200131060924.147449-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200131060924.147449-1-david@gibson.dropbear.id.au>
References: <20200131060924.147449-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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


