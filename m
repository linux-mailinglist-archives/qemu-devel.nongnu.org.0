Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C2050A39F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:04:55 +0200 (CEST)
Received: from localhost ([::1]:60684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYMY-0006Wf-DZ
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYLK-0005Zw-5M
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:03:38 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:34579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYLH-0003U3-SQ
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:03:37 -0400
Received: by mail-pl1-x636.google.com with SMTP id n8so5149737plh.1
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+S+VuzLHcgvmPTCAeRrt/iHWsfTtFy7gsfbhjkMoLSU=;
 b=rorK16QQsAh2kFg58QQaUMVk5s5Mo9ArIEqhhuI/kC8F3qUKe/b3Xp7gpzBgHHZiTc
 SoDZ5IUr8lvHB/8A1rfAWYJyL3yhLAUL9rPZB3hIVxjx8ryUf/7vthTrfR011fGRFHA4
 AcotmROfa32fC+5iUWXAaAdEyLIljdi4e/erkbRmmhynDMhsShGs3XXZjV5D04tjsW1P
 gq70Z4vU1/OgtGzUK7CeHkthU3z0ISMc9HGhqSY4hBXIoOcYUXT2s2MHZsY8nadQ4+7V
 9keMWhKWbxfAruPG0ldvxe7DHBVH6O0nFgQ5RvapUQR46O5GPr1FatlQcnipSfgnkFCH
 4TIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+S+VuzLHcgvmPTCAeRrt/iHWsfTtFy7gsfbhjkMoLSU=;
 b=UIiA2IMzwJu6CtmSVjBSIYTp4z8nkBsUrVR0ItHLABlGTMSOlI7x86sWgz48iTUIBM
 7QoYFJkSPuPiJWNpocoMD4yw8o0hzNKxOamwpmTdPlqEQWKz55b9Da/ViYG5sKgcoANJ
 SFhiBhwDOEgDbcDamMx45UJVpcU7z5AoR0dGFWa3CxY1VewjeW6v7MI3E+cnmCn7ix9F
 pPtOBRXVH+64s9lHpjOf/HYyWg7J3Jf2VI4VCpLXCcmobIP478roZx7EzxiWOkc48FoH
 6CvBcDVgAx/SixSXzM6XeWo6OpmDQGsaBGS1FcCPsN9e1S1TIjCtCbxpJZr7wWuz1N9t
 9k6w==
X-Gm-Message-State: AOAM5307Fa2iBE/2zqYAp1zzk90mqTIdE2R+YTTqICu74Rjp79sdIJHY
 SxDiAI9UaO2+pPr9ojWbeqfdKQ==
X-Google-Smtp-Source: ABdhPJxSUDvJYE2F4C7V8RO+y+k7uCcpNTbMXr8iFXGvnClIhFY4kgnQ7higttL8n9UeOWAaI23uAw==
X-Received: by 2002:a17:902:850b:b0:158:27a2:66eb with SMTP id
 bj11-20020a170902850b00b0015827a266ebmr26915560plb.5.1650553414391; 
 Thu, 21 Apr 2022 08:03:34 -0700 (PDT)
Received: from ?IPV6:2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18?
 ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 n27-20020a056a00213b00b0050add7eb5dcsm2919197pfj.113.2022.04.21.08.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 08:03:31 -0700 (PDT)
Message-ID: <6072f101-0f4a-1c90-f883-2a8604690cae@linaro.org>
Date: Thu, 21 Apr 2022 08:03:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/31] riscv-to-apply queue
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org
References: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

On 4/20/22 23:35, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> The following changes since commit 9c125d17e9402c232c46610802e5931b3639d77b:
> 
>    Merge tag 'pull-tcg-20220420' of https://gitlab.com/rth7680/qemu into staging (2022-04-20 16:43:11 -0700)
> 
> are available in the Git repository at:
> 
>    git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220421
> 
> for you to fetch changes up to e63e7b6cca93242a4d037610caba5626c980b990:
> 
>    hw/riscv: boot: Support 64bit fdt address. (2022-04-21 16:29:57 +1000)
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

Fails on all 32-bit hosts:

In file included from /builds/qemu-project/qemu/include/qemu/timer.h:4,
                  from ../target/riscv/csr.c:22:
../target/riscv/csr.c: In function 'write_menvcfg':
/builds/qemu-project/qemu/include/qemu/bitops.h:22:38: error: left shift count >= width of 
type [-Werror=shift-count-overflow]
  #define BIT(nr)                 (1UL << (nr))
                                       ^~
../target/riscv/cpu_bits.h:682:44: note: in expansion of macro 'BIT'
  #define MENVCFG_PBMTE                      BIT(62)
                                             ^~~

r~


