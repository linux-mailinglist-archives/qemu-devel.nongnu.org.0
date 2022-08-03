Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925B8588966
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 11:28:22 +0200 (CEST)
Received: from localhost ([::1]:36312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJAft-0002zL-LG
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 05:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJATk-00032t-NW; Wed, 03 Aug 2022 05:15:48 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936]:40921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJATh-0000OY-1x; Wed, 03 Aug 2022 05:15:48 -0400
Received: by mail-ua1-x936.google.com with SMTP id r12so6749763uaf.7;
 Wed, 03 Aug 2022 02:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=KBO5QyPuTBmG/MOY/EQyLhoJKG1nGuYCX+GVD982w5Y=;
 b=eXn2veHlaiQoPSEZrkoLFv/pFpjmqesoRy/IyaY3j+2v+VjjrgnxV+4iwSNG/ZKAXE
 NEjA9qhbU67Uv8XyHDvVKEC8Ja2mMLhvnw7GOPuNx7B/pPw/caAYSoxhFhzGxNBL+zQn
 i3OCI3ZdXbDFKJhhvDOfZjO1Ahf9B/pB+Cd/6rAmQ8QMGdxA6erAgsfByJck6iIghBSK
 VzMvdQAIGXZiRsNfM1LsEg1hibj8nMssRV+1vMdn4tD/8Atf9dSYaFFRk6MKvn8QVAXg
 z9C2jNCSuKYECECWpPUZFmkoH8KRiiog3YlnYTcCfxSSZf7FzWnCN8meh5n0nofbptKl
 ZB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=KBO5QyPuTBmG/MOY/EQyLhoJKG1nGuYCX+GVD982w5Y=;
 b=VFoSA0fB4BnGaOXEUht94KbsVxZ9FTXZ4hqa5W6wynrZyQ0RiROW6RJssAofza8b7C
 CscKt/qy7UsQPktfqafGj5lpr2Cc7dDjP8fdkwInByBQn2eITJSmylpvM0YXaZtN7z7C
 SV7SGweYRE/WB5NqMW+BNKPiiBJxTdAhW1eK1x85WMtq9fVTi7UEIRU1i+kBI0SAqpSc
 mIVQtHvpDP2IkiZXJDRKwVlvQOq32wKgCRTKVQ1NsuA+cPP7UpyA0HKWqat4Rs/ie5VZ
 8zl3DSJO/ndVCVCWVBdcDRfz8/502T60gnkftK7cAd+ruQR8w7jxQlVtdoo8FBb22TzL
 uoMw==
X-Gm-Message-State: ACgBeo1/399plvZm9RwOdRt+bDzZEsgVwJBsL4o7XgjddtPgSz2GmhFg
 Gky0RRkNqNhtFWRIYG9Bc/Y=
X-Google-Smtp-Source: AA6agR75TaagWOJabWZtRSU1e5P6K56NSqjQRB/dUqwNMGeErwtB8CMuuC4YI3Hglxb8W+Eli+VJBA==
X-Received: by 2002:ab0:718c:0:b0:384:d67c:49ec with SMTP id
 l12-20020ab0718c000000b00384d67c49ecmr9379173uao.78.1659518143565; 
 Wed, 03 Aug 2022 02:15:43 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:52e2:fb25:323c:5709:7237?
 ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 f46-20020ab049f1000000b00384dd6e53b8sm9537855uad.34.2022.08.03.02.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 02:15:43 -0700 (PDT)
Message-ID: <698e59fd-43e5-2519-4ec1-82ae0ed42b2f@gmail.com>
Date: Wed, 3 Aug 2022 06:15:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 08/19] ppc/ppc405: QOM'ify GPT
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-9-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220801131039.1693913-9-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x936.google.com
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

>   hw/ppc/ppc405.h    | 22 ++++++++++++
>   hw/ppc/ppc405_uc.c | 90 +++++++++++++++++++++++-----------------------
>   2 files changed, 67 insertions(+), 45 deletions(-)
> 
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index d51fb5094e95..f7c0eb1d0008 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -65,6 +65,27 @@ struct ppc4xx_bd_info_t {
>   
>   typedef struct Ppc405SoCState Ppc405SoCState;
>   
> +/* General purpose timers */
> +#define TYPE_PPC405_GPT "ppc405-gpt"
> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405GptState, PPC405_GPT);
> +struct Ppc405GptState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +
> +    int64_t tb_offset;
> +    uint32_t tb_freq;
> +    QEMUTimer *timer;
> +    qemu_irq irqs[5];
> +    uint32_t oe;
> +    uint32_t ol;
> +    uint32_t im;
> +    uint32_t is;
> +    uint32_t ie;
> +    uint32_t comp[5];
> +    uint32_t mask[5];
> +};
> +
>   #define TYPE_PPC405_CPC "ppc405-cpc"
>   OBJECT_DECLARE_SIMPLE_TYPE(Ppc405CpcState, PPC405_CPC);
>   
> @@ -119,6 +140,7 @@ struct Ppc405SoCState {
>       PowerPCCPU cpu;
>       DeviceState *uic;
>       Ppc405CpcState cpc;
> +    Ppc405GptState gpt;
>   };
>   
>   /* PowerPC 405 core */
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index 20a3e5543423..0f5e4ec15f14 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -926,34 +926,18 @@ static void ppc405_ocm_init(CPUPPCState *env)
>   
>   /*****************************************************************************/
>   /* General purpose timers */
> -typedef struct ppc4xx_gpt_t ppc4xx_gpt_t;
> -struct ppc4xx_gpt_t {
> -    MemoryRegion iomem;
> -    int64_t tb_offset;
> -    uint32_t tb_freq;
> -    QEMUTimer *timer;
> -    qemu_irq irqs[5];
> -    uint32_t oe;
> -    uint32_t ol;
> -    uint32_t im;
> -    uint32_t is;
> -    uint32_t ie;
> -    uint32_t comp[5];
> -    uint32_t mask[5];
> -};
> -
> -static int ppc4xx_gpt_compare (ppc4xx_gpt_t *gpt, int n)
> +static int ppc4xx_gpt_compare(Ppc405GptState *gpt, int n)
>   {
>       /* XXX: TODO */
>       return 0;
>   }
>   
> -static void ppc4xx_gpt_set_output (ppc4xx_gpt_t *gpt, int n, int level)
> +static void ppc4xx_gpt_set_output(Ppc405GptState *gpt, int n, int level)
>   {
>       /* XXX: TODO */
>   }
>   
> -static void ppc4xx_gpt_set_outputs (ppc4xx_gpt_t *gpt)
> +static void ppc4xx_gpt_set_outputs(Ppc405GptState *gpt)
>   {
>       uint32_t mask;
>       int i;
> @@ -974,7 +958,7 @@ static void ppc4xx_gpt_set_outputs (ppc4xx_gpt_t *gpt)
>       }
>   }
>   
> -static void ppc4xx_gpt_set_irqs (ppc4xx_gpt_t *gpt)
> +static void ppc4xx_gpt_set_irqs(Ppc405GptState *gpt)
>   {
>       uint32_t mask;
>       int i;
> @@ -989,14 +973,14 @@ static void ppc4xx_gpt_set_irqs (ppc4xx_gpt_t *gpt)
>       }
>   }
>   
> -static void ppc4xx_gpt_compute_timer (ppc4xx_gpt_t *gpt)
> +static void ppc4xx_gpt_compute_timer(Ppc405GptState *gpt)
>   {
>       /* XXX: TODO */
>   }
>   
>   static uint64_t ppc4xx_gpt_read(void *opaque, hwaddr addr, unsigned size)
>   {
> -    ppc4xx_gpt_t *gpt = opaque;
> +    Ppc405GptState *gpt = PPC405_GPT(opaque);
>       uint32_t ret;
>       int idx;
>   
> @@ -1050,7 +1034,7 @@ static uint64_t ppc4xx_gpt_read(void *opaque, hwaddr addr, unsigned size)
>   static void ppc4xx_gpt_write(void *opaque, hwaddr addr, uint64_t value,
>                                unsigned size)
>   {
> -    ppc4xx_gpt_t *gpt = opaque;
> +    Ppc405GptState *gpt = PPC405_GPT(opaque);
>       int idx;
>   
>       trace_ppc4xx_gpt_write(addr, size, value);
> @@ -1116,20 +1100,18 @@ static const MemoryRegionOps gpt_ops = {
>   
>   static void ppc4xx_gpt_cb (void *opaque)
>   {
> -    ppc4xx_gpt_t *gpt;
> +    Ppc405GptState *gpt = PPC405_GPT(opaque);
>   
> -    gpt = opaque;
>       ppc4xx_gpt_set_irqs(gpt);
>       ppc4xx_gpt_set_outputs(gpt);
>       ppc4xx_gpt_compute_timer(gpt);
>   }
>   
> -static void ppc4xx_gpt_reset (void *opaque)
> +static void ppc405_gpt_reset(DeviceState *dev)
>   {
> -    ppc4xx_gpt_t *gpt;
> +    Ppc405GptState *gpt = PPC405_GPT(dev);
>       int i;
>   
> -    gpt = opaque;
>       timer_del(gpt->timer);
>       gpt->oe = 0x00000000;
>       gpt->ol = 0x00000000;
> @@ -1142,21 +1124,28 @@ static void ppc4xx_gpt_reset (void *opaque)
>       }
>   }
>   
> -static void ppc4xx_gpt_init(hwaddr base, qemu_irq irqs[5])
> +static void ppc405_gpt_realize(DeviceState *dev, Error **errp)
>   {
> -    ppc4xx_gpt_t *gpt;
> +    Ppc405GptState *s = PPC405_GPT(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>       int i;
>   
> -    trace_ppc4xx_gpt_init(base);
> +    s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &ppc4xx_gpt_cb, s);
> +    memory_region_init_io(&s->iomem, OBJECT(s), &gpt_ops, s, "gpt", 0x0d4);
> +    sysbus_init_mmio(sbd, &s->iomem);
>   
> -    gpt = g_new0(ppc4xx_gpt_t, 1);
> -    for (i = 0; i < 5; i++) {
> -        gpt->irqs[i] = irqs[i];
> +    for (i = 0; i < ARRAY_SIZE(s->irqs); i++) {
> +        sysbus_init_irq(sbd, &s->irqs[i]);
>       }
> -    gpt->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &ppc4xx_gpt_cb, gpt);
> -    memory_region_init_io(&gpt->iomem, NULL, &gpt_ops, gpt, "gpt", 0x0d4);
> -    memory_region_add_subregion(get_system_memory(), base, &gpt->iomem);
> -    qemu_register_reset(ppc4xx_gpt_reset, gpt);
> +}
> +
> +static void ppc405_gpt_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = ppc405_gpt_realize;
> +    dc->user_creatable = false;
> +    dc->reset = ppc405_gpt_reset;
>   }
>   
>   /*****************************************************************************/
> @@ -1422,14 +1411,17 @@ static void ppc405_soc_instance_init(Object *obj)
>   
>       object_initialize_child(obj, "cpc", &s->cpc, TYPE_PPC405_CPC);
>       object_property_add_alias(obj, "sys-clk", OBJECT(&s->cpc), "sys-clk");
> +
> +    object_initialize_child(obj, "gpt", &s->gpt, TYPE_PPC405_GPT);
>   }
>   
>   static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>   {
>       Ppc405SoCState *s = PPC405_SOC(dev);
> -    qemu_irq dma_irqs[4], gpt_irqs[5], mal_irqs[4];
> +    qemu_irq dma_irqs[4], mal_irqs[4];
>       CPUPPCState *env;
>       Error *err = NULL;
> +    int i;
>   
>       /* XXX: fix this ? */
>       memory_region_init_alias(&s->ram_memories[0], OBJECT(s),
> @@ -1528,12 +1520,15 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>       ppc405_ocm_init(env);
>   
>       /* GPT */
> -    gpt_irqs[0] = qdev_get_gpio_in(s->uic, 19);
> -    gpt_irqs[1] = qdev_get_gpio_in(s->uic, 20);
> -    gpt_irqs[2] = qdev_get_gpio_in(s->uic, 21);
> -    gpt_irqs[3] = qdev_get_gpio_in(s->uic, 22);
> -    gpt_irqs[4] = qdev_get_gpio_in(s->uic, 23);
> -    ppc4xx_gpt_init(0xef600000, gpt_irqs);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpt), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpt), 0, 0xef600000);
> +
> +    for (i = 0; i < ARRAY_SIZE(s->gpt.irqs); i++) {
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpt), i,
> +                           qdev_get_gpio_in(s->uic, 19 + i));
> +    }
>   
>       /* MAL */
>       mal_irqs[0] = qdev_get_gpio_in(s->uic, 11);
> @@ -1565,6 +1560,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
>   
>   static const TypeInfo ppc405_types[] = {
>       {
> +        .name           = TYPE_PPC405_GPT,
> +        .parent         = TYPE_SYS_BUS_DEVICE,
> +        .instance_size  = sizeof(Ppc405GptState),
> +        .class_init     = ppc405_gpt_class_init,
> +    }, {
>           .name           = TYPE_PPC405_CPC,
>           .parent         = TYPE_DEVICE,
>           .instance_size  = sizeof(Ppc405CpcState),

