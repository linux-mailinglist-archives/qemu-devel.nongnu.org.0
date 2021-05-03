Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5F03712AC
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 10:51:32 +0200 (CEST)
Received: from localhost ([::1]:40834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUId-0007Li-Og
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 04:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4f-0003Vs-CS; Mon, 03 May 2021 04:37:07 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:42511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4J-0000mM-Ql; Mon, 03 May 2021 04:37:02 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MFbFW-1lmmfi2Qn8-00HAtD; Mon, 03
 May 2021 10:36:37 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 14/23] hw: Do not include qemu/log.h if it is not necessary
Date: Mon,  3 May 2021 10:36:14 +0200
Message-Id: <20210503083623.139700-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
References: <20210503083623.139700-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:p6MVxLB+T88LfUZMI+5oTGpGCSjd/hNkUKXXiiCT5rpVKKL26R3
 J0oiDOcI7IC+aSMEiR1nTdG68LJpmDKaPgNbCGonCVbmm32J7hgZ6eHULfuh6clobvTQewk
 Mf72ODcdbHLLC8Y38K6i5/kzET8w48ZrWuEOwOpYSzznkaEmMZRJS8SS6fa9x2DxtRti7hL
 ftFiGly+ShuQOmiOklytA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RJOpY+GBC2E=:FwdHMF9GZaQdfD+jiNM9MK
 1oY+CstaX18d3DgSjuUXLWNEcKYgY1Q+c88LCeeLpE5vCtTOaiiY7/Ec8vVbbVbMWYt2gHPdM
 36qj8qGSRIHYdUgcH/MQM/a5UjLEloO7u/kfDlhnvdrXrmpBMtIqlI84qbS+kUcwyZaTEEqLs
 FEVd6IuWTMAaH3OywNp34sJ6wm88JmFRKL/aHa+Adabbsp7OVM1TLcwSrC/ViVn4iHefjPzo1
 5J9fyF2gbairdnqvsEdldslQH4fs5qlMDYgsdM9QNNWpxhhUK0nosJF+t4qGGGjjW86FCmx8G
 B0aCg0bEs9pa99BkweVDleF5YfqnNq6eENp7AANJ8N7IGxwn4oHyKoBHG8rwIc/sIoOFfoAhI
 9VDTeN5TVVfdlu1b83zgIGZ+ZVpZakTBDrYpasWMA6wlpPa5zMyV+pWNMMVRMZFz39BFtKaXT
 WCrt0ttq9kcAoJy1NGChs6NnReRAeThBW86jqKMYzmdOoIOCDpBmNZNFYO60Ls3hCW+DEJVRg
 DMwoaefisl8j1eVUyMKtgU=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Thomas Huth <thuth@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Many files include qemu/log.h without needing it. Remove the superfluous
include statements.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210328054833.2351597-1-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/arm/aspeed.c                     | 1 -
 hw/arm/aspeed_ast2600.c             | 1 -
 hw/arm/aspeed_soc.c                 | 1 -
 hw/arm/exynos4210.c                 | 1 -
 hw/arm/xlnx-versal-virt.c           | 1 -
 hw/arm/xlnx-versal.c                | 1 -
 hw/i2c/mpc_i2c.c                    | 1 -
 hw/intc/imx_gpcv2.c                 | 1 -
 hw/intc/ompic.c                     | 1 -
 hw/intc/openpic.c                   | 1 -
 hw/ipmi/isa_ipmi_bt.c               | 1 -
 hw/ipmi/isa_ipmi_kcs.c              | 1 -
 hw/mips/fuloong2e.c                 | 1 -
 hw/mips/loongson3_virt.c            | 1 -
 hw/misc/imx7_snvs.c                 | 1 -
 hw/misc/imx_ccm.c                   | 1 -
 hw/misc/imx_rngc.c                  | 1 -
 hw/misc/pvpanic-isa.c               | 1 -
 hw/misc/pvpanic-pci.c               | 1 -
 hw/net/xgmac.c                      | 1 -
 hw/ppc/pnv.c                        | 1 -
 hw/ppc/pnv_pnor.c                   | 1 -
 hw/ppc/ppc405_boards.c              | 1 -
 hw/ppc/ppc405_uc.c                  | 1 -
 hw/ppc/ppc_booke.c                  | 1 -
 hw/ppc/virtex_ml507.c               | 1 -
 hw/riscv/microchip_pfsoc.c          | 1 -
 hw/riscv/numa.c                     | 1 -
 hw/riscv/sifive_e.c                 | 1 -
 hw/riscv/sifive_u.c                 | 1 -
 hw/riscv/spike.c                    | 1 -
 hw/riscv/virt.c                     | 1 -
 hw/sd/cadence_sdhci.c               | 1 -
 hw/ssi/xilinx_spi.c                 | 1 -
 hw/tricore/tc27x_soc.c              | 1 -
 hw/usb/chipidea.c                   | 1 -
 hw/usb/hcd-dwc3.c                   | 1 -
 hw/usb/imx-usb-phy.c                | 1 -
 hw/usb/xlnx-usb-subsystem.c         | 1 -
 hw/usb/xlnx-versal-usb2-ctrl-regs.c | 1 -
 hw/xen/xen-legacy-backend.c         | 1 -
 net/dump.c                          | 1 -
 net/filter-replay.c                 | 1 -
 semihosting/arm-compat-semi.c       | 1 -
 target/arm/op_helper.c              | 1 -
 target/hexagon/cpu.c                | 1 -
 target/hexagon/decode.c             | 1 -
 target/hexagon/genptr.c             | 1 -
 target/lm32/lm32-semi.c             | 1 -
 target/riscv/op_helper.c            | 1 -
 target/s390x/interrupt.c            | 1 -
 51 files changed, 51 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a17b75f4940a..c3345fce5366 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -22,7 +22,6 @@
 #include "hw/misc/tmp105.h"
 #include "hw/misc/led.h"
 #include "hw/qdev-properties.h"
-#include "qemu/log.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/sysemu.h"
 #include "hw/loader.h"
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index bc87e754a3cc..504aabf17371 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -14,7 +14,6 @@
 #include "hw/misc/unimp.h"
 #include "hw/arm/aspeed_soc.h"
 #include "hw/char/serial.h"
-#include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/error-report.h"
 #include "hw/i2c/aspeed_i2c.h"
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 057d053c8478..516277800c9c 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -17,7 +17,6 @@
 #include "hw/misc/unimp.h"
 #include "hw/arm/aspeed_soc.h"
 #include "hw/char/serial.h"
-#include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/error-report.h"
 #include "hw/i2c/aspeed_i2c.h"
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index ced2769b102a..5c7a51bbad75 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -23,7 +23,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "qemu/log.h"
 #include "cpu.h"
 #include "hw/cpu/a9mpcore.h"
 #include "hw/irq.h"
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 8482cd61960e..73e8268b353b 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -10,7 +10,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "sysemu/device_tree.h"
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 79609692e4eb..fb776834f7e9 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -12,7 +12,6 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
-#include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/sysbus.h"
 #include "net/net.h"
diff --git a/hw/i2c/mpc_i2c.c b/hw/i2c/mpc_i2c.c
index 720d2331e952..845392505ff2 100644
--- a/hw/i2c/mpc_i2c.c
+++ b/hw/i2c/mpc_i2c.c
@@ -20,7 +20,6 @@
 #include "qemu/osdep.h"
 #include "hw/i2c/i2c.h"
 #include "hw/irq.h"
-#include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
diff --git a/hw/intc/imx_gpcv2.c b/hw/intc/imx_gpcv2.c
index 17007a407803..237d5f97eba3 100644
--- a/hw/intc/imx_gpcv2.c
+++ b/hw/intc/imx_gpcv2.c
@@ -12,7 +12,6 @@
 #include "qemu/osdep.h"
 #include "hw/intc/imx_gpcv2.h"
 #include "migration/vmstate.h"
-#include "qemu/log.h"
 #include "qemu/module.h"
 
 #define GPC_PU_PGC_SW_PUP_REQ       0x0f8
diff --git a/hw/intc/ompic.c b/hw/intc/ompic.c
index 1731a1068385..1f10314807d8 100644
--- a/hw/intc/ompic.c
+++ b/hw/intc/ompic.c
@@ -7,7 +7,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/log.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
 #include "hw/irq.h"
diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
index 65970e1b3781..9b4c17854d29 100644
--- a/hw/intc/openpic.c
+++ b/hw/intc/openpic.c
@@ -47,7 +47,6 @@
 #include "qapi/error.h"
 #include "qemu/bitops.h"
 #include "qapi/qmp/qerror.h"
-#include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "qemu/error-report.h"
diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
index b7c2ad557b2c..02625eb94ed2 100644
--- a/hw/ipmi/isa_ipmi_bt.c
+++ b/hw/ipmi/isa_ipmi_bt.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/log.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
 #include "hw/irq.h"
diff --git a/hw/ipmi/isa_ipmi_kcs.c b/hw/ipmi/isa_ipmi_kcs.c
index 7dd6bf0040a4..3b23ad08b348 100644
--- a/hw/ipmi/isa_ipmi_kcs.c
+++ b/hw/ipmi/isa_ipmi_kcs.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/log.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
 #include "hw/irq.h"
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 4f61f2c873b2..1851eb0944b1 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -33,7 +33,6 @@
 #include "hw/mips/bootloader.h"
 #include "hw/mips/cpudevs.h"
 #include "hw/pci/pci.h"
-#include "qemu/log.h"
 #include "hw/loader.h"
 #include "hw/ide/pci.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
index b15071defc65..f9c0873a9865 100644
--- a/hw/mips/loongson3_virt.c
+++ b/hw/mips/loongson3_virt.c
@@ -54,7 +54,6 @@
 #include "sysemu/qtest.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
-#include "qemu/log.h"
 #include "qemu/error-report.h"
 
 #define PM_CNTL_MODE          0x10
diff --git a/hw/misc/imx7_snvs.c b/hw/misc/imx7_snvs.c
index 45972a592029..ee7698bd9cdf 100644
--- a/hw/misc/imx7_snvs.c
+++ b/hw/misc/imx7_snvs.c
@@ -14,7 +14,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/misc/imx7_snvs.h"
-#include "qemu/log.h"
 #include "qemu/module.h"
 #include "sysemu/runstate.h"
 
diff --git a/hw/misc/imx_ccm.c b/hw/misc/imx_ccm.c
index 08a50ee4c8ae..9403c5daa360 100644
--- a/hw/misc/imx_ccm.c
+++ b/hw/misc/imx_ccm.c
@@ -13,7 +13,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/misc/imx_ccm.h"
-#include "qemu/log.h"
 #include "qemu/module.h"
 
 #ifndef DEBUG_IMX_CCM
diff --git a/hw/misc/imx_rngc.c b/hw/misc/imx_rngc.c
index 4c270df2db07..632c03779cbb 100644
--- a/hw/misc/imx_rngc.c
+++ b/hw/misc/imx_rngc.c
@@ -14,7 +14,6 @@
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
-#include "qemu/log.h"
 #include "qemu/guest-random.h"
 #include "hw/irq.h"
 #include "hw/misc/imx_rngc.h"
diff --git a/hw/misc/pvpanic-isa.c b/hw/misc/pvpanic-isa.c
index 27113abd6cfb..7b66d58acc80 100644
--- a/hw/misc/pvpanic-isa.c
+++ b/hw/misc/pvpanic-isa.c
@@ -13,7 +13,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/log.h"
 #include "qemu/module.h"
 #include "sysemu/runstate.h"
 
diff --git a/hw/misc/pvpanic-pci.c b/hw/misc/pvpanic-pci.c
index d629639d8f49..af8cbe283055 100644
--- a/hw/misc/pvpanic-pci.c
+++ b/hw/misc/pvpanic-pci.c
@@ -12,7 +12,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/log.h"
 #include "qemu/module.h"
 #include "sysemu/runstate.h"
 
diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
index 00859a7d508c..0ab6ae91aa11 100644
--- a/hw/net/xgmac.c
+++ b/hw/net/xgmac.c
@@ -29,7 +29,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
-#include "qemu/log.h"
 #include "qemu/module.h"
 #include "net/net.h"
 #include "qom/object.h"
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 77af846cdfea..6faf1fe4733d 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -32,7 +32,6 @@
 #include "sysemu/device_tree.h"
 #include "sysemu/hw_accel.h"
 #include "target/ppc/cpu.h"
-#include "qemu/log.h"
 #include "hw/ppc/fdt.h"
 #include "hw/ppc/ppc.h"
 #include "hw/ppc/pnv.h"
diff --git a/hw/ppc/pnv_pnor.c b/hw/ppc/pnv_pnor.c
index 4b455de1ea77..5ef1cf2afbe1 100644
--- a/hw/ppc/pnv_pnor.c
+++ b/hw/ppc/pnv_pnor.c
@@ -10,7 +10,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
-#include "qemu/log.h"
 #include "qemu/units.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 8f77887fb18b..f4e804cdb528 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -39,7 +39,6 @@
 #include "sysemu/reset.h"
 #include "sysemu/block-backend.h"
 #include "hw/boards.h"
-#include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "hw/loader.h"
 #include "exec/address-spaces.h"
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index fe047074a174..e632c408bdf8 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -34,7 +34,6 @@
 #include "qemu/timer.h"
 #include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
-#include "qemu/log.h"
 #include "exec/address-spaces.h"
 #include "hw/intc/ppc-uic.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/ppc/ppc_booke.c b/hw/ppc/ppc_booke.c
index 974c0c8a7528..10b643861f23 100644
--- a/hw/ppc/ppc_booke.c
+++ b/hw/ppc/ppc_booke.c
@@ -28,7 +28,6 @@
 #include "qemu/timer.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
-#include "qemu/log.h"
 #include "hw/loader.h"
 #include "kvm_ppc.h"
 
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index cb421570dab3..3a57604ac03e 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -38,7 +38,6 @@
 #include "elf.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
-#include "qemu/log.h"
 #include "qemu/option.h"
 #include "exec/address-spaces.h"
 
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 01537b30ebc9..6cbd17ebf2e8 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -36,7 +36,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
-#include "qemu/log.h"
 #include "qemu/units.h"
 #include "qemu/cutils.h"
 #include "qapi/error.h"
diff --git a/hw/riscv/numa.c b/hw/riscv/numa.c
index 4f92307102ff..7fe92d402f69 100644
--- a/hw/riscv/numa.c
+++ b/hw/riscv/numa.c
@@ -18,7 +18,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
-#include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index f939bcf9ea67..97e8b0b0a2c7 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -29,7 +29,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7b59942369cc..698637e8e141 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -35,7 +35,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index ec7cb2f70748..fe0806a476d3 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -24,7 +24,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index c0dc69ff33de..95a11adaa2f2 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -20,7 +20,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
-#include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
diff --git a/hw/sd/cadence_sdhci.c b/hw/sd/cadence_sdhci.c
index c89538b491f7..56b8bae1c3ff 100644
--- a/hw/sd/cadence_sdhci.c
+++ b/hw/sd/cadence_sdhci.c
@@ -23,7 +23,6 @@
 #include "qemu/osdep.h"
 #include "qemu/bitops.h"
 #include "qemu/error-report.h"
-#include "qemu/log.h"
 #include "qapi/error.h"
 #include "migration/vmstate.h"
 #include "hw/sd/cadence_sdhci.h"
diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
index 49ff27559355..b2819a7ff092 100644
--- a/hw/ssi/xilinx_spi.c
+++ b/hw/ssi/xilinx_spi.c
@@ -27,7 +27,6 @@
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
-#include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/fifo8.h"
 
diff --git a/hw/tricore/tc27x_soc.c b/hw/tricore/tc27x_soc.c
index 8af079e6b25a..dea9ba3cca79 100644
--- a/hw/tricore/tc27x_soc.c
+++ b/hw/tricore/tc27x_soc.c
@@ -26,7 +26,6 @@
 #include "qemu/units.h"
 #include "hw/misc/unimp.h"
 #include "exec/address-spaces.h"
-#include "qemu/log.h"
 #include "cpu.h"
 
 #include "hw/tricore/tc27x_soc.h"
diff --git a/hw/usb/chipidea.c b/hw/usb/chipidea.c
index 3dcd22ccba87..b1c85404d6fa 100644
--- a/hw/usb/chipidea.c
+++ b/hw/usb/chipidea.c
@@ -12,7 +12,6 @@
 #include "qemu/osdep.h"
 #include "hw/usb/hcd-ehci.h"
 #include "hw/usb/chipidea.h"
-#include "qemu/log.h"
 #include "qemu/module.h"
 
 enum {
diff --git a/hw/usb/hcd-dwc3.c b/hw/usb/hcd-dwc3.c
index d547d0538ddf..279263489e46 100644
--- a/hw/usb/hcd-dwc3.c
+++ b/hw/usb/hcd-dwc3.c
@@ -31,7 +31,6 @@
 #include "hw/sysbus.h"
 #include "hw/register.h"
 #include "qemu/bitops.h"
-#include "qemu/log.h"
 #include "qom/object.h"
 #include "migration/vmstate.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/usb/imx-usb-phy.c b/hw/usb/imx-usb-phy.c
index e705a03a1fc5..5d7a549e34d1 100644
--- a/hw/usb/imx-usb-phy.c
+++ b/hw/usb/imx-usb-phy.c
@@ -13,7 +13,6 @@
 #include "qemu/osdep.h"
 #include "hw/usb/imx-usb-phy.h"
 #include "migration/vmstate.h"
-#include "qemu/log.h"
 #include "qemu/module.h"
 
 static const VMStateDescription vmstate_imx_usbphy = {
diff --git a/hw/usb/xlnx-usb-subsystem.c b/hw/usb/xlnx-usb-subsystem.c
index c760c3058a42..d8deeb6ced55 100644
--- a/hw/usb/xlnx-usb-subsystem.c
+++ b/hw/usb/xlnx-usb-subsystem.c
@@ -26,7 +26,6 @@
 #include "hw/sysbus.h"
 #include "hw/register.h"
 #include "qemu/bitops.h"
-#include "qemu/log.h"
 #include "qom/object.h"
 #include "qapi/error.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/usb/xlnx-versal-usb2-ctrl-regs.c b/hw/usb/xlnx-versal-usb2-ctrl-regs.c
index 9eaa59ebb8b0..1c094aa1a63f 100644
--- a/hw/usb/xlnx-versal-usb2-ctrl-regs.c
+++ b/hw/usb/xlnx-versal-usb2-ctrl-regs.c
@@ -32,7 +32,6 @@
 #include "hw/irq.h"
 #include "hw/register.h"
 #include "qemu/bitops.h"
-#include "qemu/log.h"
 #include "qom/object.h"
 #include "migration/vmstate.h"
 #include "hw/usb/xlnx-versal-usb2-ctrl-regs.h"
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index b61a4855b7b8..dd8ae1452d1e 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -27,7 +27,6 @@
 #include "hw/sysbus.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
-#include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "qapi/error.h"
 #include "hw/xen/xen-legacy-backend.h"
diff --git a/net/dump.c b/net/dump.c
index 4d538d82a696..a07ba624011c 100644
--- a/net/dump.c
+++ b/net/dump.c
@@ -28,7 +28,6 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/iov.h"
-#include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "qapi/visitor.h"
diff --git a/net/filter-replay.c b/net/filter-replay.c
index eef8443059b5..54690676ef0d 100644
--- a/net/filter-replay.c
+++ b/net/filter-replay.c
@@ -13,7 +13,6 @@
 #include "clients.h"
 #include "qemu/error-report.h"
 #include "qemu/iov.h"
-#include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "qapi/visitor.h"
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index fe079ca93abe..f9c87245b82c 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -37,7 +37,6 @@
 #include "semihosting/semihost.h"
 #include "semihosting/console.h"
 #include "semihosting/common-semi.h"
-#include "qemu/log.h"
 #include "qemu/timer.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 65cb37d088f8..78b831f1811d 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -17,7 +17,6 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
-#include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index b0b3040dd130..543fceb41c74 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -16,7 +16,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/log.h"
 #include "qemu/qemu-print.h"
 #include "cpu.h"
 #include "internal.h"
diff --git a/target/hexagon/decode.c b/target/hexagon/decode.c
index c9bacaa1eef6..9bcc8c9f3280 100644
--- a/target/hexagon/decode.c
+++ b/target/hexagon/decode.c
@@ -16,7 +16,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/log.h"
 #include "iclass.h"
 #include "attribs.h"
 #include "genptr.h"
diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 7481f4c1dd31..cea1f221e26c 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -17,7 +17,6 @@
 
 #define QEMU_GENERATE
 #include "qemu/osdep.h"
-#include "qemu/log.h"
 #include "cpu.h"
 #include "internal.h"
 #include "tcg/tcg-op.h"
diff --git a/target/lm32/lm32-semi.c b/target/lm32/lm32-semi.c
index 6a11a6299ad6..661a77024906 100644
--- a/target/lm32/lm32-semi.c
+++ b/target/lm32/lm32-semi.c
@@ -13,7 +13,6 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
-#include "qemu/log.h"
 #include "exec/softmmu-semi.h"
 
 enum {
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 1eddcb94de7e..f0bbd73ca521 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/log.h"
 #include "cpu.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
diff --git a/target/s390x/interrupt.c b/target/s390x/interrupt.c
index 4cdbbc8849a2..9b4d08f2be37 100644
--- a/target/s390x/interrupt.c
+++ b/target/s390x/interrupt.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/log.h"
 #include "cpu.h"
 #include "kvm_s390x.h"
 #include "internal.h"
-- 
2.31.1


