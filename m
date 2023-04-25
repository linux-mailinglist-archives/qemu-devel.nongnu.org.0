Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAB76EDD11
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:47:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDMw-0007xd-At; Tue, 25 Apr 2023 03:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMu-0007pB-Fj
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMs-0006mB-LU
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GtN4MhT1X0LAjc6r6BLfMyCLZv02rU9TJYnr4qhyY1Y=;
 b=hHpf+wYPmy6wNIiGKOj+p5Jp7IN9FF1BRRj2noLO+0uW9T/FsHVP4evcFsEYG4cZwX/M2i
 w8LhIj64xWlj/xgK8g8ZLnqdvIN3pADVIaquyuT6Ie7fiaBpTs5FJqqotXqZ33pCzKg84y
 VFSNNtMTFYNtNjsDQNsmqtsVCA+fLNg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-IDs_BSXyPwu0y16buWsZng-1; Tue, 25 Apr 2023 03:45:40 -0400
X-MC-Unique: IDs_BSXyPwu0y16buWsZng-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f17b8d24bbso33833635e9.2
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408738; x=1685000738;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GtN4MhT1X0LAjc6r6BLfMyCLZv02rU9TJYnr4qhyY1Y=;
 b=XEQDT95qum1BbF4S7yoJtqwyXFxZuyfnhVUaiZcSixDsqdV9gmO6C/zcPzwl+40bBO
 ATu0dS+2sBeixwyDs+qKJUOMoYl56HYA8wO2S/dW/hG6Qz+WxFyH0tWWYKJCq0VJiwxL
 1C9J7tX9x6YNwNAS6PZq2EVOuLsgRIwiIN9+oga+nV744b3SUCuJr0ln0BgySdOtJJsE
 sJH0DzMGp6YlRT9okTt9g/L0aqrHK1MJvCA29b/d/1piRpcByvho6MtTZrn6k/kDUNQK
 v5BUOXPSLh9carB7FDaxeLwI5NsPCBxydRVEQ2Mr5Fym+sZyQshyR55IE5Mab9Olzfl+
 76IQ==
X-Gm-Message-State: AAQBX9eykZ5NAyLVKjLZZWssBKFtA1+x51LGwXWUvfG/H+HgunLNdMyx
 Z7LpOQjkp7Itnd8/WgAa/CtK8rJZBcDLTv0QFj7dzHjHgLtoOVEW6gQbNRB7LVmrTWtsdQUznrO
 UP6RkMqG+fBerwgzOp4gazW+cPzG4Sk9JCiawiSe855sY1dosIctz9rGjk3jVdKbpOqtf
X-Received: by 2002:a1c:f407:0:b0:3f0:9564:f4f6 with SMTP id
 z7-20020a1cf407000000b003f09564f4f6mr9551530wma.1.1682408738334; 
 Tue, 25 Apr 2023 00:45:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZU+BT7CXRgK8q88fCP5mTsn/wZTkE98lcLy1W8drelsAz0RzXTRc7C4vilmTeke2hZ/30pgw==
X-Received: by 2002:a1c:f407:0:b0:3f0:9564:f4f6 with SMTP id
 z7-20020a1cf407000000b003f09564f4f6mr9551509wma.1.1682408738033; 
 Tue, 25 Apr 2023 00:45:38 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 c21-20020a7bc855000000b003f17300c7dcsm14069071wml.48.2023.04.25.00.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:45:37 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:45:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 14/31] hw/i386/amd_iommu: Factor amdvi_pci_realize out of
 amdvi_sysbus_realize
Message-ID: <5ec7755eb7c503fc66fe44083ee5113bd5b87bd9.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Aside the Frankenstein model of a SysBusDevice realizing a PCIDevice,
QOM parents shouldn't access children internals. In this particular
case, amdvi_sysbus_realize() is just open-coding TYPE_AMD_IOMMU_PCI's
DeviceRealize() handler. Factor it out.

Declare QOM-cast macros with OBJECT_DECLARE_SIMPLE_TYPE() so we can
cast the AMDVIPCIState in amdvi_pci_realize().

Note this commit removes the single use in the repository of
pci_add_capability() and msi_init() on a *realized* QDev instance.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230313153031.86107-7-philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/amd_iommu.h |  5 ++--
 hw/i386/amd_iommu.c | 62 ++++++++++++++++++++++++++-------------------
 2 files changed, 39 insertions(+), 28 deletions(-)

diff --git a/hw/i386/amd_iommu.h b/hw/i386/amd_iommu.h
index 1c0cb54bd4..6da893ee57 100644
--- a/hw/i386/amd_iommu.h
+++ b/hw/i386/amd_iommu.h
@@ -300,16 +300,17 @@ struct irte_ga {
 OBJECT_DECLARE_SIMPLE_TYPE(AMDVIState, AMD_IOMMU_DEVICE)
 
 #define TYPE_AMD_IOMMU_PCI "AMDVI-PCI"
+OBJECT_DECLARE_SIMPLE_TYPE(AMDVIPCIState, AMD_IOMMU_PCI)
 
 #define TYPE_AMD_IOMMU_MEMORY_REGION "amd-iommu-iommu-memory-region"
 
 typedef struct AMDVIAddressSpace AMDVIAddressSpace;
 
 /* functions to steal PCI config space */
-typedef struct AMDVIPCIState {
+struct AMDVIPCIState {
     PCIDevice dev;               /* The PCI device itself        */
     uint32_t capab_offset;       /* capability offset pointer    */
-} AMDVIPCIState;
+};
 
 struct AMDVIState {
     X86IOMMUState iommu;        /* IOMMU bus device             */
diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 8e4ce63f8e..9c77304438 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1509,20 +1509,48 @@ static void amdvi_init(AMDVIState *s)
     amdvi_set_quad(s, AMDVI_MMIO_EXT_FEATURES, AMDVI_EXT_FEATURES,
             0xffffffffffffffef, 0);
     amdvi_set_quad(s, AMDVI_MMIO_STATUS, 0, 0x98, 0x67);
+}
+
+static void amdvi_pci_realize(PCIDevice *pdev, Error **errp)
+{
+    AMDVIPCIState *s = AMD_IOMMU_PCI(pdev);
+    int ret;
+
+    ret = pci_add_capability(pdev, AMDVI_CAPAB_ID_SEC, 0,
+                             AMDVI_CAPAB_SIZE, errp);
+    if (ret < 0) {
+        return;
+    }
+    s->capab_offset = ret;
+
+    ret = pci_add_capability(pdev, PCI_CAP_ID_MSI, 0,
+                             AMDVI_CAPAB_REG_SIZE, errp);
+    if (ret < 0) {
+        return;
+    }
+    ret = pci_add_capability(pdev, PCI_CAP_ID_HT, 0,
+                             AMDVI_CAPAB_REG_SIZE, errp);
+    if (ret < 0) {
+        return;
+    }
+
+    if (msi_init(pdev, 0, 1, true, false, errp) < 0) {
+        return;
+    }
 
     /* reset device ident */
-    pci_config_set_prog_interface(s->pci.dev.config, 00);
+    pci_config_set_prog_interface(pdev->config, 0);
 
     /* reset AMDVI specific capabilities, all r/o */
-    pci_set_long(s->pci.dev.config + s->pci.capab_offset, AMDVI_CAPAB_FEATURES);
-    pci_set_long(s->pci.dev.config + s->pci.capab_offset + AMDVI_CAPAB_BAR_LOW,
+    pci_set_long(pdev->config + s->capab_offset, AMDVI_CAPAB_FEATURES);
+    pci_set_long(pdev->config + s->capab_offset + AMDVI_CAPAB_BAR_LOW,
                  AMDVI_BASE_ADDR & ~(0xffff0000));
-    pci_set_long(s->pci.dev.config + s->pci.capab_offset + AMDVI_CAPAB_BAR_HIGH,
+    pci_set_long(pdev->config + s->capab_offset + AMDVI_CAPAB_BAR_HIGH,
                 (AMDVI_BASE_ADDR & ~(0xffff)) >> 16);
-    pci_set_long(s->pci.dev.config + s->pci.capab_offset + AMDVI_CAPAB_RANGE,
+    pci_set_long(pdev->config + s->capab_offset + AMDVI_CAPAB_RANGE,
                  0xff000000);
-    pci_set_long(s->pci.dev.config + s->pci.capab_offset + AMDVI_CAPAB_MISC, 0);
-    pci_set_long(s->pci.dev.config + s->pci.capab_offset + AMDVI_CAPAB_MISC,
+    pci_set_long(pdev->config + s->capab_offset + AMDVI_CAPAB_MISC, 0);
+    pci_set_long(pdev->config + s->capab_offset + AMDVI_CAPAB_MISC,
             AMDVI_MAX_PH_ADDR | AMDVI_MAX_GVA_ADDR | AMDVI_MAX_VA_ADDR);
 }
 
@@ -1536,7 +1564,6 @@ static void amdvi_sysbus_reset(DeviceState *dev)
 
 static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
 {
-    int ret = 0;
     AMDVIState *s = AMD_IOMMU_DEVICE(dev);
     MachineState *ms = MACHINE(qdev_get_machine());
     PCMachineState *pcms = PC_MACHINE(ms);
@@ -1550,23 +1577,6 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
     if (!qdev_realize(DEVICE(&s->pci), &bus->qbus, errp)) {
         return;
     }
-    ret = pci_add_capability(&s->pci.dev, AMDVI_CAPAB_ID_SEC, 0,
-                                         AMDVI_CAPAB_SIZE, errp);
-    if (ret < 0) {
-        return;
-    }
-    s->pci.capab_offset = ret;
-
-    ret = pci_add_capability(&s->pci.dev, PCI_CAP_ID_MSI, 0,
-                             AMDVI_CAPAB_REG_SIZE, errp);
-    if (ret < 0) {
-        return;
-    }
-    ret = pci_add_capability(&s->pci.dev, PCI_CAP_ID_HT, 0,
-                             AMDVI_CAPAB_REG_SIZE, errp);
-    if (ret < 0) {
-        return;
-    }
 
     /* Pseudo address space under root PCI bus. */
     x86ms->ioapic_as = amdvi_host_dma_iommu(bus, s, AMDVI_IOAPIC_SB_DEVID);
@@ -1578,7 +1588,6 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->mmio);
     sysbus_mmio_map(SYS_BUS_DEVICE(s), 0, AMDVI_BASE_ADDR);
     pci_setup_iommu(bus, amdvi_host_dma_iommu, s);
-    msi_init(&s->pci.dev, 0, 1, true, false, errp);
     amdvi_init(s);
 }
 
@@ -1625,6 +1634,7 @@ static void amdvi_pci_class_init(ObjectClass *klass, void *data)
 
     k->vendor_id = PCI_VENDOR_ID_AMD;
     k->class_id = 0x0806;
+    k->realize = amdvi_pci_realize;
 
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     dc->desc = "AMD IOMMU (AMD-Vi) DMA Remapping device";
-- 
MST


