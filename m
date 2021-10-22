Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 871F7437FFA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 23:41:25 +0200 (CEST)
Received: from localhost ([::1]:42340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me2I0-0004wP-4j
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 17:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me2GL-0004Ds-Uo
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 17:39:41 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:38807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me2GI-0002X8-K7
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 17:39:41 -0400
Received: by mail-pg1-x52f.google.com with SMTP id e65so4454974pgc.5
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 14:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EGMgdJzyREwPPTSWlATEOHKaWJAY5JHwuFYSfxDTPCE=;
 b=oF0ZTlp6UPm2uS8KjWyC3tMVUvjvLXW7Td9NrkFvW4G8Kjd8FCQN6rp3DR4WQrXasc
 xBRcTYAxrIUbCbB2gaGOvn9kwzrRHFj87ssf+29QenTgaPGFtw4XJFcngIPCya/S5zIW
 cmWC0l0i5DaCT5XmlDmdS8NMcvM2Xfa5RN9KOwr72lIANQ1P9mygftPRhD6GsUjdpgfd
 vcC/wlqgnV3MjGHyquQ2AV96ZIYX4hydSyosL6oYdk+IKliOJrr/xZBy3XrwJekp9di3
 jb+tPuzji63Fb6liw4UFig1K1Pf/obo3jd764FAII6cer/mptjdD/W+kdaQ/EAdrdbLW
 DjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EGMgdJzyREwPPTSWlATEOHKaWJAY5JHwuFYSfxDTPCE=;
 b=WDnvhJIpQDD3o8GID3Cof6AVhnG4TFISWaRnn2ktfWMCWyWllOIVSGBj/UHHiG1KBN
 3tD6IjOkvhFhA1/2n4vvqVcWALH0cwgRiPsfvTWqTWyq2vAvrRJDUNqE426WKGZFTBkH
 +yBIVa1vxLAxawpm/TdMx0DIf+q0zYDB49/kmyslR8nOR+Z0MqQe+Z3pJXa+8CUQvNBt
 0+bMyi8eEBXgOip6KTvJzhbfqPEeF1dafKFILpi/oHzEDHDtrvOzQX6F+FqHXc1pL+Xn
 XAz9rs/JM1h234mopgvDdgqFIkn2uYRl0dwe7WK+JwoMAPlHqb3daCrZQpf7Ki3Q3Lzm
 EZXA==
X-Gm-Message-State: AOAM531GG41Crt8MTWXnnsTQA6SIHka9NTpP653tXwWlP5QUOSWXCpzE
 XvSWkbs6KQIk58SpFJwAThwovQ==
X-Google-Smtp-Source: ABdhPJyQ0lXfMv6+68iN61wIa/3r9kpIrxullBv62gM+9o77NhYjqA8OFtVichCk4A8qEswt2YA0Fg==
X-Received: by 2002:a63:710d:: with SMTP id m13mr1659840pgc.467.1634938775819; 
 Fri, 22 Oct 2021 14:39:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z5sm9168615pge.2.2021.10.22.14.39.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 14:39:35 -0700 (PDT)
Subject: Re: [PULL 00/33] riscv-to-apply queue
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1d866b2a-41db-312a-e166-13191adf0dc8@linaro.org>
Date: Fri, 22 Oct 2021 14:39:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/22/21 6:37 AM, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> The following changes since commit 4c127fdbe81d66e7cafed90908d0fd1f6f2a6cd0:
> 
>    Merge remote-tracking branch 'remotes/rth/tags/pull-arm-20211021' into staging (2021-10-21 09:53:27 -0700)
> 
> are available in the Git repository at:
> 
>    git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20211022-2
> 
> for you to fetch changes up to 11ec06f9eaedc801ded34c79861367b76ab2b731:
> 
>    hw/riscv: spike: Use MachineState::ram and MachineClass::default_ram_id (2021-10-22 23:35:47 +1000)
> 
> ----------------------------------------------------------------
> Fourth RISC-V PR for QEMU 6.2
> 
>   - Vector extension bug fixes
>   - Bit manipulation extension bug fix
>   - Support vhost-user and numa mem options on all boards
>   - Rationalise XLEN and operand lengths
>   - Bump the OpenTitan FPGA support
>   - Remove the Ibex PLIC
>   - General code cleanup
> 
> ----------------------------------------------------------------
> Alistair Francis (7):
>        target/riscv: Remove some unused macros
>        target/riscv: Organise the CPU properties
>        hw/riscv: opentitan: Update to the latest build
>        hw/intc: Remove the Ibex PLIC
>        hw/intc: sifive_plic: Move the properties
>        hw/intc: sifive_plic: Cleanup the realize function
>        hw/intc: sifive_plic: Cleanup the irq_request function
> 
> Bin Meng (6):
>        hw/riscv: microchip_pfsoc: Use MachineState::ram and MachineClass::default_ram_id
>        hw/riscv: opentitan: Use MachineState::ram and MachineClass::default_ram_id
>        hw/riscv: shakti_c: Use MachineState::ram and MachineClass::default_ram_id
>        hw/riscv: sifive_e: Use MachineState::ram and MachineClass::default_ram_id
>        hw/riscv: sifive_u: Use MachineState::ram and MachineClass::default_ram_id
>        hw/riscv: spike: Use MachineState::ram and MachineClass::default_ram_id
> 
> Frank Chang (2):
>        target/riscv: Pass the same value to oprsz and maxsz for vmv.v.v
>        target/riscv: fix TB_FLAGS bits overlapping bug for rvv/rvh
> 
> Mingwang Li (1):
>        hw/riscv: virt: Use machine->ram as the system memory
> 
> Philipp Tomsich (1):
>        target/riscv: Fix orc.b implementation
> 
> Richard Henderson (15):
>        target/riscv: Move cpu_get_tb_cpu_state out of line
>        target/riscv: Create RISCVMXL enumeration
>        target/riscv: Split misa.mxl and misa.ext
>        target/riscv: Replace riscv_cpu_is_32bit with riscv_cpu_mxl
>        target/riscv: Add MXL/SXL/UXL to TB_FLAGS
>        target/riscv: Use REQUIRE_64BIT in amo_check64
>        target/riscv: Properly check SEW in amo_op
>        target/riscv: Replace is_32bit with get_xl/get_xlen
>        target/riscv: Replace DisasContext.w with DisasContext.ol
>        target/riscv: Use gen_arith_per_ol for RVM
>        target/riscv: Adjust trans_rev8_32 for riscv64
>        target/riscv: Use gen_unary_per_ol for RVB
>        target/riscv: Use gen_shift*_per_ol for RVB, RVI
>        target/riscv: Use riscv_csrrw_debug for cpu_dump
>        target/riscv: Compute mstatus.sd on demand
> 
> Travis Geiselbrecht (1):
>        target/riscv: line up all of the registers in the info register dump
> 
>   include/hw/riscv/opentitan.h            |   6 +-
>   target/riscv/cpu.h                      |  87 +++------
>   target/riscv/cpu_bits.h                 |  16 +-
>   hw/intc/ibex_plic.c                     | 307 --------------------------------
>   hw/intc/sifive_plic.c                   |  85 ++++-----
>   hw/riscv/boot.c                         |   2 +-
>   hw/riscv/microchip_pfsoc.c              |  36 ++--
>   hw/riscv/opentitan.c                    |  38 +++-
>   hw/riscv/shakti_c.c                     |   6 +-
>   hw/riscv/sifive_e.c                     |  16 +-
>   hw/riscv/sifive_u.c                     |   6 +-
>   hw/riscv/spike.c                        |   6 +-
>   hw/riscv/virt.c                         |   6 +-
>   linux-user/elfload.c                    |   2 +-
>   linux-user/riscv/cpu_loop.c             |   2 +-
>   semihosting/arm-compat-semi.c           |   2 +-
>   target/riscv/cpu.c                      | 216 ++++++++++++----------
>   target/riscv/cpu_helper.c               |  92 +++++++++-
>   target/riscv/csr.c                      | 104 ++++++-----
>   target/riscv/gdbstub.c                  |  10 +-
>   target/riscv/machine.c                  |  10 +-
>   target/riscv/monitor.c                  |   4 +-
>   target/riscv/translate.c                | 174 +++++++++++++-----
>   target/riscv/insn_trans/trans_rvb.c.inc | 153 +++++++++-------
>   target/riscv/insn_trans/trans_rvi.c.inc |  44 ++---
>   target/riscv/insn_trans/trans_rvm.c.inc |  36 +++-
>   target/riscv/insn_trans/trans_rvv.c.inc |  32 ++--
>   hw/intc/meson.build                     |   1 -
>   28 files changed, 720 insertions(+), 779 deletions(-)
>   delete mode 100644 hw/intc/ibex_plic.c

Applied, thanks.

r~


