Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65533466961
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:48:50 +0100 (CET)
Received: from localhost ([::1]:42024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msqCP-0004j3-HF
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:48:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msq8F-0001CV-U8; Thu, 02 Dec 2021 12:44:32 -0500
Received: from [2607:f8b0:4864:20::82b] (port=40626
 helo=mail-qt1-x82b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msq8D-0002vE-UR; Thu, 02 Dec 2021 12:44:31 -0500
Received: by mail-qt1-x82b.google.com with SMTP id t34so509469qtc.7;
 Thu, 02 Dec 2021 09:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SrAbHJELP9wKL7Qd8S612fnRLJ78tsDMk09aDVIGL7k=;
 b=aGVM1WSjMY4372xE4QVr3h9ArNm83znGl3eMjG/19b62x+cDgvRaCikp8Mpiu/ZUsU
 uh1LeVb9P3+EvH2iMKU88QL50fJ3bDFQjiTyjKjtBgVqVWE4bcxUdocjuz5UONI14lQ5
 DEJs8YeKeIxyFTAPvV8MXoPfjamQ7Pq5Fk8HrS0gK/WIe+GeXQt4ohQETeKk6FZfk+Q7
 GX8N6h4LLFVdjFo+2D6wwII3ZMyFLgiUHfs6iL2qCGfxG+1v5GYuzsBVYXBNTJuF4BWv
 Z2qzgOoRla4g8HcWUiVA8Hj9qILBAX7bespeOTwsdPCs0yDBt6bcm3XnSM2rDLw5fw1q
 a1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SrAbHJELP9wKL7Qd8S612fnRLJ78tsDMk09aDVIGL7k=;
 b=ERdnWyQEsJFI5TH+ml7fT47xKLqPj9Rh3t853arYWfgg2DXGPVJGcSG9DMx2dKF5kH
 /v/PU5o4/Sh2dyHpcJv3XmDgO0OgXwx4S1Ld+idO8v6lvoMuhYsyeKZ5WPAl4YoE0+Xk
 o4JHXI/IuBZvAv6bsiquu5V0dHb67UBSZrUJ48x/DTXYxcy+h+tWTUbpOEj7uKQ0aTcx
 wvCuRWqU97jyFoJFXPoNDuqhwnUy8Q8EQEztDrDltZb5QIjEXXzHuiTsXrcvGj76KjBf
 8EdIGZggfoVU2mquhZ65IOl0VfrDXc3uZwjDI3EEf0H3qiuO0CxDgcg2+FgtAo98YwUx
 mV5g==
X-Gm-Message-State: AOAM531J6TASVvDBzj+u6j1DCrSSEsWm0HHV+ZwostHxQMzr5no/yfba
 1dRTAzEYf+6HHABhQgLoUOY=
X-Google-Smtp-Source: ABdhPJzZb8cgI8ScfUTb0WyYj+yx+0c5p1AerS1FS7ndjR1diIyusaLRDLH7lkQBIPAYFuewBLch1Q==
X-Received: by 2002:a05:622a:ca:: with SMTP id
 p10mr14816413qtw.302.1638467067339; 
 Thu, 02 Dec 2021 09:44:27 -0800 (PST)
Received: from [192.168.10.222] ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id h22sm290228qtb.86.2021.12.02.09.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 09:44:27 -0800 (PST)
Message-ID: <4625fd68-409a-0710-265e-643086c146f8@gmail.com>
Date: Thu, 2 Dec 2021 14:44:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 10/14] ppc/pnv: Introduce a num_stack class attribute
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-11-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211202144235.1276352-11-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.3,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/2/21 11:42, Cédric Le Goater wrote:
> Each PEC devices of the POWER9 chip has a predefined number of stacks,

s/devices/device ?

> equivalent of a root port complex:
> 
>    PEC0 -> 1 stack
>    PEC1 -> 2 stacks
>    PEC2 -> 3 stacks
> 
> Introduce a class attribute to hold these values and remove the
> "num-stacks" property.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/pci-host/pnv_phb4.h |  1 +
>   hw/pci-host/pnv_phb4_pec.c     | 17 ++++++++++++++++-
>   hw/ppc/pnv.c                   |  7 -------
>   3 files changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 8a585c9a42f7..60de3031a622 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -223,6 +223,7 @@ struct PnvPhb4PecClass {
>       int stk_compat_size;
>       uint64_t version;
>       uint64_t device_id;
> +    const uint32_t *num_stacks;
>   };
>   
>   #endif /* PCI_HOST_PNV_PHB4_H */
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index e9750c41c595..293909b5cb90 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -377,11 +377,19 @@ static void pnv_pec_instance_init(Object *obj)
>   static void pnv_pec_realize(DeviceState *dev, Error **errp)
>   {
>       PnvPhb4PecState *pec = PNV_PHB4_PEC(dev);
> +    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
>       char name[64];
>       int i;
>   
>       assert(pec->system_memory);
>   
> +    if (pec->index >= PNV_CHIP_GET_CLASS(pec->chip)->num_pecs) {
> +        error_setg(errp, "invalid PEC index: %d", pec->index);
> +        return;
> +    }
> +
> +    pec->num_stacks = pecc->num_stacks[pec->index];
> +
>       /* Create stacks */
>       for (i = 0; i < pec->num_stacks; i++) {
>           PnvPhb4PecStack *stack = &pec->stacks[i];
> @@ -460,7 +468,6 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
>   
>   static Property pnv_pec_properties[] = {
>           DEFINE_PROP_UINT32("index", PnvPhb4PecState, index, 0),
> -        DEFINE_PROP_UINT32("num-stacks", PnvPhb4PecState, num_stacks, 0),
>           DEFINE_PROP_UINT32("chip-id", PnvPhb4PecState, chip_id, 0),
>           DEFINE_PROP_LINK("chip", PnvPhb4PecState, chip, TYPE_PNV_CHIP,
>                            PnvChip *),
> @@ -479,6 +486,13 @@ static uint32_t pnv_pec_xscom_nest_base(PnvPhb4PecState *pec)
>       return PNV9_XSCOM_PEC_NEST_BASE + 0x400 * pec->index;
>   }
>   
> +/*
> + * PEC0 -> 1 stack
> + * PEC1 -> 2 stacks
> + * PEC2 -> 3 stacks
> + */
> +static const uint32_t pnv_pec_num_stacks[] = { 1, 2, 3 };
> +
>   static void pnv_pec_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -503,6 +517,7 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
>       pecc->stk_compat_size = sizeof(stk_compat);
>       pecc->version = PNV_PHB4_VERSION;
>       pecc->device_id = PNV_PHB4_DEVICE_ID;
> +    pecc->num_stacks = pnv_pec_num_stacks;
>   }
>   
>   static const TypeInfo pnv_pec_type_info = {
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 76b2f5468b38..957f0bdfaa6b 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1380,13 +1380,6 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>           uint32_t pec_pci_base;
>   
>           object_property_set_int(OBJECT(pec), "index", i, &error_fatal);
> -        /*
> -         * PEC0 -> 1 stack
> -         * PEC1 -> 2 stacks
> -         * PEC2 -> 3 stacks
> -         */
> -        object_property_set_int(OBJECT(pec), "num-stacks", i + 1,
> -                                &error_fatal);
>           object_property_set_int(OBJECT(pec), "chip-id", chip->chip_id,
>                                   &error_fatal);
>           object_property_set_link(OBJECT(pec), "chip", OBJECT(chip),
> 

