Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A835697F3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 04:26:47 +0200 (CEST)
Received: from localhost ([::1]:59356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9HE6-0005dw-IR
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 22:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9HCB-0004iR-2N
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 22:24:48 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:41873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9HC7-0006ZG-MQ
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 22:24:46 -0400
Received: by mail-pg1-x531.google.com with SMTP id 23so15907769pgc.8
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 19:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=l2swe0jsyvTiBP9fWd5PZ2E3Dx1pKSpX2l3TpFS0U14=;
 b=OE76u1isofWaYaTzlEmGI+wEueYUHSW4QK7BDR/uWavMvClr0szCPs/fBQDmu7JmGv
 azIm2Gm4h/71fo+VSMp+JobA+nQxNk3pGUthOEQrc/aKyqBNO/IaMOzorPWGuaOR75Uc
 KjxiF0bfrkGm6JmyKi/ob5tEOAP2JRHUgDExYplN5uDK6JbZeqi4USiA5IPqJk3+7MKK
 eqUvKPqcTSAlc3vODARrFQoN6l7mRf36cjFSuV4RWL0p3tBt4yAxCG0TNYzkv6d+UXHM
 T67w5jgs+GEZUFkSr/EuhL4ZbDrbTmMLtszawuGy3CHqiLGxPb2EnOQqV5m6AZsS8iJd
 tk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l2swe0jsyvTiBP9fWd5PZ2E3Dx1pKSpX2l3TpFS0U14=;
 b=nj1gnpl2vVZh4TziHpJnmmf1cYwMKaflVHf0uZO+03q3V9ArHl+GamUF/rrXqx/NB3
 m3OYi0B9cvJHHRlTULALIRWK67fLS09PBsWn6iVJ74GqsIJnMykfHBSPWbv7aU3XfO6k
 HZshiHOPTctpp47p3SzSHVNHMG3lRLNJDaVFbmwzWA7RLVWWwovzpsvLUF7pf6ZMwNHp
 8fEF6RGTLwmPpkkWgMq3ThFaGwDP5A0oy7kMy1jKFyY7OqXTDCHiedCj/zfgKoUWpHE/
 8Uz7uXGDUicMZdNPjeXtMh6hjXtoHblIL4e9Ijzy29mm1+AsKrEA+CqfNqklS9MxurQD
 Y+vA==
X-Gm-Message-State: AJIora81KyYLLVLJ518VDG/lzbht7tBcFY1RgWBCyVueJ7g1meTaF2Et
 DZ2rB97Lmm119iUl/DXIKfyclg==
X-Google-Smtp-Source: AGRyM1t+jdrqctz/J4MahPnBgB1wiwN23f1fSfbPllG2WNIOPCr4iyby2raNEhbvq0s9gUR+gMeHCg==
X-Received: by 2002:a63:eb0a:0:b0:411:4cbf:c80b with SMTP id
 t10-20020a63eb0a000000b004114cbfc80bmr37409918pgh.430.1657160681980; 
 Wed, 06 Jul 2022 19:24:41 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 cp2-20020a170902e78200b0015e8d4eb1d7sm26401227plb.33.2022.07.06.19.24.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 19:24:41 -0700 (PDT)
Message-ID: <fe6baa39-41e0-125c-6b8c-377596af9e7c@linaro.org>
Date: Thu, 7 Jul 2022 07:54:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/34] ppc queue
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, peter.maydell@linaro.org
References: <20220706200946.471114-1-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 7/7/22 01:39, Daniel Henrique Barboza wrote:
> The following changes since commit 180c2f24d5e8eada41e012a3899d29bb695aae06:
> 
>    Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into staging (2022-07-06 10:41:34 +0530)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20220706
> 
> for you to fetch changes up to 0b83377f46042529adbbf3a77f7ffb6f1e8a0aaa:
> 
>    target/ppc: Fix MPC8555 and MPC8560 core type to e500v1 (2022-07-06 10:30:01 -0300)
> 
> ----------------------------------------------------------------
> ppc patch queue for 2022-07-06:
> 
> This queue consists of improvements and bug fixes in TCG, powernv and
> pSeries, with some fixes in other areas as well.
> 
> - tcg and target/ppc: BCDA and mffscdrn implementations, Remove CONFIG_INT128
> conditional code
> - fix '-cpu max' alias
> - remove '-cpu default' alias
> - spapr: fixes in DDW handling, H_WATCHDOG support
> - powernv: cleanups in the pnv-phb3/4 models
> - fix core type of MPC8555 and MPC8560 models

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Alexey Kardashevskiy (4):
>        spapr/ddw: Reset DMA when the last non-default window is removed
>        spapr/ddw: Implement 64bit query extension
>        ppc: Define SETFIELD for the ppc target
>        ppc/spapr: Implement H_WATCHDOG
> 
> Daniel Henrique Barboza (8):
>        ppc/pnv: move root port attach to pnv_phb4_realize()
>        ppc/pnv: attach phb3/phb4 root ports in QOM tree
>        ppc/pnv: assign pnv-phb-root-port chassis/slot earlier
>        ppc/pnv: make pnv_ics_get() use the chip8->phbs[] array
>        ppc/pnv: make pnv_ics_resend() use chip8->phbs[]
>        ppc/pnv: make pnv_chip_power8_pic_print_info() use chip8->phbs[]
>        ppc/pnv: remove 'INTERFACE_PCIE_DEVICE' from phb3 root bus
>        ppc/pnv: remove 'INTERFACE_PCIE_DEVICE' from phb4 root bus
> 
> Matheus Ferst (11):
>        target/ppc: use int128.h methods in vpmsumd
>        target/ppc: use int128.h methods in vadduqm
>        target/ppc: use int128.h methods in vaddecuq and vaddeuqm
>        target/ppc: use int128.h methods in vaddcuq
>        target/ppc: use int128.h methods in vsubuqm
>        target/ppc: use int128.h methods in vsubecuq and vsubeuqm
>        target/ppc: use int128.h methods in vsubcuq
>        target/ppc: Add flag for ISA v2.06 BCDA instructions
>        target/ppc: implement addg6s
>        target/ppc: implement cbcdtd
>        target/ppc: implement cdtbcd
> 
> Murilo Opsfelder Araujo (1):
>        target/ppc: Return default CPU for max CPU
> 
> Pali Rohár (1):
>        target/ppc: Fix MPC8555 and MPC8560 core type to e500v1
> 
> Thomas Huth (1):
>        target/ppc/cpu-models: Remove the "default" CPU alias
> 
> Víctor Colombo (8):
>        target/ppc: Change FPSCR_* to follow POWER ISA numbering convention
>        target/ppc: Fix insn32.decode style issues
>        target/ppc: Move mffscrn[i] to decodetree
>        target/ppc: Move mffsce to decodetree
>        target/ppc: Move mffsl to decodetree
>        target/ppc: Move mffs[.] to decodetree
>        target/ppc: Implement mffscdrn[i] instructions
>        tests/tcg/ppc64: Add mffsce test
> 
>   hw/intc/pnv_xive.c                         |  20 ---
>   hw/intc/pnv_xive2.c                        |  20 ---
>   hw/pci-host/pnv_phb3.c                     |  22 +--
>   hw/pci-host/pnv_phb4.c                     |  40 +----
>   hw/pci-host/pnv_phb4_pec.c                 |   3 -
>   hw/ppc/pnv.c                               | 102 +++++------
>   hw/ppc/spapr.c                             |   4 +
>   hw/ppc/spapr_iommu.c                       |   3 +-
>   hw/ppc/spapr_pci.c                         |   6 +-
>   hw/ppc/spapr_rtas_ddw.c                    |  34 +++-
>   hw/watchdog/meson.build                    |   1 +
>   hw/watchdog/spapr_watchdog.c               | 274 +++++++++++++++++++++++++++++
>   hw/watchdog/trace-events                   |   7 +
>   include/hw/pci-host/pnv_phb3_regs.h        |  16 --
>   include/hw/ppc/pnv.h                       |   3 +-
>   include/hw/ppc/spapr.h                     |  26 ++-
>   target/ppc/cpu-models.c                    |  17 +-
>   target/ppc/cpu-models.h                    |  14 +-
>   target/ppc/cpu.h                           |  89 ++++++----
>   target/ppc/cpu_init.c                      |  29 ++-
>   target/ppc/dfp_helper.c                    |  65 +++++++
>   target/ppc/helper.h                        |  20 ++-
>   target/ppc/insn32.decode                   |  71 ++++++--
>   target/ppc/int_helper.c                    | 229 ++++--------------------
>   target/ppc/internal.h                      |   3 -
>   target/ppc/translate/fixedpoint-impl.c.inc |  51 ++++++
>   target/ppc/translate/fp-impl.c.inc         | 203 +++++++++++----------
>   target/ppc/translate/fp-ops.c.inc          |   9 -
>   target/ppc/translate/vmx-impl.c.inc        |  32 ++--
>   target/ppc/translate/vmx-ops.c.inc         |   9 +-
>   tests/tcg/ppc64/Makefile.target            |   1 +
>   tests/tcg/ppc64le/Makefile.target          |   1 +
>   tests/tcg/ppc64le/mffsce.c                 |  37 ++++
>   33 files changed, 885 insertions(+), 576 deletions(-)
>   create mode 100644 hw/watchdog/spapr_watchdog.c
>   create mode 100644 tests/tcg/ppc64le/mffsce.c


