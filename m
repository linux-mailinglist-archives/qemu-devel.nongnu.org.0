Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D909486BE4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 22:29:25 +0100 (CET)
Received: from localhost ([::1]:40776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5aK4-0001xN-9K
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 16:29:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5a6T-0008Mm-24
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 16:15:22 -0500
Received: from [2607:f8b0:4864:20::534] (port=43847
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5a6N-00084V-SR
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 16:15:18 -0500
Received: by mail-pg1-x534.google.com with SMTP id 8so3655281pgc.10
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 13:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=PbblvKE89Ps02MIvy62YDLj76oHV2ovedH316jVKUz0=;
 b=uicu9nX1Z79E+GLHBgLgJPRQCtAQFlyMV9XF2inocsCPdmCalov2ILCWJG5sz61GSr
 Hh6jQJqSQ/GOhpRF/ACjeIbHHtcBmb8dD/8cBwRtOXNLnpmm8pLEk9JZpWgaZlcZDsij
 qfvZX6C+fIkDsvf/lr/Zpz1m9I+IuWZqyY6tuWv+FuEspvVcO3MraRZnBswA3I1VPNYf
 KxK9FuY6oocfCQJiSPvtJAdDcW50gxFqXyJIEcZeU1MRfTGubWr9Dpbf5mlKAO9+hJ/X
 FAjv+Dp36xyh42d7zNVaxG6y1kPeyCHGxDj9v6u86J1oVp5KHfOjI5+zs7sdUqp6/W+8
 p3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PbblvKE89Ps02MIvy62YDLj76oHV2ovedH316jVKUz0=;
 b=nzMinWE98VoKd4jJ7snAuoiT+Hv4DAAnbaSDbWw557zuRI1GJKYGJnFvVHVM9rXd9y
 aVUIqeQej+RM7RU7ZrR7MnpkzZZCyRk/qRn9jKe/q/uNFNhZjZdDayFU2PNHXxSmmRCC
 jvc3KiS+Iny62zS0NcVIfV4Ov7fG7pmY6u69GIBznPmvDNDKzLxuSDPDJq2xAz3paBe+
 UZq9q2r6VvyiEA/SHGrfhGTJ8a826eLM6F1oxoVjSiO87zwdzFXbT/Hf4/pliqOuI89e
 kviyyeJa/OvjCtL+ltL+IeXonROgf6rlVWZcZjzPtxmpvhU0vJP3qwuKV1j+2I+Ov8lb
 HwZw==
X-Gm-Message-State: AOAM5322cO0zDiRrZ2NjiMGx7k7WdzJwS4hNiwkm5qNYVfgwK4Dq/XCe
 X5yKjs6ozPj7Wrgm+PYQo3bx1qLE63VqBw==
X-Google-Smtp-Source: ABdhPJwoxDQobw+DZIky82RGOyXISniAzpETay+vZoNr50mt6egSk2IixIiIn+4uTb9lRg4/jQ4O+w==
X-Received: by 2002:a63:ab4a:: with SMTP id k10mr52600601pgp.105.1641503713868; 
 Thu, 06 Jan 2022 13:15:13 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k3sm6249pjt.39.2022.01.06.13.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 13:15:13 -0800 (PST)
Subject: Re: [PULL 00/27] Linux user for 7.0 patches
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220106104137.732883-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d71343e5-c1f6-d433-393b-4ce0cc9e5527@linaro.org>
Date: Thu, 6 Jan 2022 13:15:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/22 2:41 AM, Laurent Vivier wrote:
> The following changes since commit fb084237a3b78b20fd9d888dffd673b6656ea3be:
> 
>    common-user: Really fix i386 calls to safe_syscall_set_errno_tail (2022-01-04 21:14:23 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.0-pull-request
> 
> for you to fetch changes up to f0effdbc2a5b43422bc4c9c22641ef9dafa0c7ae:
> 
>    linux-user: netlink: update IFLA_BRPORT entries (2022-01-06 11:40:53 +0100)
> 
> ----------------------------------------------------------------
> linux-user pull request 20220106
> 
> update netlink entries
> nios2 fixes
> /proc/self/maps fixes
> set/getscheduler update
> prctl cleanup and fixes
> target_signal.h cleanup
> and some trivial fixes
> 
> ----------------------------------------------------------------
> 
> Ahmed Abouzied (1):
>    linux-user/syscall.c: malloc to g_try_malloc
> 
> Andrey Kazmin (1):
>    linux-user/syscall.c: fix missed flag for shared memory in
>      open_self_maps
> 
> Laurent Vivier (3):
>    linux-user: netlink: update IFLA entries
>    linux-user: netlink: Add IFLA_VFINFO_LIST
>    linux-user: netlink: update IFLA_BRPORT entries
> 
> Martin Wilck (1):
>    qemu-binfmt-conf.sh: fix -F option
> 
> Matthias Schiffer (1):
>    linux-user/signal: Map exit signals in SIGCHLD siginfo_t
> 
> Philippe Mathieu-Daudé (2):
>    linux-user/hexagon: Use generic target_stat64 structure
>    linux-user: Mark cpu_loop() with noreturn attribute
> 
> Richard Henderson (13):
>    linux-user: Split out do_prctl and subroutines
>    linux-user: Disable more prctl subcodes
>    linux-user: Add code for PR_GET/SET_UNALIGN
>    target/alpha: Implement prctl_unalign_sigbus
>    target/hppa: Implement prctl_unalign_sigbus
>    target/sh4: Implement prctl_unalign_sigbus
>    linux-user/nios2: Properly emulate EXCP_TRAP
>    linux-user/nios2: Fixes for signal frame setup
>    linux-user/elfload: Rename ARM_COMMPAGE to HI_COMMPAGE
>    linux-user/nios2: Map a real kuser page
>    linux-user/nios2: Fix EA vs PC confusion
>    linux-user/nios2: Fix sigmask in setup_rt_frame
>    linux-user/nios2: Use set_sigmask in do_rt_sigreturn
> 
> Song Gao (3):
>    linux-user: Move target_signal.h generic definitions to
>      generic/signal.h
>    linux-user: target_syscall.h remove definition TARGET_MINSIGSTKSZ
>    linux-user: Remove TARGET_SIGSTKSZ
> 
> Tonis Tiigi (2):
>    linux-user: add sched_getattr support
>    linux-user: call set/getscheduler set/getparam directly
> 
>   cpu.c                                     |  20 +-
>   include/hw/core/cpu.h                     |   3 +
>   linux-user/aarch64/target_prctl.h         | 160 ++++++
>   linux-user/aarch64/target_signal.h        |  18 -
>   linux-user/aarch64/target_syscall.h       |  24 -
>   linux-user/alpha/target_prctl.h           |   1 +
>   linux-user/alpha/target_signal.h          |   1 -
>   linux-user/alpha/target_syscall.h         |   1 -
>   linux-user/arm/target_prctl.h             |   1 +
>   linux-user/arm/target_signal.h            |  18 -
>   linux-user/arm/target_syscall.h           |   1 -
>   linux-user/cris/target_prctl.h            |   1 +
>   linux-user/cris/target_signal.h           |  18 -
>   linux-user/cris/target_syscall.h          |   1 -
>   linux-user/elfload.c                      |  66 ++-
>   linux-user/fd-trans.c                     | 184 ++++++
>   linux-user/generic/signal.h               |  15 +
>   linux-user/generic/target_prctl_unalign.h |  27 +
>   linux-user/hexagon/target_prctl.h         |   1 +
>   linux-user/hexagon/target_signal.h        |  11 -
>   linux-user/hppa/target_prctl.h            |   1 +
>   linux-user/hppa/target_signal.h           |   1 -
>   linux-user/hppa/target_syscall.h          |   1 -
>   linux-user/i386/target_prctl.h            |   1 +
>   linux-user/i386/target_signal.h           |  18 -
>   linux-user/i386/target_syscall.h          |   1 -
>   linux-user/m68k/target_prctl.h            |   1 +
>   linux-user/m68k/target_signal.h           |  18 -
>   linux-user/m68k/target_syscall.h          |   1 -
>   linux-user/microblaze/target_prctl.h      |   1 +
>   linux-user/microblaze/target_signal.h     |  18 -
>   linux-user/microblaze/target_syscall.h    |   1 -
>   linux-user/mips/target_prctl.h            |  88 +++
>   linux-user/mips/target_signal.h           |   1 -
>   linux-user/mips/target_syscall.h          |   7 -
>   linux-user/mips64/target_prctl.h          |   1 +
>   linux-user/mips64/target_signal.h         |   1 -
>   linux-user/mips64/target_syscall.h        |   7 -
>   linux-user/nios2/cpu_loop.c               |  93 +--
>   linux-user/nios2/signal.c                 |  58 +-
>   linux-user/nios2/target_prctl.h           |   1 +
>   linux-user/nios2/target_signal.h          |  16 -
>   linux-user/nios2/target_syscall.h         |   1 -
>   linux-user/openrisc/target_prctl.h        |   1 +
>   linux-user/openrisc/target_signal.h       |  23 -
>   linux-user/openrisc/target_syscall.h      |   1 -
>   linux-user/ppc/target_prctl.h             |   1 +
>   linux-user/ppc/target_signal.h            |  18 -
>   linux-user/ppc/target_syscall.h           |   1 -
>   linux-user/riscv/target_prctl.h           |   1 +
>   linux-user/riscv/target_signal.h          |  12 -
>   linux-user/riscv/target_syscall.h         |   1 -
>   linux-user/s390x/target_prctl.h           |   1 +
>   linux-user/s390x/target_signal.h          |  15 -
>   linux-user/s390x/target_syscall.h         |   1 -
>   linux-user/sh4/target_prctl.h             |   1 +
>   linux-user/sh4/target_signal.h            |  18 -
>   linux-user/sh4/target_syscall.h           |   1 -
>   linux-user/signal.c                       |   9 +-
>   linux-user/sparc/target_prctl.h           |   1 +
>   linux-user/sparc/target_signal.h          |   1 -
>   linux-user/sparc/target_syscall.h         |   1 -
>   linux-user/syscall.c                      | 657 ++++++++++++----------
>   linux-user/syscall_defs.h                 |  46 +-
>   linux-user/user-internals.h               |   2 +-
>   linux-user/x86_64/target_prctl.h          |   1 +
>   linux-user/x86_64/target_signal.h         |  18 -
>   linux-user/x86_64/target_syscall.h        |   1 -
>   linux-user/xtensa/target_prctl.h          |   1 +
>   linux-user/xtensa/target_signal.h         |  17 -
>   scripts/qemu-binfmt-conf.sh               |   4 +-
>   target/alpha/cpu.h                        |   5 +
>   target/alpha/translate.c                  |  31 +-
>   target/hppa/cpu.h                         |   5 +-
>   target/hppa/translate.c                   |  19 +-
>   target/nios2/cpu.h                        |   2 +-
>   target/nios2/translate.c                  |  26 +-
>   target/sh4/cpu.h                          |   4 +
>   target/sh4/translate.c                    |  50 +-
>   79 files changed, 1130 insertions(+), 776 deletions(-)
>   create mode 100644 linux-user/aarch64/target_prctl.h
>   create mode 100644 linux-user/alpha/target_prctl.h
>   create mode 100644 linux-user/arm/target_prctl.h
>   create mode 100644 linux-user/cris/target_prctl.h
>   create mode 100644 linux-user/generic/target_prctl_unalign.h
>   create mode 100644 linux-user/hexagon/target_prctl.h
>   create mode 100644 linux-user/hppa/target_prctl.h
>   create mode 100644 linux-user/i386/target_prctl.h
>   create mode 100644 linux-user/m68k/target_prctl.h
>   create mode 100644 linux-user/microblaze/target_prctl.h
>   create mode 100644 linux-user/mips/target_prctl.h
>   create mode 100644 linux-user/mips64/target_prctl.h
>   create mode 100644 linux-user/nios2/target_prctl.h
>   create mode 100644 linux-user/openrisc/target_prctl.h
>   create mode 100644 linux-user/ppc/target_prctl.h
>   create mode 100644 linux-user/riscv/target_prctl.h
>   create mode 100644 linux-user/s390x/target_prctl.h
>   create mode 100644 linux-user/sh4/target_prctl.h
>   create mode 100644 linux-user/sparc/target_prctl.h
>   create mode 100644 linux-user/x86_64/target_prctl.h
>   create mode 100644 linux-user/xtensa/target_prctl.h

Applied, thanks.

r~

