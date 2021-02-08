Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9C831351C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 15:26:16 +0100 (CET)
Received: from localhost ([::1]:57356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l97UR-0005w4-Tu
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 09:26:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l91WG-0006Az-OK; Mon, 08 Feb 2021 03:03:42 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:41517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l91W4-0003Hh-Rj; Mon, 08 Feb 2021 03:03:37 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id B4305C89;
 Mon,  8 Feb 2021 03:03:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 08 Feb 2021 03:03:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=iESZyxQjY90CYO7KRSRUtZyzKIg
 sFQMekvoufJAFy+8=; b=Q5aI3O8JyCYrcI58c4eTKgmREk+vAU0MkGGj/ougBRC
 +HNzGgmjbNFfSZit8viaYQViSt07sSG4R952TGeuSC64tdN3ppLfYUz414DfFukh
 QdPNXylzv07CIooOOip0kGHFIYHtx9xOxpe1O4MGuE06W7VoZJtQDPoS2YZ+E0o9
 lscR90R7LzZBDUps6fRURcDIxqjAXiYYELFN5BfjH4a50bMb/cXGUzTm1/TvVphs
 Ta0JJG1y8mpAMDkCwVcU17QAo6G+NB/MbUPP3mvc89XejMBXKGVeNYsrGeH8Iazt
 4GjRWsLfF3xPpKmMRywZngnUP+VTZ69ZXJ81znoRZ8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=iESZyx
 QjY90CYO7KRSRUtZyzKIgsFQMekvoufJAFy+8=; b=FCj4+OaxQZn8GKZEUbf2mP
 ncAJpmxsK4Ag26arpJGaKczZLNWDU0I+EVFBXuL9OS7Kw8d4uaqx5aJR1Xt9ImW3
 xkZSpxCi47zM4P7hFqc5z2DsMkV28VmPff/YIq9jW7iRIlOO40WqGIWIv4ebP1eE
 XfKS2lLvWorCbvtGjh3XP1TdfTnOHNzzY2yIanLoo5AcAFEcWQepH5t9xjXAaagL
 UAIGgCbBlirxiBUAsTCcl4hyMrHBWUCx0cR4+LRhxb4hYkoXgLUL0jAVVWHa+Avc
 fdyJTZ5McRJ6awTqgvruEcHUwQdrT0TN4ERjTbBLGY4MBW8Ml5nmkDPuP8sMmbHQ
 ==
X-ME-Sender: <xms:SvAgYNb8AVnoIv_qVnaIuCifTqO34VRDD4XKqiGwnqG4lpQWLqa4hA>
 <xme:SvAgYGZWa9RXrtLXcvW6hNpr-GPlwJKR0nKRGR3a93NTaTL98B4ZK6TiExaC491Z9
 eCrJkHfjPiJzAdfvsM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrhedvgdduudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuueffiefhgffgteehjeeiveeludfhteffhfehiefgheetjeeitedvtdegvdeh
 tdenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:SvAgYJXu0GNY1pr1mzJdQm9_7afccpzpR9PdRI-He_2vS7aU4V4FtQ>
 <xmx:SvAgYN1o0P5oMsUoMMOdcLBnfHFkADn_k5WMksdSueGzCjKYSH6oDQ>
 <xmx:SvAgYAYhWtBiORz7dCpKUfHK7_cUR43fTGIHS4_8GXwzjrJFu4EPJA>
 <xmx:S_AgYOmHW2VZhfethZCE5bW0dKJkQKjHUQc56XTmFmidyAzoOHI4jg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 04EC6108005C;
 Mon,  8 Feb 2021 03:03:20 -0500 (EST)
Date: Mon, 8 Feb 2021 09:03:18 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
Subject: Re: [PATCH v2] hw/block/nvme: add missing mor/mar constraint checks
Message-ID: <YCDwRmZAeQxAJRFM@apples.localdomain>
References: <20210126121529.317189-1-its@irrelevant.dk>
 <8f17c20687867bf2916ee44ef22211887ef349eb.camel@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a74JHqaGD4vUD2P5"
Content-Disposition: inline
In-Reply-To: <8f17c20687867bf2916ee44ef22211887ef349eb.camel@wdc.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "k.jensen@samsung.com" <k.jensen@samsung.com>,
 "anaidu.gollu@samsung.com" <anaidu.gollu@samsung.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "kbusch@kernel.org" <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--a74JHqaGD4vUD2P5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb  8 00:13, Dmitry Fomichev wrote:
> On Tue, 2021-01-26 at 13:15 +0100, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Firstly, if zoned.max_active is non-zero, zoned.max_open must be less
> > than or equal to zoned.max_active.
> >=20
> > Secondly, if only zones.max_active is set, we have to explicitly set
> > zones.max_open or we end up with an invalid MAR/MOR configuration. This
> > is an artifact of the parameters not being zeroes-based like in the
> > spec.
> >=20
> > Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> > Reported-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>=20
> Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
>=20

Thanks, applied!

--a74JHqaGD4vUD2P5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAg8DkACgkQTeGvMW1P
Dem4yAf+OTbCHfpMsGv361kh5jLej5pUrjLwR307GSYO8nH3Bp2bXF8cuuk6zsl7
M73UZlB5iY88iXK540ZomIUi1dZqndWmZPfESQ7UorHcCM3A3JCeGYCoeIBphFax
L9gMvOSVuoe4vS55ZSZd2KtL9roqcL0QoGP3ae102uDJK1rEi2CYoBIuNpYjMVeK
dmgjYhcXOu4IlxqGN8HApe3c1wJkQiviEu2arOYDjU7Ji3eGF9SPuP1veNmq9sPZ
jP4JRlFsjFrTjFKJCh1QtgdnQXLSmImDRB/FAcZbWHI1H6s1GnHWHnbKewgsh4Gz
BB6ZV+hZy0ZkACiLD+psV7BRTYIVfw==
=kPOI
-----END PGP SIGNATURE-----

--a74JHqaGD4vUD2P5--

