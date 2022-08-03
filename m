Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A14635889FA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 11:58:26 +0200 (CEST)
Received: from localhost ([::1]:48248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJB8z-00064X-P7
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 05:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAuS-0000Ed-EX; Wed, 03 Aug 2022 05:43:24 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:36691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAuQ-0007O1-Kk; Wed, 03 Aug 2022 05:43:24 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-10ea9ef5838so14748553fac.3; 
 Wed, 03 Aug 2022 02:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=MYSrmTJEI6fh4/FCrBFGOxNKsCz8d1Ma+STMst43jtU=;
 b=S4cfJc68jBfaWB1Oeu1Zktz45VTyTzFb+sVALXcsWCrEfQ0CBYkzkeWDl1p8igy8fN
 xeZNpzZQaITc8xuwy820bisY8M+8RpURKxZvExOAlSeN1ZwADA5ikZpGY2jXZk9q8i3e
 /yTzfjsk+lkY5EMWIJIzSKlx0eEYdm7+6YfnziqzLm2DdW6rfFjZjxFsOFfi5wPFTBn2
 FnjtjRuw25Y2RNRN8ITFjdDsSboi7tgmvhSRKI/82DFFSmICmxtA+PultsDUuDYFIApe
 hBwosbWQzcQ/vk3+Wj1XLiNuptc4dzxEIP2L+FEDpY3Xv7XEzMAK0BxuEsTYLv6DtKxg
 hTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=MYSrmTJEI6fh4/FCrBFGOxNKsCz8d1Ma+STMst43jtU=;
 b=ZmGf8QiOZJdp6P8Tb7yKfCREKeI9oMJKc77j3foBFoAfv8M7OjT0MO7q2lWRTWXEVP
 GgYxPJvm6pKEM1THXlZQhIslrebLt14rB7pS+QInsl9FyVXeKs5kHKOZt7XUncwJ+FOY
 NTB31DzXHcgFr1q9diIxexjHXuZRqFHV2N9sJOlNxby3RJclajDAYiKpOhrAzuqgEe9e
 TDYiHKuNdIYRto8eIkIHhHhlawYUbIs/DlvK4gQvTqF37sgNIdHqZ4K+c8r576IyswKA
 ZbFbSQKL8i2tTEsccnAuUOmiK+EAx87+vCb16FoAL9VBRn8laF1X2wBvoCMdWpgfu9P0
 sFlg==
X-Gm-Message-State: ACgBeo1DsvI1ylwpRjlOkjwCBmdMenmcqkRAgWTDLsJ7SVo5O4PZ6s0+
 s6IYdMf4gURK4zuKiVey6/U=
X-Google-Smtp-Source: AA6agR6hSlWxgS/pq0Knz/neZ/qcEwlOW6EfBZbsVVBRg7gdTblZA3IgK+tMrq37MrvEfe3EW3j3yQ==
X-Received: by 2002:a05:6870:8902:b0:101:a2a3:479c with SMTP id
 i2-20020a056870890200b00101a2a3479cmr1508521oao.215.1659519801064; 
 Wed, 03 Aug 2022 02:43:21 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:52e2:fb25:323c:5709:7237?
 ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a4a98d1000000b00440b3e215cesm819747ooj.46.2022.08.03.02.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 02:43:20 -0700 (PDT)
Message-ID: <ca69e7de-6369-0fd0-8f12-101fa3fbb8bd@gmail.com>
Date: Wed, 3 Aug 2022 06:43:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 15/19] ppc/ppc405: QOM'ify PLB
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-16-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220801131039.1693913-16-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
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
>   hw/ppc/ppc405.h    | 14 ++++++++++
>   hw/ppc/ppc405_uc.c | 67 +++++++++++++++++++++++++++++++++-------------
>   2 files changed, 62 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index d39d65cc86e4..4ff5cdcf5c65 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -65,6 +65,19 @@ struct ppc4xx_bd_info_t {
>   
>   typedef struct Ppc405SoCState Ppc405SoCState;
>   
> +/* Peripheral local bus arbitrer */

I wasn't aware that arbitrer is a word. Google says that 'arbitrer' is an
old form of 'arbitrator'.

I looked it up because I thought you misspelled 'arbiter', which is the name
of a Protoss combat unit in Starcraft. And it happens to be a synonym of
'arbitrator' as well.

'arbitrer' is fine, don't worry about it.


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

> +#define TYPE_PPC405_PLB "ppc405-plb"
> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PlbState, PPC405_PLB);
> +struct Ppc405PlbState {
> +    DeviceState parent_obj;
> +
> +    PowerPCCPU *cpu;
> +
> +    uint32_t acr;
> +    uint32_t bear;
> +    uint32_t besr;
> +};
> +
>   /* PLB to OPB bridge */
>   #define TYPE_PPC405_POB "ppc405-pob"
>   OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PobState, PPC405_POB);
> @@ -245,6 +258,7 @@ struct Ppc405SoCState {
>       Ppc405EbcState ebc;
>       Ppc405OpbaState opba;
>       Ppc405PobState pob;
> +    Ppc405PlbState plb;
>   };
>   
>   /* PowerPC 405 core */
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index 218d911bca3c..45bcf3a6dd8a 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -148,19 +148,11 @@ enum {
>       PLB4A1_ACR = 0x089,
>   };
>   
> -typedef struct ppc4xx_plb_t ppc4xx_plb_t;
> -struct ppc4xx_plb_t {
> -    uint32_t acr;
> -    uint32_t bear;
> -    uint32_t besr;
> -};
> -
>   static uint32_t dcr_read_plb (void *opaque, int dcrn)
>   {
> -    ppc4xx_plb_t *plb;
> +    Ppc405PlbState *plb = PPC405_PLB(opaque);
>       uint32_t ret;
>   
> -    plb = opaque;
>       switch (dcrn) {
>       case PLB0_ACR:
>           ret = plb->acr;
> @@ -182,9 +174,8 @@ static uint32_t dcr_read_plb (void *opaque, int dcrn)
>   
>   static void dcr_write_plb (void *opaque, int dcrn, uint32_t val)
>   {
> -    ppc4xx_plb_t *plb;
> +    Ppc405PlbState *plb = PPC405_PLB(opaque);
>   
> -    plb = opaque;
>       switch (dcrn) {
>       case PLB0_ACR:
>           /* We don't care about the actual parameters written as
> @@ -202,28 +193,55 @@ static void dcr_write_plb (void *opaque, int dcrn, uint32_t val)
>       }
>   }
>   
> -static void ppc4xx_plb_reset (void *opaque)
> +static void ppc405_plb_reset(DeviceState *dev)
>   {
> -    ppc4xx_plb_t *plb;
> +    Ppc405PlbState *plb = PPC405_PLB(dev);
>   
> -    plb = opaque;
>       plb->acr = 0x00000000;
>       plb->bear = 0x00000000;
>       plb->besr = 0x00000000;
>   }
>   
> -void ppc4xx_plb_init(CPUPPCState *env)
> +static void ppc405_plb_realize(DeviceState *dev, Error **errp)
>   {
> -    ppc4xx_plb_t *plb;
> +    Ppc405PlbState *plb = PPC405_PLB(dev);
> +    CPUPPCState *env;
> +
> +    assert(plb->cpu);
> +
> +    env = &plb->cpu->env;
>   
> -    plb = g_new0(ppc4xx_plb_t, 1);
>       ppc_dcr_register(env, PLB3A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
>       ppc_dcr_register(env, PLB4A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
>       ppc_dcr_register(env, PLB0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
>       ppc_dcr_register(env, PLB0_BEAR, plb, &dcr_read_plb, &dcr_write_plb);
>       ppc_dcr_register(env, PLB0_BESR, plb, &dcr_read_plb, &dcr_write_plb);
>       ppc_dcr_register(env, PLB4A1_ACR, plb, &dcr_read_plb, &dcr_write_plb);
> -    qemu_register_reset(ppc4xx_plb_reset, plb);
> +}
> +
> +static Property ppc405_plb_properties[] = {
> +    DEFINE_PROP_LINK("cpu", Ppc405PlbState, cpu, TYPE_POWERPC_CPU,
> +                     PowerPCCPU *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void ppc405_plb_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = ppc405_plb_realize;
> +    dc->user_creatable = false;
> +    dc->reset = ppc405_plb_reset;
> +    device_class_set_props(dc, ppc405_plb_properties);
> +}
> +
> +void ppc4xx_plb_init(CPUPPCState *env)
> +{
> +    PowerPCCPU *cpu = env_archcpu(env);
> +    DeviceState *dev = qdev_new(TYPE_PPC405_EBC);
> +
> +    object_property_set_link(OBJECT(cpu), "cpu", OBJECT(dev), &error_abort);
> +    qdev_realize_and_unref(dev, NULL, &error_fatal);
>   }
>   
>   /*****************************************************************************/
> @@ -1446,6 +1464,8 @@ static void ppc405_soc_instance_init(Object *obj)
>       object_initialize_child(obj, "opba", &s->opba, TYPE_PPC405_OPBA);
>   
>       object_initialize_child(obj, "pob", &s->pob, TYPE_PPC405_POB);
> +
> +    object_initialize_child(obj, "plb", &s->plb, TYPE_PPC405_PLB);
>   }
>   
>   static void ppc405_soc_realize(DeviceState *dev, Error **errp)
> @@ -1492,7 +1512,11 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>       }
>   
>       /* PLB arbitrer */
> -    ppc4xx_plb_init(env);
> +    object_property_set_link(OBJECT(&s->plb), "cpu", OBJECT(&s->cpu),
> +                             &error_abort);
> +    if (!qdev_realize(DEVICE(&s->plb), NULL, errp)) {
> +        return;
> +    }
>   
>       /* PLB to OPB bridge */
>       object_property_set_link(OBJECT(&s->pob), "cpu", OBJECT(&s->cpu),
> @@ -1617,6 +1641,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
>   
>   static const TypeInfo ppc405_types[] = {
>       {
> +        .name           = TYPE_PPC405_PLB,
> +        .parent         = TYPE_DEVICE,
> +        .instance_size  = sizeof(Ppc405PlbState),
> +        .class_init     = ppc405_plb_class_init,
> +    }, {
>           .name           = TYPE_PPC405_POB,
>           .parent         = TYPE_DEVICE,
>           .instance_size  = sizeof(Ppc405PobState),

