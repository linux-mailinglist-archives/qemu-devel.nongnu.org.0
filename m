Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55765894ED
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 01:41:50 +0200 (CEST)
Received: from localhost ([::1]:45338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJNzp-0003VM-Ov
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 19:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJNx9-0001ZD-Jr; Wed, 03 Aug 2022 19:39:03 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36]:42953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJNx7-0000Gt-P7; Wed, 03 Aug 2022 19:39:03 -0400
Received: by mail-vk1-xa36.google.com with SMTP id q14so7969345vke.9;
 Wed, 03 Aug 2022 16:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=DyRQB867kAfSYRaMYk6Pc13k/NgmWgIR5AmocfJv5MM=;
 b=LktTDxAu0Hhx6EaL1uHjd9Wf9laNf8NiZgmbZJ6Tk6En4oLxJSa0vrc5wUUaoI+kxt
 X/51eHZYUB66+0MxbfkY0iFsNBCnpxuBMsWHgP6BW9wGPJj3vR+O8VH3MzMtxtRluWMH
 ar2zPgF/3dFCo3bRxBzm2hx+0HHq18zB5dmTAV6j4FWrdONc9VqwJyfiBk7p9rzauInp
 zR+qy2e6zaKvN0fkprpYPdszJ507HPXXp8hqqhcP7pl7GPdWexGS8iPh0BuEwFlpyfTI
 9wOks1fdvsl8ZgWJMgUIsZl7srTZbKyZ/TgD7C7hSMl/pPR57bynGIjnKbsZGxJsWbvC
 2ymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=DyRQB867kAfSYRaMYk6Pc13k/NgmWgIR5AmocfJv5MM=;
 b=gr81mbgYEwkCQuk2aeLItyytnVaJ9mj7hbGMT6dwrFc4jvBeGOa6rXxc780G3W3yYF
 5OswsapBWyDCK6kY1D0ci+Gr+4jA4KS+ib61mEN4COAgPAsBNuZ50lrgNyd9I/w3UYWI
 QMd3rXij279Bl+VAMnrgFcrR0GEVQnFdBoPCGMXVkUpG+4fB+PGjETCZPqdafb9cR+wr
 N5b2X76yvOQve6z1eh/2jkDIZO3q6EcW5nYeEQ/RM4K7XULqHFw/qTlSDPT5i7bI83SK
 vqe3yMvVZdvLU4OoW9tRS3I+2UnOlVF5B/VHVNcqs5VGRJ2IvBuX+TnUNub1wBFHokQi
 4a4g==
X-Gm-Message-State: ACgBeo0AHh5iQf6KFRNM0tJ37EAjyzKSe6ZUvhtl/3sK5H8+j//sTOiL
 KWsCl+0gMZP3p4DvEM/4KgSF93Y/7ms=
X-Google-Smtp-Source: AA6agR5aSMPmcFVi4H96Yc/1Inf2g+Mw1hWdQSJLy+CXQqFVfxC0ejz26lIO6DQHWYdYKSEyo74oPw==
X-Received: by 2002:a05:6122:ce:b0:377:4e0f:a037 with SMTP id
 h14-20020a05612200ce00b003774e0fa037mr7432581vkc.5.1659569940169; 
 Wed, 03 Aug 2022 16:39:00 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:52e2:fb25:323c:5709:7237?
 ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a67f6d8000000b00373d697e3e2sm8364322vso.19.2022.08.03.16.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 16:38:59 -0700 (PDT)
Message-ID: <1e5f2017-313d-0613-c5a7-dbd520cff85d@gmail.com>
Date: Wed, 3 Aug 2022 20:38:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 15/20] ppc/ppc405: QOM'ify PLB
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-16-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220803132844.2370514-16-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa36.google.com
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



On 8/3/22 10:28, Cédric Le Goater wrote:
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/ppc/ppc405.h    | 14 ++++++++++
>   hw/ppc/ppc405_uc.c | 67 +++++++++++++++++++++++++++++++++-------------
>   2 files changed, 62 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index 8acb90427596..8ca32f35ce67 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -65,6 +65,19 @@ struct ppc4xx_bd_info_t {
>   
>   typedef struct Ppc405SoCState Ppc405SoCState;
>   
> +/* Peripheral local bus arbitrer */
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
> index ca214ee4d741..9bbd524ad5ea 100644
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

This causes the same problem that happened in patch 12:


$ ./qemu-system-ppc64 -display none -M sam460ex
Unexpected error in object_property_find_err() at ../qom/object.c:1304:
qemu-system-ppc64: Property '460exb-powerpc64-cpu.cpu' not found
Aborted (core dumped)


The same fix applies here as well:


$ git diff
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index dd3c05a28b..fd53cf38e5 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -240,7 +240,7 @@ void ppc4xx_plb_init(CPUPPCState *env)
      PowerPCCPU *cpu = env_archcpu(env);
      DeviceState *dev = qdev_new(TYPE_PPC405_EBC);
  
-    object_property_set_link(OBJECT(cpu), "cpu", OBJECT(dev), &error_abort);
+    object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), &error_abort);
      qdev_realize_and_unref(dev, NULL, &error_fatal);
  }
  

Daniel


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
> @@ -1484,7 +1504,11 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
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
> @@ -1615,6 +1639,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
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

