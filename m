Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06885A6DCF
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 21:51:16 +0200 (CEST)
Received: from localhost ([::1]:33766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT7GW-00080u-2R
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 15:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oT6YT-0006Or-RT; Tue, 30 Aug 2022 15:05:45 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oT6YR-0000ry-NS; Tue, 30 Aug 2022 15:05:45 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 r204-20020a1c44d5000000b003a84b160addso2387888wma.2; 
 Tue, 30 Aug 2022 12:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc;
 bh=BtsDtktfYFvzQJnvXsb46XWjQy4Jtv98mS+JYC3iS5o=;
 b=lbZD1WwMhQHcFLrsKn/MrSNLC+SxcHia8AUhTXM1G39yQUsc4RDglLHRnM0LzDSgva
 wwwlROO/C8IZgtQUgbFcTPgT7RgFoWaP59m8leBYRZ4MSTWAPR/Kase2hyQ9kad1lxOC
 b+yPILzUaueeVXszrXwNpCm2xCXnN5ryIlew2iiNpU3zxaayDnq1ZSHM5sFm/P9O+eK/
 dncL6wcy36BLKZwuOlpgDcOSS8YlMDf2ts0sWcSc2CyPX+wqFqKKoVEezzLmp3WDk6hM
 oxq4VCjACHmz6ZPvYeGRJleopFKeZGgpVuhpnbby5Q9cjeFMgdF906hi4OC8Bpq+HQ5Q
 +gkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc;
 bh=BtsDtktfYFvzQJnvXsb46XWjQy4Jtv98mS+JYC3iS5o=;
 b=yaxZl3l01uYIHpKSlqGYixcGzcX1hB9tgzTqLIrn80FA33C23pFU3/R5Xqu06mFY4e
 fHeLUFo2BeanjtiC33GDSPzjHdYqQLLpGR784QAW78vIjQAMuhFczYnlD/PvwGPG5nBc
 efxFOEu6VktvFzLaM6tyP3umF4y//UbqG6NxX8g9F1qSRE0rYl+hkvx0lXppQptnUtco
 4cUZDWFVw93uPvkMy09ZEFGgfZ9b5lvKROY0qt/3OM3nl4H/NZ4rjUFLY1EtiAYJ1t/G
 0cE3iqiYQwGG2peeTPXlEjThJZWuaSKI0speOc/eH12jFQAtGloKP8ouFANmA90XTRHh
 bI6A==
X-Gm-Message-State: ACgBeo0TDR4Ox/+x8fL53COSiU2QRFiwN5HzDmkamC19WFaMrCwvw6NL
 lcZkf83ksQv4jXk+pUdWE04=
X-Google-Smtp-Source: AA6agR5sLs5rgWzfCwHN0NbaALd5DXKks6i128+f+/E8Lh0Eo9LaOErpkgy92sl0zsoYtPxXkR3riA==
X-Received: by 2002:a05:600c:3488:b0:3a8:52f7:b869 with SMTP id
 a8-20020a05600c348800b003a852f7b869mr2265080wmq.36.1661886341831; 
 Tue, 30 Aug 2022 12:05:41 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb2005049a168885e8d4b.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:5049:a168:885e:8d4b])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a056000054f00b00226e173b61esm2991136wrf.111.2022.08.30.12.05.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 12:05:41 -0700 (PDT)
Date: Tue, 30 Aug 2022 21:05:27 +0200
From: BB <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: QEMU Developers <qemu-devel@nongnu.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 "open list:sam460ex" <qemu-ppc@nongnu.org>
Subject: Re: [PATCH 4/9] hw/isa/vt82c686: QOM'ify via-ide creation
User-Agent: K-9 Mail for Android
In-Reply-To: <1178BE31-FB26-408D-AB88-253DBC9F128D@gmail.com>
References: <20220822224355.11753-1-shentey@gmail.com>
 <20220822224355.11753-5-shentey@gmail.com>
 <14e283f-7bbd-dd70-5458-af897cd7ff4a@eik.bme.hu>
 <CAG4p6K51DvVFndv+ZuokigksdqjaegkRRnt1ZaOOQqJxp9xGEw@mail.gmail.com>
 <3ae09c8f-36c0-3874-db91-776f175a649c@eik.bme.hu>
 <BF0B3207-F80F-4653-BC43-D0735C16B4DB@gmail.com>
 <6c69a78-f461-1b78-9e8d-2d1c11475a3@eik.bme.hu>
 <1178BE31-FB26-408D-AB88-253DBC9F128D@gmail.com>
Message-ID: <7B5369A6-DB67-40D3-A98C-D73DE381E1E8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x329.google.com
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



Am 29=2E August 2022 20:12:21 MESZ schrieb BB <shentey@gmail=2Ecom>:
>
>
>Am 29=2E August 2022 19:04:06 MESZ schrieb BALATON Zoltan <balaton@eik=2E=
bme=2Ehu>:
>>On Mon, 29 Aug 2022, BB wrote:
>>> Am 25=2E August 2022 01:18:56 MESZ schrieb BALATON Zoltan <balaton@eik=
=2Ebme=2Ehu>:
>>>> On Thu, 25 Aug 2022, Bernhard Beschow wrote:
>>>>> On Wed, Aug 24, 2022 at 3:54 PM BALATON Zoltan <balaton@eik=2Ebme=2E=
hu> wrote:
>>>>>> On Tue, 23 Aug 2022, Bernhard Beschow wrote:
>>>>>>> The IDE function is closely tied to the ISA function (e=2Eg=2E the=
 IDE
>>>>>>> interrupt routing happens there), so it makes sense that the IDE
>>>>>>> function is instantiated within the southbridge itself=2E As a sid=
e effect,
>>>>>>> duplicated code in the boards is resolved=2E
>>>>>>>=20
>>>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>>>>> ---
>>>>>>> configs/devices/mips64el-softmmu/default=2Emak |  1 -
>>>>>>> hw/isa/Kconfig                               |  1 +
>>>>>>> hw/isa/vt82c686=2Ec                            | 18 ++++++++++++++=
++++
>>>>>>> hw/mips/fuloong2e=2Ec                          |  3 ---
>>>>>>> hw/ppc/Kconfig                               |  1 -
>>>>>>> hw/ppc/pegasos2=2Ec                            |  4 ----
>>>>>>> 6 files changed, 19 insertions(+), 9 deletions(-)
>>>>>>>=20
>>>>>>> diff --git a/configs/devices/mips64el-softmmu/default=2Emak
>>>>>> b/configs/devices/mips64el-softmmu/default=2Emak
>>>>>>> index c610749ac1=2E=2Ed5188f7ea5 100644
>>>>>>> --- a/configs/devices/mips64el-softmmu/default=2Emak
>>>>>>> +++ b/configs/devices/mips64el-softmmu/default=2Emak
>>>>>>> @@ -1,7 +1,6 @@
>>>>>>> # Default configuration for mips64el-softmmu
>>>>>>>=20
>>>>>>> include =2E=2E/mips-softmmu/common=2Emak
>>>>>>> -CONFIG_IDE_VIA=3Dy
>>>>>>> CONFIG_FULOONG=3Dy
>>>>>>> CONFIG_LOONGSON3V=3Dy
>>>>>>> CONFIG_ATI_VGA=3Dy
>>>>>>> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
>>>>>>> index d42143a991=2E=2E20de7e9294 100644
>>>>>>> --- a/hw/isa/Kconfig
>>>>>>> +++ b/hw/isa/Kconfig
>>>>>>> @@ -53,6 +53,7 @@ config VT82C686
>>>>>>>     select I8254
>>>>>>>     select I8257
>>>>>>>     select I8259
>>>>>>> +    select IDE_VIA
>>>>>>>     select MC146818RTC
>>>>>>>     select PARALLEL
>>>>>>>=20
>>>>>>> diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>>>>>>> index 5582c0b179=2E=2E37d9ed635d 100644
>>>>>>> --- a/hw/isa/vt82c686=2Ec
>>>>>>> +++ b/hw/isa/vt82c686=2Ec
>>>>>>> @@ -17,6 +17,7 @@
>>>>>>> #include "hw/isa/vt82c686=2Eh"
>>>>>>> #include "hw/pci/pci=2Eh"
>>>>>>> #include "hw/qdev-properties=2Eh"
>>>>>>> +#include "hw/ide/pci=2Eh"
>>>>>>> #include "hw/isa/isa=2Eh"
>>>>>>> #include "hw/isa/superio=2Eh"
>>>>>>> #include "hw/intc/i8259=2Eh"
>>>>>>> @@ -544,6 +545,7 @@ struct ViaISAState {
>>>>>>>     qemu_irq cpu_intr;
>>>>>>>     qemu_irq *isa_irqs;
>>>>>>>     ViaSuperIOState via_sio;
>>>>>>> +    PCIIDEState ide;
>>>>>>> };
>>>>>>>=20
>>>>>>> static const VMStateDescription vmstate_via =3D {
>>>>>>> @@ -556,10 +558,18 @@ static const VMStateDescription vmstate_via =
=3D {
>>>>>>>     }
>>>>>>> };
>>>>>>>=20
>>>>>>> +static void via_isa_init(Object *obj)
>>>>>>> +{
>>>>>>> +    ViaISAState *s =3D VIA_ISA(obj);
>>>>>>> +
>>>>>>> +    object_initialize_child(obj, "ide", &s->ide, "via-ide");
>>>>>>> +}
>>>>>>> +
>>>>>>> static const TypeInfo via_isa_info =3D {
>>>>>>>     =2Ename          =3D TYPE_VIA_ISA,
>>>>>>>     =2Eparent        =3D TYPE_PCI_DEVICE,
>>>>>>>     =2Einstance_size =3D sizeof(ViaISAState),
>>>>>>> +    =2Einstance_init =3D via_isa_init,
>>>>>>>     =2Eabstract      =3D true,
>>>>>>>     =2Einterfaces    =3D (InterfaceInfo[]) {
>>>>>>>         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>>>>>>> @@ -583,6 +593,7 @@ static void via_isa_realize(PCIDevice *d, Erro=
r
>>>>>> **errp)
>>>>>>> {
>>>>>>>     ViaISAState *s =3D VIA_ISA(d);
>>>>>>>     DeviceState *dev =3D DEVICE(d);
>>>>>>> +    PCIBus *pci_bus =3D pci_get_bus(d);
>>>>>>>     qemu_irq *isa_irq;
>>>>>>>     ISABus *isa_bus;
>>>>>>>     int i;
>>>>>>> @@ -607,6 +618,13 @@ static void via_isa_realize(PCIDevice *d, Err=
or
>>>>>> **errp)
>>>>>>>     if (!qdev_realize(DEVICE(&s->via_sio), BUS(isa_bus), errp)) {
>>>>>>>         return;
>>>>>>>     }
>>>>>>> +
>>>>>>> +    /* Function 1: IDE */
>>>>>>> +    qdev_prop_set_int32(DEVICE(&s->ide), "addr", d->devfn + 1);
>>>>>>> +    if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
>>>>>>> +        return;
>>>>>>> +    }
>>>>>>> +    pci_ide_create_devs(PCI_DEVICE(&s->ide));
>>>>>>=20
>>>>>> I'm not sure about moving pci_ide_create_devs() here=2E This is usa=
lly
>>>>>> called from board code and only piix4 seems to do this=2E Maybe tha=
t's wrong
>>>>>> because if all IDE devices did this then one machine could not have=
 more
>>>>>> than one different ide devices (like having an on-board ide and add=
ing a
>>>>>> pci ide controoler with -device) so this probably belongs to the bo=
ard
>>>>>> code to add devices to its default ide controller only as this is m=
achine
>>>>>> specific=2E Unless I'm wrong in which case somebody will correct me=
=2E
>>>>>>=20
>>>>>=20
>>>>> Grepping the code it can be seen that it's always called right after
>>>>> creating the IDE controllers=2E The only notable exception is the "s=
ii3112"
>>>>> device in the sam460ex board which is not emulated yet=2E Since the =
IDE
>>>>=20
>>>> The problem with sii3112 is that it only has 2 channels becuase I did=
 not bother to implement more so pci_ide_create_devs() probably would not w=
ork as it assumes 4 channels=2E AFAIK this means that the short -hda, -cdro=
m, etc=2E convenience options don't work with sam460ex but yhou have to use=
 the long way of creating ide-hd and ide-cd devices on the command line=2E =
I think there's a version of this controller with 4 channels, maybe called =
sii3114 or similar and it would be easy to enhance the current model for th=
at but I haven't done that=2E What's not emulated on sam460ex is the on-boa=
rd SATA ports of the SoC because it's too complex and all guest OSes have s=
ii31xx drivers so it was simpler to implement that instead=2E The network p=
ort is the same as we already have working PCI network cards so I did not t=
ry to implement the 460EX network ports=2E
>>>>=20
>>>>> controllers are often created in board code this means
>>>>> pci_ide_create_devs() is called there as well=2E
>>>>>=20
>>>>> Grouping these calls together does make sense since it keeps the log=
ic
>>>>> together=2E Otherwise it could happen all too easily that code becom=
es
>>>>> inconsistent such that pci_ide_create_devs() could be called without=
 an IDE
>>>>> controller actually being available=2E Right?
>>>>=20
>>>> I don't know for sure but I think you cannot assign the devices to mo=
re than one controller and if this was called by every ide model then addin=
g two of such ide controllers would call pci_ide_create_devs() twice which =
I don't think is correct and may cause problems=2E
>>>=20
>>> This sounds reasonable=2E
>>>=20
>>>> So I think it belongs to the board code even if the ide controller is=
 created within another device instantiated by the board so it's only calle=
d by once=2E
>>>=20
>>> pci_ide_create_devs() isn't called by the VIA IDE controller=2E Instea=
d, it gets called by the VIA south bridges, of which there should only be o=
ne per board=2E Do you still see a risk of pci_ide_create_devs() being call=
ed multiple times? If so, I'd need to change the piix4 south bridge as well=
 for consistency=2E
>>
>>Since the vt8231 is user_creatable =3D false there's probably no way to =
add a second one accidentally so in this case there's no direct risk=2E Yet=
 for consistency I'd keep the call to pci_ide_create_devs() in board code a=
s done by all other machines just to avoid any misunderstanding and keep it=
 consistent accross the board(s) :-)
>
>:-)
>
>I'll add a patch for Malta/Piix4 to the series then=2E

I'll actually add this patch to my piix consolidation series=2E Otherwise =
this patch would interfere with it=2E

>
>Best regards,
>Bernhard
>>
>>Regards,
>>BALATON Zoltan

