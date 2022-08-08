Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7818558C77B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 13:23:47 +0200 (CEST)
Received: from localhost ([::1]:54226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL0rK-0001qg-3K
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 07:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oL0YW-0000A2-BJ; Mon, 08 Aug 2022 07:04:20 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30]:40834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oL0YU-0006ag-1p; Mon, 08 Aug 2022 07:04:19 -0400
Received: by mail-vs1-xe30.google.com with SMTP id q190so8415089vsb.7;
 Mon, 08 Aug 2022 04:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=ET7oQg9os9Qp/vIgKtgeMn4NtACijAwMv97Cicmr0u4=;
 b=hQ/y1UYMqFUacRfxxiuC3wowIopMuneYYMiTrHI0D0CzmQxd41uFzrPJJHFmqbO+5U
 ry0DNjyyQPn8iJaBzTdmfn2GqAPkF1bi5UixHVYCxM5ypEzLDTukKW//5hND4t0Nqork
 /RxuFRh9zBFVfcS65pEWtE3acuLjydCqaiUsQ0RNeFMsj5GuPNtqDshHG/LR6QqVkQTQ
 gGVW5JD8PH6hOMGWl3N7UzGDt/thqI4dopr8F0qwsQnZTcYK2KEOXxg+WFB1uNyohQ3w
 D/38KsWLYEROQUgxOyCnLC0L1u0jK9PBMQLkwUQhrY5r/aW7zRWdtxR1oUSLAmmRROam
 PBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=ET7oQg9os9Qp/vIgKtgeMn4NtACijAwMv97Cicmr0u4=;
 b=TeMbF9FneVuLnsPmytGVn9Llr4OZ01JIgZUhF2gHGYpGNNW4QIBMb0WJoK7rF5aMVO
 bLjOcNoPyWEMIFG4Sc8A3ql8Bn4MoNRPgCFwZkHaE+mYUnscphjN01L7zWQkSI8UlzDu
 n+OkDoQObMTAx5iTT/kAQu+0C3oIQrcrOopLDBneAjoB9l2AjiL/9VkGVd+uITRyyQU6
 Rn6HU6zDosdh3xKt4i5DcZsI2wfXMClWjU5aCR1+tEu6pITeecbjD6fNDFmMbqXvobBD
 9nlSU3jZwxRaz9kwhQf2GADM4wvberApeG4cXSBPMBms4xR3lr6kLocbGKW5A1zqx+wu
 G5aw==
X-Gm-Message-State: ACgBeo1ergWFi6zKJ/qx+ikyzGs/R2yo7Hx0U7UQu7V3CRcq9UIt5zFN
 FOJHW2EP2xw8Q2yVLcGWCyg=
X-Google-Smtp-Source: AA6agR49idPMQfYZROW1cyDOtzjOAiuiAEJL/nnSHMAu6WBisZNsdiHO33dGlRy4LcYwjgsACvU1/A==
X-Received: by 2002:a05:6102:822:b0:385:48e2:a16f with SMTP id
 k2-20020a056102082200b0038548e2a16fmr6552318vsb.45.1659956655733; 
 Mon, 08 Aug 2022 04:04:15 -0700 (PDT)
Received: from [192.168.10.102] (201-68-49-100.dsl.telesp.net.br.
 [201.68.49.100]) by smtp.gmail.com with ESMTPSA id
 j145-20020a1fa097000000b003768e235513sm8885050vke.0.2022.08.08.04.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 04:04:15 -0700 (PDT)
Message-ID: <20b12819-4891-1f1a-0e79-f9dcbedddc4e@gmail.com>
Date: Mon, 8 Aug 2022 08:04:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH for-7.2 04/10] ppc/pnv: add helpers for pnv-phb user
 devices
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220803134459.2633902-1-danielhb413@gmail.com>
 <20220803134459.2633902-5-danielhb413@gmail.com>
 <f69358e3-cec5-196e-4b2f-342742b6c5b7@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <f69358e3-cec5-196e-4b2f-342742b6c5b7@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe30.google.com
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



On 8/5/22 07:41, Frederic Barrat wrote:
> 
> 
> On 03/08/2022 15:44, Daniel Henrique Barboza wrote:
>> pnv_parent_qom_fixup() and pnv_parent_bus_fixup() are versions of the
>> helpers that were reverted by commit 9c10d86fee "ppc/pnv: Remove
>> user-created PHB{3,4,5} devices". They are needed to amend the QOM and
>> bus hierarchies of user created pnv-phbs, matching them with default
>> pnv-phbs.
>>
>> A new helper pnv_phb_user_device_init() is created to handle
>> user-created devices setup. We're going to call it inside
>> pnv_phb_realize() in case we're realizing an user created device. This
>> will centralize all user device realated in a single spot, leaving the
>> realize functions of the phb3/phb4 backends untouched.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/pci-host/pnv_phb.c | 69 +++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 69 insertions(+)
>>
>> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
>> index 826c0c144e..da779dc298 100644
>> --- a/hw/pci-host/pnv_phb.c
>> +++ b/hw/pci-host/pnv_phb.c
>> @@ -18,6 +18,37 @@
>>   #include "hw/qdev-properties.h"
>>   #include "qom/object.h"
>> +
>> +/*
>> + * Set the QOM parent of an object child. If the device state
>> + * associated with the child has an id, use it as QOM id. Otherwise
>> + * use object_typename[index] as QOM id.
>> + */
>> +static void pnv_parent_qom_fixup(Object *parent, Object *child, int index)
>> +{
>> +    g_autofree char *default_id =
>> +        g_strdup_printf("%s[%d]", object_get_typename(child), index);
>> +    const char *dev_id = DEVICE(child)->id;
>> +
>> +    if (child->parent == parent) {
>> +        return;
>> +    }
>> +
>> +    object_ref(child);
>> +    object_unparent(child);
>> +    object_property_add_child(parent, dev_id ? dev_id : default_id, child);
>> +    object_unref(child);
>> +}
>> +
>> +static void pnv_parent_bus_fixup(DeviceState *parent, DeviceState *child)
>> +{
>> +    BusState *parent_bus = qdev_get_parent_bus(parent);
>> +
>> +    if (!qdev_set_parent_bus(child, parent_bus, &error_fatal)) {
>> +        return;
>> +    }
>> +}
>> +
>>   /*
>>    * Attach a root port device.
>>    *
>> @@ -41,6 +72,36 @@ static void pnv_phb_attach_root_port(PCIHostState *pci)
>>       pci_realize_and_unref(root, pci->bus, &error_fatal);
>>   }
>> +/*
>> + * User created devices won't have the initial setup that default
>> + * devices have. This setup consists of assigning a parent device
>> + * (chip for PHB3, PEC for PHB4/5) that will be the QOM/bus parent
>> + * of the PHB.
>> + */
>> +static void pnv_phb_user_device_init(PnvPHB *phb)
>> +{
>> +    PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
>> +    PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
>> +    Object *parent = NULL;
>> +
>> +    if (!chip) {
>> +        error_setg(&error_fatal, "invalid chip id: %d", phb->chip_id);
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * Reparent user created devices to the chip to build
>> +     * correctly the device tree. pnv_xscom_dt() needs every
>> +     * PHB to be a child of the chip to build the DT correctly.
>> +     *
>> +     * TODO: for version 3 we're still parenting the PHB with the
>> +     * chip. We should parent with a (so far not implemented)
>> +     * PHB3 PEC device.
>> +     */
>> +    pnv_parent_qom_fixup(parent, OBJECT(phb), phb->phb_id);
> 
> 
> Here we reparent the phb to NULL. I can see in the following patches why it's done this way and the end result is ok. After this patch, we can't create a user device yet, so no harm can be done. But a (temporary) comment could save the reviewer a heart attack :-)

Nah that was a mistake, I didn't intend to leave the code to be reparenting
stuff to NULL, even if it's not possible to break stuff at this moment.

I'll amend it like this:

+    if (phb->version == 3) {
+        parent = OBJECT(chip);
+    } else {
+        /* phb4 support will be added later */
+        return;
+    }
+

Thanks,

Daniel

> 
>    Fred
> 
> 
>> +    pnv_parent_bus_fixup(DEVICE(chip), DEVICE(phb));
>> +}
>> +
>>   static void pnv_phb_realize(DeviceState *dev, Error **errp)
>>   {
>>       PnvPHB *phb = PNV_PHB(dev);
>> @@ -74,6 +135,14 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>>       object_property_set_uint(phb->backend, "chip-id", phb->chip_id, errp);
>>       object_property_set_link(phb->backend, "phb-base", OBJECT(phb), errp);
>> +    /*
>> +     * Handle user created devices. User devices will not have a
>> +     * pointer to a chip (PHB3) and a PEC (PHB4/5).
>> +     */
>> +    if (!phb->chip && !phb->pec) {
>> +        pnv_phb_user_device_init(phb);
>> +    }
>> +
>>       if (phb->version == 3) {
>>           object_property_set_link(phb->backend, "chip",
>>                                    OBJECT(phb->chip), errp);

