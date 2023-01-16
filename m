Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB4166B505
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 01:51:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHDhg-0005xt-OE; Sun, 15 Jan 2023 19:50:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pHDhd-0005xk-Pt
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 19:50:21 -0500
Received: from sonic317-21.consmr.mail.gq1.yahoo.com ([98.137.66.147])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pHDhb-00071Z-EN
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 19:50:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1673830213; bh=ibFGNOOwdw6M80MH6beHNeLDqruvFm3uNMeR3WIAMZU=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=eu6cmlheaBSg1eYrkDKNunia/GFi8SX3nHJbM/2MiHeZj3J4QxZbv9l8hDkRNSFaT+TbiHFsq8opXZjmaELHvoz/hWFIuNHce9mEuaGH1OjTza1Plw2VtowPZqcRnENjNjVfZWQ6zAOAuJE849AXXdjQhauEcJVaweO4Oa7gDqxQlogRWC500BlvxgvMfweZeZg2JXOG0dklNG7AnXNhXtGgGR6p/o26a2WrOEvaJxKBu13OQthLtBpZSo/jOU0MMcH8ASwrB2wtPJiBbYiui9il5A+wTcP/4niPn6esQRvtKXpI9VICQTeVYju2NhnLykNhm6hxqSOe6jVzqwBX3w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1673830213; bh=ELz/NkAxpMLuwMNt+6DujvwNFFkBqK8dfC4yNNUZCmy=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=dhgCZJ1k9hY82bpS2FpcwJBb99LFcn2iA+mLn6SAvs2b/u1d4bt1gI/F0vcQi8I4urQP95MYWVplICfryO6Fw36NBZTe09Mv2nUt8EhvZQSOWMiRIIXA3HaWixyC0xO3meY55qoYT4FtMefwXDetvL6QmRk3RyWmb7PR3QY215KwxgxzQXnhW22YISRFzyyzbDufzk7qcwI/JbzaFEFp1guA8iOZ3F8Doik8YJjzi36m364TTen+HmqG3iGCkQ0+HV85MiSSEvHWoOomNC1isKBmJzmQakP5l9nXU93BZZf8ebCp2kA5+o+dIFhrbIgZ7bYwDjw7ZfkuR/GVqPHw/A==
X-YMail-OSG: 9VsewMQVM1k7NdkV7ZuU3RISr6.LkXveOZJ49FbtrqqmuDZeB4e_1gAiqS44FAY
 KSBqKHbNAiPPT0YG1UNWmdx.ihRFmOPeWxJJsQujHjEN5hK28DHsuv1.L6FkfeCS5RAyemBljkee
 GUq2nz7GDCLzz7Zds3bSO24V_jsZnHI2RkAYy9TmMLuDndkMUxnGswfk3PTNUpXePSL86keG.13P
 .2f3GrYumSDNMsTe7fe0XLmvGfiRsjNh14T.qc7UORS8_HmYAvnZbL1zxizki2_Dam.F3jv1XYrM
 edFKCiCDeIlaFid7As.RN4mhuLBJj34IhTe389QfYdGAWiLjMG25eVOV6qGlDnlfjTwjNR4UJVDI
 MLCNohOYa2hyzuZBqIFazqcbLH9FBrLFAiufPyNm2OkCvdUDWv05OrcKeMMW1m1IZz6D.vTO926x
 1oIRohT3cVqQP0hFBi_6Hfrj6DgXRXVK6v0LE.f5cTpkYfCNtyAuuGbF7IrflgD9JfhF.QEn4vyT
 a8wSFYlXrgv5yDbWt60WD0O_8H2a0AcYIeMqEcq1bBbwPX.iLdbP62iUeh28bq6sUJlTriC8ICnY
 mBMFgNaH7NDdbix7xTrAKRN3MjTG3silyAdB8D81bSB0Z4puq09xUpPN41UnvhfTHb76UNfSsfwn
 eUFQwak9msvSFUHYD8LSDESj_h21qdaKqre8jyZ0Xefnifw_XCaeXgjYBt_lp9z9kyalmH3PZk2k
 vUos3CDYbFavE4xInH616UBBYVqa58xAI3UFIySCTYIj0l6ru.t8L5Fqd0UBPNqNsJQiDznv5f_x
 npiCGhQN4ycuFe5Now9jdjyfK0ES65i5l9.TrjR2J5pyrsW3OI6.HrFC5996koQuABd8988P3E9F
 tasm3w.S7Ucl1UlUBEHfLVC.z5WtC9RsQaDyzJ23vv.zIm_GJ68OrrfOXRLXBIqCfynaUvY8VzB_
 Bi4l25wuUOx2IFF9DuQwyyWSlnfW3JJx6F1ceG2TqTUB6nJouNMIzmHqgkvUo.xx2w1eib1sxo8_
 ptYKNfAxDIB.DGlBUeVP1HuvT.gY0yFv7X17l34H7BQEn0pqIUCeRApV3pW1u2jANvJN.pMQ_qdK
 eDh3IOkVA4laADrLpPxeCg7L7QcMCYS.dKWp_krwlabVvBtrrBT95NNcy9YJOBuFdhLHGgLqU.OT
 4d77Spugu4kfF5BmDZ.eXobMbiiDNWN7v1zmCNvDjMgeW0crDcMvpzPFtLO52Z5Qg6e6Y6b90M21
 Gxw2O2H_ahM60KjGq.JGOZhLuvlO72FSwpc8jnFaIf5TqS2V0BYAWnFXtSYPUwP36mrsfSSkuj_c
 htiTyMKZ3HOxQcpia5I1CoiOFXHpKhNdNnG.A85VWx3mg5LQcCUh.jhfXhQcSdXjWcojSgV_hbPQ
 dG44UoVVyJhqfGv07D69TX0QC5KplH44Zha6d0eFTvYa.ZO2A9YXh5Rhs1.EBxm1d5yATYhXf1TX
 qKRbwKlqtjYpwo9gcO6XmM.Ya2dabea9D87V0JY.VgElNKjRzpRY95TuJB0knltwWLXBKkl4DAJR
 uT63q2StP9alcJkLPx7a93q6TgOe1zLZhLW._Fgc7KQ_hKicj2Lv2itFJ.w79YF5kQ4fpP0Hlvae
 ip2f2VTbA9.UOC_zzwynWcc_.fIqVn2bTHp2LliP.OvFaUXZgq2_aii07JcALHJ0dmXei4rVIO0R
 diUClLrFZrsIvPULKvCQuXRdCSnMLLAsjidr.iV.ERzQzjr6iunPMCjElp3_9lob1MxhbEUD4UAS
 IALsKVXsD.o41CVFYj2aPW5Om08.427ycZG3DG3jprhQqGBavkZjGQMHjz0xVavu0ZCX2C.Ywoga
 KYm477B4vWTAlNHcIEgjg9brucQupvbiQ.bFkXDK2XUuZojLQDOMGhLU2v4inc4FdeyJbxvfTsw3
 FWOhitmXQc1pqF.RkvAf5p3ToZgnCL0DUs2giGVu1pXHUTp10lMWV8VgpwKS3iduq_nx4vGdQ.zD
 EubUri2y1M9mj0UTEf73F1zRCFLbHqA0m.JKAIhW9TWo2EfQGBA4qAtIV2LPiRC2o64kmkw6fcmq
 81OMs5VxZum0vhtEIN5JUcqt52hcoRVmKj.20qub7kVYwvzUgmPE7gzILxt57MHJ3XB2HEbNkosn
 8gZq0y8ph0xMLFgJliJxEH8dpMsXyrxfhF4KJHpojTpwad0MByNUa5_GzZqMer6IXi0IovpLA.3U
 -
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.gq1.yahoo.com with HTTP; Mon, 16 Jan 2023 00:50:13 +0000
Received: by hermes--production-ne1-5648bd7666-vj7sg (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 7857e29737ffe173032d857030ea308b; 
 Mon, 16 Jan 2023 00:50:10 +0000 (UTC)
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH] pci: add enforce_slot_reserved_mask_manual property
Date: Sun, 15 Jan 2023 19:49:51 -0500
Message-Id: <ad5f5cf8bc4bd4a720724ed41e47565a7f27adf5.1673829387.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <ad5f5cf8bc4bd4a720724ed41e47565a7f27adf5.1673829387.git.brchuckz.ref@aol.com>
Received-SPF: pass client-ip=98.137.66.147; envelope-from=brchuckz@aim.com;
 helo=sonic317-21.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The current reserved slot check in do_pci_register_device(), added with
commit 8b8849844fd6, is done even if the pci device being added is
configured manually for a particular slot. The new property, when set
to false, disables the check when the device is configured to request a
particular slot. This allows an administrator or management tool to
override slot_reserved_mask for a pci device by requesting a particular
slot for the device. The new property is initialized to true which
preserves the existing behavior of slot_reserved_mask by default.

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
 hw/pci/pci.c             | 9 ++++++++-
 include/hw/pci/pci_bus.h | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index c2fb88f9a3..5e15f08036 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -467,6 +467,7 @@ static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
     assert(PCI_FUNC(devfn_min) == 0);
     bus->devfn_min = devfn_min;
     bus->slot_reserved_mask = 0x0;
+    bus->enforce_slot_reserved_mask_manual = true;
     bus->address_space_mem = address_space_mem;
     bus->address_space_io = address_space_io;
     bus->flags |= PCI_BUS_IS_ROOT;
@@ -1074,6 +1075,12 @@ static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
     return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
 }
 
+static bool pci_bus_devfn_reserved_manual(PCIBus *bus, int devfn)
+{
+    return bus->enforce_slot_reserved_mask_manual &&
+            (bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn)));
+}
+
 /* -1 for devfn means auto assign */
 static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
                                          const char *name, int devfn,
@@ -1107,7 +1114,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
                    "or reserved", name);
         return NULL;
     found: ;
-    } else if (pci_bus_devfn_reserved(bus, devfn)) {
+    } else if (pci_bus_devfn_reserved_manual(bus, devfn)) {
         error_setg(errp, "PCI: slot %d function %d not available for %s,"
                    " reserved",
                    PCI_SLOT(devfn), PCI_FUNC(devfn), name);
diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
index 5653175957..e0f15ee9be 100644
--- a/include/hw/pci/pci_bus.h
+++ b/include/hw/pci/pci_bus.h
@@ -37,6 +37,7 @@ struct PCIBus {
     void *iommu_opaque;
     uint8_t devfn_min;
     uint32_t slot_reserved_mask;
+    bool enforce_slot_reserved_mask_manual;
     pci_set_irq_fn set_irq;
     pci_map_irq_fn map_irq;
     pci_route_irq_fn route_intx_to_irq;
-- 
2.39.0


