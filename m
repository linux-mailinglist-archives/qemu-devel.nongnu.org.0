Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C8F2C84AE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:08:40 +0100 (CET)
Received: from localhost ([::1]:56422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjiuz-0008TR-Fc
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:08:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kjim7-0005Nd-DN; Mon, 30 Nov 2020 07:59:27 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:53911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kjim4-0003ql-Qf; Mon, 30 Nov 2020 07:59:27 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 55CE35C010A;
 Mon, 30 Nov 2020 07:59:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 30 Nov 2020 07:59:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ecREon5GNQ9jeKA0E/b037kAFBo
 FiitgWGMkhdmgcyg=; b=QED4v7ZXN4d3okiJMW+9L6WQrhyzspqqXtPYZLH2mt9
 dbz8HZJdESRnoW7WD/LEVOsRbcMdCd/JPwy/iowRxjYQnrYRGJ5Cyj+SDhBBWBPV
 TKOSnPi34MZaZEpisodqm/osT86yOOV4AOGTIruJh977NLxQdP+SRdXUaKmJxs7w
 f2e5xoR/I7X0Y0s5aSsWgXam8/q7c53Bp6cjI4bVpNRbfmFSDst85A5xYCeNjD2G
 2h0cOqbRZrsZqZQe0u3CqfpNAhWonZv3iKckDWY+dbyVqNErrIeRUABvF8DdqmkA
 2WA7MBO5cXgxF3A6c7eBdlb2B+/LnGnEwOcmFmr/+wA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ecREon
 5GNQ9jeKA0E/b037kAFBoFiitgWGMkhdmgcyg=; b=qRjNvh3TR3qPVz3zSLOoIw
 sNhAxb1BIt0gGOqbE2kvv0cg2XLdWF2gAOrTSEuNclA7HR7rXKxLV+g5jxNRzA8P
 PNDk/PDaYABwt7vLfwTLLlt54VZwZRNnN8yVNiCWhwUwNQ8QxOS0PCEa96vgnT9R
 DhhU/CW35OdB+qCCCsrbzbhERlAp5vL9V9iBiqoEYWwMmVMiYXVlvd1tMZpncFA/
 sOdn14vCQSqZiF2PepfMg6ookfF5pdLVZA7viQKCntiiaBbqVc+dGOkHdT1ViuA3
 MON2hruUKnUiFzM/Z1JjH+k4zTf4BQbe5lFsrvrUEFYLxKsxB+CJpYaYn2Bp4OOQ
 ==
X-ME-Sender: <xms:qezEX_Ef0fFRG-6lwNCavU6e4O6pvdFBbMSKhn474uq8xuiVd3i5oA>
 <xme:qezEX8U735CyOHeuBwV8Y4Jnj__6eKeW0j8fp8bWz6BamSFlf5qSP92emSys7c9zw
 sZA8hzd-oA3ymkJC5E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeitddggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:qezEXxLJuyVfkT8rxdOYK4X1ngKGEFGUG-loQhvtaA8MJsIow5MyeQ>
 <xmx:qezEX9E0FgWzb0PZW-MW_D6xCg316MRkk6Qbu9DZVyEOksd_JiawBA>
 <xmx:qezEX1UH2EgKLwQV6AIAWkQ4r6McH5BD4NQps3mSiErEF6LvDbzs5Q>
 <xmx:quzEX3Jj-ox_Dc75FQdaRhDkay7_h_ezMuPscfipHWAzCcUa7t7ocg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 97B3C3280068;
 Mon, 30 Nov 2020 07:59:19 -0500 (EST)
Date: Mon, 30 Nov 2020 13:59:17 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC v5 12/12] hw/block/nvme: add persistence for zone info
Message-ID: <X8TspZJE+B551qno@apples.localdomain>
References: <20201126234601.689714-1-its@irrelevant.dk>
 <20201126234601.689714-13-its@irrelevant.dk>
 <20201130123300.GA422962@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XTcJ6zHZclJumq/H"
Content-Disposition: inline
In-Reply-To: <20201130123300.GA422962@stefanha-x1.localdomain>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--XTcJ6zHZclJumq/H
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 30 12:33, Stefan Hajnoczi wrote:
> On Fri, Nov 27, 2020 at 12:46:01AM +0100, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  docs/specs/nvme.txt   |  15 +++
> >  hw/block/nvme-ns.h    |  16 ++++
> >  hw/block/nvme-ns.c    | 212 +++++++++++++++++++++++++++++++++++++++++-
> >  hw/block/nvme.c       |  87 +++++++++++++++++
> >  hw/block/trace-events |   2 +
> >  5 files changed, 331 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/docs/specs/nvme.txt b/docs/specs/nvme.txt
> > index 03bb4d9516b4..05d81c88ad4e 100644
> > --- a/docs/specs/nvme.txt
> > +++ b/docs/specs/nvme.txt
> > @@ -20,6 +20,21 @@ The nvme device (-device nvme) emulates an NVM Expre=
ss Controller.
> >    `zns.mor`; Specifies the number of open resources available. This is=
 a 0s
> >       based value.
> > =20
> > +  `zns.pstate`; This parameter specifies another blockdev to be used f=
or
> > +     storing zone state persistently.
> > +
> > +       -drive id=3Dzns-pstate,file=3Dzns-pstate.img,format=3Draw
> > +       -device nvme-ns,zns.pstate=3Dzns-pstate,...
> > +
> > +     To reset (or initialize) state, the blockdev image should be of z=
ero size:
> > +
> > +       qemu-img create -f raw zns-pstate.img 0
> > +
> > +     The image will be intialized with a file format header and trunca=
ted to
> > +     the required size. If the pstate given is of non-zero size, it wi=
ll be
> > +     assumed to already contain zone state information and the header =
will be
> > +     checked.
>=20
> In principle this makes sense but at first glance it looks like the code
> is synchronous - it blocks the vCPU if zone metadata I/O is necessary.
> That works for test/bring-up code but can't be used in production due to
> the performance impact.
>=20
> Is the expectation that the QEMU NVMe device emulation will only be used
> for test/bring-up now and in the future?
>=20

Hi Stefan,

Thanks for taking a look at this.

I could see why someone would maybe use the core nvme emulation in
production (but I'm not aware of anyone doing it), but the zoned
emulation is *probably* not for production (and that is where the zone
updates are needed). But someone could surprise me with a use case I
guess.

And yes, I know this is synchronous in this version. I have not
extensively evaluated the performance impact, but crucially the blocking
only happens when the zone changes state (i.e. every write does NOT
trigger a blk_pwrite just to persist the updated write pointer).

I know this can be done asynchronously (I have implemented it like so
previously), but I wanted to get an opinion on the general stategry
before adding that. The opposing strategy, is to use a some form of
mmap/msync, but I, for one, pushed back against that because I'd like
this to work on as many platforms as possible. Hence the RFC for this
blockdev based approach.

But if you think a blockdev approach like this is a reasonable QEMU-esce
way of doing it, then I'll proceed to do a v2 with asynchronous updates.

--XTcJ6zHZclJumq/H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl/E7KEACgkQTeGvMW1P
Dek7mAf/Q1L7u5/bDEYxzJWO/WJGl8KRl5yOw5z0v3oCQTwIdrwHnnVmYgGZs/g7
uoMA76IBjxp2LYCZ8kxj0nMt4S2ekxPpuYF7SGtPzWrL/n3oaw5AZdJAh0gF8wyy
rXuSOsnMOoh/hM3ElWpSv02hAZUdTfnlEzttIneIVESzCUuuefVgxxi/qzO8ZIYy
oLEzcZAVKxYeLbntySpZ4m64YJKWqadz2yoisKmXMyJqzQrzRhRhIxd4G6dVR4u3
7LaKAX6GdN3y4S+yfJfOv7psibH3QKYYuzaYNHjdei6eqLiUZ5CEow8ifRipD8w5
gHgW0utUKyejizbUd+PuQE1FJqM+2w==
=Fybh
-----END PGP SIGNATURE-----

--XTcJ6zHZclJumq/H--

