Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35713482123
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 02:04:05 +0100 (CET)
Received: from localhost ([::1]:39874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n36Ky-0005jR-6e
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 20:04:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36DS-0000pU-IV
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:56:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36DQ-0003XJ-QR
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:56:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640912175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dhtB8Rb0RJXvMfRyBEm0cUWmMJM45WEukPox89NA3XE=;
 b=Di8slJy1V+nqbIg+RpQ/TwwmHzQhBQXQY16DmXkssSdFaQZ02g3MG2oJ3HpXGAb/fMArJV
 /L6vVj/BDKFFE+sJ65Z7YjiWLpRn6p5PqLLDzEllXm2nB3kmiYDCWxpahEKIeo7OA/7KQp
 RkI4CUJxLlDKUJ4F8vlP4UmU3Bfl1mI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-wYO63b9BNr-6aSecgf13IQ-1; Thu, 30 Dec 2021 19:56:14 -0500
X-MC-Unique: wYO63b9BNr-6aSecgf13IQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 ay24-20020a056402203800b003f8491e499eso17987172edb.21
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:56:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dhtB8Rb0RJXvMfRyBEm0cUWmMJM45WEukPox89NA3XE=;
 b=Y5PE/1XxILwYcnlw14wnSuNL4zfdcF49mi31OSVzB/rhVJXV/f/Lti+AMb5RoQhJ4w
 Q/2LImOWvIbUYrzVgXnPNxUVPiCEczXoEz/4Q7cUV8SuCTB4nO37nDZUBOShzGAGxB2L
 yQbmkktdF90cdVGiT0eS6wZVRIhhdhkYE+FfLsVdQPK8EHdjzP32iyMlFfxz2/5bZj5M
 eIzyaghg6NY0ZZHn/S1qDSltLxePzPIXYw9W66MC7NYVrVap021mwFM2ngT9bNTetBC8
 ULjbg//Y7rIyvQKLgWp34+33CYTAT6b5w+xHDSSWleAf36Lr8sggftMQTrKo2K677jik
 VzlQ==
X-Gm-Message-State: AOAM530Dm30wyUvqpefKUtK3rYz3j6ujWfHLusjlrKCjbwa6iMGJq+0+
 az5pBrXXAZTvsL7A8bT/Ec/wPj5WT4l59xlv8Hl0bCN6VJVA21LxcqOa02wj0JB/0sozchl3nQx
 H6e1NmkGci++8C51G5SZy1vhT66j2l27hmEABOk/T7nkv3i7sIsmmIr3jMPuXRof3
X-Received: by 2002:a17:906:d554:: with SMTP id
 cr20mr26300874ejc.356.1640912173248; 
 Thu, 30 Dec 2021 16:56:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyK14Pqs0BBiVLQujaqWUNCKPuQIepLlNEhmUZCYTdUNe8gMVCpxUfD8MzMRtr0r+PfPcXcmQ==
X-Received: by 2002:a17:906:d554:: with SMTP id
 cr20mr26300854ejc.356.1640912172952; 
 Thu, 30 Dec 2021 16:56:12 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id mp9sm8066408ejc.106.2021.12.30.16.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 16:56:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/22] dma: Let dma_memory_rw() take MemTxAttrs argument
Date: Fri, 31 Dec 2021 01:55:29 +0100
Message-Id: <20211231005546.723396-6-philmd@redhat.com>
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Li Qiang <liq3ea@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let devices specify transaction attributes when calling
dma_memory_rw().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20211223115554.3155328-5-philmd@redhat.com>
---
 include/hw/pci/pci.h  |  3 ++-
 include/sysemu/dma.h  | 11 ++++++-----
 hw/intc/spapr_xive.c  |  3 ++-
 hw/usb/hcd-ohci.c     | 10 ++++++----
 softmmu/dma-helpers.c |  3 ++-
 5 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index e7cdf2d5ec5..4383f1c95e0 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -808,7 +808,8 @@ static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
                                      void *buf, dma_addr_t len,
                                      DMADirection dir)
 {
-    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len, dir);
+    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
+                         dir, MEMTXATTRS_UNSPECIFIED);
 }
 
 /**
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 3be803cf3ff..e8ad42226f6 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -121,15 +121,15 @@ static inline MemTxResult dma_memory_write_relaxed(AddressSpace *as,
  * @buf: buffer with the data transferred
  * @len: the number of bytes to read or write
  * @dir: indicates the transfer direction
+ * @attrs: memory transaction attributes
  */
 static inline MemTxResult dma_memory_rw(AddressSpace *as, dma_addr_t addr,
                                         void *buf, dma_addr_t len,
-                                        DMADirection dir)
+                                        DMADirection dir, MemTxAttrs attrs)
 {
     dma_barrier(as, dir);
 
-    return dma_memory_rw_relaxed(as, addr, buf, len, dir,
-                                 MEMTXATTRS_UNSPECIFIED);
+    return dma_memory_rw_relaxed(as, addr, buf, len, dir, attrs);
 }
 
 /**
@@ -147,7 +147,8 @@ static inline MemTxResult dma_memory_rw(AddressSpace *as, dma_addr_t addr,
 static inline MemTxResult dma_memory_read(AddressSpace *as, dma_addr_t addr,
                                           void *buf, dma_addr_t len)
 {
-    return dma_memory_rw(as, addr, buf, len, DMA_DIRECTION_TO_DEVICE);
+    return dma_memory_rw(as, addr, buf, len,
+                         DMA_DIRECTION_TO_DEVICE, MEMTXATTRS_UNSPECIFIED);
 }
 
 /**
@@ -166,7 +167,7 @@ static inline MemTxResult dma_memory_write(AddressSpace *as, dma_addr_t addr,
                                            const void *buf, dma_addr_t len)
 {
     return dma_memory_rw(as, addr, (void *)buf, len,
-                         DMA_DIRECTION_FROM_DEVICE);
+                         DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECIFIED);
 }
 
 /**
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 4ec659b93e1..eae95c716f1 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -1684,7 +1684,8 @@ static target_ulong h_int_esb(PowerPCCPU *cpu,
         mmio_addr = xive->vc_base + xive_source_esb_mgmt(xsrc, lisn) + offset;
 
         if (dma_memory_rw(&address_space_memory, mmio_addr, &data, 8,
-                          (flags & SPAPR_XIVE_ESB_STORE))) {
+                          (flags & SPAPR_XIVE_ESB_STORE),
+                          MEMTXATTRS_UNSPECIFIED)) {
             qemu_log_mask(LOG_GUEST_ERROR, "XIVE: failed to access ESB @0x%"
                           HWADDR_PRIx "\n", mmio_addr);
             return H_HARDWARE;
diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 1cf2816772c..56e2315c734 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -586,7 +586,8 @@ static int ohci_copy_td(OHCIState *ohci, struct ohci_td *td,
     if (n > len)
         n = len;
 
-    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf, n, dir)) {
+    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
+                      n, dir, MEMTXATTRS_UNSPECIFIED)) {
         return -1;
     }
     if (n == len) {
@@ -595,7 +596,7 @@ static int ohci_copy_td(OHCIState *ohci, struct ohci_td *td,
     ptr = td->be & ~0xfffu;
     buf += n;
     if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
-                      len - n, dir)) {
+                      len - n, dir, MEMTXATTRS_UNSPECIFIED)) {
         return -1;
     }
     return 0;
@@ -613,7 +614,8 @@ static int ohci_copy_iso_td(OHCIState *ohci,
     if (n > len)
         n = len;
 
-    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf, n, dir)) {
+    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
+                      n, dir, MEMTXATTRS_UNSPECIFIED)) {
         return -1;
     }
     if (n == len) {
@@ -622,7 +624,7 @@ static int ohci_copy_iso_td(OHCIState *ohci,
     ptr = end_addr & ~0xfffu;
     buf += n;
     if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
-                      len - n, dir)) {
+                      len - n, dir, MEMTXATTRS_UNSPECIFIED)) {
         return -1;
     }
     return 0;
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 1f07217ad4a..5bf76fff6bd 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -305,7 +305,8 @@ static uint64_t dma_buf_rw(uint8_t *ptr, int32_t len, QEMUSGList *sg,
     while (len > 0) {
         ScatterGatherEntry entry = sg->sg[sg_cur_index++];
         int32_t xfer = MIN(len, entry.len);
-        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir);
+        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir,
+                      MEMTXATTRS_UNSPECIFIED);
         ptr += xfer;
         len -= xfer;
         resid -= xfer;
-- 
2.33.1


