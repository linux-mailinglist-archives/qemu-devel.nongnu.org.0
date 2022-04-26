Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2703A510B74
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 23:40:00 +0200 (CEST)
Received: from localhost ([::1]:45122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njSud-0006kX-0r
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 17:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njStU-0005d8-B2
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 17:38:48 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njStS-0003q4-6q
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 17:38:47 -0400
Received: by mail-pl1-x62f.google.com with SMTP id d15so16973584plh.2
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 14:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=3PxYc6tuCIstamZIsLVo8MYWHX7t4sYUOeVRQ/4pcy8=;
 b=ylVvd1e/Q5Lqvho2l6lA+n2i1/X3NKU5dh6mzbvSDsMenzScXRDpY3INHioWJfRbmk
 THu0LorvJjvAVofKFzzGpO8y4VP1//dhQyoxiaSTSLtPuu4dLDtErnThiV9g4P9igPTb
 e5CPbTNM+32WuF0E8cTX70hfOv1iSX8iBFRUvDd99iZ883RN7hbVv4AdRpKBOPl2Qzmk
 177dTc63TdjtPm1lonlbApLz9OfGZ60YDGviAUE6UkoKCaVa/kQdnuTseOSgsu63b6m2
 GBwojtxmioARQpLZtPDE/wUymurwJOe3F7AoUcp864QCrxpZOUWRzA+wazYnFPuCLUyV
 Xmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=3PxYc6tuCIstamZIsLVo8MYWHX7t4sYUOeVRQ/4pcy8=;
 b=iYpBLDGMb0UpTvonWPJmxfyx4lP+yjBqpnJ0nX2pMbVpuQOecgQtsIM07HRStob4lL
 gHci6Lw61gTRygVDUPADXPwHVIPi77BUuCySXo9DnhGD3F+h3u52n8QmO0nRjBZ/wADP
 uO5ktYHm5ea+WCvt9nyZxckSO74zWpmTViQgMSubFnoxTCGUwTpaHUwh5Tat/nV0cYgL
 nq4LetZRzMYXKG5wmQa2GBbLSqalnAsjxhOK2iq43IOT2EdL1XM5CE/vWfYEk9WdqBem
 9Lq3bU0Q/T2Qplw1kVjrdmESj9hSqwQwh3lBCnkdrRNl4shmTEdl762u0y1iolcICEMX
 ySxg==
X-Gm-Message-State: AOAM532KtJdlgmZ5UAC7L2Po4RdLCzEWB3MRT1Xyd+cdomCAV/xfUlli
 4VsYJr0ubrE9AUHmgUN8WxBHOIm/xUcZmQ==
X-Google-Smtp-Source: ABdhPJwlaOVqrdRJAYEJNLq1JQJVo2W+ZPAw1ZozKu26Btrut1VeEGymJmyDib2vWnUfmjlJTrd75g==
X-Received: by 2002:a17:90a:d0c1:b0:1d2:c00a:8656 with SMTP id
 y1-20020a17090ad0c100b001d2c00a8656mr29216517pjw.235.1651009124768; 
 Tue, 26 Apr 2022 14:38:44 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a62a104000000b0050cf012cba1sm16241974pff.91.2022.04.26.14.38.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 14:38:44 -0700 (PDT)
Message-ID: <97700683-6771-a5fe-4b37-7296fab25243@linaro.org>
Date: Tue, 26 Apr 2022 14:38:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/68] nios2 patch queue
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220426181907.103691-1-richard.henderson@linaro.org>
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 11:17, Richard Henderson wrote:
> The following changes since commit a1755db71e34df016ffc10aa0727360aae2c6036:
> 
>    Merge tag 'pull-block-2022-04-25' of https://gitlab.com/hreitz/qemu into staging (2022-04-25 13:35:41 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-nios2-20220426
> 
> for you to fetch changes up to 7f176c5a0bcb70492f3b158a36311e75f1eb87d7:
> 
>    tests/tcg/nios2: Add test-shadow-1 (2022-04-26 08:17:10 -0700)
> 
> ----------------------------------------------------------------
> Fix nios2-linux-user syscalls.
> Fix nios2-linux-user sigreturn.
> Enable tests for nios2-linux-user.
> Remove special handling of SIGSEGV.
> Check supervisor for eret, bret.
> Split special registers out of env->regs[].
> Clean up interrupt processing.
> Raise unaligned data and destination exceptions.
> Set TLBMISC fields correctly on exceptions.
> Prevent writes to read-only or reserved control fields.
> Use tcg_constant_tl().
> Implement shadow register sets.
> Implement external interrupt controller interface.
> Implement vectored interrupt controller.
> Enable semihosting tests for nios2-softmmu.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Amir Gonnen (5):
>        target/nios2: Check supervisor on eret
>        target/nios2: Add NUM_GP_REGS and NUM_CP_REGS
>        target/nios2: Split out helper for eret instruction
>        hw/intc: Vectored Interrupt Controller (VIC)
>        hw/nios2: Machine with a Vectored Interrupt Controller
> 
> Richard Henderson (63):
>        linux-user/nios2: Hoist pc advance to the top of EXCP_TRAP
>        linux-user/nios2: Fix clone child return
>        linux-user/nios2: Drop syscall 0 "workaround"
>        linux-user/nios2: Adjust error return
>        linux-user/nios2: Handle special qemu syscall return values
>        linux-user/nios2: Remove do_sigreturn
>        linux-user/nios2: Use QEMU_ESIGRETURN from do_rt_sigreturn
>        tests/tcg/nios2: Re-enable linux-user tests
>        target/nios2: Remove user-only nios2_cpu_do_interrupt
>        target/nios2: Remove nios2_cpu_record_sigsegv
>        target/nios2: Build helper.c for system only
>        linux-user/nios2: Use force_sig_fault for EXCP_DEBUG
>        target/nios2: Stop generating code if gen_check_supervisor fails
>        target/nios2: Split PC out of env->regs[]
>        target/nios2: Fix BRET instruction
>        target/nios2: Do not create TCGv for control registers
>        linux-user/nios2: Only initialize SP and PC in target_cpu_copy_regs
>        target/nios2: Remove cpu_interrupts_enabled
>        target/nios2: Split control registers away from general registers
>        target/nios2: Clean up nios2_cpu_dump_state
>        target/nios2: Use hw/registerfields.h for CR_STATUS fields
>        target/nios2: Use hw/registerfields.h for CR_EXCEPTION fields
>        target/nios2: Use hw/registerfields.h for CR_TLBADDR fields
>        target/nios2: Use hw/registerfields.h for CR_TLBACC fields
>        target/nios2: Rename CR_TLBMISC_WR to CR_TLBMISC_WE
>        target/nios2: Use hw/registerfields.h for CR_TLBMISC fields
>        target/nios2: Move R_FOO and CR_BAR into enumerations
>        target/nios2: Create EXCP_SEMIHOST for semi-hosting
>        target/nios2: Clean up nios2_cpu_do_interrupt
>        target/nios2: Hoist CPU_LOG_INT logging
>        target/nios2: Handle EXCP_UNALIGN and EXCP_UNALIGND
>        target/nios2: Cleanup set of CR_EXCEPTION for do_interrupt
>        target/nios2: Clean up handling of tlbmisc in do_exception
>        target/nios2: Prevent writes to read-only or reserved control fields
>        target/nios2: Implement cpuid
>        target/nios2: Implement CR_STATUS.RSIE
>        target/nios2: Remove CPU_INTERRUPT_NMI
>        target/nios2: Support division error exception
>        target/nios2: Use tcg_constant_tl
>        target/nios2: Split out named structs for [IRJ]_TYPE
>        target/nios2: Split out helpers for gen_i_cmpxx
>        target/nios2: Split out helpers for gen_i_math_logic
>        target/nios2: Split out helpers for gen_r_math_logic
>        target/nios2: Split out helpers for gen_rr_mul_high
>        target/nios2: Split out helpers for gen_rr_shift
>        target/nios2: Introduce dest_gpr
>        target/nios2: Drop CR_STATUS_EH from tb->flags
>        target/nios2: Enable unaligned traps for system mode
>        target/nios2: Create gen_jumpr
>        target/nios2: Hoist set of is_jmp into gen_goto_tb
>        target/nios2: Use gen_goto_tb for DISAS_TOO_MANY
>        target/nios2: Use tcg_gen_lookup_and_goto_ptr
>        target/nios2: Implement Misaligned destination exception
>        target/nios2: Introduce shadow register sets
>        target/nios2: Implement rdprs, wrprs
>        target/nios2: Update helper_eret for shadow registers
>        target/nios2: Implement EIC interrupt processing
>        target/nios2: Advance pc when raising exceptions
>        linux-user/nios2: Handle various SIGILL exceptions
>        hw/nios2: Introduce Nios2MachineState
>        hw/nios2: Move memory regions into Nios2Machine
>        tests/tcg/nios2: Add semihosting multiarch tests
>        tests/tcg/nios2: Add test-shadow-1
> 
>   configs/targets/nios2-softmmu.mak       |   1 +
>   include/hw/intc/nios2_vic.h             |  64 +++
>   linux-user/nios2/target_cpu.h           |   1 +
>   target/nios2/cpu.h                      | 250 +++++++----
>   target/nios2/helper.h                   |   5 +
>   tests/tcg/nios2/semicall.h              |  28 ++
>   hw/intc/nios2_vic.c                     | 313 +++++++++++++
>   hw/nios2/10m50_devboard.c               | 115 +++--
>   linux-user/elfload.c                    |   3 +-
>   linux-user/nios2/cpu_loop.c             |  96 ++--
>   linux-user/nios2/signal.c               |  25 +-
>   target/nios2/cpu.c                      | 213 +++++++--
>   target/nios2/helper.c                   | 383 +++++++++-------
>   target/nios2/mmu.c                      |  78 ++--
>   target/nios2/op_helper.c                |  88 ++++
>   target/nios2/translate.c                | 749 ++++++++++++++++++++------------
>   hw/intc/Kconfig                         |   3 +
>   hw/intc/meson.build                     |   1 +
>   hw/nios2/Kconfig                        |   1 +
>   target/nios2/meson.build                |   7 +-
>   tests/tcg/nios2/10m50-ghrd.ld           |  66 +++
>   tests/tcg/nios2/Makefile.softmmu-target |  33 ++
>   tests/tcg/nios2/Makefile.target         |  11 -
>   tests/tcg/nios2/boot.S                  | 218 ++++++++++
>   tests/tcg/nios2/intr.S                  |  31 ++
>   tests/tcg/nios2/test-shadow-1.S         |  40 ++
>   26 files changed, 2113 insertions(+), 710 deletions(-)
>   create mode 100644 include/hw/intc/nios2_vic.h
>   create mode 100644 tests/tcg/nios2/semicall.h
>   create mode 100644 hw/intc/nios2_vic.c
>   create mode 100644 tests/tcg/nios2/10m50-ghrd.ld
>   create mode 100644 tests/tcg/nios2/Makefile.softmmu-target
>   delete mode 100644 tests/tcg/nios2/Makefile.target
>   create mode 100644 tests/tcg/nios2/boot.S
>   create mode 100644 tests/tcg/nios2/intr.S
>   create mode 100644 tests/tcg/nios2/test-shadow-1.S


