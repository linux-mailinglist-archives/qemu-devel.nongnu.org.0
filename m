Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBB850B692
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:52:23 +0200 (CEST)
Received: from localhost ([::1]:46262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrpm-0005vS-Nl
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhqw0-0006Pv-DW
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:54:47 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:40723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhqvy-0001ro-9u
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:54:43 -0400
Received: by mail-pf1-x432.google.com with SMTP id i24so7650639pfa.7
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LQj7J5zchdxLk7+zVlsA734hVHBcXiowH1AnkuFwJfg=;
 b=gko12gN/Enjcl2icG2EHr4/NIXon2gpMX+cjS0IvPh5dOU6vuOapjRxm33LGScLy6r
 t6fe+krjDiMFHXe8lJGhEBti3G8rMMjHORga7w6SjHR2nuAYNLa7BJkmZjRFxnqPuLK+
 36JHGaRNCsP0AEB/TlFIqgFX6SA7WboKRfKUeJHRzHxXKtGPG7Pd1q8C2w9k6RMW9nII
 DwnzVll1IhuyDwiFmQT9cZvmXrezRtjO1DIR9TsKVPum8iVWvDoQAyN7CCm3noPYAuKt
 HNEzw69A0HVRpI5ZaQsWHuB56cObMY1PRO6ilvvPUPnMz6oVfDELN7ix3jfi3ZVSw5fj
 OWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LQj7J5zchdxLk7+zVlsA734hVHBcXiowH1AnkuFwJfg=;
 b=FLKSumKE6g6ZY6WnfrOIA2LQQURqUgKgl3GFwaVFI87djAggxRZG0EhyJovSVtZvD+
 4UVLEX337PdiDXTrH3HwMRMS95KLVKe+vtVNz1KpWGPNKuo6z8ld8M3E+WtjZ0cn5mXk
 ercN7BS5YLLcuhBYrK0fQG4eXFREPaASb693cNT+Wc+431qfiSa9QkiFhTYY17vDfW9U
 t587lmk0zFtxpQ5DU8heT3XMpDq/spOV0hb6gsGtObr2aKCt8BxofvUMVIUIfFkBRejh
 Gz+m0D3OS06J/1Br75T20K5n5SSXiepK9Pp+eX94+WMQhT7wf4Gt63Dcex2f33SNSwfs
 M4dw==
X-Gm-Message-State: AOAM533JrMoftFFA0kHNXoWcVIJA8XzhJhlHJrjNVPXQ5OGkzmAT0f4i
 gLC9tYZVbesQCu6+gjF4vswe2w==
X-Google-Smtp-Source: ABdhPJxIT0DJfMOCNELP2rpOZLpU+uB0lZ4OJ6gwHzenkxVsZzLCjSQuvxVc+hP0roLsmuIx1fV//A==
X-Received: by 2002:a63:8a41:0:b0:3aa:a7c9:23b8 with SMTP id
 y62-20020a638a41000000b003aaa7c923b8mr3343068pgd.137.1650624880673; 
 Fri, 22 Apr 2022 03:54:40 -0700 (PDT)
Received: from ?IPV6:2607:fb90:27d0:b0f2:1f9b:37fb:18e0:1dd4?
 ([2607:fb90:27d0:b0f2:1f9b:37fb:18e0:1dd4])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a17090ad0c200b001cd4989fedfsm5749614pjw.43.2022.04.22.03.54.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 03:54:39 -0700 (PDT)
Message-ID: <e330a9ff-0b1a-9664-d3ef-2df74daba0eb@linaro.org>
Date: Fri, 22 Apr 2022 03:54:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL v2 00/31] riscv-to-apply queue
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/22 17:36, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> The following changes since commit da5006445a92bb7801f54a93452fac63ca2f634c:
> 
>    Merge tag 'python-pull-request' of https://gitlab.com/jsnow/qemu into staging (2022-04-21 15:16:52 -0700)
> 
> are available in the Git repository at:
> 
>    git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220422-1
> 
> for you to fetch changes up to faee5441a038898f64b335dbaecab102ba406552:
> 
>    hw/riscv: boot: Support 64bit fdt address. (2022-04-22 10:35:16 +1000)
> 
> ----------------------------------------------------------------
> First RISC-V PR for QEMU 7.1
> 
>   * Add support for Ibex SPI to OpenTitan
>   * Add support for privileged spec version 1.12.0
>   * Use privileged spec version 1.12.0 for virt machine by default
>   * Allow software access to MIP SEIP
>   * Add initial support for the Sdtrig extension
>   * Optimisations for vector extensions
>   * Improvements to the misa ISA string
>   * Add isa extenstion strings to the device tree
>   * Don't allow `-bios` options with KVM machines
>   * Fix NAPOT range computation overflow
>   * Fix DT property mmu-type when CPU mmu option is disabled
>   * Make RISC-V ACLINT mtime MMIO register writable
>   * Add and enable native debug feature
>   * Support 64bit fdt address.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



> 
> ----------------------------------------------------------------
> Alistair Francis (2):
>        target/riscv: cpu: Fixup indentation
>        target/riscv: Allow software access to MIP SEIP
> 
> Atish Patra (7):
>        target/riscv: Define simpler privileged spec version numbering
>        target/riscv: Add the privileged spec version 1.12.0
>        target/riscv: Introduce privilege version field in the CSR ops.
>        target/riscv: Add support for mconfigptr
>        target/riscv: Add *envcfg* CSRs support
>        target/riscv: Enable privileged spec version 1.12
>        target/riscv: Add isa extenstion strings to the device tree
> 
> Bin Meng (7):
>        target/riscv: Add initial support for the Sdtrig extension
>        target/riscv: debug: Implement debug related TCGCPUOps
>        target/riscv: cpu: Add a config option for native debug
>        target/riscv: csr: Hook debug CSR read/write
>        target/riscv: machine: Add debug state description
>        target/riscv: cpu: Enable native debug feature
>        hw/core: tcg-cpu-ops.h: Update comments of debug_check_watchpoint()
> 
> Dylan Jhong (1):
>        hw/riscv: boot: Support 64bit fdt address.
> 
> Frank Chang (3):
>        hw/intc: Add .impl.[min|max]_access_size declaration in RISC-V ACLINT
>        hw/intc: Support 32/64-bit mtimecmp and mtime accesses in RISC-V ACLINT
>        hw/intc: Make RISC-V ACLINT mtime MMIO register writable
> 
> Jim Shu (1):
>        hw/intc: riscv_aclint: Add reset function of ACLINT devices
> 
> Nicolas Pitre (1):
>        target/riscv/pmp: fix NAPOT range computation overflow
> 
> Niklas Cassel (1):
>        hw/riscv: virt: fix DT property mmu-type when CPU mmu option is disabled
> 
> Ralf Ramsauer (1):
>        hw/riscv: virt: Exit if the user provided -bios in combination with KVM
> 
> Richard Henderson (1):
>        target/riscv: Use cpu_loop_exit_restore directly from mmu faults
> 
> Tsukasa OI (1):
>        target/riscv: misa to ISA string conversion fix
> 
> Weiwei Li (3):
>        target/riscv: optimize condition assign for scale < 0
>        target/riscv: optimize helper for vmv<nr>r.v
>        target/riscv: fix start byte for vmv<nf>r.v when vstart != 0
> 
> Wilfred Mallawa (2):
>        hw/ssi: Add Ibex SPI device model
>        riscv: opentitan: Connect opentitan SPI Host
> 
>   include/hw/core/tcg-cpu-ops.h           |   1 +
>   include/hw/intc/riscv_aclint.h          |   1 +
>   include/hw/riscv/boot.h                 |   4 +-
>   include/hw/riscv/opentitan.h            |  30 +-
>   include/hw/ssi/ibex_spi_host.h          |  94 +++++
>   target/riscv/cpu.h                      |  40 ++-
>   target/riscv/cpu_bits.h                 |  40 +++
>   target/riscv/debug.h                    | 114 ++++++
>   target/riscv/helper.h                   |   5 +-
>   hw/intc/riscv_aclint.c                  | 144 ++++++--
>   hw/riscv/boot.c                         |  12 +-
>   hw/riscv/opentitan.c                    |  36 +-
>   hw/riscv/virt.c                         |  24 +-
>   hw/ssi/ibex_spi_host.c                  | 612 ++++++++++++++++++++++++++++++++
>   target/riscv/cpu.c                      | 120 ++++++-
>   target/riscv/cpu_helper.c               |  10 +-
>   target/riscv/csr.c                      | 282 +++++++++++++--
>   target/riscv/debug.c                    | 441 +++++++++++++++++++++++
>   target/riscv/machine.c                  |  55 +++
>   target/riscv/pmp.c                      |  14 +-
>   target/riscv/vector_helper.c            |  31 +-
>   target/riscv/insn_trans/trans_rvv.c.inc |  25 +-
>   hw/ssi/meson.build                      |   1 +
>   hw/ssi/trace-events                     |   7 +
>   target/riscv/meson.build                |   1 +
>   25 files changed, 1971 insertions(+), 173 deletions(-)
>   create mode 100644 include/hw/ssi/ibex_spi_host.h
>   create mode 100644 target/riscv/debug.h
>   create mode 100644 hw/ssi/ibex_spi_host.c
>   create mode 100644 target/riscv/debug.c
> 


