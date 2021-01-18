Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6B52F9744
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 02:19:12 +0100 (CET)
Received: from localhost ([::1]:32826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1JCK-0000BU-1F
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 20:19:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1JAi-0007ZO-2f
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 20:17:32 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:35703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1JAf-0007KL-8G
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 20:17:31 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id CA77511F6;
 Sun, 17 Jan 2021 20:17:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 17 Jan 2021 20:17:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=hctRHwsfCOPY9
 XXcpyWyK6N0Fi0R9C/3s181ZV4l6BA=; b=y7q/TfSAxV10vO8P4oc970+7o4nQu
 mH1LIfuUFSlSV6IdyfnF39vboljoyPpGOL4FoqNhZ6FimXBD4pjy5Q2nNzMvPWO+
 T1Dm9xjGJVx/TGF5/N8ShY752oQhehcWckgKVAYQsCfASo2r0IQuanrbZxc5I3G0
 uXOLxJW+MYwgGMPsV0snCcEjrzB/FqnkkboWqqjBzSpVI9rKetEv+MTbEN+Xf08H
 wutcKRfC2KqRSNA01sq4uLNI/J2ZU9HJC4ntz5vYx6O5U1+qP7X/6fcagmdR469h
 ShnN2SfIUHfyIik7QTl57AfKG131yeJkvGDkZlSgQ6g7X2WZVu3ZxtJkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=hctRHwsfCOPY9XXcpyWyK6N0Fi0R9C/3s181ZV4l6BA=; b=beWAsrcc
 dv10JkbwybeLV1bk5SMTdkg3wba78N19ExbOw+/fF5OTSi9DP0j3aRODOOMlumeT
 Tfs8GCGeRFqYpLIHHjc/7/lyNo8D14sK+aegaw4fVIqYrGElJah7QswPjHJugeT/
 thIYMIyoArk5UiIUCfmSJ0C6VlgqKkTr5oj+8F48SdPEKqRLjXEj65GNtQiyQxoi
 6BpoUqJ6i4c7KvBfX7xqxiVy8MtBrTuXSzL6Kq+0PLyeDrgy0GAVXcfC8HR+SH7j
 LSaIzQCD/1Zy/aF1Ysy44S7lHXd7u4TjlrZbNH9jkoae9xQtmDGP+NVR5gqjxfd5
 oeJibXeF2Pticw==
X-ME-Sender: <xms:puEEYJ25TPxiU3buPHeHahcyZYPQtAtpzvCnVRn7KOIZQDRneOSuvw>
 <xme:puEEYAEyIOZTeldpxFe7X-MTdaxZQr7460OKLZNjBs9d4sKA6s7LnFnsUFAEgtT7m
 6gAsDNS7xHb_O9T9PI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfhirgiguhhn
 ucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtf
 frrghtthgvrhhnpeejiefhgfetleekleffudektdehvedujedvgeekkeejfefhhffhtedu
 tefgtdffueenucfkphepudduiedrvddvkedrkeegrddvnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihg
 ohgrthdrtghomh
X-ME-Proxy: <xmx:puEEYJ6I7tZbBueRBFC2L5Fb0j4Ce7Skzv8UzIyYVNOjKQDmdLbUvA>
 <xmx:puEEYG2L2QywRNGOFVzhy0_ZQeIVHw_NRPPAteQE_FXq5NeLhvBNSQ>
 <xmx:puEEYMEPpDYKo-LzhWeTlFi0sMevJZ6l7S1fLipmXpFwKzrUlqEn7g>
 <xmx:puEEYGO3u7q_2Px3zoGJhiMXXKpa28uVlVOOSVd4r2N3p80Lv6QJAuxRGSU>
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5F78424005C;
 Sun, 17 Jan 2021 20:17:22 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] hw/mips/loongson3_virt: Add TCG SMP support
Date: Mon, 18 Jan 2021 09:17:06 +0800
Message-Id: <20210118011706.22639-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210118011706.22639-1-jiaxun.yang@flygoat.com>
References: <20210118011706.22639-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26;
 envelope-from=jiaxun.yang@flygoat.com; helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_PASS=-0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

loongson3_virt has KVM SMP support in kenrel.
This patch adds TCG SMP support by enable IPI controller
for machine.

Also add definition about IRQs to enhance readability.

Note that TCG SMP can only support up to 4 CPUs as we
didn't implement multi-node support.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/loongson3_bootp.h |  1 +
 hw/mips/loongson3_virt.c  | 41 ++++++++++++++++++++++++++++++++-------
 hw/mips/Kconfig           |  1 +
 3 files changed, 36 insertions(+), 7 deletions(-)

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
index d4a82fa536..0765addb7f 100644
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
@@ -59,7 +60,11 @@
 
 #define PM_CNTL_MODE          0x10
 
-#define LOONGSON_MAX_VCPUS      16
+#define VCPU_PER_NODE         4
+#define TCG_MAX_NODES         1
+#define KVM_MAX_NODES         4
+#define TCG_MAX_VCPUS         (TCG_MAX_NODES  * VCPU_PER_NODE)
+#define KVM_MAX_VCPUS         (KVM_MAX_NODES  * VCPU_PER_NODE)
 
 /*
  * Loongson-3's virtual machine BIOS can be obtained here:
@@ -68,9 +73,16 @@
  */
 #define LOONGSON3_BIOSNAME "bios_loongson3.bin"
 
+/* IRQ allocation of CPU IP */
+#define LIOINTC_IP_START    2
+#define LIOINTC_IP_END      5
+#define IPI_IP              6
+
+/* IRQ allcation of LIOINTC */
 #define UART_IRQ            0
 #define RTC_IRQ             1
 #define PCIE_IRQ_BASE       2
+#define IPI_REG_SPACE       0x100
 
 const struct MemmapEntry virt_memmap[] = {
     [VIRT_LOWMEM] =      { 0x00000000,    0x10000000 },
@@ -81,6 +93,7 @@ const struct MemmapEntry virt_memmap[] = {
     [VIRT_PCIE_ECAM] =   { 0x1a000000,     0x2000000 },
     [VIRT_BIOS_ROM] =    { 0x1fc00000,      0x200000 },
     [VIRT_UART] =        { 0x1fe001e0,           0x8 },
+    [VIRT_IPIS] =        { 0x3ff01000,         0x400 },
     [VIRT_LIOINTC] =     { 0x3ff01400,          0x64 },
     [VIRT_PCIE_MMIO] =   { 0x40000000,    0x40000000 },
     [VIRT_HIGHMEM] =     { 0x80000000,           0x0 }, /* Variable */
@@ -495,6 +508,10 @@ static void mips_loongson3_virt_init(MachineState *machine)
             error_report("Loongson-3/TCG needs cpu type Loongson-3A1000");
             exit(1);
         }
+        if (machine->smp.cpus > TCG_MAX_VCPUS) {
+            error_report("Loongson-3/TCG supports up to %d CPUs", TCG_MAX_VCPUS);
+            exit(1);
+        }
     } else {
         if (!machine->cpu_type) {
             machine->cpu_type = MIPS_CPU_TYPE_NAME("Loongson-3A4000");
@@ -544,14 +561,24 @@ static void mips_loongson3_virt_init(MachineState *machine)
         cpu_mips_clock_init(cpu);
         qemu_register_reset(main_cpu_reset, cpu);
 
-        if (i >= 4) {
-            continue; /* Only node-0 can be connected to LIOINTC */
+        if (i >= VCPU_PER_NODE) {
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
+            sysbus_connect_irq(SYS_BUS_DEVICE(ipi), 0, cpu->env.irq[IPI_IP]);
         }
 
-        for (ip = 0; ip < 4 ; ip++) {
-            int pin = i * 4 + ip;
+        for (ip = LIOINTC_IP_START; ip <= LIOINTC_IP_END ; ip++) {
+            int pin = i * 4 + (ip - LIOINTC_IP_START);
             sysbus_connect_irq(SYS_BUS_DEVICE(liointc),
-                               pin, cpu->env.irq[ip + 2]);
+                               pin, cpu->env.irq[ip]);
         }
     }
     env = &MIPS_CPU(first_cpu)->env;
@@ -619,7 +646,7 @@ static void loongson3v_machine_class_init(ObjectClass *oc, void *data)
     mc->desc = "Loongson-3 Virtualization Platform";
     mc->init = mips_loongson3_virt_init;
     mc->block_default_type = IF_IDE;
-    mc->max_cpus = LOONGSON_MAX_VCPUS;
+    mc->max_cpus = KVM_MAX_VCPUS;
     mc->default_ram_id = "loongson3.highram";
     mc->default_ram_size = 1600 * MiB;
     mc->kvm_type = mips_kvm_type;
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


