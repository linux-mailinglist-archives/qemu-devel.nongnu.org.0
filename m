Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF40534AE99
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 19:29:42 +0100 (CET)
Received: from localhost ([::1]:59314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPrDJ-0007NQ-LL
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 14:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPr3J-0003EP-QK
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 14:19:21 -0400
Received: from mout.web.de ([212.227.17.11]:52431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPr3H-0004wd-M0
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 14:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616782754;
 bh=KFymqO+PfSJ1DloQDoAwEaEX6C5WBoLfw+nyHqgUe90=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=gLc4UcJkUmR3Cp8dvn4WSXkAg+Ik00LGH2qfP04dJdRUgPD6sQmE5LIrsUtwNZNfR
 M+BJPPppz9N3QpRbsZJPmToy/FlvWfglwe8kQEniwrIjEudOCZ4c0qs8hJEwD14ZiA
 /y0Gv/gdOwAD/To8eVnujqTtotGDwno8n5Zl8dLc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.242]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LaCXK-1m46we1hni-00m6Fa; Fri, 26
 Mar 2021 19:19:14 +0100
Date: Fri, 26 Mar 2021 19:18:55 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL for 6.0 0/6] Yank fixes
Message-ID: <20210326191855.0c1dfd99@gecko.fritz.box>
In-Reply-To: <CAFEAcA_xF18iG3da8EfTSE7oLQrP056+RjdNrNGpk3F+Qj7NYg@mail.gmail.com>
References: <cover.1616779714.git.lukasstraub2@web.de>
 <CAFEAcA_xF18iG3da8EfTSE7oLQrP056+RjdNrNGpk3F+Qj7NYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iBevw1Myz94Y7NwoTe3yDUl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:IIPaB6XKCif+KqfpV6KofidXraxyylDl/B4vQW2MbYAyPyPhoOz
 SBVDrssd0NlslbagsCNi6BijgnwWnFR5lOl/zgGWNasIwjUuyV3pBV79CN1eLP22t79gUVY
 6lgHhr9IZGYojADr5t5WbC5jmDvJSPDiGMLWU+pTxlTixX08p8/vRgPlDM7BvnlZZII5RgV
 Sr+SkRcMpHDJ9fpg4dthg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:E25hfnw7tb0=:62RRGg2SYzCp3AzCw584DH
 a7pJso8YKR2CZWEUKgfXqBx+do1/XERHpSBiOBaw3d9eOFBWUkz4pwlNFKSxyjs9q3bREAA9n
 ROYe+HB1pNEaBbkdtNnFpOBWB7LzORHJW5pxUXbMTlMZ859p+3w0s0ctmZR0vT27X/f8CpVFA
 lbSWwCRMULy+VjcnZkxU4VUs+f/PnwIafANtM6M9Et4T1KdqCA5Rf7E0g/7vtVL9xoQm8vm3z
 QRz0NAGrGCSvjfMrXLA481f/TR+eGE1HjV8oCOJiStSBhu2stL3bDbp31H46mUn1cJyl5Hj+k
 UE98FxvWN9NyX1Tb39VtKdN5dFkdbnP1u3m0kjE1ePe1S+4GTYRCQG7c/8CtOVx4XeWHg+L97
 r/y4AGnf1DtrlypQH2T0KvpJ/Il7l6NnVQ4PdPEcf5ZljVNy8xT47V9wFFolTBAKosT4lR04V
 62nyz26yZnRtAkEmg0hW6I4iek43h4TxySof7ZRK37DeP+gQf7W0SaUPnRwrKqF8Avzn0OUuu
 baoSV0jBbYAsjJvUjxjS8Wsy7lL57/dTBtBhzgiRhvAysqLMXyOl6bnuSmoQYmo327Xi4Jimb
 Y19fOnmVmyRvqqrZGjfQ6WrAHR8Dfy9M4325/7FkCPoRs6qrwCmyT1j/zAOv4FQffmXW8vOxZ
 sNzzMrCs1wwKvxVvbM9H7f02YWYdN3yJ64Sb8yLjCFTOOp6/p9s8G0L2/zXEo0sp54/IwvVvo
 qjePM/IWYYgNXbyMiSYS9Z4u1Z626LJBiO3uEZ5dEsW80V4+Fe12BA0w7A0/B3mVO9lzP4rto
 q/gTWezrHE2aAtjN4RdHQG9qAhXo+KMkxrL9Hb8v2xBU31OJRDMAjeJ8Z+AiMEb6zwS6Nb4+2
 dyx6ciMuWsqY1XSUXKZXorGaoW5yfGBWcA5Tsz/ElKricCi578SfFG4VgKabrnoKNMXpu1RVJ
 2naHfKGmJh1eYN5OaZuK56oDIbauWCy0McwRFLOypqrazmGSIs2rNUERNxMWU1Lh7PGM1eK/J
 x3TUcPR99UlN+HJniGh5XVWpEX/jLbpg2IKKmGTrBENXSs7f/6HxMt9w5IWY7lhU3IhWTYJfh
 lDhuMKk/LHSaC9dG9ABC+9vOXTgmVbWC9EQ73+nMCCK3ALGgF56whnIF7akC7Bc1Gi0hsnAcR
 8/W9889UInzCQmIvS1xUwr6rhZ6OoWALCBGQLvmnga+YxrSDADkAbSbxCdr7urmpLEgM4=
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/iBevw1Myz94Y7NwoTe3yDUl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Mar 2021 17:52:40 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Fri, 26 Mar 2021 at 17:34, Lukas Straub <lukasstraub2@web.de> wrote:
> >
> > The following changes since commit 5ca634afcf83215a9a54ca6e66032325b5ff=
b5f6:
> >
> >   Merge remote-tracking branch 'remotes/philmd/tags/sdmmc-20210322' int=
o staging (2021-03-22 18:50:25 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/Lukey3332/qemu.git tags/pull-26-03-2021
> >
> > for you to fetch changes up to 7c2f1ddcaa1c97462cb0b834d5aa7368283aa67d:
> >
> >   tests: Add tests for yank with the chardev-change case (2021-03-26 17=
:12:18 +0000)
> >
> > ----------------------------------------------------------------
> > Yank fixes for 6.0:
> >  -Remove qiochannel dependency from the yank core code
> >  -Always link in the yank code to increase test coverage
> >  -Fix yank with chardev-change
> >  -Add tests for yank with chardev-change =20
>=20
> Can we get these through some established submaintainer tree, please?
>=20
> thanks
> -- PMM

I guess Marc-Andr=C3=A9 Lureau or Markus Armbruster can take it trough thei=
r tree.

Regards,
Lukas Straub

--=20


--Sig_/iBevw1Myz94Y7NwoTe3yDUl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBeJY8ACgkQNasLKJxd
slhUAA/9FEGfZ8G51SyPnkhqj18Z/KtJB2QQ88BJa6sMBYbiQ7JHaaBQcjFSoY5P
FsnGVPUNFCV08hIg8H8Gkr3An2pCFjKpHJ6k/QSNM/jPTzlxilHAYNXf6u7dR5n2
txbJDGY8DMRvuiosxkc+RPkLRlfVX7T7hP3Gnz4fMy/qoc6gGOFfjDOSLbWllRe3
g7gMD4kRg/Mps0qRQJYibvyYU5Tc1IZuBlcGqx69vvrvbaoehOtoht/sqzDudwsB
07NIhj9Yn4Maq0Wo9N2j2rS6gWAWAavyhTAvhiE6uzrTHsHj+RdIY7pTidqUq5wv
eh6/+EAmelEZnxa10H+xu4qT5WTTGwQqsL9DJ5pra+lgx3Dyjp/IsRJNdKXL33d2
sMRi3d+Ntl8j8GS0G9VcvRjgzfkOUcQbsv7uXJp7bvTdy4DojTd77/fsK97jl4PI
kS5x4jZ3Y6zfqdzzM7C2dYOUnnDLKa1U6+9Gsv273HU7cN5NlNLJ9OpEVvzIaQdc
YFPNarhugrzDhJ+FkwBrr2SRwgsT9GyaWyYPRXBCSprLU9bF035oR4WRD1PXGjEE
uBmxptU1vJsZSNf8EX3HuOma+0xBnFeg1SnKeVQK3WX4bOSFV7RlEYL0N2+XJGF1
Twalr2C0zNOPGqhIO/BckO6Ql4ohm635qpxGEZr8q96tU5h8tg8=
=zH2u
-----END PGP SIGNATURE-----

--Sig_/iBevw1Myz94Y7NwoTe3yDUl--

