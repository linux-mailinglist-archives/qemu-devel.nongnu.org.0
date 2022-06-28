Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F34D255BFAB
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:01:09 +0200 (CEST)
Received: from localhost ([::1]:60666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o675o-0004TW-B2
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o64ao-0000Pl-Qv
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 02:20:58 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:43748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o64am-0002wA-HK
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 02:20:58 -0400
Received: by mail-pf1-x432.google.com with SMTP id 136so5983751pfy.10
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 23:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=QbZweMymcBzbs7RavFIV8ucrXGJ8L3NCFShPaoibYXs=;
 b=vNkde+9vg77tt4fMs/sHL387LOqv2rZyTapDmHY1SzzczD1b78hSwnSHGKOgRjNjzU
 flvjvY4+eOCNoqaOPvL55NX6aQUCLJhJV5hpbcAvI4qH88ZggmvX3a1apuVSkUJ/NAIV
 xuOaUemTmp7OWQ5am/vEHgB6dSpZ8zBTy8X3T14GRiC1jWjvjy273CdDPysTbksZdFPs
 m7wKc0QYaoEhH/cvTg7MAdcaiHqSpbHvQRcIg3NgD6q+LQACD0f/WL8k/9hp+hEIzOX6
 A7HJJtaLX4gvLEO5k9b0/JpKLKxoFMPEhjPZj+K7qz8qrf5Bv/TAwxMnMMKH/yYOpbDm
 rhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=QbZweMymcBzbs7RavFIV8ucrXGJ8L3NCFShPaoibYXs=;
 b=XbnwyYJytXYK6425gaO3fAW/syKJaZ7NpG0ry+qQUCr0hrCVtIT/nMJeXPwEWRhwzN
 CeKlRTdxkIhF5UHcuoYdoEX1PE/1SOdu9bQ9c6EdOzepfRgZKxbSDKcGDVGgHccyIvhU
 FwkZzW0ouTJ8Hrc/Je1QXNBsY1Hy81NjufIxwLcqETvVl8/UtUOaYyC4DnXDeyeD9aWc
 SvxzM3yHp1MxKBq29IOkgy4irif+Im6exyjSEGgG1BaGgkoPANI3WX9c2tNZLSoEzlR4
 1Vq8SDeiPcmJxfMLgSQtfxIyKeg9FZswQdpbyhK21mY+Y2YW5OsUz5yEzx4ADyUOYrN9
 81uQ==
X-Gm-Message-State: AJIora8v3EUYoG1yG7T4ZBZnh9RuTgweCDvXjcekxawKVaJ7nHdLJ41g
 09edQgsimBkcEh/0YccZWeVSu/zjI/T4Tg==
X-Google-Smtp-Source: AGRyM1tL+CMexvvVEJ3nYTu2Z2ErB1wU34ABlAwB15gvg4GIomg6N6jLcUWDHcdy+UFIeFEDSj9ldQ==
X-Received: by 2002:a63:6806:0:b0:3fc:3b43:52d5 with SMTP id
 d6-20020a636806000000b003fc3b4352d5mr16124946pgc.319.1656397254357; 
 Mon, 27 Jun 2022 23:20:54 -0700 (PDT)
Received: from [192.168.123.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a1709029a8200b001634d581adfsm8254816plp.157.2022.06.27.23.20.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 23:20:53 -0700 (PDT)
Message-ID: <34846813-7d22-fb1b-4b3b-84b9e2ba157e@linaro.org>
Date: Tue, 28 Jun 2022 11:50:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/60] semihosting patch queue
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220628045403.508716-1-richard.henderson@linaro.org>
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/22 10:23, Richard Henderson wrote:
> The following changes since commit 29f6db75667f44f3f01ba5037dacaf9ebd9328da:
> 
>    Merge tag 'pull-target-arm-20220627' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-06-27 16:47:39 +0530)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-semi-20220628
> 
> for you to fetch changes up to ca97e0ef99045ce650b842f3bc8c89d76daaafae:
> 
>    target/nios2: Move nios2-semi.c to nios2_softmmu_ss (2022-06-28 10:18:57 +0530)
> 
> ----------------------------------------------------------------
> Semihosting syscall reorg:
>    * Split out semihosting/syscalls.c with common implementations.
>    * Reorg arm-compat-semi.c to use syscalls.c.
>    * Minor prep cleanups to m68k, mips, nios2.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Richard Henderson (60):
>        semihosting: Move exec/softmmu-semi.h to semihosting/softmmu-uaccess.h
>        semihosting: Return failure from softmmu-uaccess.h functions
>        semihosting: Improve condition for config.c and console.c
>        semihosting: Move softmmu-uaccess.h functions out of line
>        accel/stubs: Add tcg stub for probe_access_flags
>        semihosting: Add target_strlen for softmmu-uaccess.h
>        semihosting: Simplify softmmu_lock_user_string
>        semihosting: Split out guestfd.c
>        semihosting: Inline set_swi_errno into common_semi_cb
>        semihosting: Adjust error checking in common_semi_cb
>        semihosting: Clean up common_semi_flen_cb
>        semihosting: Clean up common_semi_open_cb
>        semihosting: Return void from do_common_semihosting
>        semihosting: Move common-semi.h to include/semihosting/
>        semihosting: Remove GDB_O_BINARY
>        include/exec: Move gdb open flags to gdbstub.h
>        include/exec: Move gdb_stat and gdb_timeval to gdbstub.h
>        include/exec: Define errno values in gdbstub.h
>        gdbstub: Convert GDB error numbers to host error numbers
>        semihosting: Use struct gdb_stat in common_semi_flen_cb
>        semihosting: Split is_64bit_semihosting per target
>        semihosting: Split common_semi_flen_buf per target
>        semihosting: Split out common_semi_has_synccache
>        semihosting: Split out common-semi-target.h
>        semihosting: Use env more often in do_common_semihosting
>        semihosting: Move GET_ARG/SET_ARG earlier in the file
>        semihosting: Split out semihost_sys_open
>        semihosting: Split out semihost_sys_close
>        semihosting: Split out semihost_sys_read
>        semihosting: Split out semihost_sys_write
>        semihosting: Bound length for semihost_sys_{read,write}
>        semihosting: Split out semihost_sys_lseek
>        semihosting: Split out semihost_sys_isatty
>        semihosting: Split out semihost_sys_flen
>        semihosting: Split out semihost_sys_remove
>        semihosting: Split out semihost_sys_rename
>        semihosting: Split out semihost_sys_system
>        semihosting: Create semihost_sys_{stat,fstat}
>        semihosting: Create semihost_sys_gettimeofday
>        gdbstub: Adjust gdb_syscall_complete_cb declaration
>        semihosting: Fix docs comment for qemu_semihosting_console_inc
>        semihosting: Pass CPUState to qemu_semihosting_console_inc
>        semihosting: Expand qemu_semihosting_console_inc to read
>        semihosting: Cleanup chardev init
>        semihosting: Create qemu_semihosting_console_write
>        semihosting: Add GuestFDConsole
>        semihosting: Create qemu_semihosting_guestfd_init
>        semihosting: Use console_in_gf for SYS_READC
>        semihosting: Use console_out_gf for SYS_WRITEC
>        semihosting: Remove qemu_semihosting_console_outc
>        semihosting: Use console_out_gf for SYS_WRITE0
>        semihosting: Remove qemu_semihosting_console_outs
>        semihosting: Create semihost_sys_poll_one
>        target/m68k: Eliminate m68k_semi_is_fseek
>        target/m68k: Make semihosting system only
>        target/mips: Use an exception for semihosting
>        target/mips: Add UHI errno values
>        target/mips: Drop pread and pwrite syscalls from semihosting
>        target/nios2: Eliminate nios2_semi_is_lseek
>        target/nios2: Move nios2-semi.c to nios2_softmmu_ss
> 
>   configs/targets/aarch64-linux-user.mak             |    1 +
>   configs/targets/aarch64_be-linux-user.mak          |    1 +
>   configs/targets/arm-linux-user.mak                 |    1 +
>   configs/targets/armeb-linux-user.mak               |    1 +
>   configs/targets/riscv32-linux-user.mak             |    1 +
>   configs/targets/riscv64-linux-user.mak             |    1 +
>   include/exec/gdbstub.h                             |   64 +-
>   include/exec/softmmu-semi.h                        |  101 --
>   {semihosting => include/semihosting}/common-semi.h |    2 +-
>   include/semihosting/console.h                      |   71 +-
>   include/semihosting/guestfd.h                      |   91 ++
>   include/semihosting/semihost.h                     |   14 +-
>   include/semihosting/softmmu-uaccess.h              |   59 ++
>   include/semihosting/syscalls.h                     |   75 ++
>   target/arm/common-semi-target.h                    |   62 ++
>   target/mips/cpu.h                                  |    3 +-
>   target/mips/tcg/tcg-internal.h                     |    2 +
>   target/riscv/common-semi-target.h                  |   50 +
>   target/mips/tcg/sysemu_helper.h.inc                |    2 -
>   accel/stubs/tcg-stub.c                             |    7 +
>   gdbstub.c                                          |   38 +-
>   linux-user/aarch64/cpu_loop.c                      |    2 +-
>   linux-user/arm/cpu_loop.c                          |    2 +-
>   linux-user/m68k/cpu_loop.c                         |    5 -
>   linux-user/main.c                                  |    9 +
>   linux-user/riscv/cpu_loop.c                        |    2 +-
>   linux-user/semihost.c                              |   48 +-
>   semihosting/arm-compat-semi.c                      | 1011 +++++---------------
>   semihosting/config.c                               |   17 +-
>   semihosting/console.c                              |  153 ++-
>   semihosting/guestfd.c                              |  160 ++++
>   semihosting/syscalls.c                             |  978 +++++++++++++++++++
>   semihosting/uaccess.c                              |   91 ++
>   softmmu/vl.c                                       |    3 +-
>   stubs/semihost.c                                   |    6 +-
>   target/arm/helper.c                                |    4 +-
>   target/arm/m_helper.c                              |    2 +-
>   target/m68k/m68k-semi.c                            |  137 +--
>   target/mips/tcg/exception.c                        |    1 +
>   target/mips/tcg/sysemu/mips-semi.c                 |   85 +-
>   target/mips/tcg/sysemu/tlb_helper.c                |    4 +
>   target/mips/tcg/translate.c                        |   12 +-
>   target/nios2/nios2-semi.c                          |  106 +-
>   target/riscv/cpu_helper.c                          |    2 +-
>   target/mips/tcg/micromips_translate.c.inc          |    6 +-
>   target/mips/tcg/mips16e_translate.c.inc            |    2 +-
>   target/mips/tcg/nanomips_translate.c.inc           |    4 +-
>   semihosting/meson.build                            |    6 +
>   target/m68k/meson.build                            |    6 +-
>   target/nios2/meson.build                           |    4 +-
>   50 files changed, 2194 insertions(+), 1321 deletions(-)
>   delete mode 100644 include/exec/softmmu-semi.h
>   rename {semihosting => include/semihosting}/common-semi.h (96%)
>   create mode 100644 include/semihosting/guestfd.h
>   create mode 100644 include/semihosting/softmmu-uaccess.h
>   create mode 100644 include/semihosting/syscalls.h
>   create mode 100644 target/arm/common-semi-target.h
>   create mode 100644 target/riscv/common-semi-target.h
>   create mode 100644 semihosting/guestfd.c
>   create mode 100644 semihosting/syscalls.c
>   create mode 100644 semihosting/uaccess.c


