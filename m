Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64951344264
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 13:42:42 +0100 (CET)
Received: from localhost ([::1]:33980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOJtJ-0002cj-At
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 08:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lOJoF-0001ps-9P; Mon, 22 Mar 2021 08:37:27 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:54631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lOJoC-0004Ah-Ox; Mon, 22 Mar 2021 08:37:26 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 1084F167E;
 Mon, 22 Mar 2021 08:37:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 22 Mar 2021 08:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=7hbJeC3p1Z8tyoFU0fVBURxlMxR
 sjsB1k11zAknHowY=; b=EdjqllIculFy0iaO9Spo+zop6xVA6DLkCTiV8nGlyKj
 S7a+7MtNDAcaCBTXAVL54qJF/37CUrGPm7NbWm55QfeA2V+Cw8be54Mb9rndkydN
 U44oUbOivqju4fiE6pZlD8qkF3ih8zRk22CBKP4ltXUZQE05TKg02tylfFk5H1zu
 zRQuQNXZwBJtX+WKc5NGM6s1FXfsrZ2m1xGvshGc0LnrWwhqDd+LccJuXprPaRdf
 zUHG+cDNRBrLK4Hby6fLd9U++qrIJ6BPGvDjaESL8irBBOZhCI81YGoPIklWjBwz
 3TDQ7Vtz55bO1dJIADKx7i5hg9kTJFRjjm4xWiUygBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7hbJeC
 3p1Z8tyoFU0fVBURxlMxRsjsB1k11zAknHowY=; b=m9eI2BcWCJK+DnhNYd5TiW
 ZC8fZiiHxu9xGZGx9s2jQYxfElydzrE1p6owYYTgXkdDyTUV21eMDHdbPxPkFTAu
 tq8XXYpQiEeJlVlio4s4z1mRoLsn+GTvPFBxNhhqjJNeAN7YxUfR1YFG0ijjJy2E
 DnjhC/YjSq0pWqcLaUiCdHFvzkQLqVTkILR4CmeP+xT+g0vz6y3c5Er05CdC11sj
 WoX2gpq6PbuWy0vS6BEKKgQv6yvD5scpYSaNQS7BbVU4cFcuRAkEE5pn3pUXfvty
 gSAsSgzX9qb8Y5ylVHpf//z19oJMbMu6Fp47HSOrT+lUvDytX6hK4zHWXQo/1CSg
 ==
X-ME-Sender: <xms:gY9YYOoBLvjrqvmPp20IwXtC6OHFDCAizaSY9fKd9UF2F6biCMq0Lw>
 <xme:gY9YYKlV4dga5Q_eHlevtqzgd4KYKwjCilLahB7xnUCfG5QbeWdhF0ed57owAo2Co
 tf6obJxgiOKLXBtWBU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeggedggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:gY9YYKzMeTpkIrRbMkTJ3RSPskGaUlJcEhbYjMt7t7_0A6_9-dyw8w>
 <xmx:gY9YYKmY5sebicwQioELSy1rcAJQg-VCyDRIGZXMqPVnsSrySiE_aA>
 <xmx:gY9YYLeIt28CeAWqG70XxIFibnf1qpqeq7wFAVoRhInHUiZ6Mh5d4w>
 <xmx:gY9YYIx89nEytK838Ey0WJVWqSYvyfcfgm01I-7PTjK5AzP4hYXCWA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 303241080054;
 Mon, 22 Mar 2021 08:37:20 -0400 (EDT)
Date: Mon, 22 Mar 2021 13:37:18 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] nvme: expose 'bootindex' property
Message-ID: <YFiPfnX8is7tCS16@apples.localdomain>
References: <20210322082444.12916-1-j@getutm.app>
 <a7030c4b-943d-c88d-655d-dfd6398d68d5@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uLtbYcX35Tro/sAu"
Content-Disposition: inline
In-Reply-To: <a7030c4b-943d-c88d-655d-dfd6398d68d5@redhat.com>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:nvme" <qemu-block@nongnu.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Joelle van Dyne <j@getutm.app>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--uLtbYcX35Tro/sAu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 22 10:58, Philippe Mathieu-Daud=C3=A9 wrote:
> On 3/22/21 9:24 AM, Joelle van Dyne wrote:
> > The check for `n->namespace.blkconf.blk` always fails because
> > this is in the initialization function.
>=20
> This usually mean the code depends to some state only available
> during the QOM 'realization' step, so this code should be in
> nvme_realize(). Maybe in this case we don't need it there and
> can add the property regardless a block drive is provided, I
> haven't checked.
>=20

If we defer to realization, it won't be available as a parameter on the
command line, but as far as I can test, adding it unconditionally
doesn't break anything when there is no drive attached to the controller
device.

> >=20
> > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > ---
> >  hw/block/nvme.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index 6842b01ab5..42605fc55d 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -6330,11 +6330,9 @@ static void nvme_instance_init(Object *obj)
> >  {
> >      NvmeCtrl *n =3D NVME(obj);
> > =20
> > -    if (n->namespace.blkconf.blk) {
> > -        device_add_bootindex_property(obj, &n->namespace.blkconf.booti=
ndex,
> > -                                      "bootindex", "/namespace@1,0",
> > -                                      DEVICE(obj));
> > -    }
> > +    device_add_bootindex_property(obj, &n->namespace.blkconf.bootindex,
> > +                                  "bootindex", "/namespace@1,0",
> > +                                  DEVICE(obj));
> > =20
> >      object_property_add(obj, "smart_critical_warning", "uint8",
> >                          nvme_get_smart_warning,
> >=20
>=20
>=20

--uLtbYcX35Tro/sAu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBYj3oACgkQTeGvMW1P
DekQdAf/ceZcfOG4R5jcmzEaxnlm5A0AFY2QXB6NaOubXvCdhHFbNesbh6GfLJ2m
qfBERss+4y1HT7MNfUPGvaE2GpTkT+kKkmOwMRS+FD5cZlt6v0HCbqWCZ5FPjCYq
BddR6aKrN4wmVGzlz/eFLppsj+FWyaWVY7e2vvQsBXKL3YR0DR4YA/O9AUgXeGCu
66kZ+BanpfzUAFvAofcKbJlEQPNu2tHfCHIJP1V7dXFFRd+biNz+/xru1G4Cduds
4FGYjdICcmeUiHodqP3AEa7pAcjuCYHNpa32mVOmtXgDen0L0r1LhZzEPSUGStUk
Dzby3BRXdSmWQTQIqAA89CdgYgHDEg==
=PWVA
-----END PGP SIGNATURE-----

--uLtbYcX35Tro/sAu--

