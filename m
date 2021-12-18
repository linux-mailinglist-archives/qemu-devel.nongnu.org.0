Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC9F479B78
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 15:53:57 +0100 (CET)
Received: from localhost ([::1]:52964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myb5w-0007Tn-Qq
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 09:53:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myb3Y-0005Tk-FE
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 09:51:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myb3W-0001AM-QC
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 09:51:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639839086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bxXh1e9uR1KdSHTOMds7EyxV50BzcbCDpkVbWnbmGRU=;
 b=LF+DQuB6CAtbJpre1n27nEf4KG2qh3na60i5JoLemb2TxC6SHjtu3EjS2aWrgMhxfoQaaw
 +ljns/aDiNN+/cWem6il5sgEcTj6uzoAuuZnSqLITDhBDanwIa3V2XGll8Kq0ZUM4RFc/3
 q8YRfd9qsUMDF7QmDmnOrO3Of9Eo8fA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-3gxR6mYUP0CejUTZMOAY9g-1; Sat, 18 Dec 2021 09:51:25 -0500
X-MC-Unique: 3gxR6mYUP0CejUTZMOAY9g-1
Received: by mail-wr1-f72.google.com with SMTP id
 s23-20020adf9797000000b001a24674f0f7so1492463wrb.9
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 06:51:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bxXh1e9uR1KdSHTOMds7EyxV50BzcbCDpkVbWnbmGRU=;
 b=pILiGR8Ot/2nYx4cbV/ukGPTsfiOGdMVKIzw0Ce7fthgUXaoG+JxRMys7H5AGycDvr
 81XlwpJfY+Ew1JPOews6A7Vyay4GNPSQOyQA/nrk4c5InO/yTA8TdDFYQ6p8C/G8xb/v
 mB1LmkJlhdRAGaoq9syp4Jn+SBnRCN5UZdnzkCnvzNgn4AhiyCxIv+LPMo4djOo2/Swv
 erZuas4VQfpp1EptQb1tNsS6PUj1mjizEYVj25VAbSMSq2ZJIu53xDeamvvhgipW2f31
 GjNFSJ1Ig2EeQw86zm0GXV7bHDalr+3LKFDeS7INIQQcqK2uRK2qurC+INBKij4Samk2
 wfKQ==
X-Gm-Message-State: AOAM532rCryjC0gEjkPNOxBEg3hi6jKqAOeA06EZDGX85knCDsIuoDOD
 rN3X6OZHHw993qyf+PNCQY5R34HEC+OxE8chOJSnIgo2Psd1NS2ZA9K37ekFJHRTJ3Fecn928KZ
 YBgOi8havWRHhjNOOWYRO24+jTbrV1HGgWg4wZ8Klb9J6lpZ8Ba+ixtOVh7WSBYqJ
X-Received: by 2002:a05:600c:4e91:: with SMTP id
 f17mr7024748wmq.195.1639839083647; 
 Sat, 18 Dec 2021 06:51:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzL6TyP6/rkdxsCrYt4gNZ19Dy2WBm2NXceq2ru8HCXlZbolaZPYlQJ0NQwCf6LLBY7hPuYDA==
X-Received: by 2002:a05:600c:4e91:: with SMTP id
 f17mr7024714wmq.195.1639839083327; 
 Sat, 18 Dec 2021 06:51:23 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id t8sm13573464wmq.32.2021.12.18.06.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 06:51:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] dma: Let ld*_dma() take MemTxAttrs argument
Date: Sat, 18 Dec 2021 15:51:09 +0100
Message-Id: <20211218145111.1540114-3-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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

Let devices specify transaction attributes when calling ld*_dma().

Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci/pci.h       |  3 ++-
 include/hw/ppc/spapr_vio.h |  3 ++-
 include/sysemu/dma.h       | 11 ++++++-----
 hw/intc/pnv_xive.c         |  7 ++++---
 hw/usb/hcd-xhci.c          |  6 +++---
 5 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index d07e9707b48..0613308b1b6 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -854,7 +854,8 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
     static inline uint##_bits##_t ld##_l##_pci_dma(PCIDevice *dev,      \
                                                    dma_addr_t addr)     \
     {                                                                   \
-        return ld##_l##_dma(pci_get_address_space(dev), addr);          \
+        return ld##_l##_dma(pci_get_address_space(dev), addr,           \
+                            MEMTXATTRS_UNSPECIFIED);                    \
     }                                                                   \
     static inline void st##_s##_pci_dma(PCIDevice *dev,                 \
                                         dma_addr_t addr, uint##_bits##_t val) \
diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index e87f8e6f596..d2ec9b0637f 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -126,7 +126,8 @@ static inline int spapr_vio_dma_set(SpaprVioDevice *dev, uint64_t taddr,
         (stl_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
 #define vio_stq(_dev, _addr, _val) \
         (stq_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
-#define vio_ldq(_dev, _addr) (ldq_be_dma(&(_dev)->as, (_addr)))
+#define vio_ldq(_dev, _addr) \
+        (ldq_be_dma(&(_dev)->as, (_addr), MEMTXATTRS_UNSPECIFIED))
 
 int spapr_vio_send_crq(SpaprVioDevice *dev, uint8_t *crq);
 
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 2a60d2c5d61..b711d390a4f 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -242,10 +242,11 @@ static inline void dma_memory_unmap(AddressSpace *as,
 
 #define DEFINE_LDST_DMA(_lname, _sname, _bits, _end) \
     static inline uint##_bits##_t ld##_lname##_##_end##_dma(AddressSpace *as, \
-                                                            dma_addr_t addr) \
+                                                            dma_addr_t addr, \
+                                                            MemTxAttrs attrs) \
     {                                                                   \
         uint##_bits##_t val;                                            \
-        dma_memory_read(as, addr, &val, (_bits) / 8, MEMTXATTRS_UNSPECIFIED); \
+        dma_memory_read(as, addr, &val, (_bits) / 8, attrs); \
         return _end##_bits##_to_cpu(val);                               \
     }                                                                   \
     static inline void st##_sname##_##_end##_dma(AddressSpace *as,      \
@@ -254,14 +255,14 @@ static inline void dma_memory_unmap(AddressSpace *as,
                                                  MemTxAttrs attrs)      \
     {                                                                   \
         val = cpu_to_##_end##_bits(val);                                \
-        dma_memory_write(as, addr, &val, (_bits) / 8, attrs); \
+        dma_memory_write(as, addr, &val, (_bits) / 8, attrs);           \
     }
 
-static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr)
+static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr, MemTxAttrs attrs)
 {
     uint8_t val;
 
-    dma_memory_read(as, addr, &val, 1, MEMTXATTRS_UNSPECIFIED);
+    dma_memory_read(as, addr, &val, 1, attrs);
     return val;
 }
 
diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index ad43483612e..d9249bbc0c1 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -172,7 +172,7 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *xive, uint32_t type,
 
     /* Get the page size of the indirect table. */
     vsd_addr = vsd & VSD_ADDRESS_MASK;
-    vsd = ldq_be_dma(&address_space_memory, vsd_addr);
+    vsd = ldq_be_dma(&address_space_memory, vsd_addr, MEMTXATTRS_UNSPECIFIED);
 
     if (!(vsd & VSD_ADDRESS_MASK)) {
 #ifdef XIVE_DEBUG
@@ -195,7 +195,8 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *xive, uint32_t type,
     /* Load the VSD we are looking for, if not already done */
     if (vsd_idx) {
         vsd_addr = vsd_addr + vsd_idx * XIVE_VSD_SIZE;
-        vsd = ldq_be_dma(&address_space_memory, vsd_addr);
+        vsd = ldq_be_dma(&address_space_memory, vsd_addr,
+                         MEMTXATTRS_UNSPECIFIED);
 
         if (!(vsd & VSD_ADDRESS_MASK)) {
 #ifdef XIVE_DEBUG
@@ -542,7 +543,7 @@ static uint64_t pnv_xive_vst_per_subpage(PnvXive *xive, uint32_t type)
 
     /* Get the page size of the indirect table. */
     vsd_addr = vsd & VSD_ADDRESS_MASK;
-    vsd = ldq_be_dma(&address_space_memory, vsd_addr);
+    vsd = ldq_be_dma(&address_space_memory, vsd_addr, MEMTXATTRS_UNSPECIFIED);
 
     if (!(vsd & VSD_ADDRESS_MASK)) {
 #ifdef XIVE_DEBUG
diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index ed2b9ea456e..d960b814587 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -2062,7 +2062,7 @@ static TRBCCode xhci_address_slot(XHCIState *xhci, unsigned int slotid,
     assert(slotid >= 1 && slotid <= xhci->numslots);
 
     dcbaap = xhci_addr64(xhci->dcbaap_low, xhci->dcbaap_high);
-    poctx = ldq_le_dma(xhci->as, dcbaap + 8 * slotid);
+    poctx = ldq_le_dma(xhci->as, dcbaap + 8 * slotid, MEMTXATTRS_UNSPECIFIED);
     ictx = xhci_mask64(pictx);
     octx = xhci_mask64(poctx);
 
@@ -3437,8 +3437,8 @@ static int usb_xhci_post_load(void *opaque, int version_id)
         if (!slot->addressed) {
             continue;
         }
-        slot->ctx =
-            xhci_mask64(ldq_le_dma(xhci->as, dcbaap + 8 * slotid));
+        slot->ctx = xhci_mask64(ldq_le_dma(xhci->as, dcbaap + 8 * slotid,
+                                           MEMTXATTRS_UNSPECIFIED));
         xhci_dma_read_u32s(xhci, slot->ctx, slot_ctx, sizeof(slot_ctx));
         slot->uport = xhci_lookup_uport(xhci, slot_ctx);
         if (!slot->uport) {
-- 
2.33.1


