Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D1868E467
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 00:28:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPXNZ-0002aJ-Il; Tue, 07 Feb 2023 18:28:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pPXNX-0002Zu-JX
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:27:59 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pPXNV-000142-5D
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:27:59 -0500
Received: by mail-ed1-x52b.google.com with SMTP id eq11so18280542edb.6
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 15:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kgwg4vffpxn8dK8UgPhUeVFkjql6D8Z03o59CUsaU9M=;
 b=X66C52IWcT7/4vAriFvEwZ9drxXqDMjW8PozC9QOGhqfhgE4ijiE+LMkpfA4hHBjGS
 cByf2VJA4TmbRBb64uXgAUal/izfC1j4R+mjyQamIOTPzsjLu7G3nsDW7YziuvB65N0r
 D3BHYqqTGCAzAM+3uSx7GZ6H0vmiAe8bcd71219F72JyLjZQIfRneO3CR0pdCAyo6tKQ
 KTcggwc+eCVsmfu/U1Kti7JozFf+i9KNJr6DOQ1YAXAE3USCez2v9WS6e9QUKh4s4vAi
 5FSxRsfeJtfa2pCTV10LYmRkEW4AG6XMiZwzsIL3rdYy9MNpgSX+Lz0lzsbmDkI7Xo/m
 048w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kgwg4vffpxn8dK8UgPhUeVFkjql6D8Z03o59CUsaU9M=;
 b=6DVFBNXnOi0ACqY968YZdsnf1TvZT4XgPQgRu6A0QKVe59U+WozRr8NF2+46jc4UGb
 HVLI31iRzRfN11nbaTtPDSr1d3HqimUlnkhOPd9sLhiVjPKevntvK73rUL2IodiZWCd+
 pfbYtAt/CsdQFVoiP+KSzif2/Jt8o1DnJ+dgFJMsnLzD875k0NPNNfX6jf6kqJ3MIm9v
 2lKX4wAMrtg7hVZX0pktz6fYCFN3fjQz9izXX1fVTaepgpKYRmc+hzGz5eIjcg6MqNU6
 NJgNgKSa6lXOhjQ5brQB4+8afY/FmpfWQFhp8RDg1wDqmNY8xMW484zrvtTzItg9duXC
 WbnQ==
X-Gm-Message-State: AO0yUKVHRibn3H5j4VbYmXIXhqU2eRj2eKr8CmK8mhLJpJuZncNFFdUk
 D7nopfcgtps1Rx2V0a6DaLI=
X-Google-Smtp-Source: AK7set9dvWUxBXkDGLKpjHGryaSLDCNW4cC6Vr4gop1u7eKiRxtK5RBAZyu2f74jQNxtTKS0fHsBCw==
X-Received: by 2002:a50:c358:0:b0:49b:b274:b816 with SMTP id
 q24-20020a50c358000000b0049bb274b816mr5475966edb.37.1675812475622; 
 Tue, 07 Feb 2023 15:27:55 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-014-074-246.89.14.pool.telefonica.de.
 [89.14.74.246]) by smtp.gmail.com with ESMTPSA id
 et6-20020a056402378600b004a21263bbaasm7020355edb.49.2023.02.07.15.27.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 15:27:53 -0800 (PST)
Date: Tue, 07 Feb 2023 23:27:45 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH 3/3] hw/isa/vt82c686: Implement ACPI powerdown
In-Reply-To: <c598204b-4ca8-e054-30f1-b02e47b11f56@eik.bme.hu>
References: <20230129213418.87978-1-shentey@gmail.com>
 <20230129213418.87978-4-shentey@gmail.com>
 <c598204b-4ca8-e054-30f1-b02e47b11f56@eik.bme.hu>
Message-ID: <3A23DF03-D56D-48A3-97CF-47E338C1FDB7@gmail.com>
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



Am 31=2E Januar 2023 14:58:01 UTC schrieb BALATON Zoltan <balaton@eik=2Ebm=
e=2Ehu>:
>On Sun, 29 Jan 2023, Bernhard Beschow wrote:
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>> hw/isa/vt82c686=2Ec | 15 +++++++++++++++
>> 1 file changed, 15 insertions(+)
>>=20
>> diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>> index b0765d4ed8=2E=2E2db54d1649 100644
>> --- a/hw/isa/vt82c686=2Ec
>> +++ b/hw/isa/vt82c686=2Ec
>> @@ -33,8 +33,10 @@
>> #include "qapi/error=2Eh"
>> #include "qemu/log=2Eh"
>> #include "qemu/module=2Eh"
>> +#include "qemu/notify=2Eh"
>> #include "qemu/range=2Eh"
>> #include "qemu/timer=2Eh"
>> +#include "sysemu/runstate=2Eh"
>> #include "trace=2Eh"
>>=20
>> #define ACPI_ENABLE 0xf1
>> @@ -50,6 +52,8 @@ struct ViaPMState {
>>     APMState apm;
>>     PMSMBus smb;
>>=20
>> +    Notifier powerdown_notifier;
>> +
>>     qemu_irq irq;
>
>Is there a reason to leave blank lines here? Do they separate any logical=
 blocks? If not please just drop them to allow mire lines to fit in one scr=
een=2E

I could stick closer to piix4 here indeed=2E

>> };
>>=20
>> @@ -198,6 +202,14 @@ static void via_pm_reset(DeviceState *d)
>>     smb_io_space_update(s);
>> }
>>=20
>> +static void via_pm_powerdown_req(Notifier *n, void *opaque)
>> +{
>> +    ViaPMState *s =3D container_of(n, ViaPMState, powerdown_notifier);
>> +
>> +    assert(s !=3D NULL);
>
>Only piix4 seems to assert in this callback, all others assume this will =
work and indeed you register it from the realize method of the same object =
with its already type checked state struct so this should not need to check=
 again so I think asserting here is overcautiousness=2E

Yes, I took a lot of inspitation from piix4=2E Piix4 also sets up the noti=
fier in its realize method, so the situation here and there should be the s=
ame=2E I'd therefore tend to keep the code consistent=2E Also, an assert do=
es communicate intention=2E

>
>As said in the cover all these are just small things I came across, sorry=
 I can't give a better review of this=2E

Thanks still!

Best regards,
Bernhard

P=2ES=2E: Any news from the via-ac97 side? Mind rebasing onto 7=2E2, even =
if it's still work in progress?

>
>Regards,
>BALATON Zoltan
>
>> +    acpi_pm1_evt_power_down(&s->ar);
>> +}
>> +
>> static void via_pm_realize(PCIDevice *dev, Error **errp)
>> {
>>     ViaPMState *s =3D VIA_PM(dev);
>> @@ -218,6 +230,9 @@ static void via_pm_realize(PCIDevice *dev, Error **=
errp)
>>     acpi_pm_tmr_init(&s->ar, pm_tmr_timer, &s->io);
>>     acpi_pm1_evt_init(&s->ar, pm_tmr_timer, &s->io);
>>     acpi_pm1_cnt_init(&s->ar, &s->io, false, false, 2, false);
>> +
>> +    s->powerdown_notifier=2Enotify =3D via_pm_powerdown_req;
>> +    qemu_register_powerdown_notifier(&s->powerdown_notifier);
>> }
>>=20
>> static void via_pm_init(Object *obj)
>>=20

