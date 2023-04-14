Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2716E2445
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 15:30:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnJUn-0007Mt-6e; Fri, 14 Apr 2023 09:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pnJUk-0007Mb-Uz
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 09:29:43 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pnJUj-0004YZ-0o
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 09:29:42 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-94a34d3812dso420638566b.3
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 06:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681478977; x=1684070977;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wR9rLLq/18dK2OgK+g7yUhHJl1zx5SpaEVRYyHgnMYI=;
 b=MxkL0SXeq8As8eFPTQnrzjx4zOr0zjo5E1QhFn3nG+6ISgozpdRLwNRH0SpIsXaAfB
 AECmBJWzLqWRd7GF8Rumgbno+2ybkOYSI2m9FhPIGiGW8THEU06bcYoSbbH9EvYhdx4X
 QgzafiARPgeGZ9ZlYzm51yYAYSK4cbCj/4bAm9/EIwqN3MSPpP/qeZ1mB3vJgzI2c7RU
 i/e2WKMoxgt2OcRtKjpjur2ndokQbdyIGwBgUsZY7TgOhA4LgSLFsIDQWdsc/usLsZku
 HlA/IdWvT1BK9QvxtvuCrdzPbAcS+y1r1cc57pdxx3THk54hnzcSVQYZK868vL9yXou2
 K/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681478977; x=1684070977;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wR9rLLq/18dK2OgK+g7yUhHJl1zx5SpaEVRYyHgnMYI=;
 b=IdmnnmSa7YttrrKkdOItWddmuazOJNxT5IKJ/3DK94bosRipiNS6fCkcbanKDgHefU
 1kmzx5BOpMDsHOX1ArDcG+JFoNOIkReumuW3FplkBBrwz+Qi+mo/FhPoKOU5aSYH3evP
 ErNuVdOF5xYXpFpzaixmxJHLxM/m7eXHCdkHkny6VKEobTjYUP7kIgZjVNW17MgLG8Nr
 fW5jwsC8YMAEGXhfltahTVuIb32yqb3FklU5cYFFjN2C2X2lljOFYVcL8FCMNNpRxm7b
 zMgNOedtK5HS4z7lRE1TVPdf185XIWNBtwYdS8krWXNdzigLw0OpUWKRntATxwwHhXy1
 h1rA==
X-Gm-Message-State: AAQBX9dbP60hGmVYsll/6f0yvZ0RV3tU0uDulNPrauyV3D072rRrjA5t
 cmAcrRL+FP9axBj2ZEHyRog=
X-Google-Smtp-Source: AKy350bcV4KRDPkNwC3iaMPaPhDxDfIldx7F0eetThHc7feSSkY2kUpZ3OjFNsuA5XkCJvF5C4YlyQ==
X-Received: by 2002:aa7:d352:0:b0:505:394:157b with SMTP id
 m18-20020aa7d352000000b005050394157bmr6379755edr.17.1681478977350; 
 Fri, 14 Apr 2023 06:29:37 -0700 (PDT)
Received: from [127.0.0.1] ([62.214.191.67]) by smtp.gmail.com with ESMTPSA id
 k9-20020aa7c049000000b004e48f8df7e2sm2169533edo.72.2023.04.14.06.29.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 06:29:37 -0700 (PDT)
Date: Fri, 14 Apr 2023 13:29:27 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Volker_R=FCmelin?= <vr_qemu@t-online.de>,
 qemu-devel@nongnu.org
CC: Stefan Weil <sw@weilnetz.de>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/3] SDL2 usability fixes
In-Reply-To: <071a249e-2168-0bdf-2088-7faaa4987df8@t-online.de>
References: <20230412203425.32566-1-shentey@gmail.com>
 <9e951bfd-a657-5968-5318-0cd276cd5b2d@t-online.de>
 <FF1C15C5-33A9-46FD-A491-3248CFE5167A@gmail.com>
 <071a249e-2168-0bdf-2088-7faaa4987df8@t-online.de>
Message-ID: <9AEEC7FB-A3DB-44FC-81C2-87C16643756A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 14=2E April 2023 06:53:18 UTC schrieb "Volker R=C3=BCmelin" <vr_qemu@t-=
online=2Ede>:
>Am 13=2E04=2E23 um 22:43 schrieb Bernhard Beschow:
>>=20
>> Am 13=2E April 2023 17:54:34 UTC schrieb "Volker R=C3=BCmelin" <vr_qemu=
@t-online=2Ede>:
>>>> I'm trying to use QEMU on Windows hosts for fun and for profit=2E Whi=
le the GTK
>>>> GUI doesn't seem to support OpenGL under Windows the SDL2 GUI does=2E=
 Hence I
>>>> used the SDL2 GUI where I ran into several issues of which three are =
fixed in
>>>> this series, which are:
>>>>=20
>>>> * Alt+Tab switches tasks on the host rather than in the guest in full=
screen mode
>>>> * Alt+F4 closes QEMU rather than a graphical task in the guest
>>>> * AltGr keyboard modifier isn't recognized by a Linux guest
>>>>=20
>>>> More information about each issue is provided in the patches=2E
>>>>=20
>>>> Bernhard Beschow (3):
>>>>     ui/sdl2: Grab Alt+Tab also in fullscreen mode
>>>>     ui/sdl2: Grab Alt+F4 also under Windows
>>>>     ui/sdl2-input: Fix AltGr modifier on Windows hosts
>>>>=20
>>>>    ui/sdl2-input=2Ec | 13 +++++++++++++
>>>>    ui/sdl2=2Ec       |  2 ++
>>>>    2 files changed, 15 insertions(+)
>>>>=20
>>> Hi Bernhard,
>> Hi Volker,
>>=20
>>> I don't think these patches are necessary=2E The AltGr key and the key=
board grab was fixed in 2020 with commit 830473455f ("ui/sdl2: fix handling=
 of AltGr key on Windows") and a few commits before=2E
>> Indeed, this patch addresses the AltGr issue=2E What I noticed in my ca=
se is that the AltGr behavior is different, depending on whether the *guest=
* is in graphics mode or not=2E Pressing AltGr in graphics mode issues two =
key modifiers while only one is issued when the guest is in text mode=2E I'=
ll recheck tomorrow when I have access to a Windows host=2E
>
>Hi Bernhard,

Hi Volker,

>
>the AltGr behavior depends on the keyboard grab=2E The AltGr key works wi=
thout keyboard grabbed and it doesn't with keyboard grabbed=2E That's a bug=
=2E

Interesting=2E The keyboard is grabbed automatically for some reason when =
the guest enters graphics mode=2E Together with what you describe this coul=
d explain the difference in behavior I'm seeing=2E

Best regards,
Bernhard
>
>>=20
>> What about the other two issues? My other two patches override SDL2 def=
aults which aren't addressed yet in QEMU AFAICS=2E The Alt+Tab one isn't ev=
en Windows-specific=2E
>>=20
>>> Something broke in the last few weeks=2E At the moment my Linux guest =
fails to start on Windows with -display sdl=2E QEMU locks up a short time a=
fter the Linux kernel starts=2E
>> This doesn't happen for me with 8=2E0rc4 and latest msys2 environment=
=2E I'm running with `-accel whpx -vga none -device virtio-vga-gl -display =
sdl,gl=3Don` and I even get decent OpenGL accelleration when the Linux gues=
t is in graphics mode, with wobbly windows etc=2E Sometimes QEMU aborts whe=
n it can't map some OpenGL stuff when the guest enters graphics mode but on=
ce that succeeds it runs absolutely stable=2E
>>=20
>>> I'll try to find the commit that caused this regression=2E
>
>I tested with QEMU 7=2E1 and sometimes it also locks up=2E This indicates=
 that the QEMU code doesn't have an issue=2E
>
>With best regards,
>Volker
>
>> Yes, this would be interesting=2E
>>=20
>> Best regards,
>> Bernhard
>>=20
>>> With best regards,
>>> Volker
>

