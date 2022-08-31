Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FB35A80AF
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 16:56:28 +0200 (CEST)
Received: from localhost ([::1]:42044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTP8k-0003lj-LG
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 10:56:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTP2S-0006k7-UF; Wed, 31 Aug 2022 10:50:00 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:33514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTP2R-0008AC-3U; Wed, 31 Aug 2022 10:49:56 -0400
Received: by mail-ej1-x633.google.com with SMTP id cu2so28955046ejb.0;
 Wed, 31 Aug 2022 07:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc;
 bh=jQirx8cZ2TjrtLkZRlGGSINfEvCu9nPUr02nKJ7EdLw=;
 b=TL0kB9VBvXLguOaHvq2EfWdXX1NCYD4Qm+2gr20qgSI6oQ3iSZpStIAVLnbWJGJ0Rg
 GbX/Z811RkwabPmoKQNgKing+awK5xQzaZHVyuKuZYSJL1r7DfV6FUwybc1ri6n9hDBO
 sQWg3IvzelER4S9zm2LoL+WxLCk/ak9CShlLFh2FN1yehdvdoqCtYqhMxjw29TBUpqqY
 /sIxVSzcOuDph1QOyhzEZU2ZMurM17m0+lwOt/IrJ1fSGbyBzfYT1EgA4e30DhUenFjP
 cuIiuLD5SYbeGZ3quWUYrdwAYjJ2AIFnT/NwUWmaPQFioCvdaBPlBL0XLyVK+q7MggcY
 AleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc;
 bh=jQirx8cZ2TjrtLkZRlGGSINfEvCu9nPUr02nKJ7EdLw=;
 b=by75qVKxTL9QGNaaJ6/iG4ftI14gX36a9mL3/gcHyAHSA1lB8x3hYsLIa+5V+soTqa
 DHw4Vy0Dnv5yZHFgIZbugOOP7soa6kP/HJYYCFzwnM8g/doFXYqvXJ9X4IKKZ/NRQdi6
 N/sHjNTT6REST46jjqcPib17BOGuQkQyPkAzBxmMUHtIJkrvze7N/tgi9vMleuuLNfw/
 O6J6xuafL6upsMvndddT5NBGgRe4N9a2OdqwL81PDWWc345JdPKOkWi+cpTiDaQNFe5y
 XBWmlj6OlzZWUiCx0tF62JwqQCDWRD6yfUE97lOb9xFsUTYWgWS/U+QsKrWDfIdUk1M1
 bk1w==
X-Gm-Message-State: ACgBeo0doXiO9UMP1UfIE9ij6tFeTSI2RQcDFiNS7P/BV7P/eVMci6jU
 38yqcZZip+xOuJzgKKETut8=
X-Google-Smtp-Source: AA6agR5LODfCa1iPeDEv6MaSyRqCcvRtVovOgYlX2DqXRuzC54nC7pEc2kW8C3G+eDLMwm6bfiuV0A==
X-Received: by 2002:a17:907:9812:b0:741:973d:fe78 with SMTP id
 ji18-20020a170907981200b00741973dfe78mr9667761ejc.490.1661957393092; 
 Wed, 31 Aug 2022 07:49:53 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb200a5066d0f8b32ea85.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:a506:6d0f:8b32:ea85])
 by smtp.gmail.com with ESMTPSA id
 kw14-20020a170907770e00b0073d685a2985sm7197331ejc.108.2022.08.31.07.49.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 07:49:52 -0700 (PDT)
Date: Wed, 31 Aug 2022 16:49:48 +0200
From: BB <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_06/10=5D_hw/isa/vt82c686=3A_I?=
 =?US-ASCII?Q?nstantiate_USB_functions_in_host_device?=
User-Agent: K-9 Mail for Android
In-Reply-To: <331bbd5a-aeaa-d5c0-cf8f-cde5b22d8a3@eik.bme.hu>
References: <20220831095914.2041-1-shentey@gmail.com>
 <20220831095914.2041-7-shentey@gmail.com>
 <331bbd5a-aeaa-d5c0-cf8f-cde5b22d8a3@eik.bme.hu>
Message-ID: <96C4E9E5-4875-4B49-B176-673BAAEE7993@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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



Am 31=2E August 2022 15:23:37 MESZ schrieb BALATON Zoltan <balaton@eik=2Eb=
me=2Ehu>:
>On Wed, 31 Aug 2022, Bernhard Beschow wrote:
>> The USB functions can be enabled/disabled through the ISA function=2E A=
lso
>> its interrupt routing can be influenced there=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>> hw/isa/vt82c686=2Ec   | 12 ++++++++++++
>> hw/mips/fuloong2e=2Ec |  3 ---
>> hw/ppc/pegasos2=2Ec   |  4 ----
>> 3 files changed, 12 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>> index 9d946cea54=2E=2E66a4b9c230 100644
>> --- a/hw/isa/vt82c686=2Ec
>> +++ b/hw/isa/vt82c686=2Ec
>> @@ -23,6 +23,7 @@
>> #include "hw/intc/i8259=2Eh"
>> #include "hw/irq=2Eh"
>> #include "hw/dma/i8257=2Eh"
>> +#include "hw/usb/hcd-uhci=2Eh"
>> #include "hw/timer/i8254=2Eh"
>> #include "hw/rtc/mc146818rtc=2Eh"
>> #include "migration/vmstate=2Eh"
>> @@ -546,6 +547,7 @@ struct ViaISAState {
>>     qemu_irq *isa_irqs;
>>     ViaSuperIOState via_sio;
>>     PCIIDEState ide;
>> +    UHCIState uhci[2];
>> };
>>=20
>> static const VMStateDescription vmstate_via =3D {
>> @@ -563,6 +565,8 @@ static void via_isa_init(Object *obj)
>>     ViaISAState *s =3D VIA_ISA(obj);
>>=20
>>     object_initialize_child(obj, "ide", &s->ide, "via-ide");
>> +    object_initialize_child(obj, "uhci1", &s->uhci[0], "vt82c686b-usb-=
uhci");
>> +    object_initialize_child(obj, "uhci2", &s->uhci[1], "vt82c686b-usb-=
uhci");
>
>Sorry for not saying this yesterday, this can also be done separately so =
no need for another version of this series if not needed for another reason=
 but could we add a define for vt82c686b-usb-uhci in include/hw/isa/vt82c68=
6=2Eh and use that here and in hw/usb/vt82c686-uhci-pci=2Ec ?

Would creating a dedicated header work, too? Board code doesn't need to se=
e the define any longer=2E

Regards,
Bernhard
>
>Regards,
>BALATON Zoltan
>
>> }
>>=20
>> static const TypeInfo via_isa_info =3D {
>> @@ -629,6 +633,14 @@ static void via_isa_realize(PCIDevice *d, Error **=
errp)
>>     if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
>>         return;
>>     }
>> +
>> +    /* Functions 2-3: USB Ports */
>> +    for (i =3D 0; i < ARRAY_SIZE(s->uhci); i++) {
>> +        qdev_prop_set_int32(DEVICE(&s->uhci[i]), "addr", d->devfn + 2 =
+ i);
>> +        if (!qdev_realize(DEVICE(&s->uhci[i]), BUS(pci_bus), errp)) {
>> +            return;
>> +        }
>> +    }
>> }
>>=20
>> /* TYPE_VT82C686B_ISA */
>> diff --git a/hw/mips/fuloong2e=2Ec b/hw/mips/fuloong2e=2Ec
>> index 32605901e7=2E=2Edc92223b76 100644
>> --- a/hw/mips/fuloong2e=2Ec
>> +++ b/hw/mips/fuloong2e=2Ec
>> @@ -208,9 +208,6 @@ static void vt82c686b_southbridge_init(PCIBus *pci_=
bus, int slot, qemu_irq intc,
>>     dev =3D PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"=
));
>>     pci_ide_create_devs(dev);
>>=20
>> -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci=
");
>> -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), "vt82c686b-usb-uhci=
");
>> -
>>     dev =3D pci_create_simple(pci_bus, PCI_DEVFN(slot, 4), TYPE_VT82C68=
6B_PM);
>>     *i2c_bus =3D I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
>>=20
>> diff --git a/hw/ppc/pegasos2=2Ec b/hw/ppc/pegasos2=2Ec
>> index 8bc528a560=2E=2E85cca6f7a6 100644
>> --- a/hw/ppc/pegasos2=2Ec
>> +++ b/hw/ppc/pegasos2=2Ec
>> @@ -168,10 +168,6 @@ static void pegasos2_init(MachineState *machine)
>>     dev =3D PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"=
));
>>     pci_ide_create_devs(dev);
>>=20
>> -    /* VT8231 function 2-3: USB Ports */
>> -    pci_create_simple(pci_bus, PCI_DEVFN(12, 2), "vt82c686b-usb-uhci")=
;
>> -    pci_create_simple(pci_bus, PCI_DEVFN(12, 3), "vt82c686b-usb-uhci")=
;
>> -
>>     /* VT8231 function 4: Power Management Controller */
>>     dev =3D pci_create_simple(pci_bus, PCI_DEVFN(12, 4), TYPE_VT8231_PM=
);
>>     i2c_bus =3D I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
>>=20

