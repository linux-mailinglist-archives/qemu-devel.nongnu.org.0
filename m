Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C7D414049
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 06:04:07 +0200 (CEST)
Received: from localhost ([::1]:45984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mStUM-0001lU-2X
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 00:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mStPC-0007Lc-Sn; Tue, 21 Sep 2021 23:58:46 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:53661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mStP9-0007DS-MX; Tue, 21 Sep 2021 23:58:46 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HDkqj1vWnz4xb8; Wed, 22 Sep 2021 13:51:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632282689;
 bh=gusuSoouh2/IcWNBemCHSWYu1tHBIWCQt6Z7+y2wmjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YmGUft+tVtdYnwVUnHEOYPtEfteUzs83RZTUE5qXvjyFdtDVc8Bo33Kly5EREkNCk
 rhLPJY62SnjEPmInGeTTBx7gj5hjp+Yw+eaRDU6GwfYWhQd8mQBfa0RHdt26I8mp/y
 U7RQ2lJ7UAArr9GtxAFqhVN59+m5M1jFX1xY/DHg=
Date: Wed, 22 Sep 2021 12:50:22 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] spapr/xive: Fix kvm_xive_source_reset trace event
Message-ID: <YUqZ7o4vG9JWaZYx@yekko>
References: <20210921065652.1121406-1-clg@kaod.org>
 <20210921091354.02d4be4d@bahia.huguette>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PrgtzcJ/h9nZ08SE"
Content-Disposition: inline
In-Reply-To: <20210921091354.02d4be4d@bahia.huguette>
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PrgtzcJ/h9nZ08SE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 21, 2021 at 09:13:54AM +0200, Greg Kurz wrote:
> On Tue, 21 Sep 2021 08:56:52 +0200
> C=E9dric Le Goater <clg@kaod.org> wrote:
>=20
> > Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> > ---
>=20
> Maybe add ?
>=20
> Fixes: 4e960974d4ee ("xive: Add trace events")

That would be helpful.

and... this really needs at least *some* commit message.

>=20
> anyway
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>
>=20
> >  hw/intc/spapr_xive_kvm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> > index 53731d158625..7ac2502cc013 100644
> > --- a/hw/intc/spapr_xive_kvm.c
> > +++ b/hw/intc/spapr_xive_kvm.c
> > @@ -236,6 +236,8 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, =
int srcno, Error **errp)
> >      SpaprXive *xive =3D SPAPR_XIVE(xsrc->xive);
> >      uint64_t state =3D 0;
> > =20
> > +    trace_kvm_xive_source_reset(srcno);
> > +
> >      assert(xive->fd !=3D -1);
> > =20
> >      if (xive_source_irq_is_lsi(xsrc, srcno)) {
> > @@ -323,8 +325,6 @@ uint64_t kvmppc_xive_esb_rw(XiveSource *xsrc, int s=
rcno, uint32_t offset,
> >          return xive_esb_rw(xsrc, srcno, offset, data, 1);
> >      }
> > =20
> > -    trace_kvm_xive_source_reset(srcno);
> > -
> >      /*
> >       * Special Load EOI handling for LSI sources. Q bit is never set
> >       * and the interrupt should be re-triggered if the level is still
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PrgtzcJ/h9nZ08SE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFKme4ACgkQbDjKyiDZ
s5LA8A//fudlsYKk7ekFvAAlHiz4EZGsJ4Ez8M6lWLLJqSjN02RlFuGuOzELhdyL
fzLYSXMXTPmzAKM3JuoPEyDfSr6MB/U8S96Mp9oC1lXpMlaU2JfpVlNYjz105Edn
wZt75xs+heuje1ZRw2ZjPACOBjqXFjYDOLukV7Gtli7iDUKFTI5kldmjP8FDk7UZ
awJhwvA6i8JEvyCozl11iEpdkcZdA39egrBAmwc7lDo0jOfaqbemDtH2v30ymk9h
6rdT7PALpoDTNQ98HvHw82kSy0PpzoUB76G/a/NH31HYCkQcyKa7dQdvBdXVCvi3
vdXsRuejzbaDgDetysoIqw2F+FaAJCZi/T+kE9DB6vf6Zjzf9bSROhwy9rYc70Uk
wAA6FYjzKazImFh0JiADe0D60/EUph8DUObAGaII+YCWJAXUCq0SHXl0F+UeNG8q
kzgsBRJBNAvM7y+RGcWBVW4d+GxFMowQREWbPkua41SDPas15a8H8GFMyPIyLwES
/NL9oGjUCJeYdmyiEk6OqIbRNlWr8UGubrSckGW4zaXzSPvUo0CUwyUamjJUguWl
f700AkPMVpIYzOHU2i572YwcbLzVtS0bMnuetwptDdyXam277gYvC8QKKtlc4N4O
5m6UDXHQLX7pok0y7fjAYqYqR1/HzIzUaJhhiC6igwtZeBuHB3g=
=/nGu
-----END PGP SIGNATURE-----

--PrgtzcJ/h9nZ08SE--

