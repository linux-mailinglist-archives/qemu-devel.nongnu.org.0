Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D925C58897F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 11:35:57 +0200 (CEST)
Received: from localhost ([::1]:46474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJAnE-0001qI-St
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 05:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAdA-000856-JZ; Wed, 03 Aug 2022 05:25:36 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931]:36852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAd8-0001wW-Ol; Wed, 03 Aug 2022 05:25:32 -0400
Received: by mail-ua1-x931.google.com with SMTP id t21so6773123uaq.3;
 Wed, 03 Aug 2022 02:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=VT17gFGdDD7w9s6Wq9dAmokO/K28W/IiHkHtjaEM5ME=;
 b=TSXho83oDCKXFuMcnb4LFE0yM/yPnNt01rKcXw2A+Sd5hW+jAFid4xZessUAXmxnIY
 eRxBmTL9byXw1j2sDfyx8Now93S99hVwsbQj9tZAULqO60R9GamtZSQjtLEr8P4bXhRL
 ZrL+5oIphK54CBFWDk7PzP1iPm8xwX/eR4s9BhpEb0ENRSKdWHI0SD2qa9X20mFQjVN2
 GTg1KYJ+LtALa3rPfzpx+Zjdb4ivauXKTUmHIS0GVm9Oywulvd0WSc/B84VqurBqlvhc
 EEnDZJSSvJi9RKl6uY+YbYhCRDe5/jwYedwrrji+hjOhDDOQ6ZwRk9naIyZIQJijN4dT
 A/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=VT17gFGdDD7w9s6Wq9dAmokO/K28W/IiHkHtjaEM5ME=;
 b=NP7cW1m4On6MktWWBbtKzCQM2VFrqaUMWubEGLMetl3zoXXoN2dZak8Bn2l8am0vZb
 QgBst9w8y56fjq7703idgq03ERs4CWYbX/4iNjfjICy2mPgfY+HeZZlV1fPcx71iDxt0
 zuQVJGEmaNsjIGVohqt3dEJ3cVrYWrAL/QYvOiDLR/DDhmnLFurFW5UrybLaAQ4fT6vt
 SDlPTR0SYeAkTUSop9j9Eaj5py4qaBWvzVrGmj/Vi1AuktDuHrqbFEGcYrPYgUzlIN0Q
 7hN8ky4DN4R+VIkPqClI6k6T9w/s5HHU3hqS/sJ5aaP6E/9FvsTlP8KNCW5xT2eAEa1p
 F1zw==
X-Gm-Message-State: ACgBeo0zlrcG9xiRlciJcn9m2PF/P2RdV7rrPyEFTx+95z37KV4S/hQZ
 kV+j8Em7VRwjk/gR28CiAQk=
X-Google-Smtp-Source: AA6agR7q+CtAcO/DDOc2kRy14OQa8IBtv+BG/opOnezfgJNoZTkmulwwBzEs3nPe1LQf4fhRFw0x1g==
X-Received: by 2002:ab0:5781:0:b0:37b:de3d:5d4e with SMTP id
 x1-20020ab05781000000b0037bde3d5d4emr9223629uaa.1.1659518729469; 
 Wed, 03 Aug 2022 02:25:29 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:52e2:fb25:323c:5709:7237?
 ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 o141-20020a1f4193000000b003776a46bd85sm5583882vka.56.2022.08.03.02.25.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 02:25:29 -0700 (PDT)
Message-ID: <24245f01-1507-0e67-5118-800cb19228f1@gmail.com>
Date: Wed, 3 Aug 2022 06:25:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 11/19] ppc/ppc405: QOM'ify DMA
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-12-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220801131039.1693913-12-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x931.google.com
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

>   hw/ppc/ppc405.h    | 23 +++++++++++++
>   hw/ppc/ppc405_uc.c | 80 +++++++++++++++++++++++++++++-----------------
>   2 files changed, 73 insertions(+), 30 deletions(-)
> 
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index 46366c3b8a19..bd662b2444ff 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -65,6 +65,28 @@ struct ppc4xx_bd_info_t {
>   
>   typedef struct Ppc405SoCState Ppc405SoCState;
>   
> +
> +
> +/* DMA controller */
> +#define TYPE_PPC405_DMA "ppc405-dma"
> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405DmaState, PPC405_DMA);
> +struct Ppc405DmaState {
> +    SysBusDevice parent_obj;
> +
> +    PowerPCCPU *cpu;
> +
> +    qemu_irq irqs[4];
> +    uint32_t cr[4];
> +    uint32_t ct[4];
> +    uint32_t da[4];
> +    uint32_t sa[4];
> +    uint32_t sg[4];
> +    uint32_t sr;
> +    uint32_t sgc;
> +    uint32_t slp;
> +    uint32_t pol;
> +};
> +
>   /* GPIO */
>   #define TYPE_PPC405_GPIO "ppc405-gpio"
>   OBJECT_DECLARE_SIMPLE_TYPE(Ppc405GpioState, PPC405_GPIO);
> @@ -180,6 +202,7 @@ struct Ppc405SoCState {
>       Ppc405GptState gpt;
>       Ppc405OcmState ocm;
>       Ppc405GpioState gpio;
> +    Ppc405DmaState dma;
>   };
>   
>   /* PowerPC 405 core */
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index a6c4e6934ffc..2978a2665a4f 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -613,35 +613,20 @@ enum {
>       DMA0_POL = 0x126,
>   };
>   
> -typedef struct ppc405_dma_t ppc405_dma_t;
> -struct ppc405_dma_t {
> -    qemu_irq irqs[4];
> -    uint32_t cr[4];
> -    uint32_t ct[4];
> -    uint32_t da[4];
> -    uint32_t sa[4];
> -    uint32_t sg[4];
> -    uint32_t sr;
> -    uint32_t sgc;
> -    uint32_t slp;
> -    uint32_t pol;
> -};
> -
> -static uint32_t dcr_read_dma (void *opaque, int dcrn)
> +static uint32_t dcr_read_dma(void *opaque, int dcrn)
>   {
>       return 0;
>   }
>   
> -static void dcr_write_dma (void *opaque, int dcrn, uint32_t val)
> +static void dcr_write_dma(void *opaque, int dcrn, uint32_t val)
>   {
>   }
>   
> -static void ppc405_dma_reset (void *opaque)
> +static void ppc405_dma_reset(DeviceState *dev)
>   {
> -    ppc405_dma_t *dma;
> +    Ppc405DmaState *dma = PPC405_DMA(dev);
>       int i;
>   
> -    dma = opaque;
>       for (i = 0; i < 4; i++) {
>           dma->cr[i] = 0x00000000;
>           dma->ct[i] = 0x00000000;
> @@ -655,13 +640,20 @@ static void ppc405_dma_reset (void *opaque)
>       dma->pol = 0x00000000;
>   }
>   
> -static void ppc405_dma_init(CPUPPCState *env, qemu_irq irqs[4])
> +static void ppc405_dma_realize(DeviceState *dev, Error **errp)
>   {
> -    ppc405_dma_t *dma;
> +    Ppc405DmaState *dma = PPC405_DMA(dev);
> +    CPUPPCState *env;
> +    int i;
> +
> +    assert(dma->cpu);
> +
> +    env = &dma->cpu->env;
> +
> +    for (i = 0; i < ARRAY_SIZE(dma->irqs); i++) {
> +        sysbus_init_irq(SYS_BUS_DEVICE(dma), &dma->irqs[i]);
> +    }
>   
> -    dma = g_new0(ppc405_dma_t, 1);
> -    memcpy(dma->irqs, irqs, 4 * sizeof(qemu_irq));
> -    qemu_register_reset(&ppc405_dma_reset, dma);
>       ppc_dcr_register(env, DMA0_CR0,
>                        dma, &dcr_read_dma, &dcr_write_dma);
>       ppc_dcr_register(env, DMA0_CT0,
> @@ -712,6 +704,22 @@ static void ppc405_dma_init(CPUPPCState *env, qemu_irq irqs[4])
>                        dma, &dcr_read_dma, &dcr_write_dma);
>   }
>   
> +static Property ppc405_dma_properties[] = {
> +    DEFINE_PROP_LINK("cpu", Ppc405DmaState, cpu, TYPE_POWERPC_CPU,
> +                     PowerPCCPU *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void ppc405_dma_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = ppc405_dma_realize;
> +    dc->user_creatable = false;
> +    dc->reset = ppc405_dma_reset;
> +    device_class_set_props(dc, ppc405_dma_properties);
> +}
> +
>   /*****************************************************************************/
>   static uint64_t ppc405_gpio_read(void *opaque, hwaddr addr, unsigned size)
>   {
> @@ -1408,12 +1416,14 @@ static void ppc405_soc_instance_init(Object *obj)
>       object_initialize_child(obj, "ocm", &s->ocm, TYPE_PPC405_OCM);
>   
>       object_initialize_child(obj, "gpio", &s->gpio, TYPE_PPC405_GPIO);
> +
> +    object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
>   }
>   
>   static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>   {
>       Ppc405SoCState *s = PPC405_SOC(dev);
> -    qemu_irq dma_irqs[4], mal_irqs[4];
> +    qemu_irq mal_irqs[4];
>       CPUPPCState *env;
>       Error *err = NULL;
>       int i;
> @@ -1485,11 +1495,16 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>       ppc405_ebc_init(env);
>   
>       /* DMA controller */
> -    dma_irqs[0] = qdev_get_gpio_in(s->uic, 5);
> -    dma_irqs[1] = qdev_get_gpio_in(s->uic, 6);
> -    dma_irqs[2] = qdev_get_gpio_in(s->uic, 7);
> -    dma_irqs[3] = qdev_get_gpio_in(s->uic, 8);
> -    ppc405_dma_init(env, dma_irqs);
> +    object_property_set_link(OBJECT(&s->dma), "cpu", OBJECT(&s->cpu),
> +                             &error_abort);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->dma), errp)) {
> +        return;
> +    }
> +
> +    for (i = 0; i < ARRAY_SIZE(s->dma.irqs); i++) {
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), i,
> +                           qdev_get_gpio_in(s->uic, 5 + i));
> +    }
>   
>       /* I2C controller */
>       sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500,
> @@ -1563,6 +1578,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
>   
>   static const TypeInfo ppc405_types[] = {
>       {
> +        .name           = TYPE_PPC405_DMA,
> +        .parent         = TYPE_SYS_BUS_DEVICE,
> +        .instance_size  = sizeof(Ppc405DmaState),
> +        .class_init     = ppc405_dma_class_init,
> +    }, {
>           .name           = TYPE_PPC405_GPIO,
>           .parent         = TYPE_SYS_BUS_DEVICE,
>           .instance_size  = sizeof(Ppc405GpioState),

