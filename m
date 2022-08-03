Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A405894E7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 01:38:19 +0200 (CEST)
Received: from localhost ([::1]:42164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJNwQ-0000xC-DF
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 19:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJNum-0007MH-4w; Wed, 03 Aug 2022 19:36:36 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935]:45695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJNui-0007xg-Md; Wed, 03 Aug 2022 19:36:34 -0400
Received: by mail-ua1-x935.google.com with SMTP id f15so7605277uao.12;
 Wed, 03 Aug 2022 16:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=g1dvFeHY/1F1XAGyEyR9vYpU21BUrHkSkFWHtpuIPEI=;
 b=a2+beJ0EgiaL7np+MIOJmc+vUsmAH1xsdqAkofg1W3gwQCv7Nd6RZEEOv31rD4ArFh
 VUr5xb+kUv+yQjlRFyKCG6D4nbht4mKSJI10fEcSddWy6N+9PIZcJ265vwa+CPmvxtAs
 pF6kSJ6H8atPM3rTPd3T7D92oioMi6bm1iDR8M21XFmuNrd1fzjAN59NzFRw+iiSVOQA
 t+3IOXF3yilfmicDlcdLPyXdPbJpAatagX7vdLW7jWnvRP7b/m2nlxwuw/arntplAE3o
 Tnq2/7IL1SMnR1gtWtfSy8FUbzQX409l++P4XVrx0bJLKLJAFyySNjj6VARCnEAdJ0Fv
 KYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=g1dvFeHY/1F1XAGyEyR9vYpU21BUrHkSkFWHtpuIPEI=;
 b=kSUHdLJlyTxkkDmMnyGnQz5SrpeANQJgR2iyoibAB3kPWNE3OcMR/I5pOD/YjR/FhB
 66AWJ8DsgvBV/WMTKCz8pwdU5vJoO3HR3+rgeHg1D/AOz9Y39g0Tyeu4RheveFYtK31g
 IV5oo6sOkB14880DkI/OWBDK6UQz/yJE0hrz+FVGWfG1t0Wm1yDoXtUKVGHNW2EDQAlg
 TR3qgBlzlqrdxx3FvTt9EH6ds8yuWxxucBCJWfd+0JWdRKu5a5va5COuij5kbmsOKndF
 CMPq8padMPdYdl293P6vZxA0C+Xf3vr8JRA5n3IxpIN+zUNkUB9ZDMNlfbo5fKD+44ri
 4HRA==
X-Gm-Message-State: ACgBeo1m+xr/V0wGRWeLNQHMv2tTd8wm85RN9C6BOoFw7Z2IGKGZlxrz
 032FsOJGdgDieEmn0YHiCHo=
X-Google-Smtp-Source: AA6agR6n7fhK5jGDVCaMrMk/7Cjn8UqGcqw8n+9Skanylm6UsPYeTeqkQymbUyGmeQtbQffFAg/QYA==
X-Received: by 2002:ab0:2102:0:b0:382:2773:aa7f with SMTP id
 d2-20020ab02102000000b003822773aa7fmr11434286ual.31.1659569791113; 
 Wed, 03 Aug 2022 16:36:31 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:52e2:fb25:323c:5709:7237?
 ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 m37-20020ab013a8000000b0038342b58f6csm11270817uae.17.2022.08.03.16.36.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 16:36:30 -0700 (PDT)
Message-ID: <973576c1-deb8-3973-34e7-d038ca2200c2@gmail.com>
Date: Wed, 3 Aug 2022 20:36:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 12/20] ppc/ppc405: QOM'ify EBC
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-13-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220803132844.2370514-13-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x935.google.com
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

Cedric,

On 8/3/22 10:28, Cédric Le Goater wrote:
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/ppc/ppc405.h    | 16 +++++++++++
>   hw/ppc/ppc405_uc.c | 71 +++++++++++++++++++++++++++++++---------------
>   2 files changed, 64 insertions(+), 23 deletions(-)
> 
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index 1da34a7f10f3..1c7fe07b8084 100644
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
> index 6bd93c1cb90c..0166f3fc36da 100644
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

This line is breaking the boot of sam460ex:


  ./qemu-system-ppc64 -display none -M sam460ex
Unexpected error in object_property_find_err() at ../qom/object.c:1304:
qemu-system-ppc64: Property '460exb-powerpc64-cpu.cpu' not found
Aborted (core dumped)


I think you meant to link the cpu prop of the EBC obj to the CPU object,
not the cpu prop of the CPU obj to the EBC dev.


This fixes the issue:


$ git diff
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 0166f3fc36..aac3a3f761 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -594,7 +594,7 @@ void ppc405_ebc_init(CPUPPCState *env)
      PowerPCCPU *cpu = env_archcpu(env);
      DeviceState *dev = qdev_new(TYPE_PPC405_EBC);
  
-    object_property_set_link(OBJECT(cpu), "cpu", OBJECT(dev), &error_abort);
+    object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), &error_abort);
      qdev_realize_and_unref(dev, NULL, &error_fatal);
  }


Daniel


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
> @@ -1490,7 +1506,11 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
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
> @@ -1576,6 +1596,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
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

