Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D965665DC59
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 19:49:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD8oP-0002vz-Tj; Wed, 04 Jan 2023 13:48:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD8oJ-0002vj-R6
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 13:48:24 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD8oI-00079m-3B
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 13:48:23 -0500
Received: by mail-ej1-x633.google.com with SMTP id vm8so77912325ejc.2
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 10:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FVquXEatkjsnt7/WWB3T+s6lCdXnkT97jqT/BXU5H7A=;
 b=zw2gd8LZo8cOpCZglRMftk6BEyJasva6EP/VBZSAXcv9OKOjH6N5pZmQws6Ilaec2r
 rxXBXUYdnR1hcB2O2ot+/iyc8XC8nfpuzUBB+5mzocUghZoJvzHGGKd4gezz20bRA00L
 ZPqt2BQcinhISzbDcrGVqFZJ8KKcWNoNxKTW3IS4d8ksDwLdFQ+eRXI0CMTEHZos7nJW
 4wydv+J9HUuKhWtC897qN0xbqsbEYNknTQabNmAjuz+S+rKwR+popxvD3jm/yuHfhFWy
 AMpN+CKtEkpMqQsePykDGSf1bAcgQeFDhx2wYgqLqJO+TotxLXqAY8bJmXoFBYAfllnv
 FiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FVquXEatkjsnt7/WWB3T+s6lCdXnkT97jqT/BXU5H7A=;
 b=OIIh3NNNnz9eJlfSDWY9yS4OiQnPmlzqLC/TwFYNL6g1fwG/uhSIYxO/j1s3/jL/OH
 L7glouYQbWewL4Zc3/b5rBvGj/F4xg+0R9YnoDMfJWzZxwJeZknISdVxNukQt9C3VLSL
 Gxzm/HNaa5p0/w+prv5Gni0d0R608bgu7qe0g/74gEwF6pBJQQ0QwqdoXjKPLsd9kttQ
 CO0Ijjr3deXcBZyxHNDNEE2UjoHOFe0A4owEqpaEQQ1MoeVTICeDu7K7wkiqvvC18fwP
 iMsXJ+QoIK1Hbz6ehF0dH9qSAx3s2VXEX+4cMqM005ywa5nH06u5harDa6IYFQ8Qmr9N
 2Mkg==
X-Gm-Message-State: AFqh2kog46AdOArwkH0T2kVkU+UoXyNoUFq/NKsy7S0i2vMpzWNZAa3l
 zU6J1sdO5mCvjE1dqb3WIS3ZPA==
X-Google-Smtp-Source: AMrXdXtYAXbVIrEFvTkHu0Nr5M4bnN/BQvUtskqbL1WpwJ+T9PNcK0ZQpANoPO0mI9+9TvUnAkcmxg==
X-Received: by 2002:a17:907:c68a:b0:84c:e9c4:5751 with SMTP id
 ue10-20020a170907c68a00b0084ce9c45751mr6014067ejc.74.1672858100076; 
 Wed, 04 Jan 2023 10:48:20 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a170906115000b008373f9ea148sm15616785eja.71.2023.01.04.10.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 10:48:19 -0800 (PST)
Message-ID: <be75758a-2547-d1ef-223e-157f3aa28b23@linaro.org>
Date: Wed, 4 Jan 2023 19:48:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/6] hw/isa/piix: Resolve redundant
 TYPE_PIIX3_XEN_DEVICE
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@aol.com>, Bernhard Beschow
 <shentey@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-7-shentey@gmail.com>
 <1c2e0780-e5fb-1321-0d84-b0591db9fec7@linaro.org>
 <f596a7c1-10d0-3743-fe0b-d42003cf7440@aol.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <f596a7c1-10d0-3743-fe0b-d42003cf7440@aol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/1/23 18:54, Chuck Zmudzinski wrote:
> On 1/4/23 10:35 AM, Philippe Mathieu-Daudé wrote:
>> +Markus/Thomas
>>
>> On 4/1/23 15:44, Bernhard Beschow wrote:
>>> During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
>>> TYPE_PIIX3_DEVICE. Remove this redundancy.
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>> ---
>>>    hw/i386/pc_piix.c             |  4 +---
>>>    hw/isa/piix.c                 | 20 --------------------
>>>    include/hw/southbridge/piix.h |  1 -
>>>    3 files changed, 1 insertion(+), 24 deletions(-)
>>>
>>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>>> index 5738d9cdca..6b8de3d59d 100644
>>> --- a/hw/i386/pc_piix.c
>>> +++ b/hw/i386/pc_piix.c
>>> @@ -235,8 +235,6 @@ static void pc_init1(MachineState *machine,
>>>        if (pcmc->pci_enabled) {
>>>            DeviceState *dev;
>>>            PCIDevice *pci_dev;
>>> -        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
>>> -                                         : TYPE_PIIX3_DEVICE;
>>>            int i;
>>>    
>>>            pci_bus = i440fx_init(pci_type,
>>> @@ -250,7 +248,7 @@ static void pc_init1(MachineState *machine,
>>>                                           : pci_slot_get_pirq);
>>>            pcms->bus = pci_bus;
>>>    
>>> -        pci_dev = pci_new_multifunction(-1, true, type);
>>> +        pci_dev = pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE);
>>>            object_property_set_bool(OBJECT(pci_dev), "has-usb",
>>>                                     machine_usb(machine), &error_abort);
>>>            object_property_set_bool(OBJECT(pci_dev), "has-acpi",
>>> diff --git a/hw/isa/piix.c b/hw/isa/piix.c
>>> index 98e9b12661..e4587352c9 100644
>>> --- a/hw/isa/piix.c
>>> +++ b/hw/isa/piix.c
>>> @@ -33,7 +33,6 @@
>>>    #include "hw/qdev-properties.h"
>>>    #include "hw/ide/piix.h"
>>>    #include "hw/isa/isa.h"
>>> -#include "hw/xen/xen.h"
>>>    #include "sysemu/runstate.h"
>>>    #include "migration/vmstate.h"
>>>    #include "hw/acpi/acpi_aml_interface.h"
>>> @@ -465,24 +464,6 @@ static const TypeInfo piix3_info = {
>>>        .class_init    = piix3_class_init,
>>>    };
>>>    
>>> -static void piix3_xen_class_init(ObjectClass *klass, void *data)
>>> -{
>>> -    DeviceClass *dc = DEVICE_CLASS(klass);
>>> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>>> -
>>> -    k->realize = piix3_realize;
>>> -    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
>>> -    k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
>>> -    dc->vmsd = &vmstate_piix3;
>>
>> IIUC, since this device is user-creatable, we can't simply remove it
>> without going thru the deprecation process. Alternatively we could
>> add a type alias:
>>
>> -- >8 --
>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>> index 4b0ef65780..d94f7ea369 100644
>> --- a/softmmu/qdev-monitor.c
>> +++ b/softmmu/qdev-monitor.c
>> @@ -64,6 +64,7 @@ typedef struct QDevAlias
>>                                  QEMU_ARCH_LOONGARCH)
>>    #define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
>>    #define QEMU_ARCH_VIRTIO_MMIO (QEMU_ARCH_M68K)
>> +#define QEMU_ARCH_XEN (QEMU_ARCH_ARM | QEMU_ARCH_I386)
>>
>>    /* Please keep this table sorted by typename. */
>>    static const QDevAlias qdev_alias_table[] = {
>> @@ -111,6 +112,7 @@ static const QDevAlias qdev_alias_table[] = {
>>        { "virtio-tablet-device", "virtio-tablet", QEMU_ARCH_VIRTIO_MMIO },
>>        { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_VIRTIO_CCW },
>>        { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_VIRTIO_PCI },
>> +    { "PIIX3", "PIIX3-xen", QEMU_ARCH_XEN },
> 
> Hi Bernhard,
> 
> Can you comment if this should be:
> 
> +    { "PIIX", "PIIX3-xen", QEMU_ARCH_XEN },
> 
> instead? IIUC, the patch series also removed PIIX3 and PIIX4 and
> replaced them with PIIX. Or am I not understanding correctly?

There is a confusion in QEMU between PCI bridges, the first PCI
function they implement, and the other PCI functions.

Here TYPE_PIIX3_DEVICE means for "PCI function part of the PIIX
south bridge chipset, which expose a PCI-to-ISA bridge". A better
name could be TYPE_PIIX3_ISA_PCI_DEVICE. Unfortunately this
device is named "PIIX3" with no indication of ISA bridge.

