Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF1650A6E4
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:18:14 +0200 (CEST)
Received: from localhost ([::1]:34290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhaRZ-0001tD-A3
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhZbp-0000xo-1v
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:24:46 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhZbn-0008W0-5U
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:24:44 -0400
Received: by mail-pj1-x1031.google.com with SMTP id bx5so5402269pjb.3
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 09:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=FgXQg07eSEHfq1rJ4gZrDbrZX/KxzGhnLdcN7bvIji8=;
 b=L2SrzKsdroWnZOupN+Bfyn8n3n+cSUN+HzyAv308g77d2WMLJGHVN9VbQh744Fplc3
 Rd1FmSXNBq3JDXMbRMQXIDU//0zWJa/q5CqXSs14FASdNpZE7P6RHOmOqShfOoV/Tued
 nc3TLJNbZBO6gx9h6ZIXAHHvfsY8YB9I5yfn7qq6R3oGYgq47FnHvXr9F9C5Vz1Y/cRr
 FMdOKoODQLhiuby3Q5HOpmmhnxCdS3W9JkQsIH9wFTMpJzNld61FkipIT5etgm/jml2X
 oouzSLcdwyC3rbiUm7wtcfrI/VOwLBdYkIfLCMWHpHMmg3rP611tD7zAt6WBRPVBuKVA
 wJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FgXQg07eSEHfq1rJ4gZrDbrZX/KxzGhnLdcN7bvIji8=;
 b=Ae7HLA5rabgmAEg3FBLEfiDYn2Txfu2gKABOie7z5F9wzkk7E6nd6lV4epvrBtJx42
 CijiZxlr6b0Dn9FJUHwQFis+zrGtZQL8Ep8OyMEYk6AMOBxsbns9wtTK+wwsqsliomiG
 R0nvTh8KIx5sbigrtwSiqhAaJPg50HOJ/WePPPvmWR5+fJSk6vY+wyO/Xo7BaDtUVUup
 D6DUN4du/qsLpp+gdvKy1cK9qffMVb/P9/9kw8q74pFpPOSOv/L4M1VMp+zFovURINM/
 /QkuC2ScETIRWBEY9XMnPFfe6Jp2HJJUatCozjyOyid+HGtVTyV9P1HxvPw/+Hq5CAJo
 tIyQ==
X-Gm-Message-State: AOAM532Jo9iryp2s7CZp96bzChvyXu5w+j4+Dhb4TNjPaA8XwxUoEUwK
 lbxVPLrEDkkY0hAEnLuEeFjQFg==
X-Google-Smtp-Source: ABdhPJyjBn4roh5bvVmFHxwL6hiExVaOqRd8wwWwMwZOCPn+tLKeTILjGfWsdX0wyVq3zRn6wWoTHA==
X-Received: by 2002:a17:902:7618:b0:156:509b:68df with SMTP id
 k24-20020a170902761800b00156509b68dfmr77416pll.1.1650558281689; 
 Thu, 21 Apr 2022 09:24:41 -0700 (PDT)
Received: from ?IPV6:2607:fb90:80c1:f8a5:f943:dd58:6af1:9fda?
 ([2607:fb90:80c1:f8a5:f943:dd58:6af1:9fda])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a17090a6a8300b001d7761ee6fcsm601405pjj.3.2022.04.21.09.24.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 09:24:40 -0700 (PDT)
Message-ID: <9d93dfcf-a9fb-1a57-f8e9-8fb5e7d9442c@linaro.org>
Date: Thu, 21 Apr 2022 09:24:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/31] target-arm queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

On 4/21/22 04:18, Peter Maydell wrote:
> First arm pullreq for 7.1. The bulk of this is the qemu_split_irq
> removal.
> 
> I have enough stuff in my to-review queue that I expect to do another
> pullreq early next week, but 31 patches is enough to not hang on to.
> 
> thanks
> -- PMM
> 
> The following changes since commit 9c125d17e9402c232c46610802e5931b3639d77b:
> 
>    Merge tag 'pull-tcg-20220420' of https://gitlab.com/rth7680/qemu into staging (2022-04-20 16:43:11 -0700)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220421
> 
> for you to fetch changes up to 5b415dd61bdbf61fb4be0e9f1a7172b8bce682c6:
> 
>    hw/arm: Use bit fields for NPCM7XX PWRON STRAPs (2022-04-21 11:37:05 +0100)
> 
> ----------------------------------------------------------------
> target-arm queue:
>   * hw/arm/virt: Check for attempt to use TrustZone with KVM or HVF
>   * versal: Add the Cortex-R5s in the Real-Time Processing Unit (RPU) subsystem
>   * versal: model enough of the Clock/Reset Low-power domain (CRL) to allow control of the Cortex-R5s
>   * xlnx-zynqmp: Connect 4 TTC timers
>   * exynos4210: Refactor GIC/combiner code to stop using qemu_split_irq
>   * realview: replace 'qemu_split_irq' with 'TYPE_SPLIT_IRQ'
>   * stellaris: replace 'qemu_split_irq' with 'TYPE_SPLIT_IRQ'
>   * hw/core/irq: remove unused 'qemu_irq_split' function
>   * npcm7xx: use symbolic constants for PWRON STRAP bit fields
>   * virt: document impact of gic-version on max CPUs

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Edgar E. Iglesias (6):
>        timer: cadence_ttc: Break out header file to allow embedding
>        hw/arm/xlnx-zynqmp: Connect 4 TTC timers
>        hw/arm: versal: Create an APU CPU Cluster
>        hw/arm: versal: Add the Cortex-R5Fs
>        hw/misc: Add a model of the Xilinx Versal CRL
>        hw/arm: versal: Connect the CRL
> 
> Hao Wu (2):
>        hw/misc: Add PWRON STRAP bit fields in GCR module
>        hw/arm: Use bit fields for NPCM7XX PWRON STRAPs
> 
> Heinrich Schuchardt (1):
>        hw/arm/virt: impact of gic-version on max CPUs
> 
> Peter Maydell (19):
>        hw/arm/virt: Check for attempt to use TrustZone with KVM or HVF
>        hw/arm/exynos4210: Use TYPE_OR_IRQ instead of custom OR-gate device
>        hw/intc/exynos4210_gic: Remove unused TYPE_EXYNOS4210_IRQ_GATE
>        hw/arm/exynos4210: Put a9mpcore device into state struct
>        hw/arm/exynos4210: Drop int_gic_irq[] from Exynos4210Irq struct
>        hw/arm/exynos4210: Coalesce board_irqs and irq_table
>        hw/arm/exynos4210: Fix code style nit in combiner_grp_to_gic_id[]
>        hw/arm/exynos4210: Move exynos4210_init_board_irqs() into exynos4210.c
>        hw/arm/exynos4210: Put external GIC into state struct
>        hw/arm/exynos4210: Drop ext_gic_irq[] from Exynos4210Irq struct
>        hw/arm/exynos4210: Move exynos4210_combiner_get_gpioin() into exynos4210.c
>        hw/arm/exynos4210: Delete unused macro definitions
>        hw/arm/exynos4210: Use TYPE_SPLIT_IRQ in exynos4210_init_board_irqs()
>        hw/arm/exynos4210: Fill in irq_table[] for internal-combiner-only IRQ lines
>        hw/arm/exynos4210: Connect MCT_G0 and MCT_G1 to both combiners
>        hw/arm/exynos4210: Don't connect multiple lines to external GIC inputs
>        hw/arm/exynos4210: Fold combiner splits into exynos4210_init_board_irqs()
>        hw/arm/exynos4210: Put combiners into state struct
>        hw/arm/exynos4210: Drop Exynos4210Irq struct
> 
> Zongyuan Li (3):
>        hw/arm/realview: replace 'qemu_split_irq' with 'TYPE_SPLIT_IRQ'
>        hw/arm/stellaris: replace 'qemu_split_irq' with 'TYPE_SPLIT_IRQ'
>        hw/core/irq: remove unused 'qemu_irq_split' function
> 
>   docs/system/arm/virt.rst              |   4 +-
>   include/hw/arm/exynos4210.h           |  50 ++--
>   include/hw/arm/xlnx-versal.h          |  16 ++
>   include/hw/arm/xlnx-zynqmp.h          |   4 +
>   include/hw/intc/exynos4210_combiner.h |  57 +++++
>   include/hw/intc/exynos4210_gic.h      |  43 ++++
>   include/hw/irq.h                      |   5 -
>   include/hw/misc/npcm7xx_gcr.h         |  30 +++
>   include/hw/misc/xlnx-versal-crl.h     | 235 +++++++++++++++++++
>   include/hw/timer/cadence_ttc.h        |  54 +++++
>   hw/arm/exynos4210.c                   | 430 ++++++++++++++++++++++++++++++----
>   hw/arm/npcm7xx_boards.c               |  24 +-
>   hw/arm/realview.c                     |  33 ++-
>   hw/arm/stellaris.c                    |  15 +-
>   hw/arm/virt.c                         |   7 +
>   hw/arm/xlnx-versal-virt.c             |   6 +-
>   hw/arm/xlnx-versal.c                  |  99 +++++++-
>   hw/arm/xlnx-zynqmp.c                  |  22 ++
>   hw/core/irq.c                         |  15 --
>   hw/intc/exynos4210_combiner.c         | 108 +--------
>   hw/intc/exynos4210_gic.c              | 344 +--------------------------
>   hw/misc/xlnx-versal-crl.c             | 421 +++++++++++++++++++++++++++++++++
>   hw/timer/cadence_ttc.c                |  32 +--
>   MAINTAINERS                           |   2 +-
>   hw/misc/meson.build                   |   1 +
>   25 files changed, 1457 insertions(+), 600 deletions(-)
>   create mode 100644 include/hw/intc/exynos4210_combiner.h
>   create mode 100644 include/hw/intc/exynos4210_gic.h
>   create mode 100644 include/hw/misc/xlnx-versal-crl.h
>   create mode 100644 include/hw/timer/cadence_ttc.h
>   create mode 100644 hw/misc/xlnx-versal-crl.c
> 


