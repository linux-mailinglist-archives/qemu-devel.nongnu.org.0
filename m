Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655A93F2533
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 05:17:26 +0200 (CEST)
Received: from localhost ([::1]:43536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGv24-0004Ku-V0
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 23:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mGv10-0003cq-5B
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 23:16:18 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:36438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mGv0y-0002ej-CI
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 23:16:17 -0400
Received: by mail-io1-xd36.google.com with SMTP id f11so10420382ioj.3
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 20:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=Ya2/Jyg8cRUxlHsMG7Reu+hjOk1GgzOUn6rIUSLqsJo=;
 b=U7kGNvi67qTvVKLVz/52OEgC5z9RKLx8bOqjUwtZOelfoNgkfnd/DikiMzBGrJ4Cqd
 IJy8jVyx1o8C/sFTwFrn66xpJfQMMA5UtP7c8oXVW2y9wdwiM9sGVMKr5dCPcQFhHicH
 qzsUfarg4/juE6pDsrBoKZ0U4gtjipfGAGVx0ytkKvWpB9jNnrlMG+3I0matP4zDYK/F
 Utn0iB1wFnbUZ3jvukk8d5TE6Sw5JqwoOhpBeqHmFI2azQyzRMU7TyIyyWKfvwaGEig+
 E5bLo/e0ULiTPJvFJl7EfPIk8EMieQl7g1K2PUI3VjH3pKWcON1soeqDL77/ZPP1K/H/
 eVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=Ya2/Jyg8cRUxlHsMG7Reu+hjOk1GgzOUn6rIUSLqsJo=;
 b=ONh0mVOVTInjwHTZWR5B3FBxfa7pw/IbjvgtfZUOD90nkWx1lk9vzbdsXPZbrY/w7U
 KyciT6oTER3O3kYTAcow3/8/yTKB7WL2QtURyBykA34Rz4gTdDpDc85U50jxQQs0rCVQ
 ZabMiRFcGF27r3PpUaC/TaFSXGG11Jd1ku+VN3AOhMiZE1dxILESlWLa2EWOq7F4d9Xf
 svvKchifHi+119LnIJY7aWvVk7mRYA5Izgp+b5pThxg1YxfGYb6Qk6Vurdfhpd68KAYY
 xNk0gRw5bpGQclX8WGh4fO0/RRd09rUOXm25Zj5c8HiDSixEk3mB+Rf5pYijR5soIOpm
 xFcg==
X-Gm-Message-State: AOAM532yJzgcbrw0flQmLJYdCZNopSlD4u39CY/8AVs5ITlMwvIx0zR+
 tHYGZ/AhPJS8ZOdeIhFYzbLTsQ==
X-Google-Smtp-Source: ABdhPJxxa7mMox7+dipi0U9YCgFIY6yZhzqJRGGNZJFEHP6hF83i1ZnoAxqc+fBnIvpndHaISSxQBw==
X-Received: by 2002:a02:7a14:: with SMTP id a20mr15707618jac.27.1629429374798; 
 Thu, 19 Aug 2021 20:16:14 -0700 (PDT)
Received: from ?IPv6:2603:300b:6:5100:78fd:7f8d:c5f4:1730?
 ([2603:300b:6:5100:78fd:7f8d:c5f4:1730])
 by smtp.gmail.com with ESMTPSA id x1sm2734887ilg.33.2021.08.19.20.16.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Aug 2021 20:16:13 -0700 (PDT)
From: Warner Losh <wlosh@bsdimp.com>
Message-Id: <43719964-C92A-49DD-8E86-E2A6F97559E4@bsdimp.com>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_22116234-943B-48A4-A4CB-D0B0AF23FC91";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH for 6.2 42/49] bsd-user: add stubbed out core dump support
Date: Thu, 19 Aug 2021 21:16:12 -0600
In-Reply-To: <714d699e-029a-1efb-d58e-48fd0bc3ccbb@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-43-imp@bsdimp.com>
 <714d699e-029a-1efb-d58e-48fd0bc3ccbb@linaro.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=wlosh@bsdimp.com; helo=mail-io1-xd36.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>, qemu-devel@nongnu.org,
 Warner Losh <imp@bsdimp.com>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_22116234-943B-48A4-A4CB-D0B0AF23FC91
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Aug 10, 2021, at 11:27 AM, Richard Henderson =
<richard.henderson@linaro.org> wrote:
>=20
> On 8/7/21 11:42 AM, Warner Losh wrote:
>> From: Warner Losh <imp@FreeBSD.org>
>> Add a stubbed-out version of the bsd-user fork's core dump support. =
This
>> allows elfload.c to be almost the same between what's upstream and
>> what's in qemu-project upstream w/o the burden of reviewing the core
>> dump support.
>> Signed-off-by: Stacey Son <sson@FreeBSD.org>
>> Signed-off-by: Warner Losh <imp@bsdimp.com>
>> Sponsored by:		Netflix
>> ---
>>  bsd-user/elfcore.c | 10 ++++++++++
>>  bsd-user/elfload.c | 24 ++++++++++++++++++++++--
>>  bsd-user/qemu.h    |  6 ++++++
>>  3 files changed, 38 insertions(+), 2 deletions(-)
>>  create mode 100644 bsd-user/elfcore.c
>> diff --git a/bsd-user/elfcore.c b/bsd-user/elfcore.c
>> new file mode 100644
>> index 0000000000..e3c161942d
>> --- /dev/null
>> +++ b/bsd-user/elfcore.c
>> @@ -0,0 +1,10 @@
>> +/* Stubbed out version of core dump support, explicitly in public =
domain */
>> +
>> +static int elf_core_dump(int signr, CPUArchState *env)
>> +{
>> +    struct elf_note en;
>> +
>> +    bswap_note(&en);
>> +
>> +    return 0;
>> +}
>=20
> No warnings from this, e.g. uninitialized variable?
> If you have a chance, run this through clang-12 (mainline).
> It it getting much better at identifying such stuff.

It=E2=80=99s easy enough to initialize en, so I=E2=80=99ve done that.

Warner

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>=20
>=20
> r~


--Apple-Mail=_22116234-943B-48A4-A4CB-D0B0AF23FC91
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIzBAEBCgAdFiEEIDX4lLAKo898zeG3bBzRKH2wEQAFAmEfHnwACgkQbBzRKH2w
EQAIzRAA29SjDjnMZZCc1Csmirkp5GA7E6jhqR+w1VtqM5ZBKR0BMyb+J9o1Y1Ss
nIDW4tRzbtL0dQF6HU4zwacreGN/erlgbzOJow5g9sHQ4z9IVdQYjObilQBJTgV2
oi6WQKuOJmQfOgqvQiAnWWu3Spw39q071/A+v2384SZO3qahNC6BjBkHK0vZHxni
m1rAwPgj0ZkDfo2mCxgO8pcCdDKUM2EWq4TeRl/PTW3ob5F6dAuwDtW6Q41vVSun
BuK2qwrshP5hUH0tYSQuHlnaaKZII/dlPqA0uuVfsLDRZoGEGjvaeOdQnamPjNuJ
ffya2+LYJN9rkh5j2S2jrrwTaRomA29QrKxIwg+AYyBqKOXVyvncOtXxX4f/NOfJ
4rtcrALVcfW9jxC6qtnLsES6h7fibFfwvQBB7ZD4c3z3DdLO18/yEPvPRi4noqYu
UW1RiVddU9Q7Wb+yFtnnkiDXpuTUKDLZ1vm5OU8Lc7YlP+snwBm7zg2uBgBL5TTP
rTHcYkNtDAzgRQILgLjXnccjoZPW8gxGhP7GEe1EkRuB8pYXxqaaaM/GviEtJQ+Y
UwejrYYX9I0sCV2FeckMocc/uDKI83h/JFUlJlvEOnOXFkAEfM+zg1L+4QxkGakh
xPux3DW93elSMh9+Q/XXFVQr70YezAqPvyA4maO5zq+W2LnLvmw=
=7Sqd
-----END PGP SIGNATURE-----

--Apple-Mail=_22116234-943B-48A4-A4CB-D0B0AF23FC91--

