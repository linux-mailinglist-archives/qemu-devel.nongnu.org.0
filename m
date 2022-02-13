Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C984B3BD7
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 15:36:15 +0100 (CET)
Received: from localhost ([::1]:59846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJFz4-0003GM-G7
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 09:36:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nJFxB-00027D-Gp
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 09:34:18 -0500
Received: from [2a00:1450:4864:20::531] (port=33530
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nJFx8-0005LR-Sy
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 09:34:17 -0500
Received: by mail-ed1-x531.google.com with SMTP id b13so23605077edn.0
 for <qemu-devel@nongnu.org>; Sun, 13 Feb 2022 06:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=jOCMi7TSLpSiD5lMTbgM5FMSs6aYHtRw9NEQYW2twmg=;
 b=GKAc0cpgdxNHbFNGWVZs1Hgqhd3TkSxKG+LvTBXsL5+MbhA3wucZXEXNyuu4rPHxor
 TOoCaEfBlARFLvZuoxk3yK5go/8aJDZpDJ3idlodYYGtXMBvIuBdkl2TROg9bFuWOf+x
 hXyRyk72Wu6kkYvnVcbFSUGeaipCVlg5e9ir7fCMOf3/IZA6scCyOnvSMvb9cBzr5PZm
 7NMDnVO/TUE/GBPgwDMAj0WdaJAUaP12AixrOiwLGamMlZJugKtAVQcnPKsi7SC2+FwE
 kg1sTWPi8Yv4QtNhYepwUbpUR3vyKY25rSh4X5+mNv/rF4+7cYLHoi1O8X3SGZtiukK8
 mSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=jOCMi7TSLpSiD5lMTbgM5FMSs6aYHtRw9NEQYW2twmg=;
 b=J7GKBCtZGSW7R5adIroes04pxx+U0BJtLwmBkRp8FHWZjGl2ZksNjZPYKPgH7vFqJo
 a62i8vwerbnsWEFSnvsI0VQCXqiGWkfZz7oWNq1lgHH3F+1Uetx6+HzJdRufKtfyOiYa
 C6vZLlVRB1gkfCyls8O3L/d/qX3yc28g+aChPPvLpvmsdt+M/QooNCrpZQRFA+IjuJBe
 2cEdCC5wjbHarzUeDGo4G0rH4jnR8mQr3zscox+LwhIkIetUV0cSMxvbXXydSznc1deS
 ei1ssFSOWpE3AeBPIHlosb8kipJUzg6kCqEbPclJ8grflmKWnq4m8v0tX/UsvzEmCmuQ
 CxMw==
X-Gm-Message-State: AOAM5314pYsu85oD63ojMk8/IqSBKT9Bw9aRBa8GAyOEgPAM8m3Wlm1p
 wIIdHf9QjP2ylb7na+fSThc=
X-Google-Smtp-Source: ABdhPJxcsB5d4ved11uWTt/TOtJmjI9VfjNGzfdlYS1I2u/zfGG/ob628lg/4uL4ccMVXvDKcLIt6A==
X-Received: by 2002:a05:6402:d4f:: with SMTP id
 ec15mr5567961edb.339.1644762853328; 
 Sun, 13 Feb 2022 06:34:13 -0800 (PST)
Received: from ?IPv6:::1?
 (200116b8463dcc00452af80a311a73da.dip.versatel-1u1.de.
 [2001:16b8:463d:cc00:452a:f80a:311a:73da])
 by smtp.gmail.com with ESMTPSA id er9sm9217577edb.77.2022.02.13.06.34.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 13 Feb 2022 06:34:12 -0800 (PST)
Date: Sun, 13 Feb 2022 15:34:07 +0100
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/5=5D_malta=3A_Move_PCI_in?=
 =?US-ASCII?Q?terrupt_handling_from_gt64xxx_to_piix4?=
User-Agent: K-9 Mail for Android
In-Reply-To: <1cc1d1-8159-364b-612f-483db0ca1435@eik.bme.hu>
References: <20220212113519.69527-1-shentey@gmail.com>
 <20220212113519.69527-2-shentey@gmail.com>
 <1cc1d1-8159-364b-612f-483db0ca1435@eik.bme.hu>
Message-ID: <63C2D56C-058A-4CAB-AC0C-F42AC049870A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
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

Am 12=2E Februar 2022 14:18:54 MEZ schrieb BALATON Zoltan <balaton@eik=2Ebm=
e=2Ehu>:
>On Sat, 12 Feb 2022, Bernhard Beschow wrote:
>> Handling PCI interrupts in piix4 increases cohesion and reduces differe=
nces
>> between piix4 and piix3=2E
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>
>Sorry for being late in commenting, I've missed the first round=2E Apolog=
ies=20
>if this causes a delay or another version=2E

Don't worry=2E Your comments are appreciated!

>> ---
>> hw/isa/piix4=2Ec         | 58 +++++++++++++++++++++++++++++++++++++++
>> hw/mips/gt64xxx_pci=2Ec  | 62 ++++-------------------------------------=
-
>> hw/mips/malta=2Ec        |  6 +---
>> include/hw/mips/mips=2Eh |  2 +-
>> 4 files changed, 65 insertions(+), 63 deletions(-)
>>
>> diff --git a/hw/isa/piix4=2Ec b/hw/isa/piix4=2Ec
>> index 0fe7b69bc4=2E=2E5a86308689 100644
>> --- a/hw/isa/piix4=2Ec
>> +++ b/hw/isa/piix4=2Ec
>> @@ -45,6 +45,7 @@ struct PIIX4State {
>>     PCIDevice dev;
>>     qemu_irq cpu_intr;
>>     qemu_irq *isa;
>> +    qemu_irq i8259[ISA_NUM_IRQS];
>>
>>     RTCState rtc;
>>     /* Reset Control Register */
>> @@ -54,6 +55,30 @@ struct PIIX4State {
>>
>> OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
>>
>> +static int pci_irq_levels[4];
>> +
>> +static void piix4_set_irq(void *opaque, int irq_num, int level)
>> +{
>> +    int i, pic_irq, pic_level;
>> +    qemu_irq *pic =3D opaque;
>> +
>> +    pci_irq_levels[irq_num] =3D level;
>> +
>> +    /* now we change the pic irq level according to the piix irq mappi=
ngs */
>> +    /* XXX: optimize */
>> +    pic_irq =3D piix4_dev->config[PIIX_PIRQCA + irq_num];
>> +    if (pic_irq < 16) {
>> +        /* The pic level is the logical OR of all the PCI irqs mapped =
to it=2E */
>> +        pic_level =3D 0;
>> +        for (i =3D 0; i < 4; i++) {
>> +            if (pic_irq =3D=3D piix4_dev->config[PIIX_PIRQCA + i]) {
>> +                pic_level |=3D pci_irq_levels[i];
>> +            }
>> +        }
>> +        qemu_set_irq(pic[pic_irq], pic_level);
>> +    }
>> +}
>> +
>> static void piix4_isa_reset(DeviceState *dev)
>> {
>>     PIIX4State *d =3D PIIX4_PCI_DEVICE(dev);
>> @@ -248,8 +273,34 @@ static void piix4_register_types(void)
>>
>> type_init(piix4_register_types)
>>
>> +static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
>> +{
>> +    int slot;
>> +
>> +    slot =3D PCI_SLOT(pci_dev->devfn);
>> +
>> +    switch (slot) {
>> +    /* PIIX4 USB */
>> +    case 10:
>> +        return 3;
>> +    /* AMD 79C973 Ethernet */
>> +    case 11:
>> +        return 1;
>> +    /* Crystal 4281 Sound */
>> +    case 12:
>> +        return 2;
>> +    /* PCI slot 1 to 4 */
>> +    case 18 =2E=2E=2E 21:
>> +        return ((slot - 18) + irq_num) & 0x03;
>> +    /* Unknown device, don't do any translation */
>> +    default:
>> +        return irq_num;
>> +    }
>> +}
>> +
>> DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **s=
mbus)
>> {
>> +    PIIX4State *s;
>>     PCIDevice *pci;
>>     DeviceState *dev;
>>     int devfn =3D PCI_DEVFN(10, 0);
>> @@ -257,6 +308,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus *=
*isa_bus, I2CBus **smbus)
>>     pci =3D pci_create_simple_multifunction(pci_bus, devfn,  true,
>>                                           TYPE_PIIX4_PCI_DEVICE);
>>     dev =3D DEVICE(pci);
>> +    s =3D PIIX4_PCI_DEVICE(pci);
>>     if (isa_bus) {
>>         *isa_bus =3D ISA_BUS(qdev_get_child_bus(dev, "isa=2E0"));
>>     }
>> @@ -271,5 +323,11 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus =
**isa_bus, I2CBus **smbus)
>>                                NULL, 0, NULL);
>>     }
>>
>> +    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s->i8259, =
4);
>> +
>> +    for (int i =3D 0; i < ISA_NUM_IRQS; i++) {
>> +        s->i8259[i] =3D qdev_get_gpio_in_named(dev, "isa", i);
>> +    }
>> +
>>     return dev;
>> }
>> diff --git a/hw/mips/gt64xxx_pci=2Ec b/hw/mips/gt64xxx_pci=2Ec
>> index c7480bd019=2E=2E9e23e32eff 100644
>> --- a/hw/mips/gt64xxx_pci=2Ec
>> +++ b/hw/mips/gt64xxx_pci=2Ec
>> @@ -981,56 +981,6 @@ static const MemoryRegionOps isd_mem_ops =3D {
>>     },
>> };
>>
>> -static int gt64120_pci_map_irq(PCIDevice *pci_dev, int irq_num)
>> -{
>> -    int slot;
>> -
>> -    slot =3D PCI_SLOT(pci_dev->devfn);
>> -
>> -    switch (slot) {
>> -    /* PIIX4 USB */
>> -    case 10:
>> -        return 3;
>> -    /* AMD 79C973 Ethernet */
>> -    case 11:
>> -        return 1;
>> -    /* Crystal 4281 Sound */
>> -    case 12:
>> -        return 2;
>> -    /* PCI slot 1 to 4 */
>> -    case 18 =2E=2E=2E 21:
>> -        return ((slot - 18) + irq_num) & 0x03;
>> -    /* Unknown device, don't do any translation */
>> -    default:
>> -        return irq_num;
>> -    }
>> -}
>> -
>> -static int pci_irq_levels[4];
>> -
>> -static void gt64120_pci_set_irq(void *opaque, int irq_num, int level)
>> -{
>> -    int i, pic_irq, pic_level;
>> -    qemu_irq *pic =3D opaque;
>> -
>> -    pci_irq_levels[irq_num] =3D level;
>> -
>> -    /* now we change the pic irq level according to the piix irq mappi=
ngs */
>> -    /* XXX: optimize */
>> -    pic_irq =3D piix4_dev->config[PIIX_PIRQCA + irq_num];
>> -    if (pic_irq < 16) {
>> -        /* The pic level is the logical OR of all the PCI irqs mapped =
to it=2E */
>> -        pic_level =3D 0;
>> -        for (i =3D 0; i < 4; i++) {
>> -            if (pic_irq =3D=3D piix4_dev->config[PIIX_PIRQCA + i]) {
>> -                pic_level |=3D pci_irq_levels[i];
>> -            }
>> -        }
>> -        qemu_set_irq(pic[pic_irq], pic_level);
>> -    }
>> -}
>> -
>> -
>> static void gt64120_reset(DeviceState *dev)
>> {
>>     GT64120State *s =3D GT64120_PCI_HOST_BRIDGE(dev);
>> @@ -1207,7 +1157,7 @@ static void gt64120_realize(DeviceState *dev, Err=
or **errp)
>>                           "gt64120-isd", 0x1000);
>> }
>>
>> -PCIBus *gt64120_register(qemu_irq *pic)
>> +PCIBus *gt64120_register(void)
>> {
>>     GT64120State *d;
>>     PCIHostState *phb;
>> @@ -1218,12 +1168,10 @@ PCIBus *gt64120_register(qemu_irq *pic)
>>     phb =3D PCI_HOST_BRIDGE(dev);
>>     memory_region_init(&d->pci0_mem, OBJECT(dev), "pci0-mem", 4 * GiB);
>>     address_space_init(&d->pci0_mem_as, &d->pci0_mem, "pci0-mem");
>> -    phb->bus =3D pci_register_root_bus(dev, "pci",
>> -                                     gt64120_pci_set_irq, gt64120_pci_=
map_irq,
>> -                                     pic,
>> -                                     &d->pci0_mem,
>> -                                     get_system_io(),
>> -                                     PCI_DEVFN(18, 0), 4, TYPE_PCI_BUS=
);
>> +    phb->bus =3D pci_root_bus_new(dev, "pci",
>> +                                &d->pci0_mem,
>> +                                get_system_io(),
>> +                                PCI_DEVFN(18, 0), TYPE_PCI_BUS);
>>     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>
>>     pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "gt64120_pci");
>> diff --git a/hw/mips/malta=2Ec b/hw/mips/malta=2Ec
>> index b770b8d367=2E=2E13254dbc89 100644
>> --- a/hw/mips/malta=2Ec
>> +++ b/hw/mips/malta=2Ec
>> @@ -97,7 +97,6 @@ struct MaltaState {
>>
>>     Clock *cpuclk;
>>     MIPSCPSState cps;
>> -    qemu_irq i8259[ISA_NUM_IRQS];
>> };
>>
>> static struct _loaderparams {
>> @@ -1391,7 +1390,7 @@ void mips_malta_init(MachineState *machine)
>>     stl_p(memory_region_get_ram_ptr(bios_copy) + 0x10, 0x00000420);
>>
>>     /* Northbridge */
>> -    pci_bus =3D gt64120_register(s->i8259);
>> +    pci_bus =3D gt64120_register();
>>     /*
>>      * The whole address space decoded by the GT-64120A doesn't generat=
e
>>      * exception when accessing invalid memory=2E Create an empty slot =
to
>> @@ -1404,9 +1403,6 @@ void mips_malta_init(MachineState *machine)
>>
>>     /* Interrupt controller */
>>     qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
>> -    for (int i =3D 0; i < ISA_NUM_IRQS; i++) {
>> -        s->i8259[i] =3D qdev_get_gpio_in_named(dev, "isa", i);
>> -    }
>>
>>     /* generate SPD EEPROM data */
>>     generate_eeprom_spd(&smbus_eeprom_buf[0 * 256], ram_size);
>> diff --git a/include/hw/mips/mips=2Eh b/include/hw/mips/mips=2Eh
>> index 6c9c8805f3=2E=2Eff88942e63 100644
>> --- a/include/hw/mips/mips=2Eh
>> +++ b/include/hw/mips/mips=2Eh
>> @@ -10,7 +10,7 @@
>> #include "exec/memory=2Eh"
>>
>> /* gt64xxx=2Ec */
>> -PCIBus *gt64120_register(qemu_irq *pic);
>> +PCIBus *gt64120_register(void);
>
>Now that you don't need to pass anything to it, do you still need this=20
>function? Maybe what it does now could be done in the gt64120 device's=20
>realize functions (there seems to be at least two: gt64120_realize and=20
>gt64120_pci_realize but haven't checked which is more appropriate to put=
=20
>this init in) or in an init function then you can just create the gt64120=
=20
>device in malta=2Ec with qdev_new as is more usual to do in other boards=
=2E=20
>This register function looks like the legacy init functions we're trying=
=20
>to get rid of so this seems to be an opportunity to clean this up=2E This=
=20
>could be done in a separate follow up though so may not need to be part o=
f=20
>this series but may be nice to have=2E

I'll give it a shot (see my other mail)=2E

Regards,
Bernhard

>Regards,=2E
>BALATON Zoltan
>
>>
>> /* bonito=2Ec */
>> PCIBus *bonito_init(qemu_irq *pic);
>>

