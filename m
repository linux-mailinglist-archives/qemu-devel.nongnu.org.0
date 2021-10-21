Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3847436887
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 18:59:21 +0200 (CEST)
Received: from localhost ([::1]:34684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdbPU-0007LO-Ea
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 12:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdbJj-0001aF-TL
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 12:53:23 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:45755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdbJU-0003cF-Tk
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 12:53:23 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so979526pjb.4
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 09:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wLVwSj8nA7NHE/KwNBOeJqLSX3gQrNhRA11zE5YOdGg=;
 b=DcXSaKSn/9gefbuPaWa1v5wqA3GAso+GpY5Cwu8M3bXC+NRBhPU0ygMrcNsqrFfJAP
 wPqUJrJlex33VbWyiBmicMY2H4aa5/cZWoqxZ2/BiCzAvvbO6UDykn1joe5tMUuWc/Gt
 TIqblwvu4bnkZL5gGq+YZUhk/BeBYawWSzJxydCmqqsInTtyjRPEI3A9O1gfMyCo5JpI
 JnY6C1oQfLrPweAseC5NXXPF3+altRQPBlN7WsmW+3dqblxMAgxX7J3T5VqiZShOqLn1
 pt+rnqE6Bauk6hzkEfn1rUgrWKzJ7oEwRMvLrJEcbGfCzIIIrSXNDln9IzBDra2iiksX
 KZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wLVwSj8nA7NHE/KwNBOeJqLSX3gQrNhRA11zE5YOdGg=;
 b=rfOrLG67ZszzKymjtzsSrd2YVYm2jfDt62iMC5n2m+ICY/j8xRHlu99/I3Q210O4vX
 kGQyLZrAm/dP2bsFqG0PerRysz77PGGV5rlRS2CpX4so5jWodJiHe2LdqGE28F3blrUs
 qTL00arqzoaoFCgSS46t5lrcAGDid4PyKh9CTy9ZWsk6y4aFRU4bBc2KytSnjs0SuM0X
 7xDV2LSqD+sziLWSlGf0M0ABpw9hyQ8H0LacOQb6aRH+rDgpXBtDoVuK+CcMAd5j0yG/
 YEZPKpo16ep5i+LBBaXZxlW3hMUuGB1z8zYxPCTkVfqWmUhvaUDHAY5pJiILkd7rgMTR
 Igyg==
X-Gm-Message-State: AOAM533Qm5ohQVcpggeSvfAdgb3ZAUEZEUvCrMins5nhgmNtNVr2ARq3
 s2m2ayAhIpZE0xnKyL7mHhgeuw==
X-Google-Smtp-Source: ABdhPJy/jqH7wFLtxSCBYZ9JCIlnov4vBL/FOI4gBGU7Q3P++3X8xkQF38JK196d1C+In/LGAIkI0A==
X-Received: by 2002:a17:902:ed8c:b0:13f:136f:efb1 with SMTP id
 e12-20020a170902ed8c00b0013f136fefb1mr6251720plj.56.1634835187132; 
 Thu, 21 Oct 2021 09:53:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id h24sm6945179pfn.180.2021.10.21.09.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 09:53:06 -0700 (PDT)
Subject: Re: [PULL 00/25] ppc-for-6.2 queue 20211021
To: David Gibson <david@gibson.dropbear.id.au>, peter.maydell@linaro.org
References: <20211021042027.345405-1-david@gibson.dropbear.id.au>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <186f0556-f0b5-ee87-892e-448b4531cc8d@linaro.org>
Date: Thu, 21 Oct 2021 09:53:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021042027.345405-1-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/21 9:20 PM, David Gibson wrote:
> The following changes since commit afc9fcde55296b83f659de9da3cdf044812a6eeb:
> 
>    Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-10-20 06:10:51 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.2-20211021
> 
> for you to fetch changes up to 6f9e8515c106650fbba7222c8f66234c8546c025:
> 
>    hw/ppc/ppc4xx_pci: Fix ppc4xx_pci_map_irq() for recent Linux kernels (2021-10-21 11:42:47 +1100)
> 
> ----------------------------------------------------------------
> ppc patch queue 2021-10-21
> 
> Here's the next batch of ppc target related patches for qemu-6.2.
> Highlights are:
>   * Some fixes and minimal tests for old embedded ppc platforms
>   * The beginnings of PMU emulation in TCG from Daniel Barboza
>   * Some improvements to the pegasos2 platform
>   * A number of TCG bugfixes from the folks at the El Dorado Institute
>   * A few other assorted bugfixes and cleanups
> 
> ----------------------------------------------------------------
> BALATON Zoltan (6):
>        ppc/pegasos2: Restrict memory to 2 gigabytes
>        ppc/pegasos2: Warn when using VOF but no kernel is specified
>        ppc/pegasos2: Implement get-time-of-day RTAS function with VOF
>        ppc/pegasos2: Access MV64361 registers via their memory region
>        ppc/pegasos2: Add constants for PCI config addresses
>        ppc/pegasos2: Implement power-off RTAS function with VOF
> 
> Cédric Le Goater (3):
>        spapr/xive: Add source status helpers
>        target/ppc: Fix the test raising the decrementer exception
>        spapr/xive: Use xive_esb_rw() to trigger interrupts
> 
> Daniel Henrique Barboza (3):
>        target/ppc: add MMCR0 PMCC bits to hflags
>        target/ppc: add user read/write functions for MMCR2
>        target/ppc: adding user read/write functions for PMCs
> 
> Gustavo Romero (1):
>        target/ppc: add user read/write functions for MMCR0
> 
> Matheus Ferst (5):
>        linux-user/ppc: Fix XER access in save/restore_user_regs
>        target/ppc: Fix XER access in gdbstub
>        linux-user: Fix XER access in ppc version of elf_core_copy_regs
>        target/ppc: Fix XER access in monitor
>        target/ppc: Filter mtmsr[d] input before setting MSR
> 
> Philippe Mathieu-Daudé (3):
>        target/ppc: Use tcg_constant_i32() in gen_setb()
>        target/ppc: Use tcg_constant_i64() in gen_brh()
>        hw/ppc/spapr_softmmu: Reduce include list
> 
> Thomas Huth (4):
>        hw/ppc: Fix iothread locking in the 405 code
>        tests/acceptance: Add tests for the ppc405 boards
>        tests/acceptance: Add a test for the bamboo ppc board
>        hw/ppc/ppc4xx_pci: Fix ppc4xx_pci_map_irq() for recent Linux kernels
> 
>   MAINTAINERS                                 |   1 +
>   hw/intc/spapr_xive.c                        |   2 +-
>   hw/intc/spapr_xive_kvm.c                    |  14 +-
>   hw/intc/xive.c                              |   8 +-
>   hw/pci-host/mv64361.c                       |   1 +
>   hw/ppc/pegasos2.c                           | 162 ++++++++++-------
>   hw/ppc/ppc.c                                |   6 +-
>   hw/ppc/ppc4xx_pci.c                         |   8 +-
>   hw/ppc/spapr_softmmu.c                      |  15 --
>   include/hw/ppc/xive.h                       |  24 +++
>   linux-user/elfload.c                        |   2 +-
>   linux-user/ppc/signal.c                     |   9 +-
>   target/ppc/cpu.c                            |   2 +-
>   target/ppc/cpu.h                            |  25 ++-
>   target/ppc/cpu_init.c                       |  16 +-
>   target/ppc/gdbstub.c                        |   8 +-
>   target/ppc/helper_regs.c                    |   6 +
>   target/ppc/monitor.c                        |   9 +-
>   target/ppc/power8-pmu-regs.c.inc            | 262 ++++++++++++++++++++++++++++
>   target/ppc/spr_tcg.h                        |   8 +
>   target/ppc/translate.c                      |  95 +++++-----
>   tests/acceptance/ppc_405.py                 |  42 +++++
>   tests/acceptance/ppc_bamboo.py              |  39 +++++
>   tests/tcg/ppc64/Makefile.target             |   2 +
>   tests/tcg/ppc64le/Makefile.target           |   2 +
>   tests/tcg/ppc64le/signal_save_restore_xer.c |  42 +++++
>   26 files changed, 651 insertions(+), 159 deletions(-)
>   create mode 100644 target/ppc/power8-pmu-regs.c.inc
>   create mode 100644 tests/acceptance/ppc_405.py
>   create mode 100644 tests/acceptance/ppc_bamboo.py
>   create mode 100644 tests/tcg/ppc64le/signal_save_restore_xer.c

Applied, thanks.

r~


