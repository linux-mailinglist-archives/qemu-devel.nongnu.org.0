Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5361448213A
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 02:17:40 +0100 (CET)
Received: from localhost ([::1]:59684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n36Y7-0002az-B8
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 20:17:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36Ej-0003tJ-DF
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:57:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36Eh-0003wf-6W
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:57:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640912253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g5KO5RB8afA4fBy3fxbE0nS0ip/QCDlb7ylGTbGpnEg=;
 b=LyVcfdiC/Klhtli9qtJNcUNSqKVqL98R1uS1lh0QyveCJJe2xl/KumefWjz1n0DbVRDGaV
 W2ffh6O+xysrxcJc8SQ0T48CwIZPIwC0ly/QBYICpPLZ78aqolLbmjO4/yBipnUG5UpZYB
 zvRAjC+k7HkFN8YeJW5Ln3uTOw7Ih8U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-FuWdTPJ1PHyTzsrhFuBtrg-1; Thu, 30 Dec 2021 19:57:32 -0500
X-MC-Unique: FuWdTPJ1PHyTzsrhFuBtrg-1
Received: by mail-ed1-f70.google.com with SMTP id
 z8-20020a056402274800b003f8580bfb99so18045851edd.11
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:57:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g5KO5RB8afA4fBy3fxbE0nS0ip/QCDlb7ylGTbGpnEg=;
 b=smn5dU5K2BlAq/uFkXceBaQL3hzvczBVFvLWb+mL2iPfCybdWmW67tzAgKmEm/s01P
 /lamvlXHZjaLdCf/q4H0A4nwvEHgERCF0+SysrjrK13NJPkPhToNFXY398TptL0YtYUc
 Q9US5/1mepnBvCx2LMWxiSDzWXLxRGFSHkqgqvRjVLdDyhRHvjpHPy1GklQrJN3M3Emq
 KIszGfIJTTbTpeuI92xsLpgwrxgGnoXz3BCoucvcAYFxPdv9HtYPZbASrwsaImXotraP
 sGOhOWQ0GGF02K1pd4JguZ5an9DFePzwA6yLSdSd+xEu9+qWhcXWGxe1a9Hq1RGF4oaI
 d5cg==
X-Gm-Message-State: AOAM532Cr3sAgZGFCylmg8KUilZj1nN+4+OBw3WFzVYbRbYJMfhyCWa1
 XTI16ecqNx1+Idluz70eV+vQA5Ihweelm1H4twsCAujXaGiH05d5YmmOJHOU+obWqVNV16Fd28b
 NSZuF6QgxCF4IL5o8UBIHIY3J94sem5pPksa+vRA1yD6wQyi8xIiRNY1bBkkZoc0P
X-Received: by 2002:a17:907:2cc4:: with SMTP id
 hg4mr26207006ejc.150.1640912250766; 
 Thu, 30 Dec 2021 16:57:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRkDdXq2iglJiRTmnYSjyrxTa0KKzai1KQTgDimUBQleaRdDeHuCxNQ9lMREt5U+f1ZbdACA==
X-Received: by 2002:a17:907:2cc4:: with SMTP id
 hg4mr26206986ejc.150.1640912250396; 
 Thu, 30 Dec 2021 16:57:30 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id sc34sm8145177ejc.7.2021.12.30.16.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 16:57:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/22] pci: Let ld*_pci_dma() propagate MemTxResult
Date: Fri, 31 Dec 2021 01:55:46 +0100
Message-Id: <20211231005546.723396-23-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231005546.723396-1-philmd@redhat.com>
References: <20211231005546.723396-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ld*_dma() returns a MemTxResult type. Do not discard
it, return it to the caller.

Update the few callers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211223115554.3155328-24-philmd@redhat.com>
---
 include/hw/pci/pci.h | 17 ++++++++---------
 hw/audio/intel-hda.c |  2 +-
 hw/net/eepro100.c    | 25 ++++++++++---------------
 hw/net/tulip.c       | 16 ++++++++--------
 hw/scsi/megasas.c    | 21 ++++++++++++---------
 hw/scsi/mptsas.c     | 16 +++++++++++-----
 hw/scsi/vmw_pvscsi.c | 16 ++++++++++------
 7 files changed, 60 insertions(+), 53 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index c90cecc85c0..5b36334a28a 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -850,15 +850,14 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
                       DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECIFIED);
 }
 
-#define PCI_DMA_DEFINE_LDST(_l, _s, _bits)                              \
-    static inline uint##_bits##_t ld##_l##_pci_dma(PCIDevice *dev,      \
-                                                   dma_addr_t addr, \
-                                                   MemTxAttrs attrs) \
-    {                                                                   \
-        uint##_bits##_t val; \
-        ld##_l##_dma(pci_get_address_space(dev), addr, &val, attrs); \
-        return val; \
-    }                                                                   \
+#define PCI_DMA_DEFINE_LDST(_l, _s, _bits) \
+    static inline MemTxResult ld##_l##_pci_dma(PCIDevice *dev, \
+                                               dma_addr_t addr, \
+                                               uint##_bits##_t *val, \
+                                               MemTxAttrs attrs) \
+    { \
+        return ld##_l##_dma(pci_get_address_space(dev), addr, val, attrs); \
+    } \
     static inline MemTxResult st##_s##_pci_dma(PCIDevice *dev, \
                                                dma_addr_t addr, \
                                                uint##_bits##_t val, \
diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index e34b7ab0e92..2b55d521503 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -335,7 +335,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
 
         rp = (d->corb_rp + 1) & 0xff;
         addr = intel_hda_addr(d->corb_lbase, d->corb_ubase);
-        verb = ldl_le_pci_dma(&d->pci, addr + 4 * rp, MEMTXATTRS_UNSPECIFIED);
+        ldl_le_pci_dma(&d->pci, addr + 4 * rp, &verb, MEMTXATTRS_UNSPECIFIED);
         d->corb_rp = rp;
 
         dprint(d, 2, "%s: [rp 0x%x] verb 0x%08x\n", __func__, rp, verb);
diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index eb82e9cb118..679f52f80f1 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -769,18 +769,16 @@ static void tx_command(EEPRO100State *s)
     } else {
         /* Flexible mode. */
         uint8_t tbd_count = 0;
+        uint32_t tx_buffer_address;
+        uint16_t tx_buffer_size;
+        uint16_t tx_buffer_el;
+
         if (s->has_extended_tcb_support && !(s->configuration[6] & BIT(4))) {
             /* Extended Flexible TCB. */
             for (; tbd_count < 2; tbd_count++) {
-                uint32_t tx_buffer_address = ldl_le_pci_dma(&s->dev,
-                                                            tbd_address,
-                                                            attrs);
-                uint16_t tx_buffer_size = lduw_le_pci_dma(&s->dev,
-                                                          tbd_address + 4,
-                                                          attrs);
-                uint16_t tx_buffer_el = lduw_le_pci_dma(&s->dev,
-                                                        tbd_address + 6,
-                                                        attrs);
+                ldl_le_pci_dma(&s->dev, tbd_address, &tx_buffer_address, attrs);
+                lduw_le_pci_dma(&s->dev, tbd_address + 4, &tx_buffer_size, attrs);
+                lduw_le_pci_dma(&s->dev, tbd_address + 6, &tx_buffer_el, attrs);
                 tbd_address += 8;
                 TRACE(RXTX, logout
                     ("TBD (extended flexible mode): buffer address 0x%08x, size 0x%04x\n",
@@ -796,12 +794,9 @@ static void tx_command(EEPRO100State *s)
         }
         tbd_address = tbd_array;
         for (; tbd_count < s->tx.tbd_count; tbd_count++) {
-            uint32_t tx_buffer_address = ldl_le_pci_dma(&s->dev, tbd_address,
-                                                        attrs);
-            uint16_t tx_buffer_size = lduw_le_pci_dma(&s->dev, tbd_address + 4,
-                                                      attrs);
-            uint16_t tx_buffer_el = lduw_le_pci_dma(&s->dev, tbd_address + 6,
-                                                    attrs);
+            ldl_le_pci_dma(&s->dev, tbd_address, &tx_buffer_address, attrs);
+            lduw_le_pci_dma(&s->dev, tbd_address + 4, &tx_buffer_size, attrs);
+            lduw_le_pci_dma(&s->dev, tbd_address + 6, &tx_buffer_el, attrs);
             tbd_address += 8;
             TRACE(RXTX, logout
                 ("TBD (flexible mode): buffer address 0x%08x, size 0x%04x\n",
diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index c76e4868f73..d5b6cc5ee69 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -73,15 +73,15 @@ static void tulip_desc_read(TULIPState *s, hwaddr p,
     const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
 
     if (s->csr[0] & CSR0_DBO) {
-        desc->status = ldl_be_pci_dma(&s->dev, p, attrs);
-        desc->control = ldl_be_pci_dma(&s->dev, p + 4, attrs);
-        desc->buf_addr1 = ldl_be_pci_dma(&s->dev, p + 8, attrs);
-        desc->buf_addr2 = ldl_be_pci_dma(&s->dev, p + 12, attrs);
+        ldl_be_pci_dma(&s->dev, p, &desc->status, attrs);
+        ldl_be_pci_dma(&s->dev, p + 4, &desc->control, attrs);
+        ldl_be_pci_dma(&s->dev, p + 8, &desc->buf_addr1, attrs);
+        ldl_be_pci_dma(&s->dev, p + 12, &desc->buf_addr2, attrs);
     } else {
-        desc->status = ldl_le_pci_dma(&s->dev, p, attrs);
-        desc->control = ldl_le_pci_dma(&s->dev, p + 4, attrs);
-        desc->buf_addr1 = ldl_le_pci_dma(&s->dev, p + 8, attrs);
-        desc->buf_addr2 = ldl_le_pci_dma(&s->dev, p + 12, attrs);
+        ldl_le_pci_dma(&s->dev, p, &desc->status, attrs);
+        ldl_le_pci_dma(&s->dev, p + 4, &desc->control, attrs);
+        ldl_le_pci_dma(&s->dev, p + 8, &desc->buf_addr1, attrs);
+        ldl_le_pci_dma(&s->dev, p + 12, &desc->buf_addr2, attrs);
     }
 }
 
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 98b13708c13..dc9bbdb740e 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -202,9 +202,12 @@ static uint64_t megasas_frame_get_context(MegasasState *s,
                                           unsigned long frame)
 {
     PCIDevice *pci = &s->parent_obj;
-    return ldq_le_pci_dma(pci,
-                          frame + offsetof(struct mfi_frame_header, context),
-                          MEMTXATTRS_UNSPECIFIED);
+    uint64_t val;
+
+    ldq_le_pci_dma(pci, frame + offsetof(struct mfi_frame_header, context),
+                   &val, MEMTXATTRS_UNSPECIFIED);
+
+    return val;
 }
 
 static bool megasas_frame_is_ieee_sgl(MegasasCmd *cmd)
@@ -536,8 +539,8 @@ static MegasasCmd *megasas_enqueue_frame(MegasasState *s,
     s->busy++;
 
     if (s->consumer_pa) {
-        s->reply_queue_tail = ldl_le_pci_dma(pcid, s->consumer_pa,
-                                             MEMTXATTRS_UNSPECIFIED);
+        ldl_le_pci_dma(pcid, s->consumer_pa, &s->reply_queue_tail,
+                       MEMTXATTRS_UNSPECIFIED);
     }
     trace_megasas_qf_enqueue(cmd->index, cmd->count, cmd->context,
                              s->reply_queue_head, s->reply_queue_tail, s->busy);
@@ -568,14 +571,14 @@ static void megasas_complete_frame(MegasasState *s, uint64_t context)
             stl_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset,
                            context, attrs);
         }
-        s->reply_queue_tail = ldl_le_pci_dma(pci_dev, s->consumer_pa, attrs);
+        ldl_le_pci_dma(pci_dev, s->consumer_pa, &s->reply_queue_tail, attrs);
         trace_megasas_qf_complete(context, s->reply_queue_head,
                                   s->reply_queue_tail, s->busy);
     }
 
     if (megasas_intr_enabled(s)) {
         /* Update reply queue pointer */
-        s->reply_queue_tail = ldl_le_pci_dma(pci_dev, s->consumer_pa, attrs);
+        ldl_le_pci_dma(pci_dev, s->consumer_pa, &s->reply_queue_tail, attrs);
         tail = s->reply_queue_head;
         s->reply_queue_head = megasas_next_index(s, tail, s->fw_cmds);
         trace_megasas_qf_update(s->reply_queue_head, s->reply_queue_tail,
@@ -679,9 +682,9 @@ static int megasas_init_firmware(MegasasState *s, MegasasCmd *cmd)
     pa_lo = le32_to_cpu(initq->pi_addr_lo);
     pa_hi = le32_to_cpu(initq->pi_addr_hi);
     s->producer_pa = ((uint64_t) pa_hi << 32) | pa_lo;
-    s->reply_queue_head = ldl_le_pci_dma(pcid, s->producer_pa, attrs);
+    ldl_le_pci_dma(pcid, s->producer_pa, &s->reply_queue_head, attrs);
     s->reply_queue_head %= MEGASAS_MAX_FRAMES;
-    s->reply_queue_tail = ldl_le_pci_dma(pcid, s->consumer_pa, attrs);
+    ldl_le_pci_dma(pcid, s->consumer_pa, &s->reply_queue_tail, attrs);
     s->reply_queue_tail %= MEGASAS_MAX_FRAMES;
     flags = le32_to_cpu(initq->flags);
     if (flags & MFI_QUEUE_FLAG_CONTEXT64) {
diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index ac9f4dfcd2a..5181b0c0b0d 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -177,10 +177,16 @@ static dma_addr_t mptsas_ld_sg_base(MPTSASState *s, uint32_t flags_and_length,
     dma_addr_t addr;
 
     if (flags_and_length & MPI_SGE_FLAGS_64_BIT_ADDRESSING) {
-        addr = ldq_le_pci_dma(pci, *sgaddr + 4, attrs);
+        uint64_t addr64;
+
+        ldq_le_pci_dma(pci, *sgaddr + 4, &addr64, attrs);
+        addr = addr64;
         *sgaddr += 12;
     } else {
-        addr = ldl_le_pci_dma(pci, *sgaddr + 4, attrs);
+        uint32_t addr32;
+
+        ldl_le_pci_dma(pci, *sgaddr + 4, &addr32, attrs);
+        addr = addr32;
         *sgaddr += 8;
     }
     return addr;
@@ -204,7 +210,7 @@ static int mptsas_build_sgl(MPTSASState *s, MPTSASRequest *req, hwaddr addr)
         dma_addr_t addr, len;
         uint32_t flags_and_length;
 
-        flags_and_length = ldl_le_pci_dma(pci, sgaddr, MEMTXATTRS_UNSPECIFIED);
+        ldl_le_pci_dma(pci, sgaddr, &flags_and_length, MEMTXATTRS_UNSPECIFIED);
         len = flags_and_length & MPI_SGE_LENGTH_MASK;
         if ((flags_and_length & MPI_SGE_FLAGS_ELEMENT_TYPE_MASK)
             != MPI_SGE_FLAGS_SIMPLE_ELEMENT ||
@@ -235,8 +241,8 @@ static int mptsas_build_sgl(MPTSASState *s, MPTSASRequest *req, hwaddr addr)
                 break;
             }
 
-            flags_and_length = ldl_le_pci_dma(pci, next_chain_addr,
-                                              MEMTXATTRS_UNSPECIFIED);
+            ldl_le_pci_dma(pci, next_chain_addr, &flags_and_length,
+                           MEMTXATTRS_UNSPECIFIED);
             if ((flags_and_length & MPI_SGE_FLAGS_ELEMENT_TYPE_MASK)
                 != MPI_SGE_FLAGS_CHAIN_ELEMENT) {
                 return MPI_IOCSTATUS_INVALID_SGL;
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index 33e16f91116..4d9969f3b16 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -50,10 +50,10 @@
 #define PVSCSI_MAX_CMD_DATA_WORDS \
     (sizeof(PVSCSICmdDescSetupRings)/sizeof(uint32_t))
 
-#define RS_GET_FIELD(m, field) \
-    (ldl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj, \
+#define RS_GET_FIELD(pval, m, field) \
+    ldl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj, \
                  (m)->rs_pa + offsetof(struct PVSCSIRingsState, field), \
-                 MEMTXATTRS_UNSPECIFIED))
+                 pval, MEMTXATTRS_UNSPECIFIED)
 #define RS_SET_FIELD(m, field, val) \
     (stl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj, \
                  (m)->rs_pa + offsetof(struct PVSCSIRingsState, field), val, \
@@ -249,10 +249,11 @@ pvscsi_ring_cleanup(PVSCSIRingInfo *mgr)
 static hwaddr
 pvscsi_ring_pop_req_descr(PVSCSIRingInfo *mgr)
 {
-    uint32_t ready_ptr = RS_GET_FIELD(mgr, reqProdIdx);
+    uint32_t ready_ptr;
     uint32_t ring_size = PVSCSI_MAX_NUM_PAGES_REQ_RING
                             * PVSCSI_MAX_NUM_REQ_ENTRIES_PER_PAGE;
 
+    RS_GET_FIELD(&ready_ptr, mgr, reqProdIdx);
     if (ready_ptr != mgr->consumed_ptr
         && ready_ptr - mgr->consumed_ptr < ring_size) {
         uint32_t next_ready_ptr =
@@ -323,8 +324,11 @@ pvscsi_ring_flush_cmp(PVSCSIRingInfo *mgr)
 static bool
 pvscsi_ring_msg_has_room(PVSCSIRingInfo *mgr)
 {
-    uint32_t prodIdx = RS_GET_FIELD(mgr, msgProdIdx);
-    uint32_t consIdx = RS_GET_FIELD(mgr, msgConsIdx);
+    uint32_t prodIdx;
+    uint32_t consIdx;
+
+    RS_GET_FIELD(&prodIdx, mgr, msgProdIdx);
+    RS_GET_FIELD(&consIdx, mgr, msgConsIdx);
 
     return (prodIdx - consIdx) < (mgr->msg_len_mask + 1);
 }
-- 
2.33.1


