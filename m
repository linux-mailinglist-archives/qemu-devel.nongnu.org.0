Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239B565B54B
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 17:48:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCNyH-0007Xm-Nq; Mon, 02 Jan 2023 11:47:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCNyB-0007Wm-Bu
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 11:47:27 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCNy7-0003ru-VF
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 11:47:25 -0500
Received: by mail-ed1-x52b.google.com with SMTP id u28so35687012edd.10
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 08:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ODEMB9gPUDbuZ1xctkKfrlGY2oDGSZHCvx04qGveYFI=;
 b=N4Y9CsP5VU/yXL8TYMmQUR8Gbj0n5g6ub7+l8LI32SsRqcbZP6/iCxrNnQqJk441d1
 LVYS115bIruJqWEnzdl1UdOosCellF1M88JyJql0ko1oObtdy8pMIhYZX9PWMCqRwmR7
 80qEuGpFHK7uoypWfr6Ym/O9k5hGxriCZbZ8XfKLfcpMdfrwCdGzWhNtvdDg3aa6G0Ys
 5rOtOvW5E6iawn26YVqgvUcmsiXBWxPEKnNMr+lvU58peSe4j8BJYYB0rUUwd4WD2PE6
 WoJ58WmSjRfcM2jI1py16IGMlDLCV5PlYAUZuzbqUA7obogu9bi2u50JfOyzQueGYU4j
 jpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ODEMB9gPUDbuZ1xctkKfrlGY2oDGSZHCvx04qGveYFI=;
 b=4zk1NRXdo5SHdZ6KGTTCVS6A8lMaXURkXwZ1hL7iLmVzveFSr4CeSbusFhdHlviggI
 /CFLl/2S/MZfy5txqXF71TWTcs/GFwb0FZrq9gwyaAiBYvW2isbqXso939Hol040i2o/
 Xr3zGh5XdPciXcSAv5BHxdxaLOihMAD8M4asv6t+DYI/sHNDXMjwgF/COSnTQzkxsfTz
 JczpUliG/V2/BGNC9/6RJmhdKxAMtZecVkqeo1P85ZZDD/TMpUdktjzC7+MLQcN1C50y
 u+plxCRddRwn6HP5xFSeDu7EK17acRm/I6sAatJXs8oEBnwvL5PGkjvJh1U5FqDkgYma
 5BOQ==
X-Gm-Message-State: AFqh2kq7bTTig0mmWy5BM9uqn9lbdutVTYvwTWMzb9WBT2jjUEAUKoyZ
 YEq+8qGZjSdYQzRQt9/K7sw=
X-Google-Smtp-Source: AMrXdXscZCswf0vVSVPd4FxPxxzQXZgw3dCr9GQXnb5Pq0z0nKt20tPnZAZ5N7K5HY37J/kNhtgl/A==
X-Received: by 2002:a05:6402:1298:b0:470:411f:3609 with SMTP id
 w24-20020a056402129800b00470411f3609mr38120413edv.1.1672678041193; 
 Mon, 02 Jan 2023 08:47:21 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb20015597579848d59e3.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:1559:7579:848d:59e3])
 by smtp.gmail.com with ESMTPSA id
 co5-20020a0564020c0500b00483dd234ac6sm10457226edb.96.2023.01.02.08.47.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 08:47:20 -0800 (PST)
Date: Mon, 02 Jan 2023 16:47:12 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: Michael S Tsirkin <mst@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4=5D_hw/rtc/mc146818rtc=3A_Ma?=
 =?US-ASCII?Q?ke_this_rtc_device_target_independent?=
In-Reply-To: <1328eea1-437d-6c43-a542-9e1a4d1d751e@redhat.com>
References: <20221229105848.147509-1-thuth@redhat.com>
 <52276B51-B29A-47BD-B5A6-EA2E7A3E69CC@gmail.com>
 <aa12364c-ff9b-3252-1fa0-7d72876b0796@redhat.com>
 <1328eea1-437d-6c43-a542-9e1a4d1d751e@redhat.com>
Message-ID: <BF0EC181-629C-4D5F-9D19-A0B861D0E835@gmail.com>
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



Am 2=2E Januar 2023 16:09:08 UTC schrieb Thomas Huth <thuth@redhat=2Ecom>:
>On 02/01/2023 14=2E36, Thomas Huth wrote:
>> On 31/12/2022 00=2E45, Bernhard Beschow wrote:
>>>=20
>>> Am 29=2E Dezember 2022 10:58:48 UTC schrieb Thomas Huth <thuth@redhat=
=2Ecom>:
>[=2E=2E=2E]
>>>> static uint32_t rtc_periodic_clock_ticks(RTCState *s)
>>>> {
>>>> @@ -922,14 +911,15 @@ static void rtc_realizefn(DeviceState *dev, Err=
or **errp)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 rtc_set_date_from_host(isadev);
>>>>=20
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 switch (s->lost_tick_policy) {
>>>> -#ifdef TARGET_I386
>>>> -=C2=A0=C2=A0=C2=A0 case LOST_TICK_POLICY_SLEW:
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->coalesced_timer =3D
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t=
imer_new_ns(rtc_clock, rtc_coalesced_timer, s);
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> -#endif
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 case LOST_TICK_POLICY_DISCARD:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> +=C2=A0=C2=A0=C2=A0 case LOST_TICK_POLICY_SLEW:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Slew tick policy is on=
ly available on x86 */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (arch_type =3D=3D QEMU=
_ARCH_I386) {
>>>=20
>>> This reflects the intention much better than before, which is nice=2E
>>>=20
>>> How does `arch_type` play together with qemu-system-all? IIUC it shoul=
d be possible to load all arch backends simultaneously while `arch_type` is=
 an external symbol defined by each arch backend differently=2E So this see=
ms to conflict=2E
>>=20
>> I assume that there still will be a main arch_type for the current sele=
cted machine? =2E=2E=2E not sure how this will exactly work, though =2E=2E=
=2E
>>=20
>>> Can we just add a property such as "slew-tick-policy-available" instea=
d? It should default to false and all x86 machines would need to opt in exp=
licitly=2E
>>=20
>> Sounds like a good idea, it's certainly better than checking arch_type =
here =2E=2E=2E I'll give it a try, thanks!
>
>I've now had a look at this, and it's also getting ugly: Since the proper=
ty has to be set before realize() is done, the setting of the property has =
to be added to the mc146818_rtc_init() function=2E Thus this function would=
 need a new parameter - and it then needs to be changed all over the place,=
 i=2Ee=2E also for all the non-x86 machines, defeating the idea of a defaul=
t value=2E=2E=2E
>
>Maybe it makes more sense to check for a TYPE_X86_MACHINE machine type in=
stead?

Maybe you could base your patch on https://lists=2Egnu=2Eorg/archive/html/=
qemu-devel/2022-12/msg03795=2Ehtml ? This patch looks like it should get yo=
u covered and is part of my PIIX consolidation series [1] which seems to be=
 ready to be queued into Phil's mips-next tree=2E My series is currently ju=
st blocked by a MIPS-related  regression=2E

Best regards,
Bernhard

[1] https://lists=2Egnu=2Eorg/archive/html/qemu-devel/2022-12/msg03788=2Eh=
tml

>
> Thomas
>

