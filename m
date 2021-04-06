Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0FC355B4A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 20:26:22 +0200 (CEST)
Received: from localhost ([::1]:49326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTqP6-0003PL-QE
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 14:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTqKX-0002Tw-9c; Tue, 06 Apr 2021 14:21:37 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:42293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTqKS-00030j-7L; Tue, 06 Apr 2021 14:21:36 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 87B011644;
 Tue,  6 Apr 2021 14:21:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 06 Apr 2021 14:21:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=rGmNsrOLKwAG6I9kWymDW0cLzMB
 o+9y/+exZ0W0XxtM=; b=qTMFDWVsiJPZHqJdWysIQ9uOa48enEM6hdjfgVsp9rr
 2JCZ7pNiPOQZRdNVZa4mdM7FhfV4o9gTeLMQhIBM1noyO6UDSEpLaHXrsAxM0dd/
 2u81lNZlAF8rMyzfbKUZ/C37cTiSDYZ5/sOKwVaTrN0e3pmNK3+wmhgR2uPc/Qab
 uBEi7hQv/SwsuZ0zwrKPgh97pk6aXQ9wiQh9nIK21zA6DrnB0rejglRy2vtx8x5p
 3Z828RA/rXSv/b/eUXioVkWCXMbCPvKiK8Pu8CpEZ+ETjP03fzxrUeWGD5UeqyYe
 +U6pLQEBhdyMoSWMW4zITYWF0nMaqjCpcR6obuNWubw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=rGmNsr
 OLKwAG6I9kWymDW0cLzMBo+9y/+exZ0W0XxtM=; b=qnE98M9XF4O7idU2ggpuli
 WFN2DJL/ZarGziRw5Zt1NNxgNJLtNnolL/4GoYIlyKi3Pm4ZWITpOmoLqWBKl9u8
 IdYnNEdx5bDKoW/2RpThwwTVpH0WI+TDsY+d8aowe6K1+h9FmFXvDgPu0kayuPYF
 TSz1ZD6poM+GkYjNqATpSCt8PrBR79iaWMJvC67yutpbBDJUouq4HDkiS2DWnqO3
 8oBdrxi5S8WpXfZiFMKz2qnV2jRJ0cE/gJ+1v7b98UmIvCv7SghA6IUuJ9AW/uX2
 2VmlnepamNmqvJxodqW+9gdK2E50bl0CulLtPJPgojXSzjvtoCjgcUHzmOyX2NXA
 ==
X-ME-Sender: <xms:paZsYF-fwcwAPClUR_QXYgDWhZ3FyokQkuex21XrNDBUwsCb-w3Shw>
 <xme:paZsYBe5_lkS8jy1IhjdFszW2BslVI10c3lZI_trYbMPjCDfeeWfCAbCgg3IwvgxL
 vYlC_teLKOIaucpqkE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejhedgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:paZsYGH0VCnEllLeZ-l88LN2QloMijryBWZ_FKNLVpByLggxwt8UiQ>
 <xmx:paZsYHe0uF4iV3A3xpoWdC6J_YPtlGqvGxluJm5e_bA6XOCx1X-fjg>
 <xmx:paZsYIHKTkS0FQW7EqSwC7_W0aK3q6nO6BN3fTFKZqKkipb_TXNm_w>
 <xmx:pqZsYANcCWQHvys2-Kab2uX3I1o3wRzvtkti4UkXINvsj48rTGWV2ligMb8>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4604E240065;
 Tue,  6 Apr 2021 14:21:24 -0400 (EDT)
Date: Tue, 6 Apr 2021 20:21:22 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH for-6.0 v2 4/8] hw/block/nvme: fix controller namespaces
 array indexing
Message-ID: <YGymog1yYgf+9Txk@apples.localdomain>
References: <20210405175452.37578-1-its@irrelevant.dk>
 <20210405175452.37578-5-its@irrelevant.dk>
 <e9f266a2-f12e-6dca-805e-4f70a4ffc248@redhat.com>
 <YGwNipvKFR94iUvq@apples.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ovFx9f6KActqLu7m"
Content-Disposition: inline
In-Reply-To: <YGwNipvKFR94iUvq@apples.localdomain>
Received-SPF: pass client-ip=64.147.123.27; envelope-from=its@irrelevant.dk;
 helo=wnew2-smtp.messagingengine.com
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ovFx9f6KActqLu7m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr  6 09:28, Klaus Jensen wrote:
> On Apr  6 09:01, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 4/5/21 7:54 PM, Klaus Jensen wrote:
> > > From: Klaus Jensen <k.jensen@samsung.com>
> > >=20
> > > The controller namespaces array being 0-indexed requires 'nsid - 1'
> > > everywhere. Something that is easy to miss. Align the controller
> > > namespaces array with the subsystem namespaces array such that both a=
re
> > > 1-indexed.
> >=20
> > TBH I don't understand the justification.
>=20
> Justification is mostly to align with the subsystem device. I like the
> '1-indexed' approach better. And the -1 causes Coverity to complain
> before the assert was added.
>=20
> > Assuming you hit a
> > bug and try to protect yourself, maybe now you should also
> > check for
> >=20
> >   assert(n->namespaces[0] =3D=3D NULL);
> >=20
> > somewhere. In nvme_ns() maybe?
> >=20
>=20
> That is definitely a state that should always hold, I guess we can do
> that, but we do already guard all "insertions" into the namespace array
> by an assert on the nsid. Then again, asserting here makes sure that we
> don't introduce something else that inserts on this invalid position.
>=20
> So, good point, I'll add it.
>=20

Then again again.

I don't see the reason for the assert. Even if something ends up there=20
by mistake we will never return it. If something ends up there due to=20
new code, that nvme_ns() will always return NULL when nsid is zero and=20
that should weed out the bug easily.

I'll update the commit message to make it clear that this is about=20
making both the subsystem and controller namespaces arrays 1-indexed.=20
Them being indexed differently is a recipe for disaster I'd say.

In anycase, I it actually a stretch to call this a bug fix, so I'll drop=20
it and queue it up for v6.1.

--ovFx9f6KActqLu7m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBspqAACgkQTeGvMW1P
DemBrQf+JfbyX4WrIFkGfgaXdH6u73lBUpgQBFMWN2PAQrZRU5iBkY3HJQkHjvZC
AMEfxX8ad031ft3t3P1h+TL4Y5DxN1ICEGOsLFLPOMyZKJSWcIl7cZi9Mh8Rkdww
JyKsoJX6v8NLGcPsui20dkO0e5JNM97hV4QlNGRs+uIrV2zxboRtx2Q7zrp1hTS4
avD3HqeXI3HH/pmREQhwJQVGGxPmBlrgcUsSk8WNbHAXORLjbjr4Xr72znYsH2kW
J9M1kTXiUH9+HQ2Y8+PEHhh2CL0a33NZppqMkS9yZ1VBMI0Tjq/wvDYsXWV0Bh4F
I2fecNrO7P9S8KAE30Y0xxlMdGv9tA==
=Dx/c
-----END PGP SIGNATURE-----

--ovFx9f6KActqLu7m--

