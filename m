Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A5B541F8C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 01:43:59 +0200 (CEST)
Received: from localhost ([::1]:35400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyire-0004b1-PA
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 19:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nyijw-0001ki-MN
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 19:36:00 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:45758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nyiju-000223-J6
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 19:36:00 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so16784193pjt.4
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 16:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc:message-id:references
 :to; bh=Ob2rauUjxWymyupBe4RJoh6IlqykpLSIvvnV4LZZ7g4=;
 b=GI0ZrQr4QCMep2cZKEU16VbU2i+bAKPdMiye7k7yLP0cU/d5jhf4dPNqyUTc4pbkvn
 MDFhGvQPypQrxPMbGRZB3qzGSZgbWjvJWwrLVGLswwsif7bdzriWg2dhCaxy/b1CWgnM
 6cB8p6qYA4aqAVOTM/KjI1ALiLKYpZKxRjH3Wq8lhTqlwfDS0nWtyE1KwP1nVZ5w9/Pt
 wuwnOlfA3PQ3asB9oiZjc0F041191G68pBCmVgcPJzWoljhHrrQ39lgaJLKc5aKlVaGH
 l1IRXi6YIcX4Rp5oMM/XKCp1Uuafapg6kqy2tbdGKhVf2Cu6Qo3kMmOuNZEmSYCjc8Xh
 8i7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :message-id:references:to;
 bh=Ob2rauUjxWymyupBe4RJoh6IlqykpLSIvvnV4LZZ7g4=;
 b=J4DwJGXH2PkNULS3h80aw4qVe9PQHkpanNB3FLI66XQ37zExbP5+QsoiLRt0/cufsI
 dHswRLvGfj1VNMSLTKjWVYRtkrm8o6C0tPHCvvLrfU1SPFPC619EN5xNS13ZFno6c7Mg
 pHQvr0RIKxNHp+lnRKKi3ak2BM3qOFNveOahfb9iVL/ltsIQU9lvH85kDE2JtI5qtTwY
 kmOmSeY7xiNTWAYyYnIPDzDevVJ5qtU4/0mWEH2nwEv27cWB7Po03eoYbrz87/yNKUDf
 pNlsBuLZlaame1l/5T2zHs6e3zYWBrVUNIBN3ibDIKwe8LOEyEsbREypb11NCqsM8jh6
 6BBQ==
X-Gm-Message-State: AOAM531OtExo+UPWa18AZnaqCrYx9mvsybDzkvXlVOPMyHzuMeOVFc+H
 wb2VyKkaAZqqSEsUZE3v9InCNg==
X-Google-Smtp-Source: ABdhPJzbiRtVD2ydE+ICrgJgnI1DWcHHAmSCrYduTqijntfJxkEM4S3hMU4fuVGOrxp3PYx7dwYM6w==
X-Received: by 2002:a17:90b:1c87:b0:1ca:f4e:4fbe with SMTP id
 oo7-20020a17090b1c8700b001ca0f4e4fbemr69366467pjb.159.1654644956847; 
 Tue, 07 Jun 2022 16:35:56 -0700 (PDT)
Received: from smtpclient.apple ([192.173.66.161])
 by smtp.gmail.com with ESMTPSA id
 b82-20020a621b55000000b0051ba8b742e4sm13438320pfb.69.2022.06.07.16.35.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Jun 2022 16:35:55 -0700 (PDT)
Content-Type: multipart/signed;
 boundary="Apple-Mail=_48265D3F-A9E2-4E0C-B6AF-8684D0C180C2";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [PATCH 2/6] bsd-user/freebsd/os-syscall.c: unlock_iovec
From: Warner Losh <wlosh@bsdimp.com>
In-Reply-To: <35407e39-ac93-b5c0-c634-975ab8609a92@linaro.org>
Date: Tue, 7 Jun 2022 16:35:53 -0700
Cc: Warner Losh <imp@bsdimp.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Gleb Popov <arrowd@freebsd.org>, Konrad Witaszczyk <def@freebsd.org>,
 Jessica Clarke <jrtc27@freebsd.org>, Kyle Evans <kevans@freebsd.org>
Message-Id: <7CD189F5-3536-4B7D-B7C1-AE5E74B90D03@bsdimp.com>
References: <20220607201440.41464-1-imp@bsdimp.com>
 <20220607201440.41464-3-imp@bsdimp.com>
 <4279f170-76df-c329-24ec-26e1e68446eb@linaro.org>
 <CANCZdfq5L5Q3ePmdF6_ap73h5CGgtc6ZVK0e+tPfUOqW5SKBkw@mail.gmail.com>
 <35407e39-ac93-b5c0-c634-975ab8609a92@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3696.100.31)
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=wlosh@bsdimp.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--Apple-Mail=_48265D3F-A9E2-4E0C-B6AF-8684D0C180C2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Jun 7, 2022, at 3:23 PM, Richard Henderson =
<richard.henderson@linaro.org> wrote:
>=20
> On 6/7/22 14:51, Warner Losh wrote:
>>    void unlock_iovec(IOVecMap *map, bool copy_out)
>>    {
>>          for (int i =3D 0, count =3D map->count; i < count; ++i) {
>>              if (map->host[i].iov_base) {
>>                  abi_ulong target_base =3D =
tswapal(map->target[i].iov_base);
>>                  unlock_user(map->host[i].iov_base, target_base,
>>                              copy_out ? map->host[i].iov_len : 0);
>>              }
>> And wouldn't we want to filter out the iov_base that =3D=3D 0 since
>> we may terminate the loop before we get to the count. When the
>> I/O is done, we'll call it not with the number we mapped, but with
>> the original number...  Or am I not understanding something here...
>=20
> I'm not following -- when and why are you adjusting count?

When we hit a memory range we can=E2=80=99t map after the first one,
we effectively stop mapping in (in the current linux code we
do map after, but then destroy the length). So that means
we=E2=80=99ll have entries in the iovec that are zero, and this code
doesn=E2=80=99t account for that. We=E2=80=99re not changing the count, =
per
se, but have a scenario where they might wind up NULL.

I=E2=80=99ll add =E2=80=9Cif I understand all this right=E2=80=9D =
because I a little shaky
still on these aspects of qemu=E2=80=99s soft mmu.

Warner

--Apple-Mail=_48265D3F-A9E2-4E0C-B6AF-8684D0C180C2
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIzBAEBCgAdFiEEIDX4lLAKo898zeG3bBzRKH2wEQAFAmKf4NkACgkQbBzRKH2w
EQDzAA/+MYh/VwooLKhLnyGNb/l5ETowqqHXFK76cItDiH3T40yOHTjoGjeR/Fm7
INflIzNBNiYXDaCjiWaGY38Lug2e10kSPPa47lpe+7DlxwNHeBd7f5VgiHNGU334
Htfs5tqh3mxVQp1YWI/47Y0Vul+HxSTRqfDEo44PVU6SYvo+eLPCcP0x3uUPxnIW
ReAFATT3sK8LlbGKpHdu/ECboYi3Ecu49fv9FpOCloC1bzdCjiFIsvnw/1PKYCCv
2ONY8rOGY/4eDpTEUTs8K+4+WR/RuJ3A/uNGPuRO5oAqik+2MgXhgen872Q6mQyx
AbRvCdlOAPKpM2qLYYozjJstIdOgySrUwZRbxPyLPXphRJYcwDZbNHuPtDQbne57
Ox0dN/QW6yeOPKMy4sdrXVXLvxvjAleJP6wAKBGQ5cau5OWXvPM/NofcpZH9T4PQ
i2f0yTejIc73rfA9qxEoBvoUvBUrWKaSssdqtXXwkCyLlKzP1e4ZyvNjpi8grqIM
uoQXgD0XOlx6lTSuQiAw4KmMJ1vCH9hJiTVIixCyQEfxF6L8JbNoC8HqWm0aq0N8
Xpywuflsvk/NJRoT5c2J0OL8Kxg1i4Rqz2S+q3SNLQpeaU3fxVtNZIkHUZmO1rE/
9CQ7aycGJX54gP8fzJYhWTdL8NXVmr3J0rdf5CMdVsdtYwJ/8X8=
=oCey
-----END PGP SIGNATURE-----

--Apple-Mail=_48265D3F-A9E2-4E0C-B6AF-8684D0C180C2--

