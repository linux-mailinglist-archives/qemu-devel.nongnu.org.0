Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6F93BFACA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:58:43 +0200 (CEST)
Received: from localhost ([::1]:56286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Tc2-0000Kh-Ox
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1m1TZK-0004MM-M5; Thu, 08 Jul 2021 08:55:54 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1m1TZF-0005eV-8V; Thu, 08 Jul 2021 08:55:54 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GLGQt46Gfzcb9x;
 Thu,  8 Jul 2021 20:52:22 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 8 Jul 2021 20:55:33 +0800
Received: from huawei.com (10.174.185.226) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 8 Jul 2021
 20:55:32 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH v5 9/9] docs: Add documentation for iommu bypass
Date: Thu, 8 Jul 2021 12:55:19 +0000
Message-ID: <1625748919-52456-10-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1625748919-52456-1-git-send-email-wangxingang5@huawei.com>
References: <1625748919-52456-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangxingang5@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: xieyingtai@huawei.com, wangxingang5@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
---
 docs/bypass-iommu.txt | 89 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 docs/bypass-iommu.txt

diff --git a/docs/bypass-iommu.txt b/docs/bypass-iommu.txt
new file mode 100644
index 0000000000..e6677bddd3
--- /dev/null
+++ b/docs/bypass-iommu.txt
@@ -0,0 +1,89 @@
+BYPASS IOMMU PROPERTY
+=====================
+
+Description
+===========
+Traditionally, there is a global switch to enable/disable vIOMMU. All
+devices in the system can only support go through vIOMMU or not, which
+is not flexible. We introduce this bypass iommu property to support
+coexist of devices go through vIOMMU and devices not. This is useful to
+passthrough devices with no-iommu mode and devices go through vIOMMU in
+the same virtual machine.
+
+PCI host bridges have a bypass_iommu property. This property is used to
+determine whether the devices attached on the PCI host bridge will bypass
+virtual iommu. The bypass_iommu property is valid only when there is a
+virtual iommu in the system, it is implemented to allow some devices to
+bypass vIOMMU. When bypass_iommu property is not set for a host bridge,
+the attached devices will go through vIOMMU by default.
+
+Usage
+=====
+The bypass iommu feature support PXB host bridge and default main host
+bridge, we add a bypass_iommu property for PXB and default_bus_bypass_iommu
+for machine. Note that default_bus_bypass_iommu is available only when
+the 'q35' machine type on x86 architecture and the 'virt' machine type
+on AArch64. Other machine types do not support bypass iommu for default
+root bus.
+
+1. The following is the bypass iommu options:
+ (1) PCI expander bridge
+     qemu -device pxb-pcie,bus_nr=0x10,addr=0x1,bypass_iommu=true
+ (2) Arm default host bridge
+     qemu -machine virt,iommu=smmuv3,default_bus_bypass_iommu=true
+ (3) X86 default root bus bypass iommu:
+     qemu -machine q35,default_bus_bypass_iommu=true
+
+2. Here is the detailed qemu command line for 'virt' machine with PXB on
+AArch64:
+
+qemu-system-aarch64 \
+ -machine virt,kernel_irqchip=on,iommu=smmuv3,default_bus_bypass_iommu=true \
+ -device pxb-pcie,bus_nr=0x10,id=pci.10,bus=pcie.0,addr=0x3.0x1 \
+ -device pxb-pcie,bus_nr=0x20,id=pci.20,bus=pcie.0,addr=0x3.0x2,bypass_iommu=true \
+
+And we got:
+ - a default host bridge which bypass SMMUv3
+ - a pxb host bridge which go through SMMUv3
+ - a pxb host bridge which bypass SMMUv3
+
+3. Here is the detailed qemu command line for 'q35' machine with PXB on
+x86 architecture:
+
+qemu-system-x86_64 \
+ -machine q35,accel=kvm,default_bus_bypass_iommu=true \
+ -device pxb-pcie,bus_nr=0x10,id=pci.10,bus=pcie.0,addr=0x3 \
+ -device pxb-pcie,bus_nr=0x20,id=pci.20,bus=pcie.0,addr=0x4,bypass_iommu=true \
+ -device intel-iommu \
+
+And we got:
+ - a default host bridge which bypass iommu
+ - a pxb host bridge which go through iommu
+ - a pxb host bridge which bypass iommu
+
+Limitations
+===========
+There might be potential security risk when devices bypass iommu, because
+devices might send malicious dma request to virtual machine if there is no
+iommu isolation. So it would be necessary to only bypass iommu for trusted
+device.
+
+Implementation
+==============
+The bypass iommu feature includes:
+ - Address space
+   Add bypass iommu property check of PCI Host and do not get iommu address
+   space for devices bypass iommu.
+ - Arm SMMUv3 support
+   We traverse all PCI root bus and get bus number ranges, then build explicit
+   RID mapping for devices which do not bypass iommu.
+ - X86 IOMMU support
+   To support Intel iommu, we traverse all PCI host bridge and get information
+   of devices which do not bypass iommu, then fill the DMAR drhd struct with
+   explicit device scope info. To support AMD iommu, add check of bypass iommu
+   when traverse the PCI hsot bridge.
+ - Machine and PXB options
+   We add bypass iommu options in machine option for default root bus, and add
+   option for PXB also. Note that the default value of bypass iommu is false,
+   so that the devices will by default go through iommu if there exist one.
+
-- 
2.19.1


