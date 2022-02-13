Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88744B3BCB
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 15:22:30 +0100 (CET)
Received: from localhost ([::1]:50804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJFll-0005D5-B7
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 09:22:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nJFkY-00042N-5S
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 09:21:14 -0500
Received: from [2a00:1450:4864:20::536] (port=44886
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nJFkW-0003YE-D8
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 09:21:13 -0500
Received: by mail-ed1-x536.google.com with SMTP id w10so4850942edd.11
 for <qemu-devel@nongnu.org>; Sun, 13 Feb 2022 06:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=Uk46i+lvBM5RLalsrKGxzsUAZDtMWjqdreaNTp0tCBs=;
 b=FUf8/velho1FbFKA2S2XV3uOLowvbJWI5r9pTrDLSuEJKv5VFPZTw0MI0jFT9IO2om
 1UpbtMj5Yu8Nwo1QX/ujD488dXWBaVSCX8z7mPqznEq8q+rmssOglVivxeqxobtbSiqv
 FklZpjLM5gGSnx5nrYSgJ8OrCU4eK4Ef/M/vbdpDb+gOSB9uB6Xpf0qs1bgcaYfArRo8
 Y3VNHYK1vnu/dKqRtJ9ucOfDGAaFX8nBlcGjSG3/APTrd/JDr9qdbOQ6So8N41eLL6Wz
 zNMYHHjHZ/Ohmy7NoPABk3bmR65y1fLjVCbBMfjmfvOezHqOcXSV2hCJqsyetwBimiin
 9qwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=Uk46i+lvBM5RLalsrKGxzsUAZDtMWjqdreaNTp0tCBs=;
 b=LqtQsTEKy8hGk1GbQ4zCYGJ8jlwVMW4RoY6PV5C4t/UTBjCeLSxLDM2C/N7xDJTcS4
 tg1QQRz/YW1Hv93n7WfGXNQ+jXAyNePbeI8wudzyGRQ7JH5Bvz0wGv4B6jCVezy6Pbm+
 nNn10Al5BvR8YbHpbTgykCe6sj+G+MtyAIkrLX779tD1jLQvYhvsHnbUqmJFuTEz6gnR
 oHbPWACHgWJtnX0kzWd5DLVb+PjphQDDqxcxCuQACeJJCPJkOAt6rfXGOFnZMWEr/A6m
 ojxX4zCG2KwIXNGf/LkdQrspQ36kVjkoJly8b01GH1ZWgT7gzSjCietzG+Kop7JK9FLm
 R+KA==
X-Gm-Message-State: AOAM531LHh0enTdZWjPYtLbpNeXMlrjHDzexW9+GzeuuvTQCBz2iLAa9
 twjlak1dVckgGJYqnCv26Qc=
X-Google-Smtp-Source: ABdhPJy9BQAcdqoYePkcxTJXdkzC4WEPnu9XKkgES/nsfU6QCnRONuzXLtn8t/h1i1qB0g0V7Zj6ng==
X-Received: by 2002:a05:6402:530d:: with SMTP id
 eo13mr11232053edb.387.1644762070115; 
 Sun, 13 Feb 2022 06:21:10 -0800 (PST)
Received: from ?IPv6:::1?
 (200116b8463dcc00452af80a311a73da.dip.versatel-1u1.de.
 [2001:16b8:463d:cc00:452a:f80a:311a:73da])
 by smtp.gmail.com with ESMTPSA id va27sm6422576ejb.174.2022.02.13.06.21.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 13 Feb 2022 06:21:09 -0800 (PST)
Date: Sun, 13 Feb 2022 15:21:03 +0100
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/5=5D_malta=3A_Move_PCI_in?=
 =?US-ASCII?Q?terrupt_handling_from_gt64xxx_to_piix4?=
User-Agent: K-9 Mail for Android
In-Reply-To: <343393f1-6fdd-5d37-9049-90fff2d6df6@eik.bme.hu>
References: <20220212113519.69527-1-shentey@gmail.com>
 <20220212113519.69527-2-shentey@gmail.com>
 <1cc1d1-8159-364b-612f-483db0ca1435@eik.bme.hu>
 <343393f1-6fdd-5d37-9049-90fff2d6df6@eik.bme.hu>
Message-ID: <202A50E2-9A1D-4770-A13B-118EE2EF4C09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.785, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12=2E Februar 2022 17:44:30 MEZ schrieb BALATON Zoltan <balaton@eik=2Ebm=
e=2Ehu>:
>On Sat, 12 Feb 2022, BALATON Zoltan wrote:
>> On Sat, 12 Feb 2022, Bernhard Beschow wrote:
>>> Handling PCI interrupts in piix4 increases cohesion and reduces differ=
ences
>>> between piix4 and piix3=2E
>>>=20
>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>>
>> Sorry for being late in commenting, I've missed the first round=2E Apol=
ogies if=20
>> this causes a delay or another version=2E
>>
>>> ---
>>> hw/isa/piix4=2Ec         | 58 +++++++++++++++++++++++++++++++++++++++
>>> hw/mips/gt64xxx_pci=2Ec  | 62 ++++------------------------------------=
--
>>> hw/mips/malta=2Ec        |  6 +---
>>> include/hw/mips/mips=2Eh |  2 +-
>>> 4 files changed, 65 insertions(+), 63 deletions(-)
>>>=20
>>> diff --git a/hw/isa/piix4=2Ec b/hw/isa/piix4=2Ec
>>> index 0fe7b69bc4=2E=2E5a86308689 100644
>>> --- a/hw/isa/piix4=2Ec
>>> +++ b/hw/isa/piix4=2Ec
>>> @@ -45,6 +45,7 @@ struct PIIX4State {
>>>     PCIDevice dev;
>>>     qemu_irq cpu_intr;
>>>     qemu_irq *isa;
>>> +    qemu_irq i8259[ISA_NUM_IRQS];
>>>
>>>     RTCState rtc;
>>>     /* Reset Control Register */
>>> @@ -54,6 +55,30 @@ struct PIIX4State {
>>>=20
>>> OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
>>>=20
>>> +static int pci_irq_levels[4];
>>> +
>>> +static void piix4_set_irq(void *opaque, int irq_num, int level)
>>> +{
>>> +    int i, pic_irq, pic_level;
>>> +    qemu_irq *pic =3D opaque;
>>> +
>>> +    pci_irq_levels[irq_num] =3D level;
>>> +
>>> +    /* now we change the pic irq level according to the piix irq mapp=
ings=20
>>> */
>>> +    /* XXX: optimize */
>>> +    pic_irq =3D piix4_dev->config[PIIX_PIRQCA + irq_num];
>>> +    if (pic_irq < 16) {
>>> +        /* The pic level is the logical OR of all the PCI irqs mapped=
 to=20
>>> it=2E */
>>> +        pic_level =3D 0;
>>> +        for (i =3D 0; i < 4; i++) {
>>> +            if (pic_irq =3D=3D piix4_dev->config[PIIX_PIRQCA + i]) {
>>> +                pic_level |=3D pci_irq_levels[i];
>>> +            }
>>> +        }
>>> +        qemu_set_irq(pic[pic_irq], pic_level);
>>> +    }
>>> +}
>>> +
>>> static void piix4_isa_reset(DeviceState *dev)
>>> {
>>>     PIIX4State *d =3D PIIX4_PCI_DEVICE(dev);
>>> @@ -248,8 +273,34 @@ static void piix4_register_types(void)
>>>=20
>>> type_init(piix4_register_types)
>>>=20
>>> +static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
>>> +{
>>> +    int slot;
>>> +
>>> +    slot =3D PCI_SLOT(pci_dev->devfn);
>>> +
>>> +    switch (slot) {
>>> +    /* PIIX4 USB */
>>> +    case 10:
>>> +        return 3;
>>> +    /* AMD 79C973 Ethernet */
>>> +    case 11:
>>> +        return 1;
>>> +    /* Crystal 4281 Sound */
>>> +    case 12:
>>> +        return 2;
>>> +    /* PCI slot 1 to 4 */
>>> +    case 18 =2E=2E=2E 21:
>>> +        return ((slot - 18) + irq_num) & 0x03;
>>> +    /* Unknown device, don't do any translation */
>>> +    default:
>>> +        return irq_num;
>>> +    }
>>> +}
>>> +
>>> DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus=20
>>> **smbus)
>>> {
>>> +    PIIX4State *s;
>>>     PCIDevice *pci;
>>>     DeviceState *dev;
>>>     int devfn =3D PCI_DEVFN(10, 0);
>>> @@ -257,6 +308,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus=
=20
>>> **isa_bus, I2CBus **smbus)
>>>     pci =3D pci_create_simple_multifunction(pci_bus, devfn,  true,
>>>                                           TYPE_PIIX4_PCI_DEVICE);
>>>     dev =3D DEVICE(pci);
>>> +    s =3D PIIX4_PCI_DEVICE(pci);
>>>     if (isa_bus) {
>>>         *isa_bus =3D ISA_BUS(qdev_get_child_bus(dev, "isa=2E0"));
>>>     }
>>> @@ -271,5 +323,11 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus=
=20
>>> **isa_bus, I2CBus **smbus)
>>>                                NULL, 0, NULL);
>>>     }
>>>=20
>>> +    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s->i8259,=
 4);
>>> +
>>> +    for (int i =3D 0; i < ISA_NUM_IRQS; i++) {
>
>Sorry one more nit=2E This is code movement but are we OK with declaring=
=20
>local variable within for? I thinks coding style advises against this, no=
t=20
>sure if checkpatch accepts it or not=2E This could be cleaned up the next=
=20
>patch together with removing the i8259 field which are simple enough to d=
o=20
>in one patch then this one stays as code movement and changes in next=20
>patch=2E

I'll move the i8259-removing patch right after the code movement patch whe=
re this loop is removed entirely=2E

>>> +        s->i8259[i] =3D qdev_get_gpio_in_named(dev, "isa", i);
>>> +    }
>>> +
>>>     return dev;
>>> }
>>> diff --git a/hw/mips/gt64xxx_pci=2Ec b/hw/mips/gt64xxx_pci=2Ec
>[=2E=2E=2E]
>>> diff --git a/include/hw/mips/mips=2Eh b/include/hw/mips/mips=2Eh
>>> index 6c9c8805f3=2E=2Eff88942e63 100644
>>> --- a/include/hw/mips/mips=2Eh
>>> +++ b/include/hw/mips/mips=2Eh
>>> @@ -10,7 +10,7 @@
>>> #include "exec/memory=2Eh"
>>>=20
>>> /* gt64xxx=2Ec */
>>> -PCIBus *gt64120_register(qemu_irq *pic);
>>> +PCIBus *gt64120_register(void);
>>
>> Now that you don't need to pass anything to it, do you still need this=
=20
>> function? Maybe what it does now could be done in the gt64120 device's=
=20
>> realize functions (there seems to be at least two: gt64120_realize and=
=20
>> gt64120_pci_realize but haven't checked which is more appropriate to pu=
t this=20
>> init in) or in an init function then you can just create the gt64120 de=
vice=20
>> in malta=2Ec with qdev_new as is more usual to do in other boards=2E Th=
is=20
>> register function looks like the legacy init functions we're trying to =
get=20
>> rid of so this seems to be an opportunity to clean this up=2E This coul=
d be=20
>> done in a separate follow up though so may not need to be part of this =
series=20
>> but may be nice to have=2E
>
>I meant this comment at the end of patch 1=2E But maybe this is too much =
to=20
>do in this series as it needs more understanding of the gt64120=20
>implementation so unless you already understand it enough to clean this u=
p=20
>easily now and it would be too much effort for you, then this is just for=
=20
>the record for possible future clean up=2E The series is good enough with=
out=20
>putting in more stuff but if there's a way to go further then that would=
=20
>be nice=2E

I'll give it a shot=2E Merging gt64120_register() into gt64120_realize() s=
eems to preserve relevant control flow=2E

Regards,
Bernhard

>Regards,=2E
>BALATON Zoltan
>
>>>=20
>>> /* bonito=2Ec */
>>> PCIBus *bonito_init(qemu_irq *pic);
>>

