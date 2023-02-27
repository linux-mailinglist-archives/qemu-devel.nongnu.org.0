Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1792B6A3C8D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:25:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWYlP-0004CX-Ap; Mon, 27 Feb 2023 03:21:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWYlK-0003vX-1Z; Mon, 27 Feb 2023 03:21:35 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWYlF-0000Xg-3K; Mon, 27 Feb 2023 03:21:31 -0500
Received: by mail-ed1-x52b.google.com with SMTP id cy6so22280026edb.5;
 Mon, 27 Feb 2023 00:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jZUPV2qISL80vnLTJOIdBMQOy5drkx8tt2WKvyJgAUE=;
 b=gxcWccCd9cBgPSMnejgkyshfYRahgGrkWPg8IXJIfTtI5/qlq69uGSTuf0V0GcIPyS
 eTWyDamrEJIvsPzQsKVA2GgRVFHz+eD5cVt8lhm9MX4RsxDEUIU+X39Eqa7q7u9auGqU
 y1po510CJs22Y7WKZ+RO3UQylT8XFjwPKNuZJuNV40tMvPWsof5/sY1U8KaAqqcIC94a
 a7NVuys1BN0hAq1ncqtpHzVF7Zo7qdIgof93YawL9+pP9HyZcqQZEBNeIXQoi1KvW+To
 WROsalNF8qnhkp5atRQ5gctKsc0zhgPFrnO5NjLUwHSPSMSIQ4qJlM0TUHTqhxkf11UJ
 JG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jZUPV2qISL80vnLTJOIdBMQOy5drkx8tt2WKvyJgAUE=;
 b=ncap5bw2q3iaTy9PN8AWkd+SFqX7ftssCQtph9AWQQWCt9n9n8d4e9z3kaFCHx/fK+
 HYrBuAUnJy8iK6/gBScFfpK5QROnXqMrzkj55Zuiva0L1dDtWFc6Qxy2kKf7hw0U7qJC
 O0RydW2iytWjPItOy83IwdpISD8QN8Xl0oG5b6yiaVa7rxJdniD0tY3fVMImspKo8wPO
 1xCnXH6ICn0CEUL8PGKKO4aTUFh5CuOvDFrOKS7elM6uJcqgNXenAeBh33NYw7rt5RuD
 7qMCHBieF+Ibq8nLzf3NCBankHLM2okCyve6LGoo5o+G6YIFRMoeuP5NRS6o25eGTVU/
 RjFg==
X-Gm-Message-State: AO0yUKVzOT4JWSNJhRvvvR4xl22JtZ2reFUJBtvntiV9xRJn9v6WmUhl
 I1Cta96o6omSkGPmOKhy6ck=
X-Google-Smtp-Source: AK7set/eXJNT9TSpXzf8ySvzOqp2LeUti+gV9lSjehsX6rchdUl/D4ffh3XX7TbwN7eXRC3f3DNSFg==
X-Received: by 2002:a17:907:c927:b0:8b2:7150:dd03 with SMTP id
 ui39-20020a170907c92700b008b27150dd03mr29183737ejc.35.1677486086790; 
 Mon, 27 Feb 2023 00:21:26 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-055-154-008.78.55.pool.telefonica.de.
 [78.55.154.8]) by smtp.gmail.com with ESMTPSA id
 hz18-20020a1709072cf200b008b26f3d45fbsm2956727ejc.143.2023.02.27.00.21.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 00:21:26 -0800 (PST)
Date: Mon, 27 Feb 2023 08:21:20 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, ReneEngel80@emailn.de
Subject: Re: [PATCH v3 4/8] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <236a7e87-b8dd-720d-e2e2-2c1beb97116e@eik.bme.hu>
References: <cover.1677445307.git.balaton@eik.bme.hu>
 <0fd9eac9174a840054c511fbc015048929c7bc40.1677445307.git.balaton@eik.bme.hu>
 <a496276e-24fb-e2bc-fbdf-ace9ef7f361f@linaro.org>
 <0E10FCF9-465D-462A-8031-880B0907CCDA@gmail.com>
 <236a7e87-b8dd-720d-e2e2-2c1beb97116e@eik.bme.hu>
Message-ID: <E383649B-F5D7-4D4F-886A-6A29B00BBDFA@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
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



Am 26=2E Februar 2023 23:37:24 UTC schrieb BALATON Zoltan <balaton@eik=2Eb=
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
>If you do that please don't break it and make me redo this series again=
=2E Sumbit a patch as a reply to this that can be substituted without chang=
ing other patches and I can include in later respins=2E

I will only do the mist minimal changes satisfying the review comments=2E =
This should minimize the risk of breakage=2E Also, you can minimize the cha=
nce of breakage on your side by not introducing more changes than needed, e=
=2Eg=2E by not doing any formatting changes=2E

>We don't have time to make extensive changes now, the freeze is too close=
=2E

I don't intend to make extensive changes unless review comments requre it=
=2E

Best regards,
Bernhard

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

