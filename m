Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B19CF3F1EE3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 19:18:13 +0200 (CEST)
Received: from localhost ([::1]:42288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGlgC-0004X5-P9
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 13:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGleD-0002UC-0u
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:16:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGleB-0000qX-4L
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:16:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629393366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OAHzBAmbVApY1o+QnWvkEcFu0dMTB1soFMwucFnim0U=;
 b=J0KC1QLHoPaw2U1v2WBJpm4/wOJxbhEFn/HwSVabrxECPtPuV/C11rilxsvfFCc2qKPCvo
 KYmKKRulCWCEHXHVGgnaAn8jRRN43FbEQKQi+6iopnHLZ+SAr9ZYHinbHlXQyXS3lc6vil
 punx6Ilr8CEe7R4v6RoK3RsZtvn4rwA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-zahKrkM_PziOKjXoGdZoig-1; Thu, 19 Aug 2021 13:16:05 -0400
X-MC-Unique: zahKrkM_PziOKjXoGdZoig-1
Received: by mail-wr1-f70.google.com with SMTP id
 z1-20020adfdf810000b0290154f7f8c412so1920041wrl.21
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 10:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OAHzBAmbVApY1o+QnWvkEcFu0dMTB1soFMwucFnim0U=;
 b=oafDcR6Ur2xTJ4dz1JA0X9ODJzgWXwIe23ayenfATvUZ6qzWQ51UFQK5agNP96mblq
 40IJfGqfsKA8ENmqjxqp3tPBV0TCIFEtXoFcNfOuz5POHo+9V5RMC/2/sSuIOuxGJSsg
 ybrPUUmGvmrBTXOimYlXxj0kkjjib8/OPGY1N0WCk6l7htTEuOUR3GRMV2aFcsKpxaJ/
 /SZKpaFdLur8mJQbvUxq8GisAeJ4ZFg7NKhcR+HmcUKAfqffn7Uuus/NQfFtUg56UV1M
 Sjs8qFdaBlDuPvRe+K5FclfPHXdAg25/vf62v2PPlFfGip56DP/qKhKQFN8w7gaS4ex2
 53rg==
X-Gm-Message-State: AOAM5339kaFzrUvtb739y2jVfmTvollPGV1fe2oKaM4kZvLPYp2NzY4K
 KUdpZ41LaKC8cFGpZg70uudno8HkYN7iwnLy3OZNDHYQXZqEUWEk/zh8pqU+tXlFTs4sHLPNCh2
 EpU9HOK6yznrftfkorOkBSOSD2qYdm8yFpFGv0A8uE6clatR1lA1llFEmOD10mgrt
X-Received: by 2002:adf:f141:: with SMTP id y1mr5181775wro.173.1629393363363; 
 Thu, 19 Aug 2021 10:16:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyshhncxDnsLvZxeSmqubxDfjoXBGsNe/dFrzgNKjZBFnqzvNy5o59Txez18wjv/QUrxP//Ew==
X-Received: by 2002:adf:f141:: with SMTP id y1mr5181744wro.173.1629393363117; 
 Thu, 19 Aug 2021 10:16:03 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 p18sm3425902wrt.13.2021.08.19.10.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 10:16:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] hw/usb/xhci: Always expect 'dma' link property to be
 set
Date: Thu, 19 Aug 2021 19:15:47 +0200
Message-Id: <20210819171547.2879725-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819171547.2879725-1-philmd@redhat.com>
References: <20210819171547.2879725-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify by always passing a MemoryRegion property to the device.
Doing so we can move the AddressSpace field to the device struct,
removing need for heap allocation.

Update the MicroVM machine to pass the default system memory instead
of a NULL value.

We don't need to change the Versal machine, as the link property is
initialize as "versal.dwc3_alias" MemoryRegion alias.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Versal untested
---
 hw/usb/hcd-xhci.h        |  2 +-
 hw/i386/microvm.c        |  2 ++
 hw/usb/hcd-xhci-pci.c    |  3 ++-
 hw/usb/hcd-xhci-sysbus.c | 13 ++++++-------
 hw/usb/hcd-xhci.c        | 20 ++++++++++----------
 5 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
index 98f598382ad..ea76ec4f277 100644
--- a/hw/usb/hcd-xhci.h
+++ b/hw/usb/hcd-xhci.h
@@ -180,7 +180,7 @@ typedef struct XHCIState {
     USBBus bus;
     MemoryRegion mem;
     MemoryRegion *dma_mr;
-    AddressSpace *as;
+    AddressSpace as;
     MemoryRegion mem_cap;
     MemoryRegion mem_oper;
     MemoryRegion mem_runtime;
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index aba0c832190..642bf0d6811 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -219,6 +219,8 @@ static void microvm_devices_init(MicrovmMachineState *mms)
         qdev_prop_set_uint32(dev, "slots", XHCI_MAXSLOTS);
         qdev_prop_set_uint32(dev, "p2", 8);
         qdev_prop_set_uint32(dev, "p3", 8);
+        object_property_set_link(OBJECT(dev), "dma",
+                                 OBJECT(get_system_memory()), &error_fatal);
         sysbus_realize(SYS_BUS_DEVICE(dev), &error_fatal);
         sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, MICROVM_XHCI_BASE);
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0,
diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
index 71f6629ccde..a959943d856 100644
--- a/hw/usb/hcd-xhci-pci.c
+++ b/hw/usb/hcd-xhci-pci.c
@@ -116,6 +116,8 @@ static void usb_xhci_pci_realize(struct PCIDevice *dev, Error **errp)
     dev->config[0x60] = 0x30; /* release number */
 
     object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), &error_fatal);
+    object_property_set_link(OBJECT(dev), "dma",
+                             OBJECT(pci_dma_memory_region(dev)), &error_fatal);
     s->xhci.intr_update = xhci_pci_intr_update;
     s->xhci.intr_raise = xhci_pci_intr_raise;
     if (!qdev_realize(DEVICE(&s->xhci), NULL, errp)) {
@@ -161,7 +163,6 @@ static void usb_xhci_pci_realize(struct PCIDevice *dev, Error **errp)
                   &s->xhci.mem, 0, OFF_MSIX_PBA,
                   0x90, NULL);
     }
-    s->xhci.as = pci_get_address_space(dev);
 }
 
 static void usb_xhci_pci_exit(PCIDevice *dev)
diff --git a/hw/usb/hcd-xhci-sysbus.c b/hw/usb/hcd-xhci-sysbus.c
index a14e4381960..f212ce785bd 100644
--- a/hw/usb/hcd-xhci-sysbus.c
+++ b/hw/usb/hcd-xhci-sysbus.c
@@ -36,6 +36,11 @@ static void xhci_sysbus_realize(DeviceState *dev, Error **errp)
 {
     XHCISysbusState *s = XHCI_SYSBUS(dev);
 
+    if (!s->xhci.dma_mr) {
+        error_setg(errp, TYPE_XHCI_SYSBUS " 'dma' link not set");
+        return;
+    }
+
     object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), NULL);
     if (!qdev_realize(DEVICE(&s->xhci), NULL, errp)) {
         return;
@@ -43,13 +48,7 @@ static void xhci_sysbus_realize(DeviceState *dev, Error **errp)
     s->irq = g_new0(qemu_irq, s->xhci.numintrs);
     qdev_init_gpio_out_named(dev, s->irq, SYSBUS_DEVICE_GPIO_IRQ,
                              s->xhci.numintrs);
-    if (s->xhci.dma_mr) {
-        s->xhci.as =  g_malloc0(sizeof(AddressSpace));
-        address_space_init(s->xhci.as, s->xhci.dma_mr, NULL);
-    } else {
-        s->xhci.as = &address_space_memory;
-    }
-
+    address_space_init(&s->xhci.as, s->xhci.dma_mr, "usb-xhci-dma");
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->xhci.mem);
 }
 
diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index e01700039b1..011f1233ef3 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -487,7 +487,7 @@ static inline void xhci_dma_read_u32s(XHCIState *xhci, dma_addr_t addr,
 
     assert((len % sizeof(uint32_t)) == 0);
 
-    dma_memory_read(xhci->as, addr, buf, len);
+    dma_memory_read(&xhci->as, addr, buf, len);
 
     for (i = 0; i < (len / sizeof(uint32_t)); i++) {
         buf[i] = le32_to_cpu(buf[i]);
@@ -507,7 +507,7 @@ static inline void xhci_dma_write_u32s(XHCIState *xhci, dma_addr_t addr,
     for (i = 0; i < n; i++) {
         tmp[i] = cpu_to_le32(buf[i]);
     }
-    dma_memory_write(xhci->as, addr, tmp, len);
+    dma_memory_write(&xhci->as, addr, tmp, len);
 }
 
 static XHCIPort *xhci_lookup_port(XHCIState *xhci, struct USBPort *uport)
@@ -618,7 +618,7 @@ static void xhci_write_event(XHCIState *xhci, XHCIEvent *event, int v)
                                ev_trb.status, ev_trb.control);
 
     addr = intr->er_start + TRB_SIZE*intr->er_ep_idx;
-    dma_memory_write(xhci->as, addr, &ev_trb, TRB_SIZE);
+    dma_memory_write(&xhci->as, addr, &ev_trb, TRB_SIZE);
 
     intr->er_ep_idx++;
     if (intr->er_ep_idx >= intr->er_size) {
@@ -679,7 +679,7 @@ static TRBType xhci_ring_fetch(XHCIState *xhci, XHCIRing *ring, XHCITRB *trb,
 
     while (1) {
         TRBType type;
-        dma_memory_read(xhci->as, ring->dequeue, trb, TRB_SIZE);
+        dma_memory_read(&xhci->as, ring->dequeue, trb, TRB_SIZE);
         trb->addr = ring->dequeue;
         trb->ccs = ring->ccs;
         le64_to_cpus(&trb->parameter);
@@ -726,7 +726,7 @@ static int xhci_ring_chain_length(XHCIState *xhci, const XHCIRing *ring)
 
     while (1) {
         TRBType type;
-        dma_memory_read(xhci->as, dequeue, &trb, TRB_SIZE);
+        dma_memory_read(&xhci->as, dequeue, &trb, TRB_SIZE);
         le64_to_cpus(&trb.parameter);
         le32_to_cpus(&trb.status);
         le32_to_cpus(&trb.control);
@@ -781,7 +781,7 @@ static void xhci_er_reset(XHCIState *xhci, int v)
         xhci_die(xhci);
         return;
     }
-    dma_memory_read(xhci->as, erstba, &seg, sizeof(seg));
+    dma_memory_read(&xhci->as, erstba, &seg, sizeof(seg));
     le32_to_cpus(&seg.addr_low);
     le32_to_cpus(&seg.addr_high);
     le32_to_cpus(&seg.size);
@@ -1393,7 +1393,7 @@ static int xhci_xfer_create_sgl(XHCITransfer *xfer, int in_xfer)
     int i;
 
     xfer->int_req = false;
-    qemu_sglist_init(&xfer->sgl, DEVICE(xhci), xfer->trb_count, xhci->as);
+    qemu_sglist_init(&xfer->sgl, DEVICE(xhci), xfer->trb_count, &xhci->as);
     for (i = 0; i < xfer->trb_count; i++) {
         XHCITRB *trb = &xfer->trbs[i];
         dma_addr_t addr;
@@ -2059,7 +2059,7 @@ static TRBCCode xhci_address_slot(XHCIState *xhci, unsigned int slotid,
     assert(slotid >= 1 && slotid <= xhci->numslots);
 
     dcbaap = xhci_addr64(xhci->dcbaap_low, xhci->dcbaap_high);
-    poctx = ldq_le_dma(xhci->as, dcbaap + 8 * slotid);
+    poctx = ldq_le_dma(&xhci->as, dcbaap + 8 * slotid);
     ictx = xhci_mask64(pictx);
     octx = xhci_mask64(poctx);
 
@@ -2397,7 +2397,7 @@ static TRBCCode xhci_get_port_bandwidth(XHCIState *xhci, uint64_t pctx)
     /* TODO: actually implement real values here */
     bw_ctx[0] = 0;
     memset(&bw_ctx[1], 80, xhci->numports); /* 80% */
-    dma_memory_write(xhci->as, ctx, bw_ctx, sizeof(bw_ctx));
+    dma_memory_write(&xhci->as, ctx, bw_ctx, sizeof(bw_ctx));
 
     return CC_SUCCESS;
 }
@@ -3434,7 +3434,7 @@ static int usb_xhci_post_load(void *opaque, int version_id)
             continue;
         }
         slot->ctx =
-            xhci_mask64(ldq_le_dma(xhci->as, dcbaap + 8 * slotid));
+            xhci_mask64(ldq_le_dma(&xhci->as, dcbaap + 8 * slotid));
         xhci_dma_read_u32s(xhci, slot->ctx, slot_ctx, sizeof(slot_ctx));
         slot->uport = xhci_lookup_uport(xhci, slot_ctx);
         if (!slot->uport) {
-- 
2.31.1


