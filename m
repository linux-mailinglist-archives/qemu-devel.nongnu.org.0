Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE77F588987
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 11:40:51 +0200 (CEST)
Received: from localhost ([::1]:51584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJArz-0005bX-29
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 05:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAfM-0002zR-I0; Wed, 03 Aug 2022 05:27:48 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32]:42819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAfJ-0003uP-Sa; Wed, 03 Aug 2022 05:27:47 -0400
Received: by mail-vs1-xe32.google.com with SMTP id b124so5514354vsc.9;
 Wed, 03 Aug 2022 02:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=PuTwcZecpF8PlUMUZSSWrOcCQbvwmTZY61Ke95Y20+4=;
 b=hfmndHLtfgxOiylIP1QpjreQ6YVMezxfyORpqh/XZ2XdwAoRyqdFhfmPKzyTmWagKa
 WMzdqLJgnPGwXrBZchEwAFXI7agCDfddSSF6tcWop0KUm+BxETi3l7xAsAK2ouf2ygEx
 lRWyRMNKl5GuN4P5wBRpmlDtl2pQUO/wBE7WiS/Vq3+KESfjJihf6WEPaitE0z15+Q2J
 ZW7PmoMLkNSIlca+pco7+qYtgZxYQJ/FFSqaKnG39jhiKFAYS7J+bJpZBSgcnzN/oh7y
 OI9X6HiY9QgvFX1Qtq9EFbVEq+UP4O3cEHdtZAy8MG2zKF8czC8pDewKwJioj5LISxlh
 fwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=PuTwcZecpF8PlUMUZSSWrOcCQbvwmTZY61Ke95Y20+4=;
 b=AQbjqDSw214dN6lAl17BxXi1OI/mwt7+PQ46l3wMFxe5n4YYJtGaDZ1lxYMCvQ7ECD
 BgjpJDsyOa82jmRagjs8p+2zUABG1km4vHoOhBWlyi4Bf7tJPWcfUxI77HFUwFMUR7R4
 hEhtgZ0Pf9qAWYAKBhVwQywQcgsB4qwU0XMu79NhrqazfFqKhgJStPPGz/xheFwUq+03
 lwpi3jj58tfCV5Moyo0/rUMawcT+mMZz5W0x3v6PcLpw0RaZ11JdMDEpSyL75qc9hJTY
 pOo/0K3MK4GySQiVb7etCwkug4OLYcRrpQ2Kso7U/H6WEu7aIOIGtKL/PZnbTvGu2ZXl
 Zb2A==
X-Gm-Message-State: ACgBeo3/Jdih7BfmBWbot+5RX3u83qdBDqLmYud7dN9SPdeCEpAXPFPm
 +lYtOyJ4SBwiunNMlH+OiYK+NIq1C+I=
X-Google-Smtp-Source: AA6agR4F2VC62VLhRAYry3x7MNkm7qUpi0F43VCLXcO5gu3OgryQpAs95EYYL8Z9XVmJIdJ7a7N/Gg==
X-Received: by 2002:a05:6102:a22:b0:388:4f17:6b9d with SMTP id
 2-20020a0561020a2200b003884f176b9dmr1118206vsb.58.1659518864557; 
 Wed, 03 Aug 2022 02:27:44 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:52e2:fb25:323c:5709:7237?
 ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 r25-20020a67de99000000b00384782763cesm5232969vsk.27.2022.08.03.02.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 02:27:44 -0700 (PDT)
Message-ID: <19bc87f5-0f95-fa52-43c9-20f8b83536ea@gmail.com>
Date: Wed, 3 Aug 2022 06:27:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 14/19] ppc/ppc405: QOM'ify POB
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-15-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220801131039.1693913-15-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe32.google.com
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

>   hw/ppc/ppc405.h    | 14 +++++++++++
>   hw/ppc/ppc405_uc.c | 58 +++++++++++++++++++++++++++++++---------------
>   2 files changed, 53 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index ebff00bdad80..d39d65cc86e4 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -65,6 +65,19 @@ struct ppc4xx_bd_info_t {
>   
>   typedef struct Ppc405SoCState Ppc405SoCState;
>   
> +/* PLB to OPB bridge */
> +#define TYPE_PPC405_POB "ppc405-pob"
> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PobState, PPC405_POB);
> +struct Ppc405PobState {
> +    DeviceState parent_obj;
> +
> +    PowerPCCPU *cpu;
> +
> +    uint32_t bear;
> +    uint32_t besr0;
> +    uint32_t besr1;
> +};
> +
>   /* OPB arbitrer */
>   #define TYPE_PPC405_OPBA "ppc405-opba"
>   OBJECT_DECLARE_SIMPLE_TYPE(Ppc405OpbaState, PPC405_OPBA);
> @@ -231,6 +244,7 @@ struct Ppc405SoCState {
>       Ppc405DmaState dma;
>       Ppc405EbcState ebc;
>       Ppc405OpbaState opba;
> +    Ppc405PobState pob;
>   };
>   
>   /* PowerPC 405 core */
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index c5de00de7981..218d911bca3c 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -234,19 +234,11 @@ enum {
>       POB0_BEAR  = 0x0A4,
>   };
>   
> -typedef struct ppc4xx_pob_t ppc4xx_pob_t;
> -struct ppc4xx_pob_t {
> -    uint32_t bear;
> -    uint32_t besr0;
> -    uint32_t besr1;
> -};
> -
>   static uint32_t dcr_read_pob (void *opaque, int dcrn)
>   {
> -    ppc4xx_pob_t *pob;
> +    Ppc405PobState *pob = PPC405_POB(opaque);
>       uint32_t ret;
>   
> -    pob = opaque;
>       switch (dcrn) {
>       case POB0_BEAR:
>           ret = pob->bear;
> @@ -268,9 +260,8 @@ static uint32_t dcr_read_pob (void *opaque, int dcrn)
>   
>   static void dcr_write_pob (void *opaque, int dcrn, uint32_t val)
>   {
> -    ppc4xx_pob_t *pob;
> +    Ppc405PobState *pob = PPC405_POB(opaque);
>   
> -    pob = opaque;
>       switch (dcrn) {
>       case POB0_BEAR:
>           /* Read only */
> @@ -286,26 +277,44 @@ static void dcr_write_pob (void *opaque, int dcrn, uint32_t val)
>       }
>   }
>   
> -static void ppc4xx_pob_reset (void *opaque)
> +static void ppc405_pob_reset(DeviceState *dev)
>   {
> -    ppc4xx_pob_t *pob;
> +    Ppc405PobState *pob = PPC405_POB(dev);
>   
> -    pob = opaque;
>       /* No error */
>       pob->bear = 0x00000000;
>       pob->besr0 = 0x0000000;
>       pob->besr1 = 0x0000000;
>   }
>   
> -static void ppc4xx_pob_init(CPUPPCState *env)
> +static void ppc405_pob_realize(DeviceState *dev, Error **errp)
>   {
> -    ppc4xx_pob_t *pob;
> +    Ppc405PobState *pob = PPC405_POB(dev);
> +    CPUPPCState *env;
> +
> +    assert(pob->cpu);
> +
> +    env = &pob->cpu->env;
>   
> -    pob = g_new0(ppc4xx_pob_t, 1);
>       ppc_dcr_register(env, POB0_BEAR, pob, &dcr_read_pob, &dcr_write_pob);
>       ppc_dcr_register(env, POB0_BESR0, pob, &dcr_read_pob, &dcr_write_pob);
>       ppc_dcr_register(env, POB0_BESR1, pob, &dcr_read_pob, &dcr_write_pob);
> -    qemu_register_reset(ppc4xx_pob_reset, pob);
> +}
> +
> +static Property ppc405_pob_properties[] = {
> +    DEFINE_PROP_LINK("cpu", Ppc405PobState, cpu, TYPE_POWERPC_CPU,
> +                     PowerPCCPU *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void ppc405_pob_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = ppc405_pob_realize;
> +    dc->user_creatable = false;
> +    dc->reset = ppc405_pob_reset;
> +    device_class_set_props(dc, ppc405_pob_properties);
>   }
>   
>   /*****************************************************************************/
> @@ -1435,6 +1444,8 @@ static void ppc405_soc_instance_init(Object *obj)
>       object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
>   
>       object_initialize_child(obj, "opba", &s->opba, TYPE_PPC405_OPBA);
> +
> +    object_initialize_child(obj, "pob", &s->pob, TYPE_PPC405_POB);
>   }
>   
>   static void ppc405_soc_realize(DeviceState *dev, Error **errp)
> @@ -1484,7 +1495,11 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>       ppc4xx_plb_init(env);
>   
>       /* PLB to OPB bridge */
> -    ppc4xx_pob_init(env);
> +    object_property_set_link(OBJECT(&s->pob), "cpu", OBJECT(&s->cpu),
> +                             &error_abort);
> +    if (!qdev_realize(DEVICE(&s->pob), NULL, errp)) {
> +        return;
> +    }
>   
>       /* OBP arbitrer */
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->opba), errp)) {
> @@ -1602,6 +1617,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
>   
>   static const TypeInfo ppc405_types[] = {
>       {
> +        .name           = TYPE_PPC405_POB,
> +        .parent         = TYPE_DEVICE,
> +        .instance_size  = sizeof(Ppc405PobState),
> +        .class_init     = ppc405_pob_class_init,
> +    }, {
>           .name           = TYPE_PPC405_OPBA,
>           .parent         = TYPE_SYS_BUS_DEVICE,
>           .instance_size  = sizeof(Ppc405OpbaState),

