Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B0BE2C26
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 10:27:57 +0200 (CEST)
Received: from localhost ([::1]:34918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNYTL-0004d9-Ib
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 04:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36876)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iNYKb-00050m-G6
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 04:18:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iNYKZ-0005S3-QG
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 04:18:53 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41411 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iNYKZ-0005Mw-Dh; Thu, 24 Oct 2019 04:18:51 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46zKrc3xhsz9sSG; Thu, 24 Oct 2019 19:18:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1571905120;
 bh=Xs8W+ykQ9G+OhrnzjhaEi48Z3MoKVYbgdQ4As7qwqyY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZdaYAK8oYIcLEuSh3jRxfGvwNzGBup5FKcMbTNwpTVadOJHcyMHzQpVqbUQ7Sp45U
 rPBs90s05XH51Cec0oC6zFSW/8kTxba7vw/WdMB+hBbULNZc1FWufn13xAyAo70tf2
 h8MuUcaEThjsGscl2NFnqfSeDxr0L6qJy7IF5avE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 27/28] ppc/pnv: Fix naming of routines realizing the CPUs
Date: Thu, 24 Oct 2019 19:18:12 +1100
Message-Id: <20191024081813.2115-28-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191024081813.2115-1-david@gibson.dropbear.id.au>
References: <20191024081813.2115-1-david@gibson.dropbear.id.au>
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
 qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

The 'vcpu' suffix is inherited from the sPAPR machine. Use better
names for PowerNV.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <20191022163812.330-7-clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
index be0310ac03..e81cd3a3e0 100644
--- a/hw/ppc/pnv_core.c
+++ b/hw/ppc/pnv_core.c
@@ -162,7 +162,7 @@ static const MemoryRegionOps pnv_core_power9_xscom_op=
s =3D {
     .endianness =3D DEVICE_BIG_ENDIAN,
 };
=20
-static void pnv_realize_vcpu(PowerPCCPU *cpu, PnvChip *chip, Error **err=
p)
+static void pnv_core_cpu_realize(PowerPCCPU *cpu, PnvChip *chip, Error *=
*errp)
 {
     CPUPPCState *env =3D &cpu->env;
     int core_pir;
@@ -247,7 +247,7 @@ static void pnv_core_realize(DeviceState *dev, Error =
**errp)
     }
=20
     for (j =3D 0; j < cc->nr_threads; j++) {
-        pnv_realize_vcpu(pc->threads[j], pc->chip, &local_err);
+        pnv_core_cpu_realize(pc->threads[j], pc->chip, &local_err);
         if (local_err) {
             goto err;
         }
@@ -269,7 +269,7 @@ err:
     error_propagate(errp, local_err);
 }
=20
-static void pnv_unrealize_vcpu(PowerPCCPU *cpu)
+static void pnv_core_cpu_unrealize(PowerPCCPU *cpu)
 {
     PnvCPUState *pnv_cpu =3D pnv_cpu_state(cpu);
=20
@@ -289,7 +289,7 @@ static void pnv_core_unrealize(DeviceState *dev, Erro=
r **errp)
     qemu_unregister_reset(pnv_core_reset, pc);
=20
     for (i =3D 0; i < cc->nr_threads; i++) {
-        pnv_unrealize_vcpu(pc->threads[i]);
+        pnv_core_cpu_unrealize(pc->threads[i]);
     }
     g_free(pc->threads);
 }
--=20
2.21.0


