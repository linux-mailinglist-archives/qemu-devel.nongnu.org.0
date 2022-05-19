Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B008552DE8E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 22:42:44 +0200 (CEST)
Received: from localhost ([::1]:35442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrmyp-0007dV-Rb
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 16:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrmlh-00007L-D9
 for qemu-devel@nongnu.org; Thu, 19 May 2022 16:29:13 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:46793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrmlf-00086J-B2
 for qemu-devel@nongnu.org; Thu, 19 May 2022 16:29:09 -0400
Received: by mail-pl1-x62e.google.com with SMTP id i8so5720013plr.13
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 13:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=vpVDiHRJOOhtdDYB3oUwfGUElaU0wpyxFNEnwKBU5j0=;
 b=hVpTpMvq8ZG0EXis3p9Oauopd56jT/2tpfgSE1a/SBi856RsXrLYC5nERfgypdwYxM
 chKtRgTTd4nNdOWfhTxAYvmz0LiphkWLKeyebitKj+Bb1VGJMi419/NaJCTMOGOqw2ZO
 gcc58cyX87ImR2/a05DGorvI0UeXqYxbik/Yp4gL0+OiOqoS8iUZCPC78A47/0YB7PKJ
 h9ttSj2mI/cjshxf/hX649C+rrJRokYJXZEJCcNR6R5A8Jc05PDJLgMp9zXqJBAJ247Z
 /ZHu6pw6hFxmnBTckhdmwEZNshu0olQpA9krpAY9ouZLB2/yzvS7pHAj7hHx+ZAnoz4g
 mwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vpVDiHRJOOhtdDYB3oUwfGUElaU0wpyxFNEnwKBU5j0=;
 b=FUT/otCDFEYNTNqE07FxHCsSIJ0vp3O1am1iog4uVagI2SoPUuuC8SSGUh8Oo4KTjL
 5AqtGtum9WzDhZrU3k6ZR/2rtJ0Gv62ELLPiApMki/DEumB6N0/9cEzl0mJR2Y8gQ8T2
 +R8bGdBXcHyquRTnQI6KDoejBoEP4DPUWtJIH3VzZSMrfagA1ZCtUXzxB1w3zNf8UfFU
 KEQGwtqnf+GZQVfqePrY0mx+XrZx5SEeV8sswTRUe3rQfUK/pfOamCrv8hrbSy1plqVV
 FXkcjgEBUthc1VZyv3sB7WAK8gOPHZ1+r1yrLnienzsAp7HMyLBDAxVztfjVuxYWedir
 WMQA==
X-Gm-Message-State: AOAM532gOIgre36QTZ3yJhfDrTbnPWPPFlKNo7rNFOhKHQK2Z2DZIxSq
 A4zdyCCcTVYvFpAcTgTjYYhXCg==
X-Google-Smtp-Source: ABdhPJy+56ybV81yB+1Ta546G19W0rLiR0eiUpVtLIvpaIc70h2HkzWiflXbmzRwGCHI5xT+1Rl05A==
X-Received: by 2002:a17:902:ed82:b0:158:fef8:b501 with SMTP id
 e2-20020a170902ed8200b00158fef8b501mr6151566plj.47.1652992145768; 
 Thu, 19 May 2022 13:29:05 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a170902d48500b0015e8d4eb20esm4251565plg.88.2022.05.19.13.29.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 13:29:05 -0700 (PDT)
Message-ID: <062166ea-7d1e-a871-57f2-8f52dbf2a577@linaro.org>
Date: Thu, 19 May 2022 13:29:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/22] target-arm queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220519173651.399295-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220519173651.399295-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

On 5/19/22 10:36, Peter Maydell wrote:
> target-arm queue: mostly patches from me this time round.
> Nothing too exciting.
> 
> -- PMM
> 
> The following changes since commit 78ac2eebbab9150edf5d0d00e3648f5ebb599001:
> 
>    Merge tag 'artist-cursor-fix-final-pull-request' of https://github.com/hdeller/qemu-hppa into staging (2022-05-18 09:32:15 -0700)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220519
> 
> for you to fetch changes up to fab8ad39fb75a0d9f097db67b2a334444754e88e:
> 
>    target/arm: Use FIELD definitions for CPACR, CPTR_ELx (2022-05-19 18:34:10 +0100)
> 
> ----------------------------------------------------------------
> target-arm queue:
>   * Implement FEAT_S2FWB
>   * Implement FEAT_IDST
>   * Drop unsupported_encoding() macro
>   * hw/intc/arm_gicv3: Use correct number of priority bits for the CPU
>   * Fix aarch64 debug register names
>   * hw/adc/zynq-xadc: Use qemu_irq typedef
>   * target/arm/helper.c: Delete stray obsolete comment
>   * Make number of counters in PMCR follow the CPU
>   * hw/arm/virt: Fix dtb nits
>   * ptimer: Rename PTIMER_POLICY_DEFAULT to PTIMER_POLICY_LEGACY
>   * target/arm: Fix PAuth keys access checks for disabled SEL2
>   * Enable FEAT_HCX for -cpu max
>   * Use FIELD definitions for CPACR, CPTR_ELx

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Chris Howard (1):
>        Fix aarch64 debug register names.
> 
> Florian Lugou (1):
>        target/arm: Fix PAuth keys access checks for disabled SEL2
> 
> Peter Maydell (17):
>        target/arm: Postpone interpretation of stage 2 descriptor attribute bits
>        target/arm: Factor out FWB=0 specific part of combine_cacheattrs()
>        target/arm: Implement FEAT_S2FWB
>        target/arm: Enable FEAT_S2FWB for -cpu max
>        target/arm: Implement FEAT_IDST
>        target/arm: Drop unsupported_encoding() macro
>        hw/intc/arm_gicv3_cpuif: Handle CPUs that don't specify GICv3 parameters
>        hw/intc/arm_gicv3: report correct PRIbits field in ICV_CTLR_EL1
>        hw/intc/arm_gicv3_kvm.c: Stop using GIC_MIN_BPR constant
>        hw/intc/arm_gicv3: Support configurable number of physical priority bits
>        hw/intc/arm_gicv3: Use correct number of priority bits for the CPU
>        hw/intc/arm_gicv3: Provide ich_num_aprs()
>        target/arm/helper.c: Delete stray obsolete comment
>        target/arm: Make number of counters in PMCR follow the CPU
>        hw/arm/virt: Fix incorrect non-secure flash dtb node name
>        hw/arm/virt: Drop #size-cells and #address-cells from gpio-keys dtb node
>        ptimer: Rename PTIMER_POLICY_DEFAULT to PTIMER_POLICY_LEGACY
> 
> Philippe Mathieu-Daudé (1):
>        hw/adc/zynq-xadc: Use qemu_irq typedef
> 
> Richard Henderson (2):
>        target/arm: Enable FEAT_HCX for -cpu max
>        target/arm: Use FIELD definitions for CPACR, CPTR_ELx
> 
>   docs/system/arm/emulation.rst      |   2 +
>   include/hw/adc/zynq-xadc.h         |   3 +-
>   include/hw/intc/arm_gicv3_common.h |   8 +-
>   include/hw/ptimer.h                |  16 +-
>   target/arm/cpregs.h                |  24 +++
>   target/arm/cpu.h                   |  76 +++++++-
>   target/arm/internals.h             |  11 +-
>   target/arm/translate-a64.h         |   9 -
>   hw/adc/zynq-xadc.c                 |   4 +-
>   hw/arm/boot.c                      |   2 +-
>   hw/arm/musicpal.c                  |   2 +-
>   hw/arm/virt.c                      |   4 +-
>   hw/core/machine.c                  |   4 +-
>   hw/dma/xilinx_axidma.c             |   2 +-
>   hw/dma/xlnx_csu_dma.c              |   2 +-
>   hw/intc/arm_gicv3_common.c         |   5 +
>   hw/intc/arm_gicv3_cpuif.c          | 225 +++++++++++++++++-------
>   hw/intc/arm_gicv3_kvm.c            |  16 +-
>   hw/m68k/mcf5206.c                  |   2 +-
>   hw/m68k/mcf5208.c                  |   2 +-
>   hw/net/can/xlnx-zynqmp-can.c       |   2 +-
>   hw/net/fsl_etsec/etsec.c           |   2 +-
>   hw/net/lan9118.c                   |   2 +-
>   hw/rtc/exynos4210_rtc.c            |   4 +-
>   hw/timer/allwinner-a10-pit.c       |   2 +-
>   hw/timer/altera_timer.c            |   2 +-
>   hw/timer/arm_timer.c               |   2 +-
>   hw/timer/digic-timer.c             |   2 +-
>   hw/timer/etraxfs_timer.c           |   6 +-
>   hw/timer/exynos4210_mct.c          |   6 +-
>   hw/timer/exynos4210_pwm.c          |   2 +-
>   hw/timer/grlib_gptimer.c           |   2 +-
>   hw/timer/imx_epit.c                |   4 +-
>   hw/timer/imx_gpt.c                 |   2 +-
>   hw/timer/mss-timer.c               |   2 +-
>   hw/timer/sh_timer.c                |   2 +-
>   hw/timer/slavio_timer.c            |   2 +-
>   hw/timer/xilinx_timer.c            |   2 +-
>   target/arm/cpu.c                   |  11 +-
>   target/arm/cpu64.c                 |  30 ++++
>   target/arm/cpu_tcg.c               |   6 +
>   target/arm/helper.c                | 348 ++++++++++++++++++++++++++++---------
>   target/arm/kvm64.c                 |  12 ++
>   target/arm/op_helper.c             |   9 +
>   target/arm/translate-a64.c         |  36 +++-
>   tests/unit/ptimer-test.c           |   6 +-
>   46 files changed, 697 insertions(+), 228 deletions(-)
> 


