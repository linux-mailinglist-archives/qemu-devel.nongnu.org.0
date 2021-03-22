Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB391343976
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 07:29:03 +0100 (CET)
Received: from localhost ([::1]:35794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOE3i-0006km-M9
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 02:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lODyC-00058E-Na; Mon, 22 Mar 2021 02:23:20 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:39295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lODyA-0000jI-6Y; Mon, 22 Mar 2021 02:23:20 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A367A12A6;
 Mon, 22 Mar 2021 02:23:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 22 Mar 2021 02:23:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=oThmdgttRpsT6E1Vy72fnN+/xbz
 B3iam4k2ynww2EKk=; b=J5644mIjYaBbEBx3pSACUsE0jBlgKd0BuPzXMEauyVE
 zGWOg4lPWUfpFRixgvakaJelCydZMiJwd2oqU54VXSvSa0wcoSk42dKduC+QZr56
 2fAwWiMHyQKPSrUZM+yY5rrBG6RLDY0DfcJyza/uP66J9Xoq49sATa1FuPzbyjYO
 0y2aV/vCHQ8LbE9Y1O1hQWY53ZVay+/IQVGSpSLE0OHQGa9DCoWct/d3CMC2x2V2
 nKi+GwtCRuKjo0i1ZXcAg9GqP8A0FxwSJQOySnXtBF1ANmvgoBdQGv/d/T88SxbQ
 b0bUZl6gTQ+c9L6ph3ysdywZpdFP1Q++qZwORnerKAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=oThmdg
 ttRpsT6E1Vy72fnN+/xbzB3iam4k2ynww2EKk=; b=cT6I5hViKwysZ5NDNYJ54Q
 ZAeEh/8ooHoppXgwtbbiugdf609G/7Bnd9dGcoFyuQfF5MjneGPyAnA8z/bglbxs
 zRQz5Szp24jEawt2HV1H2UkTBvMf0t52Tg1MLvPU6J1SBJDsTbtJMRTnnDgSc2dl
 RDdsFGf0sG/Ano47nSblkKS4fHDZNcO25JCR87/9q4DbSsr3I9+TFX6hmByO2SMA
 OskklJ9e9Oba+haSGhkZIQLfcWNB/C89u2wPcq/pgOaJUIL93eEWz6yXlKpoCKfk
 OMQXnZhLXVVkDK3qA+/D1Wjq+U+QZseKYCRXhGU0Jezt/8awAzbMhQxuOyiuHSHQ
 ==
X-ME-Sender: <xms:0DdYYLn8_ZrSPeMawBcA3d6IvFd5H_RYHIWgfpDRuh6qJ9TmTf4dTA>
 <xme:0DdYYO3stN_6Sr8DfAhqIHvklHkwHQEkBSDEwEIDUbihh0q1rzUlOetvnsRqQ4sT7
 ZWvaO8OG8o99aGs46k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegfedgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedvteegtedutdeguddtffevvdevudefueduhfetuefhjeegfeegtdffieehteev
 udenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghdpqhgvmhhurdhorhhgnecukf
 hppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:0DdYYBonwrTsYc-WFR3xFZAPfgu55d7zf1IWoDvEnbGbfjPxMc26-Q>
 <xmx:0DdYYDlup0JNV6WHqUrKf8hBjXCUUDJ_lAgm9ndWxuMVVv3oEAXctg>
 <xmx:0DdYYJ3oIBWe-0XxZ_oMaqhgNdnevJhvWjm0vXRWgvphMPC-cvU0kg>
 <xmx:0jdYYGmMl2RKr4md0EDKBkDhwwLV0TVof70IT4oG-feHxndyWiHuJg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6B3C11080057;
 Mon, 22 Mar 2021 02:23:11 -0400 (EDT)
Date: Mon, 22 Mar 2021 07:23:09 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 00/11] emulated nvme updates and fixes
Message-ID: <YFg3zSH7azC/n2OA@apples.localdomain>
References: <20210318115757.58923-1-its@irrelevant.dk>
 <CAFEAcA8V-1xvWr6diFweqiUKBzu1HgmHJhOacYGC4uE15UA=iA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XF6oVvqzvSmTFGDW"
Content-Disposition: inline
In-Reply-To: <CAFEAcA8V-1xvWr6diFweqiUKBzu1HgmHJhOacYGC4uE15UA=iA@mail.gmail.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Qemu-block <qemu-block@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--XF6oVvqzvSmTFGDW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 18 23:03, Peter Maydell wrote:
> On Thu, 18 Mar 2021 at 11:58, Klaus Jensen <its@irrelevant.dk> wrote:
> >
> > From: Klaus Jensen <k.jensen@samsung.com>
> >
> > Hi Peter,
> >
> > The following changes since commit b12498fc575f2ad30f09fe78badc7fef526e=
2d76:
> >
> >   Merge remote-tracking branch 'remotes/vivier/tags/q800-for-6.0-pull-r=
equest' into staging (2021-03-18 10:05:37 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request
> >
> > for you to fetch changes up to dc04d25e2f3f7e26f7f97b860992076b5f04afdb:
> >
> >   hw/block/nvme: add support for the format nvm command (2021-03-18 12:=
41:43 +0100)
> >
> > ----------------------------------------------------------------
> > emulated nvme updates and fixes
> >
> > * fixes for Coverity CID 1450756, 1450757 and 1450758 (me)
> > * fix for a bug in zone management receive (me)
> > * metadata and end-to-end data protection support (me & Gollu Appalanai=
du)
> > * verify support (Gollu Appalanaidu)
> > * multiple lba formats and format nvm support (Minwoo Im)
> >
> > and a couple of misc refactorings from me.
> >
> > v2:
> >   - remove an unintended submodule update. Argh.
>=20
>=20
> Applied, thanks.
>=20
> Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
> for any user-visible changes.
>=20
> -- PMM

Coverity reports two leaks in nvme_format_ns and nvme_dif_rw
respectively.

Fixes are submitted and I'll send a pull request ASAP.

--XF6oVvqzvSmTFGDW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBYN70ACgkQTeGvMW1P
Dek7zQf/f/+s2TyzlTtocWzzcEBvTtFuXqfeUNix1VxA5qbnc0uJQrUCg52zn8Qn
t4Acl9jlJQqtTBYGX7LnJ40ICGqkpqHrYFhCyJQW1WfgewQzooYAa/h2AtuLjNKY
sA9wURbFqpV1szkfcoNKnfZydi7PouLvbPwCy2uF7CIjaTCuJdVujUyf4PBO6cs+
jX4KCj9VIKplflHBA+a2p8ISsfMfQysMUiyZR7OGOv8VmY9o/CwOOngd1jB8Vc/1
JNmPxdD5FtkiJWZG5vbNn7E6s14qKEqVpAWLug7Ko/VIDtM8k2VixG5kLisfV+3c
KhiindT2pxwClVqWmztIt6X0NQosYQ==
=6ntQ
-----END PGP SIGNATURE-----

--XF6oVvqzvSmTFGDW--

