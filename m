Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 437EB48B09D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 16:15:04 +0100 (CET)
Received: from localhost ([::1]:35824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7IrX-0001i9-DR
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 10:15:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n7Iag-0007Pr-3b; Tue, 11 Jan 2022 09:57:41 -0500
Received: from [2607:f8b0:4864:20::a2e] (port=35723
 helo=mail-vk1-xa2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n7Iad-0002gO-Vh; Tue, 11 Jan 2022 09:57:37 -0500
Received: by mail-vk1-xa2e.google.com with SMTP id 19so2797459vkl.2;
 Tue, 11 Jan 2022 06:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zR/N0Etwa+uo85VQ6aqCyHjsRPmq2cHcz5mN6BN+TOw=;
 b=ceTiDdVqYyObJlwuY9Fe/v2oW5Q8rXXWmK543UeKNnspmQzITVbrFUnmnoke5k+dmi
 PZT5L6ixjX/E4YVp798xUpN8INuKmj3iGoQUwEREfelo9BcHRw2uXEcN30cics4XMzOG
 APjSLG9c+OeiRqc28mO+64gEF/7iD0pWEsGEZXXf82q5b50bMyVK2T6E0JIZLvjlQJUJ
 C1z9yZ4YpBczPTokNgCouQ/BzPY86VqtoVjaxncRY5BNTKA5yCF2ofxyt9Jik51Fd0S/
 wauoqMiirxZ7jGpfs1o/G3PNnrdnnPm0R/a6655Is9ZNb+S+A5diuH4xxIewVT/E/MxL
 EQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zR/N0Etwa+uo85VQ6aqCyHjsRPmq2cHcz5mN6BN+TOw=;
 b=TVxAGnxVmZGpI3EY3SbQFhKV79/2DKOErY1DAyj2RcGoYM7XAAhyk0zzjX9FSBngrm
 0hHyHYi2LnweNxvmnOOpGfFwkGE5XTRu1zVvweU9t2BvjHdWxshLuibnvTaevDfZIszc
 yaQaIBAdYVBTeX+0FTrvJkJARLJnOjCCJdzwZ5GZ2WLvKo7leqxtaOtU9a7Duiim1MOR
 oh/nctPbDmrNAwiDZBPi0Jh3k9Jlkf0Ag8eBmZ4+DxNhgI3j5B1xbrpnrpUGr8hD/o7k
 IcZcqyRLPlAsbqy5DAYVE+2MWaAW96EILHs4+ne6ZG4+YGhi5hLrA+JjOAiVj5qDYVQ+
 4BXA==
X-Gm-Message-State: AOAM530hnsbqh3lueyINVpLDt3punhmhB1NcKMOa3UZno2NWtRhoNWcz
 Bkv20xN5+nggLUeszQRIRm1ZpvqltNwZ+ATa
X-Google-Smtp-Source: ABdhPJz685CfrH6qA51lDys15tIMG61aQBDk0fpTYYngAHSRvRoqTeXP15ufDivZOE67e64xkplB0w==
X-Received: by 2002:a1f:2844:: with SMTP id o65mr2359425vko.2.1641913054152;
 Tue, 11 Jan 2022 06:57:34 -0800 (PST)
Received: from [192.168.10.222] ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id q11sm6038829uaj.4.2022.01.11.06.57.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 06:57:33 -0800 (PST)
Message-ID: <a7b6515f-70da-24ce-006b-4e97a9a8577f@gmail.com>
Date: Tue, 11 Jan 2022 11:57:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 4/5] ppc/pnv: Introduce user creatable pnv-phb4 devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20220111131027.599784-1-danielhb413@gmail.com>
 <20220111131027.599784-5-danielhb413@gmail.com>
 <69ab634e-bdb6-d5ad-e6be-771ac3d9a780@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <69ab634e-bdb6-d5ad-e6be-771ac3d9a780@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa2e.google.com
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



On 1/11/22 11:42, Cédric Le Goater wrote:
> On 1/11/22 14:10, Daniel Henrique Barboza wrote:
>> This patch introduces pnv-phb4 user creatable devices that are created
>> in a similar manner as pnv-phb3 devices, allowing the user to interact
>> with the PHBs directly instead of creating PCI Express Controllers that
>> will create a certain amount of PHBs per controller index.
>>
>> We accomplish this by doing the following:
>>
>> - add a pnv_phb4_get_stack() helper to retrieve which stack an user
>> created phb4 would occupy;
>>
>> - when dealing with an user created pnv-phb4 (detected by checking if
>> phb->stack is NULL at the start of phb4_realize()), retrieve its stack
>> and initialize its properties as done in stk_realize();
>>
>> - use 'defaults_enabled()' in stk_realize() to avoid creating and
>> initializing a 'stack->phb' qdev that might be overwritten by an user
>> created pnv-phb4 device. This process is wrapped into a new helper
>> called pnv_pec_stk_default_phb_realize().
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> 
> Nothing is left in the stack model. I think the next cleanup is to
> get rid of it.


The first step would be to move some MemoryOps from the stack to the phb, then
little by little we can get into a point where the stack will just be a pointer
to its phb.

This is something that we can keep working on in smaller bits here and there.
I mean, assuming that we're not going to use this code base for PHB5. If that's
the case then I can prioritize this cleanup.



Thanks,

Daniel




> 
> Thanks,
> 
> C.
> 
> 
>> ---
>>   hw/pci-host/pnv_phb4.c     | 74 ++++++++++++++++++++++++++++++++++++--
>>   hw/pci-host/pnv_phb4_pec.c | 17 +++++++--
>>   hw/ppc/pnv.c               |  2 ++
>>   3 files changed, 89 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
>> index ee046725ac..ca2f4078e5 100644
>> --- a/hw/pci-host/pnv_phb4.c
>> +++ b/hw/pci-host/pnv_phb4.c
>> @@ -1487,15 +1487,85 @@ static void pnv_phb4_instance_init(Object *obj)
>>       object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE);
>>   }
>> +static PnvPhb4PecStack *pnv_phb4_get_stack(PnvChip *chip, PnvPHB4 *phb,
>> +                                           Error **errp)
>> +{
>> +    Pnv9Chip *chip9 = PNV9_CHIP(chip);
>> +    int chip_id = phb->chip_id;
>> +    int index = phb->phb_id;
>> +    int i, j;
>> +
>> +    for (i = 0; i < chip->num_pecs; i++) {
>> +        /*
>> +         * For each PEC, check the amount of stacks it supports
>> +         * and see if the given phb4 index matches a stack.
>> +         */
>> +        PnvPhb4PecState *pec = &chip9->pecs[i];
>> +
>> +        for (j = 0; j < pec->num_stacks; j++) {
>> +            if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
>> +                return &pec->stacks[j];
>> +            }
>> +        }
>> +    }
>> +
>> +    error_setg(errp,
>> +               "pnv-phb4 chip-id %d index %d didn't match any existing PEC",
>> +               chip_id, index);
>> +
>> +    return NULL;
>> +}
>> +
>>   static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>>   {
>>       PnvPHB4 *phb = PNV_PHB4(dev);
>>       PCIHostState *pci = PCI_HOST_BRIDGE(dev);
>>       XiveSource *xsrc = &phb->xsrc;
>> +    Error *local_err = NULL;
>>       int nr_irqs;
>>       char name[32];
>> -    assert(phb->stack);
>> +    /* User created PHB */
>> +    if (!phb->stack) {
>> +        PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
>> +        PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
>> +        PnvPhb4PecClass *pecc;
>> +        BusState *s;
>> +
>> +        if (!chip) {
>> +            error_setg(errp, "invalid chip id: %d", phb->chip_id);
>> +            return;
>> +        }
>> +
>> +        phb->stack = pnv_phb4_get_stack(chip, phb, &local_err);
>> +        if (local_err) {
>> +            error_propagate(errp, local_err);
>> +            return;
>> +        }
>> +
>> +        /* All other phb properties but 'version' are already set */
>> +        pecc = PNV_PHB4_PEC_GET_CLASS(phb->stack->pec);
>> +        object_property_set_int(OBJECT(phb), "version", pecc->version,
>> +                                &error_fatal);
>> +
>> +        /*
>> +         * Assign stack->phb since pnv_phb4_update_regions() uses it
>> +         * to access the phb.
>> +         */
>> +        phb->stack->phb = phb;
>> +
>> +        /*
>> +         * Reparent user created devices to the chip to build
>> +         * correctly the device tree.
>> +         */
>> +        pnv_chip_parent_fixup(chip, OBJECT(phb), phb->phb_id);
>> +
>> +        s = qdev_get_parent_bus(DEVICE(chip));
>> +        if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
>> +            error_propagate(errp, local_err);
>> +            return;
>> +        }
>> +    }
>>       /* Set the "big_phb" flag */
>>       phb->big_phb = phb->phb_id == 0 || phb->phb_id == 3;
>> @@ -1600,7 +1670,7 @@ static void pnv_phb4_class_init(ObjectClass *klass, void *data)
>>       dc->realize         = pnv_phb4_realize;
>>       device_class_set_props(dc, pnv_phb4_properties);
>>       set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>> -    dc->user_creatable  = false;
>> +    dc->user_creatable  = true;
>>       xfc->notify         = pnv_phb4_xive_notify;
>>   }
>> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
>> index d4c52a5d28..7fe7f1f007 100644
>> --- a/hw/pci-host/pnv_phb4_pec.c
>> +++ b/hw/pci-host/pnv_phb4_pec.c
>> @@ -19,6 +19,7 @@
>>   #include "hw/pci/pci_bus.h"
>>   #include "hw/ppc/pnv.h"
>>   #include "hw/qdev-properties.h"
>> +#include "sysemu/sysemu.h"
>>   #include <libfdt.h>
>> @@ -275,9 +276,9 @@ static const TypeInfo pnv_pec_type_info = {
>>       }
>>   };
>> -static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>> +static void pnv_pec_stk_default_phb_realize(PnvPhb4PecStack *stack,
>> +                                            Error **errp)
>>   {
>> -    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(dev);
>>       PnvPhb4PecState *pec = stack->pec;
>>       PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
>>       int phb_id = pnv_phb4_pec_get_phb_id(pec, stack->stack_no);
>> @@ -292,11 +293,23 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>>                               &error_fatal);
>>       object_property_set_link(OBJECT(stack->phb), "stack", OBJECT(stack),
>>                                &error_abort);
>> +
>>       if (!sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
>>           return;
>>       }
>>   }
>> +static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>> +{
>> +    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(dev);
>> +
>> +    if (!defaults_enabled()) {
>> +        return;
>> +    }
>> +
>> +    pnv_pec_stk_default_phb_realize(stack, errp);
>> +}
>> +
>>   static Property pnv_pec_stk_properties[] = {
>>           DEFINE_PROP_UINT32("stack-no", PnvPhb4PecStack, stack_no, 0),
>>           DEFINE_PROP_LINK("pec", PnvPhb4PecStack, pec, TYPE_PNV_PHB4_PEC,
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index fe7e67e73a..837146a2fb 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -1960,6 +1960,8 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
>>       pmc->compat = compat;
>>       pmc->compat_size = sizeof(compat);
>>       pmc->dt_power_mgt = pnv_dt_power_mgt;
>> +
>> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB4);
>>   }
>>   static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
>>
> 

