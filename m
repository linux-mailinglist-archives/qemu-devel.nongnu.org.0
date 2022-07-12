Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBB357297C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:49:52 +0200 (CEST)
Received: from localhost ([::1]:35388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOhU-00019c-1a
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBOd5-0003Ux-SP
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:45:23 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBOd4-00068T-6R
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:45:19 -0400
Received: by mail-wr1-x429.google.com with SMTP id v16so13082318wrd.13
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 15:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3uDQtSKbr4zrfMqNz3tJ92Bk0rYQWh9ZuOEWzXK639w=;
 b=X9UjLNKeaVYl/r1oXi/3JF9FE3uuY3jOatX1vdKv/9SnjY25SVVeq2zBS+qOluqsyF
 VWQdPCacNPr3FaQZ305D7P7afUrS1JBd+X8WGONs2HA3XfSJlzH5QiGUP3g9YfXURxde
 qlJu1DEt9pymJCfB9ieB/g7v0IAkkOhI7nDPiS75nT07O2tcVENoyA2QT1eCte2jp+XH
 B5JUnaKvwCgeprFmCyhvsmB2xjqbdBIpQvZvH9ZUdJ5w4rEBcPVJ8ibXbTgGzgOBlf++
 f6KVgkaywz0eYMX+WrH/GAisfWy0GGhZdTd4JwJHFdX2spbgX0br4vJ7D0I1pqil0r0+
 KrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3uDQtSKbr4zrfMqNz3tJ92Bk0rYQWh9ZuOEWzXK639w=;
 b=jKHsIRndltHSS//mW0lsq4/cb/NdPF+6G5lwHegMN5O/vCm88sYDC/TDHuj/yULJwy
 i0z57d6Wv00VhT45mXdXVpHvnRQBb1G9/sbKcSEKBDPtdn932b7cbgTSWAPV3v1E45LI
 DfSSiyZC7GNDRlTDntPIONNQjup6gbdcaK99XH1D00uTD/Mm0aFsB43cG80rrXnbUtzq
 GQt7cfyXwq+5YJYTtrcEqNvQ4NPbGevc/NEDYvrCSVUmiTz+Roq1ZcSKmJxozWBbpmCD
 nTbZBev7TiHis0sH/3ILzC0vwV2gdi3XxmvXUnmJhHYPsnqQDCaVUKqfDtWB8c+fRQSx
 2zmQ==
X-Gm-Message-State: AJIora/YuQkUV5oi69fjTmtsM4KoZp7RERQYYBKJmRjBHyJtP10NCA4+
 bx1b65kpg92F2JCWzFGqbnE=
X-Google-Smtp-Source: AGRyM1tB3mQQwVHEP4k7nCfBRLPLjGyCPFh8QNxuz5Nrme+obDOBUU0Ovf86TKLIbY4BHPP1jrSv/w==
X-Received: by 2002:a05:6000:1888:b0:21c:9a16:5cdd with SMTP id
 a8-20020a056000188800b0021c9a165cddmr240882wri.562.1657665914953; 
 Tue, 12 Jul 2022 15:45:14 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a05600c2d0400b003974a00697esm206337wmf.38.2022.07.12.15.45.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 15:45:14 -0700 (PDT)
Message-ID: <0a39c59d-05a0-e792-3ad8-f3a148df1a6f@amsat.org>
Date: Wed, 13 Jul 2022 00:45:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v2] Align Raspberry Pi DMA interrupts with Linux DTS
Content-Language: en-US
To: Andrey Makarov <ph.makarov@gmail.com>, qemu-devel@nongnu.org
Cc: Andrey Makarov <andrey.makarov@auriga.com>
References: <20220712104500.143538-1-andrey.makarov@auriga.com>
In-Reply-To: <20220712104500.143538-1-andrey.makarov@auriga.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Hi Andrey,

On 12/7/22 12:45, Andrey Makarov wrote:
> There is nothing in the specs on DMA engine interrupt lines: it should have
> been in the "BCM2835 ARM Peripherals" datasheet but the appropriate
> "ARM peripherals interrupt table" (p.113) is nearly empty.
> 
> All Raspberry Pi models 1-3 (based on bcm2835) have
> Linux device tree (arch/arm/boot/dts/bcm2835-common.dtsi +25):
> 
>      /* dma channel 11-14 share one irq */
> 
> This information is repeated in the driver code
> (drivers/dma/bcm2835-dma.c +1344):
> 
>      /*
>       * in case of channel >= 11
>       * use the 11th interrupt and that is shared
>       */
> 
> In this patch channels 0--10 and 11--14 are handled separately.
> 
> In version v2:
> 
> 1) an OR-gate is added according to review
> 2) a simple qtest is added for testing DMA & its interrupts
> 
> Signed-off-by: Andrey Makarov <andrey.makarov@auriga.com>
> ---
>   hw/arm/bcm2835_peripherals.c         |  21 +++++-
>   include/hw/arm/bcm2835_peripherals.h |   2 +
>   tests/qtest/bcm2835-dma-test.c       | 106 +++++++++++++++++++++++++++
>   tests/qtest/meson.build              |   3 +-
>   4 files changed, 130 insertions(+), 2 deletions(-)
>   create mode 100644 tests/qtest/bcm2835-dma-test.c
> 
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 48538c9360..5a9c472b5a 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -101,6 +101,11 @@ static void bcm2835_peripherals_init(Object *obj)
>       /* DMA Channels */
>       object_initialize_child(obj, "dma", &s->dma, TYPE_BCM2835_DMA);
>   
> +    object_initialize_child(obj, "dma-11-14-irq-orgate",

Maybe name "shared-dma-irq-orgate"?

> +                            &s->dma_11_14_irq_orgate, TYPE_OR_IRQ);

Similarly 'shared_dma' or 'orgated-dma'? But not _11_14_.

> +    object_property_set_int(OBJECT(&s->dma_11_14_irq_orgate), "num-lines", 4,

Instead of using a magic number:

#define BCM2835_SHARED_DMA_COUNT 4

> +                            &error_abort);
> +
>       object_property_add_const_link(OBJECT(&s->dma), "dma-mr",
>                                      OBJECT(&s->gpu_bus_mr));
>   
> @@ -322,13 +327,27 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>       memory_region_add_subregion(&s->peri_mr, DMA15_OFFSET,
>                   sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->dma), 1));
>   
> -    for (n = 0; n <= 12; n++) {
> +    for (n = 0; n <= 10; n++) {

So before we could trigger IRQ #12, and now it is unbound?

Also:

#define BCM2835_DMA_CHANNELS 10

>           sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), n,
>                              qdev_get_gpio_in_named(DEVICE(&s->ic),
>                                                     BCM2835_IC_GPU_IRQ,
>                                                     INTERRUPT_DMA0 + n));
>       }
>   
> +    /* According to DTS, dma channels 11-14 share one irq */
> +    if (!qdev_realize(DEVICE(&s->dma_11_14_irq_orgate), NULL, errp)) {
> +        return;
> +    }
> +    for (n = 11; n <= 14; n++) {

Logic simplified if you use the [0 .. BCM2835_SHARED_DMA_COUNT-1] range:

   for (n = 0; n < BCM2835_SHARED_DMA_COUNT; n++) {

> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), n,

     BCM2835_DMA_CHANNELS + 1 + n,

> +                           qdev_get_gpio_in(DEVICE(&s->dma_11_14_irq_orgate),
> +                                            n - 11));

     n)

> +    }
> +    qdev_connect_gpio_out(DEVICE(&s->dma_11_14_irq_orgate), 0,
> +                          qdev_get_gpio_in_named(DEVICE(&s->ic),
> +                                                 BCM2835_IC_GPU_IRQ,
> +                                                 INTERRUPT_DMA0 + 11));
> +
>       /* THERMAL */
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->thermal), errp)) {
>           return;
> diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
> index d864879421..79e2f2771a 100644
> --- a/include/hw/arm/bcm2835_peripherals.h
> +++ b/include/hw/arm/bcm2835_peripherals.h
> @@ -17,6 +17,7 @@
>   #include "hw/char/bcm2835_aux.h"
>   #include "hw/display/bcm2835_fb.h"
>   #include "hw/dma/bcm2835_dma.h"
> +#include "hw/or-irq.h"
>   #include "hw/intc/bcm2835_ic.h"
>   #include "hw/misc/bcm2835_property.h"
>   #include "hw/misc/bcm2835_rng.h"
> @@ -55,6 +56,7 @@ struct BCM2835PeripheralState {
>       BCM2835AuxState aux;
>       BCM2835FBState fb;
>       BCM2835DMAState dma;
> +    qemu_or_irq dma_11_14_irq_orgate;
>       BCM2835ICState ic;
>       BCM2835PropertyState property;
>       BCM2835RngState rng;

Regards,

Phil.

