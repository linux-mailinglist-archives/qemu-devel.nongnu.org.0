Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD654C1083
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:42:15 +0100 (CET)
Received: from localhost ([::1]:57430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMp66-0000hq-Gj
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:42:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMokW-0004OO-6S
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 05:19:56 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:51364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMokS-0005aL-1F
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 05:19:55 -0500
Received: from [172.17.10.6] (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 679F520770;
 Wed, 23 Feb 2022 10:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645611589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g3o85eFJu+njvTLj1FH1kiqqFZe3ydGpYZmpKt4Y1zA=;
 b=4L746Ox3y5h0mooz2WOqSGnX5019ESWOV9+4f+rI/BONhgKDALEWSqH5C3vrKuAR/U4VD6
 DY0k0qFyarw8FZsvzSzp+oNM7xENlRZl9oXFxj2uCWq34xAqHgJy8s7gXpSQH8gq7V6yBX
 TJ5sjSpcZvFpannW4k9on//eyFKW4cA=
Message-ID: <9d0cfe90-01bc-6008-664f-74bdaa9c145c@greensocs.com>
Date: Wed, 23 Feb 2022 11:19:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 13/14] hw/mem/system-memory: add a memory sysbus device
Content-Language: en-US-large
To: Igor Mammedov <imammedo@redhat.com>
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-14-damien.hedde@greensocs.com>
 <20220223104450.196e9624@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20220223104450.196e9624@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, edgari@xilinx.com, mark.burton@greensocs.com,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/23/22 10:44, Igor Mammedov wrote:
> On Wed, 23 Feb 2022 10:07:05 +0100
> Damien Hedde <damien.hedde@greensocs.com> wrote:
> 
>> This device can be used to create a memory wrapped into a
>> sysbus device.
>> This device has one property 'readonly' which allows
>> to choose between a ram or a rom.
>>
> 
>> The purpose for this device is to be used with qapi command
>> device_add.
> that's the way to add a device to QEMU but a don't actual
> purpose described here, i.e. how board will use this
> device/actual usecase and how it will be wired to board
> and why it does have to be a sysbus device.
> 
Sorry, this was unclear.

It is a sysbus device in order to use it like any other sysbus device. 
The memory region it contains is exposed as a sysbus mmio.

I can replace the commit message by the following paragraph:

Boards instantiate memories by creating memory region objects which is 
not possible using QAPI commands.
To create a memory, the user can instantiate and map this device by 
issuing the following commands:
device_add driver=sysbus-memory size=0x1000 id=someram
sysbus-mmio-map device=someram addr=0

>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> ---
>>   include/hw/mem/sysbus-memory.h | 28 ++++++++++++
>>   hw/mem/sysbus-memory.c         | 80 ++++++++++++++++++++++++++++++++++
>>   hw/mem/meson.build             |  2 +
>>   3 files changed, 110 insertions(+)
>>   create mode 100644 include/hw/mem/sysbus-memory.h
>>   create mode 100644 hw/mem/sysbus-memory.c
>>
>> diff --git a/include/hw/mem/sysbus-memory.h b/include/hw/mem/sysbus-memory.h
>> new file mode 100644
>> index 0000000000..5c596f8b4f
>> --- /dev/null
>> +++ b/include/hw/mem/sysbus-memory.h
>> @@ -0,0 +1,28 @@
>> +/*
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + *
>> + * SysBusDevice Memory
>> + *
>> + * Copyright (c) 2021 Greensocs
>> + */
>> +
>> +#ifndef HW_SYSBUS_MEMORY_H
>> +#define HW_SYSBUS_MEMORY_H
>> +
>> +#include "hw/sysbus.h"
>> +#include "qom/object.h"
>> +
>> +#define TYPE_SYSBUS_MEMORY "sysbus-memory"
>> +OBJECT_DECLARE_SIMPLE_TYPE(SysBusMemoryState, SYSBUS_MEMORY)
>> +
>> +struct SysBusMemoryState {
>> +    /* <private> */
>> +    SysBusDevice parent_obj;
>> +    uint64_t size;
>> +    bool readonly;
>> +
>> +    /* <public> */
>> +    MemoryRegion mem;
>> +};
>> +
>> +#endif /* HW_SYSBUS_MEMORY_H */
>> diff --git a/hw/mem/sysbus-memory.c b/hw/mem/sysbus-memory.c
>> new file mode 100644
>> index 0000000000..f1ad7ba7ec
>> --- /dev/null
>> +++ b/hw/mem/sysbus-memory.c
>> @@ -0,0 +1,80 @@
>> +/*
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + *
>> + * SysBusDevice Memory
>> + *
>> + * Copyright (c) 2021 Greensocs
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/mem/sysbus-memory.h"
>> +#include "hw/qdev-properties.h"
>> +#include "qemu/log.h"
>> +#include "qemu/module.h"
>> +#include "qapi/error.h"
>> +
>> +static Property sysbus_memory_properties[] = {
>> +    DEFINE_PROP_UINT64("size", SysBusMemoryState, size, 0),
>> +    DEFINE_PROP_BOOL("readonly", SysBusMemoryState, readonly, false),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void sysbus_memory_realize(DeviceState *dev, Error **errp)
>> +{
>> +    SysBusMemoryState *s = SYSBUS_MEMORY(dev);
>> +    gchar *name;
>> +
>> +    if (!s->size) {
>> +        error_setg(errp, "'size' must be non-zero.");
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * We impose having an id (which is unique) because we need to generate
>> +     * a unique name for the memory region.
>> +     * memory_region_init_ram/rom() will abort() (in qemu_ram_set_idstr()
>> +     * function if 2 system-memory devices are created with the same name
>> +     * for the memory region).
>> +     */
>> +    if (!dev->id) {
>> +        error_setg(errp, "system-memory device must have an id.");
>> +        return;
>> +    }
>> +    name = g_strdup_printf("%s.region", dev->id);
>> +
>> +    if (s->readonly) {
>> +        memory_region_init_rom(&s->mem, OBJECT(dev), name, s->size, errp);
>> +    } else {
>> +        memory_region_init_ram(&s->mem, OBJECT(dev), name, s->size, errp);
>> +    }
>> +
>> +    g_free(name);
>> +    if (*errp) {
>> +        return;
>> +    }
>> +
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->mem);
>> +}
>> +
>> +static void sysbus_memory_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +
>> +    dc->user_creatable = true;
>> +    dc->realize = sysbus_memory_realize;
>> +    device_class_set_props(dc, sysbus_memory_properties);
>> +}
>> +
>> +static const TypeInfo sysbus_memory_info = {
>> +    .name          = TYPE_SYSBUS_MEMORY,
>> +    .parent        = TYPE_SYS_BUS_DEVICE,
>> +    .instance_size = sizeof(SysBusMemoryState),
>> +    .class_init    = sysbus_memory_class_init,
>> +};
>> +
>> +static void sysbus_memory_register_types(void)
>> +{
>> +    type_register_static(&sysbus_memory_info);
>> +}
>> +
>> +type_init(sysbus_memory_register_types)
>> diff --git a/hw/mem/meson.build b/hw/mem/meson.build
>> index 82f86d117e..04c74e12f2 100644
>> --- a/hw/mem/meson.build
>> +++ b/hw/mem/meson.build
>> @@ -7,3 +7,5 @@ mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
>>   softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
>>   
>>   softmmu_ss.add(when: 'CONFIG_SPARSE_MEM', if_true: files('sparse-mem.c'))
>> +
>> +softmmu_ss.add(files('sysbus-memory.c'))
> 

