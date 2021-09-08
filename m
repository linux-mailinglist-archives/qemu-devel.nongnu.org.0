Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 808A34032E6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 05:30:02 +0200 (CEST)
Received: from localhost ([::1]:33346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNoHg-0004In-Th
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 23:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNoAk-0000Tx-FV; Tue, 07 Sep 2021 23:22:51 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52661 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNoAf-0000uk-FF; Tue, 07 Sep 2021 23:22:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1631071359;
 bh=EN9yxB85BqourxkMDq6tvMO+rXadOB5IJEFHZwdP+yQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BdD0EpMYs61DYGLzqTqg37Yh9piQceyM5UndMkeNDYl77hLYv2hRHLT2D6DxI4aU0
 QvqP4Eznp0O2nI5W3pIGbI1niPJUdyFTTQ68Wy09QfrN74oPDtBzR1I7uPBkrcLhjT
 UxQNZyDsAlyKeAlFeHPiuvQLdHjrEuJ5XQF5g+ts=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H46rv4Q8Jz9t9b; Wed,  8 Sep 2021 13:22:39 +1000 (AEST)
Date: Wed, 8 Sep 2021 11:54:42 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v5 3/4] spapr_numa.c: base FORM2 NUMA affinity support
Message-ID: <YTgX4iSUHsjlJQwY@yekko>
References: <20210907002527.412013-1-danielhb413@gmail.com>
 <20210907002527.412013-4-danielhb413@gmail.com>
 <YTa6DUxTo2os9EIZ@yekko>
 <9ade69a3-bb89-a227-3966-243aedfff126@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Z1oW3n/u7hIxmGZS"
Content-Disposition: inline
In-Reply-To: <9ade69a3-bb89-a227-3966-243aedfff126@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Z1oW3n/u7hIxmGZS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 07, 2021 at 07:07:41AM -0300, Daniel Henrique Barboza wrote:
65;6402;1c>=20
>=20
> On 9/6/21 10:02 PM, David Gibson wrote:
> > On Mon, Sep 06, 2021 at 09:25:26PM -0300, Daniel Henrique Barboza wrote:
> > > The main feature of FORM2 affinity support is the separation of NUMA
> > > distances from ibm,associativity information. This allows for a more
> > > flexible and straightforward NUMA distance assignment without relying=
 on
> > > complex associations between several levels of NUMA via
> > > ibm,associativity matches. Another feature is its extensibility. This=
 base
> > > support contains the facilities for NUMA distance assignment, but in =
the
> > > future more facilities will be added for latency, performance, bandwi=
dth
> > > and so on.
> > >=20
> > > This patch implements the base FORM2 affinity support as follows:
> > >=20
> > > - the use of FORM2 associativity is indicated by using bit 2 of byte 5
> > > of ibm,architecture-vec-5. A FORM2 aware guest can choose to use FORM1
> > > or FORM2 affinity. Setting both forms will default to FORM2. We're not
> > > advertising FORM2 for pseries-6.1 and older machine versions to preve=
nt
> > > guest visible changes in those;
> > >=20
> > > - call spapr_numa_associativity_reset() in do_client_architecture_sup=
port()
> > > if FORM2 is chosen. This will avoid re-initializing FORM1 artifacts t=
hat
> > > were already initialized in spapr_machine_reset();
> > >=20
> > > - ibm,associativity-reference-points has a new semantic. Instead of
> > > being used to calculate distances via NUMA levels, it's now used to
> > > indicate the primary domain index in the ibm,associativity domain of
> > > each resource. In our case it's set to {0x4}, matching the position
> > > where we already place logical_domain_id;
> >=20
> > Hmm... I'm a bit torn on this.  The whole reason the ibm,associativity
> > things are arrays rather than just numbers was to enable the FORM1
> > nonsense. So we have a choice here: keep the associativity arrays in
> > the same form, for simplicity of the code, or reduce the associativity
> > arrays to one entry for FORM2, to simplify the overall DT contents in
> > the "modern" case.
>=20
> I'm not against making it different from FORM2. I did it this way because
> it minimizes the amount of code being changed.
>=20
> In fact, if we're going to add separated data structures for both FORM1 a=
nd
> FORM2, might as well start both FORM1 and FORM2 data structures during
> machine_init() and then just switch to the chosen affinity after CAS.
>=20
> Something like a FORM1_assoc_array[N][MAX_DISTANCE_REF_POINTS], that cont=
ains
> all the initialization already done today and a FORM2_assoc_array[N][2],
> where FORM2_assoc_array[node_id] =3D {1, node_id}, changing reference-poi=
nts
> accordingly of course.
>=20
> spapr_numa_assoc_array would become a pointer that would point to either
> FORM1_assoc_array[][] or FORM2_assoc_array[][] depending on guest choice.=
 I
> think this might be enough to make everything we already have just works,=
 although
> I need to check how much code is dependant on the MAX_DISTANCE_REF_POINTS
> macro and adapt it.
>=20
> If no one opposes I'll go for this approach.

I think that's the way to go.  Thanks for working on this.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Z1oW3n/u7hIxmGZS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmE4F+EACgkQbDjKyiDZ
s5L08w//Y7vQ4/hv9UDdddwr39NZ9LjGF2mW0MK3WlNLXgGBKj765I8oqtEdDyMC
XHDlRZAQqCp0IgJJRV6Rjz81qSss0sW0+OKpjRXfSi/dzygWOyg2gTca7WdZl58C
8qDXcOQOjS597Q0e6XQhHc0B4T4FWaeIbLEcFUNbSmYCWHVjwjIRkM/C1MiiG94W
qTYRKuqrATpaoVt4c1yai+hDatdKXhVm1bVnkWuJEMmNuaQEAju1IQfcs46Iwj7x
9Y0b3vKXNAMydsoJNTDMxp7BbGW5CSOXtYtrk1GzyX+RLrKgnDVojLInuw0lshRx
ScyJpMZFC8DDLKRcgdn/Z2sxwPagn+MB75+i1S/WYwy8i9v585hiIAqDYl1n36g+
jdWeLnRJDDB9WZv+lGDwXp6yRexaXYfIJcIFAMiItg7rF/khHMqhVLXXtMdOxhpL
d4nIRGuzvNGrxLI+fz11oMqHSPQye9dIilsauOLtAcoDusq/pdnWNu1xU4wmKPuA
OICE3huKY+ruKiqtL+kbw+23bgySp33sDIPOTYjXXo2U19EMRaN/tbtZrTzTzWMY
6o2McS02by0xmgYsLNxomaSS3CXokqMDTOcKA4Vnst+RQOVWOuj87QWpu5zToOC8
56uX/nndSfuMm4Zuj4jFfx8nDsPFUb7AREMRPcpELu3xDLL/sXo=
=fQDH
-----END PGP SIGNATURE-----

--Z1oW3n/u7hIxmGZS--

