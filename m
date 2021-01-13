Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4C92F40F7
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 02:06:58 +0100 (CET)
Received: from localhost ([::1]:59004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzUcj-00073R-59
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 20:06:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzUXC-0003Du-SK; Tue, 12 Jan 2021 20:01:14 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:56827 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzUX9-00085x-O4; Tue, 12 Jan 2021 20:01:14 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DFpz53FMHz9sVr; Wed, 13 Jan 2021 12:00:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610499649;
 bh=wkBYY9xj6Bfrq3fJ0mt//edwkHa6ngCQWYkWyJl5XII=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gtrf8rVO2ElF3N8dB2VzaklFBgj0rLV5fHE1H9KVPIFy5Vm/oN8+tZM6/lVOm1oee
 Y7c9KIF+BxVkl3s/JZmykU2Gkji7hg3+Gtpd5mAarDPl8QPGzRJGkytnIh0OkdiCFa
 CRaZLRkAUNLPNZRM7qbVcKYqyCmFDsWtvnLROR/k=
Date: Wed, 13 Jan 2021 11:52:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v6 10/13] spapr: Add PEF based confidential guest support
Message-ID: <20210113005236.GB435587@yekko.fritz.box>
References: <20210112044508.427338-1-david@gibson.dropbear.id.au>
 <20210112044508.427338-11-david@gibson.dropbear.id.au>
 <20210112095612.GE1360503@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline
In-Reply-To: <20210112095612.GE1360503@redhat.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: pair@us.ibm.com, Marcelo Tosatti <mtosatti@redhat.com>,
 brijesh.singh@amd.com, kvm@vger.kernel.org, david@redhat.com,
 qemu-devel@nongnu.org, frankja@linux.ibm.com, pragyansri.pathi@intel.com,
 mst@redhat.com, mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, andi.kleen@intel.com,
 thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 richard.henderson@linaro.org, dgilbert@redhat.com, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, jun.nakajima@intel.com,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 09:56:12AM +0000, Daniel P. Berrang=E9 wrote:
> On Tue, Jan 12, 2021 at 03:45:05PM +1100, David Gibson wrote:
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
> >  docs/confidential-guest-support.txt |   2 +
> >  docs/papr-pef.txt                   |  30 ++++++++
> >  hw/ppc/meson.build                  |   1 +
> >  hw/ppc/pef.c                        | 115 ++++++++++++++++++++++++++++
> >  hw/ppc/spapr.c                      |  10 +++
> >  include/hw/ppc/pef.h                |  26 +++++++
> >  target/ppc/kvm.c                    |  18 -----
> >  target/ppc/kvm_ppc.h                |   6 --
> >  8 files changed, 184 insertions(+), 24 deletions(-)
> >  create mode 100644 docs/papr-pef.txt
> >  create mode 100644 hw/ppc/pef.c
> >  create mode 100644 include/hw/ppc/pef.h
> >=20
>=20
> > +static const TypeInfo pef_guest_info =3D {
> > +    .parent =3D TYPE_OBJECT,
> > +    .name =3D TYPE_PEF_GUEST,
> > +    .instance_size =3D sizeof(PefGuestState),
> > +    .interfaces =3D (InterfaceInfo[]) {
> > +        { TYPE_CONFIDENTIAL_GUEST_SUPPORT },
> > +        { TYPE_USER_CREATABLE },
> > +        { }
> > +    }
> > +};
>=20
> IIUC, the earlier patch defines TYPE_CONFIDENTIAL_GUEST_SUPPORT
> as a object, but you're using it as an interface here. The later
> s390 patch uses it as a parent, which makes more sense given it
> is a declared as an object.

Oops, that's a holdover from an earlier version that used an
interface.  Fixed.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/+RFMACgkQbDjKyiDZ
s5LvuxAAyRTJWPRlsPZk3Z6TVqLINqqoS5zKxrOn/BMIT2+NrEmgtvGCUOKYJyPY
nZsQU+TADx1pUsw/TLJZb4k54gCwh7/M4R0Tm6NQQSibmHGT+kbD+DUsj54R8T3v
w43iiuD8tra5hRAlj7Z6sySENUEeZ9+op30SpSiNL74TNsB/w/yh2jOlAYOxtf1x
c6rcFtFLhaI2iRJZfIRmRKDfSkUue5a0gUYgVbp2/MG5bWPqp6bLHmxO7o6JPhJ4
CsWoKT/YBXgCw6SZRmrhrSC4+S3aEPtbOKGuiaXn1yP3XGYZ1Cw3iysRDt5U6mst
vwX2DDrPtxcAaQjl7qBrNsJz71Tm1lXHigqq3J0cWt//K1qEy1DGXBK9BZTvfLWT
NOffzPverudTufv0qj2PP5LTyjFKeg8MIEXMaKl66yZk2b+cDCaykF4vZl4vNcYF
nDZSNxisXImkUZPc1SDzzjmKc+jBuqFeSjf/5l11w9Gq73ZZ42onBxTJL6kGYT8c
B7NPyBWF0Agjf3QI6PYqmKrtB6nAKlb8giU+gmPYmd+YyhjUgWI82TTUL9ckM0Rk
k3QpXLFSStOJwbOzn5qCwK0FbbsC4T64aeuC13XlnTH8pqvnfVPRCoOG5Y3/zkc0
La3DA49Gponwrx7n0gYQIkxNPn3kbVyb9Npr5X6y7eZMQj8qcs8=
=I5Rq
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--

