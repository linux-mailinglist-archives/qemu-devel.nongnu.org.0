Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8D96BB5FA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 15:28:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcS5X-0007UN-47; Wed, 15 Mar 2023 10:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pcS5V-0007Tj-Du
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 10:26:45 -0400
Received: from sonic304-24.consmr.mail.gq1.yahoo.com ([98.137.68.205])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pcS5R-0005jV-T6
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 10:26:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1678890399; bh=fIhIn9uQIrD1yl4JUmBOZpSdzRAzN+PjSPUPPg3S4P4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=IFaS+TUJBO4a9swCw7t296GVQal0IRousVosgyYjyEnYvYC9n6E8Vx9doqQfty+mZgsapuQKf1ejCVeQYfBmlzstrO0iznJynX7HhNwItEJwLBGcrQ5ac4hpl53dv6YCewhrGegclWkccZmsIPSfa7hSP+FM7kbNejpmrzxBKUYNL6aGUoT/hmDVMR4i+rte+BswHWs+Uy5GpTKn77AUkuqZzehAhoHLy6RH3bIMZ/Z+Zqxgzjunz9uAtEfpVopttdm8ki4VoD8Js8S2PX2L9UsYRHlM9qsCgnh9/gL4x9RMLX6FvBYwTOJsEZdsEQ1w7XX6shF2Emx+dMGScQUjpg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1678890399; bh=n6stniTtUYkGL8VGERtQx6sX0mKs1g7kvoBUxxiIKGc=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=hnoQ+7baGI24XWnf1FHrnxYeRspBa9Z40+BVa95q3Fum7PowAAFfScrY1EKGoaC0euh7IqqwkaO/E91V5+33VHWHK/kVNCWP9nWwooK4j7eZ8qBZ/d0T3C6ieqLmNnfFwlYG3CVLN8Sbq5oSXzv1X6yxb7w/chPL3WSQDoBHlY8A5PJzrixKDYvZe9JxGoarWVx8Mhr/e0i4Uql/Vm8RkY6snS9kLH749aF1Yq3HPnrM1IkZ+nxEA4xhgADAyBSW4HjNmAbIL55lKzJBwoSNCKaLMrp+xcqizB62Eg64SzV+0fyNwuNYs9bc6RnaECd8PYIF0V7nxEDzwmAULKol/g==
X-YMail-OSG: VFrfZgsVM1mlYTeVv2MNOgIQsJ5hQ2HZyDFFVL6rZfqaObiEszmiCdaaP.5b9Y3
 0eEg1ve.CH4YUS3BSFc_JoTXGZfkTogL.0h.OE_cydmeXY9PXyBKUxuW4AwDbk5HxZwrPpMjazIb
 m5cB_NSfKdrOXpEt_kppD3ErndiSlTjXpwNSrw_TIyI0Nc9FXneaQk8nBNEpZClbtl3IrGGbZE0Y
 __6xEO7Os5CR6wdZjB.HuUuVmhUKkM02GSqb6PGMLZU3twysiORiNQdet4n_Fizh0Ef229sG6fIT
 _MpDX1d5jhQ3B2dNFL4KnPWtRklbQlcgdSMQiVU5BCRo6yGlfbwsVHyf8YtVWmMmozy1NzDf3nuS
 4eExA9NZNDFNk3sZdRxscTR0fLpWdP80F2wkcUWePsGWWZL2r_tO34ZAYTq.gI14DX8UHmsqbL01
 tTQK54M4sjRU4oWNI1SzCUcr2KHcLdE4JWRLA.1eQrVBFRINopaZp4zO37XNdksWV3TdRS1sX6GI
 jKoRrFp5Z9LvP84yxiN2cU0Zk.3D8Vc3.SnRDfCeS9IaoVznuqQALQTkuU1CWwH78WGNAFMDXzuT
 3RMUGLMC96y3epjwTP2Bi.ZPGIsRyS8GU9Ny67Z5Gm.fAr5a5m8gPNhdPEcC0x_IjlKat1l3hPey
 JInLGsyo0NPG_uSDJm0WP3itaBTEf1HeDE5VDptm8r9NJZKimr0g3vikp3E7o2O8gwh7bFEApHxE
 D48nZz_AKkprp7siaRSTCkdO_ApsRzdSEPR9ARNEQ_OZIQU8Bo90fTPhHirEHS8QWjSoYDsMad9Z
 7mU9GX1HriV2AmURGXcKTYtWQ6a_y2ol2lYOwCMM4WIRA6D1M.kzEAg.vKbMKG387SuBpdbSlGlU
 RXFwAslJlV0ZrSo8WFRnQeX8wsTW5owEtkwYi22tj_FS75ssmFiGDeksOwPUkNqi4_hdOyuhXVbh
 K0dqIHH6Gal2q8NhVj.PaXGhKqtjnnJjwNINVwoeq7AfRzYdMLvOxGCISzhCgp2x5dUPN18sqmkY
 b4sI2TJjGxbmUZ9pI_rbPEe_JAeb8x9ScPxpVcmykXehiiqX.FU92aQrL7oXHqiCjLr4Er26sruU
 5mIpueeSUqQk7ePnSpJj.qUpsQVH2s0VTs2uWDRk6JyYSCnvOcRB2EXnxnfifca0pL6o0EY9slBW
 AmQgK9zvThReEPgFzgLPtvvweIg5Hw_RRm4C_pyqEc_vf64o2WqPCgpjczQY_MgUhy5USzoggREX
 OPdwbxKP1q5IbVDPtEMBghk8Os9FjY_DmK2FSKVRQExfTTfqE_1mZrSSC_cMfWHDtxbRgWnkmSNc
 oW6x5hZeLd7lehMqqht8XHDqAy269QpD_SH1wg_yiRTr2THmHmvTOrRsX9W1WQ_xTyjdtvfdcsVC
 uDVxi3ozfuW6EiKrDfkcSjCFzE8r0SH8PoaFTOJQ0NvZKsmDcNjuvjqmfykLO_DNDInBQj458PNk
 AEkjxQAk0BogF_HIpCFxTI.jyDyzbu3hDcb0mowHGGO2NRGyggfZNgNL72QDGq09K5PSHAOd8OzE
 AqS3i10EOcu.UFtX124oSD4nz7Wk2tinQgjNiBqhxj77RkJBL0NheqC9rWlxh_wr.3WXPtw7MLM7
 l7GhTW0np9v9qkaqfMjZryz9sxLqlCKnhEnGd_KsoICF1oQ7QqVjrfKzypTAMNcv.ALY.ZmlNZhU
 uttoDNmFQmwCTm.hYFSek6AihQMVCSjngQsBdQEj4gRucir4B8s1GtZmCKLViN25eYWD3aj3Kojy
 J2ULzPc2C5LCF6NLhbUKoRpw42YjSybygWBVMGExISIiop762YTPvXxU1iQgkjMDvzayKa6B23sw
 VR1XFbWGP77Pb.sBM6o8dhKiK2qNiv8AyP8lCbGii1xwNQlvf01MhWQH3RuKGuV.WOnLhX45_u_c
 UOA47tpfJfh3QjnX1Si0r8SXeaJsenbbUk7k_HZV3fUta1oUnu6Qr_7sNP7mu2rdvmVRAkGH8UWe
 2Z8jCIVUuu43Y0oEzVNnrT_GJRku7m.jQmzlazKymGSt0Z8sEBjA.xoprninPRO27KT1LF_LftPT
 QBUk9r83pD9z.m_1THxWlaAAIZuNRnJGWxhN32aDF6XsXb0fzyCVeThW00LDKY3AOhl0H.5hO.BR
 U7EjATWGKGbDvvnmc3jbgCIvchOWhnnZwnwFFaMaqUss23Mk2h_6QPPTLSsp2UcMVvxjlRur7ocC
 7uEw-
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: 40f55634-955b-48f1-969e-f546ec2c1cbc
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.gq1.yahoo.com with HTTP; Wed, 15 Mar 2023 14:26:39 +0000
Received: by hermes--production-bf1-777648578f-gg2qh (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 60044a03c62ff9d9db8c181d26f4f55f; 
 Wed, 15 Mar 2023 14:26:38 +0000 (UTC)
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
Subject: [PATCH v4 1/2] pci: avoid accessing slot_reserved_mask directly
 outside of pci.c
Date: Wed, 15 Mar 2023 10:26:19 -0400
Message-Id: <b1b7f134883cbc83e455abbe5ee225c71aa0e8d0.1678888385.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678888385.git.brchuckz@aol.com>
References: <cover.1678888385.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=98.137.68.205; envelope-from=brchuckz@aim.com;
 helo=sonic304-24.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch provides accessor functions as replacements for direct
access to slot_reserved_mask according to the comment at the top
of include/hw/pci/pci_bus.h which advises that data structures for
PCIBus should not be directly accessed but instead be accessed using
accessor functions in pci.h.

Three accessor functions can conveniently replace all direct accesses
of slot_reserved_mask. With this patch, the new accessor functions are
used in hw/sparc64/sun4u.c and hw/xen/xen_pt.c and pci_bus.h is removed
from the included header files of the same two files.

No functional change intended.

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
Changelog

v4: This patch is unchanged since v2.

v3: This patch is unchanged since v2.

v2: This is the first version of this patch, it did not exist in v1.


 hw/pci/pci.c         | 15 +++++++++++++++
 hw/sparc64/sun4u.c   |  7 +++----
 hw/xen/xen_pt.c      |  7 +++----
 include/hw/pci/pci.h |  3 +++
 4 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index def5000e7b..8a87ccc8b0 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1116,6 +1116,21 @@ static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
     return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
 }
 
+uint32_t pci_bus_get_slot_reserved_mask(PCIBus *bus)
+{
+    return bus->slot_reserved_mask;
+}
+
+void pci_bus_set_slot_reserved_mask(PCIBus *bus, uint32_t mask)
+{
+    bus->slot_reserved_mask |= mask;
+}
+
+void pci_bus_clear_slot_reserved_mask(PCIBus *bus, uint32_t mask)
+{
+    bus->slot_reserved_mask &= ~mask;
+}
+
 /* -1 for devfn means auto assign */
 static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
                                          const char *name, int devfn,
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index a25e951f9d..eae7589462 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -31,7 +31,6 @@
 #include "hw/irq.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bridge.h"
-#include "hw/pci/pci_bus.h"
 #include "hw/pci/pci_host.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci-host/sabre.h"
@@ -608,9 +607,9 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
     /* Only in-built Simba APBs can exist on the root bus, slot 0 on busA is
        reserved (leaving no slots free after on-board devices) however slots
        0-3 are free on busB */
-    pci_bus->slot_reserved_mask = 0xfffffffc;
-    pci_busA->slot_reserved_mask = 0xfffffff1;
-    pci_busB->slot_reserved_mask = 0xfffffff0;
+    pci_bus_set_slot_reserved_mask(pci_bus, 0xfffffffc);
+    pci_bus_set_slot_reserved_mask(pci_busA, 0xfffffff1);
+    pci_bus_set_slot_reserved_mask(pci_busB, 0xfffffff0);
 
     ebus = pci_new_multifunction(PCI_DEVFN(1, 0), true, TYPE_EBUS);
     qdev_prop_set_uint64(DEVICE(ebus), "console-serial-base",
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 2d33d178ad..a540149639 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -57,7 +57,6 @@
 #include <sys/ioctl.h>
 
 #include "hw/pci/pci.h"
-#include "hw/pci/pci_bus.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "xen_pt.h"
@@ -951,7 +950,7 @@ void xen_igd_reserve_slot(PCIBus *pci_bus)
     }
 
     XEN_PT_LOG(0, "Reserving PCI slot 2 for IGD\n");
-    pci_bus->slot_reserved_mask |= XEN_PCI_IGD_SLOT_MASK;
+    pci_bus_set_slot_reserved_mask(pci_bus, XEN_PCI_IGD_SLOT_MASK);
 }
 
 static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
@@ -971,7 +970,7 @@ static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
         return;
     }
 
-    if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK)) {
+    if (!(pci_bus_get_slot_reserved_mask(pci_bus) & XEN_PCI_IGD_SLOT_MASK)) {
         xpdc->pci_qdev_realize(qdev, errp);
         return;
     }
@@ -982,7 +981,7 @@ static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
         s->real_device.dev == XEN_PCI_IGD_DEV &&
         s->real_device.func == XEN_PCI_IGD_FN &&
         s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
-        pci_bus->slot_reserved_mask &= ~XEN_PCI_IGD_SLOT_MASK;
+        pci_bus_clear_slot_reserved_mask(pci_bus, XEN_PCI_IGD_SLOT_MASK);
         XEN_PT_LOG(pci_dev, "Intel IGD found, using slot 2\n");
     }
     xpdc->pci_qdev_realize(qdev, errp);
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index d5a40cd058..935b4b91b4 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -287,6 +287,9 @@ void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq,
 void pci_bus_map_irqs(PCIBus *bus, pci_map_irq_fn map_irq);
 void pci_bus_irqs_cleanup(PCIBus *bus);
 int pci_bus_get_irq_level(PCIBus *bus, int irq_num);
+uint32_t pci_bus_get_slot_reserved_mask(PCIBus *bus);
+void pci_bus_set_slot_reserved_mask(PCIBus *bus, uint32_t mask);
+void pci_bus_clear_slot_reserved_mask(PCIBus *bus, uint32_t mask);
 /* 0 <= pin <= 3 0 = INTA, 1 = INTB, 2 = INTC, 3 = INTD */
 static inline int pci_swizzle(int slot, int pin)
 {
-- 
2.39.2


