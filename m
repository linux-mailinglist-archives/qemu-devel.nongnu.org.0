Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E9531B88F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:01:26 +0100 (CET)
Received: from localhost ([::1]:33524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcZB-0002jh-4v
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:01:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcR8-0000JK-EX
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:53:07 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcR2-0004Hc-OS
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:53:06 -0500
Received: by mail-wm1-x331.google.com with SMTP id h67so4235011wmh.1
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nRr1C7q5zeK3oCgmytzLs7IaWHaLenFMaUKqIuvkC1o=;
 b=OpPpikEKxNSlcFp1C0IO2iriDx06ZOgeHlpNaQvP0dzv7don/oHhjjDMZPpR7Bhd9q
 bx3R5fylA6oWINdbj8n0khnkp5NU2P8YW0GyO7RzzvSQlU12YJzmDGXpP3bsZmtdMn2G
 neCdjK53OJnCuiuSV2pg+wZpPnooy1K0HhhZbr2cnLoq5fEknSLkZjEy14OLuVjlULys
 Y37q3o0Z+jUVjYC0riUjlJoYEM8VmPbUYUsPAYF0e9d6UlkeZEbeLfspqHXYCjxi4YeZ
 NQRbd//rtlvJnKSj65keJKdnYERf2Rpy/Y50WHw5K9GLpOwRMThfYk8bCj2KVbsKAGYD
 ZVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nRr1C7q5zeK3oCgmytzLs7IaWHaLenFMaUKqIuvkC1o=;
 b=h8eEaCNBOTz1/9t9vuGi7ed8eYbjpT+sSnCi9v2cy8qBDXrZCWbyeCsKjXIOwsjSt+
 i92bDDzyYllD22LBmZvxl8naNo1J6A0wW0ExE0AOfZBy+eXfia+chho4QbWniWWw8IgO
 75/4y603P1HOyCVhmoebzH1nFTRhUReZSCd89HJ6f9k0Nk0ixl2Tp0/OI5mcZXXlXSOw
 jsjYCNTVVeFqyJqqmCB8qHuQdvXXK8CII+alzlduMB3NrwMFYZfpLEAVYadMxcVygBWB
 hRXRTLEx5O2SkEPBYjyxen+tzRIkjMOwIrudRLfr/erQQguH4YJxKETJrdA7DybY/yzT
 nQDQ==
X-Gm-Message-State: AOAM530dd36q6YnfoHtPrn0L37HJdWToaPWS6w3+cY1PG8TBLNW7xOzh
 vxIA3rWkg0vP6icXmeEMoeqRZQ==
X-Google-Smtp-Source: ABdhPJxrED3Os/D7Be280SG43fFKMdwS4lGCUogLIYlSiBIi71pVv0jNyusp3j+bBB0GHELORpzL2Q==
X-Received: by 2002:a05:600c:350c:: with SMTP id
 h12mr10829233wmq.39.1613389979505; 
 Mon, 15 Feb 2021 03:52:59 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 20/24] hw/arm/mps2-tz: Add new mps3-an524 board
Date: Mon, 15 Feb 2021 11:51:34 +0000
Message-Id: <20210215115138.20465-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for the mps3-an524 board; this is an SSE-200 based FPGA
image, like the existing mps2-an521.  It has a usefully larger amount
of RAM, and a PL031 RTC, as well as some more minor differences.

In real hardware this image runs on a newer generation of the FPGA
board, the MPS3 rather than the older MPS2.  Architecturally the two
boards are similar, so we implement the MPS3 boards in the mps2-tz.c
file as variations of the existing MPS2 boards.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 139 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 135 insertions(+), 4 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index da27caa332d..5e12ee2c3d3 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -16,6 +16,7 @@
  * This source file covers the following FPGA images, for TrustZone cores:
  *  "mps2-an505" -- Cortex-M33 as documented in ARM Application Note AN505
  *  "mps2-an521" -- Dual Cortex-M33 as documented in Application Note AN521
+ *  "mps2-an524" -- Dual Cortex-M33 as documented in Application Note AN524
  *
  * Links to the TRM for the board itself and to the various Application
  * Notes which document the FPGA images can be found here:
@@ -27,11 +28,13 @@
  * http://infocenter.arm.com/help/topic/com.arm.doc.dai0505b/index.html
  * Application Note AN521:
  * http://infocenter.arm.com/help/topic/com.arm.doc.dai0521c/index.html
+ * Application Note AN524:
+ * https://developer.arm.com/documentation/dai0524/latest/
  *
  * The AN505 defers to the Cortex-M33 processor ARMv8M IoT Kit FVP User Guide
  * (ARM ECM0601256) for the details of some of the device layout:
  *   http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
- * Similarly, the AN521 uses the SSE-200, and the SSE-200 TRM defines
+ * Similarly, the AN521 and AN524 use the SSE-200, and the SSE-200 TRM defines
  * most of the device layout:
  *  http://infocenter.arm.com/help/topic/com.arm.doc.101104_0100_00_en/corelink_sse200_subsystem_for_embedded_technical_reference_manual_101104_0100_00_en.pdf
  *
@@ -65,12 +68,13 @@
 #include "hw/qdev-clock.h"
 #include "qom/object.h"
 
-#define MPS2TZ_NUMIRQ_MAX 92
+#define MPS2TZ_NUMIRQ_MAX 95
 #define MPS2TZ_RAM_MAX 4
 
 typedef enum MPS2TZFPGAType {
     FPGA_AN505,
     FPGA_AN521,
+    FPGA_AN524,
 } MPS2TZFPGAType;
 
 /*
@@ -121,13 +125,15 @@ struct MPS2TZMachineState {
     TZPPC ppc[5];
     TZMPC mpc[3];
     PL022State spi[5];
-    ArmSbconI2CState i2c[4];
+    ArmSbconI2CState i2c[5];
     UnimplementedDeviceState i2s_audio;
     UnimplementedDeviceState gpio[4];
     UnimplementedDeviceState gfx;
+    UnimplementedDeviceState cldc;
+    UnimplementedDeviceState rtc;
     PL080State dma[4];
     TZMSC msc[4];
-    CMSDKAPBUART uart[5];
+    CMSDKAPBUART uart[6];
     SplitIRQ sec_resp_splitter;
     qemu_or_irq uart_irq_orgate;
     DeviceState *lan9118;
@@ -139,6 +145,7 @@ struct MPS2TZMachineState {
 #define TYPE_MPS2TZ_MACHINE "mps2tz"
 #define TYPE_MPS2TZ_AN505_MACHINE MACHINE_TYPE_NAME("mps2-an505")
 #define TYPE_MPS2TZ_AN521_MACHINE MACHINE_TYPE_NAME("mps2-an521")
+#define TYPE_MPS3TZ_AN524_MACHINE MACHINE_TYPE_NAME("mps3-an524")
 
 OBJECT_DECLARE_TYPE(MPS2TZMachineState, MPS2TZMachineClass, MPS2TZ_MACHINE)
 
@@ -151,6 +158,15 @@ static const uint32_t an505_oscclk[] = {
     25000000,
 };
 
+static const uint32_t an524_oscclk[] = {
+    24000000,
+    32000000,
+    50000000,
+    50000000,
+    24576000,
+    23750000,
+};
+
 static const RAMInfo an505_raminfo[] = { {
         .name = "ssram-0",
         .base = 0x00000000,
@@ -188,6 +204,37 @@ static const RAMInfo an505_raminfo[] = { {
     },
 };
 
+static const RAMInfo an524_raminfo[] = { {
+        .name = "bram",
+        .base = 0x00000000,
+        .size = 512 * KiB,
+        .mpc = 0,
+        .mrindex = 0,
+    }, {
+        .name = "sram",
+        .base = 0x20000000,
+        .size = 32 * 4 * KiB,
+        .mpc = 1,
+        .mrindex = 1,
+    }, {
+        /* We don't model QSPI flash yet; for now expose it as simple ROM */
+        .name = "QSPI",
+        .base = 0x28000000,
+        .size = 8 * MiB,
+        .mpc = 1,
+        .mrindex = 2,
+        .flags = IS_ROM,
+    }, {
+        .name = "DDR",
+        .base = 0x60000000,
+        .size = 2 * GiB,
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
@@ -717,12 +764,66 @@ static void mps2tz_common_init(MachineState *machine)
         },
     };
 
+    const PPCInfo an524_ppcs[] = { {
+            .name = "apb_ppcexp0",
+            .ports = {
+                { "bram-mpc", make_mpc, &mms->mpc[0], 0x58007000, 0x1000 },
+                { "qspi-mpc", make_mpc, &mms->mpc[1], 0x58008000, 0x1000 },
+                { "ddr-mpc", make_mpc, &mms->mpc[2], 0x58009000, 0x1000 },
+            },
+        }, {
+            .name = "apb_ppcexp1",
+            .ports = {
+                { "i2c0", make_i2c, &mms->i2c[0], 0x41200000, 0x1000 },
+                { "i2c1", make_i2c, &mms->i2c[1], 0x41201000, 0x1000 },
+                { "spi0", make_spi, &mms->spi[0], 0x41202000, 0x1000, { 52 } },
+                { "spi1", make_spi, &mms->spi[1], 0x41203000, 0x1000, { 53 } },
+                { "spi2", make_spi, &mms->spi[2], 0x41204000, 0x1000, { 54 } },
+                { "i2c2", make_i2c, &mms->i2c[2], 0x41205000, 0x1000 },
+                { "i2c3", make_i2c, &mms->i2c[3], 0x41206000, 0x1000 },
+                { /* port 7 reserved */ },
+                { "i2c4", make_i2c, &mms->i2c[4], 0x41208000, 0x1000 },
+            },
+        }, {
+            .name = "apb_ppcexp2",
+            .ports = {
+                { "scc", make_scc, &mms->scc, 0x41300000, 0x1000 },
+                { "i2s-audio", make_unimp_dev, &mms->i2s_audio,
+                  0x41301000, 0x1000 },
+                { "fpgaio", make_fpgaio, &mms->fpgaio, 0x41302000, 0x1000 },
+                { "uart0", make_uart, &mms->uart[0], 0x41303000, 0x1000, { 32, 33, 42 } },
+                { "uart1", make_uart, &mms->uart[1], 0x41304000, 0x1000, { 34, 35, 43 } },
+                { "uart2", make_uart, &mms->uart[2], 0x41305000, 0x1000, { 36, 37, 44 } },
+                { "uart3", make_uart, &mms->uart[3], 0x41306000, 0x1000, { 38, 39, 45 } },
+                { "uart4", make_uart, &mms->uart[4], 0x41307000, 0x1000, { 40, 41, 46 } },
+                { "uart5", make_uart, &mms->uart[5], 0x41308000, 0x1000, { 124, 125, 126 } },
+
+                { /* port 9 reserved */ },
+                { "clcd", make_unimp_dev, &mms->cldc, 0x4130a000, 0x1000 },
+                { "rtc", make_unimp_dev, &mms->rtc, 0x4130b000, 0x1000 },
+            },
+        }, {
+            .name = "ahb_ppcexp0",
+            .ports = {
+                { "gpio0", make_unimp_dev, &mms->gpio[0], 0x41100000, 0x1000 },
+                { "gpio1", make_unimp_dev, &mms->gpio[1], 0x41101000, 0x1000 },
+                { "gpio2", make_unimp_dev, &mms->gpio[2], 0x41102000, 0x1000 },
+                { "gpio3", make_unimp_dev, &mms->gpio[3], 0x41103000, 0x1000 },
+                { "eth", make_eth_dev, NULL, 0x41400000, 0x100000, { 48 } },
+            },
+        },
+    };
+
     switch (mmc->fpga_type) {
     case FPGA_AN505:
     case FPGA_AN521:
         ppcs = an505_ppcs;
         num_ppcs = ARRAY_SIZE(an505_ppcs);
         break;
+    case FPGA_AN524:
+        ppcs = an524_ppcs;
+        num_ppcs = ARRAY_SIZE(an524_ppcs);
+        break;
     default:
         g_assert_not_reached();
     }
@@ -900,6 +1001,29 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mps2tz_set_default_ram_info(mmc);
 }
 
+static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_CLASS(oc);
+
+    mc->desc = "ARM MPS3 with AN524 FPGA image for dual Cortex-M33";
+    mc->default_cpus = 2;
+    mc->min_cpus = mc->default_cpus;
+    mc->max_cpus = mc->default_cpus;
+    mmc->fpga_type = FPGA_AN524;
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
+    mmc->scc_id = 0x41045240;
+    mmc->sysclk_frq = 32 * 1000 * 1000; /* 32MHz */
+    mmc->oscclk = an524_oscclk;
+    mmc->len_oscclk = ARRAY_SIZE(an524_oscclk);
+    mmc->fpgaio_num_leds = 10;
+    mmc->fpgaio_has_switches = true;
+    mmc->numirq = 95;
+    mmc->raminfo = an524_raminfo;
+    mmc->armsse_type = TYPE_SSE200;
+    mps2tz_set_default_ram_info(mmc);
+}
+
 static const TypeInfo mps2tz_info = {
     .name = TYPE_MPS2TZ_MACHINE,
     .parent = TYPE_MACHINE,
@@ -925,11 +1049,18 @@ static const TypeInfo mps2tz_an521_info = {
     .class_init = mps2tz_an521_class_init,
 };
 
+static const TypeInfo mps3tz_an524_info = {
+    .name = TYPE_MPS3TZ_AN524_MACHINE,
+    .parent = TYPE_MPS2TZ_MACHINE,
+    .class_init = mps3tz_an524_class_init,
+};
+
 static void mps2tz_machine_init(void)
 {
     type_register_static(&mps2tz_info);
     type_register_static(&mps2tz_an505_info);
     type_register_static(&mps2tz_an521_info);
+    type_register_static(&mps3tz_an524_info);
 }
 
 type_init(mps2tz_machine_init);
-- 
2.20.1


