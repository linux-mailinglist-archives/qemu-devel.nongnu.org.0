Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B9F48E951
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 12:41:50 +0100 (CET)
Received: from localhost ([::1]:60642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Kxp-0001WR-Qz
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 06:41:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n8Klb-0003nC-T8; Fri, 14 Jan 2022 06:29:11 -0500
Received: from [2607:f8b0:4864:20::232] (port=44932
 helo=mail-oi1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n8KlY-0007J5-MS; Fri, 14 Jan 2022 06:29:10 -0500
Received: by mail-oi1-x232.google.com with SMTP id s9so11719980oib.11;
 Fri, 14 Jan 2022 03:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QJbkwhe2dPr1TViEGHvCtHZd5EktpjdUkvPQl5mimeo=;
 b=bETS6eAkncLKNdxFbcWjFNSMkNiFLKSj19e9llOOVF2XcPO6Sx7OswdDws8C3zCoee
 rjKPTvwmsolbmI+g36Rd6tWCDdefJ1u6dhIMKL8ZhZ1y3ks6AZI1Yfw5Zaj6DbATV1Fq
 U9dAoCdoD0KrT8zRDreOELWHAszSJrgHYXJr+eB4XWp//s2qtlZW5oGuApetwb6xEzFc
 h38W+RgCw6Sy+JeXEKh+lRqIEWP0bWATnVv7lUMapglh7M86f641zSpyUYis33UFY/DV
 Al2JQDvwQpgI1Hoth0e7DGvRCFk28wbyZxbv/Rwr4Wj6rZzlIWiHvP5eyNyL15aroSRy
 qT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QJbkwhe2dPr1TViEGHvCtHZd5EktpjdUkvPQl5mimeo=;
 b=gQErE7vB8Iw0C12w5WOrLG3cvFa1AGAkKi+k08VGaYz8ly1lM3r894OtxCaEwgDbrz
 bcsP7gA/TUwrnItpkupO0LyPACX5XMR+KIEeNckZMU+qalhbiFJcI1eZ2MeccYL4GDmk
 naYCREWGRCg3Lh51moXhRwlbjX4l+iSspnQgsFAS1donsZi/sOTzPERwcb4BsZjuLjVo
 mBbrGWllerhVRZUIhp895e9iyEV52yYEpQq4L3Axr5FOFyiJYY1UmBHARhC0H6oFst/C
 0K/ND3guhztzpTuI/xdAPp2g8I7OGXoW5jmrZh0MFxN3x8JwGSqJBW6SOFteU0lPtOoG
 a8Kg==
X-Gm-Message-State: AOAM532qFYHq6kcdolEzd3ENfVA13Sq69CVCcjx7E1bicrRlevuA19YK
 lGFLCDzXH4Urqo4p+m47FQzuVCqS1gIp/1rq
X-Google-Smtp-Source: ABdhPJw3ZRuQnBSEUuz6zcIWQso0sVouz0l239OesxF6oPUiM3hWZPP33qdqOLPrc4k9wnJ3FKNZ4Q==
X-Received: by 2002:a54:4086:: with SMTP id i6mr6838630oii.9.1642159746933;
 Fri, 14 Jan 2022 03:29:06 -0800 (PST)
Received: from [192.168.10.222] ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id w20sm1538320oti.69.2022.01.14.03.29.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 03:29:06 -0800 (PST)
Message-ID: <6501c291-38d3-3131-9b3d-7b4513cadee4@gmail.com>
Date: Fri, 14 Jan 2022 08:29:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 11/17] ppc/pnv: introduce PnvPHB4 'phb_number' property
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20220113192952.911188-1-danielhb413@gmail.com>
 <20220113192952.911188-12-danielhb413@gmail.com>
 <3416965f-203e-f902-a4cb-a5dcd4da6f83@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <3416965f-203e-f902-a4cb-a5dcd4da6f83@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::232
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 1/14/22 07:46, Cédric Le Goater wrote:
> On 1/13/22 20:29, Daniel Henrique Barboza wrote:
>> One of the remaining dependencies we have on the PnvPhb4PecStack object
>> is the stack->stack_no property. This is set as the position the stack
>> occupies in the pec->stacks[] array.
>>
>> We need a way to report this same value in the PnvPHB4. This patch
>> creates a new property called 'phb_number' to be used in existing code
>> in all instances stack->stack_no is currently being used.
>>
>> The 'phb_number' name is an indication of our future intention to convert
>> the pec->stacks[] array into a pec->phbs[] array, when the PEC object will
>> deal directly with phb4 objects.
> 
> 
> So the PHB would have a 'phb_number' and a 'index' property ? That's
> confusing. Can we simplify ? compute one from another ?
> 
> or keep 'stack_no' to make it clear this belongs to the stack subunit
> logic.


I guess for now we can keep it as phb->stack_no. We can think about reworking the
logic (my initial reaction is to keep 'index' and then derive the 'stack_no' from
it when needed) in a follow up.



Thanks,


Daniel

> 
> Thanks,
> 
> C.
> 
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/pci-host/pnv_phb4.c         | 28 +++++++++++++++++-----------
>>   hw/pci-host/pnv_phb4_pec.c     |  2 ++
>>   include/hw/pci-host/pnv_phb4.h |  3 +++
>>   3 files changed, 22 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
>> index b5045fca64..44f3087913 100644
>> --- a/hw/pci-host/pnv_phb4.c
>> +++ b/hw/pci-host/pnv_phb4.c
>> @@ -937,7 +937,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
>>           mask = phb->nest_regs[PEC_NEST_STK_MMIO_BAR0_MASK];
>>           size = ((~mask) >> 8) + 1;
>>           snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio0",
>> -                 pec->chip_id, pec->index, stack->stack_no);
>> +                 pec->chip_id, pec->index, phb->phb_number);
>>           memory_region_init(&phb->mmbar0, OBJECT(phb), name, size);
>>           memory_region_add_subregion(sysmem, bar, &phb->mmbar0);
>>           phb->mmio0_base = bar;
>> @@ -949,7 +949,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
>>           mask = phb->nest_regs[PEC_NEST_STK_MMIO_BAR1_MASK];
>>           size = ((~mask) >> 8) + 1;
>>           snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio1",
>> -                 pec->chip_id, pec->index, stack->stack_no);
>> +                 pec->chip_id, pec->index, phb->phb_number);
>>           memory_region_init(&phb->mmbar1, OBJECT(phb), name, size);
>>           memory_region_add_subregion(sysmem, bar, &phb->mmbar1);
>>           phb->mmio1_base = bar;
>> @@ -960,7 +960,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
>>           bar = phb->nest_regs[PEC_NEST_STK_PHB_REGS_BAR] >> 8;
>>           size = PNV_PHB4_NUM_REGS << 3;
>>           snprintf(name, sizeof(name), "pec-%d.%d-phb-%d",
>> -                 pec->chip_id, pec->index, stack->stack_no);
>> +                 pec->chip_id, pec->index, phb->phb_number);
>>           memory_region_init(&phb->phbbar, OBJECT(phb), name, size);
>>           memory_region_add_subregion(sysmem, bar, &phb->phbbar);
>>       }
>> @@ -969,7 +969,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
>>           bar = phb->nest_regs[PEC_NEST_STK_INT_BAR] >> 8;
>>           size = PNV_PHB4_MAX_INTs << 16;
>>           snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-int",
>> -                 stack->pec->chip_id, stack->pec->index, stack->stack_no);
>> +                 stack->pec->chip_id, stack->pec->index, phb->phb_number);
>>           memory_region_init(&phb->intbar, OBJECT(phb), name, size);
>>           memory_region_add_subregion(sysmem, bar, &phb->intbar);
>>       }
>> @@ -1469,20 +1469,20 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
>>       /* Initialize the XSCOM regions for the stack registers */
>>       snprintf(name, sizeof(name), "xscom-pec-%d.%d-nest-phb-%d",
>> -             pec->chip_id, pec->index, stack->stack_no);
>> +             pec->chip_id, pec->index, phb->phb_number);
>>       pnv_xscom_region_init(&phb->nest_regs_mr, OBJECT(phb),
>>                             &pnv_pec_stk_nest_xscom_ops, phb, name,
>>                             PHB4_PEC_NEST_STK_REGS_COUNT);
>>       snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
>> -             pec->chip_id, pec->index, stack->stack_no);
>> +             pec->chip_id, pec->index, phb->phb_number);
>>       pnv_xscom_region_init(&phb->pci_regs_mr, OBJECT(phb),
>>                             &pnv_pec_stk_pci_xscom_ops, phb, name,
>>                             PHB4_PEC_PCI_STK_REGS_COUNT);
>>       /* PHB pass-through */
>>       snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
>> -             pec->chip_id, pec->index, stack->stack_no);
>> +             pec->chip_id, pec->index, phb->phb_number);
>>       pnv_xscom_region_init(&phb->phb_regs_mr, OBJECT(phb),
>>                             &pnv_phb4_xscom_ops, phb, name, 0x40);
>> @@ -1491,14 +1491,14 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
>>       /* Populate the XSCOM address space. */
>>       pnv_xscom_add_subregion(pec->chip,
>> -                            pec_nest_base + 0x40 * (stack->stack_no + 1),
>> +                            pec_nest_base + 0x40 * (phb->phb_number + 1),
>>                               &phb->nest_regs_mr);
>>       pnv_xscom_add_subregion(pec->chip,
>> -                            pec_pci_base + 0x40 * (stack->stack_no + 1),
>> +                            pec_pci_base + 0x40 * (phb->phb_number + 1),
>>                               &phb->pci_regs_mr);
>>       pnv_xscom_add_subregion(pec->chip,
>>                               pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
>> -                            0x40 * stack->stack_no,
>> +                            0x40 * phb->phb_number,
>>                               &phb->phb_regs_mr);
>>   }
>> @@ -1568,10 +1568,15 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>>               return;
>>           }
>> -        /* All other phb properties but 'version' are already set */
>> +        /*
>> +         * All other phb properties but 'version' and 'phb-number'
>> +         * are already set.
>> +         */
>>           pecc = PNV_PHB4_PEC_GET_CLASS(phb->stack->pec);
>>           object_property_set_int(OBJECT(phb), "version", pecc->version,
>>                                   &error_fatal);
>> +        object_property_set_int(OBJECT(phb), "phb-number",
>> +                                phb->stack->stack_no, &error_abort);
>>           /*
>>            * Assign stack->phb since pnv_phb4_update_regions() uses it
>> @@ -1677,6 +1682,7 @@ static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno)
>>   }
>>   static Property pnv_phb4_properties[] = {
>> +        DEFINE_PROP_UINT32("phb-number", PnvPHB4, phb_number, 0),
>>           DEFINE_PROP_UINT32("index", PnvPHB4, phb_id, 0),
>>           DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
>>           DEFINE_PROP_UINT64("version", PnvPHB4, version, 0),
>> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
>> index 7fe7f1f007..7c4b4023df 100644
>> --- a/hw/pci-host/pnv_phb4_pec.c
>> +++ b/hw/pci-host/pnv_phb4_pec.c
>> @@ -285,6 +285,8 @@ static void pnv_pec_stk_default_phb_realize(PnvPhb4PecStack *stack,
>>       stack->phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
>> +    object_property_set_int(OBJECT(stack->phb), "phb-number", stack->stack_no,
>> +                            &error_abort);
>>       object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
>>                               &error_fatal);
>>       object_property_set_int(OBJECT(stack->phb), "index", phb_id,
>> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
>> index 6968efaba8..fc7807be1c 100644
>> --- a/include/hw/pci-host/pnv_phb4.h
>> +++ b/include/hw/pci-host/pnv_phb4.h
>> @@ -84,6 +84,9 @@ struct PnvPHB4 {
>>       uint64_t version;
>> +    /* My own PHB number */
>> +    uint32_t phb_number;
>> +
>>       char bus_path[8];
>>       /* Main register images */
>>
> 

