Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD533F9B66
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 17:04:47 +0200 (CEST)
Received: from localhost ([::1]:51726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJdPS-0004ty-0c
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 11:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mJdNN-00049k-HT
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 11:02:37 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:42511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mJdNL-0000A6-RG
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 11:02:37 -0400
Received: by mail-il1-x12c.google.com with SMTP id s16so7277866ilo.9
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 08:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=mT7erFPOrEeiQySOd3C6nYxFx3ykTfCFztFZKmTrNqk=;
 b=eyab+9dL273J1YbkGGIyZuXgG6JXFLv5KBCjDmrm4FVXxNrmeggQshqcA+OfqfQeMx
 cL+xgemMyTg9lLKBOnY9k3NGL1WvJVIyxmpzQ9ro9+uElYs8vg35T1+hOzqhB2/J/puk
 +bGtsUwXXFm143beCnpGGGo6KnNSUkD4ihMxgosgDofoSkrDJHVJiTbRv4rVApI0pBkS
 lQ/pW+vq1bwJC7WWBqN8D6DIANMcVJsNNMSfJBAOKwhf/bp8KSCMQDx8cW5R2lbgX4W/
 gHy9rYM+Ol3d9ZpbLvzUtb6Xcg/ZLRx6wsexg8Y+wI7jFK0/0th/lJ3jtFfzNbdwyaE6
 Ybsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=mT7erFPOrEeiQySOd3C6nYxFx3ykTfCFztFZKmTrNqk=;
 b=oBtG1JquGtXKdj4OMUNMWfmHVsO0Kjx1KIvviRcnd6QE7V3giJSbSiVEVBILPemAjX
 5VV/mB5Dnrp+zr3G2OB9MTAhoC5j2jW61dnaYvBAT7huym225NTp3Oy6BvEg/ndO8b5C
 Ou5U2w//MBTr6AVEknQzQ99+ouEDXDDTvd00ld+XQ0M3D35uKpa4+ROSo97TfxqDjReo
 uzdtNH+sxEEBO8AHuiio5hxchxXNypt5Uq2ivSuzj5RHQj/O9B4paL+sSGUW8jUHq6gs
 dYXFLwG5IPo2H6iBNHlzM60GNpOnrk6AYHgvH25iCWFifAVJbLPFcFhLqiNsrSDii6tC
 1nnA==
X-Gm-Message-State: AOAM531C1rCRnQIr0HRh/oWMn4VdilAfFaQzGXadHwRJWnzIivhHgNws
 1VLfBetWYSkZjO62k/5AslBggQ==
X-Google-Smtp-Source: ABdhPJxPv1j64SznKylCigqMpfA9lx/6nFIoAQDNWKdtOqBkOZf/XWfaQ94FKr1OsS3cNC1zia5W0A==
X-Received: by 2002:a92:cb4d:: with SMTP id f13mr7036961ilq.220.1630076554542; 
 Fri, 27 Aug 2021 08:02:34 -0700 (PDT)
Received: from ?IPv6:2603:300b:6:5100:c17e:7522:3652:c9d4?
 ([2603:300b:6:5100:c17e:7522:3652:c9d4])
 by smtp.gmail.com with ESMTPSA id u10sm3766302ilg.15.2021.08.27.08.02.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Aug 2021 08:02:33 -0700 (PDT)
From: Warner Losh <wlosh@bsdimp.com>
Message-Id: <35C0402D-0451-478E-8BCF-446AF2BFBBD4@bsdimp.com>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_8A4A8BC3-10E8-4A48-8DE7-F15DD4C9D2C5";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH v2 30/43] bsd-user: Remove dead #ifdefs from elfload.c
Date: Fri, 27 Aug 2021 09:02:32 -0600
In-Reply-To: <de44e02d-5da0-3347-c2b6-5bbb344ae354@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
References: <20210826211201.98877-1-imp@bsdimp.com>
 <20210826211201.98877-31-imp@bsdimp.com>
 <de44e02d-5da0-3347-c2b6-5bbb344ae354@amsat.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=wlosh@bsdimp.com; helo=mail-il1-x12c.google.com
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
Cc: Warner Losh <imp@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_8A4A8BC3-10E8-4A48-8DE7-F15DD4C9D2C5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Aug 26, 2021, at 10:42 PM, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>=20
> On 8/26/21 11:11 PM, imp@bsdimp.com wrote:
>> From: Warner Losh <imp@FreeBSD.org>
>>=20
>> LOW_ELF_STACK doesn't exist on FreeBSD and likely never will. Remove =
it.
>> Likewise, remove an #if 0 block that's not useful
>>=20
>> Signed-off-by: Warner Losh <imp@bsdimp.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> bsd-user/elfload.c | 20 --------------------
>> 1 file changed, 20 deletions(-)
>=20
> Move as patch #14?

Are you suggesting I move this to be right after patch #14 or that I =
squash / fold it into patch #14?

Warner

> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>


--Apple-Mail=_8A4A8BC3-10E8-4A48-8DE7-F15DD4C9D2C5
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIzBAEBCgAdFiEEIDX4lLAKo898zeG3bBzRKH2wEQAFAmEo/ogACgkQbBzRKH2w
EQCC5g/9HZ9vjLr78r1teqBM1AuVKUhUeNDuz4F6H1bKXQACyBcA0lI1yR3B3uiZ
Xujp+56k6z+hDET6KaENImlBmdtUY+nDBvrdVhHn1iV6R1DgPW0UaKWDFtczECxP
H8OGSVFENlH8qF4J6ZKOAfX82M4E55TOrOhtwltRudYntrWq23vCLyZvnKfuzhRS
1SA5CNtpKrfWi0zdwDlvNQBIRuX7tjJRD8oanDh34glCx7ZtERKdjQQww9w6lHpc
nRKBqgGLc9VpRm57VM3lk+OSdTV3uh28KqE/yN1sd3fFiLB8yzvpvFJxsRhPgD3b
Dw2BvhZ9EQWWNGfjmRdNtzq3PDrxHj0lP7nZsYn733PhtVE/9O3XIwOwRNvtqU9k
tBB0LxBVlYsw+GxwUOim/fZaMrzH0SQYXydtacxjVIcxsEonWu2yOGbjdD5i2LS3
zNvjs29WUXXwfZg+XgdPT7UFWTFeJ2RKR3Xw03MHwRSJp2pg573dIslASpM5wbVi
HIf2qfxh1VSIz9Iyr13dLbZblaVmpvPiCotutbr2FTjXpHzUPPBqn1dC5shZ5HCR
RmTFD4+5EGfN1SO9HwMdxrZPuGb4t6G2UBk3w6YvQL2YPXQbNKwbpEI6qFtK2/Rk
4htdJEB0HpbJmqfdDGHmk+GnUBeAzVKShMbSTh/p+t++gxnVd78=
=BSwL
-----END PGP SIGNATURE-----

--Apple-Mail=_8A4A8BC3-10E8-4A48-8DE7-F15DD4C9D2C5--

