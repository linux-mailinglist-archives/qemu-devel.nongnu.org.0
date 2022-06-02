Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C0E53C018
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 22:57:29 +0200 (CEST)
Received: from localhost ([::1]:45778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwrsm-0000My-8r
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 16:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nwrqc-0007nJ-2w; Thu, 02 Jun 2022 16:55:14 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:38884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nwrqZ-0008VV-VY; Thu, 02 Jun 2022 16:55:13 -0400
Received: by mail-oi1-x22c.google.com with SMTP id u79so2629527oie.5;
 Thu, 02 Jun 2022 13:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YIpDIZ3b7ep9H/QpXVzuA6vJCfjNc3lw40XzwhyrssE=;
 b=YkDq6h9UJADh9eWeXzL4aT9cG+SjNFbDleXxP2dQA7F2aXBXYcRYhfLwOf3fsyZzX5
 KN0lp5dl/WnT+OhDjElWKV5rK0zJst1e/gRnZdE8iZvcXomw3o9dPGOvJRfKmfGN4pc4
 BE+clnnREB92cqWnQUM9cxcJN9T794p75qV9nneozUL0Xv1vuJ4OHlxHGAQhDC7XiYgx
 GxG2Rw6JmQAwseQSriCXZUSrNaaA82ogSiUlOz4RweJqZJq9n4oHhL52/7j+G6wS6z2i
 hIl6H+Cgio6+4uZhdZcgvf2nvmrpbDv+qGnkNXO0+mmg2S8m8+aaPajhW4kDka0yw+9x
 BxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YIpDIZ3b7ep9H/QpXVzuA6vJCfjNc3lw40XzwhyrssE=;
 b=JqqiT8gtV24EWeNvKhGkcTNkTcXi9p4f3QFl/GFrHPTthS3ObxXLqxWEXkJpONrd4q
 1Ru3jjKfla/INODq/EZdg6TAuNBejRDyK9qu1MMCh93BU5q7p7nsLNojZiQuC2Ocsjq/
 lqgdd50X73oC2E3CEm14+5ulXGYT5dHC07SMzqNFPJRD/Rt51Vo4pzyZQ3kiFdUObS6Y
 PH7x/VtYjfpWTXxNlIzTvETKNv7QdbMccXQaN/g3VURcywCps11czPINYNj6QaWxG3Mx
 Lc/i+4QDCu6yz3DRUUaZN/Aekq36vgKLiKSY8U8GqjxTtF1F3SqtDj9JZbJvkAzct6R4
 wtYw==
X-Gm-Message-State: AOAM531QPpn0XOUdbfhkqgvScn4llCCUlS2McaUdKUKkA8OpsvXNqn4x
 R08QiozGP6IN5k/agqSzLf8=
X-Google-Smtp-Source: ABdhPJy1f7Z+I10TGPreje5ecwS/PXFCdohgGKrWMWJ4nZhWIHokioCtveqNOk7NIRPvXVZTfDDTMg==
X-Received: by 2002:a05:6808:16a3:b0:326:a585:95b8 with SMTP id
 bb35-20020a05680816a300b00326a58595b8mr19335220oib.281.1654203310276; 
 Thu, 02 Jun 2022 13:55:10 -0700 (PDT)
Received: from [192.168.10.102] ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 lx15-20020a0568704b8f00b000f5e89a9c60sm2380954oab.3.2022.06.02.13.55.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 13:55:09 -0700 (PDT)
Message-ID: <cf61c578-1188-8a94-fdab-6baeb646012d@gmail.com>
Date: Thu, 2 Jun 2022 17:55:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 03/16] ppc/pnv: add PnvPHB base/proxy device
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk
References: <20220531214917.31668-1-danielhb413@gmail.com>
 <20220531214917.31668-4-danielhb413@gmail.com>
 <fd2aa961-6f79-3628-ef3c-f22ac23e5052@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <fd2aa961-6f79-3628-ef3c-f22ac23e5052@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
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



On 6/2/22 13:16, Frederic Barrat wrote:
> 
> 
> On 31/05/2022 23:49, Daniel Henrique Barboza wrote:
>> The PnvPHB device is going to be the base device for all other powernv
>> PHBs. It consists of a device that has the same user API as the other
>> PHB, namely being a PCIHostBridge and having chip-id and index
>> properties. It also has a 'backend' pointer that will be initialized
>> with the PHB implementation that the device is going to use.
>>
>> The initialization of the PHB backend is done by checking the PHB
>> version via a 'version' attribute that can be set via a global machine
>> property.  The 'version' field will be used to make adjustments based on
>> the running version, e.g. PHB3 uses a 'chip' reference while PHB4 uses
>> 'pec'. To init the PnvPHB bus we'll rely on helpers for each version.
>> The version 3 helper is already added (pnv_phb3_bus_init), the PHB4
>> helper will be added later on.
>>
>> For now let's add the basic logic of the PnvPHB object, which consists
>> mostly of pnv_phb_realize() doing all the work of checking the
>> phb->version set, initializing the proper backend, passing through its
>> attributes to the chosen backend, finalizing the backend realize and
>> adding a root port in the end.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/pci-host/meson.build |   3 +-
>>   hw/pci-host/pnv_phb.c   | 123 ++++++++++++++++++++++++++++++++++++++++
>>   hw/pci-host/pnv_phb.h   |  39 +++++++++++++
>>   3 files changed, 164 insertions(+), 1 deletion(-)
>>   create mode 100644 hw/pci-host/pnv_phb.c
>>   create mode 100644 hw/pci-host/pnv_phb.h
>>
>> diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
>> index c07596d0d1..e832babc9d 100644
>> --- a/hw/pci-host/meson.build
>> +++ b/hw/pci-host/meson.build
>> @@ -35,5 +35,6 @@ specific_ss.add(when: 'CONFIG_PCI_POWERNV', if_true: files(
>>     'pnv_phb3_msi.c',
>>     'pnv_phb3_pbcq.c',
>>     'pnv_phb4.c',
>> -  'pnv_phb4_pec.c'
>> +  'pnv_phb4_pec.c',
>> +  'pnv_phb.c',
>>   ))
>> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
>> new file mode 100644
>> index 0000000000..fa8472622f
>> --- /dev/null
>> +++ b/hw/pci-host/pnv_phb.c
>> @@ -0,0 +1,123 @@
>> +/*
>> + * QEMU PowerPC PowerNV Proxy PHB model
>> + *
>> + * Copyright (c) 2022, IBM Corporation.
>> + *
>> + * This code is licensed under the GPL version 2 or later. See the
>> + * COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu/log.h"
>> +#include "qapi/visitor.h"
>> +#include "qapi/error.h"
>> +#include "hw/pci-host/pnv_phb.h"
>> +#include "hw/pci-host/pnv_phb3.h"
>> +#include "hw/pci-host/pnv_phb4.h"
>> +#include "hw/ppc/pnv.h"
>> +#include "hw/qdev-properties.h"
>> +#include "qom/object.h"
>> +
>> +
>> +static void pnv_phb_realize(DeviceState *dev, Error **errp)
>> +{
>> +    PnvPHB *phb = PNV_PHB(dev);
>> +    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
>> +    g_autofree char *phb_typename = NULL;
>> +    g_autofree char *phb_rootport_typename = NULL;
>> +
>> +    if (!phb->version) {
>> +        error_setg(errp, "version not specified");
>> +        return;
>> +    }
>> +
>> +    switch (phb->version) {
>> +    case 3:
>> +        phb_typename = g_strdup(TYPE_PNV_PHB3);
>> +        phb_rootport_typename = g_strdup(TYPE_PNV_PHB3_ROOT_PORT);
>> +        break;
>> +    case 4:
>> +        phb_typename = g_strdup(TYPE_PNV_PHB4);
>> +        phb_rootport_typename = g_strdup(TYPE_PNV_PHB4_ROOT_PORT);
>> +        break;
>> +    case 5:
>> +        phb_typename = g_strdup(TYPE_PNV_PHB5);
>> +        phb_rootport_typename = g_strdup(TYPE_PNV_PHB5_ROOT_PORT);
>> +        break;
>> +    default:
>> +        g_assert_not_reached();
>> +    }
>> +
>> +    phb->backend = object_new(phb_typename);
>> +    object_property_add_child(OBJECT(dev), "phb-device", phb->backend);
>> +
>> +    /* Passthrough child device properties to the proxy device */
>> +    object_property_set_uint(phb->backend, "index", phb->phb_id, errp);
>> +    object_property_set_uint(phb->backend, "chip-id", phb->chip_id, errp);
>> +    object_property_set_link(phb->backend, "phb-base", OBJECT(phb), errp);
>> +
>> +    if (phb->version == 3) {
>> +        object_property_set_link(phb->backend, "chip",
>> +                                 OBJECT(phb->chip), errp);
>> +    } else {
>> +        object_property_set_link(phb->backend, "pec", OBJECT(phb->pec), errp);
>> +    }
> 
> 
> The patch is fine, but it just highlights that we're doing something wrong. I don't believe there's any reason for the chip/pec/phb relationship to be different between P8 and P9/P10. One day, a brave soul could try to unify the models, it would avoid test like that.

Not a bad idea, especially if we can cut more complexity out of the code.
I'll give it some thought.


Daniel



> It would be a good cleanup series to do if we ever extend the model with yet another version :-)
> 
> 
> 
>> +
>> +    if (!qdev_realize(DEVICE(phb->backend), NULL, errp)) {
>> +        return;
>> +    }
>> +
>> +    if (phb->version == 3) {
>> +        pnv_phb3_bus_init(dev, (PnvPHB3 *)phb->backend);
>> +    }
>> +
>> +    pnv_phb_attach_root_port(pci, phb_rootport_typename);
> 
> 
> 
> After we've removed the other instances (done in later patches), we could move pnv_phb_attach_root_port() to pnv_phb.c instead of pnv.c. It would be the perfect home for it as it starts looking off in pnv.c
> 
>    Fred
> 
> 
> 
>> +}
>> +
>> +static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
>> +                                         PCIBus *rootbus)
>> +{
>> +    PnvPHB *phb = PNV_PHB(host_bridge);
>> +
>> +    snprintf(phb->bus_path, sizeof(phb->bus_path), "00%02x:%02x",
>> +             phb->chip_id, phb->phb_id);
>> +    return phb->bus_path;
>> +}
>> +
>> +static Property pnv_phb_properties[] = {
>> +        DEFINE_PROP_UINT32("index", PnvPHB, phb_id, 0),
>> +        DEFINE_PROP_UINT32("chip-id", PnvPHB, chip_id, 0),
>> +        DEFINE_PROP_UINT32("version", PnvPHB, version, 0),
>> +
>> +        DEFINE_PROP_LINK("chip", PnvPHB, chip, TYPE_PNV_CHIP, PnvChip *),
>> +
>> +        DEFINE_PROP_LINK("pec", PnvPHB, pec, TYPE_PNV_PHB4_PEC,
>> +                         PnvPhb4PecState *),
>> +
>> +        DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void pnv_phb_class_init(ObjectClass *klass, void *data)
>> +{
>> +    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(klass);
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +
>> +    hc->root_bus_path = pnv_phb_root_bus_path;
>> +    dc->realize = pnv_phb_realize;
>> +    device_class_set_props(dc, pnv_phb_properties);
>> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>> +    dc->user_creatable = true;
>> +}
>> +
>> +static void pnv_phb_register_type(void)
>> +{
>> +    static const TypeInfo pnv_phb_type_info = {
>> +        .name          = TYPE_PNV_PHB,
>> +        .parent        = TYPE_PCIE_HOST_BRIDGE,
>> +        .instance_size = sizeof(PnvPHB),
>> +        .class_init    = pnv_phb_class_init,
>> +    };
>> +
>> +    type_register_static(&pnv_phb_type_info);
>> +}
>> +type_init(pnv_phb_register_type)
>> diff --git a/hw/pci-host/pnv_phb.h b/hw/pci-host/pnv_phb.h
>> new file mode 100644
>> index 0000000000..a7cc8610e2
>> --- /dev/null
>> +++ b/hw/pci-host/pnv_phb.h
>> @@ -0,0 +1,39 @@
>> +/*
>> + * QEMU PowerPC PowerNV Proxy PHB model
>> + *
>> + * Copyright (c) 2022, IBM Corporation.
>> + *
>> + * This code is licensed under the GPL version 2 or later. See the
>> + * COPYING file in the top-level directory.
>> + */
>> +
>> +#ifndef PCI_HOST_PNV_PHB_H
>> +#define PCI_HOST_PNV_PHB_H
>> +
>> +#include "hw/pci/pcie_host.h"
>> +#include "hw/pci/pcie_port.h"
>> +#include "qom/object.h"
>> +
>> +typedef struct PnvChip PnvChip;
>> +typedef struct PnvPhb4PecState PnvPhb4PecState;
>> +
>> +struct PnvPHB {
>> +    PCIExpressHost parent_obj;
>> +
>> +    uint32_t chip_id;
>> +    uint32_t phb_id;
>> +    uint32_t version;
>> +    char bus_path[8];
>> +
>> +    PnvChip *chip;
>> +
>> +    PnvPhb4PecState *pec;
>> +
>> +    /* The PHB backend (PnvPHB3, PnvPHB4 ...) being used */
>> +    Object *backend;
>> +};
>> +
>> +#define TYPE_PNV_PHB "pnv-phb"
>> +OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB, PNV_PHB)
>> +
>> +#endif /* PCI_HOST_PNV_PHB_H */

