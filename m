Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79989653E95
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 11:55:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8JC8-00045t-8J; Thu, 22 Dec 2022 05:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p8JC1-00044z-FU
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 05:52:54 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p8JBz-0007ae-GM
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 05:52:52 -0500
Received: by mail-ej1-x629.google.com with SMTP id kw15so3963221ejc.10
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 02:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:to:from:date:from:to:cc:subject:date:message-id
 :reply-to; bh=a3xESealIzU5lMjInJL8N9AfgKells1E/N1wCctD2LM=;
 b=fmap6M4SQ/SZH0qdXgX6qUVQBo8q0eRDFsD5KD+HObuN/ewbVP0sv6QAzwDVvoPdSs
 fsZ6n+PRhQ3Ympx4J1T+dDgDRqvkoCNF/nBJOHtxAyBDPM25HzNymGnDTNeB8gnVa6Ue
 6GNNxmPXDHIGhEFkVe0kB3Dc7hpBR5T3v6h7BJEkarQXr/L50ywgMP+pJdTBAdjCcd+L
 kTv3x7bqFN5A5UrjoC5YJ3drKlxnbCk0LERWcb+yzAavc2gnP2KjBxQgqT9XN2BJVwTW
 O+O9D7XN//IrgrlRkhh2/7RVenR1bltWXYxhBkZQ5jVaIU2ZdDsVCXEO4REfF/M8hxNh
 Y/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a3xESealIzU5lMjInJL8N9AfgKells1E/N1wCctD2LM=;
 b=pN/eSlOJPNDSeBBsHa/qlVU8x2aWEGgQPp6m55P9JnXjGQYEciUpQefyONW/g82d6x
 pIACtKJKcN4Qj0ufnyiyuvaWrdU6XZu9DL3bExkds8F3YmCkr/kRIVVr8jPabZxwSfPy
 D4CAEKUfRSoKd4he+083BiWA4pylPyDPN6pbKapv91IULKND55BoFH51BLvW5wxh1aik
 yX60Wc2x6xnj5f09wfWZudy5MaukbAoYmEvgLskyKMTFh5GDB+WgmjlC1vNL50LF7lrU
 KH8M4AQRmZfn//xBtj5CSPVpgttKB4RnJclIV/3RvbhE05QcTaLmYqa5JzFo02JTvdWw
 LxsA==
X-Gm-Message-State: AFqh2kp9j/r+EBOVax1cpQpM9FOvyB3R/ByOaHQ7DhUEaEuhyFHif2C1
 pM9QnBhOUpqJSa0YGEw2Tsyzu7GvO9k=
X-Google-Smtp-Source: AMrXdXvr2AJ+d4zzSzvAV+U443WzfWv8PEbQC/5nsnp1pOb54VcPRbI4RQmCKEhnz4oS4W2b5CoY5A==
X-Received: by 2002:a17:907:c202:b0:7ad:b14f:dea4 with SMTP id
 ti2-20020a170907c20200b007adb14fdea4mr4227500ejc.14.1671706368084; 
 Thu, 22 Dec 2022 02:52:48 -0800 (PST)
Received: from [127.0.0.1] (dynamic-092-224-161-124.92.224.pool.telefonica.de.
 [92.224.161.124]) by smtp.gmail.com with ESMTPSA id
 mh20-20020a170906eb9400b007ae38d837c5sm104813ejb.174.2022.12.22.02.52.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 02:52:47 -0800 (PST)
Date: Thu, 22 Dec 2022 10:52:43 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 eric.auger.pro@gmail.com, richard.henderson@linaro.org, paul@nowt.org,
 stefanha@fmail.com, peter.maydell@linaro.org, sw@weilnetz.de
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_target/i386=3A_Remove_compilat?=
 =?US-ASCII?Q?ion_errors_when_-Werror=3Dmaybe-uninitialized?=
In-Reply-To: <bafaad8e-f4f7-ddeb-4fbd-cebc7b8c360e@linaro.org>
References: <20221221163652.1239362-1-eric.auger@redhat.com>
 <ed6d68f4-81aa-d9a1-3a71-628855e8a376@redhat.com>
 <bafaad8e-f4f7-ddeb-4fbd-cebc7b8c360e@linaro.org>
Message-ID: <ECC8557E-D801-4D8F-9D9C-0F02A4286E44@gmail.com>
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



Am 22=2E Dezember 2022 09:01:34 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:
>On 22/12/22 09:18, Paolo Bonzini wrote:
>> On 12/21/22 17:36, Eric Auger wrote:
>>> To avoid compilation errors when -Werror=3Dmaybe-uninitialized is used=
,
>>> replace 'case 3' by 'default'=2E
>>>=20
>>> Otherwise we get:
>>>=20
>>> =2E=2E/target/i386/ops_sse=2Eh: In function =E2=80=98helper_vpermdq_ym=
m=E2=80=99:
>>> =2E=2E/target/i386/ops_sse=2Eh:2495:13: error: =E2=80=98r3=E2=80=99 ma=
y be used
>>> uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>>> =C2=A0=C2=A0=C2=A0 2495 |=C2=A0=C2=A0=C2=A0=C2=A0 d->Q(3) =3D r3;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0 ~~~~~~~~^~~~
>>> =2E=2E/target/i386/ops_sse=2Eh:2494:13: error: =E2=80=98r2=E2=80=99 ma=
y be used
>>> uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>>> =C2=A0=C2=A0=C2=A0 2494 |=C2=A0=C2=A0=C2=A0=C2=A0 d->Q(2) =3D r2;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0 ~~~~~~~~^~~~
>>> =2E=2E/target/i386/ops_sse=2Eh:2493:13: error: =E2=80=98r1=E2=80=99 ma=
y be used
>>> uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>>> =C2=A0=C2=A0=C2=A0 2493 |=C2=A0=C2=A0=C2=A0=C2=A0 d->Q(1) =3D r1;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0 ~~~~~~~~^~~~
>>> =2E=2E/target/i386/ops_sse=2Eh:2492:13: error: =E2=80=98r0=E2=80=99 ma=
y be used
>>> uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>>> =C2=A0=C2=A0=C2=A0 2492 |=C2=A0=C2=A0=C2=A0=C2=A0 d->Q(0) =3D r0;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0 ~~~~~~~~^~~~
>
>With what compiler? Is that a supported one?
>
>>> Signed-off-by: Eric Auger <eric=2Eauger@redhat=2Ecom>
>>> Suggested-by: Stefan Weil <sw@weilnetz=2Ede>
>>> Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
>>> ---
>>> =C2=A0 target/i386/ops_sse=2Eh | 4 ++--
>>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/target/i386/ops_sse=2Eh b/target/i386/ops_sse=2Eh
>>> index 3cbc36a59d=2E=2Ec442c8c10c 100644
>>> --- a/target/i386/ops_sse=2Eh
>>> +++ b/target/i386/ops_sse=2Eh
>>> @@ -2466,7 +2466,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, =
uint32_t order)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r0 =3D s->Q(0);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r1 =3D s->Q(1);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> -=C2=A0=C2=A0=C2=A0 case 3:
>>> +=C2=A0=C2=A0=C2=A0 default:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r0 =3D s->Q(2);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r1 =3D s->Q(3);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> @@ -2484,7 +2484,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, =
uint32_t order)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r2 =3D s->Q(0);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r3 =3D s->Q(1);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> -=C2=A0=C2=A0=C2=A0 case 3:
>>> +=C2=A0=C2=A0=C2=A0 default:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r2 =3D s->Q(2);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r3 =3D s->Q(3);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>=20
>> Queued, but this compiler sucks=2E :)
>
>Can't we simply add a dumb 'default' case? So when reviewing we don't
>have to evaluate 'default' means 3 here=2E

I agree=2E At least it deserves a comment to preserve the original intenti=
on=2E

Best regards,
Bernhard

>-- >8 --
>--- a/target/i386/ops_sse=2Eh
>+++ b/target/i386/ops_sse=2Eh
>@@ -2470,6 +2470,8 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, uin=
t32_t order)
>         r0 =3D s->Q(2);
>         r1 =3D s->Q(3);
>         break;
>+    default:
>+        qemu_build_not_reached();
>     }
>     switch ((order >> 4) & 3) {
>     case 0:
>@@ -2488,6 +2490,8 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, uin=
t32_t order)
>         r2 =3D s->Q(2);
>         r3 =3D s->Q(3);
>         break;
>+    default:
>+        qemu_build_not_reached();
>     }
>     d->Q(0) =3D r0;
>     d->Q(1) =3D r1;
>---
>

