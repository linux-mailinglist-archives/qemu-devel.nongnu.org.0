Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD96D635DD6
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 13:56:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxpHM-0001bL-Ou; Wed, 23 Nov 2022 07:55:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oxpGn-0001OF-66; Wed, 23 Nov 2022 07:54:41 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oxpGk-0004Ef-Ed; Wed, 23 Nov 2022 07:54:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uAf0WwRZrneQOCdLyMWiyQGQh4k9UHLeXxyCQjKkeVw=; b=yVDP+WWPw7STg9XWJXPwd4Uags
 CTiesCXrzdoeDKrECyc1uFPszQjKANgJa1gNiwi1/QMigU0ByEsNKCRnhc/n4shagLDueAsVv0S8h
 QRCwMQ4g9Vx+PBKq9xoIy4T7ZOxMcfsoONVc9GGHRwSaCt8nwaiU3ZqG2Wu4GolqWTSVSMLYnsoxr
 CnkPinoXCKFNldcS3pvs7qiLJesHofZUObfbDvari+5UVeXxZCoidAcK6P3bBWvH/0td6YPKC1C6/
 G4wd9BdXZr+1quexOCvMZ6h/zrbMw0tjGJTB5hEEg2jOXxcA//UMxhgqMNB9eNfyuz2zSWu3pxrbZ
 tqcojic0P//29+MA1iAsQ4fXN5kb/Zpit4KAdSWyrBOlL9zE403RmNrysAwFXBssaqntQhvfpfND7
 vHzhK/WIUnws/DAhJwqse7MiBc3poNKHC3gU4+7lPyJmGgmohzW/sAsyA6JzZKp5MUv9C86KN6vMg
 9ykNFeibFYJHkbMBG5Ct6knlSaGZCddq8lfCA7610Wstf6/o6eBjzokCc9+o4r27NrtkxSSZ1yf37
 ASe4Op/+Fiy6l9ozRseP9qIPmc6XnJp1mY8Y5wRHxK/0hOE60JXjwhquO0XKrbOhmvkhBWV+vC0Tm
 +Fc4x0ygmCnsE6OIvQwjZ6009WJlD09rCvLW2tBhY=;
Received: from host86-149-46-27.range86-149.btcentralplus.com ([86.149.46.27]
 helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oxpGI-00069I-D5; Wed, 23 Nov 2022 12:54:02 +0000
Message-ID: <94654f28-a707-9878-5282-e26f8a4e12ba@ilande.co.uk>
Date: Wed, 23 Nov 2022 12:54:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 mst@redhat.com, ani@anisinha.ca, pbonzini@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 andrew.smirnov@gmail.com, paulburton@kernel.org,
 aleksandar.rikalo@syrmia.com, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
References: <20221116152730.3691347-1-imammedo@redhat.com>
 <20221116152730.3691347-2-imammedo@redhat.com>
 <79ad881d-ac77-5bca-bd5f-ba6290b2c830@eik.bme.hu>
 <916f93a2-3b0d-3e52-5137-995496c4aefa@ilande.co.uk>
 <20221121084351.3e1ccc1f@imammedo.users.ipa.redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20221121084351.3e1ccc1f@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.149.46.27
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 1/2] remove DEC 21154 PCI bridge
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/11/2022 07:43, Igor Mammedov wrote:

> On Sun, 20 Nov 2022 22:08:54 +0000
> Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> wrote:
> 
>> On 16/11/2022 19:39, BALATON Zoltan wrote:
>>
>>> On Wed, 16 Nov 2022, Igor Mammedov wrote:
>>>    
>>>> Code has not been used practically since its inception (2004)
>>>>   f2aa58c6f4a20 UniNorth PCI bridge support
>>>> or maybe even earlier, but it was consuming contributors time
>>>> as QEMU was being rewritten.
>>>> Drop it for now. Whomever would like to actually
>>>> use the thing, can make sure it actually works/reintroduce
>>>> it back when there is a user.
>>>>
>>>> PS:
>>>> I've stumbled upon this when replacing PCIDeviceClass::is_bridge
>>>> field with QOM cast to PCI_BRIDGE type. Unused DEC 21154
>>>> was the only one trying to use the field with plain PCIDevice.
>>>> It's not worth keeping the field around for the sake of the code
>>>> that was commented out 'forever'.
>>>>
>>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>>> ---
>>>> hw/pci-bridge/dec.h       |   9 ---
>>>> include/hw/pci/pci_ids.h  |   1 -
>>>> hw/pci-bridge/dec.c       | 164 --------------------------------------
>>>> hw/pci-bridge/meson.build |   2 -
>>>> hw/pci-host/uninorth.c    |   6 --
>>>> 5 files changed, 182 deletions(-)
>>>> delete mode 100644 hw/pci-bridge/dec.h
>>>> delete mode 100644 hw/pci-bridge/dec.c
>>>>
>>>> diff --git a/hw/pci-bridge/dec.h b/hw/pci-bridge/dec.h
>>>> deleted file mode 100644
>>>> index 869e90b136..0000000000
>>>> --- a/hw/pci-bridge/dec.h
>>>> +++ /dev/null
>>>> @@ -1,9 +0,0 @@
>>>> -#ifndef HW_PCI_BRIDGE_DEC_H
>>>> -#define HW_PCI_BRIDGE_DEC_H
>>>> -
>>>> -
>>>> -#define TYPE_DEC_21154 "dec-21154-sysbus"
>>>> -
>>>> -PCIBus *pci_dec_21154_init(PCIBus *parent_bus, int devfn);
>>>> -
>>>> -#endif
>>>> diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
>>>> index bc9f834fd1..e4386ebb20 100644
>>>> --- a/include/hw/pci/pci_ids.h
>>>> +++ b/include/hw/pci/pci_ids.h
>>>> @@ -169,7 +169,6 @@
>>>>
>>>> #define PCI_VENDOR_ID_DEC                0x1011
>>>> #define PCI_DEVICE_ID_DEC_21143          0x0019
>>>> -#define PCI_DEVICE_ID_DEC_21154          0x0026
>>>>
>>>> #define PCI_VENDOR_ID_CIRRUS             0x1013
>>>>
>>>> diff --git a/hw/pci-bridge/dec.c b/hw/pci-bridge/dec.c
>>>> deleted file mode 100644
>>>> index 4773d07e6d..0000000000
>>>> --- a/hw/pci-bridge/dec.c
>>>> +++ /dev/null
>>>> @@ -1,164 +0,0 @@
>>>> -/*
>>>> - * QEMU DEC 21154 PCI bridge
>>>> - *
>>>> - * Copyright (c) 2006-2007 Fabrice Bellard
>>>> - * Copyright (c) 2007 Jocelyn Mayer
>>>> - *
>>>> - * Permission is hereby granted, free of charge, to any person obtaining a copy
>>>> - * of this software and associated documentation files (the "Software"), to deal
>>>> - * in the Software without restriction, including without limitation the rights
>>>> - * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>>>> - * copies of the Software, and to permit persons to whom the Software is
>>>> - * furnished to do so, subject to the following conditions:
>>>> - *
>>>> - * The above copyright notice and this permission notice shall be included in
>>>> - * all copies or substantial portions of the Software.
>>>> - *
>>>> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>>> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>>> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
>>>> - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>>>> - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>>>> - * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>>>> - * THE SOFTWARE.
>>>> - */
>>>> -
>>>> -#include "qemu/osdep.h"
>>>> -#include "dec.h"
>>>> -#include "hw/sysbus.h"
>>>> -#include "qapi/error.h"
>>>> -#include "qemu/module.h"
>>>> -#include "hw/pci/pci.h"
>>>> -#include "hw/pci/pci_host.h"
>>>> -#include "hw/pci/pci_bridge.h"
>>>> -#include "hw/pci/pci_bus.h"
>>>> -#include "qom/object.h"
>>>> -
>>>> -OBJECT_DECLARE_SIMPLE_TYPE(DECState, DEC_21154)
>>>> -
>>>> -struct DECState {
>>>> -    PCIHostState parent_obj;
>>>> -};
>>>> -
>>>> -static int dec_map_irq(PCIDevice *pci_dev, int irq_num)
>>>> -{
>>>> -    return irq_num;
>>>> -}
>>>> -
>>>> -static void dec_pci_bridge_realize(PCIDevice *pci_dev, Error **errp)
>>>> -{
>>>> -    pci_bridge_initfn(pci_dev, TYPE_PCI_BUS);
>>>> -}
>>>> -
>>>> -static void dec_21154_pci_bridge_class_init(ObjectClass *klass, void *data)
>>>> -{
>>>> -    DeviceClass *dc = DEVICE_CLASS(klass);
>>>> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>>>> -
>>>> -    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>>>> -    k->realize = dec_pci_bridge_realize;
>>>> -    k->exit = pci_bridge_exitfn;
>>>> -    k->vendor_id = PCI_VENDOR_ID_DEC;
>>>> -    k->device_id = PCI_DEVICE_ID_DEC_21154;
>>>> -    k->config_write = pci_bridge_write_config;
>>>> -    k->is_bridge = true;
>>>> -    dc->desc = "DEC 21154 PCI-PCI bridge";
>>>> -    dc->reset = pci_bridge_reset;
>>>> -    dc->vmsd = &vmstate_pci_device;
>>>> -}
>>>> -
>>>> -static const TypeInfo dec_21154_pci_bridge_info = {
>>>> -    .name          = "dec-21154-p2p-bridge",
>>>> -    .parent        = TYPE_PCI_BRIDGE,
>>>> -    .instance_size = sizeof(PCIBridge),
>>>> -    .class_init    = dec_21154_pci_bridge_class_init,
>>>> -    .interfaces = (InterfaceInfo[]) {
>>>> -        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>>>> -        { },
>>>> -    },
>>>> -};
>>>> -
>>>> -PCIBus *pci_dec_21154_init(PCIBus *parent_bus, int devfn)
>>>> -{
>>>> -    PCIDevice *dev;
>>>> -    PCIBridge *br;
>>>> -
>>>> -    dev = pci_new_multifunction(devfn, false, "dec-21154-p2p-bridge");
>>>> -    br = PCI_BRIDGE(dev);
>>>> -    pci_bridge_map_irq(br, "DEC 21154 PCI-PCI bridge", dec_map_irq);
>>>> -    pci_realize_and_unref(dev, parent_bus, &error_fatal);
>>>> -    return pci_bridge_get_sec_bus(br);
>>>> -}
>>>> -
>>>> -static void pci_dec_21154_device_realize(DeviceState *dev, Error **errp)
>>>> -{
>>>> -    PCIHostState *phb;
>>>> -    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>>>> -
>>>> -    phb = PCI_HOST_BRIDGE(dev);
>>>> -
>>>> -    memory_region_init_io(&phb->conf_mem, OBJECT(dev), &pci_host_conf_le_ops,
>>>> -                          dev, "pci-conf-idx", 0x1000);
>>>> -    memory_region_init_io(&phb->data_mem, OBJECT(dev), &pci_host_data_le_ops,
>>>> -                          dev, "pci-data-idx", 0x1000);
>>>> -    sysbus_init_mmio(sbd, &phb->conf_mem);
>>>> -    sysbus_init_mmio(sbd, &phb->data_mem);
>>>> -}
>>>> -
>>>> -static void dec_21154_pci_host_realize(PCIDevice *d, Error **errp)
>>>> -{
>>>> -    /* PCI2PCI bridge same values as PearPC - check this */
>>>> -}
>>>> -
>>>> -static void dec_21154_pci_host_class_init(ObjectClass *klass, void *data)
>>>> -{
>>>> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>>>> -    DeviceClass *dc = DEVICE_CLASS(klass);
>>>> -
>>>> -    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>>>> -    k->realize = dec_21154_pci_host_realize;
>>>> -    k->vendor_id = PCI_VENDOR_ID_DEC;
>>>> -    k->device_id = PCI_DEVICE_ID_DEC_21154;
>>>> -    k->revision = 0x02;
>>>> -    k->class_id = PCI_CLASS_BRIDGE_PCI;
>>>> -    k->is_bridge = true;
>>>> -    /*
>>>> -     * PCI-facing part of the host bridge, not usable without the
>>>> -     * host-facing part, which can't be device_add'ed, yet.
>>>> -     */
>>>> -    dc->user_creatable = false;
>>>> -}
>>>> -
>>>> -static const TypeInfo dec_21154_pci_host_info = {
>>>> -    .name          = "dec-21154",
>>>> -    .parent        = TYPE_PCI_DEVICE,
>>>> -    .instance_size = sizeof(PCIDevice),
>>>> -    .class_init    = dec_21154_pci_host_class_init,
>>>> -    .interfaces = (InterfaceInfo[]) {
>>>> -        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>>>> -        { },
>>>> -    },
>>>> -};
>>>> -
>>>> -static void pci_dec_21154_device_class_init(ObjectClass *klass, void *data)
>>>> -{
>>>> -    DeviceClass *dc = DEVICE_CLASS(klass);
>>>> -
>>>> -    dc->realize = pci_dec_21154_device_realize;
>>>> -}
>>>> -
>>>> -static const TypeInfo pci_dec_21154_device_info = {
>>>> -    .name          = TYPE_DEC_21154,
>>>> -    .parent        = TYPE_PCI_HOST_BRIDGE,
>>>> -    .instance_size = sizeof(DECState),
>>>> -    .class_init    = pci_dec_21154_device_class_init,
>>>> -};
>>>> -
>>>> -static void dec_register_types(void)
>>>> -{
>>>> -    type_register_static(&pci_dec_21154_device_info);
>>>> -    type_register_static(&dec_21154_pci_host_info);
>>>> -    type_register_static(&dec_21154_pci_bridge_info);
>>>> -}
>>>> -
>>>> -type_init(dec_register_types)
>>>> diff --git a/hw/pci-bridge/meson.build b/hw/pci-bridge/meson.build
>>>> index 243ceeda50..fe92d43de6 100644
>>>> --- a/hw/pci-bridge/meson.build
>>>> +++ b/hw/pci-bridge/meson.build
>>>> @@ -8,8 +8,6 @@ pci_ss.add(when: 'CONFIG_PXB', if_true:
>>>> files('pci_expander_bridge.c'),
>>>> pci_ss.add(when: 'CONFIG_XIO3130', if_true: files('xio3130_upstream.c',
>>>> 'xio3130_downstream.c'))
>>>> pci_ss.add(when: 'CONFIG_CXL', if_true: files('cxl_root_port.c', 'cxl_upstream.c',
>>>> 'cxl_downstream.c'))
>>>>
>>>> -# NewWorld PowerMac
>>>> -pci_ss.add(when: 'CONFIG_DEC_PCI', if_true: files('dec.c'))
>>>> # Sun4u
>>>> pci_ss.add(when: 'CONFIG_SIMBA', if_true: files('simba.c'))
>>>>
>>>> diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
>>>> index aebd44d265..5c617e86c1 100644
>>>> --- a/hw/pci-host/uninorth.c
>>>> +++ b/hw/pci-host/uninorth.c
>>>> @@ -127,12 +127,6 @@ static void pci_unin_main_realize(DeviceState *dev, Error **errp)
>>>>                                     PCI_DEVFN(11, 0), 4, TYPE_PCI_BUS);
>>>>
>>>>      pci_create_simple(h->bus, PCI_DEVFN(11, 0), "uni-north-pci");
>>>> -
>>>> -    /* DEC 21154 bridge */
>>>> -#if 0
>>>> -    /* XXX: not activated as PPC BIOS doesn't handle multiple buses properly */
>>>
>>> I think real hardware has this bridge and QEMU could emulate it but OpenBIOS can't
>>> handle more than one PCI bus or this bridge yet so this was disabled for that reason.
>>> Maybe leave the comment around as a reminder that this could be brought back from git
>>> history if somebody wants to fix it in the future, otherwise this may be forgotten
>>> and reimplemented from scratch.
>>
>> Unlike OpenHackWare, OpenBIOS can enumerate PCI topologies containing PCI-PCI bridges
>> and I believe this is the bridge present in New World machines. Since this bridge
>> exists on the "main" PCI bus then in theory it should be possible to enable it
>> without any changes required for OpenBIOS.
>>
>> Having said that, my time working on QEMU is limited in the short term so I'd have a
>> mild preference to keep it, but if it causes problems then it's easy enough to
>> retrieve from git history later.
> Problem I've met with is that it uses is_bridge field with plain PCIDevice
> and it's the only unconventional instance that does this.
> 
> Also wrt device model the rest of hostbridges impl. aren't split to 'subdevices'
> as with this DEC model. So perhaps it should be rewritten to match common
> pattern is possible.
> 
> As for short term (as if 19 years were too short interval), I'd prefer it removed
> for now (it easily can be brought back once someone bothers to make sure it works
> as expected). I'll leave a comment around mentioning that as it was suggested.
> 
> (it also should save us some CI time budget, however minuscule but it builds up)

Okay, remove it for now since I can easily resurrect it from git and fix up any 
issues at a later date as time allows.


ATB,

Mark.

