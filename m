Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B305F7168
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 00:51:50 +0200 (CEST)
Received: from localhost ([::1]:57390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogZiW-0007bE-VS
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 18:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1ogZfz-0005hv-ND; Thu, 06 Oct 2022 18:49:11 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:33999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1ogZfy-0000iR-BD; Thu, 06 Oct 2022 18:49:11 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 401EC5C0144;
 Thu,  6 Oct 2022 18:49:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 06 Oct 2022 18:49:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1665096549; x=1665182949; bh=MNKY3V0usV
 /S/gkbBD8XI1uqHH6SpnFgSOTC3mCTjAo=; b=es8kNSqZ0gOCgRBsLWbp+nVuUD
 1d8PyCmgOlrtBjFjUR5Gm0NuNdAwst1ZE6S1D6dHyDfC9+v0q9XR6tO8mpXr/PAD
 vq3VOIGp5pNMDhPcfc49MiitGWpc5kQB3Q4wO15rdf6zC8Cq+2I3Da7vTygJ8RXc
 /AB1E5mwnd2QvVFoHE4NnOOxIhW9mtvWjcF7ipbwXO8KWNZRJAQO3DhXKaZGfSi/
 MG0+tzRrpMTrCYg3Crg8ia+K/Xj6RcPRF8wFbdWhp1y2x0BM4Il9YI5RPkcJC1CH
 mPh69YoJhZlHAFTGFni6lINlxoNzWGon+kbHn5iKxfBMMBtLKSYzyMxeiPJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1665096549; x=1665182949; bh=MNKY3V0usV/S/gkbBD8XI1uqHH6S
 pnFgSOTC3mCTjAo=; b=VvhEcUpbuQSIivYncRCbLvlCqJkRwi08hIPPd3DtXu9K
 PiJsuuc9IEeiO7pGxJ6sGxMXihNnXacaeWMbI346r6tMoBRThJfCPA7YAsdYtu4l
 viXk3izjhJm63sZ201//j4VfYPuQDs6JS7joDzEYU7ZCIhuB7Ib+RbUZ8NDz7T3c
 2W1yFdEVbYuLuLWpJmqnkFmDKGayYc8sH0ckHESnowbdQ94yRjdN3h9kY13OIQG7
 50u34NKj2nIqMfGUNhd+KVJ6KR3hXVp+Ovtj0h2xk5LTTxN/bGZpkcEKyc1qhRFG
 9cDkVxw8wZU/GpY9mKGLHTqFcuwpiM9O4aQ/B+/+vQ==
X-ME-Sender: <xms:ZVs_Y7CskwQnvi3B722aHmo-RpSMxTsE09vsFfJsdHi2VFbV0gIasw>
 <xme:ZVs_YxjDPLq3XS-XisGZFtU_-Wi0HBEFnpw0X_lAQUby-oZwtZXhMbI1a8n5LP7Na
 bVTzwTjaeaXMGtjPrM>
X-ME-Received: <xmr:ZVs_Y2n5poSS8OapUUnm1LzRx4T6VJFtuempsh_GTOPzpjmIbJgpcjYMPitjekc7rBqJJ4r2a6Fnpoicexskfet8fw7h8AyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeiiedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
 tddunecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpedtjeejgfdugefhtedvudfghfej
 feejfefhffeffeelgeduveejleelffefvdffleenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:ZVs_Y9zz276HTCBwKsSUWhD9P8cbB57gMRx8KA8XkOIx13AxWoLMDg>
 <xmx:ZVs_YwRB0rMZ7zyM5rspA1uWcMJ8dygqU-eIAw0ypDvTY4Qgi5Suew>
 <xmx:ZVs_YwbjhV8GHaCW_wp4kjwM5GpWPyGJoSdL72-lOiHfpgERxuiB4w>
 <xmx:ZVs_Y5_DhUrM_zsA3RNXcMAf6Z7yDLA1xsRvpzMQWXBkfirmXSWN4Q>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Oct 2022 18:49:08 -0400 (EDT)
Date: Thu, 6 Oct 2022 17:49:08 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v3 0/8] m25p80: Add SFDP support
Message-ID: <Yz9bZGY69fg2Jyuh@heinlein>
References: <20220722063602.128144-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6DeqmZ9NATzA+Htl"
Content-Disposition: inline
In-Reply-To: <20220722063602.128144-1-clg@kaod.org>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=patrick@stwcx.xyz;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_SUSPICIOUS_NTLD=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_PDS_OTHER_BAD_TLD=0.01 autolearn=ham autolearn_force=no
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


--6DeqmZ9NATzA+Htl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 22, 2022 at 08:35:54AM +0200, C=E9dric Le Goater wrote:
>=20
> C=E9dric Le Goater (8):
>   m25p80: Add basic support for the SFDP command
>   m25p80: Add the n25q256a SFDP table
>   m25p80: Add the mx25l25635e SFPD table
>   m25p80: Add the mx25l25635f SFPD table
>   m25p80: Add the mx66l1g45g SFDP table
>   m25p80: Add the w25q256 SFPD table
>   m25p80: Add the w25q512jv SFPD table
>   arm/aspeed: Replace mx25l25635e chip model
>=20
>  hw/block/m25p80_sfdp.h |  27 ++++
>  hw/arm/aspeed.c        |   6 +-
>  hw/block/m25p80.c      |  49 ++++++-
>  hw/block/m25p80_sfdp.c | 296 +++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS            |   2 +-
>  hw/block/meson.build   |   1 +
>  hw/block/trace-events  |   1 +
>  7 files changed, 371 insertions(+), 11 deletions(-)
>  create mode 100644 hw/block/m25p80_sfdp.h
>  create mode 100644 hw/block/m25p80_sfdp.c
>=20
> --=20
> 2.35.3
>=20
>=20

It seems that the kernel spi-nor driver maintainers really prefer to use
SFDP for parsing rather than relying on flags, so this support would be
really good to get added to QEMU now.  I've tested this patch set and
added (in reply to patch 8) support for the w25q01jvq chip.

Tested-by: Patrick Williams <patrick@stwcx.xyz>

--=20
Patrick Williams

--6DeqmZ9NATzA+Htl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmM/W2IACgkQqwNHzC0A
wRnLaw/+IwaofYagGUXreij3UOLwYRatAOxiB1v4A4jXINqmlFvVQ/E7Gnod0aPP
VXYCf0O/d2zoR1ATyednznlUpNQ7/zf3SiwMNLNWixXOt511yLkNbcgrez67KL6k
omvfAhWlTXl/YitYOBWw8cvdBPWeo85laTA8rT9PlWbsW9eFjF6h+IRLqYJFP54U
mLiZfxkXvNY8DBBaPZ5H59R1j/3YiCW3TvhZsSYSDXDqlZMmMmKNgOohz5GuSTNg
poEtIp/9Ott0eQ9C2eQnQwnQElUfjxUPvXKsIs5b+CLECGFkL/BvQSImH4opnkKi
MjMZzapwjy8JlA9CNhv9ihyMYZzIctjYQEaIN9cHLs9488yAH3W4H6bVnsYqQfv0
l/o+72bPmhTypoVvGPN0ASOXFrp2cv/y0IPi+ovihdL4Y95tRuCZFCJBiaoZGSn/
1TvOd2h8klDxySNCy+CSpjBnxxX6y42ySHvDWT3qml78uFalQdO852WfJPsA+vUr
P5b79RJAKhR5Clt+5y7Qcidhp6yU1FW2GVKiAMnVpCqcoOB2HHL/eFMNW0Z1r9X/
0TL7C9IwLVmn1utya8DOyVlela1512AyuWD/wrGOE2nRHXrEPg7yTIxuMcPfHeEs
5y4q0n7u+lzSUhWRgFISplUmTbtB8pif8vMYPfO0Y86SfSrzcRM=
=504E
-----END PGP SIGNATURE-----

--6DeqmZ9NATzA+Htl--

