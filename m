Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3714884FA
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 18:39:06 +0100 (CET)
Received: from localhost ([::1]:52696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6FgH-00068T-Jj
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 12:39:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n6Fec-0005OR-NT
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 12:37:22 -0500
Received: from [2607:f8b0:4864:20::631] (port=39642
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n6Fea-0006aL-KM
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 12:37:22 -0500
Received: by mail-pl1-x631.google.com with SMTP id l8so6050879plt.6
 for <qemu-devel@nongnu.org>; Sat, 08 Jan 2022 09:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=og/QaAY+5kMl6Mrc+7HKG2KXfLei4Hx6Lxy0XtEWncs=;
 b=S/qdqEZQv7KQybkTRNlM2fXROiLVwGdFNwvA6AxHiglo0WFWYozbdPLK76mkXu5kzA
 nAzNlKppegAtEmvVS8qQ3mExaJba9eXqssM3XokKD+H95FfQnRMAvzE/rN2ngLLd8DkC
 qUrQ78DehrJzlF1KfhwOCe2+SrBQzQ5PorErm0dovwqY4zbm4X8VXICECP9/LWT7w0Co
 11+R4kJSvdfp6GTqhAlpNji1vmGjp0vPuH2cBt/isRWu6hGMvtZV1T+lrQqWH1urlh89
 wmuoaM4sv4qQlH+5SERHijB+JjYA5Jrg4qdJ3ILIaSmc/em3Ia6s5f0kLlaNBQpqlZih
 V4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=og/QaAY+5kMl6Mrc+7HKG2KXfLei4Hx6Lxy0XtEWncs=;
 b=vCnlV+73lrD/uKRGmnIieUFl801V768JzauaK3ZrP1MaahT6Re5qiqAJjob5tg9IgG
 nsheSeHdoQry5rTnPRwIkA9g7a84/IZvB6Nn5sC71/i4OKG/FAccEo4F+oPnb0Sk1u6/
 5nKuP14gdKz64VwKEiWCTHOlnAkD6ScbuxpYrBDXEYGzmYOZ/8pIYbRsy9AV2AeIImNs
 yT6fl7figzrBnU1cofGTvQihyO7VtCU7YAPCuwvq5rqK+okY7PCnOgVARSz95VKgT1JY
 eDOAy6wF/TtyULfB3RTH+VWqhpF2WtzIQFgg3lpWkn00BD0YUCZ5pXfF8Vqv6UE2KgkH
 9N3A==
X-Gm-Message-State: AOAM533CnvflG+fYFNtMbp8bpBIMbapnBbuHu9948b7SSsd60mXv3X5R
 vWKaNuKe6PjQk3vijKOdiv9gkA==
X-Google-Smtp-Source: ABdhPJxkXHS8FxrHU3HfsL9E0mTLXzlwxvNZOKdbo6LuQRmAIz8SCsl2aA6PSNu+H1OOF5Yl8z9IGQ==
X-Received: by 2002:a63:7203:: with SMTP id n3mr4797023pgc.122.1641663438986; 
 Sat, 08 Jan 2022 09:37:18 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y14sm2024615pgo.87.2022.01.08.09.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 09:37:18 -0800 (PST)
Subject: Re: [PULL 00/37] riscv-to-apply queue
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <80ab134c-20e7-e5ae-5a54-c3f1a37fe53d@linaro.org>
Date: Sat, 8 Jan 2022 09:37:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/22 9:50 PM, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> The following changes since commit d70075373af51b6aa1d637962c962120e201fc98:
> 
>    Merge tag 'for_upstream' of git://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging (2022-01-07 17:24:24 -0800)
> 
> are available in the Git repository at:
> 
>    git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220108
> 
> for you to fetch changes up to 48eaeb56debf91817dea00a2cd9c1f6c986eb531:
> 
>    target/riscv: Implement the stval/mtval illegal instruction (2022-01-08 15:46:10 +1000)
> 
> ----------------------------------------------------------------
> Second RISC-V PR for QEMU 7.0
> 
>   - Fix illegal instruction when PMP is disabled
>   - SiFive PDMA 64-bit support
>   - SiFive PLIC cleanups
>   - Mark Hypervisor extension as non experimental
>   - Enable Hypervisor extension by default
>   - Support 32 cores on the virt machine
>   - Corrections for the Vector extension
>   - Experimental support for 128-bit CPUs
>   - stval and mtval support for illegal instructions
> 
> ----------------------------------------------------------------
> Alistair Francis (11):
>        hw/intc: sifive_plic: Add a reset function
>        hw/intc: sifive_plic: Cleanup the write function
>        hw/intc: sifive_plic: Cleanup the read function
>        hw/intc: sifive_plic: Cleanup remaining functions
>        target/riscv: Mark the Hypervisor extension as non experimental
>        target/riscv: Enable the Hypervisor extension by default
>        hw/riscv: Use error_fatal for SoC realisation
>        hw/riscv: virt: Allow support for 32 cores
>        target/riscv: Set the opcode in DisasContext
>        target/riscv: Fixup setting GVA
>        target/riscv: Implement the stval/mtval illegal instruction
> 
> Bin Meng (1):
>        roms/opensbi: Upgrade from v0.9 to v1.0
> 
> Frank Chang (3):
>        target/riscv: rvv-1.0: Call the correct RVF/RVD check function for widening fp insns
>        target/riscv: rvv-1.0: Call the correct RVF/RVD check function for widening fp/int type-convert insns
>        target/riscv: rvv-1.0: Call the correct RVF/RVD check function for narrowing fp/int type-convert insns
> 
> Frédéric Pétrot (18):
>        exec/memop: Adding signedness to quad definitions
>        exec/memop: Adding signed quad and octo defines
>        qemu/int128: addition of div/rem 128-bit operations
>        target/riscv: additional macros to check instruction support
>        target/riscv: separation of bitwise logic and arithmetic helpers
>        target/riscv: array for the 64 upper bits of 128-bit registers
>        target/riscv: setup everything for rv64 to support rv128 execution
>        target/riscv: moving some insns close to similar insns
>        target/riscv: accessors to registers upper part and 128-bit load/store
>        target/riscv: support for 128-bit bitwise instructions
>        target/riscv: support for 128-bit U-type instructions
>        target/riscv: support for 128-bit shift instructions
>        target/riscv: support for 128-bit arithmetic instructions
>        target/riscv: support for 128-bit M extension
>        target/riscv: adding high part of some csrs
>        target/riscv: helper functions to wrap calls to 128-bit csr insns
>        target/riscv: modification of the trans_csrxx for 128-bit support
>        target/riscv: actual functions to realize crs 128-bit insns
> 
> Jim Shu (2):
>        hw/dma: sifive_pdma: support high 32-bit access of 64-bit register
>        hw/dma: sifive_pdma: permit 4/8-byte access size of PDMA registers
> 
> Nikita Shubin (1):
>        target/riscv/pmp: fix no pmp illegal intrs
> 
> Philipp Tomsich (1):
>        target/riscv: Fix position of 'experimental' comment
> 
>   include/disas/dis-asm.h                        |   1 +
>   include/exec/memop.h                           |  15 +-
>   include/hw/riscv/virt.h                        |   2 +-
>   include/qemu/int128.h                          |  27 +
>   include/tcg/tcg-op.h                           |   4 +-
>   target/arm/translate-a32.h                     |   4 +-
>   target/riscv/cpu.h                             |  24 +
>   target/riscv/cpu_bits.h                        |   3 +
>   target/riscv/helper.h                          |   9 +
>   target/riscv/insn16.decode                     |  27 +-
>   target/riscv/insn32.decode                     |  25 +
>   accel/tcg/cputlb.c                             |  30 +-
>   accel/tcg/user-exec.c                          |   8 +-
>   disas/riscv.c                                  |   5 +
>   hw/dma/sifive_pdma.c                           | 181 ++++++-
>   hw/intc/sifive_plic.c                          | 254 +++------
>   hw/riscv/microchip_pfsoc.c                     |   2 +-
>   hw/riscv/opentitan.c                           |   2 +-
>   hw/riscv/sifive_e.c                            |   2 +-
>   hw/riscv/sifive_u.c                            |   2 +-
>   target/alpha/translate.c                       |  32 +-
>   target/arm/helper-a64.c                        |   8 +-
>   target/arm/translate-a64.c                     |   8 +-
>   target/arm/translate-neon.c                    |   6 +-
>   target/arm/translate-sve.c                     |  10 +-
>   target/arm/translate-vfp.c                     |   8 +-
>   target/arm/translate.c                         |   2 +-
>   target/cris/translate.c                        |   2 +-
>   target/hppa/translate.c                        |   4 +-
>   target/i386/tcg/mem_helper.c                   |   2 +-
>   target/i386/tcg/translate.c                    |  36 +-
>   target/m68k/op_helper.c                        |   2 +-
>   target/mips/tcg/translate.c                    |  58 +-
>   target/mips/tcg/tx79_translate.c               |   8 +-
>   target/ppc/translate.c                         |  32 +-
>   target/riscv/cpu.c                             |  34 +-
>   target/riscv/cpu_helper.c                      |  24 +-
>   target/riscv/csr.c                             | 194 ++++++-
>   target/riscv/gdbstub.c                         |   5 +
>   target/riscv/m128_helper.c                     | 109 ++++
>   target/riscv/machine.c                         |  22 +
>   target/riscv/op_helper.c                       |  47 +-
>   target/riscv/translate.c                       | 257 +++++++--
>   target/s390x/tcg/mem_helper.c                  |   8 +-
>   target/s390x/tcg/translate.c                   |   8 +-
>   target/sh4/translate.c                         |  12 +-
>   target/sparc/translate.c                       |  36 +-
>   target/tricore/translate.c                     |   4 +-
>   target/xtensa/translate.c                      |   4 +-
>   tcg/tcg.c                                      |   4 +-
>   tcg/tci.c                                      |  16 +-
>   util/int128.c                                  | 147 +++++
>   accel/tcg/ldst_common.c.inc                    |   8 +-
>   target/mips/tcg/micromips_translate.c.inc      |  10 +-
>   target/ppc/translate/fixedpoint-impl.c.inc     |  22 +-
>   target/ppc/translate/fp-impl.c.inc             |   4 +-
>   target/ppc/translate/vsx-impl.c.inc            |  42 +-
>   target/riscv/insn_trans/trans_rva.c.inc        |  22 +-
>   target/riscv/insn_trans/trans_rvb.c.inc        |  48 +-
>   target/riscv/insn_trans/trans_rvd.c.inc        |   4 +-
>   target/riscv/insn_trans/trans_rvh.c.inc        |   4 +-
>   target/riscv/insn_trans/trans_rvi.c.inc        | 716 +++++++++++++++++++++----
>   target/riscv/insn_trans/trans_rvm.c.inc        | 192 ++++++-
>   target/riscv/insn_trans/trans_rvv.c.inc        |  78 ++-
>   target/s390x/tcg/translate_vx.c.inc            |  18 +-
>   tcg/aarch64/tcg-target.c.inc                   |   2 +-
>   tcg/arm/tcg-target.c.inc                       |  10 +-
>   tcg/i386/tcg-target.c.inc                      |  12 +-
>   tcg/mips/tcg-target.c.inc                      |  12 +-
>   tcg/ppc/tcg-target.c.inc                       |  16 +-
>   tcg/riscv/tcg-target.c.inc                     |   6 +-
>   tcg/s390x/tcg-target.c.inc                     |  18 +-
>   tcg/sparc/tcg-target.c.inc                     |  16 +-
>   pc-bios/opensbi-riscv32-generic-fw_dynamic.bin | Bin 78680 -> 108504 bytes
>   pc-bios/opensbi-riscv32-generic-fw_dynamic.elf | Bin 727464 -> 838904 bytes
>   pc-bios/opensbi-riscv64-generic-fw_dynamic.bin | Bin 75096 -> 105296 bytes
>   pc-bios/opensbi-riscv64-generic-fw_dynamic.elf | Bin 781264 -> 934696 bytes
>   roms/opensbi                                   |   2 +-
>   target/riscv/meson.build                       |   1 +
>   target/s390x/tcg/insn-data.def                 |  28 +-
>   util/meson.build                               |   1 +
>   81 files changed, 2318 insertions(+), 750 deletions(-)
>   create mode 100644 target/riscv/m128_helper.c
>   create mode 100644 util/int128.c

Applied, thanks.

r~


