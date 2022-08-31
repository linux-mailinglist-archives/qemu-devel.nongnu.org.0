Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A635A8122
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 17:23:11 +0200 (CEST)
Received: from localhost ([::1]:55910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTPYc-0007k6-As
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 11:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPVR-0004xB-8Q; Wed, 31 Aug 2022 11:19:55 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPVP-0006dy-EH; Wed, 31 Aug 2022 11:19:52 -0400
Received: by mail-ej1-x62b.google.com with SMTP id kk26so29024859ejc.11;
 Wed, 31 Aug 2022 08:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc;
 bh=5Ulo6bzayoZVOh8fP43R4YyCDxgBx8+UO55PxGrYL0E=;
 b=Dtfo2eu64PCY7Oth30TZBxAa9BxmUvK4awIkl/e44NHwzMkCDdvbq4j+JQMmXiUyHY
 5DHIeKs0vsdDws2VtjbJ+YUVhyt9MYTEmAgbWH+JJDO7/25vG7vOLeBB/ITuRfzAGcMO
 d29vFr2PiqOuYbgNBj+xnpFOsG5/R4WxlmOJi9KEdti5YjyS1gEFQdDqMcDznHOgGaA0
 Ll2H27Q4hMWqs3T3vate5o9ogV6VNvjKeyFJAn8OqaNT2Aj+/DwcxZuSMOY3qP3uE2Ww
 C0mimLjGSByZqGk77kKems7LRAbptAS/zf+zciPsPlEgPTXysj7/7aIy121spSXx19xs
 3Yfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc;
 bh=5Ulo6bzayoZVOh8fP43R4YyCDxgBx8+UO55PxGrYL0E=;
 b=hCOTtuOtplRlAXLUvRKXgKfcyau0/U6evEbB4BMbZSx21DyiwT/L5Wmpto74PBDM5Y
 sCAz+vMLX/uxDPRtQnepHmm8sE/aJWtQFd3V88qKTfhxcKQ4yf9oIoBsROCxH88B6RT9
 YIhcveCE8Apr/GUd98hGfpQb+qEfoj6VTSf0kHDJqG47PcGpHavq9vuEcNJ9XW4QBhD6
 TIZcqL9zKZgzyNVbBz8swvQe8JS5EHZWOQJNxrW7AykP1RFR3xlgLfnXf0G9jcZlsfnm
 t2F9TTozjagoA7iRSnSRAbdzn+tjK5rPDxf9yEFswq79/fN66976/5W3hQyFS3gP/fS2
 OXJA==
X-Gm-Message-State: ACgBeo22Ux4Et7J70PDbV3CnFQcRcawE2twqamm8pMxw0KKPdMYbPkgS
 i74KRRFs5BWx7zW8qpM+++8=
X-Google-Smtp-Source: AA6agR71Mb/VzwGagj0kKhme9AI6xFcN6y7iNU/R+qR/H8mK6fFLe7tmdmNvSkL8fugtYC/f2aLsDg==
X-Received: by 2002:a17:906:8a4e:b0:740:2450:d69a with SMTP id
 gx14-20020a1709068a4e00b007402450d69amr16465946ejc.523.1661959188887; 
 Wed, 31 Aug 2022 08:19:48 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb200a5066d0f8b32ea85.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:a506:6d0f:8b32:ea85])
 by smtp.gmail.com with ESMTPSA id
 ec14-20020a0564020d4e00b004483a543794sm6679293edb.96.2022.08.31.08.19.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 08:19:48 -0700 (PDT)
Date: Wed, 31 Aug 2022 17:19:44 +0200
From: BB <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_06/10=5D_hw/isa/vt82c686=3A_I?=
 =?US-ASCII?Q?nstantiate_USB_functions_in_host_device?=
User-Agent: K-9 Mail for Android
In-Reply-To: <48b1c17d-fa2f-c2f7-b22-79eb6e8f55b@eik.bme.hu>
References: <20220831095914.2041-1-shentey@gmail.com>
 <20220831095914.2041-7-shentey@gmail.com>
 <331bbd5a-aeaa-d5c0-cf8f-cde5b22d8a3@eik.bme.hu>
 <96C4E9E5-4875-4B49-B176-673BAAEE7993@gmail.com>
 <48b1c17d-fa2f-c2f7-b22-79eb6e8f55b@eik.bme.hu>
Message-ID: <5DE06ABD-34E9-4186-9922-B62C92A56798@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
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



Am 31=2E August 2022 17:03:35 MESZ schrieb BALATON Zoltan <balaton@eik=2Eb=
me=2Ehu>:
>On Wed, 31 Aug 2022, BB wrote:
>> Am 31=2E August 2022 15:23:37 MESZ schrieb BALATON Zoltan <balaton@eik=
=2Ebme=2Ehu>:
>>> On Wed, 31 Aug 2022, Bernhard Beschow wrote:
>>>> The USB functions can be enabled/disabled through the ISA function=2E=
 Also
>>>> its interrupt routing can be influenced there=2E
>>>>=20
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>> ---
>>>> hw/isa/vt82c686=2Ec   | 12 ++++++++++++
>>>> hw/mips/fuloong2e=2Ec |  3 ---
>>>> hw/ppc/pegasos2=2Ec   |  4 ----
>>>> 3 files changed, 12 insertions(+), 7 deletions(-)
>>>>=20
>>>> diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>>>> index 9d946cea54=2E=2E66a4b9c230 100644
>>>> --- a/hw/isa/vt82c686=2Ec
>>>> +++ b/hw/isa/vt82c686=2Ec
>>>> @@ -23,6 +23,7 @@
>>>> #include "hw/intc/i8259=2Eh"
>>>> #include "hw/irq=2Eh"
>>>> #include "hw/dma/i8257=2Eh"
>>>> +#include "hw/usb/hcd-uhci=2Eh"
>>>> #include "hw/timer/i8254=2Eh"
>>>> #include "hw/rtc/mc146818rtc=2Eh"
>>>> #include "migration/vmstate=2Eh"
>>>> @@ -546,6 +547,7 @@ struct ViaISAState {
>>>>     qemu_irq *isa_irqs;
>>>>     ViaSuperIOState via_sio;
>>>>     PCIIDEState ide;
>>>> +    UHCIState uhci[2];
>>>> };
>>>>=20
>>>> static const VMStateDescription vmstate_via =3D {
>>>> @@ -563,6 +565,8 @@ static void via_isa_init(Object *obj)
>>>>     ViaISAState *s =3D VIA_ISA(obj);
>>>>=20
>>>>     object_initialize_child(obj, "ide", &s->ide, "via-ide");
>>>> +    object_initialize_child(obj, "uhci1", &s->uhci[0], "vt82c686b-us=
b-uhci");
>>>> +    object_initialize_child(obj, "uhci2", &s->uhci[1], "vt82c686b-us=
b-uhci");
>>>=20
>>> Sorry for not saying this yesterday, this can also be done separately =
so no need for another version of this series if not needed for another rea=
son but could we add a define for vt82c686b-usb-uhci in include/hw/isa/vt82=
c686=2Eh and use that here and in hw/usb/vt82c686-uhci-pci=2Ec ?
>>=20
>> Would creating a dedicated header work, too? Board code doesn't need to=
 see the define any longer=2E
>
>I don't think it needs a separate header just for this so I'd put it in v=
t82c686=2Eh but I don't mind either way=2E

Alright, I'll take the easy route for now=2E Splitting in dedicated header=
s (also for the other devices) could be done in a separate series=2E

Regards,
Bernhard
>
>Regards,
>BALATON Zoltan

