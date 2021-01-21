Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE722FDEBE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 02:24:48 +0100 (CET)
Received: from localhost ([::1]:42630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2OiN-00009X-Gd
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 20:24:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l2OfF-0007Zx-Ai; Wed, 20 Jan 2021 20:21:33 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:34835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l2OfB-0004Bn-VB; Wed, 20 Jan 2021 20:21:32 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DLl366JMHz9sWX; Thu, 21 Jan 2021 12:21:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611192082;
 bh=vCW/h9Js7xgLo8fl1XONbMPHFoEKd4u4Njdjh+h5cls=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kDA4OzfrVHp1us0H7wfIwv8oPvFUa0yTbwNVv3xwYTrcNtjCBVb9dR/YbBCWMxsux
 hoO/BhxIo2MrRGscsmdSbjoXB7EPBK+uPY6r6uy9/1oeVPzFNXdiBAjXwDoQa14/6U
 IuDTgZYW6Xa+TYaYfYGpzrUaTalP1M0GTez3iku4=
Date: Thu, 21 Jan 2021 12:06:43 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v7 02/13] confidential guest support: Introduce new
 confidential guest support class
Message-ID: <20210121010643.GG5174@yekko.fritz.box>
References: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
 <20210113235811.1909610-3-david@gibson.dropbear.id.au>
 <20210118185124.GG9899@work-vm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JkW1gnuWHDypiMFO"
Content-Disposition: inline
In-Reply-To: <20210118185124.GG9899@work-vm>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: pair@us.ibm.com, cohuck@redhat.com, brijesh.singh@amd.com,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, frankja@linux.ibm.com, pragyansri.pathi@intel.com,
 mst@redhat.com, mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, andi.kleen@intel.com, thuth@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, jun.nakajima@intel.com, berrange@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--JkW1gnuWHDypiMFO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2021 at 06:51:24PM +0000, Dr. David Alan Gilbert wrote:
> * David Gibson (david@gibson.dropbear.id.au) wrote:
> > Several architectures have mechanisms which are designed to protect gue=
st
> > memory from interference or eavesdropping by a compromised hypervisor. =
 AMD
> > SEV does this with in-chip memory encryption and Intel's MKTME can do
>                                                            ^^^^^
> (and below) My understanding is that it's Intel TDX that's the VM
> equivalent.

I thought MKTME could already do memory encryption and TDX extended
that to... more?  I'll adjust the comment to say TDX anyway, since
that seems to be the newer name.

>=20
> Dave
>=20
> > similar things.  POWER's Protected Execution Framework (PEF) accomplish=
es a
> > similar goal using an ultravisor and new memory protection features,
> > instead of encryption.
> >=20
> > To (partially) unify handling for these, this introduces a new
> > ConfidentialGuestSupport QOM base class.  "Confidential" is kind of vag=
ue,
> > but "confidential computing" seems to be the buzzword about these schem=
es,
> > and "secure" or "protected" are often used in connection to unrelated
> > things (such as hypervisor-from-guest or guest-from-guest security).
> >=20
> > The "support" in the name is significant because in at least some of the
> > cases it requires the guest to take specific actions in order to protect
> > itself from hypervisor eavesdropping.
> >=20
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > ---
> >  backends/confidential-guest-support.c     | 33 ++++++++++++++++++++
> >  backends/meson.build                      |  1 +
> >  include/exec/confidential-guest-support.h | 38 +++++++++++++++++++++++
> >  include/qemu/typedefs.h                   |  1 +
> >  target/i386/sev.c                         |  3 +-
> >  5 files changed, 75 insertions(+), 1 deletion(-)
> >  create mode 100644 backends/confidential-guest-support.c
> >  create mode 100644 include/exec/confidential-guest-support.h
> >=20
> > diff --git a/backends/confidential-guest-support.c b/backends/confident=
ial-guest-support.c
> > new file mode 100644
> > index 0000000000..9b0ded0db4
> > --- /dev/null
> > +++ b/backends/confidential-guest-support.c
> > @@ -0,0 +1,33 @@
> > +/*
> > + * QEMU Confidential Guest support
> > + *
> > + * Copyright: David Gibson, Red Hat Inc. 2020
> > + *
> > + * Authors:
> > + *  David Gibson <david@gibson.dropbear.id.au>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> > + * later.  See the COPYING file in the top-level directory.
> > + *
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +
> > +#include "exec/confidential-guest-support.h"
> > +
> > +OBJECT_DEFINE_ABSTRACT_TYPE(ConfidentialGuestSupport,
> > +                            confidential_guest_support,
> > +                            CONFIDENTIAL_GUEST_SUPPORT,
> > +                            OBJECT)
> > +
> > +static void confidential_guest_support_class_init(ObjectClass *oc, voi=
d *data)
> > +{
> > +}
> > +
> > +static void confidential_guest_support_init(Object *obj)
> > +{
> > +}
> > +
> > +static void confidential_guest_support_finalize(Object *obj)
> > +{
> > +}
> > diff --git a/backends/meson.build b/backends/meson.build
> > index 484456ece7..d4221831fc 100644
> > --- a/backends/meson.build
> > +++ b/backends/meson.build
> > @@ -6,6 +6,7 @@ softmmu_ss.add([files(
> >    'rng-builtin.c',
> >    'rng-egd.c',
> >    'rng.c',
> > +  'confidential-guest-support.c',
> >  ), numa])
> > =20
> >  softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files('rng-random.c'))
> > diff --git a/include/exec/confidential-guest-support.h b/include/exec/c=
onfidential-guest-support.h
> > new file mode 100644
> > index 0000000000..5f131023ba
> > --- /dev/null
> > +++ b/include/exec/confidential-guest-support.h
> > @@ -0,0 +1,38 @@
> > +/*
> > + * QEMU Confidential Guest support
> > + *   This interface describes the common pieces between various
> > + *   schemes for protecting guest memory or other state against a
> > + *   compromised hypervisor.  This includes memory encryption (AMD's
> > + *   SEV and Intel's MKTME) or special protection modes (PEF on POWER,
> > + *   or PV on s390x).
> > + *
> > + * Copyright: David Gibson, Red Hat Inc. 2020
> > + *
> > + * Authors:
> > + *  David Gibson <david@gibson.dropbear.id.au>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> > + * later.  See the COPYING file in the top-level directory.
> > + *
> > + */
> > +#ifndef QEMU_CONFIDENTIAL_GUEST_SUPPORT_H
> > +#define QEMU_CONFIDENTIAL_GUEST_SUPPORT_H
> > +
> > +#ifndef CONFIG_USER_ONLY
> > +
> > +#include "qom/object.h"
> > +
> > +#define TYPE_CONFIDENTIAL_GUEST_SUPPORT "confidential-guest-support"
> > +OBJECT_DECLARE_SIMPLE_TYPE(ConfidentialGuestSupport, CONFIDENTIAL_GUES=
T_SUPPORT)
> > +
> > +struct ConfidentialGuestSupport {
> > +    Object parent;
> > +};
> > +
> > +typedef struct ConfidentialGuestSupportClass {
> > +    ObjectClass parent;
> > +} ConfidentialGuestSupportClass;
> > +
> > +#endif /* !CONFIG_USER_ONLY */
> > +
> > +#endif /* QEMU_CONFIDENTIAL_GUEST_SUPPORT_H */
> > diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
> > index 976b529dfb..33685c79ed 100644
> > --- a/include/qemu/typedefs.h
> > +++ b/include/qemu/typedefs.h
> > @@ -36,6 +36,7 @@ typedef struct BusState BusState;
> >  typedef struct Chardev Chardev;
> >  typedef struct CompatProperty CompatProperty;
> >  typedef struct CoMutex CoMutex;
> > +typedef struct ConfidentialGuestSupport ConfidentialGuestSupport;
> >  typedef struct CPUAddressSpace CPUAddressSpace;
> >  typedef struct CPUState CPUState;
> >  typedef struct DeviceListener DeviceListener;
> > diff --git a/target/i386/sev.c b/target/i386/sev.c
> > index 1546606811..6b49925f51 100644
> > --- a/target/i386/sev.c
> > +++ b/target/i386/sev.c
> > @@ -31,6 +31,7 @@
> >  #include "qom/object.h"
> >  #include "exec/address-spaces.h"
> >  #include "monitor/monitor.h"
> > +#include "exec/confidential-guest-support.h"
> > =20
> >  #define TYPE_SEV_GUEST "sev-guest"
> >  OBJECT_DECLARE_SIMPLE_TYPE(SevGuestState, SEV_GUEST)
> > @@ -322,7 +323,7 @@ sev_guest_instance_init(Object *obj)
> > =20
> >  /* sev guest info */
> >  static const TypeInfo sev_guest_info =3D {
> > -    .parent =3D TYPE_OBJECT,
> > +    .parent =3D TYPE_CONFIDENTIAL_GUEST_SUPPORT,
> >      .name =3D TYPE_SEV_GUEST,
> >      .instance_size =3D sizeof(SevGuestState),
> >      .instance_finalize =3D sev_guest_finalize,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JkW1gnuWHDypiMFO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAI06EACgkQbDjKyiDZ
s5Lz0A//aAMRlbB+KxasmsRWe9lEiszg3aseOraJVo+8dDsLUUM0KGZDOQNBWose
8RFcHq6dKd6e0pbGoUbMf76mQ6SOoHsPzMweU8O2lH+wW/R/tLnDifd5BbcYtxkS
7Y8zSXukSAEIy5+G76Cisvv9k4x0AFdyk7u3AvZ76zVrspxPB37JccCfJOleSRWF
OI0XUMaPxS9933U7hgf9N8ISD3oMCtjzgc/b6JSaJ89OWEvEX4Vr3kOZAMeYCi/Z
jDU8AfxtQCl991Q0vPLd4numw7SjcHAMaQL8VjRRKmAavgKUt6s5UPXWENiF01Z1
VpXXLVxLzLjFSWyWBZiXOvUxyhzoAeyjTEtGm4sKT62Iw2MwSIPxTHwMqp8e0RGc
usGpnb4eIHHnqZUBPMRMqNhD8fxgzlEe7deCslFBiTBFoH6wGm+1hrL08Kbj/FXQ
zUhLDO5gvY50AQYu8kp0Bj1iFYntGg9X4s8vc56PGuoLNVBdcBnqW66nLNFDeUIv
cq53835XD13bdo+salP/2X5S4mwubcFzdbpxV0PXj0vxzxSSRsVuZ/LpXl1QvZxV
ejkqpoPR9EeutD6lNglqdMJ51WDTqT0PVmikvNE+CYyetphdsgDyboQnj3tBuKJs
O7qgTxU4CyfXJncEo1OxoD9qGmiVqIhPHtsFFid2Q9AdI7cRxvA=
=YpKR
-----END PGP SIGNATURE-----

--JkW1gnuWHDypiMFO--

