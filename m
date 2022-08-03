Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24DB588980
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 11:35:59 +0200 (CEST)
Received: from localhost ([::1]:46546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJAnG-0001tQ-Og
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 05:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAe4-0008UQ-O3; Wed, 03 Aug 2022 05:26:29 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31]:41666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAe2-0002GZ-SI; Wed, 03 Aug 2022 05:26:28 -0400
Received: by mail-vk1-xa31.google.com with SMTP id n15so8343951vkk.8;
 Wed, 03 Aug 2022 02:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=dPiko9bU18LalnkDeoOPo8n5rNNxphV9XnIwVbLH2Os=;
 b=cwzlx9IKXwUMEHQ6o1g6Th3khN9eBh4fyfEKbblEEJa1HSGNv87Rfzji6OOfu2R4ZI
 3V7YHrlg2JraKIq5Gg86w6iKGs57oX+2nfS/mmvplB0DXrq3caiKxcwV/G1erJer+hGH
 yPyh/fUakBKTNTvEd44oZRNKUuf+Bizu9Au7yMck8d9PywjTVMSgaD51JT0jIv+wgqzN
 ftNg9zlpJqO8NpQcIJS3oqQhSxWY3H2ifGywmUJqu9YJUHrrXVoo5obS3weApeMlhi45
 iVGrAqu4MR2wXT0U0YMqvSwD20/UsglRX/F7fcl2MX2jnQzWauPY+mWcFdV3Vsa6zlUF
 khVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=dPiko9bU18LalnkDeoOPo8n5rNNxphV9XnIwVbLH2Os=;
 b=PGeKSqzpjQlq0jDiv7IOHV0IaQo4wzgKgzp+rmxrc1J2ED5uU+TIlD5XAHGyjzgHlT
 7W9U01hj6wGBiNm52vT94K7czxHUNCust96yi/507NMd4/stf/XXD4FI5WCblUFq3B+g
 TrSO+kdRG4Ns+5r/YmtVFY3l5ByU5NwjBKtSKJxdwDL8p8VQKEh6fJQX4Mkpv0UgyiDq
 mvEc7oKPIWJJaeUcnxSqKRQ4J4xQ3mlcJgLhJmICP7luZnW0snS2fyWhMGGFjrf48TXb
 zGJZr677bEdVISm2lOfhmYFnBbOdR+wMHlnLeuMd6UsvUq1Ev0Q6KNt4cd+rr3Y8CAKW
 oTJQ==
X-Gm-Message-State: ACgBeo0t7jr3V0nkIPznvm1px9V96BQ0K5wxmVr7NKcvxGsnvGe18Ok3
 tNe9D/JLaJRzRDwxBo4z13w=
X-Google-Smtp-Source: AA6agR7mBuwhyQq4fFmswtVOPioaXqN4pnIsZajJ0eJHAgRz+ykAnQ50mS0P7oWpmvSgpIjkJWPuJA==
X-Received: by 2002:a1f:90cf:0:b0:377:4fcb:2bcd with SMTP id
 s198-20020a1f90cf000000b003774fcb2bcdmr5915484vkd.10.1659518785543; 
 Wed, 03 Aug 2022 02:26:25 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:52e2:fb25:323c:5709:7237?
 ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a67be13000000b003885a2f7a36sm264475vsq.5.2022.08.03.02.26.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 02:26:25 -0700 (PDT)
Message-ID: <4cc2954f-5e84-cdd2-d053-5e0ad0a156ef@gmail.com>
Date: Wed, 3 Aug 2022 06:26:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 12/19] ppc/ppc405: QOM'ify EBC
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-13-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220801131039.1693913-13-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa31.google.com
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

>   hw/ppc/ppc405.h    | 16 +++++++++++
>   hw/ppc/ppc405_uc.c | 71 +++++++++++++++++++++++++++++++---------------
>   2 files changed, 64 insertions(+), 23 deletions(-)
> 
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index bd662b2444ff..f1acb37185f5 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -65,7 +65,22 @@ struct ppc4xx_bd_info_t {
>   
>   typedef struct Ppc405SoCState Ppc405SoCState;
>   
> +/* Peripheral controller */
> +#define TYPE_PPC405_EBC "ppc405-ebc"
> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405EbcState, PPC405_EBC);
> +struct Ppc405EbcState {
> +    DeviceState parent_obj;
> +
> +    PowerPCCPU *cpu;
>   
> +    uint32_t addr;
> +    uint32_t bcr[8];
> +    uint32_t bap[8];
> +    uint32_t bear;
> +    uint32_t besr0;
> +    uint32_t besr1;
> +    uint32_t cfg;
> +};
>   
>   /* DMA controller */
>   #define TYPE_PPC405_DMA "ppc405-dma"
> @@ -203,6 +218,7 @@ struct Ppc405SoCState {
>       Ppc405OcmState ocm;
>       Ppc405GpioState gpio;
>       Ppc405DmaState dma;
> +    Ppc405EbcState ebc;
>   };
>   
>   /* PowerPC 405 core */
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index 2978a2665a4f..8d73b8c2dff0 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -393,17 +393,6 @@ static void ppc4xx_opba_init(hwaddr base)
>   
>   /*****************************************************************************/
>   /* Peripheral controller */
> -typedef struct ppc4xx_ebc_t ppc4xx_ebc_t;
> -struct ppc4xx_ebc_t {
> -    uint32_t addr;
> -    uint32_t bcr[8];
> -    uint32_t bap[8];
> -    uint32_t bear;
> -    uint32_t besr0;
> -    uint32_t besr1;
> -    uint32_t cfg;
> -};
> -
>   enum {
>       EBC0_CFGADDR = 0x012,
>       EBC0_CFGDATA = 0x013,
> @@ -411,10 +400,9 @@ enum {
>   
>   static uint32_t dcr_read_ebc (void *opaque, int dcrn)
>   {
> -    ppc4xx_ebc_t *ebc;
> +    Ppc405EbcState *ebc = PPC405_EBC(opaque);
>       uint32_t ret;
>   
> -    ebc = opaque;
>       switch (dcrn) {
>       case EBC0_CFGADDR:
>           ret = ebc->addr;
> @@ -496,9 +484,8 @@ static uint32_t dcr_read_ebc (void *opaque, int dcrn)
>   
>   static void dcr_write_ebc (void *opaque, int dcrn, uint32_t val)
>   {
> -    ppc4xx_ebc_t *ebc;
> +    Ppc405EbcState *ebc = PPC405_EBC(opaque);
>   
> -    ebc = opaque;
>       switch (dcrn) {
>       case EBC0_CFGADDR:
>           ebc->addr = val;
> @@ -554,12 +541,11 @@ static void dcr_write_ebc (void *opaque, int dcrn, uint32_t val)
>       }
>   }
>   
> -static void ebc_reset (void *opaque)
> +static void ppc405_ebc_reset(DeviceState *dev)
>   {
> -    ppc4xx_ebc_t *ebc;
> +    Ppc405EbcState *ebc = PPC405_EBC(dev);
>       int i;
>   
> -    ebc = opaque;
>       ebc->addr = 0x00000000;
>       ebc->bap[0] = 0x7F8FFE80;
>       ebc->bcr[0] = 0xFFE28000;
> @@ -572,18 +558,46 @@ static void ebc_reset (void *opaque)
>       ebc->cfg = 0x80400000;
>   }
>   
> -void ppc405_ebc_init(CPUPPCState *env)
> +static void ppc405_ebc_realize(DeviceState *dev, Error **errp)
>   {
> -    ppc4xx_ebc_t *ebc;
> +    Ppc405EbcState *ebc = PPC405_EBC(dev);
> +    CPUPPCState *env;
> +
> +    assert(ebc->cpu);
> +
> +    env = &ebc->cpu->env;
>   
> -    ebc = g_new0(ppc4xx_ebc_t, 1);
> -    qemu_register_reset(&ebc_reset, ebc);
>       ppc_dcr_register(env, EBC0_CFGADDR,
>                        ebc, &dcr_read_ebc, &dcr_write_ebc);
>       ppc_dcr_register(env, EBC0_CFGDATA,
>                        ebc, &dcr_read_ebc, &dcr_write_ebc);
>   }
>   
> +static Property ppc405_ebc_properties[] = {
> +    DEFINE_PROP_LINK("cpu", Ppc405EbcState, cpu, TYPE_POWERPC_CPU,
> +                     PowerPCCPU *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void ppc405_ebc_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = ppc405_ebc_realize;
> +    dc->user_creatable = false;
> +    dc->reset = ppc405_ebc_reset;
> +    device_class_set_props(dc, ppc405_ebc_properties);
> +}
> +
> +void ppc405_ebc_init(CPUPPCState *env)
> +{
> +    PowerPCCPU *cpu = env_archcpu(env);
> +    DeviceState *dev = qdev_new(TYPE_PPC405_EBC);
> +
> +    object_property_set_link(OBJECT(cpu), "cpu", OBJECT(dev), &error_abort);
> +    qdev_realize_and_unref(dev, NULL, &error_fatal);
> +}
> +
>   /*****************************************************************************/
>   /* DMA controller */
>   enum {
> @@ -1418,6 +1432,8 @@ static void ppc405_soc_instance_init(Object *obj)
>       object_initialize_child(obj, "gpio", &s->gpio, TYPE_PPC405_GPIO);
>   
>       object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
> +
> +    object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
>   }
>   
>   static void ppc405_soc_realize(DeviceState *dev, Error **errp)
> @@ -1492,7 +1508,11 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>                         s->ram_bases, s->ram_sizes, s->do_dram_init);
>   
>       /* External bus controller */
> -    ppc405_ebc_init(env);
> +    object_property_set_link(OBJECT(&s->ebc), "cpu", OBJECT(&s->cpu),
> +                             &error_abort);
> +    if (!qdev_realize(DEVICE(&s->ebc), NULL, errp)) {
> +        return;
> +    }
>   
>       /* DMA controller */
>       object_property_set_link(OBJECT(&s->dma), "cpu", OBJECT(&s->cpu),
> @@ -1578,6 +1598,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
>   
>   static const TypeInfo ppc405_types[] = {
>       {
> +        .name           = TYPE_PPC405_EBC,
> +        .parent         = TYPE_DEVICE,
> +        .instance_size  = sizeof(Ppc405EbcState),
> +        .class_init     = ppc405_ebc_class_init,
> +    }, {
>           .name           = TYPE_PPC405_DMA,
>           .parent         = TYPE_SYS_BUS_DEVICE,
>           .instance_size  = sizeof(Ppc405DmaState),

