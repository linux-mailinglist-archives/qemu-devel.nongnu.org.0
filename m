Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53586588961
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 11:26:54 +0200 (CEST)
Received: from localhost ([::1]:60844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJAeT-0000h8-8L
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 05:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAUR-00042K-Ta; Wed, 03 Aug 2022 05:16:32 -0400
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e]:38453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAUQ-0000VA-2b; Wed, 03 Aug 2022 05:16:31 -0400
Received: by mail-vk1-xa2e.google.com with SMTP id y129so8344607vkg.5;
 Wed, 03 Aug 2022 02:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=z8exOrDvq1YIpHC1qFXcTMisJkpr/S4Lidnh/X7YH4U=;
 b=oHaLa8ogce2bpU+lnsYD4RcBBrLkoLhgBYAzuRHfd+wSyB7+Rzkb7LiTU/n7kMMTZC
 bmeYrNU3yvMlqoZiDKfVXxpBqmyzxy+i/SnZszpg+p/ubK8VO6mcG+QpbaD2RtTqjBkt
 9iMVgGarMooMkzpexdLo4OPKV/hBqpzUZ2yinclBPTVgXUmKgD53AMJZzc67JrLiA0A0
 C+UpxMpIp2GcTchbliA5G+tCMqJxC95zqOSaOGSCrASL2cQHc23NpbNN3g1I+a/CKYYM
 H+YaB08paiKqkIv+/wAdk2Ds1fa2IaSJpCZcewc6Y8UCnYp2sWAqqpW100NG2lwk+HA/
 CECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=z8exOrDvq1YIpHC1qFXcTMisJkpr/S4Lidnh/X7YH4U=;
 b=VgmNCTrSjqNNG3Eczhq8zm1RBP4M1xKMb2yxJe4lUmySfhVZ0z7bX2feI+GJVM5sIZ
 61gbt3XUvi4nTTqXYRXvcGI8k2XmL6Xz7bO+tGoZ0avyLgsPXutNO+xe/WfpBDGtFwB5
 vXZS9FNJbIvo9LOakNFraljf0Kml/09EbpWZ34G87I0RjlKwi4X4b8fHevgy2QUJi/3/
 FmHu4KDlJnoaKPT0XNdw1Zf/XPwnYTDb6pMQjjd4zhQMavwn5C/oEXZahhqCi5sLFl4T
 2MfkawW4JATIOpjM6LcTs6sTXc2EtMeVklu+9zTjw58HZekztAAwNswYPy0fWVi4qwQz
 TnVQ==
X-Gm-Message-State: AJIora+SiGcCMuUSkpv7eIx61qE+m163BNOfp0AzSKAWKk2cMinft556
 5h1LYj4lUFK/nrgbKqpoWqlklK4BowA=
X-Google-Smtp-Source: AGRyM1tDeoaLOiKTAey3eKU+mtsx2aaCGDP303lrVuhXsLfGKTrZTnJJCs3xaNwrxALo+GTyMuboQg==
X-Received: by 2002:a1f:df41:0:b0:376:ecd7:4930 with SMTP id
 w62-20020a1fdf41000000b00376ecd74930mr9708715vkg.11.1659518188662; 
 Wed, 03 Aug 2022 02:16:28 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:52e2:fb25:323c:5709:7237?
 ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 x82-20020a1f3155000000b003743e7c87c5sm9619180vkx.5.2022.08.03.02.16.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 02:16:28 -0700 (PDT)
Message-ID: <f9562be4-857a-cf35-f209-5ea95a864a0a@gmail.com>
Date: Wed, 3 Aug 2022 06:16:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 09/19] ppc/ppc405: QOM'ify OCM
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-10-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220801131039.1693913-10-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa2e.google.com
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

>   hw/ppc/ppc405.h    | 18 ++++++++++++
>   hw/ppc/ppc405_uc.c | 73 ++++++++++++++++++++++++++++------------------
>   2 files changed, 63 insertions(+), 28 deletions(-)
> 
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index f7c0eb1d0008..e56363366cad 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -65,6 +65,23 @@ struct ppc4xx_bd_info_t {
>   
>   typedef struct Ppc405SoCState Ppc405SoCState;
>   
> +/* On Chip Memory */
> +#define TYPE_PPC405_OCM "ppc405-ocm"
> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405OcmState, PPC405_OCM);
> +struct Ppc405OcmState {
> +    SysBusDevice parent_obj;
> +
> +    PowerPCCPU *cpu;
> +
> +    MemoryRegion ram;
> +    MemoryRegion isarc_ram;
> +    MemoryRegion dsarc_ram;
> +    uint32_t isarc;
> +    uint32_t isacntl;
> +    uint32_t dsarc;
> +    uint32_t dsacntl;
> +};
> +
>   /* General purpose timers */
>   #define TYPE_PPC405_GPT "ppc405-gpt"
>   OBJECT_DECLARE_SIMPLE_TYPE(Ppc405GptState, PPC405_GPT);
> @@ -141,6 +158,7 @@ struct Ppc405SoCState {
>       DeviceState *uic;
>       Ppc405CpcState cpc;
>       Ppc405GptState gpt;
> +    Ppc405OcmState ocm;
>   };
>   
>   /* PowerPC 405 core */
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index 0f5e4ec15f14..59cade4c0680 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -773,20 +773,9 @@ enum {
>       OCM0_DSACNTL = 0x01B,
>   };
>   
> -typedef struct ppc405_ocm_t ppc405_ocm_t;
> -struct ppc405_ocm_t {
> -    MemoryRegion ram;
> -    MemoryRegion isarc_ram;
> -    MemoryRegion dsarc_ram;
> -    uint32_t isarc;
> -    uint32_t isacntl;
> -    uint32_t dsarc;
> -    uint32_t dsacntl;
> -};
> -
> -static void ocm_update_mappings (ppc405_ocm_t *ocm,
> -                                 uint32_t isarc, uint32_t isacntl,
> -                                 uint32_t dsarc, uint32_t dsacntl)
> +static void ocm_update_mappings(Ppc405OcmState *ocm,
> +                                uint32_t isarc, uint32_t isacntl,
> +                                uint32_t dsarc, uint32_t dsacntl)
>   {
>       trace_ocm_update_mappings(isarc, isacntl, dsarc, dsacntl, ocm->isarc,
>                                 ocm->isacntl, ocm->dsarc, ocm->dsacntl);
> @@ -830,10 +819,9 @@ static void ocm_update_mappings (ppc405_ocm_t *ocm,
>   
>   static uint32_t dcr_read_ocm (void *opaque, int dcrn)
>   {
> -    ppc405_ocm_t *ocm;
> +    Ppc405OcmState *ocm = PPC405_OCM(opaque);
>       uint32_t ret;
>   
> -    ocm = opaque;
>       switch (dcrn) {
>       case OCM0_ISARC:
>           ret = ocm->isarc;
> @@ -857,10 +845,9 @@ static uint32_t dcr_read_ocm (void *opaque, int dcrn)
>   
>   static void dcr_write_ocm (void *opaque, int dcrn, uint32_t val)
>   {
> -    ppc405_ocm_t *ocm;
> +    Ppc405OcmState *ocm = PPC405_OCM(opaque);
>       uint32_t isarc, dsarc, isacntl, dsacntl;
>   
> -    ocm = opaque;
>       isarc = ocm->isarc;
>       dsarc = ocm->dsarc;
>       isacntl = ocm->isacntl;
> @@ -886,12 +873,11 @@ static void dcr_write_ocm (void *opaque, int dcrn, uint32_t val)
>       ocm->dsacntl = dsacntl;
>   }
>   
> -static void ocm_reset (void *opaque)
> +static void ppc405_ocm_reset(DeviceState *dev)
>   {
> -    ppc405_ocm_t *ocm;
> +    Ppc405OcmState *ocm = PPC405_OCM(dev);
>       uint32_t isarc, dsarc, isacntl, dsacntl;
>   
> -    ocm = opaque;
>       isarc = 0x00000000;
>       isacntl = 0x00000000;
>       dsarc = 0x00000000;
> @@ -903,17 +889,21 @@ static void ocm_reset (void *opaque)
>       ocm->dsacntl = dsacntl;
>   }
>   
> -static void ppc405_ocm_init(CPUPPCState *env)
> +static void ppc405_ocm_realize(DeviceState *dev, Error **errp)
>   {
> -    ppc405_ocm_t *ocm;
> +    Ppc405OcmState *ocm = PPC405_OCM(dev);
> +    CPUPPCState *env;
> +
> +    assert(ocm->cpu);
> +
> +    env = &ocm->cpu->env;
>   
> -    ocm = g_new0(ppc405_ocm_t, 1);
>       /* XXX: Size is 4096 or 0x04000000 */
> -    memory_region_init_ram(&ocm->isarc_ram, NULL, "ppc405.ocm", 4 * KiB,
> +    memory_region_init_ram(&ocm->isarc_ram, OBJECT(ocm), "ppc405.ocm", 4 * KiB,
>                              &error_fatal);
> -    memory_region_init_alias(&ocm->dsarc_ram, NULL, "ppc405.dsarc",
> +    memory_region_init_alias(&ocm->dsarc_ram, OBJECT(ocm), "ppc405.dsarc",
>                                &ocm->isarc_ram, 0, 4 * KiB);
> -    qemu_register_reset(&ocm_reset, ocm);
> +
>       ppc_dcr_register(env, OCM0_ISARC,
>                        ocm, &dcr_read_ocm, &dcr_write_ocm);
>       ppc_dcr_register(env, OCM0_ISACNTL,
> @@ -924,6 +914,22 @@ static void ppc405_ocm_init(CPUPPCState *env)
>                        ocm, &dcr_read_ocm, &dcr_write_ocm);
>   }
>   
> +static Property ppc405_ocm_properties[] = {
> +    DEFINE_PROP_LINK("cpu", Ppc405OcmState, cpu, TYPE_POWERPC_CPU,
> +                     PowerPCCPU *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void ppc405_ocm_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = ppc405_ocm_realize;
> +    dc->user_creatable = false;
> +    dc->reset = ppc405_ocm_reset;
> +    device_class_set_props(dc, ppc405_ocm_properties);
> +}
> +
>   /*****************************************************************************/
>   /* General purpose timers */
>   static int ppc4xx_gpt_compare(Ppc405GptState *gpt, int n)
> @@ -1413,6 +1419,8 @@ static void ppc405_soc_instance_init(Object *obj)
>       object_property_add_alias(obj, "sys-clk", OBJECT(&s->cpc), "sys-clk");
>   
>       object_initialize_child(obj, "gpt", &s->gpt, TYPE_PPC405_GPT);
> +
> +    object_initialize_child(obj, "ocm", &s->ocm, TYPE_PPC405_OCM);
>   }
>   
>   static void ppc405_soc_realize(DeviceState *dev, Error **errp)
> @@ -1517,7 +1525,11 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>       }
>   
>       /* OCM */
> -    ppc405_ocm_init(env);
> +    object_property_set_link(OBJECT(&s->ocm), "cpu", OBJECT(&s->cpu),
> +                             &error_abort);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ocm), errp)) {
> +        return;
> +    }
>   
>       /* GPT */
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpt), errp)) {
> @@ -1560,6 +1572,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
>   
>   static const TypeInfo ppc405_types[] = {
>       {
> +        .name           = TYPE_PPC405_OCM,
> +        .parent         = TYPE_SYS_BUS_DEVICE,
> +        .instance_size  = sizeof(Ppc405OcmState),
> +        .class_init     = ppc405_ocm_class_init,
> +    }, {
>           .name           = TYPE_PPC405_GPT,
>           .parent         = TYPE_SYS_BUS_DEVICE,
>           .instance_size  = sizeof(Ppc405GptState),

