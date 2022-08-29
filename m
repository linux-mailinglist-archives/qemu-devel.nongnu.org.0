Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7945E5A5353
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 19:38:33 +0200 (CEST)
Received: from localhost ([::1]:58542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSiiW-0000jF-CV
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 13:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oSiEd-0004AB-Tg; Mon, 29 Aug 2022 13:07:42 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oSiEa-0001Ux-Ei; Mon, 29 Aug 2022 13:07:38 -0400
Received: by mail-wr1-x434.google.com with SMTP id v16so8277988wrm.8;
 Mon, 29 Aug 2022 10:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc;
 bh=RjGj0qo2guE5uyURlAk2DfDhT9tWQ0U8Jw7WFrOYBeg=;
 b=TuF1tCnFi/GqzY1RleNnwADf4ag+nuJ7Iw9DZPl0vnwHlNErnBtz+aa0ME6DRy0laC
 EOaRYWf8pDaNrgL+ILizKxNdQUbCAUC0lYRTFeuscXkswEM76HDqmKHEsuYzuBnVhAW2
 cRTctanbYkUwhXedseH2YVDpvswWrAWy0i9UMBWl434Qtzp+8ruhCZSjBt5HwXRux7vz
 CYDfs0rCyirnUhOoAHeVMOkdOuSd3CCgaMzqaQLOxDQXqdHcvH9oWbXNoqxnhbxjc0cy
 eW7AFtvu762eY9gDo9L17W76valH8ptp8eSPxUfTUutaP10+QV9CAqt57MCKbRrN4wML
 HzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc;
 bh=RjGj0qo2guE5uyURlAk2DfDhT9tWQ0U8Jw7WFrOYBeg=;
 b=5i/QhL4Zj9nLfbACsQKMGoGbB/4gPZNKWS+5kvornwri3xQ1tin72nrcdx2bwvQz1x
 CWnp6vEXrD0Q0f1bhTUZYsKmbF8wSgkfz/4WaJD9ezChwTgDy5oU7sqYsIMT+KYJgFN5
 dmrhlDyLNY2jARN9Q6vhzDwFBByfHGwkZEJi6Det3wNpDU4ZpfgkvR+0vSeqaZE50dsV
 qhtL2QDU7kmJFamdROG//NI2Y8TGIUk/brTmeBeWDctT48LUwILrnfyeAiWE9mjkWcgF
 lOiFKydnBVhW7hfTFNdS28hskwSnVYm52FtBwoFiuaPdwo4GXFpNqWy/L5Bpacud0wI3
 XcDw==
X-Gm-Message-State: ACgBeo1pgXN2+45Lpv1N0acOvogo4irdUtVU9jIM9xCSwqwH1f93Pyif
 FsN5G0AlnH4oxi0a83NpTPc=
X-Google-Smtp-Source: AA6agR47X4ItLkH4NgrZzd88n4XtCY6Pq+w2d9l9BDR0DrOEPEOBITbW/Jl/a8ltOW8iW47jER2uNg==
X-Received: by 2002:a5d:6245:0:b0:225:3e24:e5b1 with SMTP id
 m5-20020a5d6245000000b002253e24e5b1mr7049451wrv.698.1661792854664; 
 Mon, 29 Aug 2022 10:07:34 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb2008dcc9db01b9c79b4.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:8dcc:9db0:1b9c:79b4])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a1c540c000000b003a2f2bb72d5sm10448096wmb.45.2022.08.29.10.07.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 10:07:34 -0700 (PDT)
Date: Mon, 29 Aug 2022 19:07:25 +0200
From: BB <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: QEMU Developers <qemu-devel@nongnu.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 "open list:sam460ex" <qemu-ppc@nongnu.org>
Subject: Re: [PATCH 8/9] hw/isa/vt82c686: QOM'ify RTC creation
User-Agent: K-9 Mail for Android
In-Reply-To: <e65366d-9aed-4b6f-50e9-603756f281@eik.bme.hu>
References: <20220822224355.11753-1-shentey@gmail.com>
 <20220822224355.11753-9-shentey@gmail.com>
 <96f054aa-41b5-b3c0-accc-46678485b87d@eik.bme.hu>
 <CAG4p6K4BhgTAXAApG4CyRH3bCgMF97wBV5Vm0caBc-krOgEX_Q@mail.gmail.com>
 <e65366d-9aed-4b6f-50e9-603756f281@eik.bme.hu>
Message-ID: <C5B98752-D291-419B-B9EE-D62D137DADD3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x434.google.com
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



Am 24=2E August 2022 01:23:14 MESZ schrieb BALATON Zoltan <balaton@eik=2Eb=
me=2Ehu>:
>On Tue, 23 Aug 2022, Bernhard Beschow wrote:
>> On Tue, Aug 23, 2022 at 2:20 AM BALATON Zoltan <balaton@eik=2Ebme=2Ehu>=
 wrote:
>>> On Tue, 23 Aug 2022, Bernhard Beschow wrote:
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>> ---
>>>> hw/isa/vt82c686=2Ec | 12 +++++++++++-
>>>> 1 file changed, 11 insertions(+), 1 deletion(-)
>>>>=20
>>>> diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>>>> index 47f2fd2669=2E=2Eee745d5d49 100644
>>>> --- a/hw/isa/vt82c686=2Ec
>>>> +++ b/hw/isa/vt82c686=2Ec
>>>> @@ -546,6 +546,7 @@ struct ViaISAState {
>>>>     qemu_irq cpu_intr;
>>>>     qemu_irq *isa_irqs;
>>>>     ViaSuperIOState via_sio;
>>>> +    RTCState rtc;
>>>>     PCIIDEState ide;
>>>>     UHCIState uhci[2];
>>>>     ViaPMState pm;
>>>> @@ -567,6 +568,7 @@ static void via_isa_init(Object *obj)
>>>> {
>>>>     ViaISAState *s =3D VIA_ISA(obj);
>>>>=20
>>>> +    object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
>>>>     object_initialize_child(obj, "ide", &s->ide, "via-ide");
>>>>     object_initialize_child(obj, "uhci1", &s->uhci[0],
>>> "vt82c686b-usb-uhci");
>>>>     object_initialize_child(obj, "uhci2", &s->uhci[1],
>>> "vt82c686b-usb-uhci");
>>>> @@ -615,7 +617,15 @@ static void via_isa_realize(PCIDevice *d, Error
>>> **errp)
>>>>     isa_bus_irqs(isa_bus, s->isa_irqs);
>>>>     i8254_pit_init(isa_bus, 0x40, 0, NULL);
>>>>     i8257_dma_init(isa_bus, 0);
>>>> -    mc146818_rtc_init(isa_bus, 2000, NULL);
>>>> +
>>>> +    /* RTC */
>>>> +    qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
>>>> +    if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
>>>> +        return;
>>>> +    }
>>>> +    object_property_add_alias(qdev_get_machine(), "rtc-time",
>>> OBJECT(&s->rtc),
>>>> +                              "date");
>>>> +    isa_connect_gpio_out(ISA_DEVICE(&s->rtc), 0, s->rtc=2Eisairq);
>>>>=20
>>>>     for (i =3D 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
>>>>         if (i < PCI_COMMAND || i >=3D PCI_REVISION_ID) {
>>>>=20
>>>=20
>>> This actually introduces code duplication as all other places except p=
iix4
>>> seem to still use the init function (probably to ensure that the rtc-r=
ime
>>> alias on the machine is properly set) so I'd keep this the same as
>>> everything else and drop this patch until this init function is remove=
d
>>> from all other places as well=2E
>>>=20
>>=20
>> Hi Zoltan,
>>=20
>> Thanks for the fast reply! Regarding code homogeneity and duplication I=
've
>> made a similar argument for mc146818_rtc_init() in the past [1] and I'v=
e
>> learnt that my patch went backwards=2E Incidentally, Peter mentioned vt=
686c
>> as a candidate for the embed-the-device-struct style which - again
>> incidentally - I've now done=2E
>
>I've seen patches embedding devices recently but in this case it looked n=
ot that simple because of the rtc-time alias=2E
>
>> The rtc-time alias is actually only used by a couple of PPC machines wh=
ere
>> Pegasos II is one of them=2E So the alias actually needs to be created =
only
>> for these machines, and identifying the cases where it has to be preser=
ved
>> requires a lot of careful investigation=2E In the Pegasos II case this =
seems
>> especially complicated since one needs to look through several layers o=
f
>> devices=2E During my work on the VT82xx south bridges I've gained some
>> knowledge such that I'd like to make this simplifying contribution=2E
>
>I've used it to implement the get-time-of-day rtas call with VOF in pegas=
os2 because otherwise it would need to access internals of the RTC model an=
d/or duplicate some code=2E Here's the message discussing this:
>
>https://lists=2Enongnu=2Eorg/archive/html/qemu-ppc/2021-10/msg00170=2Ehtm=
l
>
>so this alias still seems to be the simplest way=2E
>
>I think the primary function of this alias is not these ppc machines but =
some QMP/HMP command or to make the guest time available from the monitor o=
r something like that so it's probably also used from there and therefore a=
ll rtc probably should have it but I'm not sure about it=2E

Indeed, the alias seems to be a convenience for some QMP/HMP commands=2E A=
FAICS only the mc146818 sets the alias while it is probably not the only RT=
C modelled in QEMU=2E So I wonder why boards using another RTC don't need i=
t and whether removing the alias constitutes a compatibility break=2E=20

>> Our discussion makes me realize that the creation of the alias could no=
w
>> actually be moved to the Pegasos II board=2E This way, the Pegasos II b=
oard
>> would both create and consume that alias, which seems to remove quite s=
ome
>> cognitive load=2E Do you agree? Would moving the alias to the board wor=
k for
>> you?
>
>Yes I think that would be better=2E This way the vt82xx and piix4 would b=
e similar and the alias would also be clear within the pegasos2 code and it=
 also has the machine directly at that point so it's clearer that way=2E

All in all I wonder if we need to preserve the alias for the fuloong2e boa=
rd?

Best regards,
Bernhard
>
>Regards,
>BALATON Zoltan

