Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10261350CFA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 05:08:36 +0200 (CEST)
Received: from localhost ([::1]:44102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRnhD-0000er-51
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 23:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRnd1-0005ic-Ua; Wed, 31 Mar 2021 23:04:15 -0400
Received: from ozlabs.org ([203.11.71.1]:41381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRncq-00083R-8K; Wed, 31 Mar 2021 23:04:11 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F9p1C1Rnyz9sXG; Thu,  1 Apr 2021 14:03:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617246239;
 bh=suh4e+0H1WTSrprX4LDtSEOedIqgTJvxZH+FUfsxQ1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aHKjyR/AuFLJtqM0vfUJeP84QlKydz1y7w8mbHoASQVMh/zg/TZCewzStSDbePcRU
 15YQGy3/UHbifdHZ3+AsJlEuilzatCnq3/tGqH5rOjSAT02dcKqKUXKoowQ2y3YvSJ
 2+gdDQcsiWwZIqxOkdmsPwx2svCGEQAZhOUsrd/c=
Date: Thu, 1 Apr 2021 13:53:48 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 1/2] spapr: number of SMP sockets must be equal to NUMA
 nodes
Message-ID: <YGU1vKCC9ER538dz@yekko.fritz.box>
References: <YFk+fkK6KVN8ZiQK@yekko.fritz.box>
 <2025f26f-5883-4e86-02af-5b83a8d52465@gmail.com>
 <YFvxAW3l4t+YznEm@yekko.fritz.box>
 <d13d3c70-6f12-713e-6995-070292cb30c6@kaod.org>
 <YGFVc2lBhvzm5CSa@yekko.fritz.box>
 <9870aaba-9921-5c5d-113c-5be6cd098cf2@kaod.org>
 <91e406bf-c9c6-0734-1f69-081d3633332b@gmail.com>
 <YGPI5vgoI8JDO1HN@yekko.fritz.box>
 <87blazyl5w.fsf@mpe.ellerman.id.au>
 <041ea566-62cd-0017-fbaa-bb56bd97d381@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="veLyJj+FzBZrdtvL"
Content-Disposition: inline
In-Reply-To: <041ea566-62cd-0017-fbaa-bb56bd97d381@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--veLyJj+FzBZrdtvL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 05:22:39PM +0200, C=E9dric Le Goater wrote:
> On 3/31/21 6:58 AM, Michael Ellerman wrote:
> > David Gibson <david@gibson.dropbear.id.au> writes:
> >> On Mon, Mar 29, 2021 at 03:32:37PM -0300, Daniel Henrique Barboza wrot=
e:
> > ...
> >>
> >>> We assign ibm,chip-id=3D0x0 to CPUs 0-3, but CPUs 2-3 are located in a
> >>> different NUMA node than 0-1. This would mean that the same socket
> >>> would belong to different NUMA nodes at the same time.
> >>
> >> Right... and I'm still not seeing why that's a problem.  AFAICT that's
> >> a possible, if unexpected, situation under real hardware - though
> >> maybe not for POWER9 specifically.
> >=20
> > I think I agree.
> >=20
> >>> I believe this is what Cedric wants to be addressed. Given that the
> >>> property is called after the OPAL property ibm,chip-id, the kernel
> >>> expects that the property will have the same semantics as in OPAL.
> >>
> >> Even on powernv, I'm not clear why chip-id is tied into the NUMA
> >> configuration, rather than getting all the NUMA info from
> >> associativity properties.
> >=20
> > AFAIK we don't use chip-id for anything related to NUMA, if we do I'd
> > consider that a bug.
>=20
> Since PAPR only has NUMA nodes, is the use of chip-id in XIVE PAPR=20
> considered as a bug ? I would say so.

As noted in another thread, XIVE PAPR *doesn't* actually use chip_id.

And even on PowerNV, I don't think this has any real connection to
NUMA.  For PowerNV we care about whether we're working within a single
XIVE hardware instance, or across multiple.  There's one XIVE
per-chip, hence the relevance of chip-id.  That happens to also match
to NUMA topology on (currently existing) POWER9 chips, but I don't see
that it inherently has to.

> > We do use it for topology_physical_package_id(), but that's almost
> > completely unused.
>=20
> In that case, I think it should be fine to return -1 like under PowerVM.
>=20
> Thanks,
>=20
> C.=20
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--veLyJj+FzBZrdtvL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBlNbwACgkQbDjKyiDZ
s5K+FhAAxgbQ7AR1a8LpRwYfDYOp+wdnR14OIaLl9xwzXJxZsxlHOuMJ2eqNVagT
VpQnoYWIEFEXaNJuLw9dirQjX9TOjXNb4bg7a3E77n29c2xgweFTIZ0X572DMPpP
H1njmA7p+Lfddq1iahtoGNsgpRnoFBLmqnm4ykKn4e6tLJj9rvx8TdtwvJCC84pT
3+5T/sHGpbfSmTU1U6mMmEo8VnPK7cPwWSltv27h4pcYUhKgFt/OMSgoN5qluozN
cfiIlHBQ9k2JycUul/Osi2SS98MBD5uNNuZ6YWwtdQBQ8GJEGpi6oLkA7brD1dJO
KiVcIUO2R5p52r2sl30+RlrKWhd2l8frejL6N/U7L5llINEjCIfcD/rheGkDosWN
XJr055zo+Re8xa+UCPS/PNNdatHPTrcdb/D6LlXx8b8eicHUf1T51FO4Juo8Vugk
fR6enoevhJw0E9hX98uPkZwCWckc7/4VDdt6k0l1oBWtJmSs3UtDin3Q+zzh6zzS
o/bG40rdncyrP3K1DKlqfNgrByAF+iMDgaigfEDmY6vtlFnSQgtHeC8JbGg487Sy
57lIeOy0bcI8ay6/dnJkVTPeCU22IdGgd7MSbsU0DYph7/hwVuUzy4meBDADkeht
n3UhXyeLHPCjgc6vd1Ob5HsBv7/dZ6qGB7woFeY/n2J2wLW7lzk=
=adxM
-----END PGP SIGNATURE-----

--veLyJj+FzBZrdtvL--

