Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BAF6AE0B7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:37:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZXVR-0000tI-1b; Tue, 07 Mar 2023 08:37:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pZXVN-0000n9-BM; Tue, 07 Mar 2023 08:37:25 -0500
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pZXVL-0005OH-4s; Tue, 07 Mar 2023 08:37:25 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id
 t5-20020a4ac885000000b005251f70a740so2030788ooq.8; 
 Tue, 07 Mar 2023 05:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678196236;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7cHp75bl58rVaE32pv7MovvxG2J2YQy3UU3Z3YlN9D0=;
 b=NE42GkqGYmQqDzpOmcOfTnsGoaXUdObpRYh31GNJVhEMzizQeJ7ZsNrMlueh7STSAH
 yTczQutD9hbzw6eOjVT7x2wOTVtoGK3HNBuAipBUrJe2zpwuT8kL3oWq8YzsBhPVEdB3
 pcu5iOgqw4QGoNuHOULTHBmo8dEZFCDIjUPXqBfsoxx1jt77Ga3bwnGKw6K2Vol1pgjY
 UEXbuI4Rl7z6/JoKKsXXQlPqauSOKetGGDP2U6xsyfSYNu6XN3gt26kyyfgHBEG+KSqh
 YjZtGiMosed7qHJRY5I7n3aTFej+rDyhFBbGkIhZlM31YHtPyNtu39TCcQMqYMyX0ACW
 OyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678196236;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7cHp75bl58rVaE32pv7MovvxG2J2YQy3UU3Z3YlN9D0=;
 b=eU/51Sz1+IzNffaqtLt3TqLIwHGj5IaWClgtwhRuu+wXw1fAo2FrtljU0gvxWIUJeI
 4IO7i5O0CMYOFZ2Y3ecYVG4Z1CQ1w4j6tCM1yCGe/JhHoLUJ7l1HqnHLIMv/KCnQHL9A
 13n9hzNUcb27WxjdVjEquURJuSoUt2rXFny9+cVTV/pN2L/4U1gy1FfiVa4ZjNYRMkX2
 X+eXcoTfZts/iUJo6qa/ClLW+sjmq6W9SExAH3OhQqad+aLS/E7zHdgu+nCjgzrMdQ5c
 f4bZAP62fF6RQjbmd07hX0TaTCfeJfOrn2OIcjSVvS8tggCGArW1vOeQzqNesCWoPP0p
 /Sxg==
X-Gm-Message-State: AO0yUKVMIqfo7iYlBTdDreNFZqiiRTJVtlgmMBO9DCmbP0zjY5ZTg3Pm
 3M8EvzlBh5mMI+nUWAChqtQ=
X-Google-Smtp-Source: AK7set8bvyy8fwc27S0y1mJBSAXBCKSf9osCzoQ+qqt2/RVpvbqyZoIzMBGKAGwcFw9M5jyYrUnjUw==
X-Received: by 2002:a4a:98d1:0:b0:49f:8941:ffed with SMTP id
 b17-20020a4a98d1000000b0049f8941ffedmr5663893ooj.9.1678196236058; 
 Tue, 07 Mar 2023 05:37:16 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a056830082800b006884c42a38asm5391650ots.41.2023.03.07.05.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 05:37:15 -0800 (PST)
Message-ID: <7cdd5734-c753-6600-c691-46d417866f0c@gmail.com>
Date: Tue, 7 Mar 2023 10:37:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 3/7] Revert "hw/isa/vt82c686: Remove intermediate IRQ
 forwarder"
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de
References: <cover.1678188711.git.balaton@eik.bme.hu>
 <2878ea6ebe4713fe9b8f2ab777b58b5e5f10fe5b.1678188711.git.balaton@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <2878ea6ebe4713fe9b8f2ab777b58b5e5f10fe5b.1678188711.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 3/7/23 08:42, BALATON Zoltan wrote:
> This partially reverts commit bb98e0f59cde846666d9fddc60ae74ef7ddfca17
> keeping the rename of a state field but reverting other cahanges which
> break interrupts on pegasos2.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/isa/vt82c686.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index f4c40965cd..01e0148967 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -598,15 +598,23 @@ void via_isa_set_irq(PCIDevice *d, int n, int level)
>       qemu_set_irq(s->isa_irqs_in[n], level);
>   }
>   
> +static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
> +{
> +    ViaISAState *s = opaque;
> +    qemu_set_irq(s->cpu_intr, level);
> +}
> +
>   static void via_isa_realize(PCIDevice *d, Error **errp)
>   {
>       ViaISAState *s = VIA_ISA(d);
>       DeviceState *dev = DEVICE(d);
>       PCIBus *pci_bus = pci_get_bus(d);
> +    qemu_irq *isa_irq;
>       ISABus *isa_bus;
>       int i;
>   
>       qdev_init_gpio_out(dev, &s->cpu_intr, 1);
> +    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
>       isa_bus = isa_bus_new(dev, pci_address_space(d), pci_address_space_io(d),
>                             errp);
>   
> @@ -614,7 +622,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>           return;
>       }
>   
> -    s->isa_irqs_in = i8259_init(isa_bus, s->cpu_intr);
> +    s->isa_irqs_in = i8259_init(isa_bus, *isa_irq);
>       isa_bus_register_input_irqs(isa_bus, s->isa_irqs_in);
>       i8254_pit_init(isa_bus, 0x40, 0, NULL);
>       i8257_dma_init(isa_bus, 0);

