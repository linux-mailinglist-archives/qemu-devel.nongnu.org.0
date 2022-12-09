Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3957E6482F2
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 14:50:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3dkA-0006kL-7L; Fri, 09 Dec 2022 08:48:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3dk6-0006jC-2w
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:48:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3dk2-0004EL-7l
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:48:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670593688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i1sgAqV6nhIraV0RYvcOsNhIYfnXJAEk3Fjzn8T22yA=;
 b=dYnUTnhuYokkcFeHuzyxY14NuGkqC0X/7S9DD30MLQmNFG/PWVIF4qCYLSO8kuOCssfAag
 CDvpHsYbeS2R2XTWIYgetXalRtOhZyU33IaAwpwv+0cemO9paOEgI4dVlaHgW6bfwyCFXK
 mGYI2N0eaFN4dDXRgH/tUgTpgr7Twjs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-q2KtZiN6NFqKxEodEY0K4w-1; Fri, 09 Dec 2022 08:48:06 -0500
X-MC-Unique: q2KtZiN6NFqKxEodEY0K4w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62BEE8032FB;
 Fri,  9 Dec 2022 13:48:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9DC240C2065;
 Fri,  9 Dec 2022 13:48:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D7FD721E6930; Fri,  9 Dec 2022 14:48:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, ben.widawsky@intel.com,
 jonathan.cameron@huawei.com, philmd@linaro.org
Subject: [PATCH 1/5] include/hw/pci: Clean up superfluous inclusion of
 pci*/*.h cxl/*.h
Date: Fri,  9 Dec 2022 14:47:58 +0100
Message-Id: <20221209134802.3642942-2-armbru@redhat.com>
In-Reply-To: <20221209134802.3642942-1-armbru@redhat.com>
References: <20221209134802.3642942-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/alpha/alpha_sys.h              | 1 -
 hw/rdma/rdma_utils.h              | 1 -
 hw/rdma/vmw/pvrdma.h              | 1 -
 hw/usb/hcd-ehci.h                 | 1 -
 hw/xen/xen_pt.h                   | 1 -
 include/hw/cxl/cxl.h              | 1 -
 include/hw/cxl/cxl_cdat.h         | 1 +
 include/hw/cxl/cxl_device.h       | 1 +
 include/hw/cxl/cxl_pci.h          | 2 --
 include/hw/i386/ich9.h            | 4 ----
 include/hw/i386/x86-iommu.h       | 1 -
 include/hw/isa/vt82c686.h         | 1 -
 include/hw/pci-host/designware.h  | 3 ---
 include/hw/pci-host/i440fx.h      | 2 +-
 include/hw/pci-host/ls7a.h        | 2 --
 include/hw/pci-host/pnv_phb3.h    | 2 --
 include/hw/pci-host/pnv_phb4.h    | 3 +--
 include/hw/pci-host/xilinx-pcie.h | 1 -
 include/hw/pci/pcie.h             | 1 -
 include/hw/virtio/virtio-scsi.h   | 1 -
 hw/alpha/pci.c                    | 1 +
 hw/alpha/typhoon.c                | 2 +-
 hw/i386/acpi-build.c              | 2 +-
 hw/pci-bridge/i82801b11.c         | 2 +-
 hw/rdma/rdma_utils.c              | 1 +
 hw/scsi/virtio-scsi.c             | 1 +
 26 files changed, 10 insertions(+), 30 deletions(-)

diff --git a/hw/alpha/alpha_sys.h b/hw/alpha/alpha_sys.h
index 2263e821da..a303c58438 100644
--- a/hw/alpha/alpha_sys.h
+++ b/hw/alpha/alpha_sys.h
@@ -5,7 +5,6 @@
 
 #include "target/alpha/cpu-qom.h"
 #include "hw/pci/pci.h"
-#include "hw/pci/pci_host.h"
 #include "hw/boards.h"
 #include "hw/intc/i8259.h"
 
diff --git a/hw/rdma/rdma_utils.h b/hw/rdma/rdma_utils.h
index 0c6414e7e0..54e4f56edd 100644
--- a/hw/rdma/rdma_utils.h
+++ b/hw/rdma/rdma_utils.h
@@ -18,7 +18,6 @@
 #define RDMA_UTILS_H
 
 #include "qemu/error-report.h"
-#include "hw/pci/pci.h"
 #include "sysemu/dma.h"
 
 #define rdma_error_report(fmt, ...) \
diff --git a/hw/rdma/vmw/pvrdma.h b/hw/rdma/vmw/pvrdma.h
index d08965d3e2..0caf95ede8 100644
--- a/hw/rdma/vmw/pvrdma.h
+++ b/hw/rdma/vmw/pvrdma.h
@@ -18,7 +18,6 @@
 
 #include "qemu/units.h"
 #include "qemu/notify.h"
-#include "hw/pci/pci.h"
 #include "hw/pci/msix.h"
 #include "chardev/char-fe.h"
 #include "hw/net/vmxnet3_defs.h"
diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
index a173707d9b..4d4b2830b7 100644
--- a/hw/usb/hcd-ehci.h
+++ b/hw/usb/hcd-ehci.h
@@ -23,7 +23,6 @@
 #include "sysemu/dma.h"
 #include "hw/pci/pci.h"
 #include "hw/sysbus.h"
-#include "qom/object.h"
 
 #ifndef EHCI_DEBUG
 #define EHCI_DEBUG   0
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index e7c4316a7d..cf10fc7bbf 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -2,7 +2,6 @@
 #define XEN_PT_H
 
 #include "hw/xen/xen_common.h"
-#include "hw/pci/pci.h"
 #include "xen-host-pci-device.h"
 #include "qom/object.h"
 
diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 38e0e271d5..5129557bee 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -13,7 +13,6 @@
 
 #include "qapi/qapi-types-machine.h"
 #include "qapi/qapi-visit-machine.h"
-#include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_host.h"
 #include "cxl_pci.h"
 #include "cxl_component.h"
diff --git a/include/hw/cxl/cxl_cdat.h b/include/hw/cxl/cxl_cdat.h
index e9eda00142..7f67638685 100644
--- a/include/hw/cxl/cxl_cdat.h
+++ b/include/hw/cxl/cxl_cdat.h
@@ -11,6 +11,7 @@
 #define CXL_CDAT_H
 
 #include "hw/cxl/cxl_pci.h"
+#include "hw/pci/pcie_doe.h"
 
 /*
  * Reference:
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 449b0edfe9..fd475b947b 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -10,6 +10,7 @@
 #ifndef CXL_DEVICE_H
 #define CXL_DEVICE_H
 
+#include "hw/pci/pci.h"
 #include "hw/register.h"
 
 /*
diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
index 3cb79eca1e..aca14845ab 100644
--- a/include/hw/cxl/cxl_pci.h
+++ b/include/hw/cxl/cxl_pci.h
@@ -11,8 +11,6 @@
 #define CXL_PCI_H
 
 #include "qemu/compiler.h"
-#include "hw/pci/pci.h"
-#include "hw/pci/pcie.h"
 #include "hw/cxl/cxl_cdat.h"
 
 #define CXL_VENDOR_ID 0x1e98
diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index 23ee8e371b..222781e8b9 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -5,12 +5,8 @@
 #include "hw/sysbus.h"
 #include "hw/i386/pc.h"
 #include "hw/isa/apm.h"
-#include "hw/pci/pci.h"
-#include "hw/pci/pcie_host.h"
-#include "hw/pci/pci_bridge.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/ich9.h"
-#include "hw/pci/pci_bus.h"
 #include "qom/object.h"
 
 void ich9_lpc_set_irq(void *opaque, int irq_num, int level);
diff --git a/include/hw/i386/x86-iommu.h b/include/hw/i386/x86-iommu.h
index 7637edb430..8d8d53b18b 100644
--- a/include/hw/i386/x86-iommu.h
+++ b/include/hw/i386/x86-iommu.h
@@ -21,7 +21,6 @@
 #define HW_I386_X86_IOMMU_H
 
 #include "hw/sysbus.h"
-#include "hw/pci/pci.h"
 #include "hw/pci/msi.h"
 #include "qom/object.h"
 
diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index eaa07881c5..e273cd38dc 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -1,7 +1,6 @@
 #ifndef HW_VT82C686_H
 #define HW_VT82C686_H
 
-#include "hw/pci/pci.h"
 
 #define TYPE_VT82C686B_ISA "vt82c686b-isa"
 #define TYPE_VT82C686B_USB_UHCI "vt82c686b-usb-uhci"
diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
index 6d9b51ae67..908f3d946b 100644
--- a/include/hw/pci-host/designware.h
+++ b/include/hw/pci-host/designware.h
@@ -22,9 +22,6 @@
 #define DESIGNWARE_H
 
 #include "hw/sysbus.h"
-#include "hw/pci/pci.h"
-#include "hw/pci/pci_bus.h"
-#include "hw/pci/pcie_host.h"
 #include "hw/pci/pci_bridge.h"
 #include "qom/object.h"
 
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index d02bf1ed6b..fc93e22732 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -11,7 +11,7 @@
 #ifndef HW_PCI_I440FX_H
 #define HW_PCI_I440FX_H
 
-#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci.h"
 #include "hw/pci-host/pam.h"
 #include "qom/object.h"
 
diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
index df7fa55a30..b27db8e2ca 100644
--- a/include/hw/pci-host/ls7a.h
+++ b/include/hw/pci-host/ls7a.h
@@ -8,8 +8,6 @@
 #ifndef HW_LS7A_H
 #define HW_LS7A_H
 
-#include "hw/pci/pci.h"
-#include "hw/pci/pcie_host.h"
 #include "hw/pci-host/pam.h"
 #include "qemu/units.h"
 #include "qemu/range.h"
diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index 4854f6d2f6..f791ebda9b 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -10,8 +10,6 @@
 #ifndef PCI_HOST_PNV_PHB3_H
 #define PCI_HOST_PNV_PHB3_H
 
-#include "hw/pci/pcie_host.h"
-#include "hw/pci/pcie_port.h"
 #include "hw/ppc/xics.h"
 #include "qom/object.h"
 #include "hw/pci-host/pnv_phb.h"
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 50d4faa001..d9cea3f952 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -10,8 +10,7 @@
 #ifndef PCI_HOST_PNV_PHB4_H
 #define PCI_HOST_PNV_PHB4_H
 
-#include "hw/pci/pcie_host.h"
-#include "hw/pci/pcie_port.h"
+#include "hw/pci/pci_bus.h"
 #include "hw/ppc/xive.h"
 #include "qom/object.h"
 
diff --git a/include/hw/pci-host/xilinx-pcie.h b/include/hw/pci-host/xilinx-pcie.h
index 89be88d87f..e1b3c1c280 100644
--- a/include/hw/pci-host/xilinx-pcie.h
+++ b/include/hw/pci-host/xilinx-pcie.h
@@ -21,7 +21,6 @@
 #define HW_XILINX_PCIE_H
 
 #include "hw/sysbus.h"
-#include "hw/pci/pci.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pcie_host.h"
 #include "qom/object.h"
diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
index 698d3de851..798a262a0a 100644
--- a/include/hw/pci/pcie.h
+++ b/include/hw/pci/pcie.h
@@ -26,7 +26,6 @@
 #include "hw/pci/pcie_aer.h"
 #include "hw/pci/pcie_sriov.h"
 #include "hw/hotplug.h"
-#include "hw/pci/pcie_doe.h"
 
 typedef enum {
     /* for attention and power indicator */
diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
index a36aad9c86..37b75e15e3 100644
--- a/include/hw/virtio/virtio-scsi.h
+++ b/include/hw/virtio/virtio-scsi.h
@@ -20,7 +20,6 @@
 #define VIRTIO_SCSI_SENSE_SIZE 0
 #include "standard-headers/linux/virtio_scsi.h"
 #include "hw/virtio/virtio.h"
-#include "hw/pci/pci.h"
 #include "hw/scsi/scsi.h"
 #include "chardev/char-fe.h"
 #include "sysemu/iothread.h"
diff --git a/hw/alpha/pci.c b/hw/alpha/pci.c
index 72251fcdf0..7c18297177 100644
--- a/hw/alpha/pci.c
+++ b/hw/alpha/pci.c
@@ -7,6 +7,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/pci/pci_host.h"
 #include "alpha_sys.h"
 #include "qemu/log.h"
 #include "trace.h"
diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index bd39c8ca86..49a80550c5 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -10,10 +10,10 @@
 #include "qemu/module.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
+#include "hw/pci/pci_host.h"
 #include "cpu.h"
 #include "hw/irq.h"
 #include "alpha_sys.h"
-#include "qom/object.h"
 
 
 #define TYPE_TYPHOON_PCI_HOST_BRIDGE "typhoon-pcihost"
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d9eaa5fc4d..b75d1507f9 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -27,7 +27,7 @@
 #include "acpi-common.h"
 #include "qemu/bitmap.h"
 #include "qemu/error-report.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_bridge.h"
 #include "hw/cxl/cxl.h"
 #include "hw/core/cpu.h"
 #include "target/i386/cpu.h"
diff --git a/hw/pci-bridge/i82801b11.c b/hw/pci-bridge/i82801b11.c
index f28181e210..06f704a2e1 100644
--- a/hw/pci-bridge/i82801b11.c
+++ b/hw/pci-bridge/i82801b11.c
@@ -42,7 +42,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_bridge.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "hw/i386/ich9.h"
diff --git a/hw/rdma/rdma_utils.c b/hw/rdma/rdma_utils.c
index 5a7ef63ad2..77008552f4 100644
--- a/hw/rdma/rdma_utils.c
+++ b/hw/rdma/rdma_utils.c
@@ -14,6 +14,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/pci/pci.h"
 #include "trace.h"
 #include "rdma_utils.h"
 
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 6f6e2e32ba..2b649ca976 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -22,6 +22,7 @@
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "sysemu/block-backend.h"
+#include "sysemu/dma.h"
 #include "hw/qdev-properties.h"
 #include "hw/scsi/scsi.h"
 #include "scsi/constants.h"
-- 
2.37.3


