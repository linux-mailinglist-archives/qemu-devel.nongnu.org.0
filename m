Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F0F510E91
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 04:09:43 +0200 (CEST)
Received: from localhost ([::1]:33924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njX7f-0000Gp-1p
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 22:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njX5r-0007C8-8O
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 22:07:51 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:51153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njX5p-00033d-J8
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 22:07:50 -0400
Received: by mail-pj1-x102f.google.com with SMTP id iq10so266837pjb.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 19:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QGAR2T/llyo8VdlBQB68iYs1dha2NZBeFxE5qUviLm0=;
 b=VZw3/AR7/0qpDiQO1sMupb/QvoK5SKaIkN6PsL044FTbaCGGQ1qA7PLfP5k6fFJYyT
 4HgIJVw8ka/TFohmenHrCaO3oS6yCsgFdFB6yEl0r3H8O9opWwSIm6/FdtlQzd/9UmLy
 Ul1sOvgWLCkV+w/yOD7xQbjeZLs/HzLwDX3bPIGXMvTR6sT0kgSCFaIffFxiQ65ECEaL
 aMXFPCiUeq24BiWed10vzDSCo88FSzqpd+w5QEpkMDAk+sWMLmX/cpzg5WC0bV6yoa+y
 Txig9XQs4PcFlyay4eEPvuSoJxoloA4LLiA6AulWEVLk1DAJVwsrq/IhnNhG0pS/5Czx
 d9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QGAR2T/llyo8VdlBQB68iYs1dha2NZBeFxE5qUviLm0=;
 b=4GGfJCiO8PF++kU2CiqbF42ctDgozWjFV4nG04L+0OsA1zopzeIebbGtXGojYSAOo6
 peDTTGK1BZtihxqjhs8GHYJxmUuo2m4UOhdoIBXjaMzXaL4mJf1gKl39726ekmvRpARe
 N2nvEyr4TI0kQa4csTDyZq8j5vWBC6YwBWpEzND2AMtJzdTUje728U7fXoDv2Aovdslm
 q0o4aivFDOVPnzelLEePMr2WkFkNSeSaJ+HjCyLu4NvzzOoJKIs3LJ/INzy2JsVRn0TJ
 fblmI4Smf8Rjh3vF6fFtlEKS+VMJQ8SmPd+96P47TnP3j+sMVWt0uyLony72eNogFDvw
 Z0UA==
X-Gm-Message-State: AOAM533qcZwh2szJiRCavs8g2RSAI+vR4qZVI7B6gEHuDDxb14G5dUVK
 ljnGtHuTm4OSKn2IN0M+iRJQtw==
X-Google-Smtp-Source: ABdhPJwwWeKDks1GPNGRApdzxIp7yGHzsmDGdWYJkB4jAumbhNX42oR2S6T6IHGhFsmXj4KpPLxhWg==
X-Received: by 2002:a17:902:82c9:b0:15d:2e43:a0e5 with SMTP id
 u9-20020a17090282c900b0015d2e43a0e5mr8819342plz.64.1651025268286; 
 Tue, 26 Apr 2022 19:07:48 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a17090a3fc700b001d0ec9c93fesm346465pjm.12.2022.04.26.19.07.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 19:07:47 -0700 (PDT)
Message-ID: <1e61ae86-caed-417e-ca10-8294472253d3@linaro.org>
Date: Tue, 26 Apr 2022 19:07:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 34/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
 <20220425091027.2877892-35-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220425091027.2877892-35-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/22 02:10, Xiaojuan Yang wrote:
> This patch realize the EIOINTC interrupt controller.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/intc/Kconfig                    |   3 +
>   hw/intc/loongarch_extioi.c         | 483 +++++++++++++++++++++++++++++
>   hw/intc/meson.build                |   1 +
>   hw/intc/trace-events               |   9 +
>   hw/loongarch/Kconfig               |   1 +
>   include/hw/intc/loongarch_extioi.h |  60 ++++
>   6 files changed, 557 insertions(+)
>   create mode 100644 hw/intc/loongarch_extioi.c
>   create mode 100644 include/hw/intc/loongarch_extioi.h
> 
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index 71c04c328e..28bd1f185d 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -96,3 +96,6 @@ config LOONGARCH_PCH_MSI
>       select MSI_NONBROKEN
>       bool
>       select UNIMP
> +
> +config LOONGARCH_EXTIOI
> +    bool
> diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
> new file mode 100644
> index 0000000000..1d9317c5bd
> --- /dev/null
> +++ b/hw/intc/loongarch_extioi.c
> @@ -0,0 +1,483 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Loongson 3A5000 ext interrupt controller emulation
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/module.h"
> +#include "qemu/log.h"
> +#include "hw/irq.h"
> +#include "hw/sysbus.h"
> +#include "hw/loongarch/virt.h"
> +#include "hw/qdev-properties.h"
> +#include "exec/address-spaces.h"
> +#include "hw/intc/loongarch_extioi.h"
> +#include "migration/vmstate.h"
> +#include "trace.h"
> +
> +static void extioi_update_irq(LoongArchExtIOI *s, int irq_num, int level)
> +{
> +    uint64_t ipnum, cpu;
> +
> +    /*
> +     * Routing in group of 32 interrupts.
> +     * The default value of csr[0x420][49]
> +     * is 0 and nobody will change it,
> +     * so 'ipmap' use bitmap function.
> +     */
> +    ipnum = ldub_p((void *)&s->ipmap + (irq_num / 32)) & 0xf;
> +    ipnum = find_first_bit(&ipnum, 4);
> +    ipnum = (ipnum == 4) ? 0 : ipnum;
> +
> +    cpu = ldub_p((void *)s->coremap + irq_num) & 0xf;
> +    cpu = find_first_bit(&cpu, 4);
> +    cpu = (cpu == 4) ? 0 : cpu;
> +
> +    if (level) {
> +        if (test_bit(irq_num, (unsigned long *)s->enable) == false) {
> +            return;
> +        }
> +        bitmap_set((unsigned long *)s->coreisr[cpu], irq_num, 1);
> +        qemu_set_irq(s->parent_irq[cpu][ipnum], level);
> +    } else {
> +        bitmap_clear((unsigned long *)s->coreisr[cpu], irq_num, 1);
> +        qemu_set_irq(s->parent_irq[cpu][ipnum], level);

I told you before: all of this casting is wrong.
You cannot use only part of the bitmap.h interface.

> +#define MAX_CORES                  LOONGARCH_MAX_VCPUS

Why do you have so many MAX cpu defines, all different?


r~

