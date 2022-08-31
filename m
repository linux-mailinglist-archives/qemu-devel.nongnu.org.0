Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0B65A7B1B
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 12:12:19 +0200 (CEST)
Received: from localhost ([::1]:52076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTKhm-00082A-Lm
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 06:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTKcA-0006VS-3m; Wed, 31 Aug 2022 06:06:30 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:35384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTKc8-0003ZL-8a; Wed, 31 Aug 2022 06:06:29 -0400
Received: by mail-ej1-x62b.google.com with SMTP id og21so27337910ejc.2;
 Wed, 31 Aug 2022 03:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc;
 bh=fS4KmTCuNmeg1WjIYma/YKff8JsqTF8amplMTHAukeE=;
 b=Be/UYwb29q5xmBMP61kUzAAT0KQV7wX6eHZy2EATGqQJaODlHpnFI2334U5lT0XtfP
 1QEgceSRBIpTU0CnqCyX4EJawciyAW6YjD6aYKJtt97qQrYjbjRhQe9zqOsuqr+F/pZc
 q3v+OPpUVAWzf14EPD/Reh73KWBo4Ku36NOKRLriXHgrqIPeRopaNeEuqc7k1cAvOK0P
 7TCwCxxtvrT+FQ+muXMXzMqg3QhdxZopMYwGz+mZjNRsFc9/9dBe8pkeax27pROcY3ek
 oJtjo5IDN9hWVfutgDfWAeJS1udzs3UeKsAFA3n/iwQdu9K1fJhRKviOEaPoVqIXYmQE
 Mv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc;
 bh=fS4KmTCuNmeg1WjIYma/YKff8JsqTF8amplMTHAukeE=;
 b=luhtnd/9ntcQk44nJl7mlwKcWuCdDXKbq+2BXJNHG55VJIyCvNoAisXYtUwWjyZMp2
 1t4o8P1AT2QsDDAGiKsrpex1FABQtztoyL1lLKvHPxL6Sg9YrK316+qWqJTiDAiMRvdh
 T4zrkArsrnnomifJLObzUlc/a7gnJX7ez/5Y6EvMbE0z6NCRnDKywLShW4n+9ikRfQEM
 ge8IA8spmjMSQLsDIBh20Up1fN2PCpgOU2lt/9bvibpL68kf7TE+nOE03ER7L++WEjHn
 KYA2FRHVpBAXOia/nxG/+LWWIUDeak+6KdjrmahQ/7xHg8zFlWKDcqmiAd4unzi3HP9c
 58TQ==
X-Gm-Message-State: ACgBeo0NUo/hJLGLUOUHZcP6cjNlK76KPg8MULymttckAWycK/OMRbS2
 38HBCz/yvQKUAGm0mEx9DQ9TMy5xrjA=
X-Google-Smtp-Source: AA6agR50jjRc31iIYLHjgGuag3eZuHRXwC9/gHGtbb7RxSNPB3lAvC+KcXmSza1ZfaCXtbJ3K2YxVg==
X-Received: by 2002:a17:906:a0d3:b0:73d:be5b:2b52 with SMTP id
 bh19-20020a170906a0d300b0073dbe5b2b52mr20196037ejb.727.1661940385814; 
 Wed, 31 Aug 2022 03:06:25 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb200a5066d0f8b32ea85.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:a506:6d0f:8b32:ea85])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a17090657ce00b0073dd0b0ba67sm6907093ejr.200.2022.08.31.03.06.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 03:06:25 -0700 (PDT)
Date: Wed, 31 Aug 2022 12:06:22 +0200
From: BB <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_06/10=5D_hw/isa/vt82c686=3A_I?=
 =?US-ASCII?Q?nstantiate_USB_functions_in_host_device?=
User-Agent: K-9 Mail for Android
In-Reply-To: <43c077df-a5ca-239b-7b5-1ca4880edef@eik.bme.hu>
References: <20220830190048.67448-1-shentey@gmail.com>
 <20220830190048.67448-7-shentey@gmail.com>
 <43c077df-a5ca-239b-7b5-1ca4880edef@eik.bme.hu>
Message-ID: <2DA9181D-8525-4A79-AEE6-4242659BA5D7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
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



Am 31=2E August 2022 00:33:33 MESZ schrieb BALATON Zoltan <balaton@eik=2Eb=
me=2Ehu>:
>On Tue, 30 Aug 2022, Bernhard Beschow wrote:
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
>> index 9d946cea54=2E=2E6aba7f29de 100644
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
>> +    for (i =3D 0; i < ARRAY_SIZE(s->uhci); ++i) {
>
>It does not really matter but Usually i++ is used in for loops so seeing =
++i here is a bit odd but this alone isn't worth a new version=2E

Fixed in v3=2E

Regards,
Bernhard
>
>Regards,
>BALATON Zoltan
>
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

