Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAD26A3D5B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:36:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWYzN-0001dg-HM; Mon, 27 Feb 2023 03:36:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWYz9-0001YR-Q1; Mon, 27 Feb 2023 03:35:56 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWYz7-0005CZ-0w; Mon, 27 Feb 2023 03:35:51 -0500
Received: by mail-ed1-x52f.google.com with SMTP id o12so22328004edb.9;
 Mon, 27 Feb 2023 00:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OiNpRYoYLH3sroQtlpzLzvkhid0pHsf/1yGroQpEvq0=;
 b=qud7UP7j/JVn4iCbM2AItzXGktL+gzzXz4+OzJJZG7ZRV/PE711ZsGRMmSEVcfNVjC
 IRlatD8s/MLDJv5rJXeZNY3W80DC13Z+HSH7upuLdWKxR3sZgt+bOcTzOYdB3E0ZucZ0
 DD0Q4RJF83B1x51bTXJnYLa+8vT+AR+wwp0rPSJddZbkDAASshdO47LJfS5JO3J9XWA0
 BVcggZfBT7uu0VW6lAtiaM5BxKHZtVz7u+djKqdNd+dIsHmbEN1b7G0M4FwAdyzWb7uM
 IU1sDNJb6mJvILKDRfjG1vaEgrKGpbSymVjTtRYTqutg98+ZH9syIHR+y+OwlFBggZc4
 vw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OiNpRYoYLH3sroQtlpzLzvkhid0pHsf/1yGroQpEvq0=;
 b=LZmPFZ1VyudW+KBtrD6E8jn1rJP8Nf2+XsIjeGiPhSmCbN2VegB/qkD+SzxAOEgYI+
 wHI3fXaoVj7/kWglp5extwk6vLCSGwOoltnwUrqZT6qIC7PIrq1xekOhWAcPR86VSJXp
 HkaDXl8RlVybMHn7YuZ8o4M31ciL/mMMtLos4VKv+KNXGxBON42Wnxye+aRrF94mEMSL
 7Vs/xZYlS4tWwTbfxm54AqMahSap+Clzpa1yDQixtXoWzc0unjQpfzH7a4JduJDUclNq
 IRrA3iF8WWDQR9e+mkBDWt2pc43qIUAnQLcMxVlha+GWZs2aIWDrHpHhhjF7Du686iiL
 ukwQ==
X-Gm-Message-State: AO0yUKWaUr7V6f7uMQzDM/WsoU5K7GfJ3tMF56QluSwVXkpamfP16Nou
 AyzZEecvvURSUmzLrmxT7wI=
X-Google-Smtp-Source: AK7set/XyjbmpiVIaaXckJsfzy5YIl40n9PhzTEWXwWMWqctbrj3xt4VLfgLoItU5hoToDEqi1jqDQ==
X-Received: by 2002:a17:906:255b:b0:8af:3fcc:2b05 with SMTP id
 j27-20020a170906255b00b008af3fcc2b05mr33062459ejb.12.1677486945549; 
 Mon, 27 Feb 2023 00:35:45 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-055-154-008.78.55.pool.telefonica.de.
 [78.55.154.8]) by smtp.gmail.com with ESMTPSA id
 qq10-20020a17090720ca00b008cb7473e488sm2994249ejb.12.2023.02.27.00.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 00:35:45 -0800 (PST)
Date: Mon, 27 Feb 2023 08:35:38 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, ReneEngel80@emailn.de
Subject: Re: [PATCH v3 4/8] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <cc565f01-c09e-bf03-b594-5216f51351c5@eik.bme.hu>
References: <cover.1677445307.git.balaton@eik.bme.hu>
 <0fd9eac9174a840054c511fbc015048929c7bc40.1677445307.git.balaton@eik.bme.hu>
 <a496276e-24fb-e2bc-fbdf-ace9ef7f361f@linaro.org>
 <0E10FCF9-465D-462A-8031-880B0907CCDA@gmail.com>
 <cc565f01-c09e-bf03-b594-5216f51351c5@eik.bme.hu>
Message-ID: <57051528-2FE3-4624-A042-F51813A1C302@gmail.com>
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



Am 26=2E Februar 2023 23:58:32 UTC schrieb BALATON Zoltan <balaton@eik=2Eb=
me=2Ehu>:
>On Sun, 26 Feb 2023, Bernhard Beschow wrote:
>> Am 26=2E Februar 2023 22:27:50 UTC schrieb "Philippe Mathieu-Daud=C3=A9=
" <philmd@linaro=2Eorg>:
>>> On 25/2/23 19:11, BALATON Zoltan wrote:
>>>> From: Bernhard Beschow <shentey@gmail=2Ecom>
>>>>=20
>>>> The real VIA south bridges implement a PCI IRQ router which is config=
ured
>>>> by the BIOS or the OS=2E In order to respect these configurations, QE=
MU
>>>> needs to implement it as well=2E
>>>>=20
>>>> Note: The implementation was taken from piix4_set_irq() in hw/isa/pii=
x4=2E
>>>>=20
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>> [balaton: declare gpio inputs instead of changing pci bus irqs so it =
can
>>>>   be connected in board code; remove some empty lines]
>>>> Signed-off-by: BALATON Zoltan <balaton@eik=2Ebme=2Ehu>
>>>> Tested-by: Rene Engel <ReneEngel80@emailn=2Ede>
>>>> ---
>>>>   hw/isa/vt82c686=2Ec | 39 +++++++++++++++++++++++++++++++++++++++
>>>>   1 file changed, 39 insertions(+)
>>>=20
>>>> +static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
>>>> +{
>>>> +    switch (irq_num) {
>>>> +    case 0:
>>>> +        return s->dev=2Econfig[0x55] >> 4;
>>>> +    case 1:
>>>> +        return s->dev=2Econfig[0x56] & 0xf;
>>>> +    case 2:
>>>> +        return s->dev=2Econfig[0x56] >> 4;
>>>> +    case 3:
>>>> +        return s->dev=2Econfig[0x57] >> 4;
>>>> +    }
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static void via_isa_set_pci_irq(void *opaque, int irq_num, int level=
)
>>>> +{
>>>> +    ViaISAState *s =3D opaque;
>>>> +    PCIBus *bus =3D pci_get_bus(&s->dev);
>>>> +    int pic_irq;
>>>> +
>>>> +    /* now we change the pic irq level according to the via irq mapp=
ings */
>>>> +    /* XXX: optimize */
>>>> +    pic_irq =3D via_isa_get_pci_irq(s, irq_num);
>>>> +    if (pic_irq < ISA_NUM_IRQS) {
>>>=20
>>> the ISA IRQ is stored in 4-bit so will always be in range=2E
>>=20
>> Indeed=2E I'd turn this into an assert to keep this assum visible=2E I'=
ll do another iteration of the PCI IRQ router series=2E
>
>I don't like a useless assert in an irq handler that's potentially called=
 a lot=2E If you want to keep that add a comment instead=2E

It won't because it will only affect debug builds=2E If it fails it's imme=
diately clear in which direction to look for the culprit=2E

>
>Also I can't use Based-on because having all patches in a single series h=
elps maintainers to follow what belongs to here so this should be one serie=
s=2E You don't have to follow your one any more as it was fully incorporate=
d here so this is the only version you'd have to watch=2E
>
>Regards,
>BALATON Zoltan
>
>> Best regards,
>> Bernhard
>>>=20
>>>> +        int i, pic_level;
>>>> +
>>>> +        /* The pic level is the logical OR of all the PCI irqs mappe=
d to it=2E */
>>>> +        pic_level =3D 0;
>>>> +        for (i =3D 0; i < PCI_NUM_PINS; i++) {
>>>> +            if (pic_irq =3D=3D via_isa_get_pci_irq(s, i)) {
>>>> +                pic_level |=3D pci_bus_get_irq_level(bus, i);
>>>> +            }
>>>> +        }
>>>> +        qemu_set_irq(s->isa_irqs[pic_irq], pic_level);
>>>> +    }
>>>> +}
>>>=20
>>>=20
>>=20
>> 

