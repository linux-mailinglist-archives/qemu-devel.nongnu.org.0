Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7131B166DFF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 04:45:38 +0100 (CET)
Received: from localhost ([::1]:51804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4zFx-00073f-Fy
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 22:45:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49204)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j4z81-0002HH-Nk
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 22:37:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j4z7z-0008OP-Ds
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 22:37:24 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:56407 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j4z7x-00080a-I7; Thu, 20 Feb 2020 22:37:22 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48NxwG6fL9z9sSP; Fri, 21 Feb 2020 14:37:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582256222;
 bh=TeAl7RPari2Wyd6Fu8pbj0ZeuEIiTt+t9nbQXZXMWGk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HkMxDlt1D03EsxOEtfnzd4H4bxw6qOchodNdGoQjUTDcnQTDB6r9Th49HKoAcn0Md
 VrWgJVrV+E6xHOgf4De7MV1eimPVksZLwQqr985TH7mLo2hh4R261XTThZLVDE1TT0
 2y69IvWcXhjt/HJEuIoT31vV39yJtSy2y17POvJQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 12/20] pnv/phb3: Add missing break statement
Date: Fri, 21 Feb 2020 14:36:42 +1100
Message-Id: <20200221033650.444386-13-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221033650.444386-1-david@gibson.dropbear.id.au>
References: <20200221033650.444386-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
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
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

We obviously don't want to print out an error message if addr points to
a valid register.

Reported-by: Coverity CID 1419391 Missing break in switch
Fixes: 9ae1329ee2fe "ppc/pnv: Add models for POWER8 PHB3 PCIe Host bridge=
"
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <158153365202.3229002.11521084761048102466.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/pci-host/pnv_phb3_pbcq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci-host/pnv_phb3_pbcq.c b/hw/pci-host/pnv_phb3_pbcq.c
index f232228b0e..7b9a121246 100644
--- a/hw/pci-host/pnv_phb3_pbcq.c
+++ b/hw/pci-host/pnv_phb3_pbcq.c
@@ -173,6 +173,7 @@ static void pnv_pbcq_pci_xscom_write(void *opaque, hw=
addr addr,
     case PBCQ_PCI_BAR2:
         pbcq->pci_regs[reg] =3D val & 0xfffffffffc000000ull;
         pnv_pbcq_update_map(pbcq);
+        break;
     default:
         phb3_pbcq_error(pbcq, "%s @0x%"HWADDR_PRIx"=3D%"PRIx64, __func__=
,
                         addr, val);
--=20
2.24.1


