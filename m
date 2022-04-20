Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9258D5088EB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 15:09:16 +0200 (CEST)
Received: from localhost ([::1]:60108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhA54-0003DV-QQ
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 09:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nh9l2-0006ET-6b; Wed, 20 Apr 2022 08:48:32 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:60125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nh9kz-0005j3-8U; Wed, 20 Apr 2022 08:48:31 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B646B3201F88;
 Wed, 20 Apr 2022 08:48:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 20 Apr 2022 08:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1650458905; x=1650545305; bh=AV
 AaaZILWOkS51SK7arp3WxGIU8Qe07Q6pCkdk9Ogyk=; b=W572Dj+/QVw3HnQrqm
 TSkkRICO2DkIAZW1g9X5OawLThv/ARqGC0Es798c+CP0ksXawG8MI0WgjePkduCr
 YJUTNFqvf9rjfH83VQ0T2NPY185Lr7XEssgwr1gd+MPQEUEwtUd+MHPoCSLBStga
 EQ3aPwHBzYJZw4Yh9ZCXtZouKSqV5y3bNQlMzQiAcpQWRLxMhRiHA3OQKu1ia3B6
 72/3JXChURCC9V/yMyGTbikrqugolBO+O8bF5nvWw0SjkJkGToKpzswjtVbZ0qed
 6LvPRzVHSHQhjXk2B1MrjFDdgRlYAd6jzwM/m76yvUVr3woJixrESzitE07Tp32e
 osQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650458905; x=
 1650545305; bh=AVAaaZILWOkS51SK7arp3WxGIU8Qe07Q6pCkdk9Ogyk=; b=Y
 eZSa+Cp20FND9VRi5/eQ7rVkrj0P51+LGvWl1ZWnujKodKH2GoFro3SwGfTeuePo
 +xYZhDPJc1gZi+ayfXIkuVUtkSSYU1Q16yM/VDvgVpDKTmUhQp/d7OabLjzT6fia
 aVLgRb03UrPmkKo7AzrdoP/udliBzJzOZ9veUpJNyt4s0WFf5mWbnL8AC5UdxMi7
 DOvgSSpUBzg3GtL+VcTCWuj009nnpdlhAJPlNwtv3axFFSHORhzExtEI8KNhN7zg
 2MTA4/qtmXD1DYWb2CSG9vhsgNLLXtixwFdkc/FHsBt8tMsHLi+ZGWGihwHUbphe
 QHjzBD69WoIazE45ZQNTw==
X-ME-Sender: <xms:GAFgYtKbHVL-zjMysk0tEgG6C9b1o33PWgwT3e0_bGUpqIxFA-vuLA>
 <xme:GAFgYpIgKJpnuZSpRSFwECylfZZGpaGfDEQcxHFsYvY26LXITD5SyiWkmcbQJ1FD8
 EiBZvArE-hMJtwwxQM>
X-ME-Received: <xmr:GAFgYltiUUqtTgUSXNUocqDk2tfzjZ-hyv9WP6eabuj81EdgrdsW8-VkfMsT4sl8G4BHTDaYCfOT9PvMUEE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtddtgdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgv
 vhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjeejueeikefgueduffdufeellefhte
 fghfefhfdvteejjeefffduteduteeuhedtnecuffhomhgrihhnpeefugdrhihouhenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirh
 hrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:GAFgYuYOzJ2iMK_vjtNGdpHcUYuvs7JV5i4m0AuZgJt9642q6s1NHg>
 <xmx:GAFgYkbAkPFtrfsEuCguOHoNeSaW8CqxTrSQifspJswTIC8fc25Kqw>
 <xmx:GAFgYiBez1zClTlxcTHeTfjhEwneRJPasEiy39fFpzdOVz0BoR1Yhg>
 <xmx:GQFgYjwrEYwf564nRhbd4JO_DxVslI4dvwqVnXnKiGSI3EANsACsQg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Apr 2022 08:48:23 -0400 (EDT)
Date: Wed, 20 Apr 2022 14:48:22 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Tikhov <d.tihov@yadro.com>
Subject: Re: [PATCH] hw/nvme: add new command abort case
Message-ID: <YmABFkPP4Guj0F90@apples>
References: <20220420082044.n6orslk2aukj2jai@localhost.localdomain>
 <Yl/csehng+W0gfQD@apples> <Yl/iRnvEj+tDycUI@apples>
 <20220420104126.iy5b4exyqh62m632@localhost.localdomain>
 <Yl/mdOnDzOE6Fdza@apples>
 <20220420123156.jnw4c3s66ikcl6df@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/pduPLukXNcU03Eb"
Content-Disposition: inline
In-Reply-To: <20220420123156.jnw4c3s66ikcl6df@localhost.localdomain>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kbusch@kernel.org, ddtikhov@gmail.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, linux@yadro.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/pduPLukXNcU03Eb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 20 15:31, Dmitry Tikhov wrote:
> On Wed, Apr 20, 2022 at 12:54:44, Klaus Jensen wrote:
> >=20
> > NVM Command Set Specification v1.0b, Section 5.2.3. It is exactly what
> > you quoted above.
> >=20
> > I think you are interpreting
> >=20
> >   "If a command is aborted as a result of the Reference Tag Check bit of
> >   the PRCHK field being set to '1', ..."
> >=20
> > as
> >=20
> >    "If a command is aborted *because* the Reference Tag Check bit of the
> >    PRCHK field being set to '1', ...".
> Yeah, i was interpreting it exactly this way.
>=20
> >=20
> > But that is not what it is saying. IMO, the only meaningful
> > interpretation is that "If the command is aborted *as a result of* the
> > check being done *because* the bit is set, *then* return an error".
> Ok, but return error in this context still means to return either
> Invalid Protection Information or Invalid Field in Command, isn't it?
> Or why would it specify
>     ...then that command should be aborted with a status code of Invalid
> 	Protection Information, but may be aborted with a status code of
> 	Invalid Field in Command
> exactly this 2 status codes?
>=20
> >=20
> > Your interpretation would break existing hosts that set the bit.
>=20
> I also opened NVM Express 1.4 "8.3.1.5 Control of Protection Information
> Checking - PRCHK" and it says
>     For Type 3 protection, if bit 0 of the PRCHK field is set to =E2=80=
=981=E2=80=99, then
> 	the command should be aborted with status Invalid Protection
> 	Information, but may be aborted with status Invalid Field in Command.
> 	The controller may ignore the ILBRT and EILBRT fields when Type 3
> 	protection is used because the computed reference tag remains
> 	unchanged.
> I think it marks clear intent to abort cmd with "Invalid Protection
> Information" or "Invalid Field in Command" status codes exactly in case
> reftag check bit is set. Also isn't "may ignore the ILBRT and EILBRT=20
> fields" means not to compare reftag with ILBRT/EILBRT? If it is not=20
> compared then reftag check error can't be returned.

What the heck. This is a pretty major difference between v1.4 and v1.4b.
v1.4b does not include that wording (but it *is* present in v1.3d). You
are absolutely right that this conveys the intent to abort the command.
Looks like this was lost in the changes in that section between v1.4 and
v1.4b. This explains the wording in v2.0 - the spec people realized they
screwed up and now they have to accept both behaviors.

>=20
> But anyways, spec says that "should" and "may" indicates flexibility of
> choice and not mandatory behavior. So if you think that current behavior
> is right i don't insist.

I'm not so sure now. Another question for the spec people... I'll get
back to you.

--/pduPLukXNcU03Eb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJgARQACgkQTeGvMW1P
DekCEwf4+Ozwyg/hMH1JNN3ESESruezeBMNvDLnSzZR4Q2gHO/8krZTSO5iMPA1T
yW/8Wbn5O6HsrRa/+6QifZTN80dYXLh7tn10VI5rs0jF8WVxyu9nMT697SlHhIz3
tRONfabNwrL2fNOX4Se0LtD1PDTIdF5lb/OIAaYkJoFk+qCovxU8GNCUlAPOMXzx
XCc3ib/k3UBa/j41ZiRVKuIVSTugWz+ObU8nm5aXh+r49G7sI8Adw3OM9w9f9PVJ
qtBuPC+U2CK45AiBe/qjXzALYkE+lhWgq2O2dBTXUFhAQteIfF+70qtsS0IcQqRq
4HcHF+qJMG2uffoUi2paj4m2BXmZ
=2RK0
-----END PGP SIGNATURE-----

--/pduPLukXNcU03Eb--

