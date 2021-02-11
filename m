Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1334931866D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:48:44 +0100 (CET)
Received: from localhost ([::1]:38514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7eU-0004L8-VA
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:48:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lA7ZA-0002qd-T6; Thu, 11 Feb 2021 03:43:12 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:44363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lA7Z8-00014o-SX; Thu, 11 Feb 2021 03:43:12 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 29EDC5C010F;
 Thu, 11 Feb 2021 03:43:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 11 Feb 2021 03:43:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=GRqgZzHwdSa40SnYNQyYwdrOAXH
 ZCedqPpALNydrsDc=; b=ZsZHEIdEo0pZ0txtd//aigMvysn0rFfaIjaszc2RNv7
 0ru169IXKhqY58CVJTKAF8QKNO788U/4TWcD3rtTb/yNLhdkQ9021xhfD932DF6g
 TEynQ0HgV6Hnt9HTSDNzzN/u2jE4GAC1Phv5DfbguRKO+GI6ZtHoPOIZ4Irayb30
 jxM8MBpNsxCWP1sgE8l5SYor6DN47D6m+RwhAqITAxgvVDgRONim9j8NQRs+MavM
 gX8tz7Iw212AqUp/5PH0nGAU8tLT4B8eLalT0EinXJvkqd6RmrxanlY0D4WkuldR
 eo7mPealyNn6ozIuEucbRZy/sIek01T57jcNonwb/Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GRqgZz
 HwdSa40SnYNQyYwdrOAXHZCedqPpALNydrsDc=; b=FBFzFWXol8ESWukT8Z4iv/
 hH8YHYCAar1LpvcGg2i1D3kpGyrusrc/v8Bx4ZrIarMAfE/2EMPLpk6jJvw8CDI/
 KeR7ysZHyVvzywxuzK9kp73MtAO/XqFbJh1gbcysZfkqI+HAhvkfp0hlnSXeS+tE
 dySNTvxC9Vf6FnilfBobTmTjpHhcxcR6D5xOddmXhds5/7ctV5EUpV4HAORwRMz2
 QXt0DHcKnU3BSp4Qv3xDIcI9Yl7CEwSaIImjn8kWMOITWv32K7orG4uiUMlkeirT
 uiXiAlw8FKknrxzF5iqzEirPsLfn4aD0Gv36CTn9lZd0KvWFdnIwiS0TOgg+mvGg
 ==
X-ME-Sender: <xms:HO4kYLqV5LnYe7oLfYZa6JFVET-Mrd-lApGoCBWpyaspa8Jb9hi97A>
 <xme:HO4kYFldxkCjzgFcUKP-zb1FPLSqbHKZ9_rhtsM4vLklWXO0vvXwtfiSd8P4z6grc
 meCIZ1ZmW2tZkuiQkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheekgdduvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuueffiefhgffgteehjeeiveeludfhteffhfehiefgheetjeeitedvtdegvdeh
 tdenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:HO4kYFGqhKnaWsht2DPNAFCjLe_NPk6WSkbwse4whmpiUlqxAJp0lg>
 <xmx:HO4kYGo32GAilpRhi0LyS71OWb6txvOL2ubLx-1mupjWSWK1hzlMXA>
 <xmx:HO4kYJ7dj47LX_IbMXNfPmIgx5Dgh6G_ocMmHjE-gmD8jkktj_YN_Q>
 <xmx:He4kYA0Rj0WfFBADWNBo4rx7CZhv3_8aIKdHcAteADU5xND2Sh1wHA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 025FA108005C;
 Thu, 11 Feb 2021 03:43:06 -0500 (EST)
Date: Thu, 11 Feb 2021 09:43:05 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH 2/2] hw/block/nvme: add write uncorrectable command
Message-ID: <YCTuGUtwJweVQkXN@apples.localdomain>
References: <20210210070646.730110-1-its@irrelevant.dk>
 <20210210070646.730110-3-its@irrelevant.dk>
 <20210211033732.GE23363@redsun51.ssa.fujisawa.hgst.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1psWlXVx49P+l8Ug"
Content-Disposition: inline
In-Reply-To: <20210211033732.GE23363@redsun51.ssa.fujisawa.hgst.com>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1psWlXVx49P+l8Ug
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 11 12:37, Keith Busch wrote:
> On Wed, Feb 10, 2021 at 08:06:46AM +0100, Klaus Jensen wrote:
> > From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> >=20
> > Add support for marking blocks invalid with the Write Uncorrectable
> > command. Block status is tracked in a (non-persistent) bitmap that is
> > checked on all reads and written to on all writes. This is potentially
> > expensive, so keep Write Uncorrectable disabled by default.
>=20
> I really think attempting to emulate all these things is putting a
> potentially unnecessary maintenance burden on this device.
>=20

Even though I myself posted the Telemetry support on behalf of Gollu, I
now agree that it would bloat the device with a "useless" feature. We
totally accept that and in that initial form there was not a lot of bang
for bucks.

This emulated feature comes at a pretty low cost in terms of code and
complexity, but I won't argue beyond that. However, it does comes at a
performance cost, which is why the intention was to disable it by
default.

> The DULBE implementation started off similiar, but I suggested it
> leverage support out of the backing file, and I feel it ended up better
> for it.
>=20

And thanks for pushing back against that - the solution we ended up with
was totally superior, no doubt about that!

> But unlike punching and checking for holes, there's no filesystem
> support for Write Uncorrectable in our qemu API, and that's probably
> because this is kind of a niche feature.

True. I don't see any trivial way to support this on a lower level. Even
if we persued implementing this in the QEMU block layer I only think it
could be supported by "integrated formats" like QCOW2 that could
optionally include a persistent bitmap, like the dirty bitmap feature.

> Is there a use case with a real qemu guest wanting this?

Like for the extended metadata case (which also does not have a lot of
"public" exposure, but definitely have enterprise use), our main
motivation here was to ease testing for compliance suites and frameworks
like SPDK. I'm honestly have no clue what so ever what a real world use
of Write Uncorrectable would be. It's been in the spec since 1.0, so
there must have been some reason, Is it just to align with SCSI WRITE
LONG? I'm not SCSI expert at all, but from what I can read it looks like
that was also intended as a feature for testing read error conditions.

--1psWlXVx49P+l8Ug
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAk7hcACgkQTeGvMW1P
DenTeQgAtvKnMT5d+Wfb3yqShWyv6q2k0GvoV1Fja+NKiKfey5HUZRlnt3Q1K53v
ZA3VXKDd6uPn/yKCpKTuZO3H/vOgWae3CZSfQhnyeHMANgoGh+GUyavTkRCotnn1
cqRkK9FUxi7fAtmRmcDIp7pgI01Ffg7k+XSypwfV96J5Wyl7BiSyNP7lkPUwbPti
NfxbLhMfYLVVGbOXVC3V4MGNI/JHRfeYVAgzPVhz1TRzzodCI+TxXzUQ8tZ8Anz6
FGLS9PHSCBuKaAn29+eXz1LJo8c08XnGeD8r8dPTgMnob/6aCVrtofPZ+HlrLrxH
bmW1KVkRJcGNbTFpChdLehzhwyK5Bw==
=jVYp
-----END PGP SIGNATURE-----

--1psWlXVx49P+l8Ug--

