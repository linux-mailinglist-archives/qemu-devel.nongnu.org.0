Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0966165EF18
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:46:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRUv-0007Lj-Bs; Thu, 05 Jan 2023 09:45:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRUr-0007Fc-VY; Thu, 05 Jan 2023 09:45:34 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRUp-0005B2-L7; Thu, 05 Jan 2023 09:45:33 -0500
Received: by mail-ed1-x52e.google.com with SMTP id u28so48278421edd.10;
 Thu, 05 Jan 2023 06:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zGwCk49vzpF4KqWN0lqzsjBLt70N3vmRn9+8C8dxF8I=;
 b=IfEMIxLZ7Jqlo9TU6NZrRr39WXdeGWsYkD3LBCABgjFXFuMpz0TBMDDzIHfPc7nuuR
 pib/bJqKeG+lqVhzaDhf9yOp1tSQZryBB8rhBv4NDkkS8NRwUjq1Ec3znJqod8OJjsbO
 XsLycYedRX2yMkbBjtoJYeFELmn5JmsjyirCCVQA36eoBr9oacf9zjiqn6+eefLH9byK
 Ti0l2zSKyQWUyvqAVmVsttuRJBfi3Wk9CA/roOJlZK9f1S2pOjtckA+5Jfnq3iQtzCh3
 6zEkHsd4g37O1hkozxXzf6483k+hs8xJbJYncZ3f5stKAH815QZl7fbaKbRJd9t35/Tm
 qWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zGwCk49vzpF4KqWN0lqzsjBLt70N3vmRn9+8C8dxF8I=;
 b=Uq0ItgdXr2HVULau7tQC+DOi7/CHq9/jTFtSkOSAWrBl0cLyrClnYZvPAamvxRlaSv
 lFceIOg9DAEY/gdAMHW42d1woh5R67lNDvYMPrymXadATPtXr9XU/lh+fx0w0guWlivV
 H2X4KOV6K8E04wfBRuFamoA8WdtVtaBRlft1BnqW5YOLKkuqkTAtwss5ih4YA7x9RjxQ
 r/omJ8K3TCchMufNyoC4FFv4Yn87X9jtoXhrJGSV+IC5ASYtLW+/Rd/SmmF435L02WbO
 NUcYVEoyhLK0sPqdeJYbT57j1mHSX429iiOQWZMMaVhWmRd7sycRAeH0v12ORicvw8HD
 eqXA==
X-Gm-Message-State: AFqh2krw+u/uImQUglNiPFjQyCaHeRwAgcM2nWUqMmxcF+Oq1TbzF3XJ
 P4wkb3OSU5Tg6Y/j4u86fqg=
X-Google-Smtp-Source: AMrXdXvkbYDSDp+0TSGEmJZwmzHjq1+AzHdr/iJflgARdr+x93CXHnvnV5PrFveyTgpOT+5iuaj3Ag==
X-Received: by 2002:a05:6402:88d:b0:46c:b385:83d2 with SMTP id
 e13-20020a056402088d00b0046cb38583d2mr56984288edy.0.1672929929152; 
 Thu, 05 Jan 2023 06:45:29 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200dd01067508562054.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:dd01:675:856:2054])
 by smtp.gmail.com with ESMTPSA id
 cq8-20020a056402220800b00488abbbadb3sm9524587edb.63.2023.01.05.06.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 06:45:28 -0800 (PST)
Date: Thu, 05 Jan 2023 14:45:23 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: ani@anisinha.ca, aurelien@aurel32.net, eduardo@habkost.net, f4bug@amsat.org,
 hpoussin@reactos.org, imammedo@redhat.com, jiaxun.yang@flygoat.com,
 jsnow@redhat.com, kraxel@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, pbonzini@redhat.com, philmd@linaro.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, richard.henderson@linaro.org
Subject: Re: [PATCH] hw/core: Introduce proxy-pic
In-Reply-To: <023671B2-5A4D-4078-8D6A-3C0169F39674@gmail.com>
References: <20221221170003.2929-13-shentey@gmail.com>
 <20230104195351.3418-1-shentey@gmail.com>
 <7a340802-bc5a-037b-78bf-1cb6c66e2987@ilande.co.uk>
 <023671B2-5A4D-4078-8D6A-3C0169F39674@gmail.com>
Message-ID: <50831CB0-9CEB-46FC-B577-AA75543DEA78@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



Am 5=2E Januar 2023 09:50:03 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>
>
>Am 4=2E Januar 2023 22:22:01 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ay=
land@ilande=2Eco=2Euk>:
>>On 04/01/2023 19:53, Bernhard Beschow wrote:
>>
>>> Having a proxy PIC allows for ISA PICs to be created and wired up in
>>> southbridges=2E This is especially useful for PIIX3 for two reasons:
>>> First, the southbridge doesn't need to care about the virtualization
>>> technology used (KVM, TCG, Xen) due to in-IRQs (where devices get
>>> attached) and out-IRQs (which will trigger the IRQs of the respective
>>> virtualization technology) are separated=2E Second, since the in-IRQs =
are
>>> populated with fully initialized qemu_irq's, they can already be wired
>>> up inside PIIX3=2E
>>>=20
>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>> Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>>> Message-Id: <20221022150508=2E26830-15-shentey@gmail=2Ecom>
>>> ---
>>> Changes since v4:
>>> * Change license to GPL-2=2E0-or-later and use SPDX-License-Identifier
>>> * Fix typo in commit message
>>> ---
>>>   include/hw/core/proxy-pic=2Eh | 38 ++++++++++++++++++++++++++
>>>   hw/core/proxy-pic=2Ec         | 54 +++++++++++++++++++++++++++++++++=
++++
>>>   MAINTAINERS                 |  2 ++
>>>   hw/core/Kconfig             |  3 +++
>>>   hw/core/meson=2Ebuild         |  1 +
>>>   5 files changed, 98 insertions(+)
>>>   create mode 100644 include/hw/core/proxy-pic=2Eh
>>>   create mode 100644 hw/core/proxy-pic=2Ec
>>>=20
>>> diff --git a/include/hw/core/proxy-pic=2Eh b/include/hw/core/proxy-pic=
=2Eh
>>> new file mode 100644
>>> index 0000000000=2E=2E32bc7936bd
>>> --- /dev/null
>>> +++ b/include/hw/core/proxy-pic=2Eh
>>> @@ -0,0 +1,38 @@
>>> +/*
>>> + * SPDX-License-Identifier: GPL-2=2E0-or-later
>>> + *
>>> + * Proxy interrupt controller device=2E
>>> + *
>>> + * Copyright (c) 2022 Bernhard Beschow <shentey@gmail=2Ecom>
>>> + */
>>> +
>>> +#ifndef HW_PROXY_PIC_H
>>> +#define HW_PROXY_PIC_H
>>> +
>>> +#include "hw/qdev-core=2Eh"
>>> +#include "qom/object=2Eh"
>>> +#include "hw/irq=2Eh"
>>> +
>>> +#define TYPE_PROXY_PIC "proxy-pic"
>>> +OBJECT_DECLARE_SIMPLE_TYPE(ProxyPICState, PROXY_PIC)
>>> +
>>> +#define MAX_PROXY_PIC_LINES 16
>>> +
>>> +/**
>>> + * This is a simple device which has 16 pairs of GPIO input and outpu=
t lines=2E
>>> + * Any change on an input line is forwarded to the respective output=
=2E
>>> + *
>>> + * QEMU interface:
>>> + *  + 16 unnamed GPIO inputs: the input lines
>>> + *  + 16 unnamed GPIO outputs: the output lines
>>> + */
>>
>>Re-reading this as a standalone patch, I can understand now why Phil was=
 asking about device properties etc=2E because aside from the commit messag=
e, it isn't particularly clear that this is a workaround for QEMU's PIC dev=
ices and accelerator implementations not (yet) supporting direct wiring wit=
h qdev gpios=2E I would definitely argue that it is a special purpose and n=
ot a generic device=2E
>>
>>I apologise that this is quite late in the review process, however given=
 that this wasn't immediately clear I do think it is worth making a few min=
or changes=2E Perhaps something like:
>>
>>- Update the comment above in proxy_pic=2Eh clarifying that this is only=
 for wiring up
>>  ISA PICs (similar to the commit message) until gpios can be used
>
>Will do=2E
>
>>- Move the =2Ec and =2Eh files from hw/core/proxy-pic=2Ec and include/hw=
/core/proxy_pic=2Eh
>>  to hw/i386/proxy-pic=2Ec and include/hw/i386/proxy_pic=2Eh to provide =
a strong hint
>>  that the device is restricted to x86-only
>
>The device gets used in PIIX4 as well, i=2Ee=2E MIPS, too=2E I therefore =
think it is not x86 but rather PIC specific=2E I propose to move it back to=
 hw/intc/i8259 where it was implemented until v2: https://patchew=2Eorg/QEM=
U/20221022150508=2E26830-1-shentey@gmail=2Ecom/20221022150508=2E26830-15-sh=
entey@gmail=2Ecom/ =2E I can also rename the device back to isa-pic to make=
 things more obvious=2E

I've submitted v5 of the series=2E Mark, would you be available for review=
?

For Phil's convenience I've pushed a git tag here: https://github=2Ecom/sh=
entok/qemu/commits/piix-consolidate-v5

Best regards,
Bernhard
>
>What do you think?
>
>Best regards,
>Bernhard
>
>>
>>I think this makes it more obvious what the device is doing, and also pr=
event its usage leaking into other places in the codebase=2E In fact in its=
 current form there is no need for device properties to configure the PIC l=
ines, since legacy x86 PICs always have 16 (ISA) IRQ lines=2E
>>
>>> +struct ProxyPICState {
>>> +    /*< private >*/
>>> +    struct DeviceState parent_obj;
>>> +    /*< public >*/
>>> +
>>> +    qemu_irq in_irqs[MAX_PROXY_PIC_LINES];
>>> +    qemu_irq out_irqs[MAX_PROXY_PIC_LINES];
>>> +};
>>> +
>>> +#endif /* HW_PROXY_PIC_H */
>>> diff --git a/hw/core/proxy-pic=2Ec b/hw/core/proxy-pic=2Ec
>>> new file mode 100644
>>> index 0000000000=2E=2E40fd70b9e2
>>> --- /dev/null
>>> +++ b/hw/core/proxy-pic=2Ec
>>> @@ -0,0 +1,54 @@
>>> +/*
>>> + * SPDX-License-Identifier: GPL-2=2E0-or-later
>>> + *
>>> + * Proxy interrupt controller device=2E
>>> + *
>>> + * Copyright (c) 2022 Bernhard Beschow <shentey@gmail=2Ecom>
>>> + */
>>> +
>>> +#include "qemu/osdep=2Eh"
>>> +#include "hw/core/proxy-pic=2Eh"
>>> +
>>> +static void proxy_pic_set_irq(void *opaque, int irq, int level)
>>> +{
>>> +    ProxyPICState *s =3D opaque;
>>> +
>>> +    qemu_set_irq(s->out_irqs[irq], level);
>>> +}
>>> +
>>> +static void proxy_pic_realize(DeviceState *dev, Error **errp)
>>> +{
>>> +    ProxyPICState *s =3D PROXY_PIC(dev);
>>> +
>>> +    qdev_init_gpio_in(DEVICE(s), proxy_pic_set_irq, MAX_PROXY_PIC_LIN=
ES);
>>> +    qdev_init_gpio_out(DEVICE(s), s->out_irqs, MAX_PROXY_PIC_LINES);
>>> +
>>> +    for (int i =3D 0; i < MAX_PROXY_PIC_LINES; ++i) {
>>> +        s->in_irqs[i] =3D qdev_get_gpio_in(DEVICE(s), i);
>>> +    }
>>> +}
>>> +
>>> +static void proxy_pic_class_init(ObjectClass *klass, void *data)
>>> +{
>>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>>> +
>>> +    /* No state to reset or migrate */
>>> +    dc->realize =3D proxy_pic_realize;
>>> +
>>> +    /* Reason: Needs to be wired up to work */
>>> +    dc->user_creatable =3D false;
>>> +}
>>> +
>>> +static const TypeInfo proxy_pic_info =3D {
>>> +    =2Ename          =3D TYPE_PROXY_PIC,
>>> +    =2Eparent        =3D TYPE_DEVICE,
>>> +    =2Einstance_size =3D sizeof(ProxyPICState),
>>> +    =2Eclass_init =3D proxy_pic_class_init,
>>> +};
>>> +
>>> +static void split_irq_register_types(void)
>>> +{
>>> +    type_register_static(&proxy_pic_info);
>>> +}
>>> +
>>> +type_init(split_irq_register_types)
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 7a40d4d865=2E=2E295a76bfbd 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1674,6 +1674,7 @@ S: Supported
>>>   F: hw/char/debugcon=2Ec
>>>   F: hw/char/parallel*
>>>   F: hw/char/serial*
>>> +F: hw/core/proxy-pic=2Ec
>>>   F: hw/dma/i8257*
>>>   F: hw/i2c/pm_smbus=2Ec
>>>   F: hw/input/pckbd=2Ec
>>> @@ -1690,6 +1691,7 @@ F: hw/watchdog/wdt_ib700=2Ec
>>>   F: hw/watchdog/wdt_i6300esb=2Ec
>>>   F: include/hw/display/vga=2Eh
>>>   F: include/hw/char/parallel=2Eh
>>> +F: include/hw/core/proxy-pic=2Eh
>>>   F: include/hw/dma/i8257=2Eh
>>>   F: include/hw/i2c/pm_smbus=2Eh
>>>   F: include/hw/input/i8042=2Eh
>>> diff --git a/hw/core/Kconfig b/hw/core/Kconfig
>>> index 9397503656=2E=2Ea7224f4ca0 100644
>>> --- a/hw/core/Kconfig
>>> +++ b/hw/core/Kconfig
>>> @@ -22,6 +22,9 @@ config OR_IRQ
>>>   config PLATFORM_BUS
>>>       bool
>>>   +config PROXY_PIC
>>> +    bool
>>> +
>>>   config REGISTER
>>>       bool
>>>   diff --git a/hw/core/meson=2Ebuild b/hw/core/meson=2Ebuild
>>> index 7a4d02b6c0=2E=2Ee86aef6ec3 100644
>>> --- a/hw/core/meson=2Ebuild
>>> +++ b/hw/core/meson=2Ebuild
>>> @@ -30,6 +30,7 @@ softmmu_ss=2Eadd(when: ['CONFIG_GUEST_LOADER', fdt],=
 if_true: files('guest-loader=2E
>>>   softmmu_ss=2Eadd(when: 'CONFIG_OR_IRQ', if_true: files('or-irq=2Ec')=
)
>>>   softmmu_ss=2Eadd(when: 'CONFIG_PLATFORM_BUS', if_true: files('platfo=
rm-bus=2Ec'))
>>>   softmmu_ss=2Eadd(when: 'CONFIG_PTIMER', if_true: files('ptimer=2Ec')=
)
>>> +softmmu_ss=2Eadd(when: 'CONFIG_PROXY_PIC', if_true: files('proxy-pic=
=2Ec'))
>>>   softmmu_ss=2Eadd(when: 'CONFIG_REGISTER', if_true: files('register=
=2Ec'))
>>>   softmmu_ss=2Eadd(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq=
=2Ec'))
>>>   softmmu_ss=2Eadd(when: 'CONFIG_XILINX_AXI', if_true: files('stream=
=2Ec'))
>>
>>
>>ATB,
>>
>>Mark=2E

