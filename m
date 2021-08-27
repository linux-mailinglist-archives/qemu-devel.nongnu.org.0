Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6F53F9BED
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 17:50:53 +0200 (CEST)
Received: from localhost ([::1]:42360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJe7z-0005Ue-Du
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 11:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mJe6O-0004ma-RR
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 11:49:08 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:35351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mJe6N-0007TW-5S
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 11:49:08 -0400
Received: by mail-io1-xd2e.google.com with SMTP id a15so9083059iot.2
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 08:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=xX9Li+78GOHeG/pBF7BinQvtNZ2dM1m1mFEyMs+ibhc=;
 b=XWMviEWZLVHQ/zbWNN6kA+uNhxe7vBMgfZ6QCKvXoqsXBXrD8NabfvFoUpH4N9H8mX
 d1n9CkMihREpih1bpH5B3pFRj1FZhV+UHOhRPQCarLDKog9VE45FE4lrFSK5O+cTeeHQ
 xcG2Vmh9ySUtWehTgTxwLDyuBSGpP+ePiWoCPbE+GUD1DNRcQ6zlRKGXgu8yc5Y3Gok4
 Oo553xkO28pgwWu4Ntrr1KvUNHsLi4ThBErOGPbQpWQaGIxajjlpGkmd9YDpsYdlrXU5
 PAFUFVlSz33nrcBAGHmvdv8IUHFRNOjXaZ+WeZeW+nU4GHLLnfv5kLfKVSbWJ5QeyLQP
 oncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=xX9Li+78GOHeG/pBF7BinQvtNZ2dM1m1mFEyMs+ibhc=;
 b=RbO7lHzbuSwvLFngocTxcVsbng8dzc5Lqia+qbibWL5+Mjf05dfYb4rcKYvnC79RSq
 JGzy2kQPfuBKTcUzX/TrOdPD0cNrBhYvhOPRQVTCPIE0uY3mIwwP1u7rUVoePGS9mvys
 ThzQCQSyKub6KRXQtzj9YdsPUiSLkGOhHDR8GRmJ06cKcCZrYCvj1pXb6az7tjk3Tu4u
 XpKiPXcwu0JEPgYAjBObVSXUw4dUdi1JigyopZyws1Rkz1yO7fhN49IYiErOT0ji93Tr
 GQSsFsvOJKEKcmCdiMzEl6mnPgxM8JGrD33qDAxcvRNCSyTk4lOwK6XWL+NRudwdq2/M
 kJNA==
X-Gm-Message-State: AOAM532UDblbviyKpZpqugcwjFdCiLwPdM/8z7NWg8Evr3TVFAPdNcgn
 OouPEchUx2qaXMN0dGYN0nn4vQ==
X-Google-Smtp-Source: ABdhPJzGi4Tw0/03I7rPbZyswKdGNKLrvA7YC8JkBc/NfBWrZSln+W/AIkXS7ebDr5nvwDeExMjeMg==
X-Received: by 2002:a02:cf05:: with SMTP id q5mr8734957jar.132.1630079345498; 
 Fri, 27 Aug 2021 08:49:05 -0700 (PDT)
Received: from ?IPv6:2603:300b:6:5100:c17e:7522:3652:c9d4?
 ([2603:300b:6:5100:c17e:7522:3652:c9d4])
 by smtp.gmail.com with ESMTPSA id l15sm3356615iow.4.2021.08.27.08.49.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Aug 2021 08:49:04 -0700 (PDT)
From: Warner Losh <wlosh@bsdimp.com>
Message-Id: <98C42D5C-E32B-4AC7-8E51-2F044040D32C@bsdimp.com>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_ED13F138-20DC-4B48-8691-6226C8CA3651";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH v2 08/43] bsd-user: pass the bsd_param into loader_exec
Date: Fri, 27 Aug 2021 09:49:03 -0600
In-Reply-To: <cf21a360-0588-ab59-561d-0fb3bd5bb797@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
References: <20210826211201.98877-1-imp@bsdimp.com>
 <20210826211201.98877-9-imp@bsdimp.com>
 <cf21a360-0588-ab59-561d-0fb3bd5bb797@amsat.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=wlosh@bsdimp.com; helo=mail-io1-xd2e.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_ED13F138-20DC-4B48-8691-6226C8CA3651
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Aug 26, 2021, at 10:22 PM, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>=20
> On 8/26/21 11:11 PM, imp@bsdimp.com wrote:
>> From: Warner Losh <imp@bsdimp.com>
>>=20
>> Pass the bsd_param into loader_exec, and adjust.
>=20
> Missing the "why" justification.

So I am. I=E2=80=99ve added it and it will be in v3 of the patches. =
It=E2=80=99s used to share state between
bsdload and elf load, especially open files and the stack used to =
construct the initial args
to start/main.

Warner

> Anyway,
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20
>> Signed-off-by: Warner Losh <imp@bsdimp.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> bsd-user/bsdload.c | 37 +++++++++++++++++++------------------
>> bsd-user/main.c    |  7 ++++++-
>> bsd-user/qemu.h    |  3 ++-
>> 3 files changed, 27 insertions(+), 20 deletions(-)


--Apple-Mail=_ED13F138-20DC-4B48-8691-6226C8CA3651
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIzBAEBCgAdFiEEIDX4lLAKo898zeG3bBzRKH2wEQAFAmEpCW8ACgkQbBzRKH2w
EQBXKg//avox2Yek2svnr2/PE5MxV8EtAJY2LN/b+h0b0ULsiVwtHRPpAmmihx7y
pdPMHUxuPzwjsVjlcpTKKTSWJ+TietLg1waVl5w0aZNwmY9+ZMaYEa8mbbF5aQcO
HreROJu1Y45kaHU50a88V2CNKXY3GLn9wY8c/YR9EPQIOOQHaC7208JxjfKT4elc
30aam6NeAEc0/y2dGJvf3WsLr/ZryiuwOIjcDfwxc5bVWjPm3GilVz8cpPk0Qan4
7N6LY7PSgjiOdxO++zntDNgLzE+YQmcF7vQIYmY7kDgwFTh53x5jB6tCvU+MOsEE
SvdfrtFdRM+3umZZVmrtL41tb7wjnW0ScYHr2SDSLtFxG318+Job4lSvW6BjVjI4
IPuL0xalZKTV4Syf915DmNrbdD9XJjB063w6IWgYtCdRZLYR7PKj7wUVAYiauScy
pxSHj29hojXx4+9c2X4xCpLjSTdq69XWK5FA2tVAyQxIguMd/ya/Gfz7oSwDOKOW
xBu1HkC5YWw14mwbQS7ZQY7XmSKjlSsRejZZ/g0p2Sf9E/rfw2uA9RGzyt6aonnc
g61lwju9eBdaNb852iiFmjCNLY8Si9iT/QM8ipcPA9pt+3MvwMv8wl47ImpFfO36
OYjKm9xaRDDUT8vIB9g7rzCnh1TABOpFCaNddOIN4yRVq4nXz2o=
=H2/r
-----END PGP SIGNATURE-----

--Apple-Mail=_ED13F138-20DC-4B48-8691-6226C8CA3651--

