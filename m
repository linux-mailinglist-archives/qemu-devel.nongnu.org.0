Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7018C540032
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 15:36:53 +0200 (CEST)
Received: from localhost ([::1]:60810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyZO8-0004GS-IK
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 09:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nyZEx-0004Df-Kr; Tue, 07 Jun 2022 09:27:24 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:47002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nyZEu-0007tO-Qq; Tue, 07 Jun 2022 09:27:23 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-fb1ae0cd9cso12540775fac.13; 
 Tue, 07 Jun 2022 06:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=x7XOFK4IC1fMkwAAgAdY3pVTkFDgeAlaUD2pmf9fDfs=;
 b=Pr/eXOAVkmbfIQcoSdX7EqJnJMeLR2r10gkijP/Os/Q4lXLIy8caH/DIHkEwoSbRag
 G7LbsASbSGcQR/I9eVqqdQJOnpT2j/xpKRmuWDRuRDB2SKrsHEmMqDze3Wn7A7nTtQEo
 cNde9W+cM0Lq9YbfKnz4MOhMT/TjcGfpXhbDgYXfaU9MHc2rmKqpKkDWMHCx5Yay9mwT
 ZskRCqKb7SG/bGB/HepT0Eq4dRUZ5CfByggmwmqpWjqqi/cJVvd6pC51NNkopnh3RwGV
 RIBeymuawgP52dxNCUH/jKSxhFj9jeMV8IxeYhH1AlzMx45I2PSlccgWo7ayxyWOJdnD
 MrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x7XOFK4IC1fMkwAAgAdY3pVTkFDgeAlaUD2pmf9fDfs=;
 b=GrndzNg0HjOQR0zEnIWYcjuwuxl+cXEoAWjkHGBHwN/QOL/qaqbH2wka/5lvfp09VT
 dcn4Jfds+Vl+uhr2VSwwsrvV0+y/BkUkNyuo5ZmIyEuGCd2K/3h5ePJD4DKiEuVVIF7L
 kVZJgOlfOcdWzqbTNqCc/Ks4CyVC5iemYrdvUOct/tSx0oj0t0b8uo8Wk3hmF6k7ilu0
 4B0zuXfDkkc8UnIR8mZWn9Jvlx+im5tXGqT7GtPuHX3IsuyFiw2bWWczL7Xxgmy7sqC8
 9UHcUpQfYei1z1TeHRTiAUaUsUd4clLyxiX9j5dfon6F6L0t6zwt0QyHWUUChr++SNXU
 uFtw==
X-Gm-Message-State: AOAM532CcWQX9Csn1vqOIx00DjMBn2fQC+tbyliHN81pTyNE6ILO16/M
 vv6UKjQkXzMgAZZXXZ46YHY=
X-Google-Smtp-Source: ABdhPJwIVTR30PjJik1s9B+9hz4pcIbqHSv4/B7Vij5SbxCsDy6O6ZFoy7dbJU6ql8vpLwaVvHI0gA==
X-Received: by 2002:a05:6871:10b:b0:f5:d68b:bc70 with SMTP id
 y11-20020a056871010b00b000f5d68bbc70mr19803191oab.17.1654608438559; 
 Tue, 07 Jun 2022 06:27:18 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:b502:536:aba9:ff15:cc50?
 ([2804:431:c7c7:b502:536:aba9:ff15:cc50])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a4a984b000000b0035ef3da8387sm9180285ooi.4.2022.06.07.06.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 06:27:18 -0700 (PDT)
Message-ID: <0175005e-a8fd-718f-13f9-f916df6a64e0@gmail.com>
Date: Tue, 7 Jun 2022 10:27:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 03/16] ppc/pnv: add PnvPHB base/proxy device
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au,
 mark.cave-ayland@ilande.co.uk
References: <20220531214917.31668-1-danielhb413@gmail.com>
 <20220531214917.31668-4-danielhb413@gmail.com>
 <fd2aa961-6f79-3628-ef3c-f22ac23e5052@linux.ibm.com>
 <9868398e-8785-7718-dc37-f6300f66fd19@kaod.org>
 <6004d6d5-544d-352f-d889-bf5d60f7e9d6@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <6004d6d5-544d-352f-d889-bf5d60f7e9d6@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
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



On 6/7/22 05:44, Frederic Barrat wrote:
> 
> 
> On 07/06/2022 08:42, Cédric Le Goater wrote:
>> On 6/2/22 18:16, Frederic Barrat wrote:
>>>
>>>
>>> On 31/05/2022 23:49, Daniel Henrique Barboza wrote:
>>>> The PnvPHB device is going to be the base device for all other powernv
>>>> PHBs. It consists of a device that has the same user API as the other
>>>> PHB, namely being a PCIHostBridge and having chip-id and index
>>>> properties. It also has a 'backend' pointer that will be initialized
>>>> with the PHB implementation that the device is going to use.
>>>>
>>>> The initialization of the PHB backend is done by checking the PHB
>>>> version via a 'version' attribute that can be set via a global machine
>>>> property.  The 'version' field will be used to make adjustments based on
>>>> the running version, e.g. PHB3 uses a 'chip' reference while PHB4 uses
>>>> 'pec'. To init the PnvPHB bus we'll rely on helpers for each version.
>>>> The version 3 helper is already added (pnv_phb3_bus_init), the PHB4
>>>> helper will be added later on.
>>>>
>>>> For now let's add the basic logic of the PnvPHB object, which consists
>>>> mostly of pnv_phb_realize() doing all the work of checking the
>>>> phb->version set, initializing the proper backend, passing through its
>>>> attributes to the chosen backend, finalizing the backend realize and
>>>> adding a root port in the end.
>>>>
>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>> ---
>>>>   hw/pci-host/meson.build |   3 +-
>>>>   hw/pci-host/pnv_phb.c   | 123 ++++++++++++++++++++++++++++++++++++++++
>>>>   hw/pci-host/pnv_phb.h   |  39 +++++++++++++
>>>>   3 files changed, 164 insertions(+), 1 deletion(-)
>>>>   create mode 100644 hw/pci-host/pnv_phb.c
>>>>   create mode 100644 hw/pci-host/pnv_phb.h
>>>>
>>>> diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
>>>> index c07596d0d1..e832babc9d 100644
>>>> --- a/hw/pci-host/meson.build
>>>> +++ b/hw/pci-host/meson.build
>>>> @@ -35,5 +35,6 @@ specific_ss.add(when: 'CONFIG_PCI_POWERNV', if_true: files(
>>>>     'pnv_phb3_msi.c',
>>>>     'pnv_phb3_pbcq.c',
>>>>     'pnv_phb4.c',
>>>> -  'pnv_phb4_pec.c'
>>>> +  'pnv_phb4_pec.c',
>>>> +  'pnv_phb.c',
>>>>   ))
>>>> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
>>>> new file mode 100644
>>>> index 0000000000..fa8472622f
>>>> --- /dev/null
>>>> +++ b/hw/pci-host/pnv_phb.c
>>>> @@ -0,0 +1,123 @@
>>>> +/*
>>>> + * QEMU PowerPC PowerNV Proxy PHB model
>>>> + *
>>>> + * Copyright (c) 2022, IBM Corporation.
>>>> + *
>>>> + * This code is licensed under the GPL version 2 or later. See the
>>>> + * COPYING file in the top-level directory.
>>>> + */
>>>> +
>>>> +#include "qemu/osdep.h"
>>>> +#include "qemu/log.h"
>>>> +#include "qapi/visitor.h"
>>>> +#include "qapi/error.h"
>>>> +#include "hw/pci-host/pnv_phb.h"
>>>> +#include "hw/pci-host/pnv_phb3.h"
>>>> +#include "hw/pci-host/pnv_phb4.h"
>>>> +#include "hw/ppc/pnv.h"
>>>> +#include "hw/qdev-properties.h"
>>>> +#include "qom/object.h"
>>>> +
>>>> +
>>>> +static void pnv_phb_realize(DeviceState *dev, Error **errp)
>>>> +{
>>>> +    PnvPHB *phb = PNV_PHB(dev);
>>>> +    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
>>>> +    g_autofree char *phb_typename = NULL;
>>>> +    g_autofree char *phb_rootport_typename = NULL;
>>>> +
>>>> +    if (!phb->version) {
>>>> +        error_setg(errp, "version not specified");
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    switch (phb->version) {
>>>> +    case 3:
>>>> +        phb_typename = g_strdup(TYPE_PNV_PHB3);
>>>> +        phb_rootport_typename = g_strdup(TYPE_PNV_PHB3_ROOT_PORT);
>>>> +        break;
>>>> +    case 4:
>>>> +        phb_typename = g_strdup(TYPE_PNV_PHB4);
>>>> +        phb_rootport_typename = g_strdup(TYPE_PNV_PHB4_ROOT_PORT);
>>>> +        break;
>>>> +    case 5:
>>>> +        phb_typename = g_strdup(TYPE_PNV_PHB5);
>>>> +        phb_rootport_typename = g_strdup(TYPE_PNV_PHB5_ROOT_PORT);
>>>> +        break;
>>>> +    default:
>>>> +        g_assert_not_reached();
>>>> +    }
>>>> +
>>>> +    phb->backend = object_new(phb_typename);
>>>> +    object_property_add_child(OBJECT(dev), "phb-device", phb->backend);
>>>> +
>>>> +    /* Passthrough child device properties to the proxy device */
>>>> +    object_property_set_uint(phb->backend, "index", phb->phb_id, errp);
>>>> +    object_property_set_uint(phb->backend, "chip-id", phb->chip_id, errp);
>>>> +    object_property_set_link(phb->backend, "phb-base", OBJECT(phb), errp);
>>>> +
>>>> +    if (phb->version == 3) {
>>>> +        object_property_set_link(phb->backend, "chip",
>>>> +                                 OBJECT(phb->chip), errp);
>>>> +    } else {
>>>> +        object_property_set_link(phb->backend, "pec", OBJECT(phb->pec), errp);
>>>> +    }
>>>
>>>
>>> The patch is fine, but it just highlights that we're doing something wrong. I don't believe there's any reason for the chip/pec/phb relationship to be different between P8 and P9/P10. One day, a brave soul could try to unify the models, it would avoid test like that.
>>
>> I think this is the first thing to do: introduce a PEC model to match
>> P8 HW and unify PHB3/4/5. We have been dragging this for too long (2014 ...)
> 
> 
> I agree it's needed, but it's also orthogonal to this series. And I wouldn't force it on Daniel since we're getting into PCI territory.

I don't mind doing it after this series lands.


Thanks,


Daniel

> 
>    Fred
> 
> 
>>
>> It shouldn't be that complex with all the cleanups that have been done.
>>
>> Thanks,
>>
>> C.
>>
>>
>>> It would be a good cleanup series to do if we ever extend the model with yet another version :-)
>>>
>>>
>>>
>>>
>>>> +
>>>> +    if (!qdev_realize(DEVICE(phb->backend), NULL, errp)) {
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    if (phb->version == 3) {
>>>> +        pnv_phb3_bus_init(dev, (PnvPHB3 *)phb->backend);
>>>> +    }
>>>> +
>>>> +    pnv_phb_attach_root_port(pci, phb_rootport_typename);
>>>
>>>
>>>
>>> After we've removed the other instances (done in later patches), we could move pnv_phb_attach_root_port() to pnv_phb.c instead of pnv.c. It would be the perfect home for it as it starts looking off in pnv.c
>>>
>>>    Fred
>>>
>>>
>>>
>>>> +}
>>>> +
>>>> +static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
>>>> +                                         PCIBus *rootbus)
>>>> +{
>>>> +    PnvPHB *phb = PNV_PHB(host_bridge);
>>>> +
>>>> +    snprintf(phb->bus_path, sizeof(phb->bus_path), "00%02x:%02x",
>>>> +             phb->chip_id, phb->phb_id);
>>>> +    return phb->bus_path;
>>>> +}
>>>> +
>>>> +static Property pnv_phb_properties[] = {
>>>> +        DEFINE_PROP_UINT32("index", PnvPHB, phb_id, 0),
>>>> +        DEFINE_PROP_UINT32("chip-id", PnvPHB, chip_id, 0),
>>>> +        DEFINE_PROP_UINT32("version", PnvPHB, version, 0),
>>>> +
>>>> +        DEFINE_PROP_LINK("chip", PnvPHB, chip, TYPE_PNV_CHIP, PnvChip *),
>>>> +
>>>> +        DEFINE_PROP_LINK("pec", PnvPHB, pec, TYPE_PNV_PHB4_PEC,
>>>> +                         PnvPhb4PecState *),
>>>> +
>>>> +        DEFINE_PROP_END_OF_LIST(),
>>>> +};
>>>> +
>>>> +static void pnv_phb_class_init(ObjectClass *klass, void *data)
>>>> +{
>>>> +    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(klass);
>>>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>>>> +
>>>> +    hc->root_bus_path = pnv_phb_root_bus_path;
>>>> +    dc->realize = pnv_phb_realize;
>>>> +    device_class_set_props(dc, pnv_phb_properties);
>>>> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>>>> +    dc->user_creatable = true;
>>>> +}
>>>> +
>>>> +static void pnv_phb_register_type(void)
>>>> +{
>>>> +    static const TypeInfo pnv_phb_type_info = {
>>>> +        .name          = TYPE_PNV_PHB,
>>>> +        .parent        = TYPE_PCIE_HOST_BRIDGE,
>>>> +        .instance_size = sizeof(PnvPHB),
>>>> +        .class_init    = pnv_phb_class_init,
>>>> +    };
>>>> +
>>>> +    type_register_static(&pnv_phb_type_info);
>>>> +}
>>>> +type_init(pnv_phb_register_type)
>>>> diff --git a/hw/pci-host/pnv_phb.h b/hw/pci-host/pnv_phb.h
>>>> new file mode 100644
>>>> index 0000000000..a7cc8610e2
>>>> --- /dev/null
>>>> +++ b/hw/pci-host/pnv_phb.h
>>>> @@ -0,0 +1,39 @@
>>>> +/*
>>>> + * QEMU PowerPC PowerNV Proxy PHB model
>>>> + *
>>>> + * Copyright (c) 2022, IBM Corporation.
>>>> + *
>>>> + * This code is licensed under the GPL version 2 or later. See the
>>>> + * COPYING file in the top-level directory.
>>>> + */
>>>> +
>>>> +#ifndef PCI_HOST_PNV_PHB_H
>>>> +#define PCI_HOST_PNV_PHB_H
>>>> +
>>>> +#include "hw/pci/pcie_host.h"
>>>> +#include "hw/pci/pcie_port.h"
>>>> +#include "qom/object.h"
>>>> +
>>>> +typedef struct PnvChip PnvChip;
>>>> +typedef struct PnvPhb4PecState PnvPhb4PecState;
>>>> +
>>>> +struct PnvPHB {
>>>> +    PCIExpressHost parent_obj;
>>>> +
>>>> +    uint32_t chip_id;
>>>> +    uint32_t phb_id;
>>>> +    uint32_t version;
>>>> +    char bus_path[8];
>>>> +
>>>> +    PnvChip *chip;
>>>> +
>>>> +    PnvPhb4PecState *pec;
>>>> +
>>>> +    /* The PHB backend (PnvPHB3, PnvPHB4 ...) being used */
>>>> +    Object *backend;
>>>> +};
>>>> +
>>>> +#define TYPE_PNV_PHB "pnv-phb"
>>>> +OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB, PNV_PHB)
>>>> +
>>>> +#endif /* PCI_HOST_PNV_PHB_H */
>>

