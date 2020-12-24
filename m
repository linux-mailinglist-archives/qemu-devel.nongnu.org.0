Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2672E240E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 04:25:24 +0100 (CET)
Received: from localhost ([::1]:56238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksHFj-0007r1-6t
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 22:25:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ksH9N-0001kq-4h
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 22:18:50 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:56569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ksH9K-0003hu-Nx
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 22:18:48 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id EB9C4580387;
 Wed, 23 Dec 2020 22:18:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 23 Dec 2020 22:18:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=b5izmTwA3nYrF
 dHNrqlk5Uw2zV8hTbjkpHeUupc1mWc=; b=E6EW9j/MIIzt9eMFXbhuRfS8Jz9lg
 PuwV3IR1DiIDKKy8IO2sS6v+b7zqRjZdFSbA8D739XQbPO2FfcoFmAlxeCQ37nLx
 VIGavJJcpsEycpdT2t3WNnPnHOZtHh73ozen2ORYXAdv+5RwVJhAn6zUKva+bGNu
 KGVRBV0tPFdI83SBIj/a/qTijmfSR/LMXQwK+3KdVc3cUoqadZU4h2dUvDxxNMhK
 2WTuU4JmKu+BVRdP6HIyZAlEyU4FFNv9Ld7tcQx1tqlhs1Qf9m4ZbCvnZcSThoms
 6Yfcy/FOr4VuGHNrypH+hYBBqSz3KcDXADgqO7BbQfft/GccjYNcWAumg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=b5izmTwA3nYrFdHNrqlk5Uw2zV8hTbjkpHeUupc1mWc=; b=eXMjpS2G
 16zqQfMKegwLoUHVZcS1Vni9ftl0l3WeWP7/yWHCQiXQP6/uldSH+M7Uftv8NeXv
 d/GEnIFMNit3DNYq1NyHaPVpzS23fwFmDi2HqXmN/vgZE4T/RlktlrrMyw2twskX
 sRut8FuO3MM57dxPCXHaR9nPRjhyZik+BCcjWnn1XkKodG999JWUa/oQ/oeaYPwh
 ECPbH02OzJ3zacsui6dMgrTX8DWhdjzkIZG5Io7HEfN62pZ3LgYcXnIINd4BqJan
 fB2IikiCdMuzF6q6f3lwWmnvdyf9VYqJ7G95Hg2P12sxri/X0JtR/e7QpB8PHfZe
 B3IwAGIpcwq03A==
X-ME-Sender: <xms:lQjkXz0QBtpSh00XrijiJmfUfVtMFEkUzhmlc5XKz0cn7BSprCmFLA>
 <xme:lQjkXyHUXW1OdLTwA0RbfLiLrK-vsvYDIHaIaVnw9pDWP_uZuTz5U2zQvyEqGRljq
 y4vMlYNUKerthj0hk8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtkedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepjeeihffgteelkeelffdukedtheevudejvdegkeekjeefhffhhfet
 udetgfdtffeunecukfhppedvvdefrddutdegrddvuddvrdehleenucevlhhushhtvghruf
 hiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
 lhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:lQjkXz5QVQGmlrIKmFekxdtUVIZDEPwNd-DgE3Yy7unDVdlWkQlyJQ>
 <xmx:lQjkX41Kdjm9DKAUhdq3frxyoGUQ7NEQY9q9ET4BbonN9UhZwE214g>
 <xmx:lQjkX2EwmPoxUihmpj0uumTkhkKMOoYqThtJKzGClOlaJ8s3nNr5iA>
 <xmx:lQjkXygrGYhrU69OZLneC9ts-UMcds-J88Qm9s-wef590KBJcbwXrC00AUg>
Received: from localhost.localdomain (unknown [223.104.212.59])
 by mail.messagingengine.com (Postfix) with ESMTPA id DC6D91080059;
 Wed, 23 Dec 2020 22:18:40 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/8] hw/mips/fuloong2e: Add highmem support
Date: Thu, 24 Dec 2020 11:17:49 +0800
Message-Id: <20201224031750.52146-8-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201224031750.52146-1-jiaxun.yang@flygoat.com>
References: <20201224031750.52146-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=66.111.4.229;
 envelope-from=jiaxun.yang@flygoat.com; helo=new3-smtp.messagingengine.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

highmem starts at 0x20000000.
Now we can have up to 2G RAM.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2: Handle SPD for dual DIMM correctly.
v3: Typo corrections
---
 hw/mips/fuloong2e.c | 61 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 12 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 2744b211fd..9c468974db 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -56,6 +56,7 @@
 /* Fuloong 2e has a 512k flash: Winbond W39L040AP70Z */
 #define BIOS_SIZE               (512 * KiB)
 #define MAX_IDE_BUS             2
+#define HIGHMEM_START           0x20000000
 
 /*
  * PMON is not part of qemu and released with BSD license, anyone
@@ -71,7 +72,8 @@
 #define FULOONG2E_RTL8139_SLOT    7
 
 static struct _loaderparams {
-    int ram_size;
+    int ram_low_size;
+    int ram_high_size;
     const char *kernel_filename;
     const char *kernel_cmdline;
     const char *initrd_filename;
@@ -128,14 +130,14 @@ static uint64_t load_kernel(MIPSCPU *cpu)
         initrd_size = get_image_size(loaderparams.initrd_filename);
         if (initrd_size > 0) {
             initrd_offset = ROUND_UP(kernel_high, INITRD_PAGE_SIZE);
-            if (initrd_offset + initrd_size > loaderparams.ram_size) {
+            if (initrd_offset + initrd_size > loaderparams.ram_low_size) {
                 error_report("memory too small for initial ram disk '%s'",
                              loaderparams.initrd_filename);
                 exit(1);
             }
             initrd_size = load_image_targphys(loaderparams.initrd_filename,
                                               initrd_offset,
-                                              loaderparams.ram_size - initrd_offset);
+                                              loaderparams.ram_low_size - initrd_offset);
         }
         if (initrd_size == (target_ulong) -1) {
             error_report("could not load initial ram disk '%s'",
@@ -160,7 +162,11 @@ static uint64_t load_kernel(MIPSCPU *cpu)
 
     /* Setup minimum environment variables */
     prom_set(prom_buf, index++, "cpuclock=%u", clock_get_hz(cpu->clock));
-    prom_set(prom_buf, index++, "memsize=%"PRIi64, loaderparams.ram_size / MiB);
+    prom_set(prom_buf, index++, "memsize=%"PRIi64, loaderparams.ram_low_size / MiB);
+    if (loaderparams.ram_high_size > 0) {
+            prom_set(prom_buf, index++, "highmemsize=%"PRIi64,
+                    loaderparams.ram_high_size / MiB);
+    }
     prom_set(prom_buf, index++, NULL);
 
     rom_add_blob_fixed("prom", prom_buf, prom_size, ENVP_PADDR);
@@ -186,7 +192,7 @@ static void write_bootloader(CPUMIPSState *env, uint8_t *base,
     p = (uint32_t *)(base + 0x040);
 
     bl_gen_jump_kernel(&p, ENVP_VADDR - 64, 2, ENVP_VADDR,
-                       ENVP_VADDR + 8, loaderparams.ram_size,
+                       ENVP_VADDR + 8, loaderparams.ram_low_size,
                        kernel_addr);
 }
 
@@ -258,8 +264,11 @@ static void mips_fuloong2e_init(MachineState *machine)
     const char *kernel_filename = machine->kernel_filename;
     const char *kernel_cmdline = machine->kernel_cmdline;
     const char *initrd_filename = machine->initrd_filename;
+    ram_addr_t ram_low_size, ram_high_size = 0;
     char *filename;
     MemoryRegion *address_space_mem = get_system_memory();
+    MemoryRegion *ram_low_alias = g_new(MemoryRegion, 1);
+    MemoryRegion *ram_high_alias;
     MemoryRegion *bios = g_new(MemoryRegion, 1);
     long bios_size;
     uint8_t *spd_data;
@@ -282,12 +291,31 @@ static void mips_fuloong2e_init(MachineState *machine)
 
     qemu_register_reset(main_cpu_reset, cpu);
 
-    /* TODO: support more than 256M RAM as highmem */
-    if (machine->ram_size != 256 * MiB) {
-        error_report("Invalid RAM size, should be 256MB");
+    if (machine->ram_size > 2 * GiB) {
+        error_report("Too much memory for this machine: %" PRId64 "MB,"
+                     " maximum 2048MB", machine->ram_size / MiB);
         exit(EXIT_FAILURE);
     }
-    memory_region_add_subregion(address_space_mem, 0, machine->ram);
+
+    ram_low_size = MIN(machine->ram_size, 256 * MiB);
+
+    memory_region_init_alias(ram_low_alias, NULL,
+                            "ram_low_alias",
+                            machine->ram, 0,
+                            ram_low_size);
+    memory_region_add_subregion(address_space_mem, 0,
+                                ram_low_alias);
+
+    if (machine->ram_size > 256 * MiB) {
+        ram_high_alias = g_new(MemoryRegion, 1);
+        ram_high_size = machine->ram_size - ram_low_size;
+        memory_region_init_alias(ram_high_alias, NULL,
+                                "ram_high_alias",
+                                machine->ram, ram_low_size,
+                                ram_high_size);
+        memory_region_add_subregion(address_space_mem, HIGHMEM_START,
+                                    ram_high_alias);
+    }
 
     /* Boot ROM */
     memory_region_init_rom(bios, NULL, "fuloong2e.bios", BIOS_SIZE,
@@ -300,7 +328,8 @@ static void mips_fuloong2e_init(MachineState *machine)
      */
 
     if (kernel_filename) {
-        loaderparams.ram_size = machine->ram_size;
+        loaderparams.ram_low_size = ram_low_size;
+        loaderparams.ram_high_size = ram_high_size;
         loaderparams.kernel_filename = kernel_filename;
         loaderparams.kernel_cmdline = kernel_cmdline;
         loaderparams.initrd_filename = initrd_filename;
@@ -345,8 +374,16 @@ static void mips_fuloong2e_init(MachineState *machine)
     }
 
     /* Populate SPD eeprom data */
-    spd_data = spd_data_generate(DDR, machine->ram_size);
-    smbus_eeprom_init_one(smbus, 0x50, spd_data);
+    if (machine->ram_size <= 1 * GiB) {
+        /* It supports maximum of 1 GiB per DIMM */
+        spd_data = spd_data_generate(DDR, machine->ram_size);
+        smbus_eeprom_init_one(smbus, 0x50, spd_data);
+    } else {
+        /* Split to dual DIMM for more than 1 GiB  */
+        spd_data = spd_data_generate(DDR, machine->ram_size / 2);
+        smbus_eeprom_init_one(smbus, 0x50, spd_data);
+        smbus_eeprom_init_one(smbus, 0x51, spd_data);
+    }
 
     mc146818_rtc_init(isa_bus, 2000, NULL);
 
-- 
2.29.2


