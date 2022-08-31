Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EDC5A8044
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 16:33:56 +0200 (CEST)
Received: from localhost ([::1]:49812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTOmv-0003xw-Vz
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 10:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTOkK-0001mg-J2; Wed, 31 Aug 2022 10:31:13 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:45981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTOk5-0000zP-7t; Wed, 31 Aug 2022 10:31:11 -0400
Received: by mail-ej1-x633.google.com with SMTP id lx1so28712121ejb.12;
 Wed, 31 Aug 2022 07:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc;
 bh=g5SkniY5slYsTJQZCo+EadQ/5I1AMcjRdOMlgHdfwCY=;
 b=kQvvHk8pKcpS0P7KnAiOQNn1cStlh6FeQSRBwIpVnByNeWmUKqlnhn4Y++Qvle4/c+
 i/d0fgiuGyHzW2KAbxTv6Xy5WVDVeX+pxp689fs5MASLoqGF9uAhyVI1Vwv+n2r9Wpuh
 1WQlZVtackS6Kwi3tVJCk7ldtBMS5ZV3v9Kd873413bnwl4MMOnbaFVc9FLqKa9eEGn8
 nEyxKfyQMiyxUyX3Qnci5sP4Wqfvm7XqwW2O25iIR/NTzGS//h1L2K47OZKbWoTXxDbY
 wr9cqK/MDDyeoF39A7sR/oJO3ipzefB3jeKilFbbWKUyy9HjO5LVlYTNtfZjEZ0BCmGZ
 MV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc;
 bh=g5SkniY5slYsTJQZCo+EadQ/5I1AMcjRdOMlgHdfwCY=;
 b=UXe6BOH/P15ROSTY8ctaJZLDcLVlIbfqX3ZJz2Tyb+AK2rPwSe6KS2RixJispMkA4N
 TIkgaIOAWMvDrDsmbmHBjkrxgDe8+JE2z9SsOL1I+OExNOg7ebKdDcc5EnD+26ZgL1Cp
 fZUaPOPj2f8w/CqUJr6ymtmGXhIeSdOTJryYqxMvBgYLDGWl8zkj4xmpKbXv2iHEewtI
 dZRN79nBmpiIr3ifLMhoEPgCybpnLFNu6a8F/n3KQ/YzW9CRXdfuScqa9tLcM1FkaqgD
 9feV9o71cWg+XGkPZrWvesY2nlWGefvFaH+DsGqk8bOzRhnsU5eQ67MsWcg0ooX6fxJb
 /NbA==
X-Gm-Message-State: ACgBeo3vBDvbuTpQkaCwGIA4LQUjq6rM97IE4CY2PuZuyknxnEqJPzTH
 9CSv9P4N7O8JM1v35NmhVgg=
X-Google-Smtp-Source: AA6agR6DHgQe+SLnr8jL5tBGwmxbcEkyA+qDmsKlwhf1USyLdk2NSe+DFRVQa0mdPLTATaZTvlzAKQ==
X-Received: by 2002:a17:907:2e01:b0:731:1eb0:b9ff with SMTP id
 ig1-20020a1709072e0100b007311eb0b9ffmr20881270ejc.728.1661956255207; 
 Wed, 31 Aug 2022 07:30:55 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb200a5066d0f8b32ea85.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:a506:6d0f:8b32:ea85])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a170906781500b0072f42ca292bsm7108434ejm.129.2022.08.31.07.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 07:30:54 -0700 (PDT)
Date: Wed, 31 Aug 2022 16:30:50 +0200
From: BB <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_05/10=5D_hw/isa/vt82c686=3A_?=
 =?US-ASCII?Q?Instantiate_IDE_function_in_host_device?=
User-Agent: K-9 Mail for Android
In-Reply-To: <4518c58f-7f54-2693-ed7b-1125bad1623@eik.bme.hu>
References: <20220831095914.2041-1-shentey@gmail.com>
 <20220831095914.2041-6-shentey@gmail.com>
 <4518c58f-7f54-2693-ed7b-1125bad1623@eik.bme.hu>
Message-ID: <132A9DC6-304A-4CAD-BCF5-C032C2942961@gmail.com>
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



Am 31=2E August 2022 15:12:26 MESZ schrieb BALATON Zoltan <balaton@eik=2Eb=
me=2Ehu>:
>On Wed, 31 Aug 2022, Bernhard Beschow wrote:
>> The IDE function is closely tied to the ISA function (e=2Eg=2E the IDE
>> interrupt routing happens there), so it makes sense that the IDE
>> function is instantiated within the south bridge itself=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>> configs/devices/mips64el-softmmu/default=2Emak |  1 -
>> hw/isa/Kconfig                               |  1 +
>> hw/isa/vt82c686=2Ec                            | 17 +++++++++++++++++
>> hw/mips/fuloong2e=2Ec                          |  8 ++++----
>> hw/ppc/Kconfig                               |  1 -
>> hw/ppc/pegasos2=2Ec                            |  9 ++++-----
>> 6 files changed, 26 insertions(+), 11 deletions(-)
>>=20
>> diff --git a/configs/devices/mips64el-softmmu/default=2Emak b/configs/d=
evices/mips64el-softmmu/default=2Emak
>> index c610749ac1=2E=2Ed5188f7ea5 100644
>> --- a/configs/devices/mips64el-softmmu/default=2Emak
>> +++ b/configs/devices/mips64el-softmmu/default=2Emak
>> @@ -1,7 +1,6 @@
>> # Default configuration for mips64el-softmmu
>>=20
>> include =2E=2E/mips-softmmu/common=2Emak
>> -CONFIG_IDE_VIA=3Dy
>> CONFIG_FULOONG=3Dy
>> CONFIG_LOONGSON3V=3Dy
>> CONFIG_ATI_VGA=3Dy
>> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
>> index d42143a991=2E=2E20de7e9294 100644
>> --- a/hw/isa/Kconfig
>> +++ b/hw/isa/Kconfig
>> @@ -53,6 +53,7 @@ config VT82C686
>>     select I8254
>>     select I8257
>>     select I8259
>> +    select IDE_VIA
>>     select MC146818RTC
>>     select PARALLEL
>>=20
>> diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>> index 37e37b3855=2E=2E9d946cea54 100644
>> --- a/hw/isa/vt82c686=2Ec
>> +++ b/hw/isa/vt82c686=2Ec
>> @@ -17,6 +17,7 @@
>> #include "hw/isa/vt82c686=2Eh"
>> #include "hw/pci/pci=2Eh"
>> #include "hw/qdev-properties=2Eh"
>> +#include "hw/ide/pci=2Eh"
>> #include "hw/isa/isa=2Eh"
>> #include "hw/isa/superio=2Eh"
>> #include "hw/intc/i8259=2Eh"
>> @@ -544,6 +545,7 @@ struct ViaISAState {
>>     qemu_irq cpu_intr;
>>     qemu_irq *isa_irqs;
>>     ViaSuperIOState via_sio;
>> +    PCIIDEState ide;
>> };
>>=20
>> static const VMStateDescription vmstate_via =3D {
>> @@ -556,10 +558,18 @@ static const VMStateDescription vmstate_via =3D {
>>     }
>> };
>>=20
>> +static void via_isa_init(Object *obj)
>> +{
>> +    ViaISAState *s =3D VIA_ISA(obj);
>> +
>> +    object_initialize_child(obj, "ide", &s->ide, "via-ide");
>> +}
>> +
>> static const TypeInfo via_isa_info =3D {
>>     =2Ename          =3D TYPE_VIA_ISA,
>>     =2Eparent        =3D TYPE_PCI_DEVICE,
>>     =2Einstance_size =3D sizeof(ViaISAState),
>> +    =2Einstance_init =3D via_isa_init,
>
>Did you verify this is actually called? I guess you could add a debug pri=
ntf in the init method above or check the output of info qom-tree to see if=
 ide apears below via-isa=2E I'm not sure because I think QOM does not call=
 superclass methods if you override them, that's why the subclass realize m=
ethods called via_isa_realize before=2E In this case it may not cause a pro=
blem because ide-via does not have an init method so it will work with just=
 realize called so the only effect may be that qom-tree is not like it shou=
ld be=2E Or if this is called then I still don't get QOM=2E

We discussed the semantics of init() vs=2E realize() when discussing patch=
 1 in v1 which consolidates realize() methods=2E My understanding is that i=
nit() behaves like C++ constructors which are called implicitly parent firs=
t, child next=2E OTOH realize() methods behave like virtual methods which g=
et replaced by the most specific one, i=2Ee=2E one needs to call the parent=
 implementation explicitly=2E

Anyway, via_isa_init() must be called, otherwise the realize() method woul=
d abort due to trying to realize the non-initialized ide attribute=2E

Regards,
Bernhard
>
>Regards,
>BALATON Zoltan
>
>>     =2Eabstract      =3D true,
>>     =2Einterfaces    =3D (InterfaceInfo[]) {
>>         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>> @@ -583,6 +593,7 @@ static void via_isa_realize(PCIDevice *d, Error **e=
rrp)
>> {
>>     ViaISAState *s =3D VIA_ISA(d);
>>     DeviceState *dev =3D DEVICE(d);
>> +    PCIBus *pci_bus =3D pci_get_bus(d);
>>     qemu_irq *isa_irq;
>>     ISABus *isa_bus;
>>     int i;
>> @@ -612,6 +623,12 @@ static void via_isa_realize(PCIDevice *d, Error **=
errp)
>>     if (!qdev_realize(DEVICE(&s->via_sio), BUS(isa_bus), errp)) {
>>         return;
>>     }
>> +
>> +    /* Function 1: IDE */
>> +    qdev_prop_set_int32(DEVICE(&s->ide), "addr", d->devfn + 1);
>> +    if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
>> +        return;
>> +    }
>> }
>>=20
>> /* TYPE_VT82C686B_ISA */
>> diff --git a/hw/mips/fuloong2e=2Ec b/hw/mips/fuloong2e=2Ec
>> index 5ee546f5f6=2E=2E32605901e7 100644
>> --- a/hw/mips/fuloong2e=2Ec
>> +++ b/hw/mips/fuloong2e=2Ec
>> @@ -199,13 +199,13 @@ static void main_cpu_reset(void *opaque)
>> static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_=
irq intc,
>>                                        I2CBus **i2c_bus)
>> {
>> -    PCIDevice *dev;
>> +    PCIDevice *dev, *via;
>>=20
>> -    dev =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0=
), true,
>> +    via =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0=
), true,
>>                                           TYPE_VT82C686B_ISA);
>> -    qdev_connect_gpio_out(DEVICE(dev), 0, intc);
>> +    qdev_connect_gpio_out(DEVICE(via), 0, intc);
>>=20
>> -    dev =3D pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
>> +    dev =3D PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide=
"));
>>     pci_ide_create_devs(dev);
>>=20
>>     pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci"=
);
>> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
>> index 400511c6b7=2E=2E18565e966b 100644
>> --- a/hw/ppc/Kconfig
>> +++ b/hw/ppc/Kconfig
>> @@ -74,7 +74,6 @@ config PEGASOS2
>>     bool
>>     select MV64361
>>     select VT82C686
>> -    select IDE_VIA
>>     select SMBUS_EEPROM
>>     select VOF
>> # This should come with VT82C686
>> diff --git a/hw/ppc/pegasos2=2Ec b/hw/ppc/pegasos2=2Ec
>> index 61f4263953=2E=2E8bc528a560 100644
>> --- a/hw/ppc/pegasos2=2Ec
>> +++ b/hw/ppc/pegasos2=2Ec
>> @@ -102,7 +102,7 @@ static void pegasos2_init(MachineState *machine)
>>     CPUPPCState *env;
>>     MemoryRegion *rom =3D g_new(MemoryRegion, 1);
>>     PCIBus *pci_bus;
>> -    PCIDevice *dev;
>> +    PCIDevice *dev, *via;
>>     I2CBus *i2c_bus;
>>     const char *fwname =3D machine->firmware ?: PROM_FILENAME;
>>     char *filename;
>> @@ -160,13 +160,12 @@ static void pegasos2_init(MachineState *machine)
>>=20
>>     /* VIA VT8231 South Bridge (multifunction PCI device) */
>>     /* VT8231 function 0: PCI-to-ISA Bridge */
>> -    dev =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0),=
 true,
>> +    via =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0),=
 true,
>>                                           TYPE_VT8231_ISA);
>> -    qdev_connect_gpio_out(DEVICE(dev), 0,
>> +    qdev_connect_gpio_out(DEVICE(via), 0,
>>                           qdev_get_gpio_in_named(pm->mv, "gpp", 31));
>>=20
>> -    /* VT8231 function 1: IDE Controller */
>> -    dev =3D pci_create_simple(pci_bus, PCI_DEVFN(12, 1), "via-ide");
>> +    dev =3D PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide=
"));
>>     pci_ide_create_devs(dev);
>>=20
>>     /* VT8231 function 2-3: USB Ports */
>>=20

