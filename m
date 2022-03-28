Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847964EA34A
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:51:07 +0200 (CEST)
Received: from localhost ([::1]:46714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYyCY-0007wz-4x
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:51:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYy52-0005wn-Rf
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:43:20 -0400
Received: from [2607:f8b0:4864:20::22d] (port=37678
 helo=mail-oi1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYy50-00087D-Mn
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:43:20 -0400
Received: by mail-oi1-x22d.google.com with SMTP id q129so17279576oif.4
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 15:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BHMmSTDljnsKKD+aEr0uRubzRH7CkhuKF6WKFU07/fE=;
 b=aefDaNvBwy/P/Xo/2SmJ8etEf+NdyXDrueJm+Wwv3UYv7VgXWop5dCgf8q1ftTL6DN
 nHD8s7DUvBqHeNQwLgUtFFwFEapfOku4tZ4maBPhDMSJdQ3nREgzQ+GK7mtJimFkw8Sk
 Ve7X1OTcPKdN1YGpMS7FvxlEBwNcpKrzFGG+N1vJpvjGEj+GdWLyMDyMZVTZH9madJ/A
 xprpXrFcXnGanrfrIfZYkSUZCvV4Sx1rvXwTQhaFyCS+TfQclZCi6Nm44EXronqsxmt6
 syVtIn1DCnJkrBPzuRD4UfzPplxKCJFGGFp9hal4xvpsdWxTyO+v5TBegLGP0QpNVqAr
 EqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BHMmSTDljnsKKD+aEr0uRubzRH7CkhuKF6WKFU07/fE=;
 b=P9Sjn4yuORvBU6bCDQQ+zFkWMBdMIpVQitVSchcUhxpY+2mZ92/quAaS2jmPlnrC78
 Co7tuuXC7HdKEwOe+Ik7MZ11WyPBKLHsFdrLUJ9w6tvX1pzNkAt9ClBO/v5HFVibWQGc
 iFuXPnlLTZ4JjPjAqNNUCLYUHW1xBM9ZLG+4rlfGHHt50GOtJ6aBFACmn2ehh+vq5/PX
 Q5sQNwgO1zjKW05LKOitICV5vjB96K1Mq2D0h6FTQlPzE2dk23IOH3pQqeG1TEA4+0pI
 ZImHfjMoQwQJthdk6EOii6LnlkRJSD7WFCCCHsZDDg16gdt/2K8wUBTPsln+aQxh8xBC
 Ta3Q==
X-Gm-Message-State: AOAM533G4uro9JEfajvKqs+uQkPaIETcyq7fQI63ijcmDXArPYiFKBzn
 ViXL22zlHroNP4bEe7JW8dBCNw==
X-Google-Smtp-Source: ABdhPJwjrjpa+D8El/M3W6LG6+pU+H8azLoxAedGaHSEYXHq6Y6lgaw1Ua14bm8d0CuNYjRObzyAdg==
X-Received: by 2002:a05:6808:11c2:b0:2d9:a01a:48b7 with SMTP id
 p2-20020a05680811c200b002d9a01a48b7mr747184oiv.258.1648507397129; 
 Mon, 28 Mar 2022 15:43:17 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 d3-20020a9d2903000000b005cda765f578sm7804093otb.0.2022.03.28.15.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 15:43:16 -0700 (PDT)
Message-ID: <620e7d20-8e6a-0b9e-1f3e-022f405bfa92@linaro.org>
Date: Mon, 28 Mar 2022 16:43:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v7 19/29] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-20-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328125749.2918087-20-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 06:57, Xiaojuan Yang wrote:
> This patch realize the EIOINTC interrupt controller.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/intc/Kconfig                    |   3 +
>   hw/intc/loongarch_extioi.c         | 408 +++++++++++++++++++++++++++++
>   hw/intc/meson.build                |   1 +
>   hw/intc/trace-events               |  11 +
>   hw/loongarch/Kconfig               |   1 +
>   include/hw/intc/loongarch_extioi.h |  77 ++++++
>   6 files changed, 501 insertions(+)
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
> index 0000000000..af28e8d6e9
> --- /dev/null
> +++ b/hw/intc/loongarch_extioi.c
> @@ -0,0 +1,408 @@
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
> +#include "hw/loongarch/loongarch.h"
> +#include "hw/qdev-properties.h"
> +#include "exec/address-spaces.h"
> +#include "hw/intc/loongarch_extioi.h"
> +#include "migration/vmstate.h"
> +#include "trace.h"
> +
> +static void extioi_update_irq(void *opaque, int irq_num, int level)
> +{
> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);

I think this is not opaque anymore; you've already resolved it in the caller.
I think level should be 'bool'.

> +    uint8_t  ipnum, cpu;
> +    unsigned long found1, found2;
> +
> +    ipnum = s->sw_ipmap[irq_num];
> +    cpu   = s->sw_coremap[irq_num];
> +    if (level == 1) {

Just if (level).

> +        if (test_bit(irq_num, (void *)s->enable) == false) {

This, and every other cast you're using for bitops.h functions, is wrong.  You would need 
to declare these bitmaps properly as 'unsigned long name[BITS_TO_LONGS(N)];'.

That said, I would definitely use uint64_t, because that matches up with the description 
of these registers in the manual.

> +            return;
> +        }
> +        bitmap_set((void *)s->coreisr[cpu], irq_num, 1);
> +        found1 = find_next_bit((void *)&(s->sw_ipisr[cpu][ipnum]),
> +                               EXTIOI_IRQS, 0);

find_next_bit with offset=0 is find_first_bit...

> +        bitmap_set((void *)&(s->sw_ipisr[cpu][ipnum]), irq_num, 1);
> +
> +        if (found1 >= EXTIOI_IRQS) {
> +            qemu_set_irq(s->parent_irq[cpu][ipnum], level);
> +        }

... but what's the bitmap search doing?  It appears to be checking that there are *no* 
bits set between 0 and EXTIOI_IRQS, and then raising the irq if no bits set.  That seems 
wrong.


> +    } else {
> +        bitmap_clear((void *)s->coreisr[cpu], irq_num, 1);
> +        found1 = find_next_bit((void *)&(s->sw_ipisr[cpu][ipnum]),
> +                               EXTIOI_IRQS, 0);
> +        bitmap_clear((void *)&(s->sw_ipisr[cpu][ipnum]), irq_num, 1);
> +        found2 = find_next_bit((void *)&(s->sw_ipisr[cpu][ipnum]),
> +                               EXTIOI_IRQS, 0);
> +
> +        if ((found1 < EXTIOI_IRQS) && (found2 >= EXTIOI_IRQS)) {
> +            qemu_set_irq(s->parent_irq[cpu][ipnum], level);
> +        }
> +    }
> +}

It *seems* like all of this should be

     uint64_t sum = 0;

     s->isr[ipnum / 64] = deposit64(s->isr[ipnum / 64], ipnum % 64, 1, level);

     for (int i = 0; i < ARRAY_SIZE(s->isr); i++) {
         sum |= s->isr[i] & s->ena[i];
     }
     qemu_set_irq(parent, sum != 0);

If that's not the case, you need many more comments.


r~

