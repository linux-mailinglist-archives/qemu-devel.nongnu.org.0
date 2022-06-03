Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FC453D30F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 23:02:53 +0200 (CEST)
Received: from localhost ([::1]:36086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxERY-0007zj-1z
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 17:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nxEPY-00075j-84; Fri, 03 Jun 2022 17:00:48 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:37794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nxEPW-0003iW-6L; Fri, 03 Jun 2022 17:00:47 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-f3381207a5so12154786fac.4; 
 Fri, 03 Jun 2022 14:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6HB5elzKVy7OeUEpXOZDEJHtvNN6KBtLGRHt8tAWd54=;
 b=dR8ci3xSdgAQlcvgBxfPQODVw6YPer+KJG3wp/IWndocYBt2eMv/5QnV1W4f+s8W92
 VJsEgFc6gfI1GFRoQ3cyRI0TVINB/nGbn3rSD807P07TKY9K/VuPX1Wn+BX6NiLJIz3u
 9hQXtVcGyxV32lLEkUGHtFXx7BYBju3YFMLlR7b14Q/gayH7NV0HSpgOvilSZ1NS+RbC
 zMEGVOX5CeuTaykwCGGQCprfi8zrBekJ9g1ECAoIn+8fDO/Y1kyniMZxAoFccDHSSc0N
 hgo4wMqflQl44huR7b4WCVfMy4USv4SV06cxgSA7MMrBW3ZnSEKR6VfWXXL4zhFjBdJ4
 Owyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6HB5elzKVy7OeUEpXOZDEJHtvNN6KBtLGRHt8tAWd54=;
 b=xzQfLLgYUFL5ZycFUoTUEY8d2zS68FevqXxGgPDzM/1LoXg0SbzNMqzdSeiySNMaHk
 ScmVyGlpB2YPtY5y7HkwANi4U4QATZsYXmMwH1Zp9pEi9exhWiJNSAblgEOGVmC+7j31
 c8A4oPyOxKMZDNWMgO88oABSNLonXf8h/cTYv92P1Xl6U3xCAzvcAHUX3Fh0jtRW2gyX
 NgmtHSIH+FArUxjyDSrdyBvTTlmeFbOI/KlJ+K8njI7cEwbGA6XuV1gtr8cbiKY3SRPc
 dErwfZIlj/3ZK9D4jZ264LTe+c+N1SWhzGQUW086dEvhXs73J1jxNMdnZQtcapg2lXYW
 2CYw==
X-Gm-Message-State: AOAM533zRLRmZBJrEMHETPbytMcCLTkGwRB11/RBmRRr/bk/krKaiBVq
 Qj4NBPEStmQIGEXluxgPCBA=
X-Google-Smtp-Source: ABdhPJwtyS4fOOa/KCYmPDawTEoL+Gz3SVNK4YLEebb0Z3DPGT+EFlXFF/xAFoM3+C5cMFqzjmETuA==
X-Received: by 2002:a05:6870:5703:b0:f2:c3a5:e514 with SMTP id
 k3-20020a056870570300b000f2c3a5e514mr6645121oap.32.1654290044470; 
 Fri, 03 Jun 2022 14:00:44 -0700 (PDT)
Received: from [192.168.10.102] ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a9d7185000000b0060a426ee09asm4149003otj.19.2022.06.03.14.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 14:00:43 -0700 (PDT)
Message-ID: <edef4577-c7d1-51aa-01c2-cd5846f7ba40@gmail.com>
Date: Fri, 3 Jun 2022 18:00:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 08/16] ppc/pnv: user created pnv-phb for powernv9
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk
References: <20220531214917.31668-1-danielhb413@gmail.com>
 <20220531214917.31668-9-danielhb413@gmail.com>
 <d2ae2236-7a49-22e7-3950-cb635697721a@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <d2ae2236-7a49-22e7-3950-cb635697721a@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
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



On 6/2/22 13:33, Frederic Barrat wrote:
> 
> 
> On 31/05/2022 23:49, Daniel Henrique Barboza wrote:
>> To enable user creatable PnvPHB devices for powernv9 we'll revert the
>> powernv9 related changes made in 9c10d86fee "ppc/pnv: Remove
>> user-created PHB{3,4,5} devices".
>>
>> This change alone isn't enough to enable user creatable devices for powernv10
>> due to how pnv_phb4_get_pec() currently works. For now let's just enable it
>> for powernv9 alone.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/pci-host/pnv_phb4.c     | 58 +++++++++++++++++++++++++++++++++++++-
>>   hw/pci-host/pnv_phb4_pec.c |  6 ++--
>>   hw/ppc/pnv.c               |  2 ++
>>   3 files changed, 63 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
>> index 22cf1c2a5e..a5c8ae494b 100644
>> --- a/hw/pci-host/pnv_phb4.c
>> +++ b/hw/pci-host/pnv_phb4.c
>> @@ -1571,13 +1571,69 @@ void pnv_phb4_bus_init(DeviceState *dev, PnvPHB4 *phb)
>>       pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
>>   }
>> +static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
>> +                                         Error **errp)
>> +{
>> +    Pnv9Chip *chip9 = PNV9_CHIP(chip);
>> +    int chip_id = phb->chip_id;
>> +    int index = phb->phb_id;
>> +    int i, j;
>> +
>> +    for (i = 0; i < chip->num_pecs; i++) {
>> +        /*
>> +         * For each PEC, check the amount of phbs it supports
>> +         * and see if the given phb4 index matches an index.
>> +         */
>> +        PnvPhb4PecState *pec = &chip9->pecs[i];
>> +
>> +        for (j = 0; j < pec->num_phbs; j++) {
>> +            if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
>> +                return pec;
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
>> +    PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
>> +    PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
>>       XiveSource *xsrc = &phb->xsrc;
>> +    BusState *s;
>> +    Error *local_err = NULL;
>>       int nr_irqs;
>>       char name[32];
>> +    if (!chip) {
>> +        error_setg(errp, "invalid chip id: %d", phb->chip_id);
>> +        return;
>> +    }
>> +
>> +    /* User created PHBs need to be assigned to a PEC */
>> +    if (!phb->pec) {
>> +        phb->pec = pnv_phb4_get_pec(chip, phb, &local_err);
>> +        if (local_err) {
>> +            error_propagate(errp, local_err);
>> +            return;
>> +        }
>> +    }
>> +
>> +    /* Reparent the PHB to the chip to build the device tree */
>> +    pnv_chip_parent_fixup(chip, OBJECT(phb->phb_base), phb->phb_id);
> 
> 
> Didn't you mean to do that only for the user-created case? 

It's done for both because the default generated PHBs are being created loosely
from the chip starting on 3f4c369ea63e ("ppc/pnv: make PECs create and realize
PHB4s"). We had to amend the code after that commit to fix the QOM hierarchy
of these devices. 6e7b96750359 ("ppc/pnv: fix default PHB4 QOM hierarchy") has
more details.


> And why not attaching the PHB to the PEC instead of the chip, like in pnv_pec_default_phb_realize() ? I think it makes more sense to keep the chip->PEC->PHB parenting in the qom tree (and incidentally, that's where I'd prefer to have the phb3 model move to).

I can only speculate since I didn't participate in the initial design. My
educated guess is that we didn't want to show PECs in qtree, hence we
made the PHB a child of the chip instead. I'll also guess that this can be
due to how PHB3 worked and we just copied the existing design.

> Also, the comment seems wrong to me. The qom parenting doesn't matter when building the device tree. We only iterate over the PHBs found in the array of the PEC object (cf. pnv_pec_dt_xscom())

I believe it refers to the QOM tree, a.k.a qtree. This has no relation to the
actual device tree the kernel uses. This comment can be clearer though.


Thanks,


Daniel

> 
> 
> 
>> +    s = qdev_get_parent_bus(DEVICE(chip));
>> +    if (!qdev_set_parent_bus(DEVICE(phb->phb_base), s, &local_err)) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
> 
> 
> Same comment, I think that's only desirable for user-created devices. We're already calling sysbus_realize() for the default case.
> 
> 
> Silly question: where does it break if a user tries to create 2 PHBs with the same index?
> 
> 
>    Fred
> 
> 
> 
> 
>>       /* Set the "big_phb" flag */
>>       phb->big_phb = phb->phb_id == 0 || phb->phb_id == 3;
>> @@ -1803,7 +1859,7 @@ static void pnv_phb4_root_port_class_init(ObjectClass *klass, void *data)
>>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(klass);
>>       dc->desc     = "IBM PHB4 PCIE Root Port";
>> -    dc->user_creatable = false;
>> +    dc->user_creatable = true;
>>       device_class_set_parent_realize(dc, pnv_phb4_root_port_realize,
>>                                       &rpc->parent_realize);
>> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
>> index 888ecbe8f3..0e67f3a338 100644
>> --- a/hw/pci-host/pnv_phb4_pec.c
>> +++ b/hw/pci-host/pnv_phb4_pec.c
>> @@ -146,8 +146,10 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>>       pec->num_phbs = pecc->num_phbs[pec->index];
>>       /* Create PHBs if running with defaults */
>> -    for (i = 0; i < pec->num_phbs; i++) {
>> -        pnv_pec_default_phb_realize(pec, i, errp);
>> +    if (defaults_enabled()) {
>> +        for (i = 0; i < pec->num_phbs; i++) {
>> +            pnv_pec_default_phb_realize(pec, i, errp);
>> +        }
>>       }
>>       /* Initialize the XSCOM regions for the PEC registers */
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index 3b0b230e49..697a2b5302 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -2186,6 +2186,8 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
>>       pmc->compat = compat;
>>       pmc->compat_size = sizeof(compat);
>>       pmc->dt_power_mgt = pnv_dt_power_mgt;
>> +
>> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
>>   }
>>   static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)

