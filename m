Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53273084DB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 06:10:25 +0100 (CET)
Received: from localhost ([::1]:57380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5M36-00068X-RD
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 00:10:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5M1U-0004QV-2p; Fri, 29 Jan 2021 00:08:44 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52821 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5M1Q-0004KP-6o; Fri, 29 Jan 2021 00:08:43 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DRljR75Pcz9sVt; Fri, 29 Jan 2021 16:08:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611896908;
 bh=UDjzleS7IerwRLYQxowjtFQf2C+InGtAVCfu9yXgGSY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HDRrNn/yWWzapDRmuP+v/BSe8czeyVjiXuxr+S1ldfpBBvCfi1Ebrll2hLrK6MZCI
 7z6vArEGv6p1LkEpd/ZaTqfTpOjsBYQ4bth+j5oKNVCgb+PduMN8dIhyVVDMcVU8uj
 M9GRo+SdtoUl+bRjWPl9MQL7bnPjlYWh8zjv8fDQ=
Date: Fri, 29 Jan 2021 13:43:38 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v7 10/13] spapr: Add PEF based confidential guest support
Message-ID: <20210129024338.GJ6951@yekko.fritz.box>
References: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
 <20210113235811.1909610-11-david@gibson.dropbear.id.au>
 <20210115164151.087826c5.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZG+WKzXzVby2T9Ro"
Content-Disposition: inline
In-Reply-To: <20210115164151.087826c5.cohuck@redhat.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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


--ZG+WKzXzVby2T9Ro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 15, 2021 at 04:41:51PM +0100, Cornelia Huck wrote:
> On Thu, 14 Jan 2021 10:58:08 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > Some upcoming POWER machines have a system called PEF (Protected
> > Execution Facility) which uses a small ultravisor to allow guests to
> > run in a way that they can't be eavesdropped by the hypervisor.  The
> > effect is roughly similar to AMD SEV, although the mechanisms are
> > quite different.
> >=20
> > Most of the work of this is done between the guest, KVM and the
> > ultravisor, with little need for involvement by qemu.  However qemu
> > does need to tell KVM to allow secure VMs.
> >=20
> > Because the availability of secure mode is a guest visible difference
> > which depends on having the right hardware and firmware, we don't
> > enable this by default.  In order to run a secure guest you need to
> > create a "pef-guest" object and set the confidential-guest-support
> > property to point to it.
> >=20
> > Note that this just *allows* secure guests, the architecture of PEF is
> > such that the guest still needs to talk to the ultravisor to enter
> > secure mode.  Qemu has no directl way of knowing if the guest is in
> > secure mode, and certainly can't know until well after machine
> > creation time.
> >=20
> > To start a PEF-capable guest, use the command line options:
> >     -object pef-guest,id=3Dpef0 -machine confidential-guest-support=3Dp=
ef0
> >=20
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > ---
> >  docs/confidential-guest-support.txt |   3 +
> >  docs/papr-pef.txt                   |  30 +++++++
> >  hw/ppc/meson.build                  |   1 +
> >  hw/ppc/pef.c                        | 119 ++++++++++++++++++++++++++++
> >  hw/ppc/spapr.c                      |   6 ++
> >  include/hw/ppc/pef.h                |  25 ++++++
> >  target/ppc/kvm.c                    |  18 -----
> >  target/ppc/kvm_ppc.h                |   6 --
> >  8 files changed, 184 insertions(+), 24 deletions(-)
> >  create mode 100644 docs/papr-pef.txt
> >  create mode 100644 hw/ppc/pef.c
> >  create mode 100644 include/hw/ppc/pef.h
> >=20
> > diff --git a/docs/confidential-guest-support.txt b/docs/confidential-gu=
est-support.txt
> > index 2790425b38..f0801814ff 100644
> > --- a/docs/confidential-guest-support.txt
> > +++ b/docs/confidential-guest-support.txt
> > @@ -40,4 +40,7 @@ Currently supported confidential guest mechanisms are:
> >  AMD Secure Encrypted Virtualization (SEV)
> >      docs/amd-memory-encryption.txt
> > =20
> > +POWER Protected Execution Facility (PEF)
> > +    docs/papr-pef.txt
> > +
> >  Other mechanisms may be supported in future.
> > diff --git a/docs/papr-pef.txt b/docs/papr-pef.txt
> > new file mode 100644
> > index 0000000000..6419e995cf
> > --- /dev/null
> > +++ b/docs/papr-pef.txt
>=20
> Same here, make this .rst and add it to the system guide?

Again, I feel like I'm sufficiently bogged down in bikeshedding the
technical details to feel inclined to block it on a nice-to-have like
this.

> > @@ -0,0 +1,30 @@
> > +POWER (PAPR) Protected Execution Facility (PEF)
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Protected Execution Facility (PEF), also known as Secure Guest support
> > +is a feature found on IBM POWER9 and POWER10 processors.
> > +
> > +If a suitable firmware including an Ultravisor is installed, it adds
> > +an extra memory protection mode to the CPU.  The ultravisor manages a
> > +pool of secure memory which cannot be accessed by the hypervisor.
> > +
> > +When this feature is enabled in qemu, a guest can use ultracalls to
>=20
> s/qemu/QEMU/

Fixed.

> > +enter "secure mode".  This transfers most of its memory to secure
> > +memory, where it cannot be eavesdropped by a compromised hypervisor.
> > +
> > +Launching
> > +---------
> > +
> > +To launch a guest which will be permitted to enter PEF secure mode:
> > +
> > +# ${QEMU} \
> > +    -object pef-guest,id=3Dpef0 \
> > +    -machine confidential-guest-support=3Dpef0 \
> > +    ...
> > +
> > +Live Migration
> > +----------------
> > +
> > +Live migration is not yet implemented for PEF guests.  For
> > +consistency, we currently prevent migration if the PEF feature is
> > +enabled, whether or not the guest has actually entered secure mode.
> > diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
> > index ffa2ec37fa..218631c883 100644
> > --- a/hw/ppc/meson.build
> > +++ b/hw/ppc/meson.build
> > @@ -27,6 +27,7 @@ ppc_ss.add(when: 'CONFIG_PSERIES', if_true: files(
> >    'spapr_nvdimm.c',
> >    'spapr_rtas_ddw.c',
> >    'spapr_numa.c',
> > +  'pef.c',
> >  ))
> >  ppc_ss.add(when: 'CONFIG_SPAPR_RNG', if_true: files('spapr_rng.c'))
> >  ppc_ss.add(when: ['CONFIG_PSERIES', 'CONFIG_LINUX'], if_true: files(
> > diff --git a/hw/ppc/pef.c b/hw/ppc/pef.c
> > new file mode 100644
> > index 0000000000..02b9b3b460
> > --- /dev/null
> > +++ b/hw/ppc/pef.c
> > @@ -0,0 +1,119 @@
> > +/*
> > + * PEF (Protected Execution Facility) for POWER support
> > + *
> > + * Copyright David Gibson, Redhat Inc. 2020
>=20
> 2021?

So, it happens that in the meantime I've had different cause to look
up what Red Hat actually recommends as the copyright notice in open
source files, and it turns out they suggest simply "Copyright Red
Hat", with no names or dates.  So I'll switch to that for all the new
files in the series.

> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> > + * See the COPYING file in the top-level directory.
> > + *
> > + */
> > +
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ZG+WKzXzVby2T9Ro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmATdloACgkQbDjKyiDZ
s5K3UA/+PmKQ74ihONzrKJhvdBQqw1psdpZZl/c6dLsBPbW9mZAxiEoVYjUHCSV9
drq3fAdhtnKvlugOaqWhPg6U4UP9V5gqK9nwsRiKbNHcva/vsU+Hf2LXkmE+6Vdf
B0vik+7xoZPaG8RA/W3ckM6NLgAIFzB0Asx/0q1TpvXfZaNbaBSYTzNYDzYQvxeP
V+eOIOiTWAe40pK67RB77ZbF3p383LqlQQYK36NYyfjrxzsDTJjuQ9StpjMcVAQz
yFCaml5s1jI16VVgRtGBaP+oG60yuWkG9F8GWysgCPofAgQrICvqaxUktkk2/TsD
wFUVUTXaWN3ZlTjdVoooGhCU1NRQvcjPQSrsUnLqwENjVricpW3mt0skyWwBWM1p
HPq51xAYzUkoxTlNOXcPOdYS9QV+O/vz3H4rBr89+YX7DUeXQEIuHRJ0Rlc46Sk7
hsR17NnJ0qe7cmdh/RfcY2obrBiaFk1QRHqCf2ezNUdD6rXg96S/nsN04182BCVk
/aR2qPoaaSBIZ97Zx13wXMn4fkNkTdk0ymbMraeFyyVJ9aZaFA0W4KKNTXXRwWXr
0JdoaFqm1WGfkzY3lRK2YuVisvrTjWX98cgIdGvu2tGkqjZd1naVfejtMAMwv//J
5ffehwhMYebjh0/rbQVqxTRlnUSQeqh+TRoWx5v9E6TC+4DAnyU=
=mNf6
-----END PGP SIGNATURE-----

--ZG+WKzXzVby2T9Ro--

