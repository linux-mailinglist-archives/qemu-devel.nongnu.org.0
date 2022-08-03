Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702A158894C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 11:22:04 +0200 (CEST)
Received: from localhost ([::1]:57092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJAZm-0006Ic-MZ
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 05:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAS9-0001ut-S4; Wed, 03 Aug 2022 05:14:09 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:38632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAS7-0008JQ-Ek; Wed, 03 Aug 2022 05:14:09 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id 125so17190182vsd.5;
 Wed, 03 Aug 2022 02:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=0rOB6x4mYrs8DFvU+9BkMRVKQ+21cZbwYqnzyB8utWA=;
 b=G+WAjTzUjdeEzjJtgYaPpPj0XGYCFZKMClG3VHVslVTQ4xBAGckZl52OasSbgtJ06x
 w+wWwkGvQy+YXSHUsOnIh06BTk6B3Kb0r3u6Hy5gb8/owT4wFhrYVPVJ0iiakyUhkqOB
 fHRtdEuWFgdDceUtPIvPDCTYRTuTN55DUkpigKAoTI5DIYhks5Pb1jDf0trmqkzYfvPa
 ukoGblIMSw7y69CC43ZB7UAwVSnUU9HE+cwwtUeuhYwQnSvkLkdlkwF1kwUbGeJcXhhf
 r/IMATXoRhCgIahIomBWX2adKhWnU02yL1QUWTmF7vH6ao5LLcAh3+KDqumF5ykAEid0
 9gwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=0rOB6x4mYrs8DFvU+9BkMRVKQ+21cZbwYqnzyB8utWA=;
 b=GgS8WtRl777IC2QepA8u6hiCuImtJGbaUPYPf2J4aCzeVD+QITrYxuL7reHbHND4G3
 6NHHR4HSnK/9o+Qpv9c5wE7vUY1AmHZ+Nf7054Zfzsgwi7o8puyWZ/m2Qp05hHW/TNz/
 fMQpcYVhBon2H1y7vInlU09LV/JQ0fU8q56HkGvwccuFfFPE9S9KOzRZqLVBzzAWTVuQ
 7VogxC25UeiVTKxnFMnhzZmG9UrkjlHJshCuJY33iSWVAlYAyR0M13AZE1d8D+7lTiiI
 vVBjvmoj4qyXMyjWfsfmQbnXBma92Bv54VCbced3JYHwthhOO3+4xA8yvGQ5mXPThCfH
 040Q==
X-Gm-Message-State: ACgBeo0TJcLpWWNod6CEGP2uRm73SbDQIZnzK+5HUmI3MECwzdvgwF/6
 W+RET9WwA54P7/rAM/15WnXpS8HIvQo=
X-Google-Smtp-Source: AA6agR4gRPPNR6n0XikY6em8xi8lqNHP4X7RiBu1yg8eDwImy1PWiCbSwHrsbkYpHzJENOUhvNs5NQ==
X-Received: by 2002:a67:e9c2:0:b0:385:8f3:23c1 with SMTP id
 q2-20020a67e9c2000000b0038508f323c1mr5427463vso.63.1659518045977; 
 Wed, 03 Aug 2022 02:14:05 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:52e2:fb25:323c:5709:7237?
 ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 b25-20020ab06659000000b0038799595a89sm692406uaq.37.2022.08.03.02.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 02:14:05 -0700 (PDT)
Message-ID: <3ebf2ccd-7b06-dfea-c48f-bee921f8f828@gmail.com>
Date: Wed, 3 Aug 2022 06:14:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 07/19] ppc/ppc405: QOM'ify CPC
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-8-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220801131039.1693913-8-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2b.google.com
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
> Since all clock settings are now handled at the CPC level, this changes
> the SoC "sys-clk" property to be an alias on the same property in the
> CPC model.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/ppc/ppc405.h    |  39 +++++++++++++++-
>   hw/ppc/ppc405_uc.c | 109 +++++++++++++++++++--------------------------
>   2 files changed, 85 insertions(+), 63 deletions(-)
> 
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index 4e99ab48be36..d51fb5094e95 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -63,6 +63,43 @@ struct ppc4xx_bd_info_t {
>       uint32_t bi_iic_fast[2];
>   };
>   
> +typedef struct Ppc405SoCState Ppc405SoCState;
> +
> +#define TYPE_PPC405_CPC "ppc405-cpc"
> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405CpcState, PPC405_CPC);
> +
> +enum {
> +    PPC405EP_CPU_CLK   = 0,
> +    PPC405EP_PLB_CLK   = 1,
> +    PPC405EP_OPB_CLK   = 2,
> +    PPC405EP_EBC_CLK   = 3,
> +    PPC405EP_MAL_CLK   = 4,
> +    PPC405EP_PCI_CLK   = 5,
> +    PPC405EP_UART0_CLK = 6,
> +    PPC405EP_UART1_CLK = 7,
> +    PPC405EP_CLK_NB    = 8,
> +};
> +
> +struct Ppc405CpcState {
> +    DeviceState parent_obj;
> +
> +    PowerPCCPU *cpu;
> +
> +    uint32_t sysclk;
> +    clk_setup_t clk_setup[PPC405EP_CLK_NB];
> +    uint32_t boot;
> +    uint32_t epctl;
> +    uint32_t pllmr[2];
> +    uint32_t ucr;
> +    uint32_t srr;
> +    uint32_t jtagid;
> +    uint32_t pci;
> +    /* Clock and power management */
> +    uint32_t er;
> +    uint32_t fr;
> +    uint32_t sr;
> +};
> +
>   #define TYPE_PPC405_SOC "ppc405-soc"
>   OBJECT_DECLARE_SIMPLE_TYPE(Ppc405SoCState, PPC405_SOC);
>   
> @@ -79,9 +116,9 @@ struct Ppc405SoCState {
>       MemoryRegion *dram_mr;
>       hwaddr ram_size;
>   
> -    uint32_t sysclk;
>       PowerPCCPU cpu;
>       DeviceState *uic;
> +    Ppc405CpcState cpc;
>   };
>   
>   /* PowerPC 405 core */
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index b84749b36114..20a3e5543423 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -1178,36 +1178,7 @@ enum {
>   #endif
>   };
>   
> -enum {
> -    PPC405EP_CPU_CLK   = 0,
> -    PPC405EP_PLB_CLK   = 1,
> -    PPC405EP_OPB_CLK   = 2,
> -    PPC405EP_EBC_CLK   = 3,
> -    PPC405EP_MAL_CLK   = 4,
> -    PPC405EP_PCI_CLK   = 5,
> -    PPC405EP_UART0_CLK = 6,
> -    PPC405EP_UART1_CLK = 7,
> -    PPC405EP_CLK_NB    = 8,
> -};
> -
> -typedef struct ppc405ep_cpc_t ppc405ep_cpc_t;
> -struct ppc405ep_cpc_t {
> -    uint32_t sysclk;
> -    clk_setup_t clk_setup[PPC405EP_CLK_NB];
> -    uint32_t boot;
> -    uint32_t epctl;
> -    uint32_t pllmr[2];
> -    uint32_t ucr;
> -    uint32_t srr;
> -    uint32_t jtagid;
> -    uint32_t pci;
> -    /* Clock and power management */
> -    uint32_t er;
> -    uint32_t fr;
> -    uint32_t sr;
> -};
> -
> -static void ppc405ep_compute_clocks (ppc405ep_cpc_t *cpc)
> +static void ppc405ep_compute_clocks(Ppc405CpcState *cpc)
>   {
>       uint32_t CPU_clk, PLB_clk, OPB_clk, EBC_clk, MAL_clk, PCI_clk;
>       uint32_t UART0_clk, UART1_clk;
> @@ -1302,10 +1273,9 @@ static void ppc405ep_compute_clocks (ppc405ep_cpc_t *cpc)
>   
>   static uint32_t dcr_read_epcpc (void *opaque, int dcrn)
>   {
> -    ppc405ep_cpc_t *cpc;
> +    Ppc405CpcState *cpc = PPC405_CPC(opaque);
>       uint32_t ret;
>   
> -    cpc = opaque;
>       switch (dcrn) {
>       case PPC405EP_CPC0_BOOT:
>           ret = cpc->boot;
> @@ -1342,9 +1312,8 @@ static uint32_t dcr_read_epcpc (void *opaque, int dcrn)
>   
>   static void dcr_write_epcpc (void *opaque, int dcrn, uint32_t val)
>   {
> -    ppc405ep_cpc_t *cpc;
> +    Ppc405CpcState *cpc = PPC405_CPC(opaque);
>   
> -    cpc = opaque;
>       switch (dcrn) {
>       case PPC405EP_CPC0_BOOT:
>           /* Read-only register */
> @@ -1377,9 +1346,9 @@ static void dcr_write_epcpc (void *opaque, int dcrn, uint32_t val)
>       }
>   }
>   
> -static void ppc405ep_cpc_reset (void *opaque)
> +static void ppc405_cpc_reset(DeviceState *dev)
>   {
> -    ppc405ep_cpc_t *cpc = opaque;
> +    Ppc405CpcState *cpc = PPC405_CPC(dev);
>   
>       cpc->boot = 0x00000010;     /* Boot from PCI - IIC EEPROM disabled */
>       cpc->epctl = 0x00000000;
> @@ -1391,21 +1360,24 @@ static void ppc405ep_cpc_reset (void *opaque)
>       cpc->er = 0x00000000;
>       cpc->fr = 0x00000000;
>       cpc->sr = 0x00000000;
> +    cpc->jtagid = 0x20267049;
>       ppc405ep_compute_clocks(cpc);
>   }
>   
>   /* XXX: sysclk should be between 25 and 100 MHz */
> -static void ppc405ep_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[8],
> -                               uint32_t sysclk)
> +static void ppc405_cpc_realize(DeviceState *dev, Error **errp)
>   {
> -    ppc405ep_cpc_t *cpc;
> +    Ppc405CpcState *cpc = PPC405_CPC(dev);
> +    CPUPPCState *env;
> +
> +    assert(cpc->cpu);
> +
> +    env = &cpc->cpu->env;
> +
> +    cpc->clk_setup[PPC405EP_CPU_CLK].cb =
> +        ppc_40x_timers_init(env, cpc->sysclk, PPC_INTERRUPT_PIT);
> +    cpc->clk_setup[PPC405EP_CPU_CLK].opaque = env;
>   
> -    cpc = g_new0(ppc405ep_cpc_t, 1);
> -    memcpy(cpc->clk_setup, clk_setup,
> -           PPC405EP_CLK_NB * sizeof(clk_setup_t));
> -    cpc->jtagid = 0x20267049;
> -    cpc->sysclk = sysclk;
> -    qemu_register_reset(&ppc405ep_cpc_reset, cpc);
>       ppc_dcr_register(env, PPC405EP_CPC0_BOOT, cpc,
>                        &dcr_read_epcpc, &dcr_write_epcpc);
>       ppc_dcr_register(env, PPC405EP_CPC0_EPCTL, cpc,
> @@ -1422,14 +1394,23 @@ static void ppc405ep_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[8],
>                        &dcr_read_epcpc, &dcr_write_epcpc);
>       ppc_dcr_register(env, PPC405EP_CPC0_PCI, cpc,
>                        &dcr_read_epcpc, &dcr_write_epcpc);
> -#if 0
> -    ppc_dcr_register(env, PPC405EP_CPC0_ER, cpc,
> -                     &dcr_read_epcpc, &dcr_write_epcpc);
> -    ppc_dcr_register(env, PPC405EP_CPC0_FR, cpc,
> -                     &dcr_read_epcpc, &dcr_write_epcpc);
> -    ppc_dcr_register(env, PPC405EP_CPC0_SR, cpc,
> -                     &dcr_read_epcpc, &dcr_write_epcpc);
> -#endif
> +}
> +
> +static Property ppc405_cpc_properties[] = {
> +    DEFINE_PROP_LINK("cpu", Ppc405CpcState, cpu, TYPE_POWERPC_CPU,
> +                     PowerPCCPU *),
> +    DEFINE_PROP_UINT32("sys-clk", Ppc405CpcState, sysclk, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void ppc405_cpc_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = ppc405_cpc_realize;
> +    dc->user_creatable = false;
> +    dc->reset = ppc405_cpc_reset;
> +    device_class_set_props(dc, ppc405_cpc_properties);
>   }
>   
>   static void ppc405_soc_instance_init(Object *obj)
> @@ -1438,12 +1419,14 @@ static void ppc405_soc_instance_init(Object *obj)
>   
>       object_initialize_child(obj, "cpu", &s->cpu,
>                               POWERPC_CPU_TYPE_NAME("405ep"));
> +
> +    object_initialize_child(obj, "cpc", &s->cpc, TYPE_PPC405_CPC);
> +    object_property_add_alias(obj, "sys-clk", OBJECT(&s->cpc), "sys-clk");
>   }
>   
>   static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>   {
>       Ppc405SoCState *s = PPC405_SOC(dev);
> -    clk_setup_t clk_setup[PPC405EP_CLK_NB];
>       qemu_irq dma_irqs[4], gpt_irqs[5], mal_irqs[4];
>       CPUPPCState *env;
>       Error *err = NULL;
> @@ -1467,8 +1450,6 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>       memory_region_add_subregion(get_system_memory(), PPC405EP_SRAM_BASE,
>                                   &s->sram);
>   
> -    memset(clk_setup, 0, sizeof(clk_setup));
> -
>       /* init CPUs */
>       if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
>           return;
> @@ -1476,14 +1457,14 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>   
>       env = &s->cpu.env;
>   
> -    clk_setup[PPC405EP_CPU_CLK].cb =
> -        ppc_40x_timers_init(env, s->sysclk, PPC_INTERRUPT_PIT);
> -    clk_setup[PPC405EP_CPU_CLK].opaque = env;
> -
>       ppc_dcr_init(env, NULL, NULL);
>   
>       /* CPU control */
> -    ppc405ep_cpc_init(env, clk_setup, s->sysclk);
> +    object_property_set_link(OBJECT(&s->cpc), "cpu", OBJECT(&s->cpu),
> +                             &error_abort);
> +      if (!qdev_realize(DEVICE(&s->cpc), NULL, errp)) {
> +        return;
> +    }

This if seems misaligned. Otherwise LGTM.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   
>       /* PLB arbitrer */
>       ppc4xx_plb_init(env);
> @@ -1568,7 +1549,6 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>   static Property ppc405_soc_properties[] = {
>       DEFINE_PROP_LINK("dram", Ppc405SoCState, dram_mr, TYPE_MEMORY_REGION,
>                        MemoryRegion *),
> -    DEFINE_PROP_UINT32("sys-clk", Ppc405SoCState, sysclk, 0),
>       DEFINE_PROP_BOOL("dram-init", Ppc405SoCState, do_dram_init, 0),
>       DEFINE_PROP_UINT64("ram-size", Ppc405SoCState, ram_size, 0),
>       DEFINE_PROP_END_OF_LIST(),
> @@ -1585,6 +1565,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
>   
>   static const TypeInfo ppc405_types[] = {
>       {
> +        .name           = TYPE_PPC405_CPC,
> +        .parent         = TYPE_DEVICE,
> +        .instance_size  = sizeof(Ppc405CpcState),
> +        .class_init     = ppc405_cpc_class_init,
> +    }, {
>           .name           = TYPE_PPC405_SOC,
>           .parent         = TYPE_DEVICE,
>           .instance_size  = sizeof(Ppc405SoCState),

