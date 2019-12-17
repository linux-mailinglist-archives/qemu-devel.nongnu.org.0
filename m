Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346B41223D1
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 06:31:15 +0100 (CET)
Received: from localhost ([::1]:35864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih5Rx-0007kq-NO
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 00:31:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35489)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4kB-0002Nh-4r
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:46:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4k9-00084n-Pj
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:45:58 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:42157 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ih4k9-00082n-FN; Mon, 16 Dec 2019 23:45:57 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47cQWj2Z0Gz9sTb; Tue, 17 Dec 2019 15:43:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1576557825;
 bh=APu7qN38GsprHR5Z7/xsS8JIgH+fS44UWNOeJDQ/e0Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O1s4FwXLefvnUWEySZT10FYWSO2LKNQzGFSw9RFY/LHY2/C5J8XxZpRqpAbf74OsX
 23rAsRyWcgtShfDduKlNBxesWjuoNGSDksJtLO2ELwnmCPzSsJlMI51lOTypPuAnaV
 nTY003ZDvw9Vr2BkeFRR47jg82O3UVhToon3SssA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 75/88] ppc: Drop useless extern annotation for functions
Date: Tue, 17 Dec 2019 15:43:09 +1100
Message-Id: <20191217044322.351838-76-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191217044322.351838-1-david@gibson.dropbear.id.au>
References: <20191217044322.351838-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <157623837421.360005.412120366652768311.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 include/hw/ppc/pnv_xscom.h | 22 +++++++++++-----------
 include/hw/ppc/spapr_vio.h |  6 +++---
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
index 09188d74b0..2bdb7ae84f 100644
--- a/include/hw/ppc/pnv_xscom.h
+++ b/include/hw/ppc/pnv_xscom.h
@@ -113,16 +113,16 @@ typedef struct PnvXScomInterfaceClass {
 #define PNV10_XSCOM_PSIHB_BASE     0x3011D00
 #define PNV10_XSCOM_PSIHB_SIZE     0x100
=20
-extern void pnv_xscom_realize(PnvChip *chip, uint64_t size, Error **errp=
);
-extern int pnv_dt_xscom(PnvChip *chip, void *fdt, int offset);
-
-extern void pnv_xscom_add_subregion(PnvChip *chip, hwaddr offset,
-                                    MemoryRegion *mr);
-extern void pnv_xscom_region_init(MemoryRegion *mr,
-                                  struct Object *owner,
-                                  const MemoryRegionOps *ops,
-                                  void *opaque,
-                                  const char *name,
-                                  uint64_t size);
+void pnv_xscom_realize(PnvChip *chip, uint64_t size, Error **errp);
+int pnv_dt_xscom(PnvChip *chip, void *fdt, int offset);
+
+void pnv_xscom_add_subregion(PnvChip *chip, hwaddr offset,
+                             MemoryRegion *mr);
+void pnv_xscom_region_init(MemoryRegion *mr,
+                           struct Object *owner,
+                           const MemoryRegionOps *ops,
+                           void *opaque,
+                           const char *name,
+                           uint64_t size);
=20
 #endif /* PPC_PNV_XSCOM_H */
diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index 72762ed16b..ce6d9b0c66 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -80,10 +80,10 @@ struct SpaprVioBus {
     uint32_t next_reg;
 };
=20
-extern SpaprVioBus *spapr_vio_bus_init(void);
-extern SpaprVioDevice *spapr_vio_find_by_reg(SpaprVioBus *bus, uint32_t =
reg);
+SpaprVioBus *spapr_vio_bus_init(void);
+SpaprVioDevice *spapr_vio_find_by_reg(SpaprVioBus *bus, uint32_t reg);
 void spapr_dt_vdevice(SpaprVioBus *bus, void *fdt);
-extern gchar *spapr_vio_stdout_path(SpaprVioBus *bus);
+gchar *spapr_vio_stdout_path(SpaprVioBus *bus);
=20
 static inline void spapr_vio_irq_pulse(SpaprVioDevice *dev)
 {
--=20
2.23.0


