Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B793191C4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 19:04:07 +0100 (CET)
Received: from localhost ([::1]:52804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAGJy-0006yM-Be
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 13:04:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lAGAn-0004QP-Sf; Thu, 11 Feb 2021 12:54:38 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:42203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lAGAl-00031T-0N; Thu, 11 Feb 2021 12:54:37 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7DD195C00B3;
 Thu, 11 Feb 2021 12:54:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 11 Feb 2021 12:54:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=KhdK0w7QJzdo55TU2KHidSgnjaq
 oqYynWIfzYVUFVx0=; b=zed7/LEBtSDJ6WLr7Nh16EtuazYMFo0cU6WcTlQK0ou
 iwZezzE+W4S/kwi0V6rQG3FRysdJw4prWk4TOYcqY3GXocLuW6bAWqyzwXqxyYlt
 Bo4XMjeLuSilJMNYti44NoQUJ5FnV9w5lmmW2JSQNFnp4yDA6H/oae1nr8mxgzpA
 BRPGT2JcPZPo2b1jdw4gsxy8/gn7yuXoA5E6fCbv/ZAZFoubKQe6knuX22/i8xfc
 yXAcSfDLWc7aLsrqokpCcnrTQvWJVu1ucp99qf/uFVpNBSykXyp7IVDb7BBDoKiC
 4Mtz/gh7TWkobKgWZ7sPHpdw8N456ZaGc+Nw63qKYJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=KhdK0w
 7QJzdo55TU2KHidSgnjaqoqYynWIfzYVUFVx0=; b=QibfdVfjRGJA3rs5M5cYf4
 X9lKO8i+O6fFzQTbhOD9QvUEj1qm+1o1nbjvmEJQjty0hty86zTc2EHpLsg/LJYI
 5M2lRCVVnItNI7WlGRKsaPChYzso/NHP/I1vZK5y1u0/mkxDAaofhu2DE3pQDhoz
 a0cKv8FhQJ5DdoTp2/Ole3dU/bhMdArZXyyJR+5J1AhHf2Nzx2tP9v+izRfu6Wm5
 p3jrLt/3Xk80T/4AN/FNVsN0esKYWBBKfV4iClFLpEKnnmN5GbAhuWAn4zzkNxA6
 sppyIpA3dx7j3GVI45qdpRP1q5P02OcklaKR1g7ZcrQxALLx/HID400mmq89s0xQ
 ==
X-ME-Sender: <xms:WG8lYE6poXabo13WsOf0NxPLYh6plfiUEhjoOT8UeDl_F0cWKNADUw>
 <xme:WG8lYF5Gz8A9ByqCBo3wtD8-46hRwJSclBB-EUQlc4rkEDY5dmwTDCJjmryn5jTVb
 QB0MTkdVSIGxo6aXhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheelgddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:WG8lYDfCgau0zrEIoFVwvFJiasPB2ToXMUXw8KEjpBptdtingH_HpA>
 <xmx:WG8lYJKHVJy4efNeHbyiT02D02GO1MfhJ9HR6xaDmY9mgi-n1y2pEg>
 <xmx:WG8lYIKpplT-3GepnM0FATR7Q2g736-CLkUCd15LeDPEggickilzKg>
 <xmx:WW8lYCgE3Cs8CRpPekz6c1MrPe_V1ntajzqu7y4Tg41tyyvffaY7ww>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6B11E108005B;
 Thu, 11 Feb 2021 12:54:31 -0500 (EST)
Date: Thu, 11 Feb 2021 18:54:29 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH 2/2] hw/block/nvme: add write uncorrectable command
Message-ID: <YCVvVeCS4cpmWST9@apples.localdomain>
References: <20210210070646.730110-1-its@irrelevant.dk>
 <20210210070646.730110-3-its@irrelevant.dk>
 <20210211033732.GE23363@redsun51.ssa.fujisawa.hgst.com>
 <YCTuGUtwJweVQkXN@apples.localdomain>
 <20210211153754.GC28207@redsun51.ssa.fujisawa.hgst.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4jVbPjVgXtoysTS8"
Content-Disposition: inline
In-Reply-To: <20210211153754.GC28207@redsun51.ssa.fujisawa.hgst.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--4jVbPjVgXtoysTS8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 12 00:37, Keith Busch wrote:
> On Thu, Feb 11, 2021 at 09:43:05AM +0100, Klaus Jensen wrote:
> > On Feb 11 12:37, Keith Busch wrote:
> >=20
> > > Is there a use case with a real qemu guest wanting this?
> >=20
> > Like for the extended metadata case (which also does not have a lot of
> > "public" exposure, but definitely have enterprise use), our main
> > motivation here was to ease testing for compliance suites and frameworks
> > like SPDK.=20
>=20
> I'm okay with the metadata patches.
>=20
> > I'm honestly have no clue what so ever what a real world use
> > of Write Uncorrectable would be. It's been in the spec since 1.0, so
> > there must have been some reason, Is it just to align with SCSI WRITE
> > LONG? I'm not SCSI expert at all, but from what I can read it looks like
> > that was also intended as a feature for testing read error conditions.
>=20
> I don't think it's for testing purposes.
>=20
> If you need to send a burst of non-atomic writes (ex: writing a RAID
> stripe), a power failure can result in an inconsistent state where you
> don't know at a block level which ones have old data or new data. If you
> Write Uncorrectable first, you can never read old data, and thus have no
> "write hole".
>=20
> Journalling solves this better, and I'm not aware of any real
> implementation relying on uncorrectable.

Right, thanks! I'm aware of the RAID write hole issue, but I did not
consider Write Uncorrectable as a possible means to solve it.

--4jVbPjVgXtoysTS8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAlb1MACgkQTeGvMW1P
DelLmQf+JAmpiBLlagKOmklLkE3te5+NqI/0+ZZDo963DnrSusz0bP7zlGRVLp1I
NkJSUzA9mQ2AV3q60s0c8OV+i/1ZSiXFuZL5rawbxxnxe4WvXZafJ8ZYqsPOxRDL
jaPo5f22gSXATLaWKt80Op2aszlfo0BcetyeOupByzOQmq3SbBRnNH5mWVHh0qHA
KNdJCzeKPElLxMDt5vB3oqOjVoCKTvtQyq2GJuXM8YeMHpygmG4gFxAqnW4449Al
dbxu6p5ygl2ToL/SZDIJSYQ78TMNFbpfTOvOaJ2dq2dK1UHbYNovT0I3WlpDVajW
xcnAm5p7VXIaBlN0Uda0nUXH3GrG9g==
=Pn6p
-----END PGP SIGNATURE-----

--4jVbPjVgXtoysTS8--

