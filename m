Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1519058898D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 11:41:35 +0200 (CEST)
Received: from localhost ([::1]:53168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJAsg-0006jt-6H
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 05:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAep-0001ir-KA; Wed, 03 Aug 2022 05:27:15 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31]:45631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAen-0003No-Jt; Wed, 03 Aug 2022 05:27:15 -0400
Received: by mail-vs1-xe31.google.com with SMTP id m67so9651089vsc.12;
 Wed, 03 Aug 2022 02:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=bn2/s5ck35ysRAY339moVqiRRDq0Bq2XNm3hvosSouE=;
 b=mAAHlzz134j4t7CCwT1ZVsVGQXTcULzwYPHCxKEjSxXBHGoUJ5I+3M0an5f5+Z9CGX
 nOVj4UjoDQVbZxy8CRpnWM0k7kmNJc2LsADn6McJqPnK18SlSVysLgF36Qa3a18JTMe/
 p25kz8NiOcBeeS0pr1NztmjHXswboAhYT58goQ3NsIKNE0d553lyFotIiF+HSjNagz+V
 B/JfKIa3Lxx/oX4uPg2km9UGihNH+XbsKIpfQ5WEpZHDmnbaXCkQQ/W0XzFkCGGyz5UV
 RDFvQipWZZOkHvTOpEAmKhW4W9CEKJH0Ze++5nao31jCqllpAtwAqC9SwBsdKw6v5QPp
 LNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=bn2/s5ck35ysRAY339moVqiRRDq0Bq2XNm3hvosSouE=;
 b=2wVUDwNnStdSixxDzxPN+0rbResIsfSLLpq0S5kiwLbvngRP7FZF5+ba3wHV569KAv
 PcQgL6KWTLRIYBhY7mSYjuyYtNvAfu0NRIyTclJA8uBP11KkxK1avHKB4YQc2S5G3dj/
 e1qz4nBqxUYx4qEmxoI7wdaGgSL3zsYwhFXmyTXNCBX43rxjZDqfOufA6SBwWVd1KtpF
 WvylETjJy4ASu2GZ+NlkoAZb2JUFOpIqn5JOde1gcvzyGtFKlSCMwkg6RYvoa+UVPC41
 iAociITTEPqfj1Cldu9KvXqd4aIG+4eDXetzso2aPr5La/57SqQ4IGEMKI1S0Nao6V8v
 63AA==
X-Gm-Message-State: ACgBeo0O9+IRMhn96KoFDMRfrbUbN43v+JrbBwOPyJjsAREYzGpuqvGC
 TgISPTYVJmeFIEBnZ7KxVX5aLpb8qCU=
X-Google-Smtp-Source: AA6agR6jn4ejfWIDHbNZpbOo5/wzdPf6WKVwm7T6QDTjpcvcPVHV/u16c54gK3/UBg0+ldr1pS4T0A==
X-Received: by 2002:a05:6102:3570:b0:37c:e2d1:5c5a with SMTP id
 bh16-20020a056102357000b0037ce2d15c5amr6489997vsb.30.1659518832412; 
 Wed, 03 Aug 2022 02:27:12 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:52e2:fb25:323c:5709:7237?
 ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 o2-20020ab01c42000000b003843ad3b42fsm9949082uaj.5.2022.08.03.02.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 02:27:12 -0700 (PDT)
Message-ID: <cf715a4a-5ff2-9c5b-f9d6-0d7d1c9df3e4@gmail.com>
Date: Wed, 3 Aug 2022 06:27:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 13/19] ppc/ppc405: QOM'ify OPBA
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-14-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220801131039.1693913-14-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe31.google.com
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

>   hw/ppc/ppc405.h    | 12 ++++++++++++
>   hw/ppc/ppc405_uc.c | 47 +++++++++++++++++++++++++++-------------------
>   2 files changed, 40 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index f1acb37185f5..ebff00bdad80 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -65,6 +65,17 @@ struct ppc4xx_bd_info_t {
>   
>   typedef struct Ppc405SoCState Ppc405SoCState;
>   
> +/* OPB arbitrer */
> +#define TYPE_PPC405_OPBA "ppc405-opba"
> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405OpbaState, PPC405_OPBA);
> +struct Ppc405OpbaState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion io;
> +    uint8_t cr;
> +    uint8_t pr;
> +};
> +
>   /* Peripheral controller */
>   #define TYPE_PPC405_EBC "ppc405-ebc"
>   OBJECT_DECLARE_SIMPLE_TYPE(Ppc405EbcState, PPC405_EBC);
> @@ -219,6 +230,7 @@ struct Ppc405SoCState {
>       Ppc405GpioState gpio;
>       Ppc405DmaState dma;
>       Ppc405EbcState ebc;
> +    Ppc405OpbaState opba;
>   };
>   
>   /* PowerPC 405 core */
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index 8d73b8c2dff0..c5de00de7981 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -310,16 +310,10 @@ static void ppc4xx_pob_init(CPUPPCState *env)
>   
>   /*****************************************************************************/
>   /* OPB arbitrer */
> -typedef struct ppc4xx_opba_t ppc4xx_opba_t;
> -struct ppc4xx_opba_t {
> -    MemoryRegion io;
> -    uint8_t cr;
> -    uint8_t pr;
> -};
>   
>   static uint64_t opba_readb(void *opaque, hwaddr addr, unsigned size)
>   {
> -    ppc4xx_opba_t *opba = opaque;
> +    Ppc405OpbaState *opba = PPC405_OPBA(opaque);
>       uint32_t ret;
>   
>       switch (addr) {
> @@ -341,7 +335,7 @@ static uint64_t opba_readb(void *opaque, hwaddr addr, unsigned size)
>   static void opba_writeb(void *opaque, hwaddr addr, uint64_t value,
>                           unsigned size)
>   {
> -    ppc4xx_opba_t *opba = opaque;
> +    Ppc405OpbaState *opba = PPC405_OPBA(opaque);
>   
>       trace_opba_writeb(addr, value);
>   
> @@ -366,25 +360,30 @@ static const MemoryRegionOps opba_ops = {
>       .endianness = DEVICE_BIG_ENDIAN,
>   };
>   
> -static void ppc4xx_opba_reset (void *opaque)
> +static void ppc405_opba_reset(DeviceState *dev)
>   {
> -    ppc4xx_opba_t *opba;
> +    Ppc405OpbaState *opba = PPC405_OPBA(dev);
>   
> -    opba = opaque;
>       opba->cr = 0x00; /* No dynamic priorities - park disabled */
>       opba->pr = 0x11;
>   }
>   
> -static void ppc4xx_opba_init(hwaddr base)
> +static void ppc405_opba_realize(DeviceState *dev, Error **errp)
>   {
> -    ppc4xx_opba_t *opba;
> +    Ppc405OpbaState *s = PPC405_OPBA(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>   
> -    trace_opba_init(base);
> +    memory_region_init_io(&s->io, OBJECT(s), &opba_ops, s, "opba", 0x002);
> +    sysbus_init_mmio(sbd, &s->io);
> +}
> +
> +static void ppc405_opba_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
>   
> -    opba = g_new0(ppc4xx_opba_t, 1);
> -    memory_region_init_io(&opba->io, NULL, &opba_ops, opba, "opba", 0x002);
> -    memory_region_add_subregion(get_system_memory(), base, &opba->io);
> -    qemu_register_reset(ppc4xx_opba_reset, opba);
> +    dc->realize = ppc405_opba_realize;
> +    dc->reset = ppc405_opba_reset;
> +    dc->user_creatable = false;
>   }
>   
>   /*****************************************************************************/
> @@ -1434,6 +1433,8 @@ static void ppc405_soc_instance_init(Object *obj)
>       object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
>   
>       object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
> +
> +    object_initialize_child(obj, "opba", &s->opba, TYPE_PPC405_OPBA);
>   }
>   
>   static void ppc405_soc_realize(DeviceState *dev, Error **errp)
> @@ -1486,7 +1487,10 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>       ppc4xx_pob_init(env);
>   
>       /* OBP arbitrer */
> -    ppc4xx_opba_init(0xef600600);
> +   if (!sysbus_realize(SYS_BUS_DEVICE(&s->opba), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->opba), 0, 0xef600600);
>   
>       /* Universal interrupt controller */
>       s->uic = qdev_new(TYPE_PPC_UIC);
> @@ -1598,6 +1602,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
>   
>   static const TypeInfo ppc405_types[] = {
>       {
> +        .name           = TYPE_PPC405_OPBA,
> +        .parent         = TYPE_SYS_BUS_DEVICE,
> +        .instance_size  = sizeof(Ppc405OpbaState),
> +        .class_init     = ppc405_opba_class_init,
> +    }, {
>           .name           = TYPE_PPC405_EBC,
>           .parent         = TYPE_DEVICE,
>           .instance_size  = sizeof(Ppc405EbcState),

