Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F010A3EE4F1
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 05:18:41 +0200 (CEST)
Received: from localhost ([::1]:48752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFpce-0005I2-U3
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 23:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mFpUR-0007y8-JB; Mon, 16 Aug 2021 23:10:11 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:44803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mFpUO-0001qE-Fr; Mon, 16 Aug 2021 23:10:11 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GpbcX3rHLz9s5R; Tue, 17 Aug 2021 13:10:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629169804;
 bh=ArX7yQGON+86ihX7bmKpkKedGT/Xw3uFq8kW2fptJTQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zp0AuYU+SXIt7n+Adr7RlCoPqmTeCtmOzVw92rkNXqR0UJUMNLonObdc4+PbirNvB
 Fu66desVySJ1wSTPdYtGhtOUn/4Zp/PEw+7EXlLETAUh3Yiin84f1Do+/hhqyqLH4s
 TRxOCQV4e+sECBq4+h8zS2LBpJUjGDYNP1W3bWBg=
Date: Tue, 17 Aug 2021 13:06:45 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH] hw: ppc: sam460ex: Disable Ethernet devicetree nodes
Message-ID: <YRsnxY+0PplppxeU@yekko>
References: <20210816025915.213093-1-linux@roeck-us.net>
 <YRn6d/Vb10JTmZ18@yekko>
 <68327a9-a317-9be8-92a6-ed23a91f4d7e@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uHtq5tOfCQUMo6D1"
Content-Disposition: inline
In-Reply-To: <68327a9-a317-9be8-92a6-ed23a91f4d7e@eik.bme.hu>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 Guenter Roeck <linux@roeck-us.net>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--uHtq5tOfCQUMo6D1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 12:21:33PM +0200, BALATON Zoltan wrote:
> On Mon, 16 Aug 2021, David Gibson wrote:
> > On Sun, Aug 15, 2021 at 07:59:15PM -0700, Guenter Roeck wrote:
> > > IBM EMAC Ethernet controllers are not emulated by qemu. If they are
> > > enabled in devicetree files, they are instantiated in Linux but
> > > obviously won't work. Disable associated devicetree nodes to prevent
> > > unpredictable behavior.
> > >=20
> > > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >=20
> > I'll wait for Zoltan's opinion on this, but this sort of thing is why
> > I was always pretty dubious about qemu *loading* a dtb file, rather
> > than generating a dt internally.
>=20
> We are aiming to emulate the real SoC so we use the same dtb that belongs=
 to
> that SoC instead of generating something similar but not quite the same.

Well.. sure, but you don't *actually* emulate the real SoC, so you're
advertising a dtb that doesn't match the real hardware, which is a
bigger bug.

> (QEMU also has a -dtb option but I'm not sure how many machines implement
> it.) So loading a dtb is not bad in my opinion.

Well.... I'm not all that convinced that -dtb is a good idea either.
But to the extent that it is, I've assumed it's very much a "you must
know what you're doing" option (like -bios) where it's the user's
responsibility to make sure the dtb they're supplying matches the
emulated hardware.

> Given that we don't fully
> emulate every device in the SoC having devices described in the dtb that =
we
> don't have might cause warnings or errors from OSes that try to accesss
> these but that's all I've seen. I'm not sure what unpredictable behaviour
> could result apart from some log messages about missing ethernet so this
> should only be cosmetic to hide those errors. But other than that it like=
ly
> should not break anything so I'm OK with this patch. (I did not implement
> ethernet ports becuase they are quite complex and we already have several
> PCI ethernet devices that work already with guests so it's easier to use
> those than spend time to implement another ethernet device.)

So, the thing I really dislike about this patch is that it's not
committing to either approach.  It's neither having a supplied dtb and
making it qemu's job to match that behaviour exactly, nor is qemu
supplying hardware and producing a dtb to describe that virtual
hardware.  It's doing a bit of both, which just seems like a recipe
for confusion to me.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--uHtq5tOfCQUMo6D1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEbJ8UACgkQbDjKyiDZ
s5IZHQ//V9YpYKnXiZaV9gzouiETT3vSQLLN2Js5lGDNZiPlFd+Itv0c7jeJMU55
ReXwcOwHdPqW7w1yt/U6f6c6LN/Rfa20h5dXtqdXdqvNqty7esWdYzK4e9tolJ9Q
o67Fl0Ojg7jDLPNZ7xcagTELsL3sVz60W0vC87VEqGfaxpIQBfaP2+e/FrfQTs95
A9xSvNDtxfIb4v53KsRvpqyRTjlNyHMxjQ7wJKHbSpPcQyrddRW/ouUXzQMrUk8p
X8wmCWppMxOtjnXQqKWZbxCfD0Uu8kOlJPk1WdVCmcdhTDOqdI5l66ztyVuIDzR2
dyF/Hd41NDh5KGGpckElI/gaRr4++aydpMOg8z/LeTxJKW5kevgETOvNWv+Yvb5t
HYWGHuwSVg8pEAmFmAzkVmi6y2FyY3VX5KSHazBQA0iLJzCJ5erUaEeDB6DcqFF9
7y6aMyY0wlQNYQYxAidd/rz3roqCBuQM4MYbfwiuVe1kUDfqIYZiapiGWfJZyP03
ojL29qNdU0MP+YZ3dXctWOjP6DSv5COs4R6byE5MD1mJ1f8MCtcyVU+eDAk/82wl
7VyZpT2XGqwWFSjSShMpyq/3m7FVj6o/VTgPHpp1v8caWjvg7dAEJwt4bJJJ3RHl
sdVmigRefRFWiojdoEpQKLF88dMuUotYUBQ6NqjP7WhwuBbkfjo=
=NfR0
-----END PGP SIGNATURE-----

--uHtq5tOfCQUMo6D1--

