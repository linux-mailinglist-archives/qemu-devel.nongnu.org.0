Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2B6628E70
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:33:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouiir-0002Pr-Jp; Mon, 14 Nov 2022 18:18:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marmarek@invisiblethingslab.com>)
 id 1ouieP-0001df-L1
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:02 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marmarek@invisiblethingslab.com>)
 id 1ouf0h-0005gJ-4H
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 14:20:49 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 9EF3D32009B0;
 Mon, 14 Nov 2022 14:20:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 14 Nov 2022 14:20:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1668453645; x=1668540045; bh=oqI/+sgvZ2
 OKVRaSTG42v6mrCeoTzSNksNPbobAHtyw=; b=nZQvOB/3uWzHry1FZf0mIgSsio
 TvpqbQFtXxVW9joxJ7lW/EuPyJU8PRYnedTs4mAqvG/tc5l1Pc1970/9Sbmg/t7p
 EZbllWG966ciU059asbn53Ip6E5nQhynPE7mvJUIsUC1sE5Fq/a7sbfEeozLuBaX
 InUaggTqErhrhpqDFMNyjV230YOSnrWTr2INMzE0wER/nUXhoDk0pFCTSGt8wh7A
 aRacxuWdLD6BxgGXfCh+q4OobrVRWwh+byCc0+yxwFJ291Mcqs/Ki2GebVEzzNvH
 jMjMEDVDqF/PytoU0LwsFEY/maS8b5g5gBgzr5yc7qs8mQGAdd/kYEKhNzLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668453645; x=
 1668540045; bh=oqI/+sgvZ2OKVRaSTG42v6mrCeoTzSNksNPbobAHtyw=; b=D
 2P5sBpbEsNu6MaRLAFp5J8quqclpPDdJRkMM1LI903pFADdgAXtiEoVTcOPQ4wiZ
 otXWafF8iM8VcODK7xQr8K1sDHD0Tn2tT30tIcdEI4zpAWSONS/yhRA4nCi5M+SI
 ff+gcGkeMBKFvKLbcqJE2wfQ5BC6oY20wLOpmPyQRfJwmxeBoOE+1S9H9FRgpJtY
 MNFl+H44gOFYLbmjtngCof2icNN0cnIY8sE5HCYsA+ucYZYdXMTbs3KYwfQxuRGN
 T15Vv6pUYKJdLeOTNp/W3yJVX6QWzlfDA1iRFQGW5VT/7ICnw9WcV1IBk+RDneFa
 4tLIoK+iUNeySmtbZYEtg==
X-ME-Sender: <xms:DJVyY4_9WND8N8kud-egLwPvnfn7p8X-MLxvNFn4HChtwiUQWcEgtA>
 <xme:DJVyYwuMfLMSKXGPMaXIt2RyvJatdxvgiOI37DtxS_BFoYeiWNDDpATJp-4SW-Ttp
 YgBPLLNC0Fhyg>
X-ME-Received: <xmr:DJVyY-DaXe1oVwj3132y_FPogz0fraQ3Ek4HhBlVQg0M_WrSzgwW6Fj900mDdqhEIaxC46kteITdWFVF633Z86MqsMxzqMQQvrPbwRTUHzHuTtI5AYo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
 udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
 sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:DJVyY4fd_q5AQwTm8hfu-hGHGrUNa_NlaV4rNF8TeQU52MGTSsFV-w>
 <xmx:DJVyY9NgQwTd329JmW5qWZTk05Qq7r0tvs4QN72MR45RUA-dxY-g7Q>
 <xmx:DJVyYyloGBdI6D-m55EDEBVtvNSSKMX1Cd4O7iwaOy2jEWTl27oiMA>
 <xmx:DZVyY-pJbI2V7IAOSZyqH7pBd8HJyDFQeEeLigbZ7oB8NPERytrZJQ>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 14:20:43 -0500 (EST)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH 2/2] Do not access /dev/mem in MSI-X PCI passthrough on Xen
Date: Mon, 14 Nov 2022 20:20:11 +0100
Message-Id: <20221114192011.1539233-2-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221114192011.1539233-1-marmarek@invisiblethingslab.com>
References: <20221114192011.1539233-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=64.147.123.25;
 envelope-from=marmarek@invisiblethingslab.com;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

The /dev/mem is used for two purposes:
 - reading PCI_MSIX_ENTRY_CTRL_MASKBIT
 - reading Pending Bit Array (PBA)

The first one was originally done because when Xen did not send all
vector ctrl writes to the device model, so QEMU might have outdated old
register value. This has been changed in Xen, so QEMU can now use its
cached value of the register instead.

The Pending Bit Array (PBA) handling is for the case where it lives on
the same page as the MSI-X table itself. Xen has been extended to handle
this case too (as well as other registers that may live on those pages),
so QEMU handling is not necessary anymore.

Removing /dev/mem access is useful to work within stubdomain, and
necessary when dom0 kernel runs in lockdown mode.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 hw/xen/xen_pt.h     |  1 -
 hw/xen/xen_pt_msi.c | 51 ++++-----------------------------------------
 2 files changed, 4 insertions(+), 48 deletions(-)

diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index e7c4316a7d..de4094e7ec 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -206,7 +206,6 @@ typedef struct XenPTMSIX {
     uint32_t table_offset_adjust; /* page align mmap */
     uint64_t mmio_base_addr;
     MemoryRegion mmio;
-    void *phys_iomem_base;
     XenPTMSIXEntry msix_entry[];
 } XenPTMSIX;
 
diff --git a/hw/xen/xen_pt_msi.c b/hw/xen/xen_pt_msi.c
index b71563f98a..a8a75dff66 100644
--- a/hw/xen/xen_pt_msi.c
+++ b/hw/xen/xen_pt_msi.c
@@ -460,15 +460,7 @@ static void pci_msix_write(void *opaque, hwaddr addr,
         entry->updated = true;
     } else if (msix->enabled && entry->updated &&
                !(val & PCI_MSIX_ENTRY_CTRL_MASKBIT)) {
-        const volatile uint32_t *vec_ctrl;
-
-        /*
-         * If Xen intercepts the mask bit access, entry->vec_ctrl may not be
-         * up-to-date. Read from hardware directly.
-         */
-        vec_ctrl = s->msix->phys_iomem_base + entry_nr * PCI_MSIX_ENTRY_SIZE
-            + PCI_MSIX_ENTRY_VECTOR_CTRL;
-        xen_pt_msix_update_one(s, entry_nr, *vec_ctrl);
+        xen_pt_msix_update_one(s, entry_nr, entry->latch(VECTOR_CTRL));
     }
 
     set_entry_value(entry, offset, val);
@@ -493,7 +485,9 @@ static uint64_t pci_msix_read(void *opaque, hwaddr addr,
         return get_entry_value(&msix->msix_entry[entry_nr], offset);
     } else {
         /* Pending Bit Array (PBA) */
-        return *(uint32_t *)(msix->phys_iomem_base + addr);
+        XEN_PT_LOG(&s->dev, "reading PBA, addr %#lx, offset %#lx\n",
+                   addr, addr - msix->total_entries * PCI_MSIX_ENTRY_SIZE);
+        return 0xFFFFFFFF;
     }
 }
 
@@ -529,7 +523,6 @@ int xen_pt_msix_init(XenPCIPassthroughState *s, uint32_t base)
     int i, total_entries, bar_index;
     XenHostPCIDevice *hd = &s->real_device;
     PCIDevice *d = &s->dev;
-    int fd = -1;
     XenPTMSIX *msix = NULL;
     int rc = 0;
 
@@ -576,34 +569,6 @@ int xen_pt_msix_init(XenPCIPassthroughState *s, uint32_t base)
     msix->table_base = s->real_device.io_regions[bar_index].base_addr;
     XEN_PT_LOG(d, "get MSI-X table BAR base 0x%"PRIx64"\n", msix->table_base);
 
-    fd = open("/dev/mem", O_RDWR);
-    if (fd == -1) {
-        rc = -errno;
-        XEN_PT_ERR(d, "Can't open /dev/mem: %s\n", strerror(errno));
-        goto error_out;
-    }
-    XEN_PT_LOG(d, "table_off = 0x%x, total_entries = %d\n",
-               table_off, total_entries);
-    msix->table_offset_adjust = table_off & 0x0fff;
-    msix->phys_iomem_base =
-        mmap(NULL,
-             total_entries * PCI_MSIX_ENTRY_SIZE + msix->table_offset_adjust,
-             PROT_READ,
-             MAP_SHARED | MAP_LOCKED,
-             fd,
-             msix->table_base + table_off - msix->table_offset_adjust);
-    close(fd);
-    if (msix->phys_iomem_base == MAP_FAILED) {
-        rc = -errno;
-        XEN_PT_ERR(d, "Can't map physical MSI-X table: %s\n", strerror(errno));
-        goto error_out;
-    }
-    msix->phys_iomem_base = (char *)msix->phys_iomem_base
-        + msix->table_offset_adjust;
-
-    XEN_PT_LOG(d, "mapping physical MSI-X table to %p\n",
-               msix->phys_iomem_base);
-
     memory_region_add_subregion_overlap(&s->bar[bar_index], table_off,
                                         &msix->mmio,
                                         2); /* Priority: pci default + 1 */
@@ -624,14 +589,6 @@ void xen_pt_msix_unmap(XenPCIPassthroughState *s)
         return;
     }
 
-    /* unmap the MSI-X memory mapped register area */
-    if (msix->phys_iomem_base) {
-        XEN_PT_LOG(&s->dev, "unmapping physical MSI-X table from %p\n",
-                   msix->phys_iomem_base);
-        munmap(msix->phys_iomem_base, msix->total_entries * PCI_MSIX_ENTRY_SIZE
-               + msix->table_offset_adjust);
-    }
-
     memory_region_del_subregion(&s->bar[msix->bar_index], &msix->mmio);
 }
 
-- 
2.37.3


