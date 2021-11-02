Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C6744364F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 20:13:27 +0100 (CET)
Received: from localhost ([::1]:36630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhzDq-0006cA-Kb
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 15:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhzCI-0005qA-Rp
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 15:11:51 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:36386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhzCG-0005oZ-K3
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 15:11:50 -0400
Received: by mail-qt1-x832.google.com with SMTP id h14so210357qtb.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 12:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=1jqx6LdlH4yYs2EogIUVqNOQUUJITYJWGL6gT1lsjLU=;
 b=qDBLxb0gYtXNj0XO6Rf68dWb4TJK13togRjpuu1MJztKMYKmJ1kGjsbpe+QhulC6vZ
 lFOOD6ak5S9qQOAp9YYfHEVcTa0Lpw03KBz6Qb1gT9qLGldVoI2jhaOLTsiu+YtE+Cik
 GbdyVfPV6TMeTOng7EySA/rr5uW6crzcd0nWZs5vBPH4QFGyohRcNUzr7wFJy/tPCTre
 0xKcnQaKJG0YsxSxQNEV0e7tR9VJweduHO6tnsK0MgkGaQUS8IiJd3ChVNq/3gd3sOaP
 DRAF6vVkioOqHLn0Kuukn9bUaghjZRtDq4Qk60dQze33CVoOVFTOdbc1J5zhgKXer+p1
 65jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1jqx6LdlH4yYs2EogIUVqNOQUUJITYJWGL6gT1lsjLU=;
 b=jM3I8mupeGP5kmWnzbUBlUpJiXfGEQdmhK/NxZa8tb+V+BaJtVIozam3WZxBLXfSAm
 5Vn0LETNxXSbtoqDFqXAzfQhE+kBMcU7maMP4/bd/XOA4Ft23+3SuZK536Bc8vhH9JVy
 J/tCcKB7e0GjhBzlql4Hop6BvVjy9Cv4ZoteYWxhrxYBUPCTb532AKU3Uc5y3q6nC4Nx
 Cg+IbgTOpkQeE/SEJRtg4vbY4rDNYkpwci982zMc9Q/knrDyxgZX3U3+M+AFzOopHfxC
 wnrGlrn0F+akxr1dSY+BdlNZs/k50laC4f7QyjIvwGJnMSEhC1YYj0hHE3ZpgWFCT0gE
 vyTg==
X-Gm-Message-State: AOAM532JxZzGH/k8bgGIqWCywAcRz+kQI38ouhV6QBbT+zdfN4ZyTf7t
 a7NBnko4J+kLHqC4ho84On2/D/Lyuyb/uQ==
X-Google-Smtp-Source: ABdhPJxUScGypuq9DtSI8ubHtZBRU/Ygt5PDC1IC2gsEO9pv3Qgr6568BAyL+s5AOLqxFUs9hdJKtw==
X-Received: by 2002:a05:622a:202:: with SMTP id
 b2mr12540667qtx.18.1635880306792; 
 Tue, 02 Nov 2021 12:11:46 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id l1sm13498677qkp.65.2021.11.02.12.11.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 12:11:46 -0700 (PDT)
Subject: Re: [PULL 00/60] accel/tcg patch queue
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20211102110740.215699-1-richard.henderson@linaro.org>
Message-ID: <a155ebce-e2ec-974f-355c-6bca26b22c80@linaro.org>
Date: Tue, 2 Nov 2021 15:11:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 7:06 AM, Richard Henderson wrote:
> The following changes since commit dd61b91c080cdfba1360a5ea1e4693fffb3445b0:
> 
>    Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-10-29' into staging (2021-10-29 19:42:36 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20211102
> 
> for you to fetch changes up to 742f07628c0a0bd847b47ee0a0b20c44531e0ba5:
> 
>    linux-user: Handle BUS_ADRALN in host_signal_handler (2021-11-02 07:00:52 -0400)
> 
> ----------------------------------------------------------------
> - Split out host signal handing from accel/tcg/user-exec.c
>    to linux-user/host/arch/host-signal.h
> - Replace TCGCPUOps.tlb_fill with TCGCPUOps.record_sigsegv for user-only
> - Add TCGCPUOps.record_sigbus for user-only
> - Remove a lot of target-specific cpu_loop handling for signals,
>    now accomplished with generic code.
> 
> ----------------------------------------------------------------
> Richard Henderson (60):
>        accel/tcg: Split out adjust_signal_pc
>        accel/tcg: Move clear_helper_retaddr to cpu loop
>        accel/tcg: Split out handle_sigsegv_accerr_write
>        accel/tcg: Fold cpu_exit_tb_from_sighandler into caller
>        configure: Merge riscv32 and riscv64 host architectures
>        linux-user: Reorg handling for SIGSEGV
>        linux-user/host/x86: Populate host_signal.h
>        linux-user/host/ppc: Populate host_signal.h
>        linux-user/host/alpha: Populate host_signal.h
>        linux-user/host/sparc: Populate host_signal.h
>        linux-user/host/arm: Populate host_signal.h
>        linux-user/host/aarch64: Populate host_signal.h
>        linux-user/host/s390: Populate host_signal.h
>        linux-user/host/mips: Populate host_signal.h
>        linux-user/host/riscv: Populate host_signal.h
>        target/arm: Fixup comment re handle_cpu_signal
>        linux-user/host/riscv: Improve host_signal_write
>        linux-user/signal: Drop HOST_SIGNAL_PLACEHOLDER
>        hw/core: Add TCGCPUOps.record_sigsegv
>        linux-user: Add cpu_loop_exit_sigsegv
>        target/alpha: Implement alpha_cpu_record_sigsegv
>        target/arm: Use cpu_loop_exit_sigsegv for mte tag lookup
>        target/arm: Implement arm_cpu_record_sigsegv
>        target/cris: Make cris_cpu_tlb_fill sysemu only
>        target/hexagon: Remove hexagon_cpu_tlb_fill
>        target/hppa: Make hppa_cpu_tlb_fill sysemu only
>        target/i386: Implement x86_cpu_record_sigsegv
>        target/m68k: Make m68k_cpu_tlb_fill sysemu only
>        target/microblaze: Make mb_cpu_tlb_fill sysemu only
>        target/mips: Make mips_cpu_tlb_fill sysemu only
>        target/nios2: Implement nios2_cpu_record_sigsegv
>        linux-user/openrisc: Abort for EXCP_RANGE, EXCP_FPE
>        target/openrisc: Make openrisc_cpu_tlb_fill sysemu only
>        target/ppc: Implement ppc_cpu_record_sigsegv
>        target/riscv: Make riscv_cpu_tlb_fill sysemu only
>        target/s390x: Use probe_access_flags in s390_probe_access
>        target/s390x: Implement s390_cpu_record_sigsegv
>        target/sh4: Make sh4_cpu_tlb_fill sysemu only
>        target/sparc: Make sparc_cpu_tlb_fill sysemu only
>        target/xtensa: Make xtensa_cpu_tlb_fill sysemu only
>        accel/tcg: Restrict TCGCPUOps::tlb_fill() to sysemu
>        hw/core: Add TCGCPUOps.record_sigbus
>        linux-user: Add cpu_loop_exit_sigbus
>        target/alpha: Implement alpha_cpu_record_sigbus
>        target/arm: Implement arm_cpu_record_sigbus
>        linux-user/hppa: Remove EXCP_UNALIGN handling
>        target/microblaze: Do not set MO_ALIGN for user-only
>        target/ppc: Move SPR_DSISR setting to powerpc_excp
>        target/ppc: Set fault address in ppc_cpu_do_unaligned_access
>        target/ppc: Restrict ppc_cpu_do_unaligned_access to sysemu
>        linux-user/ppc: Remove POWERPC_EXCP_ALIGN handling
>        target/s390x: Implement s390x_cpu_record_sigbus
>        target/sh4: Set fault address in superh_cpu_do_unaligned_access
>        target/sparc: Remove DEBUG_UNALIGNED
>        target/sparc: Split out build_sfsr
>        target/sparc: Set fault address in sparc_cpu_do_unaligned_access
>        accel/tcg: Report unaligned atomics for user-only
>        accel/tcg: Report unaligned load/store for user-only
>        tcg: Add helper_unaligned_{ld,st} for user-only sigbus
>        linux-user: Handle BUS_ADRALN in host_signal_handler
> 
>   configure                                          |   8 +-
>   meson.build                                        |   4 +-
>   include/exec/exec-all.h                            |  55 +-
>   include/hw/core/tcg-cpu-ops.h                      |  71 +-
>   include/tcg/tcg-ldst.h                             |   5 +
>   linux-user/host/aarch64/host-signal.h              |  74 ++
>   linux-user/host/alpha/host-signal.h                |  42 +
>   linux-user/host/arm/host-signal.h                  |  30 +
>   linux-user/host/i386/host-signal.h                 |  25 +
>   linux-user/host/mips/host-signal.h                 |  62 ++
>   linux-user/host/ppc/host-signal.h                  |  25 +
>   linux-user/host/ppc64/host-signal.h                |   1 +
>   linux-user/host/riscv/host-signal.h                |  58 ++
>   linux-user/host/{riscv64 => riscv}/hostdep.h       |   4 +-
>   linux-user/host/riscv32/hostdep.h                  |  11 -
>   linux-user/host/s390/host-signal.h                 |  93 +++
>   linux-user/host/s390x/host-signal.h                |   1 +
>   linux-user/host/sparc/host-signal.h                |  54 ++
>   linux-user/host/sparc64/host-signal.h              |   1 +
>   linux-user/host/x32/host-signal.h                  |   1 +
>   linux-user/host/x86_64/host-signal.h               |  24 +
>   target/alpha/cpu.h                                 |  21 +-
>   target/arm/internals.h                             |   8 +
>   target/cris/cpu.h                                  |   8 +-
>   target/hppa/cpu.h                                  |   2 +-
>   target/i386/tcg/helper-tcg.h                       |   6 +
>   target/microblaze/cpu.h                            |   8 +-
>   target/mips/tcg/tcg-internal.h                     |   7 +-
>   target/nios2/cpu.h                                 |   6 +
>   target/openrisc/cpu.h                              |   7 +-
>   target/ppc/cpu.h                                   |   3 -
>   target/ppc/internal.h                              |  17 +-
>   target/s390x/s390x-internal.h                      |   9 +
>   target/sh4/cpu.h                                   |   6 +-
>   target/xtensa/cpu.h                                |   2 +-
>   accel/tcg/cpu-exec.c                               |   3 +-
>   accel/tcg/user-exec.c                              | 861 +++------------------
>   linux-user/aarch64/cpu_loop.c                      |  12 +-
>   linux-user/alpha/cpu_loop.c                        |  15 -
>   linux-user/arm/cpu_loop.c                          |  30 +-
>   linux-user/cris/cpu_loop.c                         |  10 -
>   linux-user/hexagon/cpu_loop.c                      |  24 +-
>   linux-user/hppa/cpu_loop.c                         |  23 -
>   linux-user/m68k/cpu_loop.c                         |  10 -
>   linux-user/microblaze/cpu_loop.c                   |  10 -
>   linux-user/mips/cpu_loop.c                         |  11 -
>   linux-user/openrisc/cpu_loop.c                     |  25 +-
>   linux-user/ppc/cpu_loop.c                          |   8 -
>   linux-user/riscv/cpu_loop.c                        |   7 -
>   linux-user/s390x/cpu_loop.c                        |  13 +-
>   linux-user/sh4/cpu_loop.c                          |   8 -
>   linux-user/signal.c                                | 133 +++-
>   linux-user/sparc/cpu_loop.c                        |  25 -
>   linux-user/xtensa/cpu_loop.c                       |   9 -
>   target/alpha/cpu.c                                 |   7 +-
>   target/alpha/helper.c                              |  39 +-
>   target/alpha/mem_helper.c                          |  30 +-
>   target/arm/cpu.c                                   |   7 +-
>   target/arm/cpu_tcg.c                               |   7 +-
>   target/arm/mte_helper.c                            |   6 +-
>   target/arm/sve_helper.c                            |   2 +-
>   target/arm/tlb_helper.c                            |  42 +-
>   target/cris/cpu.c                                  |   4 +-
>   target/cris/helper.c                               |  18 -
>   target/hexagon/cpu.c                               |  23 -
>   target/hppa/cpu.c                                  |   2 +-
>   target/hppa/mem_helper.c                           |  15 -
>   target/i386/tcg/tcg-cpu.c                          |   3 +-
>   target/i386/tcg/user/excp_helper.c                 |  23 +-
>   target/m68k/cpu.c                                  |   2 +-
>   target/m68k/helper.c                               |   6 +-
>   target/microblaze/cpu.c                            |   2 +-
>   target/microblaze/helper.c                         |  13 +-
>   target/microblaze/translate.c                      |  16 +
>   target/mips/cpu.c                                  |   2 +-
>   target/mips/tcg/user/tlb_helper.c                  |  59 --
>   target/nios2/cpu.c                                 |   6 +-
>   target/nios2/helper.c                              |   7 +-
>   target/openrisc/cpu.c                              |   2 +-
>   target/openrisc/mmu.c                              |   9 -
>   target/ppc/cpu_init.c                              |   6 +-
>   target/ppc/excp_helper.c                           |  41 +-
>   target/ppc/user_only_helper.c                      |  15 +-
>   target/riscv/cpu.c                                 |   2 +-
>   target/riscv/cpu_helper.c                          |  21 +-
>   target/s390x/cpu.c                                 |   7 +-
>   target/s390x/tcg/excp_helper.c                     |  45 +-
>   target/s390x/tcg/mem_helper.c                      |  18 +-
>   target/sh4/cpu.c                                   |   2 +-
>   target/sh4/helper.c                                |   9 +-
>   target/sh4/op_helper.c                             |   5 +
>   target/sparc/cpu.c                                 |   2 +-
>   target/sparc/ldst_helper.c                         |  22 -
>   target/sparc/mmu_helper.c                          | 115 +--
>   target/xtensa/cpu.c                                |   2 +-
>   target/xtensa/helper.c                             |  22 +-
>   .../host/{riscv64 => riscv}/safe-syscall.inc.S     |   0
>   target/cris/meson.build                            |   7 +-
>   target/hppa/meson.build                            |   6 +-
>   target/mips/tcg/meson.build                        |   3 -
>   target/mips/tcg/user/meson.build                   |   3 -
>   target/openrisc/meson.build                        |   2 +-
>   target/sparc/meson.build                           |   2 +-
>   103 files changed, 1269 insertions(+), 1436 deletions(-)
>   create mode 100644 linux-user/host/aarch64/host-signal.h
>   create mode 100644 linux-user/host/alpha/host-signal.h
>   create mode 100644 linux-user/host/arm/host-signal.h
>   create mode 100644 linux-user/host/i386/host-signal.h
>   create mode 100644 linux-user/host/mips/host-signal.h
>   create mode 100644 linux-user/host/ppc/host-signal.h
>   create mode 100644 linux-user/host/ppc64/host-signal.h
>   create mode 100644 linux-user/host/riscv/host-signal.h
>   rename linux-user/host/{riscv64 => riscv}/hostdep.h (94%)
>   delete mode 100644 linux-user/host/riscv32/hostdep.h
>   create mode 100644 linux-user/host/s390/host-signal.h
>   create mode 100644 linux-user/host/s390x/host-signal.h
>   create mode 100644 linux-user/host/sparc/host-signal.h
>   create mode 100644 linux-user/host/sparc64/host-signal.h
>   create mode 100644 linux-user/host/x32/host-signal.h
>   create mode 100644 linux-user/host/x86_64/host-signal.h
>   delete mode 100644 target/mips/tcg/user/tlb_helper.c
>   rename linux-user/host/{riscv64 => riscv}/safe-syscall.inc.S (100%)
>   delete mode 100644 target/mips/tcg/user/meson.build

Applied, thanks.

r~


