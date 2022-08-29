Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6F75A53C8
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 20:09:45 +0200 (CEST)
Received: from localhost ([::1]:37438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSjCi-0000q0-1M
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 14:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oSjAe-0007rH-TP; Mon, 29 Aug 2022 14:07:36 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oSjAc-0002cF-P2; Mon, 29 Aug 2022 14:07:36 -0400
Received: by mail-wr1-x429.google.com with SMTP id m16so11169413wru.9;
 Mon, 29 Aug 2022 11:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc;
 bh=VhZYoyNUFN+kCZJ4vencJdxHBf6MTvmil1i5pvZlRRE=;
 b=NPA1eBkahFmk8ueTJGDaHmUoznmLNDq45993AkTAgQs4ePzRA1Fnl8bu4hGzMHm5SX
 gneyVzx0in+T72GzAV6ndAg+6USBBqEYTVhZMnVCoH33bw7xWlrBN0UZJFUtqIC6dZa7
 Ywp2xg2AuCehdAqUAhgRLr9dM4zozzHS/e7HRzrAb//+TJAg46Ooh5Bfs6PR0gViHki2
 8jQrcjrHF1ldjFVZdcIhBXixfCsYwQ0qmCSKxhWHgYxkp9f2VcGshO4XPKDR3/FH73R0
 EJ9Qt61Gv2+3CBWNZBOd83t2nJrhnW+mVZ7TZYCtPSmi6bJbrD1FksxX70kz/fF2jvBX
 OiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc;
 bh=VhZYoyNUFN+kCZJ4vencJdxHBf6MTvmil1i5pvZlRRE=;
 b=0DXZBOO+ITNM1Ua0dp3n5g8TzYBQavDISjhvwsqF/WLLnUo6josqmZBYZxpTJ01JW9
 YvbtYkS5GP8/BM6rTLX0ewqdD59iZ534SOh/3ioDnHUqzkKwYSr//CBWZ6+QQ+kEUPF7
 n0Fv2Ua4V8iqQpKsi1nUxifqsLwwbcAvE1NLFQw1jGRTHD0v6lmzniVn6NnIUtPLH4M4
 nCvOXPKCnYxx+vJGhokmpzmbv6Pp5RbT1bAn97XvIIpsakEUrpLvdyRhFZrMX6bhKd2R
 Gey5FWGxEIWuQEE4dkuTFmCY+zJLlNIGI/bFsRsb67WH6Ogo6fss8xeqGDjXI0tpVDwP
 2Z0g==
X-Gm-Message-State: ACgBeo2WHseiurrSdpP7xA3pumr8VW/omz6sBKp1aSbgxlk7XC3WlDx0
 Uue+uD9P7VQxvRMMrFWL04c=
X-Google-Smtp-Source: AA6agR5pRppJmJE9UIUjFDwyw0xHn9NsShVNOrjT6eH3Z8Ajy3AlGKf3kmyhRCTHXG36iDf7T542Fg==
X-Received: by 2002:a05:6000:1564:b0:226:dece:5630 with SMTP id
 4-20020a056000156400b00226dece5630mr2162399wrz.294.1661796452280; 
 Mon, 29 Aug 2022 11:07:32 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb2008dcc9db01b9c79b4.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:8dcc:9db0:1b9c:79b4])
 by smtp.gmail.com with ESMTPSA id
 g42-20020a05600c4caa00b003a607e395ebsm9848691wmp.9.2022.08.29.11.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 11:07:31 -0700 (PDT)
Date: Mon, 29 Aug 2022 20:07:26 +0200
From: BB <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: QEMU Developers <qemu-devel@nongnu.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 "open list:sam460ex" <qemu-ppc@nongnu.org>
Subject: Re: [PATCH 8/9] hw/isa/vt82c686: QOM'ify RTC creation
User-Agent: K-9 Mail for Android
In-Reply-To: <2ced8da1-3b3a-6894-90f7-e8618b679f87@eik.bme.hu>
References: <20220822224355.11753-1-shentey@gmail.com>
 <20220822224355.11753-9-shentey@gmail.com>
 <96f054aa-41b5-b3c0-accc-46678485b87d@eik.bme.hu>
 <CAG4p6K4BhgTAXAApG4CyRH3bCgMF97wBV5Vm0caBc-krOgEX_Q@mail.gmail.com>
 <e65366d-9aed-4b6f-50e9-603756f281@eik.bme.hu>
 <C5B98752-D291-419B-B9EE-D62D137DADD3@gmail.com>
 <2ced8da1-3b3a-6894-90f7-e8618b679f87@eik.bme.hu>
Message-ID: <0BD1894B-2FF8-44F1-A1CD-1B9E1C2AA9D0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x429.google.com
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



Am 29=2E August 2022 19:50:10 MESZ schrieb BALATON Zoltan <balaton@eik=2Eb=
me=2Ehu>:
>On Mon, 29 Aug 2022, BB wrote:
>> Am 24=2E August 2022 01:23:14 MESZ schrieb BALATON Zoltan <balaton@eik=
=2Ebme=2Ehu>:
>>> On Tue, 23 Aug 2022, Bernhard Beschow wrote:
>>>> On Tue, Aug 23, 2022 at 2:20 AM BALATON Zoltan <balaton@eik=2Ebme=2Eh=
u> wrote:
>>>>> On Tue, 23 Aug 2022, Bernhard Beschow wrote:
>>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>>>> ---
>>>>>> hw/isa/vt82c686=2Ec | 12 +++++++++++-
>>>>>> 1 file changed, 11 insertions(+), 1 deletion(-)
>>>>>>=20
>>>>>> diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>>>>>> index 47f2fd2669=2E=2Eee745d5d49 100644
>>>>>> --- a/hw/isa/vt82c686=2Ec
>>>>>> +++ b/hw/isa/vt82c686=2Ec
>>>>>> @@ -546,6 +546,7 @@ struct ViaISAState {
>>>>>>     qemu_irq cpu_intr;
>>>>>>     qemu_irq *isa_irqs;
>>>>>>     ViaSuperIOState via_sio;
>>>>>> +    RTCState rtc;
>>>>>>     PCIIDEState ide;
>>>>>>     UHCIState uhci[2];
>>>>>>     ViaPMState pm;
>>>>>> @@ -567,6 +568,7 @@ static void via_isa_init(Object *obj)
>>>>>> {
>>>>>>     ViaISAState *s =3D VIA_ISA(obj);
>>>>>>=20
>>>>>> +    object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC=
);
>>>>>>     object_initialize_child(obj, "ide", &s->ide, "via-ide");
>>>>>>     object_initialize_child(obj, "uhci1", &s->uhci[0],
>>>>> "vt82c686b-usb-uhci");
>>>>>>     object_initialize_child(obj, "uhci2", &s->uhci[1],
>>>>> "vt82c686b-usb-uhci");
>>>>>> @@ -615,7 +617,15 @@ static void via_isa_realize(PCIDevice *d, Erro=
r
>>>>> **errp)
>>>>>>     isa_bus_irqs(isa_bus, s->isa_irqs);
>>>>>>     i8254_pit_init(isa_bus, 0x40, 0, NULL);
>>>>>>     i8257_dma_init(isa_bus, 0);
>>>>>> -    mc146818_rtc_init(isa_bus, 2000, NULL);
>>>>>> +
>>>>>> +    /* RTC */
>>>>>> +    qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
>>>>>> +    if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
>>>>>> +        return;
>>>>>> +    }
>>>>>> +    object_property_add_alias(qdev_get_machine(), "rtc-time",
>>>>> OBJECT(&s->rtc),
>>>>>> +                              "date");
>>>>>> +    isa_connect_gpio_out(ISA_DEVICE(&s->rtc), 0, s->rtc=2Eisairq);
>>>>>>=20
>>>>>>     for (i =3D 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
>>>>>>         if (i < PCI_COMMAND || i >=3D PCI_REVISION_ID) {
>>>>>>=20
>>>>>=20
>>>>> This actually introduces code duplication as all other places except=
 piix4
>>>>> seem to still use the init function (probably to ensure that the rtc=
-rime
>>>>> alias on the machine is properly set) so I'd keep this the same as
>>>>> everything else and drop this patch until this init function is remo=
ved
>>>>> from all other places as well=2E
>>>>>=20
>>>>=20
>>>> Hi Zoltan,
>>>>=20
>>>> Thanks for the fast reply! Regarding code homogeneity and duplication=
 I've
>>>> made a similar argument for mc146818_rtc_init() in the past [1] and I=
've
>>>> learnt that my patch went backwards=2E Incidentally, Peter mentioned =
vt686c
>>>> as a candidate for the embed-the-device-struct style which - again
>>>> incidentally - I've now done=2E
>>>=20
>>> I've seen patches embedding devices recently but in this case it looke=
d not that simple because of the rtc-time alias=2E
>>>=20
>>>> The rtc-time alias is actually only used by a couple of PPC machines =
where
>>>> Pegasos II is one of them=2E So the alias actually needs to be create=
d only
>>>> for these machines, and identifying the cases where it has to be pres=
erved
>>>> requires a lot of careful investigation=2E In the Pegasos II case thi=
s seems
>>>> especially complicated since one needs to look through several layers=
 of
>>>> devices=2E During my work on the VT82xx south bridges I've gained som=
e
>>>> knowledge such that I'd like to make this simplifying contribution=2E
>>>=20
>>> I've used it to implement the get-time-of-day rtas call with VOF in pe=
gasos2 because otherwise it would need to access internals of the RTC model=
 and/or duplicate some code=2E Here's the message discussing this:
>>>=20
>>> https://lists=2Enongnu=2Eorg/archive/html/qemu-ppc/2021-10/msg00170=2E=
html
>>>=20
>>> so this alias still seems to be the simplest way=2E
>>>=20
>>> I think the primary function of this alias is not these ppc machines b=
ut some QMP/HMP command or to make the guest time available from the monito=
r or something like that so it's probably also used from there and therefor=
e all rtc probably should have it but I'm not sure about it=2E
>>=20
>> Indeed, the alias seems to be a convenience for some QMP/HMP commands=
=2E AFAICS only the mc146818 sets the alias while it is probably not the on=
ly RTC modelled in QEMU=2E So I wonder why boards using another RTC don't n=
eed it and whether removing the alias constitutes a compatibility break=2E
>>=20
>>>> Our discussion makes me realize that the creation of the alias could =
now
>>>> actually be moved to the Pegasos II board=2E This way, the Pegasos II=
 board
>>>> would both create and consume that alias, which seems to remove quite=
 some
>>>> cognitive load=2E Do you agree? Would moving the alias to the board w=
ork for
>>>> you?
>>>=20
>>> Yes I think that would be better=2E This way the vt82xx and piix4 woul=
d be similar and the alias would also be clear within the pegasos2 code and=
 it also has the machine directly at that point so it's clearer that way=2E
>>=20
>> All in all I wonder if we need to preserve the alias for the fuloong2e =
board?
>
>I don't know=2E A quick investigation shows that it seems to be added by =
commit 654a36d857ff94 which suggests something may use it (or was intended =
to use it back then, but not sure if things have changed in the meantime)=
=2E I don't think any management app cares about fuloong2e but if this shou=
ld be a generic thing then all machine may need it=2E Then it's also mentio=
ned in commit 29551fdcf4d99 that suggests one ought to be careful moving th=
is around as it may cause unexpected problems=2E But doing it from the mach=
ine init should be OK=2E

Then I'll create the alias in fuloong2e, too=2E

Best regards,
Bernhard
>
>Regards,
>BALATON Zoltan

