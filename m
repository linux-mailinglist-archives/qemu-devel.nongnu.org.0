Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A1D1C6571
	for <lists+qemu-devel@lfdr.de>; Wed,  6 May 2020 03:22:24 +0200 (CEST)
Received: from localhost ([::1]:51732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jW8lT-0000ue-3w
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 21:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3884e71da=alistair.francis@wdc.com>)
 id 1jW8jg-0007vR-S6; Tue, 05 May 2020 21:20:32 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:1670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3884e71da=alistair.francis@wdc.com>)
 id 1jW8je-0005N2-Kn; Tue, 05 May 2020 21:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1588728031; x=1620264031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+n/mufbfP8GMD6LJEhMJy6CTB2O7tHSCoE9CO3G3mgM=;
 b=PV3LyRNy/ootdr+T1SxcSayPgf6krS2YQD1z7AxxC6P1XeNxQntALKdK
 q/cGEztGG9j6qtMc/79rAdox6xQEo99amjfAhUbFyRMJEEypHgN8KKVXv
 kqWTAm2/IAXacY2IAnVJ2w6iRDzkcsKsrGmpsPFo3Th0quqp/4bdlUITZ
 MDAYD585YB+nR04f1ZoyQV8UhIa7UaaRatGukdBRhABDDDDalrSeCDFln
 FRMWCkq8ltJfoXE7/bLFjfhj0i3iB3ZbwV3a51793fMBSI2/KPJYsMyv/
 +dpwJ+er4cOjJiZj5MP3M7bgEpQLsjrPZTDgI1VygyMR97fgxsdWqh17g g==;
IronPort-SDR: MXlCU0DdJmm6SGiP2A5SxPrtv1C3NHXN8hrNij6YLg783bx77OTIufB8/mF0OD1JLgyfxu5/TZ
 UptXTpjbDF3m+9W5g8Nxl4sn4Fi/izDDNkN0v60W+Prt1JP4xbPk/S5bcAwtXBF9v7rfRslhPa
 sThYbUsrj+wm76NtXJCAyks0uTJQsjn7Cz5X2fRp1W12F6xkv96+Szgs6VdZQffGOjkpkSgthq
 2/7tEvGlztNy6QLZFNCsXd10ocJ8NmPUxWst9xGF4Us3vRVIhS6Ki4ZJozQdU/PumpPPfHFdy9
 DdE=
X-IronPort-AV: E=Sophos;i="5.73,357,1583164800"; d="scan'208";a="138433827"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2020 09:20:26 +0800
IronPort-SDR: 3Sno6j5C2FA1FjCG3Py7wSrgY7QAy1ACFCR0XKmnb3uwJygvou6JGLca/B924oZEydLGR4wO//
 F7ixiqF1Lk4FLKjLzO7HvWPFYnUEjBQ+U=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2020 18:10:52 -0700
IronPort-SDR: ytzNuk7+qEfoIK+bD4KYwvOF9SCsf88YQdX3zTIIgD2ps5j8Eg2FvIHp/brzrh5/+e60huL9JT
 fY2/zFuIs98A==
WDCIronportException: Internal
Received: from use204286.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.56.224])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2020 18:20:24 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v1 1/2] hw/riscv: spike: Remove deprecated ISA specific
 machines
Date: Tue,  5 May 2020 18:12:07 -0700
Message-Id: <a051869c728f7f9c5e274b363ee76fc16451a043.1588727508.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1588727508.git.alistair.francis@wdc.com>
References: <cover.1588727508.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=3884e71da=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 21:20:25
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ISA specific Spike machines have  been deprecated in QEMU since 4.1,
let's finally remove them.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/spike.c         | 217 ---------------------------------------
 include/hw/riscv/spike.h |   6 +-
 2 files changed, 2 insertions(+), 221 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index d0c4843712..7bbbdb5036 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -257,221 +257,6 @@ static void spike_board_init(MachineState *machine)
         false);
 }
 
-static void spike_v1_10_0_board_init(MachineState *machine)
-{
-    const struct MemmapEntry *memmap = spike_memmap;
-
-    SpikeState *s = g_new0(SpikeState, 1);
-    MemoryRegion *system_memory = get_system_memory();
-    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
-    MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
-    int i;
-    unsigned int smp_cpus = machine->smp.cpus;
-
-    if (!qtest_enabled()) {
-        info_report("The Spike v1.10.0 machine has been deprecated. "
-                    "Please use the generic spike machine and specify the ISA "
-                    "versions using -cpu.");
-    }
-
-    /* Initialize SOC */
-    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
-                            TYPE_RISCV_HART_ARRAY, &error_abort, NULL);
-    object_property_set_str(OBJECT(&s->soc), SPIKE_V1_10_0_CPU, "cpu-type",
-                            &error_abort);
-    object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
-                            &error_abort);
-    object_property_set_bool(OBJECT(&s->soc), true, "realized",
-                            &error_abort);
-
-    /* register system main memory (actual RAM) */
-    memory_region_init_ram(main_mem, NULL, "riscv.spike.ram",
-                           machine->ram_size, &error_fatal);
-    memory_region_add_subregion(system_memory, memmap[SPIKE_DRAM].base,
-        main_mem);
-
-    /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
-
-    /* boot rom */
-    memory_region_init_rom(mask_rom, NULL, "riscv.spike.mrom",
-                           memmap[SPIKE_MROM].size, &error_fatal);
-    memory_region_add_subregion(system_memory, memmap[SPIKE_MROM].base,
-                                mask_rom);
-
-    if (machine->kernel_filename) {
-        riscv_load_kernel(machine->kernel_filename, htif_symbol_callback);
-    }
-
-    /* reset vector */
-    uint32_t reset_vec[8] = {
-        0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(dtb) */
-        0x02028593,                  /*     addi   a1, t0, %pcrel_lo(1b) */
-        0xf1402573,                  /*     csrr   a0, mhartid  */
-#if defined(TARGET_RISCV32)
-        0x0182a283,                  /*     lw     t0, 24(t0) */
-#elif defined(TARGET_RISCV64)
-        0x0182b283,                  /*     ld     t0, 24(t0) */
-#endif
-        0x00028067,                  /*     jr     t0 */
-        0x00000000,
-        memmap[SPIKE_DRAM].base,     /* start: .dword DRAM_BASE */
-        0x00000000,
-                                     /* dtb: */
-    };
-
-    /* copy in the reset vector in little_endian byte order */
-    for (i = 0; i < sizeof(reset_vec) >> 2; i++) {
-        reset_vec[i] = cpu_to_le32(reset_vec[i]);
-    }
-    rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
-                          memmap[SPIKE_MROM].base, &address_space_memory);
-
-    /* copy in the device tree */
-    if (fdt_pack(s->fdt) || fdt_totalsize(s->fdt) >
-            memmap[SPIKE_MROM].size - sizeof(reset_vec)) {
-        error_report("not enough space to store device-tree");
-        exit(1);
-    }
-    qemu_fdt_dumpdtb(s->fdt, fdt_totalsize(s->fdt));
-    rom_add_blob_fixed_as("mrom.fdt", s->fdt, fdt_totalsize(s->fdt),
-                          memmap[SPIKE_MROM].base + sizeof(reset_vec),
-                          &address_space_memory);
-
-    /* initialize HTIF using symbols found in load_kernel */
-    htif_mm_init(system_memory, mask_rom, &s->soc.harts[0].env, serial_hd(0));
-
-    /* Core Local Interruptor (timer and IPI) */
-    sifive_clint_create(memmap[SPIKE_CLINT].base, memmap[SPIKE_CLINT].size,
-        smp_cpus, SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
-        false);
-}
-
-static void spike_v1_09_1_board_init(MachineState *machine)
-{
-    const struct MemmapEntry *memmap = spike_memmap;
-
-    SpikeState *s = g_new0(SpikeState, 1);
-    MemoryRegion *system_memory = get_system_memory();
-    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
-    MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
-    int i;
-    unsigned int smp_cpus = machine->smp.cpus;
-
-    if (!qtest_enabled()) {
-        info_report("The Spike v1.09.1 machine has been deprecated. "
-                    "Please use the generic spike machine and specify the ISA "
-                    "versions using -cpu.");
-    }
-
-    /* Initialize SOC */
-    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
-                            TYPE_RISCV_HART_ARRAY, &error_abort, NULL);
-    object_property_set_str(OBJECT(&s->soc), SPIKE_V1_09_1_CPU, "cpu-type",
-                            &error_abort);
-    object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
-                            &error_abort);
-    object_property_set_bool(OBJECT(&s->soc), true, "realized",
-                            &error_abort);
-
-    /* register system main memory (actual RAM) */
-    memory_region_init_ram(main_mem, NULL, "riscv.spike.ram",
-                           machine->ram_size, &error_fatal);
-    memory_region_add_subregion(system_memory, memmap[SPIKE_DRAM].base,
-        main_mem);
-
-    /* boot rom */
-    memory_region_init_rom(mask_rom, NULL, "riscv.spike.mrom",
-                           memmap[SPIKE_MROM].size, &error_fatal);
-    memory_region_add_subregion(system_memory, memmap[SPIKE_MROM].base,
-                                mask_rom);
-
-    if (machine->kernel_filename) {
-        riscv_load_kernel(machine->kernel_filename, htif_symbol_callback);
-    }
-
-    /* reset vector */
-    uint32_t reset_vec[8] = {
-        0x297 + memmap[SPIKE_DRAM].base - memmap[SPIKE_MROM].base, /* lui */
-        0x00028067,                   /* jump to DRAM_BASE */
-        0x00000000,                   /* reserved */
-        memmap[SPIKE_MROM].base + sizeof(reset_vec), /* config string pointer */
-        0, 0, 0, 0                    /* trap vector */
-    };
-
-    /* part one of config string - before memory size specified */
-    const char *config_string_tmpl =
-        "platform {\n"
-        "  vendor ucb;\n"
-        "  arch spike;\n"
-        "};\n"
-        "rtc {\n"
-        "  addr 0x%" PRIx64 "x;\n"
-        "};\n"
-        "ram {\n"
-        "  0 {\n"
-        "    addr 0x%" PRIx64 "x;\n"
-        "    size 0x%" PRIx64 "x;\n"
-        "  };\n"
-        "};\n"
-        "core {\n"
-        "  0" " {\n"
-        "    " "0 {\n"
-        "      isa %s;\n"
-        "      timecmp 0x%" PRIx64 "x;\n"
-        "      ipi 0x%" PRIx64 "x;\n"
-        "    };\n"
-        "  };\n"
-        "};\n";
-
-    /* build config string with supplied memory size */
-    char *isa = riscv_isa_string(&s->soc.harts[0]);
-    char *config_string = g_strdup_printf(config_string_tmpl,
-        (uint64_t)memmap[SPIKE_CLINT].base + SIFIVE_TIME_BASE,
-        (uint64_t)memmap[SPIKE_DRAM].base,
-        (uint64_t)ram_size, isa,
-        (uint64_t)memmap[SPIKE_CLINT].base + SIFIVE_TIMECMP_BASE,
-        (uint64_t)memmap[SPIKE_CLINT].base + SIFIVE_SIP_BASE);
-    g_free(isa);
-    size_t config_string_len = strlen(config_string);
-
-    /* copy in the reset vector in little_endian byte order */
-    for (i = 0; i < sizeof(reset_vec) >> 2; i++) {
-        reset_vec[i] = cpu_to_le32(reset_vec[i]);
-    }
-    rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
-                          memmap[SPIKE_MROM].base, &address_space_memory);
-
-    /* copy in the config string */
-    rom_add_blob_fixed_as("mrom.reset", config_string, config_string_len,
-                          memmap[SPIKE_MROM].base + sizeof(reset_vec),
-                          &address_space_memory);
-
-    /* initialize HTIF using symbols found in load_kernel */
-    htif_mm_init(system_memory, mask_rom, &s->soc.harts[0].env, serial_hd(0));
-
-    /* Core Local Interruptor (timer and IPI) */
-    sifive_clint_create(memmap[SPIKE_CLINT].base, memmap[SPIKE_CLINT].size,
-        smp_cpus, SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
-        false);
-
-    g_free(config_string);
-}
-
-static void spike_v1_09_1_machine_init(MachineClass *mc)
-{
-    mc->desc = "RISC-V Spike Board (Privileged ISA v1.9.1)";
-    mc->init = spike_v1_09_1_board_init;
-    mc->max_cpus = 1;
-}
-
-static void spike_v1_10_0_machine_init(MachineClass *mc)
-{
-    mc->desc = "RISC-V Spike Board (Privileged ISA v1.10)";
-    mc->init = spike_v1_10_0_board_init;
-    mc->max_cpus = 1;
-}
-
 static void spike_machine_init(MachineClass *mc)
 {
     mc->desc = "RISC-V Spike Board";
@@ -481,6 +266,4 @@ static void spike_machine_init(MachineClass *mc)
     mc->default_cpu_type = SPIKE_V1_10_0_CPU;
 }
 
-DEFINE_MACHINE("spike_v1.9.1", spike_v1_09_1_machine_init)
-DEFINE_MACHINE("spike_v1.10", spike_v1_10_0_machine_init)
 DEFINE_MACHINE("spike", spike_machine_init)
diff --git a/include/hw/riscv/spike.h b/include/hw/riscv/spike.h
index dc770421bc..b98cfea0e4 100644
--- a/include/hw/riscv/spike.h
+++ b/include/hw/riscv/spike.h
@@ -39,11 +39,9 @@ enum {
 };
 
 #if defined(TARGET_RISCV32)
-#define SPIKE_V1_09_1_CPU TYPE_RISCV_CPU_RV32GCSU_V1_09_1
-#define SPIKE_V1_10_0_CPU TYPE_RISCV_CPU_RV32GCSU_V1_10_0
+#define SPIKE_V1_10_0_CPU TYPE_RISCV_CPU_SIFIVE_U34
 #elif defined(TARGET_RISCV64)
-#define SPIKE_V1_09_1_CPU TYPE_RISCV_CPU_RV64GCSU_V1_09_1
-#define SPIKE_V1_10_0_CPU TYPE_RISCV_CPU_RV64GCSU_V1_10_0
+#define SPIKE_V1_10_0_CPU TYPE_RISCV_CPU_SIFIVE_U54
 #endif
 
 #endif
-- 
2.26.2


