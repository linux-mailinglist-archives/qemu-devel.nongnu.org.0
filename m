Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E61B2DDEA1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:32:08 +0100 (CET)
Received: from localhost ([::1]:46998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq9J9-0006Fc-B0
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:32:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8qg-0006dC-4Q
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:02:42 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8qd-0002GA-Mc
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:02:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608271706; x=1639807706;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jk/bfxin+jCOEnVQ2AD2BoQXL1feHdtm+x/LlS+0uKg=;
 b=Wkj6R3jDhT4si6ogo1yi7zBUYyHz/h1uhSajgYh3R4/2TMg4TW8VBPcV
 hhqsAHXZrnNgicE+ku1xAZ2g70CUB/xy4K8Rj2seAUT2Ln1zJYi+C/caU
 kv+vFxDs46hYmmsMreIuf6FeBuP4ltbrkPlMTaVt4xxyfVMw5P+ttTMb6
 wIV/N7FyoReFoIo3OTJMd4lLfxNbjUoC+RsYcaglCwq9X30rvk16qwyN9
 zXhJjv+9cJr7XIPUDlKqYi5PaRb6NBfjOTE1RGpd3k1Juw0n6kM8wHx7n
 Ko5Zl8vIJ1iQiUHeOtu6uVyGTulj9F7To7kxy6ZN82HT8WPuMno5oFSZ/ w==;
IronPort-SDR: FSkw+DauCIbHApiFDQfUKyrFb9BqXN22is2muJ6Wlkl6Ao+TYd41+0QQWmbZ32JZ9R06OY7Fae
 R36ZyjX3xwVS4evTl8vna0fwCqJOsk/5GdWKSskc/yJsrx4lN3wrs5Vnj8rX05lMNmR1ikckZE
 N2oL54wLbs+jbxVa8Y2xRiLEVnSXjwxsEkY20tez0KjSVx0IOvoJDDtrx0D/LzopSdQRVjAR3y
 7m00SeBigEKZmoCIkEoCBNp4W6/BEcw5GVUFDdOCv7v/ATNTvKFXwGXRHcqUVO5yYqAz9v5MWt
 Wxo=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="259237073"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 14:06:36 +0800
IronPort-SDR: dPlXZnmlLdI6iBVmotWjq/HsUhTSFYoOHLzDTAhGubx+uFTrelwoTWd60MruQ4ymgKw4bxPRC+
 8ro6BrURss1Odix0auFx+O5m5IdquN3Dv+CbyjiJa542XSW15OW+QjpGks4nn8qv4a9mrbSoPs
 fe1jklqxcuLLfP1ACaBUvoIO2HxF3RWm9hrTBSviTyuXO0Jw/xI5FfZSDO2f1u8p4bBnvrMKKZ
 ppGWdZXRJwzeEWtc2/pJfxX/QpPV21QuhIybBy3VLie68tnTZjAs/DRFAADjRB6SMRwr+kAUnW
 488KkrMtSfOB3LeZ1DN8HjAe
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 21:46:42 -0800
IronPort-SDR: S6kN9DVAOpbBRW9JgNPN2XULZJy4EM4PZI2dQcVZ5GIdQmSjcUdJs/neEgIExBGB7kbwbSOCvz
 VRn3qqkRTUdhJFVwMqzx1Pt+JMDpUDr3zgdKQHvdauVjWYzUImqS5mYJnJVFua3uLOCxRyDLTd
 7pdpqg6pu4QjTgzhhrjqeUQFja3hVjzDgojkCUrfCS0wTj9w2Gi/TP+M2lgEMfztIyLPkyjZKu
 +kRW84bGFRpKDhzZN86+RLPScpsdjjVeykf5kbExYvnY7z0q3LAbJ2dtObsEAEtcE1AtfTtjt2
 G2k=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.68])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Dec 2020 22:01:26 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 23/23] riscv/opentitan: Update the OpenTitan memory layout
Date: Thu, 17 Dec 2020 22:01:14 -0800
Message-Id: <20201218060114.3591217-24-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218060114.3591217-1-alistair.francis@wdc.com>
References: <20201218060114.3591217-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=614e9c0eb=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OpenTitan is currently only avalible on an FPGA platform and the memory
addresses have changed. Update to use the new memory addresses.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 8eb65314830a75d0fea3fccf77bc45b8ddd01c42.1607982831.git.alistair.francis@wdc.com
---
 include/hw/riscv/opentitan.h | 23 +++++++---
 hw/riscv/opentitan.c         | 81 +++++++++++++++++++++++++-----------
 2 files changed, 74 insertions(+), 30 deletions(-)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 5ff0c0f85e..a5ea3a5e4e 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -55,19 +55,30 @@ enum {
     IBEX_DEV_UART,
     IBEX_DEV_GPIO,
     IBEX_DEV_SPI,
-    IBEX_DEV_FLASH_CTRL,
+    IBEX_DEV_I2C,
+    IBEX_DEV_PATTGEN,
     IBEX_DEV_RV_TIMER,
-    IBEX_DEV_AES,
-    IBEX_DEV_HMAC,
-    IBEX_DEV_PLIC,
+    IBEX_DEV_SENSOR_CTRL,
+    IBEX_DEV_OTP_CTRL,
     IBEX_DEV_PWRMGR,
     IBEX_DEV_RSTMGR,
     IBEX_DEV_CLKMGR,
     IBEX_DEV_PINMUX,
+    IBEX_DEV_PADCTRL,
+    IBEX_DEV_USBDEV,
+    IBEX_DEV_FLASH_CTRL,
+    IBEX_DEV_PLIC,
+    IBEX_DEV_AES,
+    IBEX_DEV_HMAC,
+    IBEX_DEV_KMAC,
+    IBEX_DEV_KEYMGR,
+    IBEX_DEV_CSRNG,
+    IBEX_DEV_ENTROPY,
+    IBEX_DEV_EDNO,
+    IBEX_DEV_EDN1,
     IBEX_DEV_ALERT_HANDLER,
     IBEX_DEV_NMI_GEN,
-    IBEX_DEV_USBDEV,
-    IBEX_DEV_PADCTRL,
+    IBEX_DEV_OTBN,
 };
 
 enum {
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index cc758b78b8..af3456932f 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -35,22 +35,33 @@ static const struct MemmapEntry {
     [IBEX_DEV_ROM] =            {  0x00008000, 16 * KiB },
     [IBEX_DEV_RAM] =            {  0x10000000,  0x10000 },
     [IBEX_DEV_FLASH] =          {  0x20000000,  0x80000 },
-    [IBEX_DEV_UART] =           {  0x40000000,  0x10000 },
-    [IBEX_DEV_GPIO] =           {  0x40010000,  0x10000 },
-    [IBEX_DEV_SPI] =            {  0x40020000,  0x10000 },
-    [IBEX_DEV_FLASH_CTRL] =     {  0x40030000,  0x10000 },
-    [IBEX_DEV_PINMUX] =         {  0x40070000,  0x10000 },
-    [IBEX_DEV_RV_TIMER] =       {  0x40080000,  0x10000 },
-    [IBEX_DEV_PLIC] =           {  0x40090000,  0x10000 },
-    [IBEX_DEV_PWRMGR] =         {  0x400A0000,  0x10000 },
-    [IBEX_DEV_RSTMGR] =         {  0x400B0000,  0x10000 },
-    [IBEX_DEV_CLKMGR] =         {  0x400C0000,  0x10000 },
-    [IBEX_DEV_AES] =            {  0x40110000,  0x10000 },
-    [IBEX_DEV_HMAC] =           {  0x40120000,  0x10000 },
-    [IBEX_DEV_ALERT_HANDLER] =  {  0x40130000,  0x10000 },
-    [IBEX_DEV_NMI_GEN] =        {  0x40140000,  0x10000 },
-    [IBEX_DEV_USBDEV] =         {  0x40150000,  0x10000 },
-    [IBEX_DEV_PADCTRL] =        {  0x40160000,  0x10000 }
+    [IBEX_DEV_UART] =           {  0x40000000,  0x1000  },
+    [IBEX_DEV_GPIO] =           {  0x40040000,  0x1000  },
+    [IBEX_DEV_SPI] =            {  0x40050000,  0x1000  },
+    [IBEX_DEV_I2C] =            {  0x40080000,  0x1000  },
+    [IBEX_DEV_PATTGEN] =        {  0x400e0000,  0x1000  },
+    [IBEX_DEV_RV_TIMER] =       {  0x40100000,  0x1000  },
+    [IBEX_DEV_SENSOR_CTRL] =    {  0x40110000,  0x1000  },
+    [IBEX_DEV_OTP_CTRL] =       {  0x40130000,  0x4000  },
+    [IBEX_DEV_PWRMGR] =         {  0x40400000,  0x1000  },
+    [IBEX_DEV_RSTMGR] =         {  0x40410000,  0x1000  },
+    [IBEX_DEV_CLKMGR] =         {  0x40420000,  0x1000  },
+    [IBEX_DEV_PINMUX] =         {  0x40460000,  0x1000  },
+    [IBEX_DEV_PADCTRL] =        {  0x40470000,  0x1000  },
+    [IBEX_DEV_USBDEV] =         {  0x40500000,  0x1000  },
+    [IBEX_DEV_FLASH_CTRL] =     {  0x41000000,  0x1000  },
+    [IBEX_DEV_PLIC] =           {  0x41010000,  0x1000  },
+    [IBEX_DEV_AES] =            {  0x41100000,  0x1000  },
+    [IBEX_DEV_HMAC] =           {  0x41110000,  0x1000  },
+    [IBEX_DEV_KMAC] =           {  0x41120000,  0x1000  },
+    [IBEX_DEV_KEYMGR] =         {  0x41130000,  0x1000  },
+    [IBEX_DEV_CSRNG] =          {  0x41150000,  0x1000  },
+    [IBEX_DEV_ENTROPY] =        {  0x41160000,  0x1000  },
+    [IBEX_DEV_EDNO] =           {  0x41170000,  0x1000  },
+    [IBEX_DEV_EDN1] =           {  0x41180000,  0x1000  },
+    [IBEX_DEV_ALERT_HANDLER] =  {  0x411b0000,  0x1000  },
+    [IBEX_DEV_NMI_GEN] =        {  0x411c0000,  0x1000  },
+    [IBEX_DEV_OTBN] =           {  0x411d0000,  0x10000 },
 };
 
 static void opentitan_board_init(MachineState *machine)
@@ -156,30 +167,52 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
         memmap[IBEX_DEV_GPIO].base, memmap[IBEX_DEV_GPIO].size);
     create_unimplemented_device("riscv.lowrisc.ibex.spi",
         memmap[IBEX_DEV_SPI].base, memmap[IBEX_DEV_SPI].size);
-    create_unimplemented_device("riscv.lowrisc.ibex.flash_ctrl",
-        memmap[IBEX_DEV_FLASH_CTRL].base, memmap[IBEX_DEV_FLASH_CTRL].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.i2c",
+        memmap[IBEX_DEV_I2C].base, memmap[IBEX_DEV_I2C].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.pattgen",
+        memmap[IBEX_DEV_PATTGEN].base, memmap[IBEX_DEV_PATTGEN].size);
     create_unimplemented_device("riscv.lowrisc.ibex.rv_timer",
         memmap[IBEX_DEV_RV_TIMER].base, memmap[IBEX_DEV_RV_TIMER].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.sensor_ctrl",
+        memmap[IBEX_DEV_SENSOR_CTRL].base, memmap[IBEX_DEV_SENSOR_CTRL].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.otp_ctrl",
+        memmap[IBEX_DEV_OTP_CTRL].base, memmap[IBEX_DEV_OTP_CTRL].size);
     create_unimplemented_device("riscv.lowrisc.ibex.pwrmgr",
         memmap[IBEX_DEV_PWRMGR].base, memmap[IBEX_DEV_PWRMGR].size);
     create_unimplemented_device("riscv.lowrisc.ibex.rstmgr",
         memmap[IBEX_DEV_RSTMGR].base, memmap[IBEX_DEV_RSTMGR].size);
     create_unimplemented_device("riscv.lowrisc.ibex.clkmgr",
         memmap[IBEX_DEV_CLKMGR].base, memmap[IBEX_DEV_CLKMGR].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.pinmux",
+        memmap[IBEX_DEV_PINMUX].base, memmap[IBEX_DEV_PINMUX].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.padctrl",
+        memmap[IBEX_DEV_PADCTRL].base, memmap[IBEX_DEV_PADCTRL].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.usbdev",
+        memmap[IBEX_DEV_USBDEV].base, memmap[IBEX_DEV_USBDEV].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.flash_ctrl",
+        memmap[IBEX_DEV_FLASH_CTRL].base, memmap[IBEX_DEV_FLASH_CTRL].size);
     create_unimplemented_device("riscv.lowrisc.ibex.aes",
         memmap[IBEX_DEV_AES].base, memmap[IBEX_DEV_AES].size);
     create_unimplemented_device("riscv.lowrisc.ibex.hmac",
         memmap[IBEX_DEV_HMAC].base, memmap[IBEX_DEV_HMAC].size);
-    create_unimplemented_device("riscv.lowrisc.ibex.pinmux",
-        memmap[IBEX_DEV_PINMUX].base, memmap[IBEX_DEV_PINMUX].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.kmac",
+        memmap[IBEX_DEV_KMAC].base, memmap[IBEX_DEV_KMAC].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.keymgr",
+        memmap[IBEX_DEV_KEYMGR].base, memmap[IBEX_DEV_KEYMGR].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.csrng",
+        memmap[IBEX_DEV_CSRNG].base, memmap[IBEX_DEV_CSRNG].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.entropy",
+        memmap[IBEX_DEV_ENTROPY].base, memmap[IBEX_DEV_ENTROPY].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.edn0",
+        memmap[IBEX_DEV_EDNO].base, memmap[IBEX_DEV_EDNO].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.edn1",
+        memmap[IBEX_DEV_EDN1].base, memmap[IBEX_DEV_EDN1].size);
     create_unimplemented_device("riscv.lowrisc.ibex.alert_handler",
         memmap[IBEX_DEV_ALERT_HANDLER].base, memmap[IBEX_DEV_ALERT_HANDLER].size);
     create_unimplemented_device("riscv.lowrisc.ibex.nmi_gen",
         memmap[IBEX_DEV_NMI_GEN].base, memmap[IBEX_DEV_NMI_GEN].size);
-    create_unimplemented_device("riscv.lowrisc.ibex.usbdev",
-        memmap[IBEX_DEV_USBDEV].base, memmap[IBEX_DEV_USBDEV].size);
-    create_unimplemented_device("riscv.lowrisc.ibex.padctrl",
-        memmap[IBEX_DEV_PADCTRL].base, memmap[IBEX_DEV_PADCTRL].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.otbn",
+        memmap[IBEX_DEV_OTBN].base, memmap[IBEX_DEV_OTBN].size);
 }
 
 static void lowrisc_ibex_soc_class_init(ObjectClass *oc, void *data)
-- 
2.29.2


