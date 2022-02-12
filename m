Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BDC4B35A0
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 15:25:38 +0100 (CET)
Received: from localhost ([::1]:41238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nItLF-0007oz-Ap
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 09:25:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nItJa-0006k2-Ch; Sat, 12 Feb 2022 09:23:54 -0500
Received: from [2a00:1450:4864:20::12d] (port=40759
 helo=mail-lf1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nItJY-0001pW-BM; Sat, 12 Feb 2022 09:23:54 -0500
Received: by mail-lf1-x12d.google.com with SMTP id 13so21870055lfp.7;
 Sat, 12 Feb 2022 06:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0MCVYJrs80iOFzWxFMQjhD4GuU5WRwOdK+fN3DXZ5Ok=;
 b=hvfi0bo/6Kcdr2RJGcqeLgAjH+nxaiukA+z7QiXF5fPgMCi5lePc0P+a9mKfmUOa8R
 qXr4TWCHbGcHrYeQEQvDP4+ujcSnnF/5ao8SxEkgVMpdy41T0GF+mM+d4JZwe32hXhf6
 Jo0SV13bSeDA7sTdqRUHhwl2HEt3EdWjJDhkfwYQTlRJluEOpiIa3khlANxsVxEBMR/l
 Ua5EHSOh03Oqh/+nAvKwHUO/QQMs1C/0JPClZNPNr+8wxUQVTwGa+F8OAc7qjvI83sbP
 BfC48KJ52zdoQBRQX6puvNcWcpHFoWSjGXsVlBk1xdg4XADz+USu5o95ERCnVgvqqXXD
 qgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0MCVYJrs80iOFzWxFMQjhD4GuU5WRwOdK+fN3DXZ5Ok=;
 b=rfrob4XVZ6x1DJ9j4nsgWJRHimBFAOs2fSHssWskVCt9HZDH96PEACA7nce2R0do9+
 K5J72zGaNzmrGgO3KTYk/N6/ctqzGsxZjtoSDOnOhdMtUzz8WkX13ekJm5VAanqbcbpp
 6dynCOkjbF5a9+6dz9gEjSg7G5gXM+F1gEwOAz1YV+FzQufvpAn0wvp7JWbDWcRF1njJ
 s8O9hY+FJmYYv6nd8piSpj36uX+MIgfgqUyOLvj2OFZ589jdmke7QkFDgr+xJV49DIMd
 3zfCHuzH7Xg8p4vvY3JD5q3NMzxxiq1qeF7blxB3WUzmC6oqzOU/8rKt8LGMvYrDonII
 hNuA==
X-Gm-Message-State: AOAM533Nkg9magsqGV3cMFzgXXZ8+UFll0vBZqBUrbSo2pd9K3uMsEFj
 e5iNPdgfTfX4dOQEP/VfENzfinibUq2V/LsEoCg=
X-Google-Smtp-Source: ABdhPJwLKozEWcoieW/f+3F/6EFunQ16jMVFJ1kp5Tuyn+eiJii7o5rWfJVVHKL6k6xOiKE3pQ9t9wplJ3g+ZvWcjl0=
X-Received: by 2002:a05:6512:ac3:: with SMTP id
 n3mr4559557lfu.274.1644675829824; 
 Sat, 12 Feb 2022 06:23:49 -0800 (PST)
MIME-Version: 1.0
References: <20220212113519.69527-1-shentey@gmail.com>
 <20220212113519.69527-3-shentey@gmail.com>
 <d6e47199-343e-46c0-d44f-64bc8d6e8385@eik.bme.hu>
In-Reply-To: <d6e47199-343e-46c0-d44f-64bc8d6e8385@eik.bme.hu>
From: Bernhard Beschow <shentey@gmail.com>
Date: Sat, 12 Feb 2022 15:23:30 +0100
Message-ID: <CAG4p6K7Z=h+LkNhL+Ex3USDS1SEnh-MGvx_FUF5CoKaHOgRm_g@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] pci: Always pass own DeviceState to
 pci_map_irq_fn's
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=shentey@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "open list:Versatile PB" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 "open list:ppc4xx" <qemu-ppc@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12. Februar 2022 14:27:32 MEZ schrieb BALATON Zoltan <balaton@eik.bme.hu=
>:
>On Sat, 12 Feb 2022, Bernhard Beschow wrote:
>> Passing own DeviceState rather than just the IRQs allows for resolving
>> global variables.
>
>Do you mean pci_set_irq_fn instead of pci_map_irq_fn in the patch title?

I'm referring to the typedef in pci.h because the patch establishes
consistency across the board.

>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>> hw/isa/piix4.c          | 6 +++---
>> hw/pci-host/sh_pci.c    | 6 +++---
>> hw/pci-host/versatile.c | 6 +++---
>> hw/ppc/ppc440_pcix.c    | 6 +++---
>> hw/ppc/ppc4xx_pci.c     | 6 +++---
>> 5 files changed, 15 insertions(+), 15 deletions(-)
>
>You don't seem to change any global function definition that reqires this
>change in all these devices so why can't these decide on their own what
>their preferred opaque data is for their set irq function and only change
>piix4? Am I missing something? I'm not opposed to this change but it seems
>to be unnecessary to touch other device implementations for this and may
>just make them more complex for no good reason.

This patch is a segway into a direction where the type of the opaque parame=
ter
of the pci_map_irq_fn typedef could be changed from void* to DeviceState* i=
n
order to facilitate the more typesafe QOM casting. I see, though, why this =
is
confusing in the context of this patch series. I don't have strong feelings=
 for
converting the other devices or not. So I can only change piix4 if desired.

Regards,
Bernhard

>
>Regards,
>BALATON Zoltan
>
>> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
>> index 5a86308689..a31e9714cf 100644
>> --- a/hw/isa/piix4.c
>> +++ b/hw/isa/piix4.c
>> @@ -60,7 +60,7 @@ static int pci_irq_levels[4];
>> static void piix4_set_irq(void *opaque, int irq_num, int level)
>> {
>>     int i, pic_irq, pic_level;
>> -    qemu_irq *pic =3D opaque;
>> +    PIIX4State *s =3D opaque;
>>
>>     pci_irq_levels[irq_num] =3D level;
>>
>> @@ -75,7 +75,7 @@ static void piix4_set_irq(void *opaque, int irq_num, i=
nt level)
>>                 pic_level |=3D pci_irq_levels[i];
>>             }
>>         }
>> -        qemu_set_irq(pic[pic_irq], pic_level);
>> +        qemu_set_irq(s->i8259[pic_irq], pic_level);
>>     }
>> }
>>
>> @@ -323,7 +323,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **=
isa_bus, I2CBus **smbus)
>>                                NULL, 0, NULL);
>>     }
>>
>> -    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s->i8259, 4=
);
>> +    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, 4);
>>
>>     for (int i =3D 0; i < ISA_NUM_IRQS; i++) {
>>         s->i8259[i] =3D qdev_get_gpio_in_named(dev, "isa", i);
>> diff --git a/hw/pci-host/sh_pci.c b/hw/pci-host/sh_pci.c
>> index 719d6ca2a6..ae0aa462b3 100644
>> --- a/hw/pci-host/sh_pci.c
>> +++ b/hw/pci-host/sh_pci.c
>> @@ -111,9 +111,9 @@ static int sh_pci_map_irq(PCIDevice *d, int irq_num)
>>
>> static void sh_pci_set_irq(void *opaque, int irq_num, int level)
>> {
>> -    qemu_irq *pic =3D opaque;
>> +    SHPCIState *s =3D opaque;
>>
>> -    qemu_set_irq(pic[irq_num], level);
>> +    qemu_set_irq(s->irq[irq_num], level);
>> }
>>
>> static void sh_pci_device_realize(DeviceState *dev, Error **errp)
>> @@ -128,7 +128,7 @@ static void sh_pci_device_realize(DeviceState *dev, =
Error **errp)
>>     }
>>     phb->bus =3D pci_register_root_bus(dev, "pci",
>>                                      sh_pci_set_irq, sh_pci_map_irq,
>> -                                     s->irq,
>> +                                     s,
>>                                      get_system_memory(),
>>                                      get_system_io(),
>>                                      PCI_DEVFN(0, 0), 4, TYPE_PCI_BUS);
>> diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
>> index f66384fa02..5fbcb72d7d 100644
>> --- a/hw/pci-host/versatile.c
>> +++ b/hw/pci-host/versatile.c
>> @@ -362,9 +362,9 @@ static int pci_vpb_rv_map_irq(PCIDevice *d, int irq_=
num)
>>
>> static void pci_vpb_set_irq(void *opaque, int irq_num, int level)
>> {
>> -    qemu_irq *pic =3D opaque;
>> +    PCIVPBState *s =3D opaque;
>>
>> -    qemu_set_irq(pic[irq_num], level);
>> +    qemu_set_irq(s->irq[irq_num], level);
>> }
>>
>> static void pci_vpb_reset(DeviceState *d)
>> @@ -422,7 +422,7 @@ static void pci_vpb_realize(DeviceState *dev, Error =
**errp)
>>         mapfn =3D pci_vpb_map_irq;
>>     }
>>
>> -    pci_bus_irqs(&s->pci_bus, pci_vpb_set_irq, mapfn, s->irq, 4);
>> +    pci_bus_irqs(&s->pci_bus, pci_vpb_set_irq, mapfn, s, 4);
>>
>>     /* Our memory regions are:
>>      * 0 : our control registers
>> diff --git a/hw/ppc/ppc440_pcix.c b/hw/ppc/ppc440_pcix.c
>> index 788d25514a..291c1bfbe7 100644
>> --- a/hw/ppc/ppc440_pcix.c
>> +++ b/hw/ppc/ppc440_pcix.c
>> @@ -431,14 +431,14 @@ static int ppc440_pcix_map_irq(PCIDevice *pci_dev,=
 int irq_num)
>>
>> static void ppc440_pcix_set_irq(void *opaque, int irq_num, int level)
>> {
>> -    qemu_irq *pci_irq =3D opaque;
>> +    PPC440PCIXState *s =3D opaque;
>>
>>     trace_ppc440_pcix_set_irq(irq_num);
>>     if (irq_num < 0) {
>>         error_report("%s: PCI irq %d", __func__, irq_num);
>>         return;
>>     }
>> -    qemu_set_irq(*pci_irq, level);
>> +    qemu_set_irq(s->irq, level);
>> }
>>
>> static AddressSpace *ppc440_pcix_set_iommu(PCIBus *b, void *opaque, int =
devfn)
>> @@ -492,7 +492,7 @@ static void ppc440_pcix_realize(DeviceState *dev, Er=
ror **errp)
>>     sysbus_init_irq(sbd, &s->irq);
>>     memory_region_init(&s->busmem, OBJECT(dev), "pci bus memory", UINT64=
_MAX);
>>     h->bus =3D pci_register_root_bus(dev, NULL, ppc440_pcix_set_irq,
>> -                         ppc440_pcix_map_irq, &s->irq, &s->busmem,
>> +                         ppc440_pcix_map_irq, s, &s->busmem,
>>                          get_system_io(), PCI_DEVFN(0, 0), 1, TYPE_PCI_B=
US);
>>
>>     s->dev =3D pci_create_simple(h->bus, PCI_DEVFN(0, 0), "ppc4xx-host-b=
ridge");
>> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
>> index 5df97e6d15..f6718746a1 100644
>> --- a/hw/ppc/ppc4xx_pci.c
>> +++ b/hw/ppc/ppc4xx_pci.c
>> @@ -256,11 +256,11 @@ static int ppc4xx_pci_map_irq(PCIDevice *pci_dev, =
int irq_num)
>>
>> static void ppc4xx_pci_set_irq(void *opaque, int irq_num, int level)
>> {
>> -    qemu_irq *pci_irqs =3D opaque;
>> +    PPC4xxPCIState *s =3D opaque;
>>
>>     trace_ppc4xx_pci_set_irq(irq_num);
>>     assert(irq_num >=3D 0 && irq_num < PPC4xx_PCI_NUM_DEVS);
>> -    qemu_set_irq(pci_irqs[irq_num], level);
>> +    qemu_set_irq(s->irq[irq_num], level);
>> }
>>
>> static const VMStateDescription vmstate_pci_master_map =3D {
>> @@ -319,7 +319,7 @@ static void ppc4xx_pcihost_realize(DeviceState *dev,=
 Error **errp)
>>     }
>>
>>     b =3D pci_register_root_bus(dev, NULL, ppc4xx_pci_set_irq,
>> -                              ppc4xx_pci_map_irq, s->irq, get_system_me=
mory(),
>> +                              ppc4xx_pci_map_irq, s, get_system_memory(=
),
>>                               get_system_io(), 0, ARRAY_SIZE(s->irq),
>>                               TYPE_PCI_BUS);
>>     h->bus =3D b;
>>

