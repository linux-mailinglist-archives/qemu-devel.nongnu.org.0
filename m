Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 590FA57938E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 08:55:27 +0200 (CEST)
Received: from localhost ([::1]:35564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDh8g-0001UK-Gj
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 02:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oDh5o-0007H2-Sg; Tue, 19 Jul 2022 02:52:28 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:36683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oDh5m-0001OF-JJ; Tue, 19 Jul 2022 02:52:28 -0400
Received: by mail-pf1-x431.google.com with SMTP id g126so12706689pfb.3;
 Mon, 18 Jul 2022 23:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K9uqlrNX7/eDPYZGMikMHKWClczTCUhUJYuLLCQiTH0=;
 b=I/VQmFuF73ZFljq3UkWoJd2/YdtUUrLFlogTBkTdNhPE61yZjwYyJLZje0lGZPQ0ZL
 HEV/wTXGsbfiFwp1Uk2J/B/bO0mmVoD4+MMxgBsoxIK5/UWPvocDqFG3gQGJb/SErc9f
 yvMsWxGZ33ZgV3uC/M4MXiNB/NyNvCgYVhURNB2bZmq+n801dlzI3Kg6kSlWRClX9umT
 IHS6bCLXWqnrgje6I/1PoKzr8Gsdepz0CweQ0yTNKn42Gn/BisFBN4ToWZnY5A91MUeC
 CuCdbKA4wL+HLR/sn1BQKy5xOlH5ykPrK0rIYvMywEDp5WXV6NQojyo0kHor0kzTgOSF
 xIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K9uqlrNX7/eDPYZGMikMHKWClczTCUhUJYuLLCQiTH0=;
 b=DnSnfLg/PssxaMhNrSskelV+J1g9f5RomULozbXgPUNMh3GYu7CkC3fttgShxGKxSV
 6+B00kvi2JcT40xcZjWTWFcw+5EPMbqh2odgS1dSHPrZGIU/fknGGLOtxs3OUWSc6Gm0
 u+WH0jyH0g2AGJnwzbS95OCBNKGlhCVptSeNqly3CxqdBdSbK6SZjW63516omAQXjmpk
 Wu/NbVWajEYsnMZ/2kN9WzYpEe2bI5of6ue4Wu8ZYAu+Hsb3yXINQjmWSDSwptC8QLYk
 77Xv8lhyq9kb3W4U0Wlz/hOU61FVQzAj21bnotf5HCDxBR/WPypY91QnyLSac1ytpgQX
 1Z/Q==
X-Gm-Message-State: AJIora8Z7OLKA6q3HZVL1KeAQ4P8Z3iNZsyxssIclWZsxtSHZI+DaKS4
 5taWxjVyCL49UMG9TTecoHlt2Z9YVqkXRAWi/QA=
X-Google-Smtp-Source: AGRyM1uD3ieCn5qLxoanJfzloTTlhfjaGpQULD1YrjQn+au61FCAfTfEwNw8/nJV08n5/rBK3kur88K4fDkiTt+NcUQ=
X-Received: by 2002:a65:6b8a:0:b0:3db:7dc5:fec2 with SMTP id
 d10-20020a656b8a000000b003db7dc5fec2mr27135291pgw.223.1658213544206; Mon, 18
 Jul 2022 23:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220713090613.204046-1-bmeng.cn@gmail.com>
In-Reply-To: <20220713090613.204046-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jul 2022 16:51:57 +1000
Message-ID: <CAKmqyKN6ebD4yLKKkW5EcdauvpZB1Sig=w9zg+pbYoEkc2duSw@mail.gmail.com>
Subject: Re: [PATCH] roms/opensbi: Upgrade from v1.0 to v1.1
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 13, 2022 at 7:06 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Upgrade OpenSBI from v1.0 to v1.1 and the pre-built bios images.
>
> The v1.1 release includes the following commits:
>
> 5b99603 lib: utils/ipi: Fix size check in aclint_mswi_cold_init()
> 6dde435 lib: utils/sys: Extend HTIF library to allow custom base address
> 8257262 platform: sifive_fu740: do not use a global in da9063_reset/shutdown
> fb688d9 platform: sifive_fu740: fix reset when watchdog is running
> 5d025eb lib: fix pointer of type 'void *' used in arithmetic
> 632f593 lib: sbi: Map only the counters enabled in hardware
> 3b7c204 lib: sbi: Disable interrupt during config matching
> a26dc60 lib: sbi: Disable interrupt and inhibit counting in M-mode during init
> 5d53b55 Makefile: fix build with binutils 2.38
> 6ad8917 lib: fix compilation when strings.h is included
> ce4c018 lib: utils/serial: Round UART8250 baud rate divisor to nearest integer
> 01250d0 include: sbi: Add AIA related CSR defines
> 8f96070 lib: sbi: Detect AIA CSRs at boot-time
> 65b4c7c lib: sbi: Use AIA CSRs for local interrupts when available
> 222132f lib: sbi: Add sbi_trap_set_external_irqfn() API
> 5f56314 lib: utils/irqchip: Allow multiple FDT irqchip drivers
> 1050940 include: sbi: Introduce nascent_init() platform callback
> 55e79f8 lib: sbi: Enable mie.MEIE bit for IPIs based on external interrupts.
> 9f73669 lib: utils/irqchip: Add IMSIC library
> 811da5c lib: utils/irqchip: Add FDT based driver for IMSIC
> 7127aaa lib: utils: Disable appropriate IMSIC DT nodes in fdt_fixups()
> 9979265 lib: utils/irqchip: Add APLIC initialization library
> 3461219 lib: utils/irqchip: Add FDT based driver for APLIC
> 8e2ef4f lib: utils: Disable appropriate APLIC DT nodes in fdt_fixups()
> 3a69cc1 lib: sbi: fix typo in is_region_subset
> f2ccf2f lib: sbi: verbose sbi_domain_root_add_memregion
> f3f4604 lib: sbi: Add a simple external interrupt handling framework
> 4998a71 lib: utils: serial: Initial commit of xlnx-uartlite
> 2dfbd3c lib: pmp_set/pmp_get moved errors from runtime to compile time
> b6b7220 firmware: Fix code for accessing hart_count and stack_size
> d552fc8 lib: Add error messages via conditional compilation for the future
> 555bdb1 include: Use static asserts for SBI_PLATFORM_xxx_OFFSET defines
> 1b42d3a include: Use static asserts for SBI_SCRATCH_xxx_OFFSET defines
> 7924a0b include: Use static asserts for FW_DYNAMIC_INFO_xxx_OFFSET defines
> 722f80d include: Add defines for [m|h|s]envcfg CSRs
> 31fecad lib: sbi: Detect menvcfg CSR at boot time
> 47d6765 lib: sbi: Enable Zicbo[m|z] extensions in the menvcfg CSR
> 794986f lib: sbi: Enable Svpbmt extension in the menvcfg CSR
> 499601a lib: sbi: Add Smstateen extension defines
> d44568a lib: sbi: Detect Smstateen CSRs at boot-time
> 3383d6a lib: irqchip/imsic: configure mstateen
> 5c5cbb5 lib: utils/serial: support 'reg-offset' property
> c1e47d0 include: correct the definition of MSTATUS_VS
> 9cd95e1 lib: sbi/hart: preserve csr validation value
> 4035ae9 docs: pmu: Improve the PMU DT bindings
> d62f6da lib: sbi: Implement Sstc extension
> 474a9d4 lib: sbi: Fix mstatus_init() for RV32 when Sscofpmf is not available
> e576b3e include: sbi: Define SBI_PMU_HW_EVENT_MAX to 256
> b0c9df5 lib: sbi: Fix mhpmeventh access for rv32 in absence of sscofpmf
> 1a754bb lib: sbi: Detect and print privileged spec version
> 5a6be99 lib: sbi: Remove 's' and 'u' from misa_string() output
> 5b8b377 lib: sbi: Update the name of ISA string printed at boot time
> d4b563c lib: sbi: Remove MCOUNTEREN and SCOUNTEREN hart features
> dbc3d8f lib: sbi: Remove MCOUNTINHIBT hart feature
> 97a17c2 lib: sbi: Remove MENVCFG hart feature
> a6ab94f lib: sbi: Fix AIA feature detection
> cad6c91 lib: sbi: Convert hart features into hart extensions
> be4903a lib: sbi: Detect hart features only once for each hart
> 994ace3 lib: sbi: Add sbi_hart_update_extension() function
> 023f0ad lib: sbi_platform: Add callback to populate HART extensions
> f726f2d Makefile: Allow generated C source to be anywhere in build directory
> 7fb474b Makefile: Add support for generating C array at compile time
> 73cf511 lib: utils/reset: Generate FDT reset driver list at compile-time
> 1e62705 lib: utils/serial: Generate FDT serial driver list at compile-time
> bfeb305 lib: utils/timer: Generate FDT timer driver list at compile-time
> 3a69d12 lib: utils/irqchip: Generate FDT irqchip driver list at compile-time
> 4ee0c57 lib: utils/ipi: Generate FDT ipi driver list at compile-time
> 998ed43 lib: utils/i2c: Generate FDT i2c adapter driver list at compile-time
> 4eacd82 lib: utils/gpio: Generate FDT gpio driver list at compile-time
> a3a3c60 platform: generic: Generate platform override module list at compile-time
> 9a7a677 platform: generic: Move Sifive platform overrides into own directory
> 851c14d lib: utils/irqchip: fix typo when checking for CPU node
> 90a9dd2 lib: utils/fdt: introduce fdt_node_is_enabled()
> 616da52 lib: utils: check if CPU node is enabled
> 575bb4e platform: generic: check if CPU node is enabled
> 1bc67db lib: utils/fdt: rename fdt_parse_max_hart_id
> f067bb8 lib: sbi: fix system_opcode_insn
> fab0379 lib: utils/fdt: Require match data to be const
> 295e5f3 lib: sbi_timer: Drop unnecessary get_platform_ticks wrapper
> ff65bfe lib: sbi_illegal_insn: Constify illegal_insn_table
> cb8271c lib: sbi_illegal_insn: Add emulation for fence.tso
> adc3388 lib: sbi_trap: Redirect exception based on hedeleg
> ce1d618 platform: generic: add overrides for vendor extensions
> b20ed9f lib: sbi_hsm: Call a device hook during hart resume
> 79e42eb lib: sbi_hsm: Assume a consistent resume address
> 2ea7799 lib: irqchip/plic: Constify plic_data pointers
> 8c362e7 lib: irqchip/plic: Factor out a context init function
> 415ecf2 lib: irqchip/plic: Add context save/restore helpers
> 2b79b69 lib: irqchip/plic: Add priority save/restore helpers
> 69be3df lib: utils/irqchip: Add FDT wrappers for PLIC save/restore functions
> 5e56758 lib: utils/irqchip: Add wrapper for T-HEAD PLIC delegation
> 9dc5ec5 platform: Add HSM implementation for Allwinner D1
> 551c70c include: sbi: Add mtinst/htinst psuedoinstructions
> 187127f lib: sbi: Fixup tinst for exceptions in sbi_misaligned_*()
> a07402a lib: sbi: Fix tval and tinst for sbi_get_insn()
> c653001 lib: utils: Remove CSRs that set/clear an IMSIC interrupt file bits
> 7738345 lib: utils/timer: Add a separate compatible for the D1 CLINT
> d76a196 lib: irqchip/plic: fix typo in plic_warm_irqchip_init
> 6f1fe98 lib: utils/timer: Remove Allwinner D1 CLINT compatibles
> c6fdbcf include: sbi: Change spec version to 1.0
> 3f66465 lib: pmu: allow to use the highest available counter
> 4489876 include: Bump-up version to 1.1
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> please pull the full contents from https://github.com/lbmeng/qemu/ opensbi branch
>
>  .../opensbi-riscv32-generic-fw_dynamic.bin    | Bin 108504 -> 117704 bytes
>  .../opensbi-riscv64-generic-fw_dynamic.bin    | Bin 105296 -> 115344 bytes
>  roms/opensbi                                  |   2 +-
>  3 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin b/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
> index dba8e8655f..81bab1adc9 100644
> Binary files a/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin and b/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin differ
> diff --git a/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin b/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin
> index f223e56991..5eb0a74326 100644
> Binary files a/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin and b/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin differ
> diff --git a/roms/opensbi b/roms/opensbi
> index 48f91ee9c9..4489876e93 160000
> --- a/roms/opensbi
> +++ b/roms/opensbi
> @@ -1 +1 @@
> -Subproject commit 48f91ee9c960f048c4a7d1da4447d31e04931e38
> +Subproject commit 4489876e933d8ba0d8bc6c64bae71e295d45faac
> --
> 2.34.1
>
>

