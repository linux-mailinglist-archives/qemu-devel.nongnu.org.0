Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6976A1172
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:47:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVIUz-0003p0-67; Thu, 23 Feb 2023 15:47:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVIUc-0003W0-VL; Thu, 23 Feb 2023 15:47:07 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVIUY-0000Fx-89; Thu, 23 Feb 2023 15:47:06 -0500
Received: by mail-ed1-x52f.google.com with SMTP id i34so21635307eda.7;
 Thu, 23 Feb 2023 12:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xg0GejV053BpOcUjk7/GKdHi30Ry+KpEmlvw99i0YrM=;
 b=Saj5svU3/K/kdE/CUo9zFceBxggpmyz7GcSAHKGJWf5SUeq1yEbdcvq1zvxgR8XEW9
 F4X2+G65Xo/SpR7pMN3gKawhG/BmJTqCwI438gBpNcUQ288X2VXu+3aoGktbCjU8fX+n
 WRvEyZvb9ENHFbgezxoIcGUIP4Lw/sjqLMIcsFnnvehFiPEYZR1yiSb+fXiqKT/y6XXn
 pInvZYKpuYO7lK8aczOtaWhuOBMloJllwVn4Sy6k9bq9WreETVw+ptQLDFKRl/SPbrTo
 WUzxgMGa+G2ZY6HJE60w017krDtlvvUg35Jej+x4adu+uwgZQHSKocZA/wTH7IRppvd0
 T8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xg0GejV053BpOcUjk7/GKdHi30Ry+KpEmlvw99i0YrM=;
 b=lXmekj2TEbxHxUmrt6aC8f/47SImC0a/Xk831hYsjMvnObBBAqsirJhxFQih9lHQkG
 VOkY/JD2Dt8S8AB8z8lJ/BP9A+rqItg7GAN46agEIKjhlL3MkAAVadIqTEudRSlDvfRH
 Dll9jVHrhNF8Ji72uz1jcZ3zyWd1AimNg1yQ/9zZigZ+X56Gjxtd/XEcATbDCXKJGC8s
 tTocr3np0fImoAIM6j15YXxTPz2bmy6kGn6KxJkUCWvQLyWjsZnK2GhThGHJIArzuZO9
 +xxkhXhRbUCVYCloKLzckGXZVFvlgBHD6M5pQYunTu60SSXH83QPSv9oKLGjAV4U2qa8
 1vZg==
X-Gm-Message-State: AO0yUKUdwH1uqOHM2qmt52UV0pTwnHIkhJp7pxPJX4/7BDmvAXieehds
 KZQe/7Jz9JbxKLDjYrQpafs=
X-Google-Smtp-Source: AK7set9/n8xsS9NmaK8PR8JzwdQRRR1V/a/YkGw74BQE2g2jzOteX5CU+mtadZ8n33SvL9Es+ItSLA==
X-Received: by 2002:a17:906:818:b0:878:8249:bef6 with SMTP id
 e24-20020a170906081800b008788249bef6mr17372617ejd.59.1677185215316; 
 Thu, 23 Feb 2023 12:46:55 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf06ee0069bc6d590f31a9b0.dip0.t-ipconnect.de.
 [2003:fa:af06:ee00:69bc:6d59:f31:a9b0])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a170906234800b008ee95ccfe06sm986008eja.119.2023.02.23.12.46.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 12:46:54 -0800 (PST)
Date: Thu, 23 Feb 2023 20:46:49 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_07/10=5D_hw/ide/piix=3A_Require?=
 =?US-ASCII?Q?_an_ISABus_only_for_user-created_instances?=
In-Reply-To: <b38987d5-5530-ecd9-2fd2-3a57e1a611dd@ilande.co.uk>
References: <20230126211740.66874-1-shentey@gmail.com>
 <20230126211740.66874-8-shentey@gmail.com>
 <fb287888-c88c-60b1-20a4-1e50ddbf1daf@ilande.co.uk>
 <alpine.LMD.2.03.2302052308460.32269@eik.bme.hu>
 <935ae2a8-4327-53c6-1649-36698a00901d@ilande.co.uk>
 <00D45BF9-CA37-42FF-BDE1-F742B04F60F4@gmail.com>
 <b38987d5-5530-ecd9-2fd2-3a57e1a611dd@ilande.co.uk>
Message-ID: <89F8A77B-BB73-4A91-8A19-C022A1FEF720@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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



Am 7=2E Februar 2023 20:52:02 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ay=
land@ilande=2Eco=2Euk>:
>On 06/02/2023 23:40, Bernhard Beschow wrote:
>
>> Am 5=2E Februar 2023 22:32:03 UTC schrieb Mark Cave-Ayland <mark=2Ecave=
-ayland@ilande=2Eco=2Euk>:
>>> On 05/02/2023 22:21, BALATON Zoltan wrote:
>>>=20
>>>> On Sun, 5 Feb 2023, Mark Cave-Ayland wrote:
>>>>> On 26/01/2023 21:17, Bernhard Beschow wrote:
>>>>>> Internal instances now defer interrupt wiring to the caller which
>>>>>> decouples them from the ISABus=2E User-created devices still fish o=
ut the
>>>>>> ISABus from the QOM tree and the interrupt wiring remains in PIIX I=
DE=2E
>>>>>> The latter mechanism is considered a workaround and intended to be
>>>>>> removed once a deprecation period for user-created PIIX IDE devices=
 is
>>>>>> over=2E
>>>>>>=20
>>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>>>> ---
>>>>>>  =C2=A0 include/hw/ide/pci=2Eh |=C2=A0 1 +
>>>>>>  =C2=A0 hw/ide/piix=2Ec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
 64 ++++++++++++++++++++++++++++++++++----------
>>>>>>  =C2=A0 hw/isa/piix=2Ec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 5 ++++
>>>>>>  =C2=A0 3 files changed, 56 insertions(+), 14 deletions(-)
>>>>>>=20
>>>>>> diff --git a/include/hw/ide/pci=2Eh b/include/hw/ide/pci=2Eh
>>>>>> index 24c0b7a2dd=2E=2Eee2c8781b7 100644
>>>>>> --- a/include/hw/ide/pci=2Eh
>>>>>> +++ b/include/hw/ide/pci=2Eh
>>>>>> @@ -54,6 +54,7 @@ struct PCIIDEState {
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MemoryRegion bmdma_bar;
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MemoryRegion cmd_bar[2];
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MemoryRegion data_bar[2];
>>>>>> +=C2=A0=C2=A0=C2=A0 bool user_created;
>>>>>>  =C2=A0 };
>>>>>>  =C2=A0=C2=A0=C2=A0 static inline IDEState *bmdma_active_if(BMDMASt=
ate *bmdma)
>>>>>> diff --git a/hw/ide/piix=2Ec b/hw/ide/piix=2Ec
>>>>>> index 5980045db0=2E=2Ef0d95761ac 100644
>>>>>> --- a/hw/ide/piix=2Ec
>>>>>> +++ b/hw/ide/piix=2Ec
>>>>>> @@ -108,6 +108,13 @@ static void bmdma_setup_bar(PCIIDEState *d)
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>  =C2=A0 }
>>>>>>  =C2=A0 +static void piix_ide_set_irq(void *opaque, int n, int leve=
l)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 PCIIDEState *d =3D opaque;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 qemu_set_irq(d->isa_irqs[n], level);
>>>>>> +}
>>>>>> +
>>>>>>  =C2=A0 static void piix_ide_reset(DeviceState *dev)
>>>>>>  =C2=A0 {
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PCIIDEState *d =3D PCI_IDE(dev);
>>>>>> @@ -138,11 +145,18 @@ static void pci_piix_init_ports(PCIIDEState *=
d, ISABus *isa_bus)
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int i;
>>>>>>  =C2=A0 +=C2=A0=C2=A0=C2=A0 if (isa_bus) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d->isa_irqs[0] =3D isa_=
bus->irqs[port_info[0]=2Eisairq];
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d->isa_irqs[1] =3D isa_=
bus->irqs[port_info[1]=2Eisairq];
>>>>>> +=C2=A0=C2=A0=C2=A0 } else {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qdev_init_gpio_out(DEVI=
CE(d), d->isa_irqs, 2);
>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>> +
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < 2; i++) {
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ide_bus_ini=
t(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ide_init_io=
port(&d->bus[i], NULL, port_info[i]=2Eiobase,
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 port_info[i]=2Eiobase2);
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ide_init2(&d->bus[i], i=
sa_bus->irqs[port_info[i]=2Eisairq]);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ide_init2(&d->bus[i], q=
dev_get_gpio_in(DEVICE(d), i));
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 bmdma_init(&d->bus[i], &d->bmdma[i], d);
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d->bmdma[i]=
=2Ebus =3D &d->bus[i];
>>>>>> @@ -154,8 +168,7 @@ static void pci_piix_ide_realize(PCIDevice *dev=
, Error **errp)
>>>>>>  =C2=A0 {
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PCIIDEState *d =3D PCI_IDE(dev);
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t *pci_conf =3D dev->config;
>>>>>> -=C2=A0=C2=A0=C2=A0 ISABus *isa_bus;
>>>>>> -=C2=A0=C2=A0=C2=A0 bool ambiguous;
>>>>>> +=C2=A0=C2=A0=C2=A0 ISABus *isa_bus =3D NULL;
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_conf[PCI_CLASS_PROG=
] =3D 0x80; // legacy ATA mode
>>>>>>  =C2=A0 @@ -164,22 +177,36 @@ static void pci_piix_ide_realize(PCID=
evice *dev, Error **errp)
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmstate_register(VMSTAT=
E_IF(dev), 0, &vmstate_ide_pci, d);
>>>>>>  =C2=A0 -=C2=A0=C2=A0=C2=A0 isa_bus =3D ISA_BUS(object_resolve_path=
_type("", TYPE_ISA_BUS, &ambiguous));
>>>>>> -=C2=A0=C2=A0=C2=A0 if (ambiguous) {
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp,
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "More than one ISA bus found whi=
le %s supports only one",
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 object_get_typename(OBJECT(dev))=
);
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>>>> -=C2=A0=C2=A0=C2=A0 }
>>>>>> -=C2=A0=C2=A0=C2=A0 if (!isa_bus) {
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "No IS=
A bus found while %s requires one",
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 object_get_typename(OBJECT(dev))=
);
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>>>> +=C2=A0=C2=A0=C2=A0 if (d->user_created) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool ambiguous;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 isa_bus =3D ISA_BUS(obj=
ect_resolve_path_type("", TYPE_ISA_BUS,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 &ambiguous));
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ambiguous) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 error_setg(errp,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "More th=
an one ISA bus found while %s supports only one",
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 object_g=
et_typename(OBJECT(dev)));
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!isa_bus) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 error_setg(errp, "No ISA bus found while %s requires one",
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 object_g=
et_typename(OBJECT(dev)));
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_piix_init_ports(d, =
isa_bus);
>>>>>>  =C2=A0 }
>>>>>>  =C2=A0 +static void pci_piix_ide_init(Object *obj)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 DeviceState *dev =3D DEVICE(obj);
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 qdev_init_gpio_in(dev, piix_ide_set_irq, 2);
>>>>>> +}
>>>>>> +
>>>>>>  =C2=A0 static void pci_piix_ide_exitfn(PCIDevice *dev)
>>>>>>  =C2=A0 {
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PCIIDEState *d =3D PCI_IDE(dev);
>>>>>> @@ -191,6 +218,11 @@ static void pci_piix_ide_exitfn(PCIDevice *dev=
)
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>  =C2=A0 }
>>>>>>  =C2=A0 +static Property piix_ide_properties[] =3D {
>>>>>> +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL("user-created", PCIIDEState, u=
ser_created, true),
>>>>>> +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_END_OF_LIST(),
>>>>>> +};
>>>>>> +
>>>>>>  =C2=A0 /* NOTE: for the PIIX3, the IRQs and IOports are hardcoded =
*/
>>>>>>  =C2=A0 static void piix3_ide_class_init(ObjectClass *klass, void *=
data)
>>>>>>  =C2=A0 {
>>>>>> @@ -205,11 +237,13 @@ static void piix3_ide_class_init(ObjectClass =
*klass, void *data)
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 k->class_id =3D PCI_CLASS_STORAGE_I=
DE;
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_bit(DEVICE_CATEGORY_STORAGE, dc=
->categories);
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dc->hotpluggable =3D false;
>>>>>> +=C2=A0=C2=A0=C2=A0 device_class_set_props(dc, piix_ide_properties)=
;
>>>>>>  =C2=A0 }
>>>>>>  =C2=A0=C2=A0=C2=A0 static const TypeInfo piix3_ide_info =3D {
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =2Ename=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D TYPE_PIIX3_IDE,
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =2Eparent=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =3D TYPE_PCI_IDE,
>>>>>> +=C2=A0=C2=A0=C2=A0 =2Einstance_init =3D pci_piix_ide_init,
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =2Eclass_init=C2=A0=C2=A0=C2=A0 =3D=
 piix3_ide_class_init,
>>>>>>  =C2=A0 };
>>>>>>  =C2=A0 @@ -227,11 +261,13 @@ static void piix4_ide_class_init(Obje=
ctClass *klass, void *data)
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 k->class_id =3D PCI_CLASS_STORAGE_I=
DE;
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_bit(DEVICE_CATEGORY_STORAGE, dc=
->categories);
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dc->hotpluggable =3D false;
>>>>>> +=C2=A0=C2=A0=C2=A0 device_class_set_props(dc, piix_ide_properties)=
;
>>>>>>  =C2=A0 }
>>>>>>  =C2=A0=C2=A0=C2=A0 static const TypeInfo piix4_ide_info =3D {
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =2Ename=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D TYPE_PIIX4_IDE,
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =2Eparent=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =3D TYPE_PCI_IDE,
>>>>>> +=C2=A0=C2=A0=C2=A0 =2Einstance_init =3D pci_piix_ide_init,
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =2Eclass_init=C2=A0=C2=A0=C2=A0 =3D=
 piix4_ide_class_init,
>>>>>>  =C2=A0 };
>>>>>>  =C2=A0 diff --git a/hw/isa/piix=2Ec b/hw/isa/piix=2Ec
>>>>>> index 54a1246a9d=2E=2Ef9974c2a77 100644
>>>>>> --- a/hw/isa/piix=2Ec
>>>>>> +++ b/hw/isa/piix=2Ec
>>>>>> @@ -345,9 +345,14 @@ static void pci_piix_realize(PCIDevice *dev, c=
onst char *uhci_type,
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* IDE */
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qdev_prop_set_int32(DEVICE(&d->ide)=
, "addr", dev->devfn + 1);
>>>>>> +=C2=A0=C2=A0=C2=A0 qdev_prop_set_bit(DEVICE(&d->ide), "user-create=
d", false);
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!qdev_realize(DEVICE(&d->ide), =
BUS(pci_bus), errp)) {
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>> +=C2=A0=C2=A0=C2=A0 qdev_connect_gpio_out(DEVICE(&d->ide), 0,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 qdev_get_gpio_in(DEVICE(&d->pic), 14));
>>>>>> +=C2=A0=C2=A0=C2=A0 qdev_connect_gpio_out(DEVICE(&d->ide), 1,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 qdev_get_gpio_in(DEVICE(&d->pic), 15));
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* USB */
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (d->has_usb) {
>>>>>=20
>>>>> I haven't checked the datasheet, but I suspect this will be similar =
to the cmd646/via PCI-IDE interfaces in that there will be a PCI configurat=
ion register that will switch between ISA compatibility mode (and ISA irqs)=
 and PCI mode (with PCI IRQs)=2E So it would be the device configuration th=
at would specify PCI or ISA mode, rather than the presence of an ISABus=2E
>>>>=20
>>>> I forgot about this topic already and haven't follwed this series eit=
her so what I say may not fully make sense but I think CMD646 and via-ide a=
re different=2E CMD646 is a PCI device and should use PCI interrupts while =
via-ide is part of a southbridge/superio complex and connected to the ISA P=
ICs within that southbride, so I think via-ide always uses ISA IRQs and the=
 ISA btidge within the same chip may convert that to PCI IRQs or not (that =
part is where I'm lost also because we may not actually model it that way)=
=2E After a long debate we managed to find a solution back then that works =
for every guest we use it for now so I think we don't want to touch it now =
until some real need arises=2E It does not worth the trouble and added comp=
lexity to model something that is not used just for the sake of correctness=
=2E By the time we find a use for that, the ISA emulation may evolve so it'=
s easier to implement the missing switching between isa and native mode or =
we may want to do it differently (such as we do things differently now comp=
ared to what we did years ago)=2E So I think it does not worth keeping the =
ISA model from being simplified for some theoretical uses in the future whi=
ch we may not actually do any time soon=2E But I don't want to get into thi=
s again so just shared my thoughts and feel free to ignore it=2E I don't ca=
re where these patches go as long as the VIA model keeps working for me=2E
>>>=20
>>> I have a vague memory that ISA compatibility mode was part of the orig=
inal PCI-BMDMA specification, but it has been a while since I last looked=
=2E
>>>=20
>>> Bernhard, is there any mention of this in the PIIX datasheet(s)? For r=
eference the cmd646 datasheet specifies that ISA mode or PCI mode is determ=
ined by register PROG_IF (0x9) in PCI configuration space=2E
>>=20
>> I've found the following:
>>=20
>>    "Only PCI masters have access to the IDE port=2E ISA Bus masters can=
not access the IDE I/O port addresses=2E Memory targeted by the IDE interfa=
ce acting as a PCI Bus master on behalf of IDE DMA slaves must reside on PC=
I, usually main memory implemented by the host-to-PCI bridge=2E"
>>=20
>> And:
>>=20
>>    "PIIX4 can act as a PCI Bus master on behalf of an IDE slave device=
=2E"
>>=20
>> Does this perhaps mean that piix-ide does indeed have no ISA bus?
>
>I'd be amazed if that were the case: certainly when the first motherboard=
s came out with PCI and ISA slots, I'd expect the IDE legacy mode to be ena=
bled by default since BIOSes and OSs such as DOS wouldn't have been PCI awa=
re and would access the ISA ioports directly=2E From memory the OF PCI spec=
ification has mention of workarounds such as mapping the old VGA memory to =
PCI MMIO space for compatibility reasons, so I'd be surprised if there wasn=
't something similar for IDE=2E
>
>The wording above is a bit ambiguous because I can see the above statemen=
ts would be true if the PCI-IDE device were already switched to PCI mode, a=
nd what we're looking for is whether a switch between the two is supported =
or possible=2E

A switch is definitely impossible: The PIIX IDE function has the 0x3c (int=
errupt line) and 0x3d (interrupt pin) registers reserved=2E It's fixed in l=
egacy mode (prog-if is 0x80)=2E

Best regards,
Bernhard

>
>The cmd646 datasheet section 1=2E4 has a fleeting mention of a document c=
alled "PCI IDE Controller Specification Revision 1=2E0" which if you can fi=
nd it, may provide more information as to whether this ability is specific =
to the cmd646 or whether it is also relevant to generic PCI-IDE controllers=
 such as the PIIX series too=2E
>
>
>ATB,
>
>Mark=2E

