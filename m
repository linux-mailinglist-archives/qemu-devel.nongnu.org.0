Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CC1482141
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 02:25:42 +0100 (CET)
Received: from localhost ([::1]:44760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n36ft-0003Tc-96
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 20:25:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36EZ-0003Of-3v
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:57:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36EW-0003q2-Ra
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:57:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640912244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sS8ViVFx9vU6BoRnUKd9yhbqttFC6mc9+Op2YaMRDYs=;
 b=dWwpsfvUlqX0AU83xh7/f58Malr8kmceN6ZuK4ILAs7r1pVwJ/siTR/dg7bXtGqMNtmTZC
 CT8rUKdj8Z04N1IPirr+UbYoWLmJZ9hwDG+lWROuqadjRfP8WQx2vACkJA+LXBiE1je5Vf
 lX+9GsvCa07GdNbMA1oQmXPX29FZEsg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-Mkjyxn2yMzqAK2ovd9h-PA-1; Thu, 30 Dec 2021 19:57:23 -0500
X-MC-Unique: Mkjyxn2yMzqAK2ovd9h-PA-1
Received: by mail-ed1-f71.google.com with SMTP id
 q15-20020a056402518f00b003f87abf9c37so17983766edd.15
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:57:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sS8ViVFx9vU6BoRnUKd9yhbqttFC6mc9+Op2YaMRDYs=;
 b=blubgGsiFTl8b2K0a2kdLAkayqsUDBto7ofcayN6soHbXG6TAjnrxJh4N3kgJG1206
 2P5oR9nf+m8dHy4mHqDcAuLqvvDJHPsDYKP9lxNSHAjem+K3u86BerpWGFuEmLsI5y0I
 1f1h0IMkeD3AWqTfi5J+cVVEECb+WL9iMekWXpHuA9zjf7HcM0f/YzHZ/9q/8WFzmDPV
 CRnO2QtapRhWmyp/VMigIMxhfLJ5cxY709FoDg0ZrutV5n3zIXglwPfphDM4o8o74q98
 DBYpnumMb9FfXEKm9iLvnPt5LVDQjlcJzJCBxYVlP1Tz5JRjbJKiwBQWwRwQrAH+P8vS
 luAQ==
X-Gm-Message-State: AOAM532AxLpfM6Rrs12R0+JD7jey9s+YPWb0wmaFNec5Eykc3s/oj/09
 T6toJadi+MyF3j9saVRQ6vjSLJlQkXQKjWClghTw04xk6eZV/4gP9KI4FnZIlZp3fYfZJ2jRyNb
 q8mMV2FabrRBEmvlafOKSIFUAlMupr+0fwgDlYsu1HohXJeV/Iy5CWnUPYQ61Hs/p
X-Received: by 2002:a17:907:8a06:: with SMTP id
 sc6mr26388518ejc.214.1640912241630; 
 Thu, 30 Dec 2021 16:57:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6ibVnuPY4GlSyDOcAnwZZZPU10pLkkeMVmZrkgkjV4MELogdX/AenOPUep92zgaLuIngV8Q==
X-Received: by 2002:a17:907:8a06:: with SMTP id
 sc6mr26388503ejc.214.1640912241298; 
 Thu, 30 Dec 2021 16:57:21 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id o22sm10040527edw.50.2021.12.30.16.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 16:57:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/22] pci: Let ld*_pci_dma() take MemTxAttrs argument
Date: Fri, 31 Dec 2021 01:55:44 +0100
Message-Id: <20211231005546.723396-21-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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

Let devices specify transaction attributes when calling ld*_pci_dma().

Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211223115554.3155328-22-philmd@redhat.com>
---
 include/hw/pci/pci.h |  6 +++---
 hw/audio/intel-hda.c |  2 +-
 hw/net/eepro100.c    | 19 +++++++++++++------
 hw/net/tulip.c       | 18 ++++++++++--------
 hw/scsi/megasas.c    | 16 ++++++++++------
 hw/scsi/mptsas.c     | 10 ++++++----
 hw/scsi/vmw_pvscsi.c |  3 ++-
 hw/usb/hcd-xhci.c    |  1 +
 8 files changed, 46 insertions(+), 29 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 9f51ef2c3c2..7a46c1fa226 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -852,11 +852,11 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
 
 #define PCI_DMA_DEFINE_LDST(_l, _s, _bits)                              \
     static inline uint##_bits##_t ld##_l##_pci_dma(PCIDevice *dev,      \
-                                                   dma_addr_t addr)     \
+                                                   dma_addr_t addr, \
+                                                   MemTxAttrs attrs) \
     {                                                                   \
         uint##_bits##_t val; \
-        ld##_l##_dma(pci_get_address_space(dev), addr, &val, \
-                     MEMTXATTRS_UNSPECIFIED); \
+        ld##_l##_dma(pci_get_address_space(dev), addr, &val, attrs); \
         return val; \
     }                                                                   \
     static inline void st##_s##_pci_dma(PCIDevice *dev, \
diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index 3309ae0ea18..e34b7ab0e92 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -335,7 +335,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
 
         rp = (d->corb_rp + 1) & 0xff;
         addr = intel_hda_addr(d->corb_lbase, d->corb_ubase);
-        verb = ldl_le_pci_dma(&d->pci, addr + 4*rp);
+        verb = ldl_le_pci_dma(&d->pci, addr + 4 * rp, MEMTXATTRS_UNSPECIFIED);
         d->corb_rp = rp;
 
         dprint(d, 2, "%s: [rp 0x%x] verb 0x%08x\n", __func__, rp, verb);
diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 83c4431b1ad..eb82e9cb118 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -737,6 +737,7 @@ static void read_cb(EEPRO100State *s)
 
 static void tx_command(EEPRO100State *s)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     uint32_t tbd_array = s->tx.tbd_array_addr;
     uint16_t tcb_bytes = s->tx.tcb_bytes & 0x3fff;
     /* Sends larger than MAX_ETH_FRAME_SIZE are allowed, up to 2600 bytes. */
@@ -772,11 +773,14 @@ static void tx_command(EEPRO100State *s)
             /* Extended Flexible TCB. */
             for (; tbd_count < 2; tbd_count++) {
                 uint32_t tx_buffer_address = ldl_le_pci_dma(&s->dev,
-                                                            tbd_address);
+                                                            tbd_address,
+                                                            attrs);
                 uint16_t tx_buffer_size = lduw_le_pci_dma(&s->dev,
-                                                          tbd_address + 4);
+                                                          tbd_address + 4,
+                                                          attrs);
                 uint16_t tx_buffer_el = lduw_le_pci_dma(&s->dev,
-                                                        tbd_address + 6);
+                                                        tbd_address + 6,
+                                                        attrs);
                 tbd_address += 8;
                 TRACE(RXTX, logout
                     ("TBD (extended flexible mode): buffer address 0x%08x, size 0x%04x\n",
@@ -792,9 +796,12 @@ static void tx_command(EEPRO100State *s)
         }
         tbd_address = tbd_array;
         for (; tbd_count < s->tx.tbd_count; tbd_count++) {
-            uint32_t tx_buffer_address = ldl_le_pci_dma(&s->dev, tbd_address);
-            uint16_t tx_buffer_size = lduw_le_pci_dma(&s->dev, tbd_address + 4);
-            uint16_t tx_buffer_el = lduw_le_pci_dma(&s->dev, tbd_address + 6);
+            uint32_t tx_buffer_address = ldl_le_pci_dma(&s->dev, tbd_address,
+                                                        attrs);
+            uint16_t tx_buffer_size = lduw_le_pci_dma(&s->dev, tbd_address + 4,
+                                                      attrs);
+            uint16_t tx_buffer_el = lduw_le_pci_dma(&s->dev, tbd_address + 6,
+                                                    attrs);
             tbd_address += 8;
             TRACE(RXTX, logout
                 ("TBD (flexible mode): buffer address 0x%08x, size 0x%04x\n",
diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index 1f2c79dd58b..c76e4868f73 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -70,16 +70,18 @@ static const VMStateDescription vmstate_pci_tulip = {
 static void tulip_desc_read(TULIPState *s, hwaddr p,
         struct tulip_descriptor *desc)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
+
     if (s->csr[0] & CSR0_DBO) {
-        desc->status = ldl_be_pci_dma(&s->dev, p);
-        desc->control = ldl_be_pci_dma(&s->dev, p + 4);
-        desc->buf_addr1 = ldl_be_pci_dma(&s->dev, p + 8);
-        desc->buf_addr2 = ldl_be_pci_dma(&s->dev, p + 12);
+        desc->status = ldl_be_pci_dma(&s->dev, p, attrs);
+        desc->control = ldl_be_pci_dma(&s->dev, p + 4, attrs);
+        desc->buf_addr1 = ldl_be_pci_dma(&s->dev, p + 8, attrs);
+        desc->buf_addr2 = ldl_be_pci_dma(&s->dev, p + 12, attrs);
     } else {
-        desc->status = ldl_le_pci_dma(&s->dev, p);
-        desc->control = ldl_le_pci_dma(&s->dev, p + 4);
-        desc->buf_addr1 = ldl_le_pci_dma(&s->dev, p + 8);
-        desc->buf_addr2 = ldl_le_pci_dma(&s->dev, p + 12);
+        desc->status = ldl_le_pci_dma(&s->dev, p, attrs);
+        desc->control = ldl_le_pci_dma(&s->dev, p + 4, attrs);
+        desc->buf_addr1 = ldl_le_pci_dma(&s->dev, p + 8, attrs);
+        desc->buf_addr2 = ldl_le_pci_dma(&s->dev, p + 12, attrs);
     }
 }
 
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index b5e8b145c50..98b13708c13 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -202,7 +202,9 @@ static uint64_t megasas_frame_get_context(MegasasState *s,
                                           unsigned long frame)
 {
     PCIDevice *pci = &s->parent_obj;
-    return ldq_le_pci_dma(pci, frame + offsetof(struct mfi_frame_header, context));
+    return ldq_le_pci_dma(pci,
+                          frame + offsetof(struct mfi_frame_header, context),
+                          MEMTXATTRS_UNSPECIFIED);
 }
 
 static bool megasas_frame_is_ieee_sgl(MegasasCmd *cmd)
@@ -534,7 +536,8 @@ static MegasasCmd *megasas_enqueue_frame(MegasasState *s,
     s->busy++;
 
     if (s->consumer_pa) {
-        s->reply_queue_tail = ldl_le_pci_dma(pcid, s->consumer_pa);
+        s->reply_queue_tail = ldl_le_pci_dma(pcid, s->consumer_pa,
+                                             MEMTXATTRS_UNSPECIFIED);
     }
     trace_megasas_qf_enqueue(cmd->index, cmd->count, cmd->context,
                              s->reply_queue_head, s->reply_queue_tail, s->busy);
@@ -565,14 +568,14 @@ static void megasas_complete_frame(MegasasState *s, uint64_t context)
             stl_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset,
                            context, attrs);
         }
-        s->reply_queue_tail = ldl_le_pci_dma(pci_dev, s->consumer_pa);
+        s->reply_queue_tail = ldl_le_pci_dma(pci_dev, s->consumer_pa, attrs);
         trace_megasas_qf_complete(context, s->reply_queue_head,
                                   s->reply_queue_tail, s->busy);
     }
 
     if (megasas_intr_enabled(s)) {
         /* Update reply queue pointer */
-        s->reply_queue_tail = ldl_le_pci_dma(pci_dev, s->consumer_pa);
+        s->reply_queue_tail = ldl_le_pci_dma(pci_dev, s->consumer_pa, attrs);
         tail = s->reply_queue_head;
         s->reply_queue_head = megasas_next_index(s, tail, s->fw_cmds);
         trace_megasas_qf_update(s->reply_queue_head, s->reply_queue_tail,
@@ -637,6 +640,7 @@ static void megasas_abort_command(MegasasCmd *cmd)
 
 static int megasas_init_firmware(MegasasState *s, MegasasCmd *cmd)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     PCIDevice *pcid = PCI_DEVICE(s);
     uint32_t pa_hi, pa_lo;
     hwaddr iq_pa, initq_size = sizeof(struct mfi_init_qinfo);
@@ -675,9 +679,9 @@ static int megasas_init_firmware(MegasasState *s, MegasasCmd *cmd)
     pa_lo = le32_to_cpu(initq->pi_addr_lo);
     pa_hi = le32_to_cpu(initq->pi_addr_hi);
     s->producer_pa = ((uint64_t) pa_hi << 32) | pa_lo;
-    s->reply_queue_head = ldl_le_pci_dma(pcid, s->producer_pa);
+    s->reply_queue_head = ldl_le_pci_dma(pcid, s->producer_pa, attrs);
     s->reply_queue_head %= MEGASAS_MAX_FRAMES;
-    s->reply_queue_tail = ldl_le_pci_dma(pcid, s->consumer_pa);
+    s->reply_queue_tail = ldl_le_pci_dma(pcid, s->consumer_pa, attrs);
     s->reply_queue_tail %= MEGASAS_MAX_FRAMES;
     flags = le32_to_cpu(initq->flags);
     if (flags & MFI_QUEUE_FLAG_CONTEXT64) {
diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index f6c77655443..ac9f4dfcd2a 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -172,14 +172,15 @@ static const int mpi_request_sizes[] = {
 static dma_addr_t mptsas_ld_sg_base(MPTSASState *s, uint32_t flags_and_length,
                                     dma_addr_t *sgaddr)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     PCIDevice *pci = (PCIDevice *) s;
     dma_addr_t addr;
 
     if (flags_and_length & MPI_SGE_FLAGS_64_BIT_ADDRESSING) {
-        addr = ldq_le_pci_dma(pci, *sgaddr + 4);
+        addr = ldq_le_pci_dma(pci, *sgaddr + 4, attrs);
         *sgaddr += 12;
     } else {
-        addr = ldl_le_pci_dma(pci, *sgaddr + 4);
+        addr = ldl_le_pci_dma(pci, *sgaddr + 4, attrs);
         *sgaddr += 8;
     }
     return addr;
@@ -203,7 +204,7 @@ static int mptsas_build_sgl(MPTSASState *s, MPTSASRequest *req, hwaddr addr)
         dma_addr_t addr, len;
         uint32_t flags_and_length;
 
-        flags_and_length = ldl_le_pci_dma(pci, sgaddr);
+        flags_and_length = ldl_le_pci_dma(pci, sgaddr, MEMTXATTRS_UNSPECIFIED);
         len = flags_and_length & MPI_SGE_LENGTH_MASK;
         if ((flags_and_length & MPI_SGE_FLAGS_ELEMENT_TYPE_MASK)
             != MPI_SGE_FLAGS_SIMPLE_ELEMENT ||
@@ -234,7 +235,8 @@ static int mptsas_build_sgl(MPTSASState *s, MPTSASRequest *req, hwaddr addr)
                 break;
             }
 
-            flags_and_length = ldl_le_pci_dma(pci, next_chain_addr);
+            flags_and_length = ldl_le_pci_dma(pci, next_chain_addr,
+                                              MEMTXATTRS_UNSPECIFIED);
             if ((flags_and_length & MPI_SGE_FLAGS_ELEMENT_TYPE_MASK)
                 != MPI_SGE_FLAGS_CHAIN_ELEMENT) {
                 return MPI_IOCSTATUS_INVALID_SGL;
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index 59c3e8ba048..33e16f91116 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -52,7 +52,8 @@
 
 #define RS_GET_FIELD(m, field) \
     (ldl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj, \
-                 (m)->rs_pa + offsetof(struct PVSCSIRingsState, field)))
+                 (m)->rs_pa + offsetof(struct PVSCSIRingsState, field), \
+                 MEMTXATTRS_UNSPECIFIED))
 #define RS_SET_FIELD(m, field, val) \
     (stl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj, \
                  (m)->rs_pa + offsetof(struct PVSCSIRingsState, field), val, \
diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index da5a4072107..14bdb896768 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -3440,6 +3440,7 @@ static int usb_xhci_post_load(void *opaque, int version_id)
         }
         ldq_le_dma(xhci->as, dcbaap + 8 * slotid, &addr, MEMTXATTRS_UNSPECIFIED);
         slot->ctx = xhci_mask64(addr);
+
         xhci_dma_read_u32s(xhci, slot->ctx, slot_ctx, sizeof(slot_ctx));
         slot->uport = xhci_lookup_uport(xhci, slot_ctx);
         if (!slot->uport) {
-- 
2.33.1


