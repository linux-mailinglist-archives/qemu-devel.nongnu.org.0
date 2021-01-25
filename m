Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A472302A1A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:26:06 +0100 (CET)
Received: from localhost ([::1]:49356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l46Yu-0002LH-KI
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:26:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l46HX-0007XT-A5; Mon, 25 Jan 2021 13:08:07 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:40421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l46HV-0007Yr-Ou; Mon, 25 Jan 2021 13:08:07 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 834A1F40;
 Mon, 25 Jan 2021 13:08:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 25 Jan 2021 13:08:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=xfgNUFFvpmXnHybhKosV3/SAX58
 lb1AWgs3JJN/YAAA=; b=1sfjtw6u+MCNLfcM7sdEluBsIKMLl8FQEXjSArUO91x
 +odDUinfw63Es2BPttsvqi0miqm6KxLG59kRt3/vIZMH95yUiyY7d0zFED82Bt04
 e+cqsbfVZYUta8GNWoJuVnOZjY4IywYuawX6+IzzHiPjLpJbtWpxOEV8yU6belCk
 46lBaxNzOLnEBic9LB9kH7vhh3y88niXDkPgpzEL8+MPTKb67RkSheKjfnIVLraA
 GnUFfN7Ch1EgvH/7kKGAxz9LKO/pS5LivCLUWaHIYAC6P25taQcRhcETrTv3Uxa8
 NWvI6RAF/1cjCP0CWqn+0Ey0OhwfWETbxk681AX62tA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=xfgNUF
 FvpmXnHybhKosV3/SAX58lb1AWgs3JJN/YAAA=; b=iIdjgiF7S2jHxxGo2FHzI/
 S07fmStGiqdY3R0ihKMy/+iC2QGgZ7Gi8Qbxk3tm7jk6fKvHZeuXcPJJZQEW+NMO
 I+ciKsLGNn4OLx2qXVBKKtXVlOLGnO3KLkmAelI/oYsrYQ8lXcmVgbrOg6D0J6XY
 Q4f9qjEkMjzn0+n7QR5Q+zDk47hWA4H5BAHUGir+EoJAuilBeoARg/BWmSDyUrad
 LvtEWt/bzvAd9C1TPLsbdh5CILV4qh+qNKgMTzG2PruauH0q7hJcu0CPheiHS0Ta
 glvEqf0MXhncLsCVIjIKl6qye1PCslvOh5/xL1FuhLgJcpMMmBZXsgqCneAuUQPQ
 ==
X-ME-Sender: <xms:AgkPYOs7i5Xr0pfXm3seLTPf-clKt-peFcJ4Yvc-S13oF-uYcgb_tw>
 <xme:AgkPYDfBtxKvrGkEi-VDOLSiV56IXvUfXnwDFPoo64YDFnLhwwazgUCcEZm__ekQE
 xE61gKYcul1zO0MLBU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefgddutdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:AgkPYJwG6ddYFWI53VgL_558j89fxTXWmGHxLEIyyD9O1DhEbBXuJQ>
 <xmx:AgkPYJNk2-6Zk_dS8aEL_Hf-MtTykD8zwwWIN1goHgK8Fn0z39dD2Q>
 <xmx:AgkPYO-ojT1oRpE5hK4R48V22TBTgQFLj_mhYGVw3yo5gATet8LsBw>
 <xmx:AwkPYCZzGxPbsteHRh_xp2-LRaRygX4NLesnZHKR1uLR5eyxMMJ7Ow>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 68016240057;
 Mon, 25 Jan 2021 13:08:01 -0500 (EST)
Date: Mon, 25 Jan 2021 19:07:58 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH 0/3] hw/block/nvme: misc fixes
Message-ID: <YA8I/mMK4+h+4wp0@apples.localdomain>
References: <20210125082227.20160-1-its@irrelevant.dk>
 <20210125180237.GB1732047@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="W4/J4Mo3HnRyv5wx"
Content-Disposition: inline
In-Reply-To: <20210125180237.GB1732047@dhcp-10-100-145-180.wdc.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--W4/J4Mo3HnRyv5wx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 25 10:02, Keith Busch wrote:
> On Mon, Jan 25, 2021 at 09:22:24AM +0100, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Misc fixes from Gollu.
>=20
> Looks good.
>=20
> Reviewed-by: Keith Busch <kbusch@kernel.org>

Thanks, applied!

--W4/J4Mo3HnRyv5wx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAPCPwACgkQTeGvMW1P
Delipwf/Zy8IqP4F3sOP8MZsKYUAjzZFVanrh+slGV7pof5FhaI4lHMpUcIdTUU+
2PYJjHhDcGsvCgupnr6FQzY88KDJypNhn7tROx7SV4tsq922pTvODxwT0eqhST+6
59cQ0VDwboKSAoMEeQSR9C/V4o529PBBK+U4ckchuC9HFrFOyjsQgZ7JMoe+/UiI
7k/225bdfw+xWtYIOKznYIq1Gc0ad+zwBrF8OFgH92z65CmS1kU6Ap6qScT1my93
YLEi5OWaNTG+N+t0aGmjiDCosYWf3C7EgIBoKxMf7s1L8FfEP66Xu+cKi7momQQY
mw7SkxpfK5OXHbz5jM9HXWArtgE4ow==
=F+mI
-----END PGP SIGNATURE-----

--W4/J4Mo3HnRyv5wx--

