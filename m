Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB9C2F26C0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 04:37:23 +0100 (CET)
Received: from localhost ([::1]:55078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzAUl-0003wy-0q
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 22:37:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzAQz-0001Mz-8s
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 22:33:34 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:60567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzAQw-0001Li-FB
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 22:33:29 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 79F2158058D;
 Mon, 11 Jan 2021 22:33:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 11 Jan 2021 22:33:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=++sU1rL1R7cJU
 XiQgehNhtvWyv2dn1/hfiDlIC0/mV4=; b=bJ21v5ki4eiTZfxE0TjB8sTBBasl/
 U3iZ7o71oZkEIM0pMOf2maX31ju2a3TMa3KpnHbQld1C0xSGNrWKfdViOUmE1Fk6
 8pHqxfIyU+TQsZt2vzzwBBfED4lktJxqDTwRBaz0uSPj3kf0vBqqnb0oosHy11rm
 YkrB5MAKVxk9qoxhgid10nJ9OGLDj3HhhsGodrgZbaf8OtrPBE+JTuRsxVz/euyn
 gvjlD3IRsbAbrb4XVpu1yx5xwwV6xaOj+H0HBr5G+qgLrcwXjZFNPQdEsT+wicRp
 IxqVPiEp12aEpCEb7t8pDsNdLVZykQHJtd8FULqFUEwGmBkuZ/9EfR/3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=++sU1rL1R7cJUXiQgehNhtvWyv2dn1/hfiDlIC0/mV4=; b=PVZfFbgl
 JO6Ztr1tfp8NidxL61ZEM8yinCO6DFp7LE6I6Hwk+p8HwA3rwI2XDhHL6fCxNBOK
 zLvEqUdWFmjbe/yq5AmQPvODtZO127xMVGKH/ba+rU7Tg0dfcLQ1Pufm7Xa9K4/2
 FMVbOJWQEIuXNT1QHV82XQ9GFr2ExeGsZG8Kfa8Q8arO969bCxZ6NzXONPP8WqSz
 0Mj/PKKX8h9Kcu1hYRYrBeJk4VKVda+TJwGDryEsCk4ptboIy+kiCABhKhe+nj8l
 I/q27wL8T0pfeZeC7htS06mer5YjGbwoJxzCUrS4rgnx1nzyGkQw+3HUq2ipWrj/
 TuOekwyMRxf42w==
X-ME-Sender: <xms:hBj9X2xWfuWiar7szNH7mkobzXuJW6kLsZxrbiFx5DfrNtvCmpIIzQ>
 <xme:hBj9XyTw9dO51tecKsN9sn4-IjdgPWS7mkmTnBjUpYx5rNpzR3bqUJgwARhRK9Yxg
 _jLdpJ-j_iqMKHKWdU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehvddgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepjeeihffgteelkeelffdukedtheevudejvdegkeekjeefhffhhfet
 udetgfdtffeunecukfhppedukedtrdeljedrvdegtddrvddunecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhl
 hihgohgrthdrtghomh
X-ME-Proxy: <xmx:hBj9X4XvB8bZnODT5mTGi2ycgyyOVRLHLZ-2xLIv4w6aDkifB9rkbw>
 <xmx:hBj9X8jlEdwz80DCTHD6z7tnFX4Q0sglFeBa-zYNo94ihuBwayE6hw>
 <xmx:hBj9X4BKtEgvvkMcw15Y_0VvY1W5lu1_OiU7mN0BZIgOEgFlyceIJw>
 <xmx:hRj9X7MnzlqdE6RUpIOKbrKhz2TcXPTA7edk12EU6RhDJVX8K8067A>
Received: from localhost.localdomain (unknown [180.97.240.21])
 by mail.messagingengine.com (Postfix) with ESMTPA id 502701080067;
 Mon, 11 Jan 2021 22:33:19 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/mips/loongson3_virt: Add TCG SMP support
Date: Tue, 12 Jan 2021 11:32:53 +0800
Message-Id: <20210112033253.138140-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210112033253.138140-1-jiaxun.yang@flygoat.com>
References: <20210112033253.138140-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=66.111.4.224;
 envelope-from=jiaxun.yang@flygoat.com; helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
 hw/mips/Kconfig           |  1 +
 hw/mips/loongson3_bootp.h |  1 +
 hw/mips/loongson3_virt.c  | 20 +++++++++++++++++++-
 3 files changed, 21 insertions(+), 1 deletion(-)

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
-- 
2.30.0


