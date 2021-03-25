Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F67349679
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 17:12:56 +0100 (CET)
Received: from localhost ([::1]:34390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPSbP-0007vY-4h
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 12:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPSSx-0002T7-Rk
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:04:12 -0400
Received: from mout.web.de ([212.227.15.4]:50501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPSSr-000541-D6
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:04:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616688237;
 bh=2GXtvUXgqbuNrqTGew5OnEi1YQ2B1TP9xvxcp30O8wo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=ovG0XORuUZtVEj73vWiXmAmWZKf7pxB9/yBb6sTRZtC0S5TVFJnGOk1+ArCBHhT1i
 dua/B9361QnXA9/+HrlRkZRiM/YPppIBDksi8jSTn8+dQgS+0t6hvm2gXCJnpWkLQw
 VUI2N6eT0MgY1BQcr72WH4yh+r5Tz+30DslaU8IE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.76]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M8iaa-1lUvZ32Izk-00CDwn; Thu, 25
 Mar 2021 17:03:57 +0100
Date: Thu, 25 Mar 2021 17:03:47 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 0/4] yank: Add chardev tests and fixes
Message-ID: <20210325170347.32931c21@gecko.fritz.box>
In-Reply-To: <cover.1616521487.git.lukasstraub2@web.de>
References: <cover.1616521487.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AUSK7ymw/eGdGY5P32.eXi3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:ZPDzS8XmOpSAANjZspYYNggPfCnp8TFsKpC4mx9P+kpFIB5axew
 6piEGJt7UpVCQ+KYJIfiQ5vmkLw05B5BzaW2EBZHSUB6pqVlInKoKwlaGyA2wWTOYe0t3w1
 Mnbpa/dJC45llFcJHVYYy4L+hInEzD53dt21j0PHVSq5Vz5lkgHwduuTQg7cRQ7vKzzGZOI
 sWZYXZpNMKjW8hRRw5KaQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UBlnSzNpXsc=:a+3PJlY0Ei2Spmnqac9MMV
 Qc/7uIArLe2EimbC3rxx/qA/YDbixFrjyUe+QzACZeY1Xeo0RW6Z91I/fVoIngGqEmzWdI/fE
 TCU4oZT4EGFcQflRV5YUA7g7muHJ19Dq4XMQUzFI1ZikZmR/pXP9wC1jeiN00P193/ki+P2dW
 lDFl1TROULzeECNw/jPBGkOITuc+lNrp0CtAiIdekkzg2mNdnGjlOmoaqn+Vj8OCVIh8J28Ku
 HnnRKu+iMlVbkESHLnsQT63pVdmMSA2GTj4nDtvtSscM/qp5NqavRYdgfS4Rf88/X4WnxRjOo
 viLUs4YaoIM5dtJ9Qjz7wMDhXoPkY215Qcgo4UHLimbSdkR3Ly8vt+K3MNHMnRvSJIVAfP1Kz
 TpB2eBCDBOUKDcLId6Apb1BpnbWJWRTfPF8/DQSziyoSweCbIgmyiOTSjxZKwJmzalLc0CUeQ
 w/40OB4Tw5uJtP22IlEZ7kLyVV646TdtPD/jTZr0Z11caViJTCF0Nx7lUkft2/4bnDfj13mIG
 lIZkRAlGgxJJEUDrgs6cw4ZWFL9Kx5R8huZa6PXLQTrxUDDw4Kb8wCe6SmAA4smUyj6Wf0QI4
 IgSUVEG3EcM1lttKSRJX7I42LfRtgTTUUBbjSGoWwIu6LdchoRTiGfjdnQMIzBRuRCrayh/n5
 O69lxNwiurWyEtFSidPNRSU053FgPcZXtw2+43NYKollAqwXVjwF+NVGFt0qZNOPKMD14OEKM
 d6eu1FG1s7HBW5c7Rj+TtGQcGuN46ElwUkbi20+Jhql8sVhaKbNZKoMhDv0+fqlhjy6rUdmG0
 ktOb6CkbLB8m5sD4JeB8d9IOAvrAdvPV6auHXqJoL2Hltd+GeU0CHI27q4l3GZF0EtP7dM3r8
 5R+ZvcYHXZEGcpX67yGoD0G1E87LQbl1m/RaFRmRYqbjz2dO71NY6s3BNeHF7c8aAg2I73+zt
 QdXItDm5YBduw9Bw8nJR8QgP7jVQIz1KitfKOlJKAWh5j8ZymYgvhHSQM0yXzeyK1wwm7EUJv
 H2z64xW+iWQ9YeS6YA6ApDgyO6EAceycd4V3ijLpRJDHbe+C3trjsJCw76Pj2PsmAf8LgL0D2
 MlFD5Zj2k/e7R22jypoZtbD0fr/dBvgqoeHyuWegjPftt6uaf5Wxjm/L+E2aY3j+lqjhdyQHM
 /fe1b9gSDnyxRdAOs5Z1P2k0D4AuS7LTjGrtFsGfpp1Z3D+rpzvoe6HhnL/KnC0RBsnPg=
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Marc-Andre Lureau <marcandre.lureau@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li Zhang <zhlcindy@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/AUSK7ymw/eGdGY5P32.eXi3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Mar 2021 18:57:32 +0100
Lukas Straub <lukasstraub2@web.de> wrote:

> Hello Everyone,
> These patches increase test coverage for yank, add tests and fix bugs and
> crashes in yank in combination with chardev-change.
> Please Review.
>=20
> Regards,
> Lukas Straub
>=20
> Changes:
> -v3:
>  -Base on <cover.1616521341.git.lukasstraub2@web.de>
>   ([PATCH 0/2] yank: Always link full yank code)
>  -Drop patch 1 (tests: Use the normal yank code instead of stubs in relev=
ant tests)
>=20
> -v2:
>  -test: add license
>  -test: factorize testcases to a single function
>  -test: test chardev_change with initialization of new chardev failing
>  -fix chardev_change with initialization of new chardev failing
>  -add reviewed-by and tested-by tags
>=20
> Based-on: <cover.1616521341.git.lukasstraub2@web.de>
> ([PATCH 0/2] yank: Always link full yank code)
>=20
> Lukas Straub (4):
>   tests: Add tests for yank with the chardev-change case
>   chardev/char.c: Move object_property_try_add_child out of chardev_new
>   chardev/char.c: Always pass id to chardev_new
>   chardev: Fix yank with the chardev-change case
>=20
>  MAINTAINERS            |   1 +
>  chardev/char-socket.c  |  20 +++-
>  chardev/char.c         |  77 +++++++++++-----
>  include/chardev/char.h |   3 +
>  tests/unit/meson.build |   3 +-
>  tests/unit/test-yank.c | 201 +++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 276 insertions(+), 29 deletions(-)
>  create mode 100644 tests/unit/test-yank.c
>=20
> --
> 2.30.2

Ping. It would be cool if I could submit a PR for this for rc1.

Regards,
Lukas Straub

--=20


--Sig_/AUSK7ymw/eGdGY5P32.eXi3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBctGMACgkQNasLKJxd
slhvWw//Zw86/xv+KI6fn5Poxs6UF/gTnL07n8B2xvUB952mYFqNKHRLSseTCYbz
CnLWOT6+JaHwM699uzLtnsm9uv19ay8IlJ3Ac1xkOjC8sGaQmvfrVLpxatkkAyiw
vSlxbUtuXOgsg1SELjRaXVIPD+vDyKcam7s8dc6bAjyRcjcqhOdsAZeABkG2gNRx
a59kDkEqUOdxsEjttJ7cfcTLN++x8EZIDrDmhTZvrTRzR543VwK15PHTsw1+guMY
su2DnZClTvXS8U2UFGaoxq2SoR9yDmO/MJAHHojjjv+HbJ06M3pd0Rx+OhgO+00k
UWhIcj5CcTCo17qewna1WD6nfpPrztO0k7h24TiTqJD6KCnw/9A9vzuh5b8zjENu
4NoB6DcluGYBRD0LRqHxDJlA84dF2EDqZzZlhWpyD4+1TniX1kEu+smUm3KfQD1X
4jmhMOnEsOIvwGk2J10odfN70HlqVeeCK8OTrVlLWdJSrydVIjszyqfFxzlFUHoo
iWNbSTmX2TY23Cs3zwbqYkJlhiv2Pm14o1o1lEN3OvKcJObBKjbiSLsYz0qbJy8/
FJjMnX4STwBMPGbtao4H7Lfjp1/4wpw5JToVq57zaSlzNg1U7eKXhtx6up3NHr2R
kalp3E6rk5FeWrYsBMzo57kvjRLpM3tOm50bNXYn7279nMnm/TQ=
=nBel
-----END PGP SIGNATURE-----

--Sig_/AUSK7ymw/eGdGY5P32.eXi3--

