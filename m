Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AA36A768A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 23:02:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXUWT-00023c-0G; Wed, 01 Mar 2023 17:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pXUWO-00021u-Ot; Wed, 01 Mar 2023 17:02:01 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pXUWM-0007qv-O6; Wed, 01 Mar 2023 17:02:00 -0500
Received: by mail-ed1-x52e.google.com with SMTP id o12so59846947edb.9;
 Wed, 01 Mar 2023 14:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677708117;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O7ipDq6ukP2lzPWqK3rFXfGGedHHMFR94i8oc5jpVmA=;
 b=G2QkIsXnInDKcIP5caLOq7LWvlFJqBsFjgGZ1bos3fmXgha/GiYt2ZGuQqzZt8v3Yl
 7HxcYWVlljTxkpjKrLPqiROQVnfH7B4H7HLHi2ny9A0lHKBvc5NU3GyKVoCbVrn+NM+e
 CY+HDKbcMKxwkZQunabKX6eljgLQU7H9jUoMk+P4lHatQp4eccLnV9CIyFaCRL703R8g
 0NY/b4GxBACP07/Us9LdAwropfwsvDOPAFs1D/AiEJovMnR3qorHM15pSe2N27JI/tr5
 lWPoax3CPbOzG1SxLlzj38IW2PNiVp53A3SzbOMOJukyFr0SRozRj8c8EIh3YjWWT+1G
 spow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677708117;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O7ipDq6ukP2lzPWqK3rFXfGGedHHMFR94i8oc5jpVmA=;
 b=5/FfVY9ed9OHqKZ5SariMHiS4R4IJyNIbZqWfH4nHRLKelmlXPLz0Fq9zt3EJYHAO5
 aJm5HNpdqul6ZTKM8medPWK6USsYQzBLWeFBIBpVwIFL0dCbHW714V0tQ3fpkgGAr1o1
 D3oC5pNbrcxOFkmODo+LzjtPd3XUgQZW/oGIcgw75jUGPiaAF3AtW57xDpLupw4U+W3B
 7bIeE3IELrifjm6+ro5/s7MjlGM0JEO+RYx3uaqsJs+cqc4D447jqWY1zxyJwWDb1ZvE
 CRClPl9bHoUOVf+R7uht4FroCb/PG55ut1jB/vcBxaq8myekTObPiII+cUfcDL44h4hy
 p7LQ==
X-Gm-Message-State: AO0yUKV7w+kU9+kHGZt7K0+/FGW1NEiJUgvKU1Lr+30gGv815cFnOEQC
 xpGGQ1SrRq4y1CfJ4mrONuQ=
X-Google-Smtp-Source: AK7set92Cbv93xHHzKfeVHx/zhTqUTv9In7Pj4u0/ZFyTerDtrEPfGSBL74aERPsgWOTJMzYMxZQUw==
X-Received: by 2002:a05:6402:2301:b0:4ac:dac1:3f95 with SMTP id
 l1-20020a056402230100b004acdac13f95mr8179057eda.1.1677708116645; 
 Wed, 01 Mar 2023 14:01:56 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-188-068-061.77.188.pool.telefonica.de.
 [77.188.68.61]) by smtp.gmail.com with ESMTPSA id
 n28-20020a50935c000000b004bc15a440f1sm1326343eda.78.2023.03.01.14.01.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 14:01:56 -0800 (PST)
Date: Wed, 01 Mar 2023 22:01:52 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 2/5] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <72f52a39-ecce-d17e-5161-5937076955ec@ilande.co.uk>
References: <20230223202053.117050-1-shentey@gmail.com>
 <20230223202053.117050-3-shentey@gmail.com>
 <72f52a39-ecce-d17e-5161-5937076955ec@ilande.co.uk>
Message-ID: <E94EEC4B-495C-4C7D-8B1E-22FD92E05382@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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



Am 1=2E M=C3=A4rz 2023 14:20:54 UTC schrieb Mark Cave-Ayland <mark=2Ecave-=
ayland@ilande=2Eco=2Euk>:
>On 23/02/2023 20:20, Bernhard Beschow wrote:
>
>> The real VIA south bridges implement a PCI IRQ router which is configur=
ed
>> by the BIOS or the OS=2E In order to respect these configurations, QEMU
>> needs to implement it as well=2E
>>=20
>> Note: The implementation was taken from piix4_set_irq() in hw/isa/piix4=
=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   hw/isa/vt82c686=2Ec | 44 ++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>=20
>> diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>> index 3f9bd0c04d=2E=2Ef24e387d63 100644
>> --- a/hw/isa/vt82c686=2Ec
>> +++ b/hw/isa/vt82c686=2Ec
>> @@ -604,6 +604,48 @@ static void via_isa_request_i8259_irq(void *opaque=
, int irq, int level)
>>       qemu_set_irq(s->cpu_intr, level);
>>   }
>>   +static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
>> +{
>> +    switch (irq_num) {
>> +    case 0:
>> +        return s->dev=2Econfig[0x55] >> 4;
>> +
>> +    case 1:
>> +        return s->dev=2Econfig[0x56] & 0xf;
>> +
>> +    case 2:
>> +        return s->dev=2Econfig[0x56] >> 4;
>> +
>> +    case 3:
>> +        return s->dev=2Econfig[0x57] >> 4;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void via_isa_set_pci_irq(void *opaque, int irq_num, int level)
>> +{
>> +    ViaISAState *s =3D opaque;
>> +    PCIBus *bus =3D pci_get_bus(&s->dev);
>> +    int pic_irq;
>> +
>> +    /* now we change the pic irq level according to the via irq mappin=
gs */
>> +    /* XXX: optimize */
>> +    pic_irq =3D via_isa_get_pci_irq(s, irq_num);
>> +    if (pic_irq < ISA_NUM_IRQS) {
>> +        int i, pic_level;
>> +
>> +        /* The pic level is the logical OR of all the PCI irqs mapped =
to it=2E */
>> +        pic_level =3D 0;
>> +        for (i =3D 0; i < PCI_NUM_PINS; i++) {
>> +            if (pic_irq =3D=3D via_isa_get_pci_irq(s, i)) {
>> +                pic_level |=3D pci_bus_get_irq_level(bus, i);
>> +            }
>> +        }
>> +        qemu_set_irq(s->isa_irqs[pic_irq], pic_level);
>> +    }
>> +}
>> +
>>   static void via_isa_realize(PCIDevice *d, Error **errp)
>>   {
>>       ViaISAState *s =3D VIA_ISA(d);
>> @@ -676,6 +718,8 @@ static void via_isa_realize(PCIDevice *d, Error **e=
rrp)
>>       if (!qdev_realize(DEVICE(&s->mc97), BUS(pci_bus), errp)) {
>>           return;
>>       }
>> +
>> +    pci_bus_irqs(pci_bus, via_isa_set_pci_irq, s, PCI_NUM_PINS);
>>   }
>>     /* TYPE_VT82C686B_ISA */
>
>This looks right, however generally a PCI device shouldn't really be sett=
ing PCI bus IRQs: this is normally done by the PCI host bridge=2E Is it jus=
t the case that the x86 world is different here for legacy reasons?

Well, looking at the pegasos2 schematics it seems to me that at least the =
intA + intB lines are connected to both chips (and that they are even share=
d between the AGP slot and the PCI bus)=2E On the Marvell north bridge they=
 seem to be connected to GPIO pins and on the VIA chip to the PCI IRQ route=
r=2E

Note that GPIO pins can usually be deactivated (tristated) and that the fo=
ur VIA PCI IRQs can be deactivated by assigning "interrupt 0"=2E Such a des=
ign would allow the lines to be hardwired to both "interrupt controllers", =
allowing system software to use either controller, or possibly even mixed (=
e=2Eg=2E intA to be treated by the north bridge and intB by VIA)=2E

Such designs are currently not easily implementable in QEMU since only one=
 IRQ handler can be assigned to a PCI bus=2E As a workaround, one could ass=
ign a custom IRQ handler which implements special handling=2E

Getting back to your question, I think you are right that assigning the IR=
Q handler in the VIA model may break e=2Eg=2E the Fuloong2e machine where t=
he IRQ handler is set in the north bridge=2E Since the VIA chip is instanti=
ated later it now effectively replaces the handler=2E

It would be really neat if QEMU allowed for assigning two or more IRQ hand=
lers to a PCI bus=2E=2E=2E

Do you think that two interrupt controllers connected to IRQ lines like th=
at sounds reasonable?

Best regards,
Bernhard

>
>
>ATB,
>
>Mark=2E

