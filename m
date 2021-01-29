Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6D93084ED
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 06:12:29 +0100 (CET)
Received: from localhost ([::1]:34298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5M55-0008Hh-TK
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 00:12:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5M1U-0004QW-2s; Fri, 29 Jan 2021 00:08:44 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:54845 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5M1P-0004Kx-Si; Fri, 29 Jan 2021 00:08:43 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DRljS0Wg7z9sWK; Fri, 29 Jan 2021 16:08:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611896908;
 bh=UpjBtnK3bIInQ+D9FHH4Ry5exZuZTlVEokrF10s4D8U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D/ppOCzCDGlh7rw23FWLPUHdlA9zt6mIGtvAwHoggTa1toHAvR3qlKvTk2jBcGlAd
 +EFaeODPyVYmP8U3FPP1nRXJkLa163v9i/YKLXLaD/NPuD5m1RSAkybrN0TFCqYggS
 M15P7133EvK5p+PWD5q7aBfMp14l+NoUX51YT0AI=
Date: Fri, 29 Jan 2021 13:36:31 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v7 09/13] confidential guest support: Update documentation
Message-ID: <20210129023631.GI6951@yekko.fritz.box>
References: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
 <20210113235811.1909610-10-david@gibson.dropbear.id.au>
 <20210115163646.2ecdc329.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ev7mvGV+3JQuI2Eo"
Content-Disposition: inline
In-Reply-To: <20210115163646.2ecdc329.cohuck@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 frankja@linux.ibm.com, pragyansri.pathi@intel.com, mst@redhat.com,
 mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 andi.kleen@intel.com, thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, dgilbert@redhat.com,
 Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org, jun.nakajima@intel.com,
 berrange@redhat.com, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ev7mvGV+3JQuI2Eo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 15, 2021 at 04:36:46PM +0100, Cornelia Huck wrote:
> On Thu, 14 Jan 2021 10:58:07 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > Now that we've implemented a generic machine option for configuring var=
ious
> > confidential guest support mechanisms:
> >   1. Update docs/amd-memory-encryption.txt to reference this rather than
> >      the earlier SEV specific option
> >   2. Add a docs/confidential-guest-support.txt to cover the generalitie=
s of
> >      the confidential guest support scheme
> >=20
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > ---
> >  docs/amd-memory-encryption.txt      |  2 +-
> >  docs/confidential-guest-support.txt | 43 +++++++++++++++++++++++++++++
> >  2 files changed, 44 insertions(+), 1 deletion(-)
> >  create mode 100644 docs/confidential-guest-support.txt
> >=20
> > diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryptio=
n.txt
> > index 80b8eb00e9..145896aec7 100644
> > --- a/docs/amd-memory-encryption.txt
> > +++ b/docs/amd-memory-encryption.txt
> > @@ -73,7 +73,7 @@ complete flow chart.
> >  To launch a SEV guest
> > =20
> >  # ${QEMU} \
> > -    -machine ...,memory-encryption=3Dsev0 \
> > +    -machine ...,confidential-guest-support=3Dsev0 \
> >      -object sev-guest,id=3Dsev0,cbitpos=3D47,reduced-phys-bits=3D1
> > =20
> >  Debugging
> > diff --git a/docs/confidential-guest-support.txt b/docs/confidential-gu=
est-support.txt
> > new file mode 100644
> > index 0000000000..2790425b38
> > --- /dev/null
> > +++ b/docs/confidential-guest-support.txt
>=20
> Maybe make this a proper .rst from the start and hook this up into the
> system guide? It is already almost there.

Hrm.  I considered it, but didn't really want to spend the time
integrating it into the overall structure of the system guide.  I kind
of want to get this dang thing wrapped up.

>=20
> > @@ -0,0 +1,43 @@
> > +Confidential Guest Support
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > +
> > +Traditionally, hypervisors such as qemu have complete access to a
>=20
> s/qemu/QEMU/ ?

Fixed.

>=20
> > +guest's memory and other state, meaning that a compromised hypervisor
> > +can compromise any of its guests.  A number of platforms have added
> > +mechanisms in hardware and/or firmware which give guests at least some
> > +protection from a compromised hypervisor.  This is obviously
> > +especially desirable for public cloud environments.
> > +
> > +These mechanisms have different names and different modes of
> > +operation, but are often referred to as Secure Guests or Confidential
> > +Guests.  We use the term "Confidential Guest Support" to distinguish
> > +this from other aspects of guest security (such as security against
> > +attacks from other guests, or from network sources).
> > +
> > +Running a Confidential Guest
> > +----------------------------
> > +
> > +To run a confidential guest you need to add two command line parameter=
s:
> > +
> > +1. Use "-object" to create a "confidential guest support" object.  The
> > +   type and parameters will vary with the specific mechanism to be
> > +   used
> > +2. Set the "confidential-guest-support" machine parameter to the ID of
> > +   the object from (1).
> > +
> > +Example (for AMD SEV)::
> > +
> > +    qemu-system-x86_64 \
> > +        <other parameters> \
> > +        -machine ...,confidential-guest-support=3Dsev0 \
> > +        -object sev-guest,id=3Dsev0,cbitpos=3D47,reduced-phys-bits=3D1
> > +
> > +Supported mechanisms
> > +--------------------
> > +
> > +Currently supported confidential guest mechanisms are:
> > +
> > +AMD Secure Encrypted Virtualization (SEV)
> > +    docs/amd-memory-encryption.txt
> > +
> > +Other mechanisms may be supported in future.
>=20
> LGTM.
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ev7mvGV+3JQuI2Eo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmATdK4ACgkQbDjKyiDZ
s5KHFg//Z0GS2Ob2qP60avL0Smk2/C0AfzV/os/f/mZJGxr5NF0aisVRimkbcgqN
kDhR+ZKHMQIFNLpXEFG+K2v4SzBwAVo8Sxja/U+kicZcKyb31zHbkqwE+OJnEcL6
h1YiousDZwfp6IiFt1goYTAIj66kbGDWyNTeZsM48ev6jVjPS3ZkuiwedVRMuCBi
BBHYAOs3gDfbvG65rJiYaPGAbVWUTSBlO/SxvZb4vr3+0GejB/JngEl96qJsuIbR
oPVO1HlGssucBNRylPHtb67jWZWppzKKvFojodPJbbM7SS5isvg8Pi/DkCuUZLmG
RZorg3znbS+ICS8nNH2UE1UlW2jSNr6BYQ1XCznupINPW75F8h0Cse6VsbCmmN/u
cSFU21m4Jcu28cGWX4fA8B+CpLiH2lbkU6ErKzOec/q1YR4gmlJaLk6XUp0tokzg
2Smzz8WGppqYpsCLrd9wCASP806EkYMlvMdpZ50j8oFQ/YjfRQYALANyxsFzJ06H
y8anrKu0A8DLQAGa9Xwyqvv7p1D2onp6wr3Qrex2WJynv52x7L2+aTZs7RBinIYA
0tzwRAaaZZpB07oGWY4KvGttxGCNZHLmSrlB7KccB5cgxw8XNMrbkEg2KHBlv619
c2lP+RT3boMbn+2+K+EDyRQncguhqNM83eLZ6pnp2s5Q6g4lPxk=
=s81I
-----END PGP SIGNATURE-----

--ev7mvGV+3JQuI2Eo--

