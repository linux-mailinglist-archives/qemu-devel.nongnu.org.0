Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F06B53AE8A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 23:44:53 +0200 (CEST)
Received: from localhost ([::1]:44278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwW96-000105-79
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 17:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nwW4D-0007sY-R4; Wed, 01 Jun 2022 17:39:49 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nwW4B-0002O0-SQ; Wed, 01 Jun 2022 17:39:49 -0400
Received: by mail-wr1-x434.google.com with SMTP id e2so4057077wrc.1;
 Wed, 01 Jun 2022 14:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=CLusZy0CfLHEe9cRW94ytdo4kzVxBnblo4jp8IEwuWA=;
 b=qKbIGXMd7LpyKw7UNJZGa1b2psBn8Om2hHsFbmdpOz0Y8Y/W5E9u4SQXH4Tn54TDvR
 JUZBCAHWIEiTUonV524kv7hJ0KNNe+qyMVRhm5WEyY8vKC0jFEzontebPchEhOfucs+3
 ZV9jEKQfTW2+XzyzoTkLs5xPTbd2q7sVcjdR6YpidrtVo66y33PhZhnIOO7NebVu4KER
 w6By8wEaQLnGOIytflCYkc1Y+uXLW+pJ+a6j5s1k9+6vIOuJJG2UjN41kQYSsD1yHWnK
 as3wklnx3KAl8dF1yVuZwgrQ+az06FBceB9dIp5W6WfD24I1cZhjqoNghswDV18CQ4XU
 Mlyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=CLusZy0CfLHEe9cRW94ytdo4kzVxBnblo4jp8IEwuWA=;
 b=Rko3fk3DC4bR8wnqT4qep1g2M/DvIuMs64d4pUMFouuSw7x0ca6c/UmtKJfnab8YRh
 faHI/NjyAeKsJsKaAf7hKe/lO9/iswWf3OWtHQmoxGtKaD2s/MgY3eMjBW8heJ6hy3D/
 hgDpVES99W5KBDtDcdQJGYrt3XiF/K7eqww7XKOwGMoOMhMCaYokrdPRrqeyJ8lNPzEO
 EtYNXoLEDlV1dZbS96wjXqVpAn/qJD2I5GYPiwEQqm6QY4sl3docgv+R6Y8eukze1CIV
 FyLwKk8Q0Xl5QEinktGLOiZT1uQGZBPlk2SWzXM8db+LbOWEhsbMziyBOpjIfLV54eQN
 od3g==
X-Gm-Message-State: AOAM5319WUN9WnkiIe1YiBA3LSO1umr9Ky3BLJ1OrLhQKrkrKr3YGo/w
 6UuFVQuD6fP+9q6TOeD6T2I=
X-Google-Smtp-Source: ABdhPJwn2Dx2CrOXsLZCxdbB70VrvFQLLHxyw7Qo9XHZopeyuRJ4UGNZDbZI2jXC85zgdvbbnNNXVg==
X-Received: by 2002:a5d:6c61:0:b0:210:7277:774c with SMTP id
 r1-20020a5d6c61000000b002107277774cmr1130897wrz.212.1654119585780; 
 Wed, 01 Jun 2022 14:39:45 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf303d009176c769e13c486f.dip0.t-ipconnect.de.
 [2003:fa:af30:3d00:9176:c769:e13c:486f])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a5d4589000000b0020fcf070f61sm2486824wrq.59.2022.06.01.14.39.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 Jun 2022 14:39:45 -0700 (PDT)
Date: Wed, 01 Jun 2022 21:39:42 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v3 6/7] hw/isa/piix4: QOM'ify PIIX4 PM creation
In-Reply-To: <2c39af97-498b-bf1c-08ac-ab47d293144e@ilande.co.uk>
References: <20220528192057.30910-1-shentey@gmail.com>
 <20220528192057.30910-7-shentey@gmail.com>
 <f3428e7e-f3f5-b933-a279-7da6e056dd5e@ilande.co.uk>
 <CAG4p6K6uWyTeWBnkTb0XciyD7Xa2nF7XXLo5pP+JLC4QontHHQ@mail.gmail.com>
 <2c39af97-498b-bf1c-08ac-ab47d293144e@ilande.co.uk>
Message-ID: <64E6F0CE-E2F0-4405-8102-D008096B8105@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Am 30=2E Mai 2022 19:58:37 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ayland=
@ilande=2Eco=2Euk>:
>On 29/05/2022 19:05, Bernhard Beschow wrote:
>
>> On Sun, May 29, 2022 at 11:25 AM Mark Cave-Ayland <
>> mark=2Ecave-ayland@ilande=2Eco=2Euk> wrote:
>>=20
>>> On 28/05/2022 20:20, Bernhard Beschow wrote:
>>>=20
>>>> Just like the real hardware, create the PIIX4 ACPI controller as part=
 of
>>>> the PIIX4 southbridge=2E This also mirrors how the IDE and USB functi=
ons
>>>> are already created=2E
>>>>=20
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>> ---
>>>>    hw/isa/piix4=2Ec                | 25 ++++++++++++++-----------
>>>>    hw/mips/malta=2Ec               |  3 ++-
>>>>    include/hw/southbridge/piix=2Eh |  2 +-
>>>>    3 files changed, 17 insertions(+), 13 deletions(-)
>>>>=20
>>>> diff --git a/hw/isa/piix4=2Ec b/hw/isa/piix4=2Ec
>>>> index 96df21a610=2E=2E217989227d 100644
>>>> --- a/hw/isa/piix4=2Ec
>>>> +++ b/hw/isa/piix4=2Ec
>>>> @@ -49,6 +49,7 @@ struct PIIX4State {
>>>>        RTCState rtc;
>>>>        PCIIDEState ide;
>>>>        UHCIState uhci;
>>>> +    PIIX4PMState pm;
>>>>        /* Reset Control Register */
>>>>        MemoryRegion rcr_mem;
>>>>        uint8_t rcr;
>>>> @@ -261,6 +262,14 @@ static void piix4_realize(PCIDevice *dev, Error
>>> **errp)
>>>>            return;
>>>>        }
>>>>=20
>>>> +    /* ACPI controller */
>>>> +    qdev_prop_set_int32(DEVICE(&s->pm), "addr", dev->devfn + 3);
>>>> +    if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
>>>> +        return;
>>>> +    }
>>>> +    qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
>>>> +    object_property_add_alias(OBJECT(s), "smbus", OBJECT(&s->pm),
>>> "i2c");
>>>=20
>>> Now that the PM device is QOMified you don't actually need this alias
>>> anymore (see
>>> below)=2E In general aliasing parts of contained devices onto the cont=
ainer
>>> isn't
>>> recommended, since it starts to blur the line between individual devic=
es
>>> and then you
>>> find some wiring gets done to the container, some directly to the
>>> contained device
>>> and then it starts to get confusing quite quickly=2E
>>>=20
>>>>        pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s,
>>> PIIX_NUM_PIRQS);
>>>>    }
>>>>=20
>>>> @@ -271,6 +280,10 @@ static void piix4_init(Object *obj)
>>>>        object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC=
);
>>>>        object_initialize_child(obj, "ide", &s->ide, "piix4-ide");
>>>>        object_initialize_child(obj, "uhci", &s->uhci, "piix4-usb-uhci=
");
>>>> +
>>>> +    object_initialize_child(obj, "pm", &s->pm, TYPE_PIIX4_PM);
>>>> +    qdev_prop_set_uint32(DEVICE(&s->pm), "smb_io_base", 0x1100);
>>>> +    qdev_prop_set_bit(DEVICE(&s->pm), "smm-enabled", 0);
>>>>    }
>>>>=20
>>>>    static void piix4_class_init(ObjectClass *klass, void *data)
>>>> @@ -312,7 +325,7 @@ static void piix4_register_types(void)
>>>>=20
>>>>    type_init(piix4_register_types)
>>>>=20
>>>> -DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus)
>>>> +DeviceState *piix4_create(PCIBus *pci_bus)
>>>>    {
>>>>        PCIDevice *pci;
>>>>        DeviceState *dev;
>>>> @@ -322,15 +335,5 @@ DeviceState *piix4_create(PCIBus *pci_bus, I2CBu=
s
>>> **smbus)
>>>>                                              TYPE_PIIX4_PCI_DEVICE);
>>>>        dev =3D DEVICE(pci);
>>>>=20
>>>> -    if (smbus) {
>>>> -        pci =3D pci_new(devfn + 3, TYPE_PIIX4_PM);
>>>> -        qdev_prop_set_uint32(DEVICE(pci), "smb_io_base", 0x1100);
>>>> -        qdev_prop_set_bit(DEVICE(pci), "smm-enabled", 0);
>>>> -        pci_realize_and_unref(pci, pci_bus, &error_fatal);
>>>> -        qdev_connect_gpio_out(DEVICE(pci), 0,
>>>> -                              qdev_get_gpio_in_named(dev, "isa", 9))=
;
>>>> -        *smbus =3D I2C_BUS(qdev_get_child_bus(DEVICE(pci), "i2c"));
>>>> -    }
>>>> -
>>>>        return dev;
>>>>    }
>>>> diff --git a/hw/mips/malta=2Ec b/hw/mips/malta=2Ec
>>>> index e446b25ad0=2E=2Eb0fc84ccbb 100644
>>>> --- a/hw/mips/malta=2Ec
>>>> +++ b/hw/mips/malta=2Ec
>>>> @@ -1399,8 +1399,9 @@ void mips_malta_init(MachineState *machine)
>>>>        empty_slot_init("GT64120", 0, 0x20000000);
>>>>=20
>>>>        /* Southbridge */
>>>> -    dev =3D piix4_create(pci_bus, &smbus);
>>>> +    dev =3D piix4_create(pci_bus);
>>>>        isa_bus =3D ISA_BUS(qdev_get_child_bus(dev, "isa=2E0"));
>>>> +    smbus =3D I2C_BUS(qdev_get_child_bus(dev, "smbus"));
>>>=20
>>> It should now be possible to do something like this:
>>>=20
>>>       pm_dev =3D DEVICE(object_resolve_path_component(OBJECT(dev), "pm=
"));
>>>       smbus =3D I2C_BUS(qdev_get_child_bus(pm_dev, "i2c"));
>>>=20
>>> whereby we grab the reference to the PIIX4_PM device by resolving the =
"pm"
>>> child
>>> object and then use that to obtain the reference to smbus=2E
>>>=20
>>=20
>> Imagining the container device to be an abstraction layer for the
>> contained functionality I actually prefer the alias=2E Having it one
>> doesn't need to know that there is an internal device named "pm" and
>> one doesn't need to care about how many levels deep it is buried
>> inside the implementation=2E This allows for further refactoring the
>> PIIX4 without breaking its contract to its users=2E
>>=20
>> Also, this reflects how the real hardware works: The Malta board can
>> wire up the PIIX4 southbridge without worrying about its inner
>> details=2E One can look into the datasheets, see the exposed interfaces
>> and pins, and connect them=2E By QOM'ifying PIIX4 we now have the
>> opportunity to mirror the real hardware by exposing it to the Malta
>> board as a black box which exposes dedicated pins and buses=2E
>
>It's a bit trickier in this particular case because here the PIIX4 device=
 acts as both a container and PCI device instance - and certainly the disti=
nction can be blurred when modelling integrated devices=2E
>
>The reason for leaning towards referencing the "pm" child object directly=
 is because a quick glance at the datasheet suggests that the PM functions =
and smbus are exposed via function 3, so it feels that referencing that PCI=
Device instance to find the smbus is intuitive=2E
>
>For me using the "pm" child object is a shorter alternative to using pci_=
find_device() to locate the function 3 PCIDevice function on the bus, which=
 is effectively what a guest OS would do=2E Since the PM device sits direct=
ly on the PCI bus it would never change depth within the PIIX4 container de=
vice, and renaming child object properties is an extremely rare event (whic=
h would also be easily fixable with grep)=2E

Alright, I'll implement it like this in v4=2E

Best regards,
Bernhard

>> Looking further into the QEMU code, there is even the following
>> comment in sabrelite=2Ec:
>>          /*
>>           * TODO: Ideally we would expose the chip select and spi bus o=
n the
>>           * SoC object using alias properties; then we would not need t=
o
>>           * directly access the underlying spi device object=2E
>>           */
>> To me this comment seems that the authors think in a similar way=2E
>>=20
>> What do you think?
>
>It's difficult for me to know without having much knowledge of ARM device=
s, but I can see how this might be useful given that SoCs can integrate a l=
ot of different devices into a single address space=2E Another thing to not=
e is that the comment above was originally written in 2016, and the qdev/QO=
M APIs (and indeed our knowledge as to how best to use them) have improved =
considerably since then=2E
>
>
>ATB,
>
>Mark=2E


