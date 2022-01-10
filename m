Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7DC489D52
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 17:16:34 +0100 (CET)
Received: from localhost ([::1]:55028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6xLV-0003NO-OE
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 11:16:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6xGE-0007NR-K2; Mon, 10 Jan 2022 11:11:06 -0500
Received: from [2607:f8b0:4864:20::a2f] (port=40742
 helo=mail-vk1-xa2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6xGC-0006cJ-Vc; Mon, 10 Jan 2022 11:11:06 -0500
Received: by mail-vk1-xa2f.google.com with SMTP id 78so8430028vkz.7;
 Mon, 10 Jan 2022 08:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=f6lGwdxpeLklriFRAmSLLs+8bV/qRHbJn4GMZqftaVw=;
 b=S1QCqpv+TMJuzMVkUJNysNYKQJ/Sixj9iyvSd+E8OuirNgWARu6+lrRtkBO5UtSKIk
 9IByZuNh0DWvY+Pxdv3JVLS8qnbvERd+SinMbRTF2WK8SZxzCBkQSKoKNxuUj6d6/KFg
 t/gh/x0bUEAcGkKfGKkxKtHaeAAd+mDTf+OPW9Q9qb72/y9+KYTTj3YFT4z11mqFaflG
 eS08BbkdBEbYVlae76Y4lX+u6oyDTTJZrapEvb8ScBt5hGtbrg7L1SSribPi9kIqqXY4
 LmoG80JaUznKvLmAKbDwNywFsatB9MuLXqhhvnAWAOm6hkDxeATc/xvzhxj6O9yHV2Ww
 qjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f6lGwdxpeLklriFRAmSLLs+8bV/qRHbJn4GMZqftaVw=;
 b=iMRy35Vs/JKGkox+4tEOauwrcQcikOc0yrZH7ZbsgQAuWbMqIfOjd/FUF+YzwmQA5g
 dEA4czn/zGs5foLz1umueNFGrVHFjgBkXBGkc+TZkfPEvMUI86RIURddYDqIgZREaZSq
 TJk4ABOgy7nCMb2vyhRaUKv3w0dEAKfQYOK8wCqtpZjQ1ViOdlpg+l86KjGhl1hssOpc
 SJM347CSEXAemGM0+3VUchMPAhU8R0leN5eadowLI63mHFEW4xzLjadEQW/w31HbeQKW
 /Eu9MeIJ0cc4QPWmFKGV7EEJHQ7DO3VNHJogKA2hmevvjq8lYPlZtRu32h+fxEy0X2og
 V0BA==
X-Gm-Message-State: AOAM531pK49d7AqF9QPKSxqKz6gDC9PvzYvdB6UQWfUuVRbNdAlllHBH
 GI9B7ChJEb5jd0i5nmT9QWw=
X-Google-Smtp-Source: ABdhPJyOAzYDsLNZvqOpkuKuI0Yrl/mSNVdKsbjp3fn2CznV4ZpjtTkRuoY2rGbWRKmeYwRuervrUg==
X-Received: by 2002:a1f:2e4b:: with SMTP id u72mr119615vku.4.1641831063540;
 Mon, 10 Jan 2022 08:11:03 -0800 (PST)
Received: from [192.168.10.222] ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id d4sm3988323vkf.39.2022.01.10.08.11.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 08:11:03 -0800 (PST)
Message-ID: <dabd0c55-571e-d4c4-a769-510df8021aa0@gmail.com>
Date: Mon, 10 Jan 2022 13:11:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 07/10] ppc/pnv: move PHB4 related XSCOM init to
 phb4_realize()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20220110143346.455901-1-danielhb413@gmail.com>
 <20220110143346.455901-8-danielhb413@gmail.com>
 <19dfa590-311a-4a9d-45b6-64d1d8bd995b@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <19dfa590-311a-4a9d-45b6-64d1d8bd995b@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa2f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/10/22 12:57, Cédric Le Goater wrote:
> On 1/10/22 15:33, Daniel Henrique Barboza wrote:
>> Before enabling pnv-phb4 user creatable devices we need to handle PHB4
>> specific code in pnv_pec_stk_realize().
>>
>> The 'stack->phb_regs_mr' PHB4 passthrough XSCOM initialization relies on
>> 'stack->phb' being not NULL. Moving 'stack->phb_regs_mr' region_init()
>> and add_subregion() to phb4_realize() time is a natural thing to do and
>> it'll spare us from checking 'phb->stack != NULL' in stk_realize() when
>> user creatable pnv-phb4s are implemented.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/pci-host/pnv_phb4.c     | 27 +++++++++++++++++++++++++++
>>   hw/pci-host/pnv_phb4_pec.c | 10 ----------
>>   2 files changed, 27 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
>> index 1a7395772f..152911a285 100644
>> --- a/hw/pci-host/pnv_phb4.c
>> +++ b/hw/pci-host/pnv_phb4.c
>> @@ -1194,6 +1194,31 @@ void pnv_phb4_set_stack_phb_props(PnvPhb4PecStack *stack,
>>                                &error_abort);
>>   }
>> +static void pnv_phb4_init_xscom_passthrough(PnvPHB4 *phb)
>> +{
>> +    PnvPhb4PecState *pec;
>> +    PnvPhb4PecClass *pecc;
>> +    uint32_t pec_pci_base;
>> +    char name[64];
>> +
>> +    assert(phb->stack);
>> +
>> +    pec = phb->stack->pec;
>> +    pecc = PNV_PHB4_PEC_GET_CLASS(pec);
>> +    pec_pci_base = pecc->xscom_pci_base(pec);
>> +
>> +    /* PHB pass-through */
>> +    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d-phb",
>> +             pec->chip_id, pec->index, phb->stack->stack_no);
>> +    pnv_xscom_region_init(&phb->stack->phb_regs_mr, OBJECT(phb),
>> +                          &pnv_phb4_xscom_ops, phb, name, 0x40);
>> +
>> +    pnv_xscom_add_subregion(pec->chip,
>> +                            pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
>> +                            0x40 * phb->stack->stack_no,
>> +                            &phb->stack->phb_regs_mr);
>> +}
>> +
>>   static void pnv_phb4_instance_init(Object *obj)
>>   {
>>       PnvPHB4 *phb = PNV_PHB4(obj);
>> @@ -1223,6 +1248,8 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>>       memory_region_init_io(&phb->mr_regs, OBJECT(phb), &pnv_phb4_reg_ops, phb,
>>                             name, 0x2000);
>> +    pnv_phb4_init_xscom_passthrough(phb);
>> +
>>       /*
>>        * PHB4 doesn't support IO space. However, qemu gets very upset if
>>        * we don't have an IO region to anchor IO BARs onto so we just
>> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
>> index 042dc0b775..5e02a51f04 100644
>> --- a/hw/pci-host/pnv_phb4_pec.c
>> +++ b/hw/pci-host/pnv_phb4_pec.c
>> @@ -571,12 +571,6 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>>                             &pnv_pec_stk_pci_xscom_ops, stack, name,
>>                             PHB4_PEC_PCI_STK_REGS_COUNT);
>> -    /* PHB pass-through */
>> -    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d-phb",
>> -             pec->chip_id, pec->index, stack->stack_no);
>> -    pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(stack->phb),
>> -                          &pnv_phb4_xscom_ops, stack->phb, name, 0x40);
>> -
>>       if (stack->phb && !sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
>>           return;
>>       }
>> @@ -591,10 +585,6 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>>       pnv_xscom_add_subregion(chip,
>>                               pec_pci_base + 0x40 * (stack->stack_no + 1),
>>                               &stack->pci_regs_mr);
>> -    pnv_xscom_add_subregion(chip,
>> -                            pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
>> -                            0x40 * stack->stack_no,
>> -                            &stack->phb_regs_mr);
>>   }
> 
> 
> Can't we simply move the XSCOM init and mapping under phb4 realize routine ?

There's a lot of code to be moved when doing that but in theory we can. It would
simplify some things (e.g. we wouldn't need to check stack->phb != NULL in
phb4_update_maps() like we need to do in the next patch).

I also got cold feet about the repercussions of creating a stack without any XSCOM
mapped on it, but perhaps this is the right time to see if that's possible and, if not,
try to understand why.


Thanks,


Daniel



> 
> Thanks,
> 
> C.
> 
> 
>>   static Property pnv_pec_stk_properties[] = {
>>
> 

