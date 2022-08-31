Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBA25A8785
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 22:25:55 +0200 (CEST)
Received: from localhost ([::1]:47364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTUHV-0005Lu-6G
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 16:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTTcd-0001ix-F6; Wed, 31 Aug 2022 15:43:35 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:34389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTTcb-0007Ij-Kh; Wed, 31 Aug 2022 15:43:35 -0400
Received: by mail-ej1-x62f.google.com with SMTP id y3so30497228ejc.1;
 Wed, 31 Aug 2022 12:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc;
 bh=7krzvx99A79a1Rrl0RWcwz4lBRpTJk7/KipTWVy8K7c=;
 b=q6nuzT916/J4PByiEfyArLXG9yjQK4b1W4yOiY72/y4IsnlUcyKWhuwHMAhFQZdS9y
 AABpYYpK4YRJsGIcK1lpwWVneSwLa88GT3PhuK4OmyDHtzwfda6sDfb4doKHqjFWFIC0
 DeqzIJGi3PGLZo9O/VKgHgB1IMsYR0irCtwFxGFUEQT6rGfD3FbqeqqGblV0qacVNRxc
 XiwOTCwrYdo7YFILjvuaJu5PlV8iD5rf92Ch2zv3DZ15XB6AArCd+uArChVsNGTJOMYV
 4udi8P+O7F6TlSjsHxeH+jaRp/RNiEXWCKi8niI7gUkP1wpiJ/Q+K2Y4c+jJ1yzyRgLa
 4eOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=7krzvx99A79a1Rrl0RWcwz4lBRpTJk7/KipTWVy8K7c=;
 b=2uSviNA+tLnforQvs7KKcEhT9RelfQhx4rW5y4yTysWL7/Vx+lYPC69RLhX2CZ3/g9
 h/gF5XJaY8MeRJmhuJBXAYDTvfxmBjiLdNklQ2haddxnVIUaQl/lIhi0ahokicFY3tbk
 IdniAcGRxa2tai/f+B1sBZv0NcIcRwPS/jQq15I/OBwFECZ6i4FVBj3FvUtH4U0tb4zO
 wJ6hS92KaH5Xya/pIVa0mxH+lspcPBbf/LhGQwZ6KKx+r7Ttwc5f9uHRBE5mGl2TXi60
 LrcRW/sI0vSa/Qjq+sFP7wxVa9a7vk5T8oJP4gciJth3VPODbP3ueCkwSXH1V7BiTGg3
 EWhA==
X-Gm-Message-State: ACgBeo3+QqIBr2GQ78FZB874X/FJpJbrXtTO+kywrTbWYGFLFVly0Hbe
 8TjQgVtL+XCfmSSgl7HLCTM=
X-Google-Smtp-Source: AA6agR5AiPwmE1aXFqMo9pgdZvnlnZQ+tF/K6mvFsnV7knz7yA/3Qm7UbJhM9Gi6N10KZ8LTqk9pfw==
X-Received: by 2002:a17:907:6eaa:b0:741:5338:6259 with SMTP id
 sh42-20020a1709076eaa00b0074153386259mr14925185ejc.20.1661975009754; 
 Wed, 31 Aug 2022 12:43:29 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb200f8445a4dc5cd9ab4.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:f844:5a4d:c5cd:9ab4])
 by smtp.gmail.com with ESMTPSA id
 t23-20020aa7db17000000b00445b3cab975sm65287eds.56.2022.08.31.12.43.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 12:43:29 -0700 (PDT)
Date: Wed, 31 Aug 2022 18:52:11 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>, qemu-ppc@nongnu.org, 
 Huacai Chen <chenhuacai@kernel.org>, qemu-block@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_12/12=5D_hw/isa/vt82c686=3A_?=
 =?US-ASCII?Q?Create_rtc-time_alias_in_boards_instead?=
In-Reply-To: <7627bf2-d76f-f178-6c5d-bd3cd56686ba@eik.bme.hu>
References: <20220831154605.12773-1-shentey@gmail.com>
 <20220831154605.12773-13-shentey@gmail.com>
 <7627bf2-d76f-f178-6c5d-bd3cd56686ba@eik.bme.hu>
Message-ID: <4746BF28-005C-4F05-BFFF-2DB49CD40325@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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

Am 31=2E August 2022 16:30:10 UTC schrieb BALATON Zoltan <balaton@eik=2Ebme=
=2Ehu>:
>On Wed, 31 Aug 2022, Bernhard Beschow wrote:
>> According to good QOM practice, an object should only deal with objects
>> of its own sub tree=2E Having devices create an alias on the machine
>> object doesn't respect this good practice=2E To resolve this, create th=
e
>> alias in the machine's code=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>> hw/isa/vt82c686=2Ec   | 2 --
>> hw/mips/fuloong2e=2Ec | 4 ++++
>> hw/ppc/pegasos2=2Ec   | 4 ++++
>> 3 files changed, 8 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>> index 48cd4d0036=2E=2E3f9bd0c04d 100644
>> --- a/hw/isa/vt82c686=2Ec
>> +++ b/hw/isa/vt82c686=2Ec
>> @@ -632,8 +632,6 @@ static void via_isa_realize(PCIDevice *d, Error **e=
rrp)
>>     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
>>         return;
>>     }
>> -    object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT(&=
s->rtc),
>> -                              "date");
>>     isa_connect_gpio_out(ISA_DEVICE(&s->rtc), 0, s->rtc=2Eisairq);
>>=20
>>     for (i =3D 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
>> diff --git a/hw/mips/fuloong2e=2Ec b/hw/mips/fuloong2e=2Ec
>> index 2d8723ab74=2E=2E0f4cfe1188 100644
>> --- a/hw/mips/fuloong2e=2Ec
>> +++ b/hw/mips/fuloong2e=2Ec
>> @@ -203,6 +203,10 @@ static void vt82c686b_southbridge_init(PCIBus *pci=
_bus, int slot, qemu_irq intc,
>>=20
>>     via =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0)=
, true,
>>                                           TYPE_VT82C686B_ISA);
>> +    object_property_add_alias(qdev_get_machine(), "rtc-time",
>> +                              object_resolve_path_component(OBJECT(via=
),
>> +                                                            "rtc"),
>> +                              "date");
>>     qdev_connect_gpio_out(DEVICE(via), 0, intc);
>>=20
>>     dev =3D PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"=
));
>> diff --git a/hw/ppc/pegasos2=2Ec b/hw/ppc/pegasos2=2Ec
>> index 09fdb7557f=2E=2Ef50e1d8b3f 100644
>> --- a/hw/ppc/pegasos2=2Ec
>> +++ b/hw/ppc/pegasos2=2Ec
>> @@ -161,6 +161,10 @@ static void pegasos2_init(MachineState *machine)
>>     /* VIA VT8231 South Bridge (multifunction PCI device) */
>>     via =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), =
true,
>>                                           TYPE_VT8231_ISA);
>> +    object_property_add_alias(qdev_get_machine(), "rtc-time",
>
>I did not check it in previous version but Phillppe noted this qdev_get_m=
achine() should be machine (the parameter to pegasos2_init) instead and I a=
gree with that=2E

Sounds good! I'm all about removing access to globals=2E

>Also if you get rid of the now very much cut down vt82c686b_southbridge_i=
nit func in fuloong2e and just inline what's left of it at the only call si=
te then the same machine pointer could be used there too and would be simpl=
er then going through the function now that it's moved to via-isa mostly=2E

Sure, I'll add another patch on top=2E

>Sorry that this needs another respin but that's the last, I won't look at=
 it again :-)

No worries=2E It's very convenient with git-publish=2E

>You can also add to the whole series:
>
>Reviewed-by: BALATON Zoltan <balaton@eik=2Ebme=2Ehu>

Will do=2E Thanks for your quick replies!

Regards,
Bernhard

>Regards,
>BALATON Zoltan
>
>> +                              object_resolve_path_component(OBJECT(via=
),
>> +                                                            "rtc"),
>> +                              "date");
>>     qdev_connect_gpio_out(DEVICE(via), 0,
>>                           qdev_get_gpio_in_named(pm->mv, "gpp", 31));
>>=20
>>=20


