Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C68A667D62
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 19:04:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG1vJ-00061C-9q; Thu, 12 Jan 2023 13:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pG1v8-0005zN-HE; Thu, 12 Jan 2023 13:03:22 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pG1v6-0006DS-PY; Thu, 12 Jan 2023 13:03:22 -0500
Received: by mail-ed1-x536.google.com with SMTP id b4so8408130edf.0;
 Thu, 12 Jan 2023 10:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mnzFi1Kt+mZA/K0HLKAX84GNQY7+7dKWpnWTT3vMn4g=;
 b=CsGRJr7ImT2BxWlXRjEohFR7I3Bdo0MMKtmKY7E+1esmtaU/jkmsPbMk5K1Roo/9bC
 fykKjmR2iWLmzzWyEmH94uvvuRiBHwVTQ2gEccypO4NeYoN0K4CDW+etSp2p8Yg078WA
 PC1Ng5oaAI/hH+RjkkXjgioATIouxOTLmAm6saV/wTZnUoQkok6P4q7iwixol+34qXqF
 DIdExJ5KpwGwJdo8V2NjwdMazz7MFwOjUhAfK5HEijM9xYb90CiorlplGwwI1QZl/6zZ
 xaEMeLGC2VYRBUoc0dzTYDpBfx8EPdHM4vh+jLgykRsFPURcQ/6iyzfxBze6of8typ5d
 zxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mnzFi1Kt+mZA/K0HLKAX84GNQY7+7dKWpnWTT3vMn4g=;
 b=SR7uDdL1jRzq4y7/OtrM44rn+4hPgTjGraSHeDZdhW3bf3alFhs77N0jzj+GUdHanr
 aQkOtZVJcZyWLY8WgMlDvaGUoJ8Z7ekxTK6uXshE3LHYeBglVUf7cq2vX107qLnTfU3n
 qVTCFeOsvKHfNu8g6Rr+h+SJhlhSZSSddnhn0HA9js8ZXan9pRUD/RBsf93HgAxkW1js
 +szNII2TPdUss+kVEFLQr0/idxm4uDtxHEaqqNC/sZfxxlLQvZMWS6nXDlWNBEuKWAe4
 EhTcOmKz9SyavRdxeLdUAgQleTQc9hxYCIdYSe4vo2MXyYCYq4m3eVxPM17hMSF+kU5s
 ACtg==
X-Gm-Message-State: AFqh2koETqsQ5pENKkQLNtYuvxLAtmYBtdHuLnNnSiLYElTLuWpsBVOu
 1F78qaP3+0Ek7xh1f087/ew=
X-Google-Smtp-Source: AMrXdXurYGkP3pR7N0gFV9ov+0R8xgD9vTDrjTU567OVA+my8U3dtWEQmxwpxveBPn2tvcvXiFgNGA==
X-Received: by 2002:a05:6402:1c8b:b0:485:832:1e46 with SMTP id
 cy11-20020a0564021c8b00b0048508321e46mr51051964edb.23.1673546596630; 
 Thu, 12 Jan 2023 10:03:16 -0800 (PST)
Received: from [127.0.0.1] (dynamic-092-224-135-062.92.224.pool.telefonica.de.
 [92.224.135.62]) by smtp.gmail.com with ESMTPSA id
 b9-20020a1709063ca900b007c073be0127sm7666577ejh.202.2023.01.12.10.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 10:03:16 -0800 (PST)
Date: Thu, 12 Jan 2023 18:03:11 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Subject: Re: [PATCH v6 28/33] hw/isa/piix3: Merge hw/isa/piix4.c
In-Reply-To: <9f2f0fe3-3aef-91c5-bbe4-b94682b6a832@linaro.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <20230109172347.1830-29-shentey@gmail.com>
 <e879c284-5021-2f63-0269-5e0b09bc31a7@linaro.org>
 <9f2f0fe3-3aef-91c5-bbe4-b94682b6a832@linaro.org>
Message-ID: <1FC5DE03-2236-416E-8747-972DD88C0ABA@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
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



Am 12=2E Januar 2023 16:31:23 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>On 12/1/23 16:04, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 9/1/23 18:23, Bernhard Beschow wrote:
>>> Now that the PIIX3 and PIIX4 device models are sufficiently consolidat=
ed,
>>> their implementations can be merged into one file for further
>>> consolidation=2E
>>>=20
>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>> Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>>> Message-Id: <20221022150508=2E26830-37-shentey@gmail=2Ecom>
>>> ---
>>> =C2=A0 hw/isa/{piix3=2Ec =3D> piix=2Ec} | 158 ++++++++++++++++++++
>>> =C2=A0 hw/isa/piix4=2Ec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 285 -------------------------------------
>>> =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
>>> =C2=A0 hw/i386/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>> =C2=A0 hw/isa/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 12 +-
>>> =C2=A0 hw/isa/meson=2Ebuild=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 3 +-
>>> =C2=A0 hw/mips/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>> =C2=A0 7 files changed, 165 insertions(+), 303 deletions(-)
>>> =C2=A0 rename hw/isa/{piix3=2Ec =3D> piix=2Ec} (75%)
>>> =C2=A0 delete mode 100644 hw/isa/piix4=2Ec
>>=20
>>> +static void piix4_realize(PCIDevice *dev, Error **errp)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 PIIXState *s =3D PIIX_PCI_DEVICE(dev);
>>> +=C2=A0=C2=A0=C2=A0 PCIBus *pci_bus =3D pci_get_bus(dev);
>>> +=C2=A0=C2=A0=C2=A0 ISABus *isa_bus;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 isa_bus =3D isa_bus_new(DEVICE(dev), pci_address_s=
pace(dev),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 pci_address_space_io(dev), errp);
>>> +=C2=A0=C2=A0=C2=A0 if (!isa_bus) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 memory_region_init_io(&s->rcr_mem, OBJECT(dev), &r=
cr_ops, s,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "reset-control", 1);
>>> +=C2=A0=C2=A0=C2=A0 memory_region_add_subregion_overlap(pci_address_sp=
ace_io(dev),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 PIIX_RCR_IOPORT, &s->rcr_mem, 1);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* initialize i8259 pic */
>>> +=C2=A0=C2=A0=C2=A0 if (!qdev_realize(DEVICE(&s->pic), NULL, errp)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* initialize ISA irqs */
>>> +=C2=A0=C2=A0=C2=A0 isa_bus_irqs(isa_bus, s->pic=2Ein_irqs);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* initialize pit */
>>> +=C2=A0=C2=A0=C2=A0 i8254_pit_init(isa_bus, 0x40, 0, NULL);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* DMA */
>>> +=C2=A0=C2=A0=C2=A0 i8257_dma_init(isa_bus, 0);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* RTC */
>>> +=C2=A0=C2=A0=C2=A0 qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", =
2000);
>>> +=C2=A0=C2=A0=C2=A0 if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), e=
rrp)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0 s->rtc=2Eirq =3D qdev_get_gpio_in(DEVICE(&s->pic),=
 s->rtc=2Eisairq);
>>=20
>> Pre-existing; it seems this difference with PIIX3 can be removed
>> because already taken care by calling isa_connect_gpio_out() in mc14681=
8_rtc_init()?
>>=20
>> ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq inter=
cept_irq)
>> {
>>  =C2=A0=C2=A0=C2=A0 DeviceState *dev;
>>  =C2=A0=C2=A0=C2=A0 ISADevice *isadev;
>>  =C2=A0=C2=A0=C2=A0 RTCState *s;
>>=20
>>  =C2=A0=C2=A0=C2=A0 isadev =3D isa_new(TYPE_MC146818_RTC);
>>  =C2=A0=C2=A0=C2=A0 dev =3D DEVICE(isadev);
>>  =C2=A0=C2=A0=C2=A0 s =3D MC146818_RTC(isadev);
>>  =C2=A0=C2=A0=C2=A0 qdev_prop_set_int32(dev, "base_year", base_year);
>>  =C2=A0=C2=A0=C2=A0 isa_realize_and_unref(isadev, bus, &error_fatal);
>>  =C2=A0=C2=A0=C2=A0 if (intercept_irq) {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qdev_connect_gpio_out(dev, =
0, intercept_irq);
>>  =C2=A0=C2=A0=C2=A0 } else {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 isa_connect_gpio_out(isadev=
, 0, s->isairq);
>>=20
>
>I meant to paste:
>
>static void rtc_realizefn(DeviceState *dev, Error **errp)
>{
>    =2E=2E=2E
>    qdev_init_gpio_out(dev, &s->irq, 1);
>
>
>> Having:
>>=20
>> void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isai=
rq)
>> {
>>  =C2=A0=C2=A0=C2=A0 qemu_irq irq =3D isa_get_irq(isadev, isairq);
>>  =C2=A0=C2=A0=C2=A0 qdev_connect_gpio_out(DEVICE(isadev), gpioirq, irq)=
;
>> }
>>=20
>> What do you think?
>

In "[PATCH v6 11/33] hw/i386/pc: Create RTC controllers in south bridges" =
mc146818_rtc_init() got inlined, taking into account the intercept_irq, whi=
ch required the rtc interrupt to be wired up in board code=2E Since we don'=
t have to deal with intercept_irq in the Malta code, wiring up of the rtc i=
nterrupt could be moved into PIIX4=2E

I would prefer to wire up the rtc interrupt in PIIX3 as well, and to re-wi=
re it in board code in case of intercept_irq !=3D NULL=2E That's still an o=
pen question which needs to be solved for PIIX4 to become a drop-in replace=
ment for PIIX3=2E Any ideas?

Best regards,
Bernhard

