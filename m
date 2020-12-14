Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79C72D9BCF
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:07:44 +0100 (CET)
Received: from localhost ([::1]:34126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koqNz-0002Bm-SA
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:07:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEb-0007tl-D5; Mon, 14 Dec 2020 10:58:01 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:42397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqES-0001Qb-A5; Mon, 14 Dec 2020 10:58:01 -0500
Received: from localhost.localdomain ([82.252.135.218]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MO9vD-1kUqMu1rVB-00OX5i; Mon, 14 Dec 2020 16:57:41 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/19] hw/xen: Don't use '#' flag of printf format
Date: Mon, 14 Dec 2020 16:57:18 +0100
Message-Id: <20201214155733.207430-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214155733.207430-1-laurent@vivier.eu>
References: <20201214155733.207430-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:K7cpzHQZZg51CN2ZIO3GEdHZF9cJ7vcOp+Mqj4y6ZqXmAGW7bUv
 frwy4AS3f2xY8hDlm26cgfEJeEvY6WXZvLMzqwY2X6Ymhqnce9adl9kbARdNrNtn3DXl9NU
 oTOqG5anG2PIuYTiz7jMy39ItAUagTj1C/5qXJeSLrTxsfbzCZdJsZmfeFrtdIoY6hJTPi2
 lEG1oBu91E1gW23bF/xYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yMcKUzW4YFg=:JRAb1j37TLsOBghDKm5QJv
 w3Y5wiuHYn3IQhaBTafyiY2uz8aSQfgj2mfSFW9JNx73TiJ3niM4WnTIdeTvNArvC6POoKwu/
 +AXInaBXxY7osEQGzTLM2ed1lBvsigc45mAIzgf08VoHIUBurVeSr8HCgaJCW1Sko8tTLi+ly
 L2esM/pr/60XBonhbt9tdIUGPll50EREYV41OCmMuIjmGgGibXtPdTrACv9IgQGRzga4UtIXI
 OSQzKBypGDLaIb6nPZG2em46A6f+Bi+4Kvqd7/6vPiQxa1/YIqiLJUV7tyCpoJrovVM350chn
 b5mADOGFwa1KrvG+ur8OlUfhhrdyq75Q+uOtZ3BQCXYd5aSkh/G6wtvh9QQhJYzLTQmDLRC6G
 V/2luO31wgtPZkOOThxLLxTeOuPZGTbnk07Jc/B8O+4PA2moVfnUMFlx1rwWjr7RgQK/3BDyv
 UfuDWnFyow==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-trivial@nongnu.org, Kai Deng <dengkai1@huawei.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Xinhao Zhang <zhangxinhao1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xinhao Zhang <zhangxinhao1@huawei.com>

Fix code style. Don't use '#' flag of printf format ('%#') in
format strings, use '0x' prefix instead

Signed-off-by: Xinhao Zhang <zhangxinhao1@huawei.com>
Signed-off-by: Kai Deng <dengkai1@huawei.com>
Message-Id: <20201104133709.3326630-1-zhangxinhao1@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/xen/xen_pt.c             | 10 +++++-----
 hw/xen/xen_pt_config_init.c |  6 +++---
 hw/xen/xen_pt_msi.c         | 16 ++++++++--------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 6d359ee486f5..a5f3dd590c13 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -489,7 +489,7 @@ static int xen_pt_register_regions(XenPCIPassthroughState *s, uint16_t *cmd)
         pci_register_bar(&s->dev, i, type, &s->bar[i]);
 
         XEN_PT_LOG(&s->dev, "IO region %i registered (size=0x%08"PRIx64
-                   " base_addr=0x%08"PRIx64" type: %#x)\n",
+                   " base_addr=0x%08"PRIx64" type: 0x%x)\n",
                    i, r->size, r->base_addr, type);
     }
 
@@ -578,7 +578,7 @@ static void xen_pt_check_bar_overlap(PCIBus *bus, PCIDevice *d, void *opaque)
         if (ranges_overlap(arg->addr, arg->size, r->addr, r->size)) {
             XEN_PT_WARN(&s->dev,
                         "Overlapped to device [%02x:%02x.%d] Region: %i"
-                        " (addr: %#"FMT_PCIBUS", len: %#"FMT_PCIBUS")\n",
+                        " (addr: 0x%"FMT_PCIBUS", len: 0x%"FMT_PCIBUS")\n",
                         pci_bus_num(bus), PCI_SLOT(d->devfn),
                         PCI_FUNC(d->devfn), i, r->addr, r->size);
             arg->rc = true;
@@ -618,8 +618,8 @@ static void xen_pt_region_update(XenPCIPassthroughState *s,
     pci_for_each_device(pci_get_bus(d), pci_dev_bus_num(d),
                         xen_pt_check_bar_overlap, &args);
     if (args.rc) {
-        XEN_PT_WARN(d, "Region: %d (addr: %#"FMT_PCIBUS
-                    ", len: %#"FMT_PCIBUS") is overlapped.\n",
+        XEN_PT_WARN(d, "Region: %d (addr: 0x%"FMT_PCIBUS
+                    ", len: 0x%"FMT_PCIBUS") is overlapped.\n",
                     bar, sec->offset_within_address_space,
                     int128_get64(sec->size));
     }
@@ -786,7 +786,7 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
 
     /* register real device */
     XEN_PT_LOG(d, "Assigning real physical device %02x:%02x.%d"
-               " to devfn %#x\n",
+               " to devfn 0x%x\n",
                s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
                s->dev.devfn);
 
diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index c8724cc7c855..c5c4e943a845 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -1622,7 +1622,7 @@ static int xen_pt_pcie_size_init(XenPCIPassthroughState *s,
         case PCI_EXP_TYPE_PCIE_BRIDGE:
         case PCI_EXP_TYPE_RC_EC:
         default:
-            XEN_PT_ERR(d, "Unsupported device/port type %#x.\n", type);
+            XEN_PT_ERR(d, "Unsupported device/port type 0x%x.\n", type);
             return -1;
         }
     }
@@ -1645,11 +1645,11 @@ static int xen_pt_pcie_size_init(XenPCIPassthroughState *s,
         case PCI_EXP_TYPE_PCIE_BRIDGE:
         case PCI_EXP_TYPE_RC_EC:
         default:
-            XEN_PT_ERR(d, "Unsupported device/port type %#x.\n", type);
+            XEN_PT_ERR(d, "Unsupported device/port type 0x%x.\n", type);
             return -1;
         }
     } else {
-        XEN_PT_ERR(d, "Unsupported capability version %#x.\n", version);
+        XEN_PT_ERR(d, "Unsupported capability version 0x%x.\n", version);
         return -1;
     }
 
diff --git a/hw/xen/xen_pt_msi.c b/hw/xen/xen_pt_msi.c
index fb4b887b92b1..b71563f98a8b 100644
--- a/hw/xen/xen_pt_msi.c
+++ b/hw/xen/xen_pt_msi.c
@@ -123,7 +123,7 @@ static int msi_msix_setup(XenPCIPassthroughState *s,
             *ppirq = XEN_PT_UNASSIGNED_PIRQ;
         } else {
             XEN_PT_LOG(&s->dev, "requested pirq %d for MSI%s"
-                       " (vec: %#x, entry: %#x)\n",
+                       " (vec: 0x%x, entry: 0x%x)\n",
                        *ppirq, is_msix ? "-X" : "", gvec, msix_entry);
         }
     }
@@ -142,7 +142,7 @@ static int msi_msix_setup(XenPCIPassthroughState *s,
                                      msix_entry, table_base);
         if (rc) {
             XEN_PT_ERR(&s->dev,
-                       "Mapping of MSI%s (err: %i, vec: %#x, entry %#x)\n",
+                       "Mapping of MSI%s (err: %i, vec: 0x%x, entry 0x%x)\n",
                        is_msix ? "-X" : "", errno, gvec, msix_entry);
             return rc;
         }
@@ -165,8 +165,8 @@ static int msi_msix_update(XenPCIPassthroughState *s,
     int rc = 0;
     uint64_t table_addr = 0;
 
-    XEN_PT_LOG(d, "Updating MSI%s with pirq %d gvec %#x gflags %#x"
-               " (entry: %#x)\n",
+    XEN_PT_LOG(d, "Updating MSI%s with pirq %d gvec 0x%x gflags 0x%x"
+               " (entry: 0x%x)\n",
                is_msix ? "-X" : "", pirq, gvec, gflags, msix_entry);
 
     if (is_msix) {
@@ -208,11 +208,11 @@ static int msi_msix_disable(XenPCIPassthroughState *s,
     }
 
     if (is_binded) {
-        XEN_PT_LOG(d, "Unbind MSI%s with pirq %d, gvec %#x\n",
+        XEN_PT_LOG(d, "Unbind MSI%s with pirq %d, gvec 0x%x\n",
                    is_msix ? "-X" : "", pirq, gvec);
         rc = xc_domain_unbind_msi_irq(xen_xc, xen_domid, gvec, pirq, gflags);
         if (rc) {
-            XEN_PT_ERR(d, "Unbinding of MSI%s failed. (err: %d, pirq: %d, gvec: %#x)\n",
+            XEN_PT_ERR(d, "Unbinding of MSI%s failed. (err: %d, pirq: %d, gvec: 0x%x)\n",
                        is_msix ? "-X" : "", errno, pirq, gvec);
             return rc;
         }
@@ -539,7 +539,7 @@ int xen_pt_msix_init(XenPCIPassthroughState *s, uint32_t base)
     }
 
     if (id != PCI_CAP_ID_MSIX) {
-        XEN_PT_ERR(d, "Invalid id %#x base %#x\n", id, base);
+        XEN_PT_ERR(d, "Invalid id 0x%x base 0x%x\n", id, base);
         return -1;
     }
 
@@ -582,7 +582,7 @@ int xen_pt_msix_init(XenPCIPassthroughState *s, uint32_t base)
         XEN_PT_ERR(d, "Can't open /dev/mem: %s\n", strerror(errno));
         goto error_out;
     }
-    XEN_PT_LOG(d, "table_off = %#x, total_entries = %d\n",
+    XEN_PT_LOG(d, "table_off = 0x%x, total_entries = %d\n",
                table_off, total_entries);
     msix->table_offset_adjust = table_off & 0x0fff;
     msix->phys_iomem_base =
-- 
2.29.2


