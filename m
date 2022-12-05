Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCBD6428BE
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 13:48:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2At5-0003nT-Ab; Mon, 05 Dec 2022 07:47:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p2AsP-0003eP-VE; Mon, 05 Dec 2022 07:47:18 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p2AsN-0006Z4-7R; Mon, 05 Dec 2022 07:47:17 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2FB5932003F4;
 Mon,  5 Dec 2022 07:47:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 05 Dec 2022 07:47:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1670244426; x=1670330826; bh=mQ
 WwWARlilHlntCaW1dEjiQmhGd3LIFSRTPzl1Hrz4U=; b=Ln9WBUdpnvdgSY7t2Y
 l3IINBJ0ZNKDC7WMElpT5G/jECAs7mvvRrONZKLE6gvC7TnC/dYdN62NMUrLkm8Y
 Vhi7qhLVA4Q/86eyK9lWKCMrtN3MIJ+zCZqGCL9quNie1p7+uKaWFIHOcr0jcgQH
 4rnF90mKuF6u4vJGKIPwc4tSFwIZFGQxA8ia9eeLLZdKF9JLxwnKzvWk4ni+MOvt
 0+H/HgEKvDxEIzv2I6tmJzL8KwAqDbhNaYbknYVcxY/5pOnvvkXHfqetE+KP4Rbz
 qMiuffgaTFZHOeYct6z0MYENJZ1tW0W9jkfNLKBuTU+xRXXVnk7UB6YiofNEMHk/
 L6Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1670244426; x=1670330826; bh=mQWwWARlilHlntCaW1dEjiQmhGd3
 LIFSRTPzl1Hrz4U=; b=RFzVilwXYQmDNQSYDZH1zX3vC6ZfwMbFIzs09gUSzD5x
 ywMmQqgkVHFwdJncUG8rmLmnENk1tAAT2VZO31sISuvy5UUUw3EQWcWzGY19gpSE
 cBnRBdDvFgobPTCLg8/0MD/AzFR90On3qSVko76o5TAMp04jWBwIUeBPYuBz05qO
 SQSUTm9/9m1yXzqsMUxqjTl2/8JBAQDRyx009L+yVpUtdXsqk1eccZcj5xfXab/n
 d7HNlKNWXs08ADFvw33Sge1EAKBcnNfZPaYfcO5MAR1cNb95K+oOF6ADX3B8if2d
 T9qWdTjOuRlCZDgPYDs62xCd6gczBHDzTOZ49Dqsvw==
X-ME-Sender: <xms:SeiNYxdI9kohn-0NGBjKJIW7gRBMteQ3wTNMjUVAbok92G4UNwvVDQ>
 <xme:SeiNY_N3y965u92iTyZnePKJQdZi-cMqWR8DDB0E6hkGEy_-Bl2n2v8NeMcFarBEN
 HsAva0ZDZOpHzi_gfU>
X-ME-Received: <xmr:SeiNY6i8yu-0RM7_pL0Rbga62C4X4xNPqPHuYPZPCU3g_WZjBfQY7wrUywcshgRe4JI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeggdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeffuddvhfehjedugfeijeeuieelgeevuddvlefhkefhgfettefftddvkeevieel
 feenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:SeiNY6-vlB5mmQ9TRY44yk-Zoj5wq6eyy2ltDIxoEvoMoMYw9bZSTw>
 <xmx:SeiNY9vLvY5Z8fQx9wz8gIn82snUOJ9UkPKvr_QH61ET8nVsh7c_JQ>
 <xmx:SeiNY5EqwaRtnyDJjOh4rqyk54E0USu7CEP4jllfwQ34vgap_SYW6Q>
 <xmx:SuiNYzIagUUpLidKqMaglxYEGKv2KJgRQt1KxvH-Xf7jYGSltWjRPg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Dec 2022 07:47:03 -0500 (EST)
Date: Mon, 5 Dec 2022 13:47:01 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Tihov <d.tihov@yadro.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, kbusch@kernel.org,
 linux@yadro.com, m.malygin@yadro.com, a.buev@yadro.com,
 ddtikhov@gmail.com, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [RFC 0/5] Protection information pass-through for block devices
Message-ID: <Y43oRSSnr3ZCJkSX@cormorant.local>
References: <20221124155821.1501969-1-d.tihov@yadro.com>
 <Y4ByUi5gOH6swqMS@cormorant.local>
 <20221205090129.enmhx6lq34g2owkw@archlinux>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="21D+foZX+2al8i8R"
Content-Disposition: inline
In-Reply-To: <20221205090129.enmhx6lq34g2owkw@archlinux>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--21D+foZX+2al8i8R
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec  5 12:01, Dmitry Tihov wrote:
> On Fri, Nov 25, 2022 at 08:44:18, Klaus Jensen wrote:
> > +CC: block layer maintainers (Kevin, Hanna)
> >=20
> > On Nov 24 18:58, Dmitry Tihov wrote:
> > > This patch set allows using End-to-End Data Protection in NVMe subsys=
tem
> > > with integrity capable host devices as the NVMe namespaces backend.
> > > The patch series is based on io-uring kernel interface feature not me=
rged
> > > to kernel upstream yet:
> > > https://lore.kernel.org/linux-block/20220920144618.1111138-1-a.buev@y=
adro.com/
> > >=20
> > > The main advantage of this approach is that it allows using the
> > > same protection information enabled disks in multiple VMs
> > > concurrently. This may be useful in cluster setups.
> > >=20
> > > Please let me know what do you think, are this kind of changes approp=
riate
> > > for QEMU upstream, what should be changed, etc.
> > >=20
> > > Dmitry Tihov (5):
> > >   docs/nvme: add new feature summary
> > >   block: add transfer of protection information
> > >   hw/nvme: add protection information pass parameter
> > >   hw/nvme: implement pi pass read/write/wrz commands
> > >   hw/nvme: extend pi pass capable commands
> > >=20
> > >  block/file-posix.c           | 130 ++++++++++++-
> > >  block/io_uring.c             | 109 ++++++++++-
> > >  docs/system/devices/nvme.rst |  15 ++
> > >  hw/nvme/ctrl.c               | 361 ++++++++++++++++++++++++++++++++-=
--
> > >  hw/nvme/dif.c                | 303 +++++++++++++++++++++++++++++
> > >  hw/nvme/dif.h                |  18 ++
> > >  hw/nvme/ns.c                 |  59 +++++-
> > >  hw/nvme/nvme.h               |   2 +
> > >  hw/nvme/trace-events         |   6 +
> > >  include/block/block-common.h |   2 +
> > >  include/block/raw-aio.h      |   3 +-
> > >  include/qemu/iov.h           |   6 +
> > >  util/iov.c                   |  24 +++
> > >  13 files changed, 992 insertions(+), 46 deletions(-)
> > >=20
> > > --=20
> > > 2.38.1
> > >=20
> >=20
> > Hi Dmitry,
> >=20
> > Neat.
> >=20
> > But this is largely depending on how the API turns out in block/ and I
> > am not the right one to comment on that. It's great that you have an
> > example device to utilize the API, but this needs comments from the
> > block layer maintainers before we consider it in hw/nvme.
>=20
> You mean API in QEMU block layer right? Specifically the second patch
> of this series. Should I send it in a distinct RFC for review by block
> layer maintainers?
>=20

Yes, basically the block/ stuff.

Given the RFC status of this series, I see no problem in keeping it
as-is. Having it showing how it is potentially used in a device is good.

I CC'ed the block maintainers to let them comment on it when they have
time. We are right up on a release, so expect some feedback as we start
the next development cycle post-release :)

--21D+foZX+2al8i8R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmON6EQACgkQTeGvMW1P
DelRPwgAtluHEE3bLLzAUKQNDZPHeCHeP3tw3zruDtsHIeVNeNox1chLkn2P/Zkm
gojx+Lbd/y0W17yPQoSmzntQftD7lNi0kLDQt2mFghXgZB+J4vlryR6incXZbtJT
MwkOOfrcXIhyhaVmnUT9baD5hRo573eAu/fRRYcadEv+2/UCzDpDmz4PE13NjEGq
yuniUbM4Mxowbds5VcV4fuPLf6VC+23P8nibmXzmd0MM2xfb0yQDacjgNJM5YUpn
aSa+vPqAxi7/55Ft9iw8+iINwf1hGGsaJ810HzBLbuvh2+gFgBXtj7imshUTAZXB
JmQNw8l5LXDOJAVmqEPHUW5Ik86GHw==
=lLhn
-----END PGP SIGNATURE-----

--21D+foZX+2al8i8R--

