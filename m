Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F0748AB66
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 11:31:04 +0100 (CET)
Received: from localhost ([::1]:36720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7EQi-0006C3-1j
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 05:31:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n7EOI-0004hE-LB; Tue, 11 Jan 2022 05:28:34 -0500
Received: from [2607:f8b0:4864:20::a2e] (port=41967
 helo=mail-vk1-xa2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n7EOG-0004W0-QQ; Tue, 11 Jan 2022 05:28:34 -0500
Received: by mail-vk1-xa2e.google.com with SMTP id e123so1036999vkb.8;
 Tue, 11 Jan 2022 02:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RyZWSQSVIxi2LXGGyi/9SUgtxl1Fz4ocGTQkJyqHo+g=;
 b=e5/fe7i/RRx6ZFtpxsT4/jtAb0kmHmfcvZUdpa6912NltUIx/TPP7CT7JGld7TUULs
 sE7D9FMydUOah6MiaQwjQCzahUz7FO1jPb2SRMpK1U4f4Df68mjs+4+uCaKHd2RvU1ml
 Jx0bqthpLosZC3zBUApEPpmjn06rT6OvdJG0ZcCCgR5yC5oG4aqHnI7jV9YXqw66DKd5
 +8hUHoO5kCsW9kP5blIyZ1bgH0Dw7v2B11Th+auNMNt9W8xCz+9LF3aWVeZ9wpFecNMM
 Qy0BokJ8bcTL+wdW90hfyxADOmODmLc5pKR+EsaURiQ8HuPGcn9p5dgIyj5Juzr2XtgO
 Bymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RyZWSQSVIxi2LXGGyi/9SUgtxl1Fz4ocGTQkJyqHo+g=;
 b=OHOQ5cU/n+rEJ+0waFYq+iWjXfDuvIYYAFZkq8daFLonUKNRHqPVDfL2+zr8PiqJJq
 /rA4jjufK22g4Y945tmBlZPdhyC8nQITNV6mD9E7hTfW7bIJGr0wkSbWeUTc4xE6Nhso
 V7CtOVkeLT61HatwTKH9VZqg+dqex+PVlUv1bNXk1t5bb18+iM8exbamMap+kVnMII8L
 Lo7MBV+fhP4VFe7vXz1qIToY8lprsc546OdXrt0X+O+whlNA1xo7KqM99hR8WxJQ6Miz
 3QzmFc4s/JSyi0VHGeXyV8oq3RoGe/vIVEFKwFSqccdelAc4B00VCWxhkf+lDgeoVajo
 S5Dw==
X-Gm-Message-State: AOAM532XBvK76AB3A6MOjCY5eigH+W6OuFzZ4vKScNH3QUYVl7syCeB/
 ymnE086pkRjiLro7dnNe+VY=
X-Google-Smtp-Source: ABdhPJxVLVf1GfLsIzkYO2Vf18MlDy92KhNp7HXtveo7IzCb3ajoj7yHjwomNfqSy3+I0ogc7COSZw==
X-Received: by 2002:a1f:ff0a:: with SMTP id p10mr1781606vki.1.1641896911393;
 Tue, 11 Jan 2022 02:28:31 -0800 (PST)
Received: from [192.168.10.222] ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id k15sm5989464vsj.3.2022.01.11.02.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 02:28:31 -0800 (PST)
Message-ID: <e7089b0e-a661-b6cf-c7bb-fd9731176488@gmail.com>
Date: Tue, 11 Jan 2022 07:28:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 4/5] ppc/pnv: Introduce user creatable pnv-phb4 devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20220111005558.549685-1-danielhb413@gmail.com>
 <20220111005558.549685-5-danielhb413@gmail.com>
 <3e80ed50-37db-4b39-7c02-d69350fbf3c3@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <3e80ed50-37db-4b39-7c02-d69350fbf3c3@kaod.org>
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



On 1/11/22 06:56, Cédric Le Goater wrote:
> On 1/11/22 01:55, Daniel Henrique Barboza wrote:
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
>> created pnv-phb4 device.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/pci-host/pnv_phb4.c     | 75 +++++++++++++++++++++++++++++++++++++-
>>   hw/pci-host/pnv_phb4_pec.c |  5 +++
>>   hw/ppc/pnv.c               |  2 +
>>   3 files changed, 80 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
>> index 3ffa8f51e9..10f8d6a919 100644
>> --- a/hw/pci-host/pnv_phb4.c
>> +++ b/hw/pci-host/pnv_phb4.c
>> @@ -1487,15 +1487,86 @@ static void pnv_phb4_instance_init(Object *obj)
>>       object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE);
>>   }
>> +static PnvPhb4PecStack *pnv_phb4_get_stack(int chip_id, int index,
>> +                                           Error **errp)
>> +{
>> +    PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
>> +    PnvChip *chip = pnv_get_chip(pnv, chip_id);
>> +    Pnv9Chip *chip9 = PNV9_CHIP(chip);
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
> 
> Arg. my comment on the pnv_phb4_get_stack() prototype was clearly
> a mistake ! We are calling twice pnv_get_chip() to get the chip
> and there is no reason for it.
> 
> Can you changed it back ? Sorry about that ... You can flame m
hehehe don't worry about. I'll change it back.

I'll also take the opportunity to test the changes proposed in patch 2 in my env
to make sure we're good there as well.


Thanks,


Daniel


> 
>> +        PnvPhb4PecClass *pecc;
>> +        BusState *s;
>> +
>> +        if (!chip) {
>> +            error_setg(errp, "invalid chip id: %d", phb->chip_id);
>> +            return;
>> +        }
>> +
>> +        phb->stack = pnv_phb4_get_stack(phb->chip_id, phb->phb_id,
>> +                                        &local_err);
>> +        if (local_err) {
>> +            error_propagate(errp, local_err);
>> +            return;
>> +        }
>> +
>> +        /* All other phb properties but 'version' are already set */
>> +        pecc = PNV_PHB4_PEC_GET_CLASS(phb->stack->pec);
>> +        object_property_set_int(OBJECT(phb), "version", pecc->version,
>> +                                &error_fatal);
> 
> Yes :/ This version is a constant and should probably be a class attribute.
> 
> I am not sure we need a property anymore. we could change pnv_phb4_reg_read()
> with :
>     switch (off) {
>     case PHB_VERSION:
>          return PNV_PHB4_PEC_GET_CLASS(phb->stack->pec)->version;
> 
> 
> Another small problem to handle is the root port type :
> 
>      /* Add a single Root port if running with defaults */
>      if (defaults_enabled()) {
>          pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
>                                   TYPE_PNV_PHB4_ROOT_PORT);
>      }
> 
> 
> With PHB5, we should use another type. This can come later.
> 
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
>>       pnv_phb4_XSCOM_init(phb);
>> @@ -1600,7 +1671,7 @@ static void pnv_phb4_class_init(ObjectClass *klass, void *data)
>>       dc->realize         = pnv_phb4_realize;
>>       device_class_set_props(dc, pnv_phb4_properties);
>>       set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>> -    dc->user_creatable  = false;
>> +    dc->user_creatable  = true;
>>       xfc->notify         = pnv_phb4_xive_notify;
>>   }
>> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
>> index d4c52a5d28..dfd25831d5 100644
>> --- a/hw/pci-host/pnv_phb4_pec.c
>> +++ b/hw/pci-host/pnv_phb4_pec.c
>> @@ -19,6 +19,7 @@
>>   #include "hw/pci/pci_bus.h"
>>   #include "hw/ppc/pnv.h"
>>   #include "hw/qdev-properties.h"
>> +#include "sysemu/sysemu.h"
>>   #include <libfdt.h>
>> @@ -282,6 +283,10 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>>       PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
>>       int phb_id = pnv_phb4_pec_get_phb_id(pec, stack->stack_no);
>> +    if (!defaults_enabled()) {> +        return;
> 
> May be move all the code doing the PHB4 device realize in a helper routine
> and call it under if (defaults_enabled()) { ... }
> 
> Thanks,
> 
> C.
> 
> 
>> +    }
>> +
>>       stack->phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
>>
>>       object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
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

