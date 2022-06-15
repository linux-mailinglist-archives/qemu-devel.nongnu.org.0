Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DD854C4C8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 11:37:07 +0200 (CEST)
Received: from localhost ([::1]:38946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1PST-0000Qu-JL
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 05:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o1POi-0007yT-Tm
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 05:33:13 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:48701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o1POc-0005fz-Po
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 05:33:12 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 894685C0186;
 Wed, 15 Jun 2022 05:33:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 15 Jun 2022 05:33:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655285585; x=1655371985; bh=Jz
 nt7IlTYvCAU1VdcXfxLxyBlUzTMaPf2UnKyuZrRz4=; b=MbftfSxKMmIAJ5fILr
 1gNQG5BBUMAkpoFgPCO0dscRZoLZ18UWKh5f0pT6P4Yp12c6TZHppPmt4197T0kK
 xrTsb8xFH0JbV1q3D+TJy0XXteiO8aqbLggo04TK19r0N4F4Ocw7JWdO0KyzyMAs
 dG6+5GmAFjPuUcBpfpLHb5aITW4LZZmI4U/r2DO8x7jrgjTf9tVsScrYc4Tw3bha
 Ht8TxubdfN9lkIVD7o/acDAyeLemm5i2zOBR9VDB07CCQgw32XCV2xDQzwBwaOSZ
 k4oTvLpwpdKxbpRmxx0FEnbvgDNoBKQELSSsSocPraLkSGttg6mMQsLMXVlJav0M
 usSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655285585; x=1655371985; bh=Jznt7IlTYvCAU1VdcXfxLxyBlUzT
 MaPf2UnKyuZrRz4=; b=x5ANSE1emdA9HF0NB/PposCjSRwRkW2Msj+p3cFAsMp/
 3wcWjoHiLIpXQfm+L1duSzrCxOzhEy695r30ASYoXSGTwHc0+LTpCohuuXMs06q8
 SsncO4YrVWk0TyQLC6v+LEvwVXTIXTAklujRXqOhYZBIVo2EnSvzpE558NoUcqf4
 J+YmXURSOc6NAHfQzGXJr6WAUhzsWMxOSQZOkzNszn1Asry1KMuVq3O1sXpp3FDC
 4J+4PGS7kbCjcpvNXLj7def8BlPsM4KF+J08qUPgidUQTlPL8ucetdtae0tGf67b
 ulqM4eoCwlXiX17CIcqsNYIYIeQD/x5XNNk/ZWWtng==
X-ME-Sender: <xms:UaepYjFc1YJOMTmGxUW0hIl91WbVeI8tFRAB3D8ZmW5xTpmWHl4OMQ>
 <xme:UaepYgVjzihQwxeMwYQmMlLkToC-nwwil0C_m9SquRNrzMuuIz-1Al-Juv2JzlB8T
 v0vk1YEwqhn7gbWPBc>
X-ME-Received: <xmr:UaepYlL_0mKeHlyVGr7QK2wuoaTbZiBsPJgj67ripDdRZiWaMDTGxqY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepvdduieffffejudetteeujedvtdekieelkeehgedvveefheehveduteelleff
 udelnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:UaepYhHOtWWtk4KE_tWcy_Xo8LvFW-UGsf63_1Sm4PeD-Q3viy2W8w>
 <xmx:UaepYpXHe5eXk3m3yIq0RyGXr5T6vzGaAMvt70wA_y0sa6BRDRP1WA>
 <xmx:UaepYsN0RmkdzOSiOBGQqOEpPR5MAP8epMoNdr_v5SzeAqWxAtuqHg>
 <xmx:UaepYsSPcTfYO6GhBSEqx9T2AN29hyN-On4re7dHi3jcI5JlIPil_g>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jun 2022 05:33:04 -0400 (EDT)
Date: Wed, 15 Jun 2022 11:33:02 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: John Levon <levon@movementarian.org>
Cc: Keith Busch <kbusch@kernel.org>, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <YqmnTmxpYOeupgnt@apples>
References: <YqEMwsclktptJvQI@apples>
 <YqIDyjxrZnkeMfcE@kbusch-mbp.dhcp.thefacebook.com>
 <YqIXIiQr+dpksBh6@movementarian.org> <YqItnbgtw7BNPBZH@apples>
 <D9A53959-6A31-4105-B0A9-37B8180D973C@ict.ac.cn>
 <Yqeo4EKtQJq8XRm+@kbusch-mbp.dhcp.thefacebook.com>
 <0CC03CA7-1BC5-4FDF-92BA-4256778AD113@ict.ac.cn>
 <YqisK8iYANhY/mCm@kbusch-mbp.dhcp.thefacebook.com>
 <Yqmc2vKXcMl4Xsme@apples> <YqmhO0+5rggd/V5T@movementarian.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="67Ox0p6xjGIDg4W3"
Content-Disposition: inline
In-Reply-To: <YqmhO0+5rggd/V5T@movementarian.org>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--67Ox0p6xjGIDg4W3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 15 10:07, John Levon wrote:
> On Wed, Jun 15, 2022 at 10:48:26AM +0200, Klaus Jensen wrote:
>=20
> > > By the way, I noticed that the patch never updates the cq's ei_addr v=
alue. Is
> > > that on purpose?
> >=20
> > Yeah, I also mentioned this previously[1] and I still think we need to
> > update the event index. Otherwise (and my testing confirms this), we end
> > up in a situation where the driver skips the mmio, leaving a completion
> > queue entry "in use" on the device until some other completion comes
> > along.
>=20
> Hmm, can you expand on this a little bit? We don't touch cq eventidx this=
 in
> SPDK either, on the basis that mmio exits are expensive, and we only ever=
 need
> to look at cq_head when we're checking for room when posting a completion=
 - and
> in that case, we can just look directly at shadow cq_head value.
>=20
> Can you clarify the exact circumstance that needs an mmio write when the =
driver
> updates cq_head?
>=20

No, I see, you are correct that not updating the eventidx reduces MMIO
and that we check read the cq head anyway prior to posting completions.
I guess its a perfectly reasonable device-side optimization in this
case. We can safely drop that addition again I think.

> BTW I'm surprised that this patch has just this:
>=20
> +static void nvme_update_sq_eventidx(const NvmeSQueue *sq)
> +{
> +    pci_dma_write(&sq->ctrl->parent_obj, sq->ei_addr, &sq->tail,
> +                  sizeof(sq->tail));
> +}
>=20
> Isn't this racy against the driver? Compare
> https://github.com/spdk/spdk/blob/master/lib/nvmf/vfio_user.c#L1317
>=20
> thanks
> john

QEMU has full memory barriers on dma read/write, so I believe this is
safe?

--67Ox0p6xjGIDg4W3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKpp0wACgkQTeGvMW1P
Den6bwgAu1aJ0h84rCFC7k95KLDBbW7w6Hp+rkoQMKceNGm9UezqEZm/518D274M
lm6hjto149rNW+96EJzA8PpumleNHoruLLqlRYcW/RgHkuIFy0o4EWm0HYvFjOlX
WhWZA76NPEIUEDa129OQ3D7hfOBA4REaNcHEflHftuFyuAvWjFfReFoPXVClU1t+
d1TGWpdHCqIEf5i69X3vMCSWfMCj4dO8sWaIq4cwu7n8BYU5cVCZunAFFdq/Yop5
70UrLRf0dDr5qlKmmHFqs9XZ1yVDvggCYMhWzKqJWGN2OnEHj7kQtf+2NtTfVQJg
bdXd7gdjswVDtiEAYvQlh1KIkKbkoA==
=HeEN
-----END PGP SIGNATURE-----

--67Ox0p6xjGIDg4W3--

