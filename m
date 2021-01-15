Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF71A2F738C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 08:12:46 +0100 (CET)
Received: from localhost ([::1]:47098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0JHp-0006Xo-Jw
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 02:12:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l0JCh-00057S-1I; Fri, 15 Jan 2021 02:07:27 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:56145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l0JCf-00013Y-4N; Fri, 15 Jan 2021 02:07:26 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 41EF95C00B5;
 Fri, 15 Jan 2021 02:07:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 15 Jan 2021 02:07:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=iefuq+OgwXA/KeiYMF5bPqs0GME
 j/qfbk7MsFnHsPNo=; b=10ZtXdOBUugvJSapTJ1UWSbputoZiKM6eKk+zRZQBvu
 SblChaxQQ6n/yvqtK0FwZ5ZurJhnOPx3wqseOchikiWAsu5d+Z9SY2g5ZQcNwPe7
 5g5lJEGpYHzSE0EW8gAi6NayuzR1hnVaOKc0SE0Li0nX1zZ+kR//e086uwVMGRGD
 9y/VO3ZA++UxSYn7w9Q1pvB6yzNF91mZap3J8YThK7NrgYD6Kwt7GTbHokDjTYf2
 0LxerimzBXXUxGL9MCHQjhqwttTYSWf4Ao4bbTlWZEv/elRQW2hEqnxoB7X40Nen
 H0fc9T3S2BS0K5mPmmZLPD2Q2wvAdughJ2onr8LCocA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=iefuq+
 OgwXA/KeiYMF5bPqs0GMEj/qfbk7MsFnHsPNo=; b=ldLd6gwLl4CPhquh11kQXu
 wyf3pTbHVyk3QVP2hM47tjJ0EGzjLEEGe4gPGQwtas0kn55njejKVeslJbgZAk/H
 h9TYEHTT7NQVQ+SHcC6rg6bhpMXwaJIELNhFOR8VtfTITk82aN7f6f82T15HQo8j
 aQ7d8iQj4pV5+OA7nuWGWbAH1ZS7t/DWtSRnorm6xZDGyXKoo/WZ7Fu+p01Dw5MS
 /DBdcygSA1uRmbxRP3xW+zB4jPXUfI2zeER2Fbp8QBa8ipPsR/++yiUyhEcdM67Y
 ei/Tn9TcKBG8CidbhUN9Fu2M/eixvrDGYIzMMKzBvd1ciVmjyLPuMZWU+RR01IfQ
 ==
X-ME-Sender: <xms:Kj8BYIWyidoNaEt2JhpYlsu_r2z1o39izbs3oTfySB4RvNds0OPvPA>
 <xme:Kj8BYMmclvMe1LEdx9Q5_ihO-gGkPO6ZkN1-hNAHy_UzfNajXU6SzQ2p8pHp2HsRC
 _OnzzZP2i79o_jvei4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddugddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Kj8BYMavqdZLvECHs_UiyZZSAI4biNydv3vO1seKHcyyLESpibY8Hg>
 <xmx:Kj8BYHUnl923CPjlUIz2qAb8uuy08SYtua_gfFFAkbxothUEVILVFw>
 <xmx:Kj8BYCmv7jgeGkwBLSTku0-0q4Pp9e6N1Fp4fVnXqJSzOs_LYmQUVg>
 <xmx:Kz8BYAbDDADZu5npdwiLWm_l_-GlAjaBd_yLEnhNU5czb6xlo4-a2A>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id ECA40108005B;
 Fri, 15 Jan 2021 02:07:20 -0500 (EST)
Date: Fri, 15 Jan 2021 08:07:19 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/block/nvme: fix for non-msix machines
Message-ID: <YAE/J08kcQ1WfjOQ@apples.localdomain>
References: <20210112124714.220657-1-its@irrelevant.dk>
 <0d5fc44d-14cf-5fd9-e8e3-2aae48ebfa4a@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Zi9KS84QAYs3iIQu"
Content-Disposition: inline
In-Reply-To: <0d5fc44d-14cf-5fd9-e8e3-2aae48ebfa4a@redhat.com>
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
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Zi9KS84QAYs3iIQu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 12 14:20, Philippe Mathieu-Daud=C3=A9 wrote:
> On 1/12/21 1:47 PM, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Commit 1c0c2163aa08 ("hw/block/nvme: verify msix_init_exclusive_bar()
> > return value") had the unintended effect of breaking support on
> > several platforms not supporting MSI-X.
> >=20
> > Still check for errors, but only report that MSI-X is unsupported
> > instead of bailing out.
> >=20
> > Reported-by: Guenter Roeck <linux@roeck-us.net>
> > Fixes: 1c0c2163aa08 ("hw/block/nvme: verify msix_init_exclusive_bar() r=
eturn value")
> > Fixes: fbf2e5375e33 ("hw/block/nvme: Verify msix_vector_use() returned =
value")
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/block/nvme.c | 31 ++++++++++++++++++++++---------
> >  1 file changed, 22 insertions(+), 9 deletions(-)
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20

Thanks! Applied to nvme-next.

--Zi9KS84QAYs3iIQu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmABPyUACgkQTeGvMW1P
DenuLwf+Kb16q6MxcSCOoPcai5qlqg5eMRovAuUcJ0aXw2R/sThKsGQBvYBANcKu
3mZin5r5+3ovg2UBuDHl+3augJ2Gagy+gceuaj1K9YM9BaohODQhCWUaiwHzxGgy
8ypnYfnOZd6tLbgmp3T+1J10v3lXZW4DNHCHMqHq/n55xT8LZGS/z3Kr7TfQIUHt
h9wE28d6akGaM+xRL5pxImqBaQfMyEccSyPFwvQtU7DyBMD5uvFfqgNa4Hf8514p
Sl5CcZyI0d9fOttR+e5zF1Ohg42iU423ZhlYi4ZEC3TXe4m8sy2pUhQtlov8Tevp
BxODMawgWUFffmZccSDkur1bhIXDMQ==
=fR9i
-----END PGP SIGNATURE-----

--Zi9KS84QAYs3iIQu--

