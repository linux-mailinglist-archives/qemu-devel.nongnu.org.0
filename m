Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9942E5A80BF
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 16:57:19 +0200 (CEST)
Received: from localhost ([::1]:40066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTP9a-00058F-Lr
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 10:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTP3Z-0007TY-Fe; Wed, 31 Aug 2022 10:51:07 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:41870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTP3X-0000AK-KX; Wed, 31 Aug 2022 10:51:05 -0400
Received: by mail-ed1-x530.google.com with SMTP id r4so18707953edi.8;
 Wed, 31 Aug 2022 07:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc;
 bh=XvaGGmn/O0YwI8Z4jYx/XecuYrlby8QTtEfKouYfOiA=;
 b=MWCvDbTvD1PAm/hMOIdOvXU284wCte1OKOAELrfRYAoyNF0oNhwHOL4+WiZ4+msiCj
 9q5hlwY9OhQptz3UN6k7EBLlzhpuZ1UFyNAhyrWNUvxQFkKxQQqgmbD/wiDuizSObwFS
 gEbl7F2VQ3v15Ri9g/ACFpKv6q2DaByjF+/OEQ0OiDBolXaCdRSusD/oJ6rS3ns4Qhv2
 khlTmfTiaGNXtYIs0DlgVNv0NPW/GrLaMTA5YkU2FL6PCMjGkwuxU7lFtVeiDMnJQv2V
 gTIjGBsLn541wnIHN/ZrrV03svWrdekSjPROKreT/tOX4j4mH3AjQejh8MpNuWqOJ3vE
 4IGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc;
 bh=XvaGGmn/O0YwI8Z4jYx/XecuYrlby8QTtEfKouYfOiA=;
 b=QlFwRJG7AjBqMYWj0mcRtprJm1RiSuH7X22ei7kY0NnRNGfcza07RivmWqdf2tJXRe
 0YrIU6p7hNs7RyNlLgrkpWwyC5XevXAvVJAyOAbLxjoKngL2MZ/5Y/GEMewgLXMkzUgS
 oqkyYyeLtEdP8I8UPUdsqigod67wJsYkkPkqD8zy2s55aJuuf4eOMqg+VVwCgPArFYgP
 2wcPYhWJz3YYqo2vjo2/g5DEtUp7CyNqFkRw6eqQVZfLArFrqKT/roLrRO2ak0c9BFZZ
 +3S2p/5/svGQ02sleXLVPNYuosGfe9uK7nRY58D015ul6b0IrWzsWtpyvZncIbH//LXa
 XS0A==
X-Gm-Message-State: ACgBeo3H6b+AWlCEpiZepi13pJWu7n4fNy13S0GBIxNPK8zMl+cjS5ss
 0iz8HTrTGSKU2qwXX3AzGqJiQ8z36Y8=
X-Google-Smtp-Source: AA6agR7mUekfgf325n9xJGmNKDwnLbRWIbGvfD8+lJUxUINtJBnO15QSjrsSXkm6AE5YU2AeOpFoVw==
X-Received: by 2002:a05:6402:2949:b0:445:dc8d:44d with SMTP id
 ed9-20020a056402294900b00445dc8d044dmr25222275edb.60.1661957461052; 
 Wed, 31 Aug 2022 07:51:01 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb200a5066d0f8b32ea85.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:a506:6d0f:8b32:ea85])
 by smtp.gmail.com with ESMTPSA id
 fh10-20020a1709073a8a00b007307d099ed7sm7127454ejc.121.2022.08.31.07.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 07:51:00 -0700 (PDT)
Date: Wed, 31 Aug 2022 16:50:57 +0200
From: BB <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_08/10=5D_hw/isa/vt82c686=3A_Instan?=
 =?US-ASCII?Q?tiate_AC97_and_MC97_functions_in_host_device?=
User-Agent: K-9 Mail for Android
In-Reply-To: <7e52791-f51d-9d5e-51b9-1bab67c58027@eik.bme.hu>
References: <20220831095914.2041-1-shentey@gmail.com>
 <20220831095914.2041-9-shentey@gmail.com>
 <7e52791-f51d-9d5e-51b9-1bab67c58027@eik.bme.hu>
Message-ID: <04A3C565-7278-423F-844A-C5EA95FB8A00@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
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



Am 31=2E August 2022 15:24:28 MESZ schrieb BALATON Zoltan <balaton@eik=2Eb=
me=2Ehu>:
>On Wed, 31 Aug 2022, Bernhard Beschow wrote:
>> The AC97 function's wakeup status is wired to the PM function and both
>> the AC97 and MC97 interrupt routing is determined by the ISA function=
=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>> hw/isa/vt82c686=2Ec   | 16 ++++++++++++++++
>> hw/mips/fuloong2e=2Ec |  4 ----
>> hw/ppc/pegasos2=2Ec   |  5 -----
>> 3 files changed, 16 insertions(+), 9 deletions(-)
>>=20
>> diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>> index fcc9894e8b=2E=2E691a467b2c 100644
>> --- a/hw/isa/vt82c686=2Ec
>> +++ b/hw/isa/vt82c686=2Ec
>> @@ -553,6 +553,8 @@ struct ViaISAState {
>>     PCIIDEState ide;
>>     UHCIState uhci[2];
>>     ViaPMState pm;
>> +    PCIDevice ac97;
>> +    PCIDevice mc97;
>> };
>>=20
>> static const VMStateDescription vmstate_via =3D {
>> @@ -572,6 +574,8 @@ static void via_isa_init(Object *obj)
>>     object_initialize_child(obj, "ide", &s->ide, "via-ide");
>>     object_initialize_child(obj, "uhci1", &s->uhci[0], "vt82c686b-usb-u=
hci");
>>     object_initialize_child(obj, "uhci2", &s->uhci[1], "vt82c686b-usb-u=
hci");
>> +    object_initialize_child(obj, "ac97", &s->ac97, TYPE_VIA_AC97);
>> +    object_initialize_child(obj, "mc97", &s->mc97, TYPE_VIA_MC97);
>> }
>>=20
>> static const TypeInfo via_isa_info =3D {
>> @@ -652,6 +656,18 @@ static void via_isa_realize(PCIDevice *d, Error **=
errp)
>>     if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
>>         return;
>>     }
>> +
>> +    /* Function 5: AC97 Audio */
>> +    qdev_prop_set_int32(DEVICE(&s->ac97), "addr", d->devfn + 5);
>> +    if (!qdev_realize(DEVICE(&s->ac97), BUS(pci_bus), errp)) {
>> +        return;
>> +    }
>> +
>> +    /* Function 6: AC97 Modem */
>
>Is this MC97 Modem instead?

Yeah, MC97 Modem=2E I''ll send a v4=2E

Regards,
Bernhard
>
>Regards,
>BALATON Zoltan
>
>> +    qdev_prop_set_int32(DEVICE(&s->mc97), "addr", d->devfn + 6);
>> +    if (!qdev_realize(DEVICE(&s->mc97), BUS(pci_bus), errp)) {
>> +        return;
>> +    }
>> }
>>=20
>> /* TYPE_VT82C686B_ISA */
>> diff --git a/hw/mips/fuloong2e=2Ec b/hw/mips/fuloong2e=2Ec
>> index 377108d313=2E=2E2d8723ab74 100644
>> --- a/hw/mips/fuloong2e=2Ec
>> +++ b/hw/mips/fuloong2e=2Ec
>> @@ -210,10 +210,6 @@ static void vt82c686b_southbridge_init(PCIBus *pci=
_bus, int slot, qemu_irq intc,
>>=20
>>     dev =3D PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm")=
);
>>     *i2c_bus =3D I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
>> -
>> -    /* Audio support */
>> -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 5), TYPE_VIA_AC97);
>> -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 6), TYPE_VIA_MC97);
>> }
>>=20
>> /* Network support */
>> diff --git a/hw/ppc/pegasos2=2Ec b/hw/ppc/pegasos2=2Ec
>> index e32944ee2b=2E=2E09fdb7557f 100644
>> --- a/hw/ppc/pegasos2=2Ec
>> +++ b/hw/ppc/pegasos2=2Ec
>> @@ -159,7 +159,6 @@ static void pegasos2_init(MachineState *machine)
>>     pci_bus =3D mv64361_get_pci_bus(pm->mv, 1);
>>=20
>>     /* VIA VT8231 South Bridge (multifunction PCI device) */
>> -    /* VT8231 function 0: PCI-to-ISA Bridge */
>>     via =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), =
true,
>>                                           TYPE_VT8231_ISA);
>>     qdev_connect_gpio_out(DEVICE(via), 0,
>> @@ -173,10 +172,6 @@ static void pegasos2_init(MachineState *machine)
>>     spd_data =3D spd_data_generate(DDR, machine->ram_size);
>>     smbus_eeprom_init_one(i2c_bus, 0x57, spd_data);
>>=20
>> -    /* VT8231 function 5-6: AC97 Audio & Modem */
>> -    pci_create_simple(pci_bus, PCI_DEVFN(12, 5), TYPE_VIA_AC97);
>> -    pci_create_simple(pci_bus, PCI_DEVFN(12, 6), TYPE_VIA_MC97);
>> -
>>     /* other PC hardware */
>>     pci_vga_init(pci_bus);
>>=20
>>=20

