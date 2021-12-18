Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B96479B79
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 15:56:00 +0100 (CET)
Received: from localhost ([::1]:57584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myb7v-0002Lo-B3
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 09:55:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myb3i-0005lR-6M
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 09:51:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myb3g-0001BK-1j
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 09:51:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639839095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lwuMNYmPqW0fbpZsvUbQKEX1kWascSWCJJ2e+GlDMBU=;
 b=M+lBSB+hQGD0/7IZ3Kfqs5+erlb8HgaBKK28vCnvfv4B37/4Ob1FlCrR0gdDkRwRaugZP3
 7IkjS0fHp0cgPhVHzh0bT/TKGHEOXJNBI7TMhU4mwXDUsiznfY0OTe4bYkKebOjMzW3k7Z
 gRCwf/hWDWHoTrjruL1bnBnxh5F4rQE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-VfLj2OgRPc2pcs-80vbpdA-1; Sat, 18 Dec 2021 09:51:34 -0500
X-MC-Unique: VfLj2OgRPc2pcs-80vbpdA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r7-20020adfbb07000000b001a254645f13so1438680wrg.7
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 06:51:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lwuMNYmPqW0fbpZsvUbQKEX1kWascSWCJJ2e+GlDMBU=;
 b=HzZNd64gO+G7sGDVZuq5gjrj0hHkxrY1mEi1AvaYF9KCPbxB73UuxTNHMf7lVxwfMS
 iW01Xi/GDgzzg87gTanSwU6+1iImh9ng/fgGxzA+I3Bp7+JpmZNTOPSyzsJH38u1SAn9
 EpalurLHptXMVy0yz3xD3XB8GCdV2IJQX8KBxnAMBohA+EB3rurAfMJiuIJgC0A8Hrw9
 JSnztbjnlO4JbduJoEnv9GbNkJPjIaMP7haulwJofeM227SMY3QQ2ssrHNfNewMYasOh
 YXyjyg+Q75eCmy98L5DMJ32lM0EIGsTnp72CHxozBcvAtVXjxkctv9MH69IaeCxVtncj
 nnDA==
X-Gm-Message-State: AOAM5307O9KiLuK0pe86/R0p8bcVpQeG0v/V2+Slv/KEaiCgQvrVAPNe
 4ezgbcz3MPFVhfMF3vwnG42oHBX65FbHo/lQetVP84+44C/mI54hvmCm3QvYeEkiNWwwroLjJZp
 fEzWz4j7jzN1FW9ggYTkP1BsWEQYVjJGu/zdqf7f5kYNxmU5MgoOT+lG7API9oc4H
X-Received: by 2002:a05:600c:3c8a:: with SMTP id
 bg10mr14056900wmb.106.1639839092961; 
 Sat, 18 Dec 2021 06:51:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFLcNRcGt4ZE5z08uJasHzzpZSDG2Um+vg3uCowbYMYZi9QDqqGYomFZ8suyc0N1Lg5pi3/Q==
X-Received: by 2002:a05:600c:3c8a:: with SMTP id
 bg10mr14056868wmb.106.1639839092614; 
 Sat, 18 Dec 2021 06:51:32 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id b19sm15251052wmb.38.2021.12.18.06.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 06:51:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] dma: Let ld*_dma() propagate MemTxResult
Date: Sat, 18 Dec 2021 15:51:11 +0100
Message-Id: <20211218145111.1540114-5-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211218145111.1540114-1-philmd@redhat.com>
References: <20211218145111.1540114-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dma_memory_read() returns a MemTxResult type. Do not discard
it, return it to the caller.

Update the few callers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci/pci.h       |  6 ++++--
 include/hw/ppc/spapr_vio.h |  6 +++++-
 include/sysemu/dma.h       | 25 ++++++++++++-------------
 hw/intc/pnv_xive.c         |  8 ++++----
 hw/usb/hcd-xhci.c          |  7 ++++---
 5 files changed, 29 insertions(+), 23 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 0613308b1b6..8c5f2ed5054 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -854,8 +854,10 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
     static inline uint##_bits##_t ld##_l##_pci_dma(PCIDevice *dev,      \
                                                    dma_addr_t addr)     \
     {                                                                   \
-        return ld##_l##_dma(pci_get_address_space(dev), addr,           \
-                            MEMTXATTRS_UNSPECIFIED);                    \
+        uint##_bits##_t val; \
+        ld##_l##_dma(pci_get_address_space(dev), addr, &val, \
+                     MEMTXATTRS_UNSPECIFIED); \
+        return val; \
     }                                                                   \
     static inline void st##_s##_pci_dma(PCIDevice *dev,                 \
                                         dma_addr_t addr, uint##_bits##_t val) \
diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index d2ec9b0637f..7eae1a48478 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -127,7 +127,11 @@ static inline int spapr_vio_dma_set(SpaprVioDevice *dev, uint64_t taddr,
 #define vio_stq(_dev, _addr, _val) \
         (stq_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
 #define vio_ldq(_dev, _addr) \
-        (ldq_be_dma(&(_dev)->as, (_addr), MEMTXATTRS_UNSPECIFIED))
+        ({ \
+            uint64_t _val; \
+            ldq_be_dma(&(_dev)->as, (_addr), &_val, MEMTXATTRS_UNSPECIFIED); \
+            _val; \
+        })
 
 int spapr_vio_send_crq(SpaprVioDevice *dev, uint8_t *crq);
 
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 191cf0b271a..589f5ba52a2 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -241,14 +241,15 @@ static inline void dma_memory_unmap(AddressSpace *as,
 }
 
 #define DEFINE_LDST_DMA(_lname, _sname, _bits, _end) \
-    static inline uint##_bits##_t ld##_lname##_##_end##_dma(AddressSpace *as, \
-                                                            dma_addr_t addr, \
-                                                            MemTxAttrs attrs) \
-    {                                                                   \
-        uint##_bits##_t val;                                            \
-        dma_memory_read(as, addr, &val, (_bits) / 8, attrs); \
-        return _end##_bits##_to_cpu(val);                               \
-    }                                                                   \
+    static inline MemTxResult ld##_lname##_##_end##_dma(AddressSpace *as, \
+                                                        dma_addr_t addr, \
+                                                        uint##_bits##_t *pval, \
+                                                        MemTxAttrs attrs) \
+    { \
+        MemTxResult res = dma_memory_read(as, addr, pval, (_bits) / 8, attrs); \
+        _end##_bits##_to_cpus(pval); \
+        return res; \
+    } \
     static inline MemTxResult st##_sname##_##_end##_dma(AddressSpace *as, \
                                                         dma_addr_t addr, \
                                                         uint##_bits##_t val, \
@@ -258,12 +259,10 @@ static inline void dma_memory_unmap(AddressSpace *as,
         return dma_memory_write(as, addr, &val, (_bits) / 8, attrs); \
     }
 
-static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr, MemTxAttrs attrs)
+static inline MemTxResult ldub_dma(AddressSpace *as, dma_addr_t addr,
+                                   uint8_t *val, MemTxAttrs attrs)
 {
-    uint8_t val;
-
-    dma_memory_read(as, addr, &val, 1, attrs);
-    return val;
+    return dma_memory_read(as, addr, val, 1, attrs);
 }
 
 static inline MemTxResult stb_dma(AddressSpace *as, dma_addr_t addr,
diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index d9249bbc0c1..bb207514f2d 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -172,7 +172,7 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *xive, uint32_t type,
 
     /* Get the page size of the indirect table. */
     vsd_addr = vsd & VSD_ADDRESS_MASK;
-    vsd = ldq_be_dma(&address_space_memory, vsd_addr, MEMTXATTRS_UNSPECIFIED);
+    ldq_be_dma(&address_space_memory, vsd_addr, &vsd, MEMTXATTRS_UNSPECIFIED);
 
     if (!(vsd & VSD_ADDRESS_MASK)) {
 #ifdef XIVE_DEBUG
@@ -195,8 +195,8 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *xive, uint32_t type,
     /* Load the VSD we are looking for, if not already done */
     if (vsd_idx) {
         vsd_addr = vsd_addr + vsd_idx * XIVE_VSD_SIZE;
-        vsd = ldq_be_dma(&address_space_memory, vsd_addr,
-                         MEMTXATTRS_UNSPECIFIED);
+        ldq_be_dma(&address_space_memory, vsd_addr, &vsd,
+                   MEMTXATTRS_UNSPECIFIED);
 
         if (!(vsd & VSD_ADDRESS_MASK)) {
 #ifdef XIVE_DEBUG
@@ -543,7 +543,7 @@ static uint64_t pnv_xive_vst_per_subpage(PnvXive *xive, uint32_t type)
 
     /* Get the page size of the indirect table. */
     vsd_addr = vsd & VSD_ADDRESS_MASK;
-    vsd = ldq_be_dma(&address_space_memory, vsd_addr, MEMTXATTRS_UNSPECIFIED);
+    ldq_be_dma(&address_space_memory, vsd_addr, &vsd, MEMTXATTRS_UNSPECIFIED);
 
     if (!(vsd & VSD_ADDRESS_MASK)) {
 #ifdef XIVE_DEBUG
diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index d960b814587..da5a4072107 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -2062,7 +2062,7 @@ static TRBCCode xhci_address_slot(XHCIState *xhci, unsigned int slotid,
     assert(slotid >= 1 && slotid <= xhci->numslots);
 
     dcbaap = xhci_addr64(xhci->dcbaap_low, xhci->dcbaap_high);
-    poctx = ldq_le_dma(xhci->as, dcbaap + 8 * slotid, MEMTXATTRS_UNSPECIFIED);
+    ldq_le_dma(xhci->as, dcbaap + 8 * slotid, &poctx, MEMTXATTRS_UNSPECIFIED);
     ictx = xhci_mask64(pictx);
     octx = xhci_mask64(poctx);
 
@@ -3429,6 +3429,7 @@ static int usb_xhci_post_load(void *opaque, int version_id)
     uint32_t slot_ctx[4];
     uint32_t ep_ctx[5];
     int slotid, epid, state;
+    uint64_t addr;
 
     dcbaap = xhci_addr64(xhci->dcbaap_low, xhci->dcbaap_high);
 
@@ -3437,8 +3438,8 @@ static int usb_xhci_post_load(void *opaque, int version_id)
         if (!slot->addressed) {
             continue;
         }
-        slot->ctx = xhci_mask64(ldq_le_dma(xhci->as, dcbaap + 8 * slotid,
-                                           MEMTXATTRS_UNSPECIFIED));
+        ldq_le_dma(xhci->as, dcbaap + 8 * slotid, &addr, MEMTXATTRS_UNSPECIFIED);
+        slot->ctx = xhci_mask64(addr);
         xhci_dma_read_u32s(xhci, slot->ctx, slot_ctx, sizeof(slot_ctx));
         slot->uport = xhci_lookup_uport(xhci, slot_ctx);
         if (!slot->uport) {
-- 
2.33.1


