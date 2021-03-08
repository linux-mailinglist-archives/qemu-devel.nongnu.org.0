Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AEA331604
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:28:20 +0100 (CET)
Received: from localhost ([::1]:48018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKc7-0002v1-OE
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:28:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJlC-0007F4-9h
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:38 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:35134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJks-00079l-UU
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:38 -0500
Received: by mail-wr1-x441.google.com with SMTP id l12so12332842wry.2
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tK2JuPQn1FsTQvOSXTmzoSioHEObeRnPn/IZGYT5//s=;
 b=NPXQ1L7XhaSTNyDC8uBHT7qyJIKdenNofc5lNCeO5yTWo2ez7/twf0Pgz86H4aqH2D
 27kTC/20olz+tqhhOsLmDc3wcUB/EYc9NkFtneVGJ+HnS8hZ43JciG+UmWYTzDg+p+0n
 lBvg50y7kSJBmGn0nCb51pCsIqnFBOi8MUk7eNZnGzWSEzA/EEaQIgcAxXXvrgPo/fel
 RVX47FmN9Ta5cX6aCxV1HwLV3sWRVYA9wbuRfmFhl80TBK98OfKQNCj6dS7ySwIuLvtP
 KTn/8UcjhJkA5RBw+JZKyXYF6NQDXCVKWnknavU9aAdaYvGVFlP/BXuXEzTnyQltDzb2
 DyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tK2JuPQn1FsTQvOSXTmzoSioHEObeRnPn/IZGYT5//s=;
 b=SELrB3D3umr+WrW4KNUE9iEsRmkqLFCUGRIPFPnBSDA5EnKRe9TH+S/jIhvZtJ+Pj6
 BB/xcb16BMTbwppqRzhrAEXPgKklndvRTWKYi3LwwxLncEt3wDAlZL9IScAh6myH8pXU
 ZsCEjDIbDE0BmxQb/sVEHZW5QWv+fYa9wfwwTigJl/z57klvGzpToex3XygTcX4XDUrr
 51/Vzy5b8nIM94s+r82GQ1ao5wums61FLclcVHO8GKbfRE+lk5q4H+bpWfGCF7UMjVil
 he7T4BCsAUDm616DZAtstDl8/EaDrkN0RuHF2QyRZlUQZNFBzMxW/vFiP2Y8sI524Ft5
 I42g==
X-Gm-Message-State: AOAM531yx6VSQa4xBcD3nfmvMcIr4142FlJ2PBrrL3lkt1GdnJIITAgS
 9XHgp8gMwTn6stllxsI7X336M05iHyu3uQ==
X-Google-Smtp-Source: ABdhPJzYveAkUusbnAI6g1vLX8f9njg+ivdscTUeLNxyN2bx1AuxB8YWBhe7L1icXi30YZteAqxlkQ==
X-Received: by 2002:adf:ebc9:: with SMTP id v9mr24182869wrn.387.1615224797298; 
 Mon, 08 Mar 2021 09:33:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 42/54] hw/arm/mps2-tz: Add new mps3-an547 board
Date: Mon,  8 Mar 2021 17:32:32 +0000
Message-Id: <20210308173244.20710-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for the mps3-an547 board; this is an SSE-300 based
FPGA image that runs on the MPS3.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-43-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 146 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 144 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 0a1e6c20c21..3fbe3d29f95 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -17,6 +17,7 @@
  *  "mps2-an505" -- Cortex-M33 as documented in ARM Application Note AN505
  *  "mps2-an521" -- Dual Cortex-M33 as documented in Application Note AN521
  *  "mps2-an524" -- Dual Cortex-M33 as documented in Application Note AN524
+ *  "mps2-an547" -- Single Cortex-M55 as documented in Application Note AN547
  *
  * Links to the TRM for the board itself and to the various Application
  * Notes which document the FPGA images can be found here:
@@ -30,6 +31,8 @@
  * https://developer.arm.com/documentation/dai0521/latest/
  * Application Note AN524:
  * https://developer.arm.com/documentation/dai0524/latest/
+ * Application Note AN547:
+ * https://developer.arm.com/-/media/Arm%20Developer%20Community/PDF/DAI0547B_SSE300_PLUS_U55_FPGA_for_mps3.pdf
  *
  * The AN505 defers to the Cortex-M33 processor ARMv8M IoT Kit FVP User Guide
  * (ARM ECM0601256) for the details of some of the device layout:
@@ -37,6 +40,8 @@
  * Similarly, the AN521 and AN524 use the SSE-200, and the SSE-200 TRM defines
  * most of the device layout:
  *  https://developer.arm.com/documentation/101104/latest/
+ * and the AN547 uses the SSE-300, whose layout is in the SSE-300 TRM:
+ *  https://developer.arm.com/documentation/101773/latest/
  */
 
 #include "qemu/osdep.h"
@@ -68,13 +73,14 @@
 #include "hw/qdev-clock.h"
 #include "qom/object.h"
 
-#define MPS2TZ_NUMIRQ_MAX 95
-#define MPS2TZ_RAM_MAX 4
+#define MPS2TZ_NUMIRQ_MAX 96
+#define MPS2TZ_RAM_MAX 5
 
 typedef enum MPS2TZFPGAType {
     FPGA_AN505,
     FPGA_AN521,
     FPGA_AN524,
+    FPGA_AN547,
 } MPS2TZFPGAType;
 
 /*
@@ -153,6 +159,7 @@ struct MPS2TZMachineState {
 #define TYPE_MPS2TZ_AN505_MACHINE MACHINE_TYPE_NAME("mps2-an505")
 #define TYPE_MPS2TZ_AN521_MACHINE MACHINE_TYPE_NAME("mps2-an521")
 #define TYPE_MPS3TZ_AN524_MACHINE MACHINE_TYPE_NAME("mps3-an524")
+#define TYPE_MPS3TZ_AN547_MACHINE MACHINE_TYPE_NAME("mps3-an547")
 
 OBJECT_DECLARE_TYPE(MPS2TZMachineState, MPS2TZMachineClass, MPS2TZ_MACHINE)
 
@@ -252,6 +259,49 @@ static const RAMInfo an524_raminfo[] = { {
     },
 };
 
+static const RAMInfo an547_raminfo[] = { {
+        .name = "itcm",
+        .base = 0x00000000,
+        .size = 512 * KiB,
+        .mpc = -1,
+        .mrindex = 0,
+    }, {
+        .name = "sram",
+        .base = 0x01000000,
+        .size = 2 * MiB,
+        .mpc = 0,
+        .mrindex = 1,
+    }, {
+        .name = "dtcm",
+        .base = 0x20000000,
+        .size = 4 * 128 * KiB,
+        .mpc = -1,
+        .mrindex = 2,
+    }, {
+        .name = "sram 2",
+        .base = 0x21000000,
+        .size = 4 * MiB,
+        .mpc = -1,
+        .mrindex = 3,
+    }, {
+        /* We don't model QSPI flash yet; for now expose it as simple ROM */
+        .name = "QSPI",
+        .base = 0x28000000,
+        .size = 8 * MiB,
+        .mpc = 1,
+        .mrindex = 4,
+        .flags = IS_ROM,
+    }, {
+        .name = "DDR",
+        .base = 0x60000000,
+        .size = MPS3_DDR_SIZE,
+        .mpc = 2,
+        .mrindex = -1,
+    }, {
+        .name = NULL,
+    },
+};
+
 static const RAMInfo *find_raminfo_for_mpc(MPS2TZMachineState *mms, int mpc)
 {
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
@@ -893,6 +943,55 @@ static void mps2tz_common_init(MachineState *machine)
         },
     };
 
+    const PPCInfo an547_ppcs[] = { {
+            .name = "apb_ppcexp0",
+            .ports = {
+                { "ssram-mpc", make_mpc, &mms->mpc[0], 0x57000000, 0x1000 },
+                { "qspi-mpc", make_mpc, &mms->mpc[1], 0x57001000, 0x1000 },
+                { "ddr-mpc", make_mpc, &mms->mpc[2], 0x57002000, 0x1000 },
+            },
+        }, {
+            .name = "apb_ppcexp1",
+            .ports = {
+                { "i2c0", make_i2c, &mms->i2c[0], 0x49200000, 0x1000 },
+                { "i2c1", make_i2c, &mms->i2c[1], 0x49201000, 0x1000 },
+                { "spi0", make_spi, &mms->spi[0], 0x49202000, 0x1000, { 53 } },
+                { "spi1", make_spi, &mms->spi[1], 0x49203000, 0x1000, { 54 } },
+                { "spi2", make_spi, &mms->spi[2], 0x49204000, 0x1000, { 55 } },
+                { "i2c2", make_i2c, &mms->i2c[2], 0x49205000, 0x1000 },
+                { "i2c3", make_i2c, &mms->i2c[3], 0x49206000, 0x1000 },
+                { /* port 7 reserved */ },
+                { "i2c4", make_i2c, &mms->i2c[4], 0x49208000, 0x1000 },
+            },
+        }, {
+            .name = "apb_ppcexp2",
+            .ports = {
+                { "scc", make_scc, &mms->scc, 0x49300000, 0x1000 },
+                { "i2s-audio", make_unimp_dev, &mms->i2s_audio, 0x49301000, 0x1000 },
+                { "fpgaio", make_fpgaio, &mms->fpgaio, 0x49302000, 0x1000 },
+                { "uart0", make_uart, &mms->uart[0], 0x49303000, 0x1000, { 33, 34, 43 } },
+                { "uart1", make_uart, &mms->uart[1], 0x49304000, 0x1000, { 35, 36, 44 } },
+                { "uart2", make_uart, &mms->uart[2], 0x49305000, 0x1000, { 37, 38, 45 } },
+                { "uart3", make_uart, &mms->uart[3], 0x49306000, 0x1000, { 39, 40, 46 } },
+                { "uart4", make_uart, &mms->uart[4], 0x49307000, 0x1000, { 41, 42, 47 } },
+                { "uart5", make_uart, &mms->uart[5], 0x49308000, 0x1000, { 125, 126, 127 } },
+
+                { /* port 9 reserved */ },
+                { "clcd", make_unimp_dev, &mms->cldc, 0x4930a000, 0x1000 },
+                { "rtc", make_rtc, &mms->rtc, 0x4930b000, 0x1000 },
+            },
+        }, {
+            .name = "ahb_ppcexp0",
+            .ports = {
+                { "gpio0", make_unimp_dev, &mms->gpio[0], 0x41100000, 0x1000 },
+                { "gpio1", make_unimp_dev, &mms->gpio[1], 0x41101000, 0x1000 },
+                { "gpio2", make_unimp_dev, &mms->gpio[2], 0x41102000, 0x1000 },
+                { "gpio3", make_unimp_dev, &mms->gpio[3], 0x41103000, 0x1000 },
+                { "eth-usb", make_eth_usb, NULL, 0x41400000, 0x200000, { 49 } },
+            },
+        },
+    };
+
     switch (mmc->fpga_type) {
     case FPGA_AN505:
     case FPGA_AN521:
@@ -903,6 +1002,10 @@ static void mps2tz_common_init(MachineState *machine)
         ppcs = an524_ppcs;
         num_ppcs = ARRAY_SIZE(an524_ppcs);
         break;
+    case FPGA_AN547:
+        ppcs = an547_ppcs;
+        num_ppcs = ARRAY_SIZE(an547_ppcs);
+        break;
     default:
         g_assert_not_reached();
     }
@@ -981,6 +1084,11 @@ static void mps2tz_common_init(MachineState *machine)
 
     create_unimplemented_device("FPGA NS PC", 0x48007000, 0x1000);
 
+    if (mmc->fpga_type == FPGA_AN547) {
+        create_unimplemented_device("U55 timing adapter 0", 0x48102000, 0x1000);
+        create_unimplemented_device("U55 timing adapter 1", 0x48103000, 0x1000);
+    }
+
     create_non_mpc_ram(mms);
 
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
@@ -1115,6 +1223,33 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
     mps2tz_set_default_ram_info(mmc);
 }
 
+static void mps3tz_an547_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_CLASS(oc);
+
+    mc->desc = "ARM MPS3 with AN547 FPGA image for Cortex-M55";
+    mc->default_cpus = 1;
+    mc->min_cpus = mc->default_cpus;
+    mc->max_cpus = mc->default_cpus;
+    mmc->fpga_type = FPGA_AN547;
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m55");
+    mmc->scc_id = 0x41055470;
+    mmc->sysclk_frq = 32 * 1000 * 1000; /* 32MHz */
+    mmc->apb_periph_frq = 25 * 1000 * 1000; /* 25MHz */
+    mmc->oscclk = an524_oscclk; /* same as AN524 */
+    mmc->len_oscclk = ARRAY_SIZE(an524_oscclk);
+    mmc->fpgaio_num_leds = 10;
+    mmc->fpgaio_has_switches = true;
+    mmc->fpgaio_has_dbgctrl = true;
+    mmc->numirq = 96;
+    mmc->uart_overflow_irq = 48;
+    mmc->init_svtor = 0x00000000;
+    mmc->raminfo = an547_raminfo;
+    mmc->armsse_type = TYPE_SSE300;
+    mps2tz_set_default_ram_info(mmc);
+}
+
 static const TypeInfo mps2tz_info = {
     .name = TYPE_MPS2TZ_MACHINE,
     .parent = TYPE_MACHINE,
@@ -1146,12 +1281,19 @@ static const TypeInfo mps3tz_an524_info = {
     .class_init = mps3tz_an524_class_init,
 };
 
+static const TypeInfo mps3tz_an547_info = {
+    .name = TYPE_MPS3TZ_AN547_MACHINE,
+    .parent = TYPE_MPS2TZ_MACHINE,
+    .class_init = mps3tz_an547_class_init,
+};
+
 static void mps2tz_machine_init(void)
 {
     type_register_static(&mps2tz_info);
     type_register_static(&mps2tz_an505_info);
     type_register_static(&mps2tz_an521_info);
     type_register_static(&mps3tz_an524_info);
+    type_register_static(&mps3tz_an547_info);
 }
 
 type_init(mps2tz_machine_init);
-- 
2.20.1


