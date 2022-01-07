Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3906487E1C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:18:59 +0100 (CET)
Received: from localhost ([::1]:34102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5wdV-0000ug-KH
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:18:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5wbx-0007sN-8H; Fri, 07 Jan 2022 16:17:21 -0500
Received: from [2607:f8b0:4864:20::f30] (port=35387
 helo=mail-qv1-xf30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5wbu-0005vR-Pl; Fri, 07 Jan 2022 16:17:20 -0500
Received: by mail-qv1-xf30.google.com with SMTP id a8so1260043qvx.2;
 Fri, 07 Jan 2022 13:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CiP7v1ib+HAB7yg70UMo7CvRSuOitxzhUQQZvt4FX1c=;
 b=AjXZTKbf3/4NZer6i0cX+ZfuqilyhrFOVdJ8maem3qXYdHM9uNzla0J5loGAhpxQgl
 KzsNxkXAz3cVeL1r3AlppJ+tK4aruHqtkQG58kGMIF1ZH5KQ+9vjrxXHsNgQYxHszWXs
 KtgsxrXebSkCvEplP1YXU/2uwZhhuJ4CuK7ksW8xSNCFawmK2h4OodPRlp8aFXPJ0wrW
 wvSdEOoxV9yChVvq6FCMlrbNfKcfX3EMm25mwtbzJPIPmmSIrbYXdLrymMmSK7VnHVmp
 rL8RzUpF/jjiK/19s3xnuLgj/ahld44GFwC1flxJ1oGeryo41DnUvGYCsL4lcX9Y7RZX
 lolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CiP7v1ib+HAB7yg70UMo7CvRSuOitxzhUQQZvt4FX1c=;
 b=woXkUqZZb34+DuZDpwSaAPoDZkv80XrpkLo9FxqMkuVO8pHj1/uo4GWXC0y0UFFBva
 JtIbFrW+5FoLoKv/Th05DWDa0q8NHhyK0uis3hLB2ya9693C7eRjthFP8oE5zryeFw/k
 /HmJJflWtV1yPMcYIEtlCLPxUCPx/JJujFN9kCNgJ+F5gI1joH2cTm2f7w6rp47a8TM2
 GAkRx9kPXgHNoYN7PwnMMW5x0rVgGNmd0WkuMFOFLe4nnsww5Gk8rYTfLB/kp5QVGMim
 cICj8qKSfr+rAKO2opYSGkfa31m0beCgeQwMa8RKC6RFHA+LVMAlZLReeEj3lWM6m+5h
 nijQ==
X-Gm-Message-State: AOAM530hfS7auLuH7AxY22kg5dMVeGAxlXA6HRP51faS7RdRSqqoM9+i
 lI8305IoIvCUX8Mj0OSdYljRM0GuIBw=
X-Google-Smtp-Source: ABdhPJwfODJoCNdjp3IpQd93miWQkV8jn5Sw7AgriT2Q1QC6XzG9hiGiM+C3QSMXvlZ6SZZnxMi/Sw==
X-Received: by 2002:a05:6214:f07:: with SMTP id
 gw7mr6614120qvb.6.1641590236135; 
 Fri, 07 Jan 2022 13:17:16 -0800 (PST)
Received: from [192.168.10.222] ([179.110.60.42])
 by smtp.gmail.com with ESMTPSA id d5sm3377465qte.26.2022.01.07.13.17.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 13:17:15 -0800 (PST)
Message-ID: <3464eb94-7905-fe0d-7924-8cd22d1a555e@gmail.com>
Date: Fri, 7 Jan 2022 18:17:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 17/18] ppc/pnv: Introduce user creatable pnv-phb4
 devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20220105212338.49899-1-danielhb413@gmail.com>
 <20220105212338.49899-18-danielhb413@gmail.com>
 <4c3eab1f-e435-b468-96e3-9f3d78430534@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <4c3eab1f-e435-b468-96e3-9f3d78430534@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 1/6/22 11:49, Cédric Le Goater wrote:
> On 1/5/22 22:23, Daniel Henrique Barboza wrote:
>> This patch introduces pnv-phb4 user creatable devices that are created
>> in a similar manner as pnv-phb3 devices, allowing the user to interact
>> with the PHBs directly instead of creating PCI Express Controllers that
>> will create a certain amount of PHBs per controller index.
>>
>> First thing we need is to discover which stack will host the created
>> PHB, which is done by the new pnv_phb4_get_stack() function. During
>> pnv_phb4_realize() we'll inspect phb->stack to see if we're dealing with
>> an user creatable device or not. When using default settings, the
>> automatically created PHB4 devices will be realized with phb->stack
>> already assigned beforehand during PEC realize. In case we're dealing
>> with an user device, find its stack, set the PHB attributes based on the
>> stack it belongs and assign the PHB to the stack.
>>
>> The xscom stack initialization takes place in pnv_pec_stk_realize() when
>> using default settings, but at that point we aren't aware of any user
>> PHB4 devices that will belong to the stack. In that case we'll postpone
>> xscom stack init until the the end of pnv_phb4_realize(), after all the
>> memory mappings of the PHB are done.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/pci-host/pnv_phb4.c     | 84 +++++++++++++++++++++++++++++++++++++-
>>   hw/pci-host/pnv_phb4_pec.c | 12 +++---
>>   hw/ppc/pnv.c               |  2 +
>>   3 files changed, 90 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
>> index 430a5c10f4..1c2334d491 100644
>> --- a/hw/pci-host/pnv_phb4.c
>> +++ b/hw/pci-host/pnv_phb4.c
>> @@ -1236,6 +1236,41 @@ static void pnv_phb4_instance_init(Object *obj)
>>       object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE);
>>   }
>> +static PnvPhb4PecStack *pnv_phb4_get_stack(PnvChip *chip, PnvPHB4 *phb,
>> +                                           Error **errp)
>> +{
>> +    Pnv9Chip *chip9 = NULL;
>> +    int chip_id = phb->chip_id;
>> +    int index = phb->phb_id;
>> +    int i, j;
>> +
>> +    if (chip->num_pecs == 0) {
> 
> assert() maybe ?
> 
> 
>> +        /* Something weird happened. Bail out */
>> +        error_setg(errp, "chip id %d has no PCIE controllers", chip_id);
>> +        return NULL;
>> +    }
>> +
>> +    chip9 = PNV9_CHIP(chip);
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
>> +    error_setg(errp, "pnv-phb4 index %d didn't match any existing PEC",
>> +               chip_id);
>> +    return NULL;
>> +}
>> +
>>   static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>>   {
>>       PnvPHB4 *phb = PNV_PHB4(dev);
>> @@ -1243,8 +1278,49 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>>       XiveSource *xsrc = &phb->xsrc;
>>       int nr_irqs;
>>       char name[32];
>> +    PnvPhb4PecStack *stack = NULL;
>> +    bool stack_init_xscom = false;
>> +    Error *local_err = NULL;
>> -    assert(phb->stack);
>> +    /* User created PHB */
>> +    if (!phb->stack) {
>> +        PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
>> +        PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
>> +        BusState *s;
>> +
>> +        if (!chip) {
>> +            error_setg(errp, "invalid chip id: %d", phb->chip_id);
>> +            return;
>> +        }
>> +
>> +        stack = pnv_phb4_get_stack(chip, phb, &local_err);
>> +        if (local_err) {
>> +            error_propagate(errp, local_err);
>> +            return;
>> +        }
>> +
>> +        object_property_set_int(OBJECT(phb), "index",
>> +                                phb->phb_id, &error_abort);
>> +
>> +        pnv_phb4_set_stack_phb_props(stack, phb);
>> +
>> +        /* Assign the phb to the stack */
>> +        stack->phb = phb;
> 
> The stack object should check the validity of the stack->phb pointer always.


What do you mean by "check the validity"?



Thanks,


Daniel

> 
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
>> +
>> +        stack_init_xscom = true;
> 
> This looks wrong.
> 
>> +    }
>>       /* Set the "big_phb" flag */
>>       phb->big_phb = phb->phb_id == 0 || phb->phb_id == 3;
>> @@ -1298,6 +1374,10 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>>       pnv_phb4_update_xsrc(phb);
>>       phb->qirqs = qemu_allocate_irqs(xive_source_set_irq, xsrc, xsrc->nr_irqs);
>> +
>> +    if (stack_init_xscom) {
>> +        pnv_pec_init_stack_xscom(stack);
>> +    }
> 
> Isn't it done under the pnv_pec_stk_realize() routine already ?
> 
>>   }
>>   static const char *pnv_phb4_root_bus_path(PCIHostState *host_bridge,
>> @@ -1347,7 +1427,7 @@ static void pnv_phb4_class_init(ObjectClass *klass, void *data)
>>       dc->realize         = pnv_phb4_realize;
>>       device_class_set_props(dc, pnv_phb4_properties);
>>       set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>> -    dc->user_creatable  = false;
>> +    dc->user_creatable  = true;
>>       xfc->notify         = pnv_phb4_xive_notify;
>>   }
>> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
>> index 41c79d24c4..4417beb97d 100644
>> --- a/hw/pci-host/pnv_phb4_pec.c
>> +++ b/hw/pci-host/pnv_phb4_pec.c
>> @@ -573,13 +573,13 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>>                             &pnv_pec_stk_pci_xscom_ops, stack, name,
>>                             PHB4_PEC_PCI_STK_REGS_COUNT);
>> -    /* PHB pass-through */
>> -    pnv_phb4_set_stack_phb_props(stack, stack->phb);
>> -    if (!sysbus_realize(SYS_BUS_DEVICE(&stack->phb), errp)) {
>> -        return;
>> +    /*
>> +     * There is no guarantee that stack->phb will be available
>> +     * at this point.
>> +     */
>> +    if (stack->phb) {
>> +        pnv_pec_init_stack_xscom(stack);
>>       }
>> -
>> -    pnv_pec_init_stack_xscom(stack);
> 
> 
> This looks wrong also. I don't understand why.
> 
> Thanks,
> 
> C.
> 
> 
>>   }
>>   static Property pnv_pec_stk_properties[] = {
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

