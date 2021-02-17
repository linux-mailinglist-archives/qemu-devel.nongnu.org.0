Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 093B231D689
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 09:25:49 +0100 (CET)
Received: from localhost ([::1]:43994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCI9b-0003Xg-UA
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 03:25:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lCI5s-0002vo-Aq; Wed, 17 Feb 2021 03:21:56 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:59637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lCI5q-0006Ac-0h; Wed, 17 Feb 2021 03:21:56 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6E35621E;
 Wed, 17 Feb 2021 03:21:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 17 Feb 2021 03:21:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=0aa62KftTi/S1y1uwdbd7A2vyNy
 13C7qd7LhFxlMfHs=; b=kwHGBjw5r6+YPeAcOHrohClaewStW7I0EBhU6eqinmU
 /T47g3MKb1uwAYnQ2YkxODj+b7sQrnr9PR4TiXVNEz5BJ07DZfB+425u2TNgK1TO
 zXqkep3RiCNW/wVDOFFv+aUFzpVRGg5aWhG1znjpCEH18q/cliPpvrHKG80l6TMf
 yiM/+w1Bqdlk5Y7IK22bp+DxRSJ9NrK2RAEIumRv91Y6XA28KK9OfKg6dvRrOELP
 F23LxgnVopSL4wTyBOxNFR4CDZ2Oq+PZUaHKCouub8c6i/zy78WCScNTg77QIQNs
 EH7qpOxwVCxrloHufOgZXEmJeCLdFBbxh3YmjnPRzsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0aa62K
 ftTi/S1y1uwdbd7A2vyNy13C7qd7LhFxlMfHs=; b=efbgci3pAzK4H5mU81RNxP
 b02QRjQ7SP2sjIjVaFoTfjgJmMNCsLBH0klTsDkK+fzsCQnSzC/vviCd4NASc534
 44HgAdnuwAQn/H7Vqyoqx3GT4tuh7clSawMKX4TNsH9JqD8dmM9HwRPdD43Ock41
 UF+yA5GaCCqfwZzZO6A3di5MtoKqnUA0Dca1xXS81Mc8fyot4LRsX5vQ7vE069Er
 8ovFKwwo9YthjJwC2yQq3KhvkrixDEmtl3FKuskSt+wt07UAecEwcQVvA6GVP4r3
 8gnVRI/8C7YRZtYIUDXM2/lKUSOJg3Wp1FbFRfqpdJM3WPk3eNo6FJEqCJn2HA8A
 ==
X-ME-Sender: <xms:GtIsYB97rDFLVHPoGuX4wZKeh8Cf4Cc2qQi53jvkJLzowGQKs2V3CQ>
 <xme:GtIsYFtimMeUFtIXVsrxUJEU3L2HqIcyCITwqiy-3DdGmjVtx9LCnS9oT2lfRZF2J
 Jq2Ls5DYhYVrof1YRk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjedugdduudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:GtIsYPD6g3GXXkawsbijHd-MWz49KBfihyWeW6MtRFNVvXASs_DCCg>
 <xmx:GtIsYFfkyKK-qVWNo9eMiWRpbhKAkgZsTeeBdh3VoBA4gWyGP4nQjw>
 <xmx:GtIsYGMnJ_uDbLdAbljAznvAYzcinLdg1Ni8PfZKLaeqWIkWozQPAQ>
 <xmx:HNIsYFc5G4IlSibN0TeFmXbkRLX1GpnHkOD0RiZMC9E5tu7x30PF2Q>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 575821080064;
 Wed, 17 Feb 2021 03:21:44 -0500 (EST)
Date: Wed, 17 Feb 2021 09:21:41 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH RFC v3 08/12] hw/block/nvme: end-to-end data protection
Message-ID: <YCzSFV08fMVeGU2S@apples.localdomain>
References: <20210214230240.301275-1-its@irrelevant.dk>
 <20210214230240.301275-9-its@irrelevant.dk>
 <20210216230839.GD2708768@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="n2IPHhc5AhcEEQO6"
Content-Disposition: inline
In-Reply-To: <20210216230839.GD2708768@dhcp-10-100-145-180.wdc.com>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--n2IPHhc5AhcEEQO6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 16 15:08, Keith Busch wrote:
> On Mon, Feb 15, 2021 at 12:02:36AM +0100, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Add support for namespaces formatted with protection information. The
> > type of end-to-end data protection (i.e. Type 1, Type 2 or Type 3) is
> > selected with the `pi` nvme-ns device parameter. If the number of
> > metadata bytes is larger than 8, the `pil` nvme-ns device parameter may
> > be used to control the location of the 8-byte DIF tuple. The default
> > `pil` value of '0', causes the DIF tuple to be transferred as the last
> > 8 bytes of the metadata. Set to 1 to store this in the first eight bytes
> > instead.
>=20
>=20
> This file is getting quite large. I think this feature can have the bulk
> of the implementation in a separate file. For ex, nvme-dif.c.

Yes, makes sense to split it off. I think moving[1] the device to hw/nvme
first would be good.

> But like the linux implementation this is based on, it isn't really
> nvme specific, so even better if t10 dif is implemented in a generic
> location with an API for nvme and others.

That is true, but in the absence of any interest from other subsystems
to implement this, I think we can keep it local for now? I keep a pretty
close eye on qemu-block, so if other subsystems should care about this,
I promise that I will pitch in :)


  [1]: <20210209110826.585987-1-its@irrelevant.dk>

--n2IPHhc5AhcEEQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAs0hEACgkQTeGvMW1P
Deki5wgAgo2od04ySMbNoNuAnt0EkFY9s9kSLqhnTed7xjtP+oFXLkGHDAoupvE4
+pgyatlgetCU0V/IB2PidXNh+PGrxp+tOkIEaiVngxyUCJ71XiW+6VwfPhTJTLoJ
QAvWSvb9b75L/pHbAY53Ud/H2iWTBkCebPbtkOaHl+LB9VlREA3kdsh9q/x9kqtT
rrjoGVYSBgCWx1bRmnZG1e7NbOX9Em5lVdpmum6PhFR9IH+wDL281ClggFYpKOHd
fc4YeCm7RPtktxsfWIBsuNZ4wRM65sRjiCasCSUaW7wER9gfwcrVjZKy7ui2x16M
SGjWFEmKUWNcLqj1X5OSHCkPBURIpg==
=MRQB
-----END PGP SIGNATURE-----

--n2IPHhc5AhcEEQO6--

