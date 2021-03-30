Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B7534E7C6
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 14:47:16 +0200 (CEST)
Received: from localhost ([::1]:50796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRDm7-0003vw-Bm
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 08:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lRDe9-0000bm-3F; Tue, 30 Mar 2021 08:39:01 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:48027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lRDe5-0002jj-GQ; Tue, 30 Mar 2021 08:39:00 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0B3955C016A;
 Tue, 30 Mar 2021 08:38:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 30 Mar 2021 08:38:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=UB0Fz5PQIDlTk51X+9qMCM7jri8
 Dj6070Pc+UCesGg4=; b=L/ajXCggA/4oebV6c7R2IZcS99p9nmvdVTPZNzh6HGx
 DlrsckPb6JUa0PnJztEVE8TyCiefZiJ+01SqpLj0iJHbNtJgTRQjovKVSSXwmMUo
 naUwKlCFoV8bKHV9YLcg1osQucY1suCzhabZGVE+MgCD33gOhh2mv6OaUnCAupMM
 cF+0Iy4Dpe1hQ0P58NNll1MMAFR0rD6suHqG7PBkNsmFXiorzP6rten2wORKaEDX
 TFmvebrxBsvL4UeAxsnEMrlLB5Uv2jSjyQOsMZQ5BZqt+F6JtADIyXpcSLNdPGgo
 mLcMTmcAX1daq8x7uPK6/cBR7USe66d1k8w+rEESnMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=UB0Fz5
 PQIDlTk51X+9qMCM7jri8Dj6070Pc+UCesGg4=; b=E/Dg2rYmfe6GysBQvoXovi
 uJ+aC06e2USKIGlNq/KmW8a/xliBgMjgcwMK4g/tS4h+sx+LRIyrfmCCJgYLEW72
 bmko4OZ7pWVB1dtRyPEJ3n3StoGodu+LxteQUw0gO4W82cFGixF64GNwpf1oXe0h
 ASMWmB1cJ98k274KKnIzEbrGHoLptS8hIYgJjqSsZ7wDaSXm7rnthr5jtrcCHR1s
 er9cVmi+I1mxC9G/1/uNUzcqEKqU/OoH8BLQWQlxLFeHQfv1/BAgrn4A2dbPD2aL
 HQP04hCijvIZTpdAijh0IgG5jjpOJtl5weck/Y/LjGW5F41Hy7dmfzNYPFCshHgA
 ==
X-ME-Sender: <xms:3htjYAE2xLH2ozIyco2Y7AxlX4GSmE7tdJC4sKrmNJdhOuYZEnf-ww>
 <xme:3htjYJUA8ucVjj31S4oNY-14LL8PhDGv8GyokvH7_-EUQt3bbDUdyAgGkn4uOu7mV
 I9jwih6fbgz2S5QSxU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeitddgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:3htjYKJ1TOU-H-Z_G-NMvkC8W0Qu6IQk2GQ1y-Q5Fouv_yrNIXIgDA>
 <xmx:3htjYCEOeYVi3ZxL90_sNSB8LduvT9Uunbbv9hUXj01fVDdYZqN_5Q>
 <xmx:3htjYGVu7Hde3kiw9MaednrXgwmWCjJRO-xq0zLhr79EfSeuKad9mA>
 <xmx:3xtjYDgDb7rAMYF6p2HjXaa3xyDE0dZqO4Rq-t8BMaS1y3Tz0eITKg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 72CD51080063;
 Tue, 30 Mar 2021 08:38:53 -0400 (EDT)
Date: Tue, 30 Mar 2021 14:38:50 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Subject: Re: [PATCH] hw/block/nvme: remove description for
 zoned.append_size_limit
Message-ID: <YGMb2gfySMGL20Co@apples.localdomain>
References: <20210323111817.115837-1-Niklas.Cassel@wdc.com>
 <YFnPAKkbw3bkB6n5@apples.localdomain>
 <YGL7SOSqHG6WSshj@x1-carbon.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YB4i9BpFUeBwAJx+"
Content-Disposition: inline
In-Reply-To: <YGL7SOSqHG6WSshj@x1-carbon.lan>
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
Cc: "kbusch@kernel.org" <kbusch@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--YB4i9BpFUeBwAJx+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 30 10:19, Niklas Cassel wrote:
> On Tue, Mar 23, 2021 at 12:20:32PM +0100, Klaus Jensen wrote:
> > On Mar 23 11:18, Niklas Cassel wrote:
> > > From: Niklas Cassel <niklas.cassel@wdc.com>
> > >=20
> > > The description was originally removed in commit 578d914b263c
> > > ("hw/block/nvme: align zoned.zasl with mdts") together with the remov=
al
> > > of the zoned.append_size_limit parameter itself.
> > >=20
> > > However, it was (most likely accidentally), re-added in commit
> > > f7dcd31885cb ("hw/block/nvme: add non-mdts command size limit for ver=
ify").
> > >=20
> > > Remove the description again, since the parameter it describes,
> > > zoned.append_size_limit, no longer exists.
> > >=20
> > > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> > > ---
> > >  hw/block/nvme.c | 8 --------
> > >  1 file changed, 8 deletions(-)
> > >=20
> > > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > > index 6842b01ab5..205d3ec944 100644
> > > --- a/hw/block/nvme.c
> > > +++ b/hw/block/nvme.c
> > > @@ -91,14 +91,6 @@
> > >   *   the minimum memory page size (CAP.MPSMIN). The default value is=
 0 (i.e.
> > >   *   defaulting to the value of `mdts`).
> > >   *
> > > - * - `zoned.append_size_limit`
> > > - *   The maximum I/O size in bytes that is allowed in Zone Append co=
mmand.
> > > - *   The default is 128KiB. Since internally this this value is main=
tained as
> > > - *   ZASL =3D log2(<maximum append size> / <page size>), some values=
 assigned
> > > - *   to this property may be rounded down and result in a lower maxi=
mum ZA
> > > - *   data size being in effect. By setting this property to 0, users=
 can make
> > > - *   ZASL to be equal to MDTS. This property only affects zoned name=
spaces.
> > > - *
> > >   * nvme namespace device parameters
> > >   * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >   * - `subsys`
> > > --=20
> > > 2.30.2
> >=20
> > Argh. Thanks Niklas, queing it up for fixes.
> >=20
> > Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
>=20
> I don't see it in nvme-fixes yet.
>=20
> Did it get stuck in purgatory? ;)
>=20
>=20

I could have included it for the PULL from yesterday, but I kinda forgot
and only added the coverity fixes. That's pulled now, so I've queued it
up for the next round of fixes now! :)

Thanks for following up on it!

--YB4i9BpFUeBwAJx+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBjG9gACgkQTeGvMW1P
DemO6Qf+KxaiT6NE/g3/m8gq9mOt041vWJyKxKtvEN/vBo7X42aZqWWdhPzqKtYP
G3PCcUQ1/DRPuqzY5e1zJUbna2LVWk5WzLsNvCHVr3gMTkSITKaRUv8tSXQni5+g
WiQzsfcLPQcPX+gVhnQ+JrcxoNOmmNP2mjNmyr03mIXGk40x6wVOGJPWgmCWbTeZ
iTBl9PKWY4oTQXFgjVZiJ6Rbkdj37eKyhdrF6ALrC5EKbwMCXw8bP8ZKsmUWFY/6
HMl4d4ylKXqlfoegBDBXfuDSQkaT3jd2NECZ+IS+Ctfz063NWnA9SyzftGN3TI2A
+gZgclOvAyFjP2kZINSVp/OdEhg7jA==
=/Qz7
-----END PGP SIGNATURE-----

--YB4i9BpFUeBwAJx+--

