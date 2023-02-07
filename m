Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BD068E444
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 00:13:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPX9a-0004sj-Ln; Tue, 07 Feb 2023 18:13:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pPX9Y-0004sS-RP
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:13:32 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pPX9X-0007CH-1M
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:13:32 -0500
Received: by mail-ed1-x532.google.com with SMTP id x9so10219420eds.12
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 15:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7WhK3aFM1klaoqqcq58JdyPYp0Nvgyec51WJjZkUfpI=;
 b=DTEmYmISxvztyqB4xs3NnuJbzGC7bfAc4Jy4CnKsLhxw1Z8rRZhjkhcXRg0jEjBjqP
 xE7dzm6qnnYJqnrYDLHJuNaAdflr7tCYsoyXettIECjHiDd6dj6ooQIokDYVPAywAQvg
 ij8Vi4P8ogRidyj+nmRc05U6Fa/aqs81s7DSDF+Ybp3xU1LVexk1oHMHm1tVgmX0F+JN
 1KAq+Q2XeHzD+IiVD63Tds4JTiNOYdbjCvj+pRh+Q64G+4NJ4N1/o7IO08utWShH2aBY
 CNGDiiW3I3nVtfldBGwT5XMR5JX0VIfVcbAAlJWUYPzMyD98zU46rwNWKtaL5UWDgDMd
 IG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7WhK3aFM1klaoqqcq58JdyPYp0Nvgyec51WJjZkUfpI=;
 b=cysdjLjJhkvx2a913ytqiLnSfn5tiTlA+tiMbjGJ7k9DTFDX1TeMTgXw4/KFOMsdl1
 CgmRTFeiaG8bcLqkwdiHRHIf7Rl9JUoWK6zgl0PbHBRlV42d2J2LlEmOo3b9IRVZmpfw
 4QcMpEtxe7RSWZbUdXjuQwMsmb2OgwD+SRXC9+vH+MXQZScd8i+tfE7dEsJBrgj6zBbX
 NLw2sY0SSNaq0BondBKj6TqIo8y3RizG5COuBZaK3mmhuwkvc6xkkTAA5c+ZJtHY/4Sk
 Uljlosutw6vdVfsXA2k8aGyTag8RpwjENqvpMSlUdEOFAFdyF9e1ex/EVwA9uPFS9+ei
 c+QQ==
X-Gm-Message-State: AO0yUKVfxSBkjM3t0Ni4IH7Xobbe+6PhS3dEvT7eSjDbOWgKU71ibkTj
 HS7FeiW2Bpv4Z44OnydLSOs=
X-Google-Smtp-Source: AK7set81ztDQzmmX/2bA9fSlsPXnXe8OR37qvDDp1nC5VeicLBiYgs9KVXDVtPvN+ch8nRgr9DVjbg==
X-Received: by 2002:a50:ab01:0:b0:492:8c77:7dad with SMTP id
 s1-20020a50ab01000000b004928c777dadmr5605539edc.8.1675811608976; 
 Tue, 07 Feb 2023 15:13:28 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-014-074-246.89.14.pool.telefonica.de.
 [89.14.74.246]) by smtp.gmail.com with ESMTPSA id
 cq25-20020a056402221900b004a0afea4c9csm7059981edb.18.2023.02.07.15.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 15:13:28 -0800 (PST)
Date: Tue, 07 Feb 2023 23:13:18 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH 1/3] hw/isa/vt82c686: Fix SCI routing
In-Reply-To: <e8254e7c-aeb5-2709-a52e-ba0bb38eed88@eik.bme.hu>
References: <20230129213418.87978-1-shentey@gmail.com>
 <20230129213418.87978-2-shentey@gmail.com>
 <e8254e7c-aeb5-2709-a52e-ba0bb38eed88@eik.bme.hu>
Message-ID: <7460C87C-B11E-4FAB-9370-9030992AA9DA@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
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



Am 31=2E Januar 2023 14:42:29 UTC schrieb BALATON Zoltan <balaton@eik=2Ebm=
e=2Ehu>:
>On Sun, 29 Jan 2023, Bernhard Beschow wrote:
>> According to the PCI specification, the hardware is not supposed to use
>> PCI_INTERRUPT_PIN for interrupt routing=2E Use the dedicated ACPI
>> Interrupt Select register for SCI routing instead=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>> hw/isa/vt82c686=2Ec | 42 ++++++++++++++++++++++++++++++------------
>> 1 file changed, 30 insertions(+), 12 deletions(-)
>>=20
>> diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>> index 3f9bd0c04d=2E=2E2189be6f20 100644
>> --- a/hw/isa/vt82c686=2Ec
>> +++ b/hw/isa/vt82c686=2Ec
>> @@ -46,6 +46,8 @@ struct ViaPMState {
>>     ACPIREGS ar;
>>     APMState apm;
>>     PMSMBus smb;
>> +
>> +    qemu_irq irq;
>> };
>>=20
>> static void pm_io_space_update(ViaPMState *s)
>> @@ -148,18 +150,7 @@ static void pm_update_sci(ViaPMState *s)
>>                    ACPI_BITMASK_POWER_BUTTON_ENABLE |
>>                    ACPI_BITMASK_GLOBAL_LOCK_ENABLE |
>>                    ACPI_BITMASK_TIMER_ENABLE)) !=3D 0);
>> -    if (pci_get_byte(s->dev=2Econfig + PCI_INTERRUPT_PIN)) {
>> -        /*
>> -         * FIXME:
>> -         * Fix device model that realizes this PM device and remove
>> -         * this work around=2E
>> -         * The device model should wire SCI and setup
>> -         * PCI_INTERRUPT_PIN properly=2E
>> -         * If PIN# =3D 0(interrupt pin isn't used), don't raise SCI as
>> -         * work around=2E
>> -         */
>> -        pci_set_irq(&s->dev, sci_level);
>> -    }
>> +    qemu_set_irq(s->irq, sci_level);
>>     /* schedule a timer interruption if needed */
>>     acpi_pm_tmr_update(&s->ar, (s->ar=2Epm1=2Eevt=2Een & ACPI_BITMASK_T=
IMER_ENABLE) &&
>>                        !(pmsts & ACPI_BITMASK_TIMER_STATUS));
>> @@ -213,6 +204,13 @@ static void via_pm_realize(PCIDevice *dev, Error *=
*errp)
>>     acpi_pm1_cnt_init(&s->ar, &s->io, false, false, 2, false);
>> }
>>=20
>> +static void via_pm_init(Object *obj)
>> +{
>> +    ViaPMState *s =3D VIA_PM(obj);
>> +
>> +    qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
>> +}
>> +
>> typedef struct via_pm_init_info {
>>     uint16_t device_id;
>> } ViaPMInitInfo;
>> @@ -238,6 +236,7 @@ static void via_pm_class_init(ObjectClass *klass, v=
oid *data)
>> static const TypeInfo via_pm_info =3D {
>>     =2Ename          =3D TYPE_VIA_PM,
>>     =2Eparent        =3D TYPE_PCI_DEVICE,
>> +    =2Einstance_init =3D via_pm_init,
>>     =2Einstance_size =3D sizeof(ViaPMState),
>>     =2Eabstract      =3D true,
>>     =2Einterfaces =3D (InterfaceInfo[]) {
>> @@ -568,6 +567,21 @@ static const VMStateDescription vmstate_via =3D {
>>     }
>> };
>>=20
>> +static void via_isa_set_pm_irq(void *opaque, int n, int level)
>> +{
>> +    ViaISAState *s =3D opaque;
>> +    uint8_t irq =3D pci_get_byte(s->pm=2Edev=2Econfig + 0x42) & 0xf;
>> +
>> +    if (irq =3D=3D 2) {
>
>unlikely(irq =3D=3D 2) but do we really need to log this? It really shoul=
d not happen but if it does the guest is really broken and this will just f=
lood the log so I think you can just test for it in the if below and drop t=
he log=2E

I'd prefer to log such guest errors precisely for above reason: To detect =
really broken guests=2E If it's really too much noise one can still filter =
the log with external tools such as grep=2E

Best regards,
Bernhard

>
>Regards,
>BALATON Zoltan
>
>> +        qemu_log_mask(LOG_GUEST_ERROR, "IRQ 2 for PM controller is res=
erved");
>> +        return;
>> +    }
>> +
>> +    if (irq !=3D 0) {
>> +        qemu_set_irq(s->isa_irqs[irq], level);
>> +    }
>> +}
>> +
>> static void via_isa_init(Object *obj)
>> {
>>     ViaISAState *s =3D VIA_ISA(obj);
>> @@ -578,6 +592,8 @@ static void via_isa_init(Object *obj)
>>     object_initialize_child(obj, "uhci2", &s->uhci[1], TYPE_VT82C686B_U=
SB_UHCI);
>>     object_initialize_child(obj, "ac97", &s->ac97, TYPE_VIA_AC97);
>>     object_initialize_child(obj, "mc97", &s->mc97, TYPE_VIA_MC97);
>> +
>> +    qdev_init_gpio_in_named(DEVICE(obj), via_isa_set_pm_irq, "sci", 1)=
;
>> }
>>=20
>> static const TypeInfo via_isa_info =3D {
>> @@ -664,6 +680,8 @@ static void via_isa_realize(PCIDevice *d, Error **e=
rrp)
>>     if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
>>         return;
>>     }
>> +    qdev_connect_gpio_out(DEVICE(&s->pm), 0,
>> +                          qdev_get_gpio_in_named(DEVICE(d), "sci", 0))=
;
>>=20
>>     /* Function 5: AC97 Audio */
>>     qdev_prop_set_int32(DEVICE(&s->ac97), "addr", d->devfn + 5);
>>=20

