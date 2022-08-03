Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3322258897B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 11:32:13 +0200 (CEST)
Received: from localhost ([::1]:43414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJAjb-0007w9-SY
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 05:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAby-0007Ov-MD; Wed, 03 Aug 2022 05:24:18 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934]:40947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAbw-0001ow-R9; Wed, 03 Aug 2022 05:24:18 -0400
Received: by mail-ua1-x934.google.com with SMTP id r12so6756223uaf.7;
 Wed, 03 Aug 2022 02:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=iXo17VTJUlGjvYpMus82KQczU8dNUuTYjSrXjTzeAus=;
 b=exFrsaucH+lAhRsXPg4SQLD0zQIIjacTQLI/IgQfumqRzIsE5hSrrmkYR23fb+4LqJ
 uXRY9nrScWXvkEFYK2A1HgD6h4mjov98+7nlwD/LjIddt1HPSYbkD8qihHxE4OuQgPiY
 LSn/RYt8/qclgLcTvEcvO8k4+FPTcR6egvoMXogosojxUMa29kd+Z/rq0IxGJQWOdqnE
 W2RsnWNGputHZrzIFcTy922bjZBJw02AkAR21hvkZ+rn55WXxuD3G525M8uXiOAQlN2q
 hTDla0N8McQVUL/ZIKGX0LlV0Ts0bRFI7cdQHRy0ZsllVa5jJL06lu82WWWm4ATO/Cpi
 /TvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=iXo17VTJUlGjvYpMus82KQczU8dNUuTYjSrXjTzeAus=;
 b=onIXqLCY/Tj+XZswhJRD6C4WpMaU1JwGpoFJ5V6IzcMZiEI/RZpKDKWJJXS8lDq8g6
 GkOw+NPBJaSdABL7Ruzutyds5MBXpBJ3lDzkuDhhMOKOnwK/thC1ll7XF9YDQlqgLa1b
 a3M+3HsOKcKa9gm9rJI2V99Kjop+Ok/usGA4AwazOqJ15c+wH2ovPAX+yEvaj4HoSqkD
 x6JSCOLvwI/LfQSD7+gy7DL9AGUsGQDMkfywWMN47Xgb/OqIltjoEUoRQFGDjYN119lm
 YtRlEAICklIiodZV2vOsdBOoq4xfYoSDm4+dqBuirsyYwEbbmMra47395xxBAqWD+T4F
 cXZw==
X-Gm-Message-State: ACgBeo0XRPJVgDRSt5Ddf4U/WvT7BdgbHLThjwxJjmVm6Z+myZvmpNvg
 KNeVIK7zimdJzzmDhjtN0Vc=
X-Google-Smtp-Source: AA6agR5YMXFmCc1Snpib2p6/76ibtKZqUxD40wUNzh8SWPvuBDKU0uBKO/1xyaJ94FHtPIAtsHfU6Q==
X-Received: by 2002:a9f:3625:0:b0:384:73e9:deba with SMTP id
 r34-20020a9f3625000000b0038473e9debamr9863534uad.14.1659518655443; 
 Wed, 03 Aug 2022 02:24:15 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:52e2:fb25:323c:5709:7237?
 ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 b42-20020ab0142d000000b00384ddb82896sm10059178uae.19.2022.08.03.02.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 02:24:15 -0700 (PDT)
Message-ID: <e42eb5d5-83b7-a062-2d50-b5085ecc59b9@gmail.com>
Date: Wed, 3 Aug 2022 06:24:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 10/19] ppc/ppc405: QOM'ify GPIO
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-11-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220801131039.1693913-11-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x934.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 8/1/22 10:10, Cédric Le Goater wrote:
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/ppc405.h    | 21 +++++++++++++++++++
>   hw/ppc/ppc405_uc.c | 50 +++++++++++++++++++++-------------------------
>   2 files changed, 44 insertions(+), 27 deletions(-)
> 
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index e56363366cad..46366c3b8a19 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -65,6 +65,26 @@ struct ppc4xx_bd_info_t {
>   
>   typedef struct Ppc405SoCState Ppc405SoCState;
>   
> +/* GPIO */
> +#define TYPE_PPC405_GPIO "ppc405-gpio"
> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405GpioState, PPC405_GPIO);
> +struct Ppc405GpioState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion io;
> +    uint32_t or;
> +    uint32_t tcr;
> +    uint32_t osrh;
> +    uint32_t osrl;
> +    uint32_t tsrh;
> +    uint32_t tsrl;
> +    uint32_t odr;
> +    uint32_t ir;
> +    uint32_t rr1;
> +    uint32_t isr1h;
> +    uint32_t isr1l;
> +};
> +
>   /* On Chip Memory */
>   #define TYPE_PPC405_OCM "ppc405-ocm"
>   OBJECT_DECLARE_SIMPLE_TYPE(Ppc405OcmState, PPC405_OCM);
> @@ -159,6 +179,7 @@ struct Ppc405SoCState {
>       Ppc405CpcState cpc;
>       Ppc405GptState gpt;
>       Ppc405OcmState ocm;
> +    Ppc405GpioState gpio;
>   };
>   
>   /* PowerPC 405 core */
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index 59cade4c0680..a6c4e6934ffc 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -713,23 +713,6 @@ static void ppc405_dma_init(CPUPPCState *env, qemu_irq irqs[4])
>   }
>   
>   /*****************************************************************************/
> -/* GPIO */
> -typedef struct ppc405_gpio_t ppc405_gpio_t;
> -struct ppc405_gpio_t {
> -    MemoryRegion io;
> -    uint32_t or;
> -    uint32_t tcr;
> -    uint32_t osrh;
> -    uint32_t osrl;
> -    uint32_t tsrh;
> -    uint32_t tsrl;
> -    uint32_t odr;
> -    uint32_t ir;
> -    uint32_t rr1;
> -    uint32_t isr1h;
> -    uint32_t isr1l;
> -};
> -
>   static uint64_t ppc405_gpio_read(void *opaque, hwaddr addr, unsigned size)
>   {
>       trace_ppc405_gpio_read(addr, size);
> @@ -748,20 +731,22 @@ static const MemoryRegionOps ppc405_gpio_ops = {
>       .endianness = DEVICE_NATIVE_ENDIAN,
>   };
>   
> -static void ppc405_gpio_reset (void *opaque)
> +static void ppc405_gpio_realize(DeviceState *dev, Error **errp)
>   {
> +    Ppc405GpioState *s = PPC405_GPIO(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +
> +    memory_region_init_io(&s->io, OBJECT(s), &ppc405_gpio_ops, s, "gpio",
> +                          0x038);
> +    sysbus_init_mmio(sbd, &s->io);
>   }
>   
> -static void ppc405_gpio_init(hwaddr base)
> +static void ppc405_gpio_class_init(ObjectClass *oc, void *data)
>   {
> -    ppc405_gpio_t *gpio;
> -
> -    trace_ppc405_gpio_init(base);
> +    DeviceClass *dc = DEVICE_CLASS(oc);
>   
> -    gpio = g_new0(ppc405_gpio_t, 1);
> -    memory_region_init_io(&gpio->io, NULL, &ppc405_gpio_ops, gpio, "pgio", 0x038);
> -    memory_region_add_subregion(get_system_memory(), base, &gpio->io);
> -    qemu_register_reset(&ppc405_gpio_reset, gpio);
> +    dc->realize = ppc405_gpio_realize;
> +    dc->user_creatable = false;
>   }
>   
>   /*****************************************************************************/
> @@ -1421,6 +1406,8 @@ static void ppc405_soc_instance_init(Object *obj)
>       object_initialize_child(obj, "gpt", &s->gpt, TYPE_PPC405_GPT);
>   
>       object_initialize_child(obj, "ocm", &s->ocm, TYPE_PPC405_OCM);
> +
> +    object_initialize_child(obj, "gpio", &s->gpio, TYPE_PPC405_GPIO);
>   }
>   
>   static void ppc405_soc_realize(DeviceState *dev, Error **errp)
> @@ -1507,8 +1494,12 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>       /* I2C controller */
>       sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500,
>                            qdev_get_gpio_in(s->uic, 2));
> +
>       /* GPIO */
> -    ppc405_gpio_init(0xef600700);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, 0xef600700);
>   
>       /* Serial ports */
>       if (serial_hd(0) != NULL) {
> @@ -1572,6 +1563,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
>   
>   static const TypeInfo ppc405_types[] = {
>       {
> +        .name           = TYPE_PPC405_GPIO,
> +        .parent         = TYPE_SYS_BUS_DEVICE,
> +        .instance_size  = sizeof(Ppc405GpioState),
> +        .class_init     = ppc405_gpio_class_init,
> +    }, {
>           .name           = TYPE_PPC405_OCM,
>           .parent         = TYPE_SYS_BUS_DEVICE,
>           .instance_size  = sizeof(Ppc405OcmState),

