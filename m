Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C70623F9BD9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 17:43:13 +0200 (CEST)
Received: from localhost ([::1]:37794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJe0U-00023U-5O
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 11:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mJdyj-0001MP-93
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 11:41:13 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:43975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mJdyg-000253-RM
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 11:41:13 -0400
Received: by mail-il1-x136.google.com with SMTP id v16so7373590ilo.10
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 08:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=2HKUz3fo6Efl5X7YgnWwJAYs2zl3vOtR9IOQ1dzVGR8=;
 b=q+d8LJFnz129G2BIFuzVHUWpbaJHGXy3BQT0SDweF9mtUgNTDXVIfeaxAe4pXWnlX9
 keNfrPLKBAeElIdHBcQt40SsH4pZDSTNeg1rYm4pmwP+yrCj2LcO73hqBeoseOXgTe+q
 tcB9cLC0jfHSt4gNGBZunjrnEWuWhaT6MYps+/zqvnYviV1k8NVo2GfD64HXldLhZXTL
 QdgYjeZhHe6xArLAU1WJBkVt1rI/QoY2QbyT6Qr3LPF5qoPTKUnTrVuD2skWwrXIj1Jq
 uELS7CCwED3OXCJDaB5rDcjAahHQm+ceShEkCAkZQUlrxlmWyzMEWv/6ml9QhZ2rJrq8
 Df+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=2HKUz3fo6Efl5X7YgnWwJAYs2zl3vOtR9IOQ1dzVGR8=;
 b=d7GAi0yFIfFPU9OeatCqzyYvG/dpmSM06+Q4Wj6PpY0pcrNX4u0oPTFTdQumTYm+hs
 LUY3Uf4MTdLPn9Qd9St/zp8RR+KXivOw0JCu9PwO2inZsnMATS8/hgDI+TrdQAW15Z2Y
 SQ2q7Zrp3HVzs9W3BVKW4sZNvk6qv6O1BjukA18EWdXvvVviE2x12XmR/QJ4xpVkrnGv
 ycz7lbgTDT/B/r+bBOkAtDjSpezRfQ2F6dktQU/iByB2GHFc/aQlujkPHlQUvDc5TOEX
 UyMqS9qzUWNUH1SYKfmTro/vqrYkgsupNjw1XZ5YU43+RAIJ2ncCZY/oQcCv7YJDOcyK
 1grQ==
X-Gm-Message-State: AOAM5308APG3bqjR3WIqGl/RqSL6osATMirBgm6gWhxjSm5dkVhyvU/X
 YdU44c59yUeODG4QQT0UtrbPVw==
X-Google-Smtp-Source: ABdhPJwEcv1WKwUD58SSXJ9V1KpMhsf6go/0GI/Te2ba9X+9H4PtVj7HMUN0EBEg4SuswyY2mtq8LQ==
X-Received: by 2002:a92:c94d:: with SMTP id i13mr5034046ilq.292.1630078868827; 
 Fri, 27 Aug 2021 08:41:08 -0700 (PDT)
Received: from ?IPv6:2603:300b:6:5100:e143:d455:15a1:490a?
 ([2603:300b:6:5100:e143:d455:15a1:490a])
 by smtp.gmail.com with ESMTPSA id z26sm3576097iol.6.2021.08.27.08.41.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Aug 2021 08:41:08 -0700 (PDT)
From: Warner Losh <wlosh@bsdimp.com>
Message-Id: <54A86BB0-B613-4796-B1C7-A5612F2E54A2@bsdimp.com>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_7E066793-B816-44D9-BEA2-379F5E1F1922";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH v2 19/43] bsd-user: start to move target CPU functions to
 target_arch*
Date: Fri, 27 Aug 2021 09:41:07 -0600
In-Reply-To: <1ff44d80-c62d-d844-b548-e1c6075c71eb@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
References: <20210826211201.98877-1-imp@bsdimp.com>
 <20210826211201.98877-20-imp@bsdimp.com>
 <1ff44d80-c62d-d844-b548-e1c6075c71eb@amsat.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=wlosh@bsdimp.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Stacey Son <sson@FreeBSD.org>,
 qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_7E066793-B816-44D9-BEA2-379F5E1F1922
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Aug 26, 2021, at 10:39 PM, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>=20
> On 8/26/21 11:11 PM, imp@bsdimp.com wrote:
>> From: Warner Losh <imp@FreeBSD.org>
>>=20
>> Move the CPU functons into target_arch_cpu.c that are unique to each
>=20
> Typo "functions"

doh! Thanks!

>> CPU. These are defined in target_arch.h.
>>=20
>> Signed-off-by: Stacey Son <sson@FreeBSD.org>
>> Signed-off-by: Warner Losh <imp@bsdimp.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> bsd-user/i386/target_arch.h       | 31 +++++++++++++
>> bsd-user/i386/target_arch_cpu.c   | 75 =
+++++++++++++++++++++++++++++++
>> bsd-user/main.c                   | 12 -----
>> bsd-user/x86_64/target_arch.h     | 31 +++++++++++++
>> bsd-user/x86_64/target_arch_cpu.c | 75 =
+++++++++++++++++++++++++++++++
>> configure                         |  7 +--
>> meson.build                       |  8 +++-
>> 7 files changed, 219 insertions(+), 20 deletions(-)
>> create mode 100644 bsd-user/i386/target_arch.h
>> create mode 100644 bsd-user/i386/target_arch_cpu.c
>> create mode 100644 bsd-user/x86_64/target_arch.h
>> create mode 100644 bsd-user/x86_64/target_arch_cpu.c
>=20
>> diff --git a/bsd-user/main.c b/bsd-user/main.c
>> index f7e1df5da5..7b3550898d 100644
>> --- a/bsd-user/main.c
>> +++ b/bsd-user/main.c
>> @@ -72,13 +72,6 @@ void gemu_log(const char *fmt, ...)
>>     va_end(ap);
>> }
>>=20
>> -#if defined(TARGET_I386)
>> -int cpu_get_pic_interrupt(CPUX86State *env)
>> -{
>> -    return -1;
>> -}
>> -#endif
>=20
> Let's avoid that using a stub.

Not sure I understand this comment. I=E2=80=99ve removed this code. And =
I have i386 and x86_64
as separate functions because that=E2=80=99s how Stacey broke it up. I =
have a todo item to merge
them back together once I=E2=80=99m caught up.

>> diff --git a/meson.build b/meson.build
>> index f2e148eaf9..5fe6b4aae6 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -2560,9 +2560,13 @@ foreach target : target_dirs
>>     if 'CONFIG_LINUX_USER' in config_target
>>       base_dir =3D 'linux-user'
>>       target_inc +=3D include_directories('linux-user/host/' / =
config_host['ARCH'])
>> -    else
>> +    endif
>> +    if 'CONFIG_BSD_USER' in config_target
>>       base_dir =3D 'bsd-user'
>> -      target_inc +=3D include_directories('bsd-user/freebsd')
>> +      target_inc +=3D include_directories('bsd-user/' / targetos)
>> +#     target_inc +=3D include_directories('bsd-user/host/' / =
config_host['ARCH'])
>=20
> Left-over?

Yea. Future changes will need this line. I=E2=80=99ll delete for now.

>> +      dir =3D base_dir / abi
>> +      arch_srcs +=3D files(dir / 'target_arch_cpu.c')
>>     endif
>>     target_inc +=3D include_directories(
>>       base_dir,


--Apple-Mail=_7E066793-B816-44D9-BEA2-379F5E1F1922
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIzBAEBCgAdFiEEIDX4lLAKo898zeG3bBzRKH2wEQAFAmEpB5MACgkQbBzRKH2w
EQDmgxAAmFP65IrZU2SLgK3j/o46qr0xLFMLu3EwD82DrcOKte+ZrwlB8oj7vVkg
AoKLgDc2LYUYRtOUiZBiONkzRqKMIFLHg2Rq3SZNfndNule1vMjf7TWzqJ+dLq8u
w+4L87afjiXLBL9G5LMHT9qik/XSPOe/urI6cgzoIIOw2iP1MYSqLCdX/KGfk22Y
h1n5EIzjR7zVzTOFVbj43WG5UTR9peutzbYoQvHjd0gLl44Pz+/kq4CkvlQzrqyX
56SnlW56E6IpT8F0q8cx5IqvryQNS8nIPFLW8q0Yu38pDvHFisFXV7nk72SfolVf
ApuyWMQVYVUI3S2v0mJWAOINMu97V9Z5DhqC2+TYOCs3/c3EmEDsyKqaFPDvZHqO
qB2JEtwpUAnep8vjMKQWy0Yc5ou30wU6P9N3XpVsQj08jUKPKXD9/4EjC6Wflq6c
EVV9fwsCNCkqjUE1mcw0Vnk40MByFVPEfImsE1yU2uxqlDcHgB2cdzZCG2SVhTZj
koWsyIDGbDrSw/verYPExDmC4YOm+CzSHTrXWQCxD5q62iz2yjqKFgeEfofN3FMb
MeBN3JF6IRpUmKRfnU31CvmeJ/yoEt62mkvB66fFjh9kEFQPHwhWObtlqWnHW4sW
jObpLim80Pkiou08dVQDXRF+W2jqLDZWcyh1Iow0PP7GrpXPHVI=
=/HA1
-----END PGP SIGNATURE-----

--Apple-Mail=_7E066793-B816-44D9-BEA2-379F5E1F1922--

