Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2319C42C79F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 19:29:53 +0200 (CEST)
Received: from localhost ([::1]:58616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mai4d-00073h-PZ
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 13:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mai3K-0005oy-Sb
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 13:28:30 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:47013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mai3H-00005T-F2
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 13:28:30 -0400
Received: by mail-pf1-x42a.google.com with SMTP id i76so948036pfe.13
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 10:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/UiudyChGqbqWor+THyT3p5Untbcg2qE9zZsYDc1lJE=;
 b=H5QrcdG7eeAw1esQkqdH0lYhtQqHax1fxUdECBMcuwWqEozYCQMrYTLLH0BG+P0y5e
 bfBri6UpF/rZ904yeHqxmfI74ZjxVOoP3fNFwmCpoKldNl9hiKIhAGx4qCiwiZGzL9X0
 WT0t8VPrXZq3qD2rkkHlhCm9Xk0NVULR+v2T1Z2wUXl3B5xWMO3ErdOk7uF8YT/4NCSl
 YnuBQZdHe8y0E/zKYvV/B4OChPuJJT2D2RpTAgb/bBWgyszu+Sd9cUN8Pd1vECAwdfFt
 nMdrgpd2UK3oZB9MWj7yBKd0W+/xe9RGZWO6Ny78Ss6TbnzGpzRBSYoA9w3BeItwbXgM
 u1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/UiudyChGqbqWor+THyT3p5Untbcg2qE9zZsYDc1lJE=;
 b=jZ1b1DknjKfr1gW/tCL7CEojzPHZPXv3jNg0WVB2ECm8iCM4vybzizIHJW62ndWV+u
 znZ1HlE5Deed68nX2AlBueVuzo5X8JZOKWyiWsspTGj7G6l9nxaCr+f2unZPgOVz/p3c
 ktjYltie0SkvjMgqYWLBytILpIPr4kCGUL243HgBrntvwvUS0PvEPeKU2lr3Zm/BCACG
 sTiGFo/L1mMTBap+8uMJI/tmzwh3MrlfRLcnUOcRskucX0D1hD8lPEaxm0iJYXrFq5qG
 RleQ0+ToHui9cd0PF+BANoNUuBe1V9WCtAt1yeEuodHo2bvoQEAZiAElHMMlGfLnewQt
 Zyfg==
X-Gm-Message-State: AOAM5319q8F/l+ffI2jyBP2nwwNOZC3yvhvjqziSCtohGY9aNZla8ckc
 DM394ur8K/fG2+BxijBqaaljLNSb95ZUVw==
X-Google-Smtp-Source: ABdhPJz2oSw4fP2pvxu5DO2gA/hJb76FCIP289EnVM/M3LsXAwFpPiG0SzHN8mHdcbqyvbaV/YWyWA==
X-Received: by 2002:a63:fb09:: with SMTP id o9mr327433pgh.255.1634146105415;
 Wed, 13 Oct 2021 10:28:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q12sm145139pgv.26.2021.10.13.10.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 10:28:24 -0700 (PDT)
Subject: Re: [PULL 00/40] Misc patches for 2021-10-13
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211013090728.309365-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3a3e5b82-7426-cdeb-73aa-85dadbcd2529@linaro.org>
Date: Wed, 13 Oct 2021 10:28:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/13/21 2:06 AM, Paolo Bonzini wrote:
> The following changes since commit ee26ce674a93c824713542cec3b6a9ca85459165:
> 
>    Merge remote-tracking branch 'remotes/jsnow/tags/python-pull-request' into staging (2021-10-12 16:08:33 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to eeecc2ede44b2a5f2551dfcebd561a3945d4c132:
> 
>    ebpf: really include it only in system emulators (2021-10-13 10:47:50 +0200)
> 
> ----------------------------------------------------------------
> * SEV and SGX cleanups (Philippe, Dov)
> * bugfixes for "check-block"
> * bugfix for static build
> * ObjectOptions cleanups (Thomas)
> * binutils fix for PVH (Cole)
> * HVF cleanup (Alex)
> 
> ----------------------------------------------------------------
> Alexander Graf (1):
>        hvf: Determine slot count from struct layout
> 
> Cole Robinson (1):
>        tests: tcg: Fix PVH test with binutils 2.36+
> 
> Dov Murik (2):
>        target/i386/sev: Use local variable for kvm_sev_launch_start
>        target/i386/sev: Use local variable for kvm_sev_launch_measure
> 
> Dr. David Alan Gilbert (1):
>        target/i386/sev: sev_get_attestation_report use g_autofree
> 
> Kacper Słomiński (1):
>        util/compatfd.c: use libc signalfd wrapper instead of raw syscall
> 
> Markus Armbruster (1):
>        monitor: Tidy up find_device_state()
> 
> Paolo Bonzini (5):
>        tests: add missing dependency for check-block
>        build: fix "make check" without earlier "make"
>        qemu-iotests: flush after every test
>        Revert "hw/misc: applesmc: use host osk as default on macs"
>        ebpf: really include it only in system emulators
> 
> Philippe Mathieu-Daudé (27):
>        MAINTAINERS: Add myself as reviewer of the 'Memory API'
>        qapi/misc-target: Wrap long 'SEV Attestation Report' long lines
>        qapi/misc-target: Group SEV QAPI definitions
>        target/i386/kvm: Introduce i386_softmmu_kvm Meson source set
>        target/i386/kvm: Restrict SEV stubs to x86 architecture
>        target/i386/sev: Prefix QMP errors with 'SEV'
>        target/i386/monitor: Return QMP error when SEV is not enabled for guest
>        target/i386/cpu: Add missing 'qapi/error.h' header
>        target/i386/sev_i386.h: Remove unused headers
>        target/i386/sev: Remove sev_get_me_mask()
>        target/i386/sev: Mark unreachable code with g_assert_not_reached()
>        target/i386/sev: Use g_autofree in sev_launch_get_measure()
>        target/i386/sev: Restrict SEV to system emulation
>        target/i386/sev: Rename sev_i386.h -> sev.h
>        target/i386/sev: Declare system-specific functions in 'sev.h'
>        target/i386/sev: Remove stubs by using code elision
>        target/i386/sev: Move qmp_query_sev_attestation_report() to sev.c
>        target/i386/sev: Move qmp_sev_inject_launch_secret() to sev.c
>        target/i386/sev: Move qmp_query_sev_capabilities() to sev.c
>        target/i386/sev: Move qmp_query_sev_launch_measure() to sev.c
>        target/i386/sev: Move qmp_query_sev() & hmp_info_sev() to sev.c
>        monitor: Reduce hmp_info_sev() declaration
>        MAINTAINERS: Cover SEV-related files with X86/KVM section
>        MAINTAINERS: Cover SGX documentation file with X86/KVM section
>        hw/i386/sgx: Have sgx_epc_get_section() return a boolean
>        hw/i386/sgx: Move qmp_query_sgx_capabilities() to hw/i386/sgx.c
>        hw/i386/sgx: Move qmp_query_sgx() and hmp_info_sgx() to hw/i386/sgx.c
> 
> Thomas Huth (1):
>        qapi: Make some ObjectTypes depend on the build settings
> 
>   MAINTAINERS                           |   4 +
>   accel/hvf/hvf-accel-ops.c             |   2 +-
>   accel/kvm/meson.build                 |   1 -
>   hw/i386/pc_sysfw.c                    |   2 +-
>   hw/i386/sgx-stub.c                    |  16 ++-
>   hw/i386/sgx.c                         |  35 +++++-
>   hw/i386/x86.c                         |   2 +-
>   hw/misc/applesmc.c                    | 192 +-------------------------------
>   include/hw/i386/sgx-epc.h             |   2 +-
>   include/hw/i386/sgx.h                 |  12 --
>   include/monitor/hmp-target.h          |   1 +
>   include/monitor/hmp.h                 |   1 -
>   include/sysemu/sev.h                  |  28 -----
>   meson.build                           |   9 +-
>   qapi/misc-target.json                 |  77 ++++++-------
>   qapi/qom.json                         |  36 ++++--
>   softmmu/qdev-monitor.c                |  13 +--
>   target/i386/cpu.c                     |  16 +--
>   target/i386/kvm/kvm.c                 |   3 +-
>   target/i386/kvm/meson.build           |   8 +-
>   {accel => target/i386}/kvm/sev-stub.c |   2 +-
>   target/i386/meson.build               |   4 +-
>   target/i386/monitor.c                 | 124 +--------------------
>   target/i386/sev-stub.c                |  88 ---------------
>   target/i386/sev-sysemu-stub.c         |  70 ++++++++++++
>   target/i386/sev.c                     | 201 +++++++++++++++++++++++-----------
>   target/i386/{sev_i386.h => sev.h}     |  35 +++---
>   tests/Makefile.include                |  16 ++-
>   tests/qemu-iotests/testrunner.py      |   1 +
>   tests/tcg/x86_64/system/kernel.ld     |   5 +-
>   util/compatfd.c                       |   5 +-
>   31 files changed, 392 insertions(+), 619 deletions(-)
>   delete mode 100644 include/hw/i386/sgx.h
>   delete mode 100644 include/sysemu/sev.h
>   rename {accel => target/i386}/kvm/sev-stub.c (94%)
>   delete mode 100644 target/i386/sev-stub.c
>   create mode 100644 target/i386/sev-sysemu-stub.c
>   rename target/i386/{sev_i386.h => sev.h} (62%)

Applied, thanks.

r~


