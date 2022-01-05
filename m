Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B1648591E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 20:25:04 +0100 (CET)
Received: from localhost ([::1]:59986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5BuA-0008GB-N0
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 14:25:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5BkE-0002Sf-LN; Wed, 05 Jan 2022 14:14:46 -0500
Received: from [2607:f8b0:4864:20::929] (port=40604
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5BkC-0007Sm-E2; Wed, 05 Jan 2022 14:14:46 -0500
Received: by mail-ua1-x929.google.com with SMTP id v12so215120uar.7;
 Wed, 05 Jan 2022 11:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=igro2OJILGJHa7LXVwq3naO5aYEf1myno8Fm8CqM3WQ=;
 b=hsZ7/tX2Kk6cKqm194XS2iygi3q1VpETDujvw18/I5JbfRTOfIUlJQP8O3lQE3snzB
 KxBeReZgrOoyC5dT4RXKcYN7L7+zs5fLYKTPXhMnWYTFIo2q/LcKJqaIe3pO6ozqPejB
 ggG66nABz4zovgwjHMwhbzYeqAq9wxGbdby0mcB1Nu//CmBjql8JSpZJeic2nL4PVOC3
 ll2RdN/QaWOuud/Q53lj09knPqEl83GU3eilpNfgYF9LNdZcR11jGQBRQ3ZHKSqIZIDO
 dvI75MLG0Xe78+r6a6GZ3kj9P10Worm3OQBEROyPnc6Ed95Qfm8P8r8IwTUmCW+8jAL0
 QVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=igro2OJILGJHa7LXVwq3naO5aYEf1myno8Fm8CqM3WQ=;
 b=h6n/DV1OgSbrtYxdHbPukuBBUTWgaag8oaI0EdQ0yl7Fv2xaodpqSGZJLj74fbaKrz
 9JA9BfbnRH7QttAgTGMRrmAKbljYxKGjkoyg7lRjiJ50U+cvKobhbMSmJhIkPtzS2SRL
 kQQUOTSyPecqbPJ0kW/7enp9mae52z2t05ImBvTyQgGtH9mdSh/GxDAr6O8/V51yTHNO
 f8xfcxw040S0kayUd+n+Ooopn1C/Mqz/nNRd8HuLCbkD0aAH1/j//CGIKA2nYb6Nb4Ue
 fdl/jmrNAgGMyacvv4KFer4fT1ol7ksaQL7mDSOXm1JIwydOxKMTDpuJy4BxYurfInsA
 CQgw==
X-Gm-Message-State: AOAM531h5mi9Uppo4wx5m2biX9KcAHh/v4d+bt9y9z3VJNXrcOSgV1OO
 tEjqlNM9pFnS6n7mi138QizIppGkhIw=
X-Google-Smtp-Source: ABdhPJwszd1hpluWd+6AA+9zsXUvL/6y6UtFRAJ7BJpQ4ye9zRlbw1UzQbdeKuGfQWV3pIUfggoXBg==
X-Received: by 2002:ab0:13c3:: with SMTP id n3mr16068301uae.39.1641410081634; 
 Wed, 05 Jan 2022 11:14:41 -0800 (PST)
Received: from ?IPV6:2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7?
 ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id f1sm1077157uae.5.2022.01.05.11.14.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 11:14:41 -0800 (PST)
Message-ID: <017b4cc6-3275-df95-c9b3-2067edb780c7@gmail.com>
Date: Wed, 5 Jan 2022 16:14:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 09/17] pnv_phb4_pec.c: move pnv_pec_phb_offset() to
 pnv_phb4.c
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20211228193806.1198496-1-danielhb413@gmail.com>
 <20211228193806.1198496-10-danielhb413@gmail.com>
 <dc489ab6-3d0c-f6ab-4fe4-bf179081ecf4@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <dc489ab6-3d0c-f6ab-4fe4-bf179081ecf4@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.057,
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



On 1/3/22 06:00, Cédric Le Goater wrote:
> On 12/28/21 20:37, Daniel Henrique Barboza wrote:
>> The logic inside pnv_pec_phb_offset() wiil be useful in the next patch
> 
> will
> 
>> to determine the stack that should contain a PHB4 device.
>>
>> Move the function to pnv_phb4.c and make it public since there's no
>> pnv_phb4_pec.h header. While we're at it, add 'stack_index' as a
>> parameter and make the function return 'phb-id' directly. And rename it
>> to pnv_pec_get_phb_id() to be even clearer about the function intent.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> Looks good,
> 
>> ---
>>   hw/pci-host/pnv_phb4.c         | 17 +++++++++++++++++
>>   hw/pci-host/pnv_phb4_pec.c     | 15 +--------------
>>   include/hw/pci-host/pnv_phb4.h |  2 ++
>>   3 files changed, 20 insertions(+), 14 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
>> index 0ea505cc94..36c56007ba 100644
>> --- a/hw/pci-host/pnv_phb4.c
>> +++ b/hw/pci-host/pnv_phb4.c
>> @@ -1164,6 +1164,23 @@ static AddressSpace *pnv_phb4_dma_iommu(PCIBus *bus, void *opaque, int devfn)
>>       return &ds->dma_as;
>>   }
>> +/*
>> + * Return the index/phb-id of a PHB4 that belongs to a
>> + * pec->stacks[stack_index] stack.
>> + */
>> +int pnv_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index)
> 
> pnv_phb4_pec_get_phb_id() would be cleaner.

Changed in the upcoming v2.


Daniel

> 
> Thanks,
> 
> C.
> 
> 
> 
>> +{
>> +    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
>> +    int index = pec->index;
>> +    int offset = 0;
>> +
>> +    while (index--) {
>> +        offset += pecc->num_stacks[index];
>> +    }
>> +
>> +    return offset + stack_index;
>> +}
>> +
>>   /*
>>    * Set the object properties of a phb in relation with its stack.
>>    *
>> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
>> index 700ee4b185..bc2f8bb8b1 100644
>> --- a/hw/pci-host/pnv_phb4_pec.c
>> +++ b/hw/pci-host/pnv_phb4_pec.c
>> @@ -374,19 +374,6 @@ static void pnv_pec_instance_init(Object *obj)
>>       }
>>   }
>> -static int pnv_pec_phb_offset(PnvPhb4PecState *pec)
>> -{
>> -    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
>> -    int index = pec->index;
>> -    int offset = 0;
>> -
>> -    while (index--) {
>> -        offset += pecc->num_stacks[index];
>> -    }
>> -
>> -    return offset;
>> -}
>> -
>>   static void pnv_pec_realize(DeviceState *dev, Error **errp)
>>   {
>>       PnvPhb4PecState *pec = PNV_PHB4_PEC(dev);
>> @@ -422,7 +409,7 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>>       for (i = 0; i < pec->num_stacks; i++) {
>>           PnvPhb4PecStack *stack = &pec->stacks[i];
>>           Object *stk_obj = OBJECT(stack);
>> -        int phb_id = pnv_pec_phb_offset(pec) + i;
>> +        int phb_id =  pnv_pec_get_phb_id(pec, i);
>>           object_property_set_int(stk_obj, "stack-no", i, &error_abort);
>>           object_property_set_int(stk_obj, "phb-id", phb_id, &error_abort);
>> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
>> index d7838513f1..0fa88ca3fa 100644
>> --- a/include/hw/pci-host/pnv_phb4.h
>> +++ b/include/hw/pci-host/pnv_phb4.h
>> @@ -15,6 +15,7 @@
>>   #include "hw/ppc/xive.h"
>>   #include "qom/object.h"
>> +typedef struct PnvPhb4PecState PnvPhb4PecState;
>>   typedef struct PnvPhb4PecStack PnvPhb4PecStack;
>>   typedef struct PnvPHB4 PnvPHB4;
>>   typedef struct PnvChip PnvChip;
>> @@ -134,6 +135,7 @@ struct PnvPHB4 {
>>   void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon);
>>   void pnv_phb4_update_regions(PnvPhb4PecStack *stack);
>>   void pnv_phb4_set_stack_phb_props(PnvPhb4PecStack *stack, PnvPHB4 *phb);
>> +int pnv_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index);
>>   extern const MemoryRegionOps pnv_phb4_xscom_ops;
>>   /*
>>
> 

