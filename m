Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064722EEDA1
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 07:55:46 +0100 (CET)
Received: from localhost ([::1]:36846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxlgW-0008Bq-7Q
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 01:55:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kxlcO-0007Wd-D9; Fri, 08 Jan 2021 01:51:28 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:35307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kxlcL-00053V-OL; Fri, 08 Jan 2021 01:51:27 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 07513580448;
 Fri,  8 Jan 2021 01:51:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 08 Jan 2021 01:51:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=aqnE3p/D4OBoXFSvckX1SDdR09K
 Aios1cj/ZxxNFip8=; b=Mwig/vW9kYAi3xTxew9LU3K8v25Joe/cvzu4pcV9Svf
 PdkA3R1bxKK+ZB4SXs4XKISfLm7rr5jxOXG+QMAClw3Cc7ftdc7SXlN5GIrQHab5
 +S6OV9k4FJrrwQShSJokPqHCyPgGFxMWsbmA4r90lc7aGm+bzIk1/GEKn1hz5uAp
 eUqUvnTKox2itcv0ARQGQQ19GNkkb6VAvrrBYf4EqTzt/YPX0eLJ4J2CqvPoI/u6
 1DwWnphvwu1FCoJwJzJ7ui5lbMfyjE8Ol6n8Uv9wdOua2bXcl88iTBlAKbRIhVok
 BfmMhsYqQFGwK5mNIvP/tYGAT5lnJ2dj6rvtxjfPdTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=aqnE3p
 /D4OBoXFSvckX1SDdR09KAios1cj/ZxxNFip8=; b=lSjXMzNU7lc3No8ai/3d2d
 WB1TOKD/trH3gsygoH+1krMsQfp0A+PA98CVcY7xhB0VrGlO4qgXetXkK20lLrIJ
 DMdD65uLlKQGzyeTv/ir+gMX5UU5zkCBLAIgDifNULjSozBSLEgGPCf+We+44+gG
 04VXxCIEoRYjQEVbFL/bMnGS1vm7tJ+qR2amKmkIe1kEnoKVvP/CTgbB2CLzgwnI
 SJ4rxbEJDCsmuYk/KRn1b15yqI7BIrlZVC2LqBboNPjvfY/IjaqKO0cP2ZrQHqaN
 oTeRvCP9U/NI90PRaTj+dTf1MLdT68SQ7WdGj8si1qQIroWhnuHC8kabCgjEqZJw
 ==
X-ME-Sender: <xms:6QD4X-wVSwbFKWa-Nc7r4q1bM2hctvs14Wr8ODeft-uWwAxS0w-tMg>
 <xme:6QD4X6R5MElnpZZVUY0UtyUDMkrCAIvD5q7Z1974-EoEq5EXrgD2DqwXDp4_M6AUD
 H_HxxqW9hs1ZcTJT08>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdegfedguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepuddtheelledvtedvfeeuheegvefhjeeuleeihfduhfeiffffhfdutdekkeei
 keefnecuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecukfhppeektddrudeije
 drleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:6QD4XwV7fQmEUFvYbxsT5eXVtggNMtz2uhA14xXHKOBI7am7c88BZA>
 <xmx:6QD4X0hLc8pSdTlX1pGSu0mNgyoZa1Wy06xb4v-cnkfNVxrhtY56vA>
 <xmx:6QD4XwCCXdsQuY-hvjeESJd7uamxQ8Z8vK_33tlKBfpIt-7UB9Xe7w>
 <xmx:6gD4X5JB6wSrlr9H9ByriaT4RfXtsXIETRiaPlyBoAnXBzbLXPCrAQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0ADCA24005E;
 Fri,  8 Jan 2021 01:51:19 -0500 (EST)
Date: Fri, 8 Jan 2021 07:51:18 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Subject: Re: [PATCH v11 00/13] hw/block/nvme: Support Namespace Types and
 Zoned Namespace Command Set
Message-ID: <X/gA5nKm0s6ymCX6@apples.localdomain>
References: <20201208200410.27900-1-dmitry.fomichev@wdc.com>
 <X9Cfod3RaAOM9dJP@apples.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wQg5EvSNXRoR37l1"
Content-Disposition: inline
In-Reply-To: <X9Cfod3RaAOM9dJP@apples.localdomain>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
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
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org,
 Niklas Cassel <niklas.cassel@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Matias Bjorling <matias.bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wQg5EvSNXRoR37l1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec  9 10:57, Klaus Jensen wrote:
> Hi Dmitry,
>=20
> By and large, this looks OK to me. There are still some issues here and
> there, and some comments of mine that you did not address, but I will
> follow up with patches to fix that. Let's get this merged.
>=20
> It looks like the nvme-next you rebased on is slightly old and missing
> two commits:
>=20
>   "hw/block/nvme: remove superfluous NvmeCtrl parameter" and
>   "hw/block/nvme: pull aio error handling"
>=20
> It caused a couple of conflicts, but nothing that I couldn't fix up.
>=20
> Since I didn't manage to convince anyone about the zsze and zcap
> parameters being in terms of LBAs, I'll revert that to be
> 'zoned.zone_size' and 'zoned.zone_capacity'.
>=20
> Finally, would you accept that we skip "hw/block/nvme: Add injection of
> Offline/Read-Only zones" for now? I'd like to discuss it a bit since I
> think the random injects feels a bit ad-hoc. Back when I did OCSSD
> emulation with Hans, we did something like this for setting up state
> through a descriptor text file - I think we should explore something
> like that before we lock down the two parameters. I'll amend the final
> documentation commit to not include those parameters.
>=20
> Sounds good?
>=20
> Otherwise, I think this is mergeable to nvme-next. So, for the series
> (excluding "hw/block/nvme: Add injection of Offline/Read-Only zones"):
>=20
> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
>=20

I've applied this series to my local nvme-next. Our repo host is
unavailable this morning (infradead.org), but I will push as soon as
possible.


Thanks!
Klaus

--wQg5EvSNXRoR37l1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl/4AOMACgkQTeGvMW1P
Denbcwf/Tl79kwDPR8B1qmBhC9MF+YLvsY6rMBU3jczIQOBKns51aRTomaWzyxJr
eATlBp2k+F2ZmrNiTgM4prDMkBPmaGSatu8/xW5lZVa2mDAi5ub+rsCd9VfZChWA
jphG7huB2i00v/bCuhnUmNoHacWGF/rh3Dhvk8ypxqYaNx3kuGhYIQUfTKfxYmPI
aTAeG9Bq1bT0Ehzvs9zapgPBpb3X5NnGzKNy0Y0uD1NjYan+QFcMLecmyhTwg2Yt
kVvvYV2Wu2Z5zG3/C8zq7vEvb4q+I8I7qO4SCjevj8d8qzSNaGQynRQzJG3FvgRE
3ZheeFSZKOpqtdAzGPOP/E/4PDKmVg==
=h5Ih
-----END PGP SIGNATURE-----

--wQg5EvSNXRoR37l1--

