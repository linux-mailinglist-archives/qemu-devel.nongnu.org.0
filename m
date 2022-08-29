Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CFF5A5213
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 18:46:37 +0200 (CEST)
Received: from localhost ([::1]:48552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oShuE-00059r-Jc
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 12:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oShrA-0002Uq-SZ; Mon, 29 Aug 2022 12:43:26 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oShr5-0006Ff-Bx; Mon, 29 Aug 2022 12:43:24 -0400
Received: by mail-wr1-x434.google.com with SMTP id bu22so10588881wrb.3;
 Mon, 29 Aug 2022 09:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc;
 bh=xnKtRUzWxiduNXkJc39lRwSiGMrB1WUz03PzpSPUwVg=;
 b=HAMF2P1ROCzO+mp8hmGyNayr1zuKvV2+R9Rb39/TxiVUGustrLw9XwzobYhmgMtIU9
 ST89WdS/9s+PZ/1uWKYmlW2Wc3YhpRNkhSvV/E9l3cQd7kyqAqsz7jC1j2iUiM1o2+MU
 GPz8RFlApOVCQ9tJnKnJhhJz9d8bDSj00vyQtTqdHAxmr+ud8k5WWmRNMHPgjw8JYEld
 6Ej9qkzkGUTNA8XjMb/JNN6G6cFNzPbjvImM66WusF9/ZeyAiWrZcjKL/aiS5R+3qH79
 4uFRwyKEUrG1B2x+l97DFt+HDtYSiagA3S8YtovU39aKps+RjX3CAcEUcruLRxJgPV1V
 b7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc;
 bh=xnKtRUzWxiduNXkJc39lRwSiGMrB1WUz03PzpSPUwVg=;
 b=G7RrIkfRQaRgswKVhxRrinKRHDYv7+hvTrfevLDGxLSIs/C2E9vbfAScKqgNzt+xFy
 57UPBrwOuJ8W/BF0+qyIkcDVvnj8RzRG10NrsxlO1ge0IXmMjE2Pdbt1Oq9OzCXJUV0i
 QZWx1ty0HkJx3IWhPyvVLc8GNYQ1cBh+Lm3hrcdEcltNzaCtkE46Cr2f96r6l1Y6ga9R
 y62DlPa2vbyUXfeEq4hBxS/0YNGqIHZnHXurDRJB8xs5jh4awHChXpRGR1X2yZ97ayMb
 5pkGTfyiqDhGHIWH9BCGqzaVKdAWOAjODVC6jD+eRrw/IhyOhJGBrcxhLsKNDSP3BsKo
 QVBQ==
X-Gm-Message-State: ACgBeo0o0szwl/cBgnnxVeqpP1/m3AaEp6iVwD8kRjbh7P3jd8kXBVdn
 TyBlFsNmlKB6X3yMknbX5sg=
X-Google-Smtp-Source: AA6agR7K1P/NHzS8A1bVq4cn70hYGRmeTH7jCY84zM/OmYf8uH3OeHm/fyy1Xxa9JDudJnsAEDQcNw==
X-Received: by 2002:a5d:6e8e:0:b0:220:5fa1:d508 with SMTP id
 k14-20020a5d6e8e000000b002205fa1d508mr7278303wrz.337.1661791397371; 
 Mon, 29 Aug 2022 09:43:17 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb2008dcc9db01b9c79b4.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:8dcc:9db0:1b9c:79b4])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b003a60edc3a44sm10391051wmb.5.2022.08.29.09.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 09:43:17 -0700 (PDT)
Date: Mon, 29 Aug 2022 18:43:10 +0200
From: BB <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: QEMU Developers <qemu-devel@nongnu.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 "open list:sam460ex" <qemu-ppc@nongnu.org>
Subject: Re: [PATCH 4/9] hw/isa/vt82c686: QOM'ify via-ide creation
User-Agent: K-9 Mail for Android
In-Reply-To: <3ae09c8f-36c0-3874-db91-776f175a649c@eik.bme.hu>
References: <20220822224355.11753-1-shentey@gmail.com>
 <20220822224355.11753-5-shentey@gmail.com>
 <14e283f-7bbd-dd70-5458-af897cd7ff4a@eik.bme.hu>
 <CAG4p6K51DvVFndv+ZuokigksdqjaegkRRnt1ZaOOQqJxp9xGEw@mail.gmail.com>
 <3ae09c8f-36c0-3874-db91-776f175a649c@eik.bme.hu>
Message-ID: <BF0B3207-F80F-4653-BC43-D0735C16B4DB@gmail.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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



Am 25=2E August 2022 01:18:56 MESZ schrieb BALATON Zoltan <balaton@eik=2Eb=
me=2Ehu>:
>On Thu, 25 Aug 2022, Bernhard Beschow wrote:
>> On Wed, Aug 24, 2022 at 3:54 PM BALATON Zoltan <balaton@eik=2Ebme=2Ehu>=
 wrote:
>>> On Tue, 23 Aug 2022, Bernhard Beschow wrote:
>>>> The IDE function is closely tied to the ISA function (e=2Eg=2E the ID=
E
>>>> interrupt routing happens there), so it makes sense that the IDE
>>>> function is instantiated within the southbridge itself=2E As a side e=
ffect,
>>>> duplicated code in the boards is resolved=2E
>>>>=20
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>> ---
>>>> configs/devices/mips64el-softmmu/default=2Emak |  1 -
>>>> hw/isa/Kconfig                               |  1 +
>>>> hw/isa/vt82c686=2Ec                            | 18 +++++++++++++++++=
+
>>>> hw/mips/fuloong2e=2Ec                          |  3 ---
>>>> hw/ppc/Kconfig                               |  1 -
>>>> hw/ppc/pegasos2=2Ec                            |  4 ----
>>>> 6 files changed, 19 insertions(+), 9 deletions(-)
>>>>=20
>>>> diff --git a/configs/devices/mips64el-softmmu/default=2Emak
>>> b/configs/devices/mips64el-softmmu/default=2Emak
>>>> index c610749ac1=2E=2Ed5188f7ea5 100644
>>>> --- a/configs/devices/mips64el-softmmu/default=2Emak
>>>> +++ b/configs/devices/mips64el-softmmu/default=2Emak
>>>> @@ -1,7 +1,6 @@
>>>> # Default configuration for mips64el-softmmu
>>>>=20
>>>> include =2E=2E/mips-softmmu/common=2Emak
>>>> -CONFIG_IDE_VIA=3Dy
>>>> CONFIG_FULOONG=3Dy
>>>> CONFIG_LOONGSON3V=3Dy
>>>> CONFIG_ATI_VGA=3Dy
>>>> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
>>>> index d42143a991=2E=2E20de7e9294 100644
>>>> --- a/hw/isa/Kconfig
>>>> +++ b/hw/isa/Kconfig
>>>> @@ -53,6 +53,7 @@ config VT82C686
>>>>     select I8254
>>>>     select I8257
>>>>     select I8259
>>>> +    select IDE_VIA
>>>>     select MC146818RTC
>>>>     select PARALLEL
>>>>=20
>>>> diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>>>> index 5582c0b179=2E=2E37d9ed635d 100644
>>>> --- a/hw/isa/vt82c686=2Ec
>>>> +++ b/hw/isa/vt82c686=2Ec
>>>> @@ -17,6 +17,7 @@
>>>> #include "hw/isa/vt82c686=2Eh"
>>>> #include "hw/pci/pci=2Eh"
>>>> #include "hw/qdev-properties=2Eh"
>>>> +#include "hw/ide/pci=2Eh"
>>>> #include "hw/isa/isa=2Eh"
>>>> #include "hw/isa/superio=2Eh"
>>>> #include "hw/intc/i8259=2Eh"
>>>> @@ -544,6 +545,7 @@ struct ViaISAState {
>>>>     qemu_irq cpu_intr;
>>>>     qemu_irq *isa_irqs;
>>>>     ViaSuperIOState via_sio;
>>>> +    PCIIDEState ide;
>>>> };
>>>>=20
>>>> static const VMStateDescription vmstate_via =3D {
>>>> @@ -556,10 +558,18 @@ static const VMStateDescription vmstate_via =3D=
 {
>>>>     }
>>>> };
>>>>=20
>>>> +static void via_isa_init(Object *obj)
>>>> +{
>>>> +    ViaISAState *s =3D VIA_ISA(obj);
>>>> +
>>>> +    object_initialize_child(obj, "ide", &s->ide, "via-ide");
>>>> +}
>>>> +
>>>> static const TypeInfo via_isa_info =3D {
>>>>     =2Ename          =3D TYPE_VIA_ISA,
>>>>     =2Eparent        =3D TYPE_PCI_DEVICE,
>>>>     =2Einstance_size =3D sizeof(ViaISAState),
>>>> +    =2Einstance_init =3D via_isa_init,
>>>>     =2Eabstract      =3D true,
>>>>     =2Einterfaces    =3D (InterfaceInfo[]) {
>>>>         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>>>> @@ -583,6 +593,7 @@ static void via_isa_realize(PCIDevice *d, Error
>>> **errp)
>>>> {
>>>>     ViaISAState *s =3D VIA_ISA(d);
>>>>     DeviceState *dev =3D DEVICE(d);
>>>> +    PCIBus *pci_bus =3D pci_get_bus(d);
>>>>     qemu_irq *isa_irq;
>>>>     ISABus *isa_bus;
>>>>     int i;
>>>> @@ -607,6 +618,13 @@ static void via_isa_realize(PCIDevice *d, Error
>>> **errp)
>>>>     if (!qdev_realize(DEVICE(&s->via_sio), BUS(isa_bus), errp)) {
>>>>         return;
>>>>     }
>>>> +
>>>> +    /* Function 1: IDE */
>>>> +    qdev_prop_set_int32(DEVICE(&s->ide), "addr", d->devfn + 1);
>>>> +    if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
>>>> +        return;
>>>> +    }
>>>> +    pci_ide_create_devs(PCI_DEVICE(&s->ide));
>>>=20
>>> I'm not sure about moving pci_ide_create_devs() here=2E This is usally
>>> called from board code and only piix4 seems to do this=2E Maybe that's=
 wrong
>>> because if all IDE devices did this then one machine could not have mo=
re
>>> than one different ide devices (like having an on-board ide and adding=
 a
>>> pci ide controoler with -device) so this probably belongs to the board
>>> code to add devices to its default ide controller only as this is mach=
ine
>>> specific=2E Unless I'm wrong in which case somebody will correct me=2E
>>>=20
>>=20
>> Grepping the code it can be seen that it's always called right after
>> creating the IDE controllers=2E The only notable exception is the "sii3=
112"
>> device in the sam460ex board which is not emulated yet=2E Since the IDE
>
>The problem with sii3112 is that it only has 2 channels becuase I did not=
 bother to implement more so pci_ide_create_devs() probably would not work =
as it assumes 4 channels=2E AFAIK this means that the short -hda, -cdrom, e=
tc=2E convenience options don't work with sam460ex but yhou have to use the=
 long way of creating ide-hd and ide-cd devices on the command line=2E I th=
ink there's a version of this controller with 4 channels, maybe called sii3=
114 or similar and it would be easy to enhance the current model for that b=
ut I haven't done that=2E What's not emulated on sam460ex is the on-board S=
ATA ports of the SoC because it's too complex and all guest OSes have sii31=
xx drivers so it was simpler to implement that instead=2E The network port =
is the same as we already have working PCI network cards so I did not try t=
o implement the 460EX network ports=2E
>
>> controllers are often created in board code this means
>> pci_ide_create_devs() is called there as well=2E
>>=20
>> Grouping these calls together does make sense since it keeps the logic
>> together=2E Otherwise it could happen all too easily that code becomes
>> inconsistent such that pci_ide_create_devs() could be called without an=
 IDE
>> controller actually being available=2E Right?
>
>I don't know for sure but I think you cannot assign the devices to more t=
han one controller and if this was called by every ide model then adding tw=
o of such ide controllers would call pci_ide_create_devs() twice which I do=
n't think is correct and may cause problems=2E

This sounds reasonable=2E

> So I think it belongs to the board code even if the ide controller is cr=
eated within another device instantiated by the board so it's only called b=
y once=2E

pci_ide_create_devs() isn't called by the VIA IDE controller=2E Instead, i=
t gets called by the VIA south bridges, of which there should only be one p=
er board=2E Do you still see a risk of pci_ide_create_devs() being called m=
ultiple times? If so, I'd need to change the piix4 south bridge as well for=
 consistency=2E

Best regards,
Bernhard

>
>Regards,
>BALATON Zoltan
>
>>>> }
>>>>=20
>>>> /* TYPE_VT82C686B_ISA */
>>>> diff --git a/hw/mips/fuloong2e=2Ec b/hw/mips/fuloong2e=2Ec
>>>> index 5ee546f5f6=2E=2Edae263c1e3 100644
>>>> --- a/hw/mips/fuloong2e=2Ec
>>>> +++ b/hw/mips/fuloong2e=2Ec
>>>> @@ -205,9 +205,6 @@ static void vt82c686b_southbridge_init(PCIBus
>>> *pci_bus, int slot, qemu_irq intc,
>>>>                                           TYPE_VT82C686B_ISA);
>>>>     qdev_connect_gpio_out(DEVICE(dev), 0, intc);
>>>>=20
>>>> -    dev =3D pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide"=
);
>>>> -    pci_ide_create_devs(dev);
>>>> -
>>>>     pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhc=
i");
>>>>     pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), "vt82c686b-usb-uhc=
i");
>>>>=20
>>>> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
>>>> index 400511c6b7=2E=2E18565e966b 100644
>>>> --- a/hw/ppc/Kconfig
>>>> +++ b/hw/ppc/Kconfig
>>>> @@ -74,7 +74,6 @@ config PEGASOS2
>>>>     bool
>>>>     select MV64361
>>>>     select VT82C686
>>>> -    select IDE_VIA
>>>>     select SMBUS_EEPROM
>>>>     select VOF
>>>> # This should come with VT82C686
>>>> diff --git a/hw/ppc/pegasos2=2Ec b/hw/ppc/pegasos2=2Ec
>>>> index 61f4263953=2E=2E2f59d08ad1 100644
>>>> --- a/hw/ppc/pegasos2=2Ec
>>>> +++ b/hw/ppc/pegasos2=2Ec
>>>> @@ -165,10 +165,6 @@ static void pegasos2_init(MachineState *machine)
>>>>     qdev_connect_gpio_out(DEVICE(dev), 0,
>>>>                           qdev_get_gpio_in_named(pm->mv, "gpp", 31));
>>>>=20
>>>> -    /* VT8231 function 1: IDE Controller */
>>>> -    dev =3D pci_create_simple(pci_bus, PCI_DEVFN(12, 1), "via-ide");
>>>> -    pci_ide_create_devs(dev);
>>>> -
>>>>     /* VT8231 function 2-3: USB Ports */
>>>>     pci_create_simple(pci_bus, PCI_DEVFN(12, 2), "vt82c686b-usb-uhci"=
);
>>>>     pci_create_simple(pci_bus, PCI_DEVFN(12, 3), "vt82c686b-usb-uhci"=
);
>>>>=20
>>>=20
>>=20

