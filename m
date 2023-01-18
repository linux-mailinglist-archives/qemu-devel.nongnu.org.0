Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB5F67158C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 08:54:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI3Fa-0001vf-MH; Wed, 18 Jan 2023 02:52:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FY-0001tH-Bs; Wed, 18 Jan 2023 02:52:48 -0500
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FV-000230-VU; Wed, 18 Jan 2023 02:52:48 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MORIm-1p5UiC2avG-00PutN; Wed, 18
 Jan 2023 08:52:42 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 10/15] hw/i386/pc: Remove unused 'owner' argument from
 pc_pci_as_mapping_init
Date: Wed, 18 Jan 2023 08:52:29 +0100
Message-Id: <20230118075234.2322131-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118075234.2322131-1-laurent@vivier.eu>
References: <20230118075234.2322131-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:F0YiJPenFfWcYGA+MM30ktuEF6rYVafptZDUXIh6L4vyVxHLpKx
 7Ps4RVPIh1u4hlVV+duIGOd02Qw2FwP8uDHB+SXG9yxJ+ExFKs9WJ1/wnpa/R1cPbfaFhJD
 +aQn/9KjfzHxM1FzCX6xE03QEEW1EQtDyYWlgygZFTst0Y/GE7eKCYKE4v2BDQwWH1ctIkB
 3p5n+93pKvVkgGVQDQbMA==
UI-OutboundReport: notjunk:1;M01:P0:MBaRvVOEQEw=;lvSSvDIVhQWROAr54DTrr0ttxE9
 YRndgDTmKe6iHedgegVvsgVemhab9w7V0WViUGI4Qt5FwtBd6vp0DEediXUYxaYZrHwJVKC9j
 D1q5QPAhxUPd1SC8bDubhoV0jmctJKokxv4eT6xi81XZp2CMWknQq29h0ZF625vk225UYNT0o
 CcXMxSircQKc7HU2DfVWZ2LXgGdYmXpPpjC8vwYbaeLmQrnC0teqE93D/xr2O7GtJlLW6y/hs
 pY6ClVPI7ImFZLyQEDNFfs5I28y5YDop7fmraO+agSi4mwhcT1zNt0dPo3rIZhtNpoJkX3N/e
 A6hk5o6WwtIgZkthXBokb12JavgiMt/N97WtacRd3s8DoPV52p0/u7PrmnnQ0Nz3/TFz5Iv+E
 Xqhzln0AyL5/4Cm05Xj8kBiWY1hZx7WaRflTZw+/RTqtyrpx0P9hhnVP5cIYIKjcUWd8AYp7M
 E0TJjEEck2aJTUN5monBBtOSbn8W7Iej3Hjlzb3w145t+BjmvE4FayhfegyY+fYS2R+D2oRN4
 Htdhr0K6u1sgvgoyQQ5Ba8/R0PH3xisGSHSfI+2nyDy/5hWNQE6t/4aiuxKbWuv0ypQiCIu4F
 VnkslBlcEMIlCW+vxHP3oTLrdwZ3URN1AoqLzzBsOnYWZL7BJcJNbTh0rojxP6Ju+SxvguZCl
 g+RYN5lCpmvtHdSrmgZo8ivU9yuKTLc4lvjjEBsGEQ==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

This argument was added 9 years ago in commit 83d08f2673
("pc: map PCI address space as catchall region for not mapped
addresses") and has never been used since, so remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20230105173826.56748-1-philmd@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/i386/pc.c         | 2 +-
 hw/pci-host/i440fx.c | 3 +--
 hw/pci-host/q35.c    | 3 +--
 include/hw/i386/pc.h | 2 +-
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index d489ecc0d1cd..6e592bd969aa 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -782,7 +782,7 @@ void pc_guest_info_init(PCMachineState *pcms)
 }
 
 /* setup pci memory address space mapping into system address space */
-void pc_pci_as_mapping_init(Object *owner, MemoryRegion *system_memory,
+void pc_pci_as_mapping_init(MemoryRegion *system_memory,
                             MemoryRegion *pci_address_space)
 {
     /* Set to lower priority than RAM */
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index d5426ef4a53c..262f82c30380 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -272,8 +272,7 @@ PCIBus *i440fx_init(const char *pci_type,
                      IO_APIC_DEFAULT_ADDRESS - 1);
 
     /* setup pci memory mapping */
-    pc_pci_as_mapping_init(OBJECT(f), f->system_memory,
-                           f->pci_address_space);
+    pc_pci_as_mapping_init(f->system_memory, f->pci_address_space);
 
     /* if *disabled* show SMRAM to all CPUs */
     memory_region_init_alias(&f->smram_region, OBJECT(d), "smram-region",
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 20da1213747c..26390863d605 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -574,8 +574,7 @@ static void mch_realize(PCIDevice *d, Error **errp)
     }
 
     /* setup pci memory mapping */
-    pc_pci_as_mapping_init(OBJECT(mch), mch->system_memory,
-                           mch->pci_address_space);
+    pc_pci_as_mapping_init(mch->system_memory, mch->pci_address_space);
 
     /* if *disabled* show SMRAM to all CPUs */
     memory_region_init_alias(&mch->smram_region, OBJECT(mch), "smram-region",
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 991f905f5d25..88a120bc234b 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -156,7 +156,7 @@ void pc_guest_info_init(PCMachineState *pcms);
 #define PCI_HOST_ABOVE_4G_MEM_SIZE     "above-4g-mem-size"
 
 
-void pc_pci_as_mapping_init(Object *owner, MemoryRegion *system_memory,
+void pc_pci_as_mapping_init(MemoryRegion *system_memory,
                             MemoryRegion *pci_address_space);
 
 void xen_load_linux(PCMachineState *pcms);
-- 
2.38.1


