Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3542562EA43
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 01:28:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovpDy-0000Px-0Y; Thu, 17 Nov 2022 19:27:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1ovpDv-0000Pl-Qs; Thu, 17 Nov 2022 19:27:15 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1ovpDs-00016u-8L; Thu, 17 Nov 2022 19:27:15 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4NCyJz3CMyz4xZg; Fri, 18 Nov 2022 11:26:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1668731219;
 bh=Mxzy6itV4VLihxx/aNi+shOKSTi2rb3xQfOMatJ0zZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BTDc8AydKuMxX2A+KTurGS6ldW3S0NCsD894R49u5sLia4AIxCqCgP4uAi10XBIta
 DwkbXvhBiPSMb/IqKWNUAYKaU9IKyy9q64d3/j+XFaWmYEZazjtzQKxyiQXZriLLP2
 UfmCA/gjlp3tJQ+WdCYHrpEv7rwCYW0TP0l35JcQ=
Date: Fri, 18 Nov 2022 10:59:47 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH for-8.0] MAINTAINERS: downgrade PPC KVM/TCG CPUs and
 pSeries to 'Odd Fixes'
Message-ID: <Y3bK8zd2QIf7W54v@yekko>
References: <20221117153218.182835-1-danielhb413@gmail.com>
 <20221117180633.4264cc1d@bahia>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FskqNVLQcFS9ZwSP"
Content-Disposition: inline
In-Reply-To: <20221117180633.4264cc1d@bahia>
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--FskqNVLQcFS9ZwSP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2022 at 06:06:33PM +0100, Greg Kurz wrote:
> On Thu, 17 Nov 2022 12:32:18 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
>=20
> > The maintainer is no longer being paid to maintain these components. All
> > maintainership work is being done in his personal time since the middle
> > of the 7.2 development cycle.
> >=20
>=20
> Great thanks Daniel for all your contributions over
> the years, and for being the one steering the vessel
> to the dry dock. This is it.

Seconded.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

>=20
> > Change the status of PPC KVM CPUs, PPC TCG CPUs and the pSeries machine
> > to 'Odd Fixes', reflecting that the maintainer no longer has exclusive
> > time to dedicate to them. It'll also (hopefully) keep expectations under
> > check when/if these components are used in a customer product.
> >=20
> > Cc: C=E9dric Le Goater <clg@kaod.org>
> > Cc: David Gibson <david@gibson.dropbear.id.au>
> > Cc: Greg Kurz <groug@kaod.org>
> > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > ---
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>
>=20
> >  MAINTAINERS | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index be151f0024..1d43153e5f 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -264,7 +264,7 @@ R: C=E9dric Le Goater <clg@kaod.org>
> >  R: David Gibson <david@gibson.dropbear.id.au>
> >  R: Greg Kurz <groug@kaod.org>
> >  L: qemu-ppc@nongnu.org
> > -S: Maintained
> > +S: Odd Fixes
> >  F: target/ppc/
> >  F: hw/ppc/ppc.c
> >  F: hw/ppc/ppc_booke.c
> > @@ -389,7 +389,7 @@ M: Daniel Henrique Barboza <danielhb413@gmail.com>
> >  R: C=E9dric Le Goater <clg@kaod.org>
> >  R: David Gibson <david@gibson.dropbear.id.au>
> >  R: Greg Kurz <groug@kaod.org>
> > -S: Maintained
> > +S: Odd Fixes
> >  F: target/ppc/kvm.c
> > =20
> >  S390 KVM CPUs
> > @@ -1367,7 +1367,7 @@ R: C=E9dric Le Goater <clg@kaod.org>
> >  R: David Gibson <david@gibson.dropbear.id.au>
> >  R: Greg Kurz <groug@kaod.org>
> >  L: qemu-ppc@nongnu.org
> > -S: Maintained
> > +S: Odd Fixes
> >  F: hw/*/spapr*
> >  F: include/hw/*/spapr*
> >  F: hw/*/xics*
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FskqNVLQcFS9ZwSP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmN2yu0ACgkQgypY4gEw
YSLQDQ/9HDDdU76QXV1EiyrXruWUtYr6seKeFWwF0gNoM09czUobQM5ucQqvl7W7
fVBC2GuS9e7xojZDuid4xECuFKcnZ/1Wrv4Y7kMqYV69j6idawNncI3+ytFQN3G4
OfXRA0pzRnsyNxek1W3M3DVqn+6PIQsr+d0C6IhOGV7alRc0CPENPOOnQeU31OQU
oXLexzTPBlZkibfmguYolC6j/vCUsqTI+KHxC1a50WMrDCiSgR59CMpULrtMFGGW
ry/lpGRPu1eiM6ibifag47d/9SjTY1KekwglLMoiVxHOHIpplb/ZIC6Fn738EEaL
ITOmZDOJl26dskLL9SvaOFWeqVYQfV6P8T0RqQKzabUPfixxEZmV0ZGf1TNwRIzL
Py1aPjhenvsaHxxM/FtRc5XLyozYVXr1XgKLV4GzaDL38HNJyFfj2GTZIFXaCgSF
gLQe7C+UVCOiLdfCwAeOlw3hPQIFKeB/4w4g9zmphoMWFYxFOAp4Dejl/LdxTc9d
bWp0NX4z6sE6daK+jq5gsQgFLGWPE8F8zBEgIs7onhgd80ySizaisiU+zN7sDRIj
AdAzbRaTtUuhsdSJvRCh+mhiJnOReqKg7XhQtMLeyATrKNbTxYckiw2DvDqMpejC
u2tcf+bveFT8QzetyzNNrty3wdKYeYs5785MZlOFQtDHnnUw1LM=
=sKzg
-----END PGP SIGNATURE-----

--FskqNVLQcFS9ZwSP--

