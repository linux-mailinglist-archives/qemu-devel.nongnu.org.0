Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCE1484745
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 18:57:19 +0100 (CET)
Received: from localhost ([::1]:60516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4o3j-0003ZC-0H
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 12:57:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4o2E-0002fE-Jt
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:55:46 -0500
Received: from [2607:f8b0:4864:20::1031] (port=39685
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4o2C-000237-M1
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:55:46 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 z9-20020a17090a7b8900b001b13558eadaso212449pjc.4
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 09:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h7cjAoGr5vCxQ6S4fJNfzK98ozPexbzoVjz0QV4SOqU=;
 b=sRG9QrA/FF2Ac/y5K747+9hBdM0INPpqHwc/RQTzg+LhN5jQ7rAVgyOHOUNj6oUMJJ
 AOkx0pPScy77wmveybGBcF3FqHt3+x0nMLSYgsPIjRNoHujpcmLLKLfZ/znsuH9b511V
 6Exp/AG0qPTlbvel6ijPTbnDPQbmWeOETZQuD2uzPFoMj9LyY7c0FUNCtOMplg1oEx20
 i9pfAzbSGfSPLnhqomx3D/DMAqU3M3Gpr3L5ckGPNtSnBxzWRmy6HRcUgbDCWXGiU8s4
 13aA6CAUFoLF1RQFVmGgYwh+IF6ZXRsq5mW5w3Aqi/acKpLmwTyCPXoT+ZoRSEiKLO7Z
 c0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h7cjAoGr5vCxQ6S4fJNfzK98ozPexbzoVjz0QV4SOqU=;
 b=rWL5uXzlC0PBmLFTJ7ksDO80/inHWzKgOj4DV0LozLkGQ7RxaNhEHJO9sw6G/27L/H
 EpVpq6pZCepteOCNOUL8VTAE6MeJaMxjPR2Igoj8d5/qzuusHYmtF64XR/GWZSEWqD3D
 ba9slJZYXI8gJzlCD0rdvrODL+mWCQjWJ+9xS6DuM8LGTRT1oyucG6UHJOedkOG2ZmC4
 KmZKWmcMvFs3Le1nhu9RelnlAfkBLGcr/2ni5FoRni7uxvA1lUmf5wiJwXoQwIT9RJ+i
 DRm3G5G8yT6aXAkaV38amh3N3N/GHRAoK42wHrQ0jCOEMkKDuxiVJnpJCJHQxc0pjVHF
 vhsg==
X-Gm-Message-State: AOAM531lt4nvplH0aLxec35QWw+Yf5gTWPX4c5NWuftdwJNaAiyGdPqB
 vkKmA+kcn5Ba/O3RrpY1Lhd97g==
X-Google-Smtp-Source: ABdhPJyKR7aVzIVK1lT1Er4k1v+W5uTuoN65/LtelloaPNvEDsHuDnIxkZsL7WEmT9hiLCDPbnfY/w==
X-Received: by 2002:a17:90b:4a45:: with SMTP id
 lb5mr61840277pjb.188.1641318942918; 
 Tue, 04 Jan 2022 09:55:42 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id h3sm22480pjk.48.2022.01.04.09.55.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:55:42 -0800 (PST)
Subject: Re: [PULL 00/26] ppc queue
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220104073121.3784280-1-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8f21a24-42f6-ba0e-6b6f-47e30b13cc0a@linaro.org>
Date: Tue, 4 Jan 2022 09:55:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220104073121.3784280-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/3/22 11:30 PM, Cédric Le Goater wrote:
> The following changes since commit b5a3d8bc9146ba22a25116cb748c97341bf99737:
> 
>    Merge tag 'pull-misc-20220103' of https://gitlab.com/rth7680/qemu into staging (2022-01-03 09:34:41 -0800)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-ppc-20220104
> 
> for you to fetch changes up to 0625c7760d5451d7436ef0738f763c6bb5141919:
> 
>    target/ppc: do not call hreg_compute_hflags() in helper_store_mmcr0() (2022-01-04 07:55:35 +0100)
> 
> ----------------------------------------------------------------
> ppc 7.0 queue:
> 
> * Cleanup of PowerNV PHBs (Daniel and Cedric)
> * Cleanup and fixes for PPC405 machine (Cedric)
> * Fix for xscvspdpn (Matheus)
> * Rework of powerpc exception handling 1/n (Fabiano)
> * Optimisation for PMU (Richard and Daniel)
> 
> ----------------------------------------------------------------
> Cédric Le Goater (14):
>        ppc/pnv: Change the maximum of PHB3 devices for Power8NVL
>        ppc/pnv: Remove PHB4 reset handler
>        ppc/pnv: Remove the PHB4 "device-id" property
>        target/ppc: Improve logging in Radix MMU
>        target/ppc: Check effective address validity
>        target/ppc: Remove static inline
>        target/ppc: Print out literal exception names in logs
>        ppc/ppc4xx: Convert printfs()
>        ppc/ppc405: Activate MMU logs
>        ppc/ppc405: Restore TCR and STR write handlers
>        ppc/ppc405: Rework ppc_40x_timers_init() to use a PowerPCCPU
>        ppc/ppc405: Fix timer initialization
>        ppc/ppc405: Introduce a store helper for SPR_40x_PID
>        ppc/ppc405: Dump specific registers
> 
> Daniel Henrique Barboza (3):
>        pnv_phb3.c: do not set 'root-bus' as bus name
>        pnv_phb4.c: do not set 'root-bus' as bus name
>        target/ppc: do not call hreg_compute_hflags() in helper_store_mmcr0()
> 
> Fabiano Rosas (5):
>        target/ppc: powerpc_excp: Set alternate SRRs directly
>        target/ppc: powerpc_excp: Add excp_vectors bounds check
>        target/ppc: powerpc_excp: Set vector earlier
>        target/ppc: powerpc_excp: Move system call vectored code together
>        target/ppc: powerpc_excp: Stop passing excp_model around
> 
> Matheus Ferst (1):
>        target/ppc: do not silence snan in xscvspdpn
> 
> Richard Henderson (3):
>        target/ppc: Cache per-pmc insn and cycle count settings
>        target/ppc: Rewrite pmu_increment_insns
>        target/ppc: Use env->pnc_cyc_cnt
> 
>   include/hw/pci-host/pnv_phb4.h          |   2 -
>   target/ppc/cpu.h                        |   5 +
>   target/ppc/helper.h                     |   2 +
>   target/ppc/mmu-radix64.h                |   1 +
>   target/ppc/power8-pmu.h                 |  14 +-
>   target/ppc/spr_tcg.h                    |   3 +
>   hw/pci-host/pnv_phb3.c                  |   3 +-
>   hw/pci-host/pnv_phb4.c                  |  16 +--
>   hw/pci-host/pnv_phb4_pec.c              |   3 -
>   hw/ppc/mpc8544_guts.c                   |   9 +-
>   hw/ppc/pnv.c                            |   2 +-
>   hw/ppc/ppc.c                            |  67 ++++++---
>   hw/ppc/ppc405_uc.c                      |   2 -
>   hw/ppc/ppc4xx_devs.c                    |  39 ++----
>   hw/ppc/ppc4xx_pci.c                     |  11 +-
>   target/ppc/cpu_init.c                   |  34 +++--
>   target/ppc/excp_helper.c                | 187 ++++++++++++++++---------
>   target/ppc/fpu_helper.c                 |   5 +-
>   target/ppc/helper_regs.c                |   2 +-
>   target/ppc/machine.c                    |   2 +
>   target/ppc/mmu-radix64.c                |  60 +++++++-
>   target/ppc/mmu_common.c                 | 164 +++++++++++-----------
>   target/ppc/mmu_helper.c                 |  97 ++++++-------
>   target/ppc/power8-pmu.c                 | 238 ++++++++++++++------------------
>   target/ppc/timebase_helper.c            |  10 ++
>   target/ppc/translate.c                  |  20 +++
>   tests/tcg/ppc64le/non_signalling_xscv.c |  37 +++++
>   hw/ppc/trace-events                     |   7 +
>   tests/tcg/ppc64/Makefile.target         |   4 +-
>   tests/tcg/ppc64le/Makefile.target       |   4 +-
>   30 files changed, 604 insertions(+), 446 deletions(-)
>   create mode 100644 tests/tcg/ppc64le/non_signalling_xscv.c

Applied, thanks.

r~


