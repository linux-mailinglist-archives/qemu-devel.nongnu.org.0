Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7135946E07C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 02:52:42 +0100 (CET)
Received: from localhost ([::1]:34270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv8bx-0002Nl-Ds
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 20:52:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mv8XQ-0001SW-5u; Wed, 08 Dec 2021 20:48:00 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=39517
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mv8XL-0007PL-Ie; Wed, 08 Dec 2021 20:47:59 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J8cNz0nGrz4xhj; Thu,  9 Dec 2021 12:47:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1639014467;
 bh=CJtCtkkwvcPW9piJ6eQ/tJG4eyo+DaRn5GnlXnC6zuA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qewlbe64vDz4jvo8r4tLwahYE2Wb4UVeYLfX7gx+ExNbuFUkA/aNR7IUl5zjD+JuA
 RG6NpOqLCrjUrk+RMGvRx6yn/XhkHkPv49asu9lKPzeKSRjE/rYvkTPXJxxJNuiQS7
 5ih9i6JtkDB+xOQiOIvInu5rzyE2aYcmdqQV46YE=
Date: Thu, 9 Dec 2021 12:07:56 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 1/3] docs: rSTify ppc-spapr-hcalls.txt
Message-ID: <YbFW7JjNLvr5aVKI@yekko>
References: <cover.1638982480.git.lagarcia@br.ibm.com>
 <e20319dcf0ec37bedd915c740c3813eb0e58ead4.1638982486.git.lagarcia@br.ibm.com>
 <da9c1d2d-ce52-5114-eefc-cbf3eb7c475f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8qGrbHgU1RnflWF6"
Content-Disposition: inline
In-Reply-To: <da9c1d2d-ce52-5114-eefc-cbf3eb7c475f@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lagarcia@linux.ibm.com, groug@kaod.org, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, clg@kaod.org, Leonardo Garcia <lagarcia@br.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8qGrbHgU1RnflWF6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 08, 2021 at 03:54:40PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 12/8/21 13:59, lagarcia@linux.ibm.com wrote:
> > From: Leonardo Garcia <lagarcia@br.ibm.com>
> >=20
> > Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
> > ---
> >   docs/specs/ppc-spapr-hcalls.txt | 92 ++++++++++++++++++++-------------
> >   1 file changed, 57 insertions(+), 35 deletions(-)
> >=20
> > diff --git a/docs/specs/ppc-spapr-hcalls.txt b/docs/specs/ppc-spapr-hca=
lls.txt
> > index 93fe3da91b..c69dae535b 100644
> > --- a/docs/specs/ppc-spapr-hcalls.txt
> > +++ b/docs/specs/ppc-spapr-hcalls.txt
> > @@ -1,9 +1,15 @@
> > -When used with the "pseries" machine type, QEMU-system-ppc64 implements
> > -a set of hypervisor calls using a subset of the server "PAPR" specific=
ation
> > -(IBM internal at this point), which is also what IBM's proprietary hyp=
ervisor
> > -adheres too.
> > +sPAPR hypervisor calls
> > +----------------------
> > -The subset is selected based on the requirements of Linux as a guest.
> > +When used with the ``pseries`` machine type, ``qemu-system-ppc64`` imp=
lements
> > +a set of hypervisor calls (a.k.a. hcalls) defined in the `Linux on Pow=
er
> > +Architecture Reference document (LoPAR)
> > +<https://cdn.openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-=
20200812.pdf>`_.
> > +This document is a subset of the Power Architecture Platform Reference=
 (PAPR+)
> > +specification (IBM internal only), which is what PowerVM, the IBM prop=
rietary
> > +hypervisor, adheres to.
> > +
> > +The subset in LoPAR is selected based on the requirements of Linux as =
a guest.
> >   In addition to those calls, we have added our own private hypervisor
> >   calls which are mostly used as a private interface between the firmwa=
re
> > @@ -12,13 +18,14 @@ running in the guest and QEMU.
> >   All those hypercalls start at hcall number 0xf000 which correspond
> >   to an implementation specific range in PAPR.
> > -- H_RTAS (0xf000)
> > +H_RTAS (0xf000)
> > +^^^^^^^^^^^^^^^
> > -RTAS is a set of runtime services generally provided by the firmware
> > -inside the guest to the operating system. It predates the existence
> > -of hypervisors (it was originally an extension to Open Firmware) and
> > -is still used by PAPR to provide various services that aren't performa=
nce
> > -sensitive.
> > +RTAS stands for Run-Time Abstraction Sercies and is a set of runtime s=
ervices
> > +generally provided by the firmware inside the guest to the operating s=
ystem. It
> > +predates the existence of hypervisors (it was originally an extension =
to Open
> > +Firmware) and is still used by PAPR and LoPAR to provide various servi=
ces that
> > +are not performance sensitive.
> >   We currently implement the RTAS services in QEMU itself. The actual R=
TAS
> >   "firmware" blob in the guest is a small stub of a few instructions wh=
ich
> > @@ -26,22 +33,25 @@ calls our private H_RTAS hypervisor call to pass th=
e RTAS calls to QEMU.
> >   Arguments:
> > -  r3 : H_RTAS (0xf000)
> > -  r4 : Guest physical address of RTAS parameter block
> > +  ``r3``: ``H_RTAS (0xf000)``
> > +
> > +  ``r4``: Guest physical address of RTAS parameter block.
> >   Returns:
> > -  H_SUCCESS   : Successfully called the RTAS function (RTAS result
> > -                will have been stored in the parameter block)
> > -  H_PARAMETER : Unknown token
> > +  ``H_SUCCESS``: Successfully called the RTAS function (RTAS result wi=
ll have
> > +  been stored in the parameter block).
> > -- H_LOGICAL_MEMOP (0xf001)
> > +  ``H_PARAMETER``: Unknown token.
> > -When the guest runs in "real mode" (in powerpc lingua this means
> > -with MMU disabled, ie guest effective =3D=3D guest physical), it only
> > -has access to a subset of memory and no IOs.
> > +H_LOGICAL_MEMOP (0xf001)
> > +^^^^^^^^^^^^^^^^^^^^^^^^
> > -PAPR provides a set of hypervisor calls to perform cacheable or
> > +When the guest runs in "real mode" (in powerpc lingua this means with =
MMU
>=20
> What's up with 'lingua'? As you already know "lingua" is Brazilian portug=
uese for "tongue"
> and it's so weird to be used in this context.
>=20
> The one English word that I can think of that is closer to "lingua" and w=
ould make sense here
> is 'lingo'. But that is a slang for 'jargon' and not appropriate for a te=
chnical document
> either. "langua" as a short form of "language" seems weird as well. I rea=
lly believe 'jargon'
> is a more suitable word here.

As a native speaker: "lingo" would make sense here, though its tone is
a little informal.  "jargon" could also work, but "terminology" would
probably better match the tone of the document.

I expect this hasn't been noticed before, because I think most English
speakers would read "lingua" as a typo for "lingo", maybe only barely
registering that it was not the standard spelling.  ("lingo" is, of
course, cognate with lingua and similar words from romance langauges).

> This was added by c73e3771ea79ab and I really believe this is an unintend=
ed typo/mistake. If
> you're feeling generous feel free to send an extra patch (you can send an=
 independent patch,
> or another patch on top of this series, your call) changing this 'lingua'=
 instance to something
> more appropriate.
>=20
>=20
> Since this is not this patch fault:
>=20
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>=20
>=20
>=20
>=20
> > +disabled, i.e. guest effective address equals to guest physical addres=
s), it
> > +only has access to a subset of memory and no I/Os.
> > +
> > +PAPR and LoPAR provides a set of hypervisor calls to perform cacheable=
 or
> >   non-cacheable accesses to any guest physical addresses that the
> >   guest can use in order to access IO devices while in real mode.
> > @@ -58,21 +68,33 @@ is used by our SLOF firmware to invert the screen.
> >   Arguments:
> > -  r3: H_LOGICAL_MEMOP (0xf001)
> > -  r4: Guest physical address of destination
> > -  r5: Guest physical address of source
> > -  r6: Individual element size
> > -        0 =3D 1 byte
> > -        1 =3D 2 bytes
> > -        2 =3D 4 bytes
> > -        3 =3D 8 bytes
> > -  r7: Number of elements
> > -  r8: Operation
> > -        0 =3D copy
> > -        1 =3D xor
> > +  ``r3 ``: ``H_LOGICAL_MEMOP (0xf001)``
> > +
> > +  ``r4``: Guest physical address of destination.
> > +
> > +  ``r5``: Guest physical address of source.
> > +
> > +  ``r6``: Individual element size, defined by the binary logarithm of =
the
> > +  desired size. Supported values are:
> > +
> > +    ``0`` =3D 1 byte
> > +
> > +    ``1`` =3D 2 bytes
> > +
> > +    ``2`` =3D 4 bytes
> > +
> > +    ``3`` =3D 8 bytes
> > +
> > +  ``r7``: Number of elements.
> > +
> > +  ``r8``: Operation. Supported values are:
> > +
> > +    ``0``: copy
> > +
> > +    ``1``: xor
> >   Returns:
> > -  H_SUCCESS   : Success
> > -  H_PARAMETER : Invalid argument
> > +  ``H_SUCCESS``: Success.
> > +  ``H_PARAMETER``: Invalid argument.
> > \ No newline at end of file
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8qGrbHgU1RnflWF6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGxVukACgkQbDjKyiDZ
s5IT4RAAtEl0BNKD9rHud6bwPJUuhCdSAt9y9UjuI6O+PByAwKZQ1++W+DbJtYFl
C0A13l8LIFQTj7JSaq7xIOTJmyFHj2iQDwQV53UNGm71Y3TBwwcSwIHpb93kzb0I
Wt0/7KymW3Ns55q6IEdgtS21nlZyUzYSnHQocjMdoi5JlKqxvSR3eD/TnRXGC2K8
+KikQ5AHMq2UlQw8Q86bm7RZAnfqQfui5NSZHYsGBF+IUS1Y5+C3caJWT+B4A/Cl
sg+hqb/GnlC/l6RncqMT9qlvHjqeLElWKv+sQgMT10wXHQ3RvBB9c7A7vL1XAMBI
/MILF2QktP+HohHkUSFAGjRbzEwpx1t6tJ6lV4IRAZmUi0jF36/4gwAqhyz0iCBc
hnjNHZDrcELeXlHZOSntR3dDtYJ4B6B9HqxyKJ7ceSKdWGysrJSpql/cADtguCC0
zqHLMKu+B9XMCb6fAjhcVtGysqKJagVNFyvaadEqZbDEONSTFEVfAqWdEZxzs9zW
jCODpob/TbjDDr6QpxeylxfCTyNXaUk5hSHouCfdrpzT/aXcEnwD/5ZLipDVooWL
KlGu4k+/k5WDa5BR+gJzq093qA0g1qpNN/l2jRifgadf3VmbVm0gTrYsMPr3kNVh
sorme9iqdj+r7Pbotxjs9Pd8942bUGtrVrXHvPWDwE6l8fbhFLQ=
=fLUp
-----END PGP SIGNATURE-----

--8qGrbHgU1RnflWF6--

