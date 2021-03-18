Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE3B3404BC
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 12:37:30 +0100 (CET)
Received: from localhost ([::1]:52440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMqy1-0004pC-R1
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 07:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMqon-0000Fv-Au; Thu, 18 Mar 2021 07:27:57 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:50379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMqok-0000kW-Mi; Thu, 18 Mar 2021 07:27:56 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3DFF25C00F8;
 Thu, 18 Mar 2021 07:27:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 18 Mar 2021 07:27:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=7GSQZKUYRUkinlilIgcNAO/VOMD
 YZaUB/em3Y0Hj24w=; b=QOs6OiSnIOTN3QWaKVj37WFM/GeB1nZFnGCy6Swg7VJ
 gPfmssPb/K1XN9vXgnno/ndvLjVcwsu9xf8nsd4v6OT5jGNR0fBowxGt4+aSMhop
 01RGbpMIu/2vp+HAKI+nkcvaPiFUvqEUsmiulE7k1ZPAXv07SnESj82RtLz5u0fq
 b2Ikf4fsTT6YjE/uBu/GY6pNAuOgtqJeBIEydrP5Y9uAkyZMK0Sv6Fe9LGiceVLa
 yyhiAWoJdFk8cb/PATylSIJk1CzUfPGZHCH+1t/ZtsnJ7sTmwSpOz9MBTsTZS4jA
 QN5B0xxzv/vd07NMoYQxg8ysNtNzWBbNk2DZbz9MDOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7GSQZK
 UYRUkinlilIgcNAO/VOMDYZaUB/em3Y0Hj24w=; b=tIN/Ik7AQpP6yc/+jL9H83
 hLeWyysMBxUZKIVZKJsgbeD23BBdKDG9jrD6AFFIPrS45A3CrvMLsq6uMv94NTmq
 yyrZpzomRxC2rjexBRm6IUjh9uSo92Kk+ER1dgfKBU8yBBniUo15UV6sN6xE57Jm
 I2VqjgCq9TwSHBNcPGjELAG4yJtFF6SiGSML8CUR3msTmaJF4PmYdJfQRr6u/TYf
 OB0/FVSdt2nx11C59FGkKGK/ZBxRa2xGfvrhaDyINNrDLZii3OnTeo6FMgwrAp57
 3Pr/Yxk8VWK/rRU0NJXrD7U3E7z/fWk+jZH/UEviwKNcfNMYJKmPJJN+Uf74YRZA
 ==
X-ME-Sender: <xms:NTlTYC0E54gohmqg3zTBHo_vqCwwM2CIl-JGP7X5Kyd6PalSAeM6yA>
 <xme:NTlTYFFRj_8hv4REoxlJg6kuYIEM6wzKzKdhJqmeCFdTmZMBFfA97IHNd4EaYQ3rD
 hqbQQmjrgbuyUVW4os>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefiedgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedutdehleelvdetvdefueehgeevhfejueeliefhudfhiefffffhuddtkeekieek
 feenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepkedtrdduieejrd
 elkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:NTlTYK69IL_633ETBrlHxPx7-Qio4SnfMXt0o9UWIm4oZbnkNMujoQ>
 <xmx:NTlTYD2DptBdXZ5qEfI0Wq8NvE8rGtnuaA8DoyjRTLhNyw9jFDiuCw>
 <xmx:NTlTYFFzTo9yBsG68LSCh7LLQBWfG5I2S4PeX47n-o0KkcMHAxAE1Q>
 <xmx:NjlTYM3RIy33hQQuJAKQvKMgHdrPho6nCguwJEX5VcaW2KxQFhysZw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id BE57A1080054;
 Thu, 18 Mar 2021 07:27:47 -0400 (EDT)
Date: Thu, 18 Mar 2021 12:27:46 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/11] emulated nvme updates and fixes
Message-ID: <YFM5MjqxwMiddbaB@apples.localdomain>
References: <20210316214753.399389-1-its@irrelevant.dk>
 <CAFEAcA8_rcfiYz4NSqY1QKA-FMPK7Hk3xcVvFbXGZnXw_HKuYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9ta+oevFmlYXBj3I"
Content-Disposition: inline
In-Reply-To: <CAFEAcA8_rcfiYz4NSqY1QKA-FMPK7Hk3xcVvFbXGZnXw_HKuYA@mail.gmail.com>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Qemu-block <qemu-block@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9ta+oevFmlYXBj3I
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 18 11:26, Peter Maydell wrote:
> On Tue, 16 Mar 2021 at 21:47, Klaus Jensen <its@irrelevant.dk> wrote:
> >
> > From: Klaus Jensen <k.jensen@samsung.com>
> >
> > Hi Peter,
> >
> > The following changes since commit 6e31b3a5c34c6e5be7ef60773e607f189eaa=
15f3:
> >
> >   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request'=
 into staging (2021-03-16 10:53:47 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request
> >
> > for you to fetch changes up to e2c8dd15807886ca234ffffcdd06eba47fa65162:
> >
> >   hw/block/nvme: add support for the format nvm command (2021-03-16 22:=
30:47 +0100)
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
>=20
> >  hw/block/nvme-dif.h    |   53 ++
> >  hw/block/nvme-ns.h     |   50 +-
> >  hw/block/nvme-subsys.h |    2 +
> >  hw/block/nvme.h        |   44 +-
> >  include/block/nvme.h   |   29 +-
> >  hw/block/nvme-dif.c    |  508 ++++++++++++++++
> >  hw/block/nvme-ns.c     |  124 +++-
> >  hw/block/nvme-subsys.c |    7 +-
> >  hw/block/nvme.c        | 1257 ++++++++++++++++++++++++++++++++++++----
> >  hw/block/meson.build   |    2 +-
> >  hw/block/trace-events  |   22 +-
> >  11 files changed, 1939 insertions(+), 159 deletions(-)
> >  create mode 100644 hw/block/nvme-dif.h
> >  create mode 100644 hw/block/nvme-dif.c
>=20
> Hi. This tag includes a submodule update which is not mentioned
> in the cover letter or listed in the cover letter diffstat:
>=20
>  roms/opensbi           |    2 +-
>=20
> so I suspect it was inadvertent. Please fix up and resend.
>=20

Oh crap. Sorry!

--9ta+oevFmlYXBj3I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBTOS4ACgkQTeGvMW1P
DenTlQf8Cb/G+cti392z5NSo/OyiykkrRjKVBhUMZM/JctsNrUYQQtGeEaujWpwN
jeN+tMHOY9UPn2+dfRRbbx4MVdSbSy79JLLAPnohcX/8j6GwbwBMaEfocBq9oG2s
5mN84wjVvKnkplOuMax+i1nSNZeVu1/IWhJPmDZ6qoUm5TP0468+jP2oky8HLh8H
5PjpW53S5Ez9N0U5AeNdU4TmzPcpu08JAfvYqjk/eeqlXImm3AwQ8uN9e+fqozNX
ofjfeiJDkXHZ4UuGaGUJwlH0UrSRoPaTuRuebzX7XpGWCqlD+cdrVwsFj9QOI05o
p3w2MxXjZFAHgGdztzFULVSWDFRJTA==
=Z1t2
-----END PGP SIGNATURE-----

--9ta+oevFmlYXBj3I--

