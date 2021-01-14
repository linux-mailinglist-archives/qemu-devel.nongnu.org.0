Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675482F55DA
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 02:38:34 +0100 (CET)
Received: from localhost ([::1]:52772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzrar-0004kW-Fn
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 20:38:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzrVU-0001S8-4S
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 20:33:00 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:37715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzrVS-0005OI-HD
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 20:32:59 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 155035805C1;
 Wed, 13 Jan 2021 20:32:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 13 Jan 2021 20:32:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=XOlNwBn84S6z3
 g0YsZCrh7EPCXFotK9cQmm+pumQZhg=; b=YbObHP/M0Tz25bwt8Sd8Sl6gMxv4J
 8te+rZA0uTR1NfUiBYVNaHDL/R7fo7G7isxUv7CVIsY5Tewr4JeiytlfOza4FZ3j
 0VhRhNbJBHG0SMOA9gwisDq883irHKdI+KEp3lbcLWmXH0N/kqG+rVCqgQZlFnLc
 KXQ8oD3ryNQ0tzf3EDuMmBxlx/X4wZpV8TusYOKyLtJIJ1HFSJApWYOgBVUlBaPR
 bIBdkLQTH/7ZZUP1ABpWX1k6nPfnXci6mdkI2MmK0N9H5jr7HNY8/asuQs2gLQKh
 6xayUWG3mDNsct+b9xsniO0tx+8Vr/E/a6giNCCFA+qbfFf9GBEz2PoIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=XOlNwBn84S6z3g0YsZCrh7EPCXFotK9cQmm+pumQZhg=; b=a9MQRb5l
 ZBE6juQo/KnQDA6iQbaaVrngO4uHSBumcuUfTeZ552pmrMnw/g0KvSHSJFufA1rZ
 hl7qyKWdblRmMztqqSSqCJ+sMTV3pAMsZnfDSs+uN3Ngvu7OrPOMzwloAl6lL8P4
 Jqyu5rLRsgPBSAuECkP3vG2xAXpf1d1AxpTXK73j80NW4w7QsFKG9lEAJdGH52N0
 fcHx17Z8oCf86PNnY0UWKdW1369MuIsgjhUvsUPMM4XJfSM47CbhtpbUD+zOLRma
 UlxwI0mUCicyEn9ANu6QaHBqQG3tA9UsB5VMylcPCRyYZLFMMz4R2sNcqhtahLLE
 mv17i/JjYusWYg==
X-ME-Sender: <xms:SZ__X1Lfga-eMEcwRCAukpnGy5TyncSGiTYxSO9Lxxi834px3UO0Ow>
 <xme:SZ__XxLefaywYP-iUWMXOnFZxrrhYNw-UQMWgYtjAZx0CXwGVbgTma5w9QVsuqQDy
 8sTLH7z35d-7TkJ09M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtdeggdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfhirgiguhhn
 ucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtf
 frrghtthgvrhhnpeejiefhgfetleekleffudektdehvedujedvgeekkeejfefhhffhtedu
 tefgtdffueenucfkphepuddujedrudefiedrkedrudeggeenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:SZ__X9sRFNO62OH8vpFUOPzmdC0mBV7ba6Du3Kd1txcvOeVgPgdb4w>
 <xmx:SZ__X2bIXYzX2nQN8YF9xsNVQkODB0jg4UtvtVokswYiSwDpf8RCWg>
 <xmx:SZ__X8a7RXSy9Ktp6IXUkTP9Z3cjEkKpN7ODY2I8UsTlxHErLoumnw>
 <xmx:SZ__X0Gt2sKENqWkQM2lEuvgV5A1eFgJfofqQCjvS_9-Xqb2efXpww>
Received: from localhost.localdomain (unknown [117.136.8.144])
 by mail.messagingengine.com (Postfix) with ESMTPA id B3BDC1080059;
 Wed, 13 Jan 2021 20:32:54 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] hw/mips/loongson3_virt: Add TCG SMP support
Date: Thu, 14 Jan 2021 09:31:47 +0800
Message-Id: <20210114013147.92962-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210114013147.92962-1-jiaxun.yang@flygoat.com>
References: <20210114013147.92962-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.230;
 envelope-from=jiaxun.yang@flygoat.com; helo=new4-smtp.messagingengine.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

loongson3_virt has KVM SMP support in kenrel.
This patch adds TCG SMP support by enable IPI controller
for machine.

Note that TCG SMP can only support up to 4 CPUs as we
didn't implement multi-node support.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/loongson3_bootp.h |  1 +
 hw/mips/loongson3_virt.c  | 20 +++++++++++++++++++-
 hw/mips/Kconfig           |  1 +
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/hw/mips/loongson3_bootp.h b/hw/mips/loongson3_bootp.h
index 09f8480abf..4756aa44f6 100644
--- a/hw/mips/loongson3_bootp.h
+++ b/hw/mips/loongson3_bootp.h
@@ -210,6 +210,7 @@ enum {
     VIRT_PCIE_ECAM,
     VIRT_BIOS_ROM,
     VIRT_UART,
+    VIRT_IPIS,
     VIRT_LIOINTC,
     VIRT_PCIE_MMIO,
     VIRT_HIGHMEM
diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
index d4a82fa536..0684a035b0 100644
--- a/hw/mips/loongson3_virt.c
+++ b/hw/mips/loongson3_virt.c
@@ -35,6 +35,7 @@
 #include "hw/boards.h"
 #include "hw/char/serial.h"
 #include "hw/intc/loongson_liointc.h"
+#include "hw/intc/loongson_ipi.h"
 #include "hw/mips/mips.h"
 #include "hw/mips/cpudevs.h"
 #include "hw/mips/fw_cfg.h"
@@ -59,6 +60,7 @@
 
 #define PM_CNTL_MODE          0x10
 
+#define LOONGSON_TCG_MAX_VCPUS  4
 #define LOONGSON_MAX_VCPUS      16
 
 /*
@@ -71,6 +73,7 @@
 #define UART_IRQ            0
 #define RTC_IRQ             1
 #define PCIE_IRQ_BASE       2
+#define IPI_REG_SPACE       0x100
 
 const struct MemmapEntry virt_memmap[] = {
     [VIRT_LOWMEM] =      { 0x00000000,    0x10000000 },
@@ -81,6 +84,7 @@ const struct MemmapEntry virt_memmap[] = {
     [VIRT_PCIE_ECAM] =   { 0x1a000000,     0x2000000 },
     [VIRT_BIOS_ROM] =    { 0x1fc00000,      0x200000 },
     [VIRT_UART] =        { 0x1fe001e0,           0x8 },
+    [VIRT_IPIS] =        { 0x3ff01000,         0x400 },
     [VIRT_LIOINTC] =     { 0x3ff01400,          0x64 },
     [VIRT_PCIE_MMIO] =   { 0x40000000,    0x40000000 },
     [VIRT_HIGHMEM] =     { 0x80000000,           0x0 }, /* Variable */
@@ -495,6 +499,10 @@ static void mips_loongson3_virt_init(MachineState *machine)
             error_report("Loongson-3/TCG needs cpu type Loongson-3A1000");
             exit(1);
         }
+        if (machine->smp.cpus > LOONGSON_TCG_MAX_VCPUS) {
+            error_report("Loongson-3/TCG supports up to 4 CPUs");
+            exit(1);
+        }
     } else {
         if (!machine->cpu_type) {
             machine->cpu_type = MIPS_CPU_TYPE_NAME("Loongson-3A4000");
@@ -545,7 +553,17 @@ static void mips_loongson3_virt_init(MachineState *machine)
         qemu_register_reset(main_cpu_reset, cpu);
 
         if (i >= 4) {
-            continue; /* Only node-0 can be connected to LIOINTC */
+            continue; /* Only node-0 can be connected to LIOINTC and IPI */
+        }
+
+        if (!kvm_enabled()) {
+            /* IPI is handled by kernel for KVM */
+            DeviceState *ipi;
+            ipi = qdev_new(TYPE_LOONGSON_IPI);
+            sysbus_realize_and_unref(SYS_BUS_DEVICE(ipi), &error_fatal);
+            sysbus_mmio_map(SYS_BUS_DEVICE(ipi), 0,
+                            virt_memmap[VIRT_IPIS].base + IPI_REG_SPACE * i);
+            sysbus_connect_irq(SYS_BUS_DEVICE(ipi), 0, cpu->env.irq[6]);
         }
 
         for (ip = 0; ip < 4 ; ip++) {
diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index aadd436bf4..4fb0cc49e8 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -39,6 +39,7 @@ config LOONGSON3V
     select SERIAL
     select GOLDFISH_RTC
     select LOONGSON_LIOINTC
+    select LOONGSON_IPI if TCG
     select PCI_DEVICES
     select PCI_EXPRESS_GENERIC_BRIDGE
     select MSI_NONBROKEN
-- 
2.30.0


