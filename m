Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7A616BE7A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 11:20:09 +0100 (CET)
Received: from localhost ([::1]:51904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6XJw-0005Mp-3n
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 05:20:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32790)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6XIo-000499-U0
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 05:19:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6XIm-0002gj-R6
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 05:18:58 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42590
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6XIm-0002gd-MP
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 05:18:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582625936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qctMr8cGtlLxS6xzrwYeNUFD5IlJK2Mux1PxDK8iRBY=;
 b=X6MmcjAYepTGYtSyQzFSLZFLZHAIRDkNlcZimEBHa4e34tfL9yYMue3nDJEDfS1P9Ejuxz
 fajwFYZodyR3A7Fc5cklHM4NnDsn+bI1idlS/nQlu2G5dYgAEPOY7io9hDOQ+LKcRY174m
 R6uInseyQuSQIR8nul46ZnldXi+Hn3k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-Xh2aTChUPc2CyeOfiJhEFQ-1; Tue, 25 Feb 2020 05:18:49 -0500
X-MC-Unique: Xh2aTChUPc2CyeOfiJhEFQ-1
Received: by mail-wm1-f71.google.com with SMTP id k21so666085wmi.2
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 02:18:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qctMr8cGtlLxS6xzrwYeNUFD5IlJK2Mux1PxDK8iRBY=;
 b=QQrjDxw61jwuQ1cdByvCgqavjxLm75gdLneX8tYTlX8n2qa+cDy3McMhRaTT31ibSb
 a4DKDUJmvEcDQbf45SJAprvaQdobsf00SmSaABqwUegyqszACE1EP9EFT7/UyuH+Qy6F
 Ldz2XSxMcCn3jM8KWyTsqFPKdVtDCmEeAH3j8MpZQ2qCaYFC/CSxefkvKnLl5C3aJ5BX
 U5AyW60EnDBCObN1/odc2+LmjiiiVaLsV7XFnKxa3WVrF7Aq8Kd3VdABKbORK7A1RKdV
 +MZaKQgJRYtysV5zgddb+RteM2I9td7Dvm2pwENKOYyFgL+mEZcF8AVA3MnJfx97T6+2
 lXDA==
X-Gm-Message-State: APjAAAVdikyVIZ/F4UYwXlgYctLHNOUg1b9SP3f4BgBP9Gij2ToesHxC
 2uic6HYTb+x7YD3cpW/LDBOSH68gI9EadxA3Y8rSsoTWEBquLnFgFmBhtzt15IQSGOLGjuaUyrb
 ycBZ50OAsT70mfVc=
X-Received: by 2002:a05:600c:2056:: with SMTP id
 p22mr4296767wmg.136.1582625927893; 
 Tue, 25 Feb 2020 02:18:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqzVfYPMnqsBUw//5L8oZgXqzVDHAK+r5aPiYyUU44Qdrbjyi7oTibE1YVd44N7wMWqbjiVI7A==
X-Received: by 2002:a05:600c:2056:: with SMTP id
 p22mr4296729wmg.136.1582625927513; 
 Tue, 25 Feb 2020 02:18:47 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id p5sm22804994wrt.79.2020.02.25.02.18.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 02:18:47 -0800 (PST)
Subject: Re: [RFC v2 5/6] tpm: Add the SysBus TPM TIS device
To: Ard Biesheuvel <ardb@kernel.org>, Auger Eric <eric.auger@redhat.com>
References: <20200214183704.14389-1-eric.auger@redhat.com>
 <20200214183704.14389-6-eric.auger@redhat.com>
 <b0c30022-e6f3-b52d-60f8-e94db6b6fe99@linux.ibm.com>
 <0f249506-1d16-2a4c-c3b4-1644536a64f5@redhat.com>
 <13c8e9f4-16d9-6926-a2d0-a5771b8d4bf3@redhat.com>
 <CAKv+Gu_nnkZD4LO85Jo32MpdhX_FAgG=zk1GvS0ceUPp2x20-A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1109be87-51e7-7e40-b03d-9148d4258693@redhat.com>
Date: Tue, 25 Feb 2020 11:18:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu_nnkZD4LO85Jo32MpdhX_FAgG=zk1GvS0ceUPp2x20-A@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>, Laszlo Ersek <lersek@redhat.com>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/20 10:52 AM, Ard Biesheuvel wrote:
> On Tue, 25 Feb 2020 at 10:19, Auger Eric <eric.auger@redhat.com> wrote:
>>
>> Hi,
>>
>> On 2/17/20 7:13 PM, Auger Eric wrote:
>>> Hi Stefan,
>>>
>>> On 2/16/20 7:32 PM, Stefan Berger wrote:
>>>> On 2/14/20 1:37 PM, Eric Auger wrote:
>>>>> Introduce the tpm-tis-device which is a sysbus device
>>>>> and is bound to be used on ARM.
>>>>>
>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>> ---
>>>>>    hw/tpm/Kconfig          |   5 ++
>>>>>    hw/tpm/Makefile.objs    |   1 +
>>>>>    hw/tpm/tpm_tis_sysbus.c | 159 ++++++++++++++++++++++++++++++++++++++++
>>>>>    include/sysemu/tpm.h    |   1 +
>>>>>    4 files changed, 166 insertions(+)
>>>>>    create mode 100644 hw/tpm/tpm_tis_sysbus.c
>>>>>
>>>>> diff --git a/hw/tpm/Kconfig b/hw/tpm/Kconfig
>>>>> index 686f8206bb..4794e7fe28 100644
>>>>> --- a/hw/tpm/Kconfig
>>>>> +++ b/hw/tpm/Kconfig
>>>>> @@ -7,6 +7,11 @@ config TPM_TIS_ISA
>>>>>        depends on TPM && ISA_BUS
>>>>>        select TPM_TIS
>>>>>    +config TPM_TIS_SYSBUS
>>>>> +    bool
>>>>> +    depends on TPM
>>>>> +    select TPM_TIS
>>>>> +
>>>>>    config TPM_TIS
>>>>>        bool
>>>>>        depends on TPM
>>>>> diff --git a/hw/tpm/Makefile.objs b/hw/tpm/Makefile.objs
>>>>> index 3ef2036cca..f1ec4beb95 100644
>>>>> --- a/hw/tpm/Makefile.objs
>>>>> +++ b/hw/tpm/Makefile.objs
>>>>> @@ -1,6 +1,7 @@
>>>>>    common-obj-$(CONFIG_TPM) += tpm_util.o
>>>>>    obj-$(call lor,$(CONFIG_TPM_TIS),$(CONFIG_TPM_CRB)) += tpm_ppi.o
>>>>>    common-obj-$(CONFIG_TPM_TIS_ISA) += tpm_tis_isa.o
>>>>> +common-obj-$(CONFIG_TPM_TIS_SYSBUS) += tpm_tis_sysbus.o
>>>>>    common-obj-$(CONFIG_TPM_TIS) += tpm_tis_common.o
>>>>>    common-obj-$(CONFIG_TPM_CRB) += tpm_crb.o
>>>>>    common-obj-$(CONFIG_TPM_PASSTHROUGH) += tpm_passthrough.o
>>>>> diff --git a/hw/tpm/tpm_tis_sysbus.c b/hw/tpm/tpm_tis_sysbus.c
>>>>> new file mode 100644
>>>>> index 0000000000..18c02aed67
>>>>> --- /dev/null
>>>>> +++ b/hw/tpm/tpm_tis_sysbus.c
>>>>> @@ -0,0 +1,159 @@
>>>>> +/*
>>>>> + * tpm_tis_sysbus.c - QEMU's TPM TIS SYSBUS Device
>>>>> + *
>>>>> + * Copyright (C) 2006,2010-2013 IBM Corporation
>>>>> + *
>>>>> + * Authors:
>>>>> + *  Stefan Berger <stefanb@us.ibm.com>
>>>>> + *  David Safford <safford@us.ibm.com>
>>>>> + *
>>>>> + * Xen 4 support: Andrease Niederl <andreas.niederl@iaik.tugraz.at>
>>>>> + *
>>>>> + * This work is licensed under the terms of the GNU GPL, version 2 or
>>>>> later.
>>>>> + * See the COPYING file in the top-level directory.
>>>>> + *
>>>>> + * Implementation of the TIS interface according to specs found at
>>>>> + * http://www.trustedcomputinggroup.org. This implementation currently
>>>>> + * supports version 1.3, 21 March 2013
>>>>> + * In the developers menu choose the PC Client section then find the TIS
>>>>> + * specification.
>>>>> + *
>>>>> + * TPM TIS for TPM 2 implementation following TCG PC Client Platform
>>>>> + * TPM Profile (PTP) Specification, Familiy 2.0, Revision 00.43
>>>>> + */
>>>>> +
>>>>> +#include "qemu/osdep.h"
>>>>> +#include "hw/qdev-properties.h"
>>>>> +#include "migration/vmstate.h"
>>>>> +#include "tpm_util.h"
>>>>> +#include "hw/sysbus.h"
>>>>> +#include "tpm_tis.h"
>>>>> +
>>>>> +typedef struct TPMStateSysBus {
>>>>> +    /*< private >*/
>>>>> +    SysBusDevice parent_obj;
>>>>> +
>>>>> +    /*< public >*/
>>>>> +    TPMState state; /* not a QOM object */
>>>>> +} TPMStateSysBus;
>>>>> +
>>>>> +#define TPM_TIS_SYSBUS(obj) OBJECT_CHECK(TPMStateSysBus, (obj),
>>>>> TYPE_TPM_TIS_SYSBUS)
>>>>> +
>>>>> +static int tpm_tis_pre_save_sysbus(void *opaque)
>>>>> +{
>>>>> +    TPMStateSysBus *sbdev = opaque;
>>>>> +
>>>>> +    return tpm_tis_pre_save(&sbdev->state);
>>>>> +}
>>>>> +
>>>>> +static const VMStateDescription vmstate_tpm_tis_sysbus = {
>>>>> +    .name = "tpm-tis",
>>>>> +    .version_id = 0,
>>>>> +    .pre_save  = tpm_tis_pre_save_sysbus,
>>>>> +    .fields = (VMStateField[]) {
>>>>> +        VMSTATE_BUFFER(state.buffer, TPMStateSysBus),
>>>>> +        VMSTATE_UINT16(state.rw_offset, TPMStateSysBus),
>>>>> +        VMSTATE_UINT8(state.active_locty, TPMStateSysBus),
>>>>> +        VMSTATE_UINT8(state.aborting_locty, TPMStateSysBus),
>>>>> +        VMSTATE_UINT8(state.next_locty, TPMStateSysBus),
>>>>> +
>>>>> +        VMSTATE_STRUCT_ARRAY(state.loc, TPMStateSysBus,
>>>>> TPM_TIS_NUM_LOCALITIES,
>>>>> +                             0, vmstate_locty, TPMLocality),
>>>>> +
>>>>> +        VMSTATE_END_OF_LIST()
>>>>> +    }
>>>>> +};
>>>>> +
>>>>> +static void tpm_tis_sysbus_request_completed(TPMIf *ti, int ret)
>>>>> +{
>>>>> +    TPMStateSysBus *sbdev = TPM_TIS_SYSBUS(ti);
>>>>> +    TPMState *s = &sbdev->state;
>>>>> +
>>>>> +    tpm_tis_request_completed(s, ret);
>>>>> +}
>>>>> +
>>>>> +static enum TPMVersion tpm_tis_sysbus_get_tpm_version(TPMIf *ti)
>>>>> +{
>>>>> +    TPMStateSysBus *sbdev = TPM_TIS_SYSBUS(ti);
>>>>> +    TPMState *s = &sbdev->state;
>>>>> +
>>>>> +    return tpm_tis_get_tpm_version(s);
>>>>> +}
>>>>> +
>>>>> +static void tpm_tis_sysbus_reset(DeviceState *dev)
>>>>> +{
>>>>> +    TPMStateSysBus *sbdev = TPM_TIS_SYSBUS(dev);
>>>>> +    TPMState *s = &sbdev->state;
>>>>> +
>>>>> +    return tpm_tis_reset(s);
>>>>> +}
>>>>> +
>>>>> +static Property tpm_tis_sysbus_properties[] = {
>>>>> +    DEFINE_PROP_UINT32("irq", TPMStateSysBus, state.irq_num,
>>>>> TPM_TIS_IRQ),
>>>>> +    DEFINE_PROP_TPMBE("tpmdev", TPMStateSysBus, state.be_driver),
>>>>> +    DEFINE_PROP_BOOL("ppi", TPMStateSysBus, state.ppi_enabled, true),
>>>>> +    DEFINE_PROP_END_OF_LIST(),
>>>>> +};
>>>>> +
>>>>> +static void tpm_tis_sysbus_initfn(Object *obj)
>>>>> +{
>>>>> +    TPMStateSysBus *sbdev = TPM_TIS_SYSBUS(obj);
>>>>> +    TPMState *s = &sbdev->state;
>>>>> +
>>>>> +    memory_region_init_io(&s->mmio, obj, &tpm_tis_memory_ops,
>>>>> +                          s, "tpm-tis-mmio",
>>>>> +                          TPM_TIS_NUM_LOCALITIES <<
>>>>> TPM_TIS_LOCALITY_SHIFT);
>>>>> +
>>>>> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
>>>>> +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
>>>>> +}
>>>>> +
>>>>> +static void tpm_tis_sysbus_realizefn(DeviceState *dev, Error **errp)
>>>>> +{
>>>>> +    TPMStateSysBus *sbdev = TPM_TIS_SYSBUS(dev);
>>>>> +    TPMState *s = &sbdev->state;
>>>>> +
>>>>> +    if (!tpm_find()) {
>>>>> +        error_setg(errp, "at most one TPM device is permitted");
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    if (!s->be_driver) {
>>>>> +        error_setg(errp, "'tpmdev' property is required");
>>>>> +        return;
>>>>> +    }
>>>>> +}
>>>>> +
>>>>> +static void tpm_tis_sysbus_class_init(ObjectClass *klass, void *data)
>>>>> +{
>>>>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>>>>> +    TPMIfClass *tc = TPM_IF_CLASS(klass);
>>>>> +
>>>>> +    device_class_set_props(dc, tpm_tis_sysbus_properties);
>>>>> +    dc->vmsd  = &vmstate_tpm_tis_sysbus;
>>>>> +    tc->model = TPM_MODEL_TPM_TIS;
>>>>> +    dc->realize = tpm_tis_sysbus_realizefn;
>>>>> +    dc->user_creatable = true;
>>>>> +    dc->reset = tpm_tis_sysbus_reset;
>>>>> +    tc->request_completed = tpm_tis_sysbus_request_completed;
>>>>> +    tc->get_version = tpm_tis_sysbus_get_tpm_version;
>>>>> +}
>>>>> +
>>>>> +static const TypeInfo tpm_tis_sysbus_info = {
>>>>> +    .name = TYPE_TPM_TIS_SYSBUS,
>>>>> +    .parent = TYPE_SYS_BUS_DEVICE,
>>>>> +    .instance_size = sizeof(TPMStateSysBus),
>>>>> +    .instance_init = tpm_tis_sysbus_initfn,
>>>>> +    .class_init  = tpm_tis_sysbus_class_init,
>>>>> +    .interfaces = (InterfaceInfo[]) {
>>>>> +        { TYPE_TPM_IF },
>>>>> +        { }
>>>>> +    }
>>>>> +};
>>>>> +
>>>>> +static void tpm_tis_sysbus_register(void)
>>>>> +{
>>>>> +    type_register_static(&tpm_tis_sysbus_info);
>>>>> +}
>>>>> +
>>>>> +type_init(tpm_tis_sysbus_register)
>>>>> diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
>>>>> index 1691b92c28..f37851b1aa 100644
>>>>> --- a/include/sysemu/tpm.h
>>>>> +++ b/include/sysemu/tpm.h
>>>>> @@ -44,6 +44,7 @@ typedef struct TPMIfClass {
>>>>>    } TPMIfClass;
>>>>>      #define TYPE_TPM_TIS_ISA            "tpm-tis"
>>>>> +#define TYPE_TPM_TIS_SYSBUS         "tpm-tis-device"
>>>>
>>>>
>>>> hm, replace the rather generic 'device' with 'sysbus'?
>>> I used the "-device" suffix because this kind of naming was used for
>>> virtio-<type>-device when based on MMIO rather than virtio-<type>-pci.
>>> For instance virtio-net-device instead of virtio-net-pci. There are
>>> quite a lot of devices using that suffix. I only see xen-sysbus with the
>>> sysbus suffix.
>>>
>>> Now personally I don't have any strong preference and I will pick up the
>>> name chosen by consensus.
>>
>> Does anyone else have an opinion on the name to be chosen for this new
>> device:
>>
>> 1) tpm-tis-device or
>> 2) tpm-tis-sysbus ?
>>
> 
> It is slightly unfortunate that we cannot retain the 'tpm-tis' name,
> given that this is simply a TPM with a memory mapped TIS frame, like
> the ISA one, and the fact that QEMU instantiates this differently
> based on the emulated architecture is really an implementation detail.

Agreed.

As long as we don't change vmstate_tpm_tis::name, we can rename the QOM 
type names.

So I'd rather rename ISA as:

   #define TYPE_TPM_TIS_ISA            "tpm-tis-isa"

And the generic name for the sysbus/mmio device:

   #define TYPE_TPM_TIS_SYSBUS         "tpm-tis"

If we add the common ancestor, we can name it "tpm-tis-common".

> So I prefer 'tpm-tis-device', since it doesn't define how it is backed
> under the hood, and allows us to potentially instantiate it in a
> different way in the future if we wanted to. Alternatively, something
> like 'tpm-tis-mmmio' might be appropriate.


