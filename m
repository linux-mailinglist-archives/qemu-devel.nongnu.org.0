Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB80268FD12
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 03:25:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPwbK-0006DC-9r; Wed, 08 Feb 2023 21:23:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pPwbI-0006Ck-80; Wed, 08 Feb 2023 21:23:52 -0500
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pPwbF-00015I-Ob; Wed, 08 Feb 2023 21:23:51 -0500
Received: by mail-vs1-xe2c.google.com with SMTP id g8so693809vso.3;
 Wed, 08 Feb 2023 18:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nO/zYB/D+7sZtAtEqF6/49Bw7nHtlppc32ReUMG0U+c=;
 b=pdaFASEn4svP4rah2le89A2gXw3/J3nzMC+FpN7geOOsPY2FlaDnpQDC8EZNtm7hQB
 nvSJuceuUAnUgay+tuG83h0wkJa1ag1NRt/P1ihvNWZARVBv+nhlPJGbosnKPwikU285
 FSg98AMEWl7iKt4Aa0PeKuCWvL2kygQAZ/+8Lrp8XI94GIscPE7vh/nL2dUTD1jVn1QR
 qp8LGRQCVcBT9jTZLxO2VO2BlgabMLrWtZ+p1kogBMHD7mCcSs/bbNzPhZZloqHSSiUn
 9IoSi57MLNwcUk9FVEgWLZF7pXH0NSOKdBBI5QicgshgYRyRemAeksyTFTAfAUz7JIvS
 tj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nO/zYB/D+7sZtAtEqF6/49Bw7nHtlppc32ReUMG0U+c=;
 b=5YdKBmu0v7KrhTstwnPTjS4g0jm3YeE2fzMYTJ0RBL08LMOM9mmLFS1iXp+UgQfK+r
 dJChudzqJ5PK1jXhuukqlQ5SkgI09opzU5uOpO4ox/LLcYzHMVAtr/HYbAl08NUOVka/
 YVlNRb79OPy0xlItLAYtK1DeQgcdyQW6ZdW2ezvWgcalkzeCe1rGyRWxuVwPKm2fB8lk
 IcykUte2J8fqqcGfH5WfXiUo0bkjud53v2TMGsu7MzjPw9kMmA4L7LBJw0IJDvx+2QxY
 d57OicUlamG61aYwTbF50aVXVjqidKUuDXgfPkVUr5WTTgZJtUHhhbM9yMY6pxo9PBW7
 ML0w==
X-Gm-Message-State: AO0yUKUCI2uxLI0gILm3j53sG2fiUiV/tIzqD+eFq2H0zOCebI7aCXnw
 1VTk37s5D/KgjvXdMKraD4I9RwWQNiXJYNwV1dwREqUB10I=
X-Google-Smtp-Source: AK7set+tp1wXDLfp6jNWVBpl8tghcztJVmj9qbH2IfqT+EbP21CIEwexXhkdUNYWDObr4U4c7Y+bVCgeyzAbvTuSVA4=
X-Received: by 2002:a67:a407:0:b0:3f0:89e1:7c80 with SMTP id
 n7-20020a67a407000000b003f089e17c80mr1981378vse.72.1675909428286; Wed, 08 Feb
 2023 18:23:48 -0800 (PST)
MIME-Version: 1.0
References: <20230207044003.3669059-1-bmeng@tinylab.org>
In-Reply-To: <20230207044003.3669059-1-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Feb 2023 12:23:22 +1000
Message-ID: <CAKmqyKM0JtZCLrV+Q8fjk+QCS3E0HbT_Zx4Kdk5db9jWKvcJDA@mail.gmail.com>
Subject: Re: [PATCH] roms/opensbi: Upgrade from v1.1 to v1.2
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Feb 7, 2023 at 2:41 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> Upgrade OpenSBI from v1.1 to v1.2 and the pre-built bios images.
>
> The v1.2 release includes the following commits:
>
> 994c8cf lib: sbi_timer: Added a conditional wait function which can timeout
> caa5eea lib: sbi: add check for ipi device for hsm start
> 0374ccf lib: sbi_hart: Shorten the code to set MPV bit
> 4e21cca lib: utils/serial: Update Shakti UART based on latest implementation
> 88b790f lib: sbi: Fix sbi_snprintf
> 1545afd lib: sbi: Fix counter index sanity check
> 83db3af lib: sbi: Add the bound check for events during config match
> 860a376 lib: sbi: Fix possible buffer overrun in counter validation
> 11c0008 lib: sbi: Fix fw_event_map initialization
> 8e86b23 lib: utils/fdt: Factor out common uart node code
> 7d28d3b lib: utils/serial: Initialize platform_uart_data to zero
> 7198e1d lib: serial: Clean up coding style in sifive-uart.c
> f272035 lib: utils/serial: Ensure baudrate is non-zero before using
> b9edf49 lib: sbi: Fix printf handling of long long
> 422f0e0 scripts: Add Kconfiglib v14.1.0 under scripts directory
> 662e631 Makefile: Add initial kconfig support for each platform
> de80e93 Makefile: Compile lib/utils sources separately for each platform
> 26bbff5 lib: utils/serial: Use kconfig for enabling/disabling drivers
> 2adc94b lib: utils/reset: Use kconfig for enabling/disabling drivers
> 3e76a60 lib: utils/sys: Use kconfig for enabling/disabling drivers
> 013dbb3 lib: utils/timer: Use kconfig for enabling/disabling drivers
> 76af9d4 lib: utils/ipi: Use kconfig for enabling/disabling drivers
> 0b1cf2f lib: utils/irqchip: Use kconfig for enabling/disabling drivers
> b126ce4 lib: utils/i2c: Use kconfig for enabling/disabling drivers
> 5616aa4 lib: utils/gpio: Use kconfig for enabling/disabling drivers
> 68d7b85 lib: utils/fdt: Use kconfig for enabling/disabling
> d514a8f platform: generic: Use kconfig for enabling/disabling overrides
> bc317a3 platform: generic: Use kconfig to set platform version and default name
> eccb9df platform: Remove redundant config.mk from all platforms
> 0723bab docs: Update documentation for kconfig support
> a6a8557 Makefile: Fix typo related to object.mk
> 9529e36 include: Add mstatus[h].GVA encodings
> 1fbe777 lib: sbi_trap: Save mstatus[h].GVA in trap->gva
> 1c4ce74 lib: sbi: Set gva when creating sbi_trap_info
> 5a0ca09 lib: sbi_trap: Set hypervisor CSRs for HS-mode
> a69eb6c lib: sbi_trap: Set hstatus.GVA when going to HS-mode
> 111afc1 lib: sbi_illegal_insn: Fix FENCE.TSO emulation infinite trap loop
> adf44b5 lib: sbi: Use the official extension name for AIA M-mode CSRs
> cbaa9b0 lib: utils: serial: Add Cadence UART driver
> 622cc5f include: Remove sideleg and sedeleg
> a90cf6b lib: sbi_pmu: Remove "event_idx" member from struct sbi_pmu_fw_event
> 1664d0e lib: sbi_pmu: Replace sbi_pmu_ctr_read() with sbi_pmu_ctr_fw_read()
> e238459 lib: sbi_pmu: Firmware counters are always 64 bits wide
> c9b388d lib: sbi_pmu: Simplify FW counters to reduce memory usage
> d10c1f4 lib: sbi_pmu: Add custom PMU device operations
> ee69f8e lib: sbi: Print platform PMU device at boot-time
> 5019fd1 include: sbi: Reduce includes in sbi_pmu.h
> d32b0a9 docs: pmu: fix Unmatched example typo
> 19664f6 docs: pmu: extend bindings example for Unmatched
> 37a0d83 lib: sbi_trap: Add helper to get GVA in sbi_trap_regs
> 46e744a lib: sbi_misaligned_ldst: Set GVA if not emulating
> 8ce486a lib: utils/fdt: Fix DT parsing in fdt_pmu_setup()
> 49372f2 lib: sbi: Fix sbi_strnlen wrong count decrement
> 7f09fba lib: utils/serial: add semihosting support
> 7105c18 docs/firmware: Update FW_JUMP documentation
> 3f3d401 docs: Fix some typos
> e54cb32 lib: sbi_pmu: move pmu irq information into pmu itself
> c316fa3 lib: sbi_hart: move hart_features struct to a public location
> 4f2acb5 lib: sbi_platform: expose hart_features to extension_init callback
> 2f63f24 platform: generic: add extensions_init handler and platform-override
> b6e520b platform: generic: allwinner: add support for c9xx pmu
> 98aa127 include: sbi: Fix typo in comment
> 11d14ae lib: sbi: Fix typo in comment
> 60b78fe include: sbi: Fix grammar in comment
> dcdaf30 lib: sbi: Add sbi_domain_root_add_memrange() API
> bd7ef41 platform: andes/ae350: Remove enabling cache from an350_final_init
> 9899b59 platform: andes/ae350: Use kconfig to set platform version and default name
> 88f58a3 platform: andes/ae350: Use fdt serial driver
> ef9f02e lib: utils/timer: Add Andes fdt timer support
> 8234fc1 lib: utils/reset: Add Andes fdt reset driver support
> 127a3f2 platform: andes/ae350: Use fdt irqchip driver
> 6f3258e platform: andes/ae350: Add fw_platform_init for platform initialization
> ce7c490 lib: utils/ipi: Add Andes fdt ipi driver support
> c8683c5 platform: andes/ae350: Add AE350 domain support
> d682a0a docs: andes-ae350.md: Update ae350 documentation for fdt driver support
> 0fee0bf Makefile: Add cscope support
> 51acd49 docs/firmware: update the document
> 9d54f43 Makefile: Add rules for carray sources in lib/sbi
> 56bed1a lib: sbi_ecall: Generate extensions list with carray
> 22f38ee lib: sbi_ecall: Add Kconfig option for each extension
> 85cf56c lib: utils/fdt: Remove redundant code
> 21ba418 lib: utils/fdt: Simplified code
> 8e9966c docs: fix some typos
> 7b29264 lib: utils/serial: Fix semihosting compile error using LLVM
> 14f5c4c lib: sbi_ecall: Split up sbi_ecall_replace
> 8e63716 firmware: payloads: Optimize usage of "ALIGN"
> 1b0d71b platform: generic/allwinner: Remove unused header files
> 9a740f5 platform: generic/allwinner: Remove ghostly type cast
> ba32021 Makefile: replace `echo` with `printf` for compatibility
> 49b0e35 Makefile: bugfix for handling platform paths
> 74e2029 lib: sbi: Simplified mmio match checking
> fc82e84 lib: sbi: Fix is_region_valid()
> f8eec91 lib: simplify fdt_parse_plmt_node()
> cc54184 lib: simplify fdt_parse_plicsw_node()
> e9bc7f1 lib: fix fdt_parse_plmt_node()
> 5daa0ef lib: fix fdt_parse_plicsw_node()
> 1f6866e lib: simplify fdt_translate_address()
> ad2ac29 lib: fix fdt_parse_aclint_node()
> cfbabb9 firmware: Minor optimization for relocate
> a36d455 platform: generic/andes: Enable generic platform support for AE350
> 6cd4b9b docs: platform: Update AE350 and generic platform documentation
> d3fcff7 docs: andes-ae350.md: fix watchdog nodename in dts example
> 4640d04 scripts/create-binary-archive.sh: remove andes/ae350 build directory
> e977512 lib: utils: Add fdt_fixup_node() helper function
> e1a0cb0 gitignore: add vim swap files
> ed8b8f5 platform: generic: Make use of fdt_match_node()
> 8b00be6 lib: fix is_region_valid()
> c2be214 lib: fix __fdt_parse_region()
> 7b08778 lib: fix irqchip_plic_update_hartid_table
> cb568b9 lib: sbi: Synchronize PMP settings with virtual memory system
> 506928a scripts: use env to invoke bash
> 64e8b9f lib: utils: serial: Add Renesas SCIF driver
> 0021b43 lib: utils: serial: Add FDT driver for Renesas SCIF
> 6840902 lib: utils/irqchip: Add compatible string for Andestech NCEPLIC100
> 8b1617d platform: generic: Add Renesas RZ/Five initial support
> 7a3354a docs: platform: Add documentation for Renesas RZ/Five SoC
> 34da663 lib: utils/irqchip: plic: Fix the off-by-one error in priority save/restore helpers
> 8509e46 lib: utils/irqchip: plic: Ensure no out-of-bound access in priority save/restore helpers
> 91c8a7d lib: utils/irqchip: plic: Fix the off-by-one error in plic_context_init()
> fabbc00 lib: utils/irqchip: plic: Fix the off-by-one error in context save/restore helpers
> 9a2eeb4 lib: utils/irqchip: plic: Ensure no out-of-bound access in context save/restore helpers
> a8ee82c lib: utils/ipi: mswi: add T-Head C9xx CLINT compatible
> ca7810a lib: utils/timer: mtimer: add a quirk for lacking mtime register
> b848d87 lib: utils/timer: mtimer: add T-Head C9xx CLINT compatible
> 391ec85 docs: pmu: fix binding example
> 0412460 docs: pmu: update a reference to a deprecated property name
> d5d12a9 docs: pmu: Update the pmu doc with removal of mcountinhbit restriction
> 6b5188c include: Bump-up version to 1.2
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> Please pull the full contents from https://github.com/lbmeng/qemu/ opensbi branch
>
>  .../opensbi-riscv32-generic-fw_dynamic.bin    | Bin 117704 -> 123072 bytes
>  .../opensbi-riscv64-generic-fw_dynamic.bin    | Bin 115344 -> 121800 bytes
>  roms/opensbi                                  |   2 +-
>  3 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin b/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
> index 81bab1adc9..6a8425885c 100644
> Binary files a/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin and b/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin differ
> diff --git a/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin b/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin
> index 5eb0a74326..80bdbf2170 100644
> Binary files a/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin and b/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin differ
> diff --git a/roms/opensbi b/roms/opensbi
> index 4489876e93..6b5188ca14 160000
> --- a/roms/opensbi
> +++ b/roms/opensbi
> @@ -1 +1 @@
> -Subproject commit 4489876e933d8ba0d8bc6c64bae71e295d45faac
> +Subproject commit 6b5188ca14e59ce7bf71afe4e7d3d557c3d31bf8
> --
> 2.25.1
>
>

