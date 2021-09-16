Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B81140DCAB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 16:27:10 +0200 (CEST)
Received: from localhost ([::1]:34250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQsM1-0000Qv-A9
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 10:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQs6J-0000dq-4j; Thu, 16 Sep 2021 10:10:56 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:43627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQs6B-0005yB-J1; Thu, 16 Sep 2021 10:10:50 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MTAS1-1mKWpP3yN5-00UX6E; Thu, 16
 Sep 2021 16:10:37 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/10] hw/vfio: Fix typo in comments
Date: Thu, 16 Sep 2021 16:10:24 +0200
Message-Id: <20210916141026.1174822-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916141026.1174822-1-laurent@vivier.eu>
References: <20210916141026.1174822-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VrWB5X7IyoMPnuYSfOUDEgSPmRtCoP5n95ohMEC14Cmz643FWiC
 fVujIF/+EW/r9icIr3O7HMwnIbAb1LMd4HEEE1xf9jc6hMb/1t+5OvSrSWLNBg39PStnFhp
 2MhpQOZiTebBGisOHbrcuHWzVf8ro4QFhRNZTV1GPWXZxPpo3xczFbG3YoJ7ZiT+Wd0w1jk
 Cxp91P85leEuYcSfW4z4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y4O4kfLDwa4=:g+ClptadPlm7ptw0DrhXv4
 Bczhkv8N6De8X8sswmuJpbYNG9mjDKlaEfOAhn8OUomFMJ9AcB/UTCB7ALAjNktB1BCd3fGxR
 N5t3wJSWQe2B1h6QS/6wlek+NU6BCU3J0oEYaN2leetwchuGyf9zlFm+vaeDaVuwVU+u6G9Ea
 zcSH6ldyDF+cRaEKCxTKDky3FC2doEu0BQUrF1ELEk4BbdbObI5LCCfNpN+DoA+npm55KwIpI
 FgthAloWlcWefQXGkJ4hd6QZmScRxTlQVxZgXHPlcQ1fMj86h0D27QwOqVei/WWCxKTZL6nZZ
 Y7ybqLjYFyhjEGvtuJkEpllhpOtswLah/2cSmHhrdiKlZpk5OdXRd6Qm5Xv2fGpLhPdLbdFPk
 nPF78vnrRpTuS5k1bm2L2rVUtTEvNy8Dt87Ypb9NRRwSctnlWhylyyXpsxGuZDEKkJD0FxIFc
 jCg5CPCzX3X0P8Y7E/ibw+jW19AtxisYaMAtwKkH4+Bd2ii76tODmAbouBz1g6EruJ3vbdxf/
 kiiuvd45FuLW6Ct2eJGMLcq9RTpu/R2Ud6mQG1zSHz1egVNhVh7PLVe9ROxf53yZGlz0zyHqT
 LomPe2zO/JU2ee2u5Opae0oDinihjzb1JTGikCBE1/BGzDPEEZhR9zpVCg4WdR88z3AjtKwlE
 FrGrBC7lPFvBVFJUs3D4StlU0tEaoivJ3HImt0o0WfF+X/tMJODCp2spAvSjmktmwMMtbewmb
 aij6aKPj1L6kxngBWxzd5jytWRbEIpE5wbN0xw==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Cai Huoqing <caihuoqing@baidu.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cai Huoqing <caihuoqing@baidu.com>

Fix typo in comments:
*programatically  ==> programmatically
*disconecting  ==> disconnecting
*mulitple  ==> multiple
*timout  ==> timeout
*regsiter  ==> register
*forumula  ==> formula

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210730012613.2198-1-caihuoqing@baidu.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/vfio/igd.c        | 2 +-
 hw/vfio/pci-quirks.c | 2 +-
 hw/vfio/pci.c        | 6 +++---
 hw/vfio/platform.c   | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/igd.c b/hw/vfio/igd.c
index 470205f487eb..d4685709a3b0 100644
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
index e21a6ede1140..0cf69a8c6d6f 100644
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
index e1ea1d8a23b5..4feaa1cb6888 100644
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
index cc3f66f7e44c..f8f08a0f362d 100644
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
2.31.1


