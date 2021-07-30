Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A903DB0A2
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 03:28:14 +0200 (CEST)
Received: from localhost ([::1]:35884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9HJt-0000i1-4K
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 21:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caihuoqing@baidu.com>)
 id 1m9HIR-0007T6-5w
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 21:26:43 -0400
Received: from mx20.baidu.com ([111.202.115.85]:49252 helo=baidu.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <caihuoqing@baidu.com>) id 1m9HIM-0002mg-9U
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 21:26:40 -0400
Received: from Bc-Mail-Ex13.internal.baidu.com (unknown [172.31.51.53])
 by Forcepoint Email with ESMTPS id 6CE625A7E7CFFDF330AE;
 Fri, 30 Jul 2021 09:26:28 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 Bc-Mail-Ex13.internal.baidu.com (172.31.51.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Fri, 30 Jul 2021 09:26:28 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Fri, 30 Jul 2021 09:26:28 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <alex.williamson@redhat.com>
Subject: [PATCH] hw/vfio: Fix typo in comments
Date: Fri, 30 Jul 2021 09:26:13 +0800
Message-ID: <20210730012613.2198-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex11.internal.baidu.com (10.127.64.34) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Received-SPF: pass client-ip=111.202.115.85; envelope-from=caihuoqing@baidu.com;
 helo=baidu.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Cai Huoqing <caihuoqing@baidu.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix typo in comments:
*programatically  ==> programmatically
*disconecting  ==> disconnecting
*mulitple  ==> multiple
*timout  ==> timeout
*regsiter  ==> register
*forumula  ==> formula

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 hw/vfio/igd.c        | 2 +-
 hw/vfio/pci-quirks.c | 2 +-
 hw/vfio/pci.c        | 6 +++---
 hw/vfio/platform.c   | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/igd.c b/hw/vfio/igd.c
index 470205f487..d4685709a3 100644
--- a/hw/vfio/igd.c
+++ b/hw/vfio/igd.c
@@ -557,7 +557,7 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
      * must allocate a 1MB aligned reserved memory region below 4GB with
      * the requested size (in bytes) for use by the Intel PCI class VGA
      * device at VM address 00:02.0.  The base address of this reserved
-     * memory region must be written to the device BDSM regsiter at PCI
+     * memory region must be written to the device BDSM register at PCI
      * config offset 0x5C.
      */
     bdsm_size = g_malloc(sizeof(*bdsm_size));
diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index e21a6ede11..0cf69a8c6d 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -1356,7 +1356,7 @@ static bool vfio_radeon_smc_is_running(VFIOPCIDevice *vdev)
 /*
  * The scope of a config reset is controlled by a mode bit in the misc register
  * and a fuse, exposed as a bit in another register.  The fuse is the default
- * (0 = GFX, 1 = whole GPU), the misc bit is a toggle, with the forumula
+ * (0 = GFX, 1 = whole GPU), the misc bit is a toggle, with the formula
  * scope = !(misc ^ fuse), where the resulting scope is defined the same as
  * the fuse.  A truth table therefore tells us that if misc == fuse, we need
  * to flip the value of the bit in the misc register.
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index e1ea1d8a23..4feaa1cb68 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1364,7 +1364,7 @@ static void vfio_pci_relocate_msix(VFIOPCIDevice *vdev, Error **errp)
          * TODO: Lookup table for known devices.
          *
          * Logically we might use an algorithm here to select the BAR adding
-         * the least additional MMIO space, but we cannot programatically
+         * the least additional MMIO space, but we cannot programmatically
          * predict the driver dependency on BAR ordering or sizing, therefore
          * 'auto' becomes a lookup for combinations reported to work.
          */
@@ -2158,7 +2158,7 @@ static void vfio_pci_pre_reset(VFIOPCIDevice *vdev)
     }
 
     /*
-     * Stop any ongoing DMA by disconecting I/O, MMIO, and bus master.
+     * Stop any ongoing DMA by disconnecting I/O, MMIO, and bus master.
      * Also put INTx Disable in known state.
      */
     cmd = vfio_pci_read_config(pdev, PCI_COMMAND, 2);
@@ -2384,7 +2384,7 @@ out_single:
 }
 
 /*
- * We want to differentiate hot reset of mulitple in-use devices vs hot reset
+ * We want to differentiate hot reset of multiple in-use devices vs hot reset
  * of a single in-use device.  VFIO_DEVICE_RESET will already handle the case
  * of doing hot resets when there is only a single device per bus.  The in-use
  * here refers to how many VFIODevices are affected.  A hot reset that affects
diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index cc3f66f7e4..f8f08a0f36 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -156,7 +156,7 @@ static void vfio_mmap_set_enabled(VFIOPlatformDevice *vdev, bool enabled)
  * if there is no more active IRQ
  * @opaque: actually points to the VFIO platform device
  *
- * Called on mmap timer timout, this function checks whether the
+ * Called on mmap timer timeout, this function checks whether the
  * IRQ is still active and if not, restores the fast path.
  * by construction a single eventfd is handled at a time.
  * if the IRQ is still active, the timer is re-programmed.
-- 
2.25.1


