Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3323C617F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 19:06:00 +0200 (CEST)
Received: from localhost ([::1]:50686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2zNX-0002gT-0l
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 13:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m2zCb-0000Sg-R6; Mon, 12 Jul 2021 12:54:41 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:44125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m2zCY-00051t-IC; Mon, 12 Jul 2021 12:54:41 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 3D5EC5C019A;
 Mon, 12 Jul 2021 12:54:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 12 Jul 2021 12:54:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=o/bYtJxg2AQaAt5eN6YHYkFFhqB
 waQ35Z5GKfc2ZQPk=; b=L3S5FDfMDLYfdTWlmmNhkppSF0k8htUAlNexKwgcS3U
 azJBIMGG/BOrrsht1hV3BPtUyUClJFj7xX4atcmdQwKDGIF90aLS8FXLDSy9CIzk
 kbFhemA4QzkWrTZrv7zx6h8/RkmFy+by20Y3aBovgnThywmqeTvUmNDLO4Glyz9V
 4INzT7h61evCHVg5PNDJmp2h4SS1D8lzOKBBn5jp6SRiPUV1ydnyoQ8FcPFv/9nC
 mOfQcOQv7/XjMnnKkl795Z2zH+CWSfstOVSnyKgapC3s75DJUHA2I5tRbWcjciAB
 +s03f8rPUdVvNL8KtJntn6DJqxJMdK+pFdLMPpomqEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=o/bYtJ
 xg2AQaAt5eN6YHYkFFhqBwaQ35Z5GKfc2ZQPk=; b=eKxpYa0doyBlgvs0WyMfDM
 l9/+YI7uddu50YGg/nrWWztHVzUMQ0sQjkZzESKDGxsGQiFhjU5dmZxXsBGX0SN4
 8dscltMOXGytSNKaJIPHa89SgRhNea+krPwlWW3lXLO8YzZNHWAOPtklv2tNcaYR
 IuFsnPYDzpjHOQXn132q6sTjYxU5WZmdPJ5x0UipWUjH+PHvWIiAAhpVll9wb/iq
 0l7V2SC3czbRwAOXOYXkMS/nBNjauUbnVmAEF23Jb1b+kfKIm5xTj4jfXPBfMWUH
 1+Jfi7zsso25AtsJ1x/cbBlAn5gx9sQ6YvTqtOUWtKXCizISaZtFXySGyiZsdq9g
 ==
X-ME-Sender: <xms:zHPsYHGQs3XpqL3HyQSPgop8YPMgWjmBX4VNOpim1gLFsOXjI2XZjQ>
 <xme:zHPsYEUiXN9svbXWUqqkg0LOwY9z215JpQLeU0pWqmCJ9qA5NQgdzIJN8Bcn0Dxg-
 saqnUt-zY5t1ceBcR4>
X-ME-Received: <xmr:zHPsYJLtAEYwSUnt8kO_JUvoh63eiQkvygw-95a4nRPsFTqK6SebZempoQCdcXBjkv6ugV_N52fQFdQs1kMnMk8JCYelh_QQwFZ6MFXtCkz9JDL9UQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvgddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefglefhheefheehfeekfeejtddvtdehtdegveetffevueeufffgieefjeeggeel
 gfenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghdpthhrrghvihhsqdgtihdrtg
 homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehi
 thhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:zHPsYFG_UYdp5vu5x8ql3KJCNHOWsYZJ9o25f3sSthQA8bv0vsvrKw>
 <xmx:zHPsYNX_oOhakfMBRXQqpz3LeoqVekbFKcJghImITv2HhhyAe5LNBA>
 <xmx:zHPsYAPoqMHbh3ivUbwAIF41k5PZmllwLu5QhjEfjvGVNZvGfdExkg>
 <xmx:zXPsYDyIJuc-kAmOHx0aIYhrXZOxkLZFy9BQLrv0VTprrPH73bh2GA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Jul 2021 12:54:35 -0400 (EDT)
Date: Mon, 12 Jul 2021 18:54:32 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/6] hw/nvme patches
Message-ID: <YOxzyLBXcHEWAWzu@apples.localdomain>
References: <20210711202736.591334-1-its@irrelevant.dk>
 <CAFEAcA_RqcLGDvjhmd9a5hxXLzWEF0PpC5BNZi1THtOwLRdyzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="I6eSPD+qyDadvrcc"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_RqcLGDvjhmd9a5hxXLzWEF0PpC5BNZi1THtOwLRdyzA@mail.gmail.com>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--I6eSPD+qyDadvrcc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 12 15:51, Peter Maydell wrote:
> On Sun, 11 Jul 2021 at 21:27, Klaus Jensen <its@irrelevant.dk> wrote:
> >
> > From: Klaus Jensen <k.jensen@samsung.com>
> >
> > Hi Pater,
> >
> > The following changes since commit 9516034d05a8c71ef157a59f525e4c4f7ed7=
9827:
> >
> >   Merge remote-tracking branch 'remotes/cminyard/tags/for-qemu-6.1-2' i=
nto staging (2021-07-11 14:32:49 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request
> >
> > for you to fetch changes up to 9cc1a34ec4fe7e89e44e460dcf50159e40962e59:
> >
> >   hw/nvme: fix controller hot unplugging (2021-07-11 21:50:22 +0200)
> >
> > ----------------------------------------------------------------
> > hw/nvme patches
> >
> > * new PMR test (Gollu Appalanaidu)
> > * pmr/sgl mapping fix (Padmakar Kalghatgi)
> > * hotplug fixes (me)
> >
> > ----------------------------------------------------------------
> >
> > Gollu Appalanaidu (1):
> >   tests/qtest/nvme-test: add persistent memory region test
> >
> > Klaus Jensen (4):
> >   hw/nvme: remove NvmeCtrl parameter from ns setup/check functions
> >   hw/nvme: mark nvme-subsys non-hotpluggable
> >   hw/nvme: unregister controller with subsystem at exit
> >   hw/nvme: fix controller hot unplugging
> >
> > Padmakar Kalghatgi (1):
> >   hw/nvme: error handling for too many mappings
>=20
> Hi; this failed an assertion on two of the travis CI jobs and
> then got timed-out for not producing any more output:
>=20
> https://app.travis-ci.com/gitlab/qemu-project/qemu/jobs/523720897
> https://app.travis-ci.com/gitlab/qemu-project/qemu/jobs/523720898
>=20
> ERROR:../tests/qtest/nvme-test.c:89:nvmetest_pmr_reg_test: assertion
> failed (NVME_PMRCAP_RDS(pmrcap) =3D=3D 0x1): (0 =3D=3D 1)
>=20
> ERROR qtest-ppc64/qos-test - Bail out!
> ERROR:../tests/qtest/nvme-test.c:89:nvmetest_pmr_reg_test: assertion
> failed (NVME_PMRCAP_RDS(pmrcap) =3D=3D 0x1): (0 =3D=3D 1)
>=20
> No output has been received in the last 10m0s, this potentially
> indicates a stalled build or something wrong with the build itself.
>=20
>=20
>=20
> These jobs both run on s390, and my ppc64be and s390 hosts
> both hung during "make check", so I think you have an
> issue on big-endian hosts somewhere.
>=20

Thanks Peter,

I'll look into it!

--I6eSPD+qyDadvrcc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDsc8QACgkQTeGvMW1P
DekriggAxH10AIGw9M66hIHUgnNj8yipH664O8o2OQblVjoekMefXXgrBmoDz72W
eSTwOyjNncj1FmXdT5AA00mPt0WOzqqnPdjrnYyo0LyxkLd/m63bWncEuVenRd6c
ENeeaAPvqjQMy6nYEkHWqZgP83VPm8uhq87jsIK/euFnb1zl6tCaBvjGIkIwlB1P
0E+/FERBRwjsUBOXcxNXj9n7E/dCie0AewRiCv6bq6YhwkXmxSQvynQppo9T32b/
G2vYQIlcrX84kgpWmKXz5keWWGWVIPEifS1BXj6iSqKgTJz3RQQSzAfu/P2hNykz
2djT4wJ+BkvL5DtNmIs2WkW/DiunYA==
=gZ9a
-----END PGP SIGNATURE-----

--I6eSPD+qyDadvrcc--

