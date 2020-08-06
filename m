Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB6F23D6B8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 08:15:51 +0200 (CEST)
Received: from localhost ([::1]:56804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3ZBu-0005aJ-GG
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 02:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k3ZAv-00052Y-Pm; Thu, 06 Aug 2020 02:14:49 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:50661 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k3ZAs-0000sp-8M; Thu, 06 Aug 2020 02:14:49 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BMdW4287Fz9sTM; Thu,  6 Aug 2020 16:14:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1596694480;
 bh=E94wXZ2GlavC447zASL2IKC3b3NumERC58sX0/K4mZ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pPDsnCojqRzYzDke8RrPxvCY7sjGhqwIe3fqjbqo7m6td53TSr+KpXsutxC4HWqhb
 dPhixOHwAnpOWa8kB0wYDdjIgI5K5MPvxUHz0GMpFGKv7K3bOXq6b/MujvdmdSTQS7
 A+KZt/WzZlYhb+zGKJWcAFwUcRcwRgVhqLPptdr4=
Date: Thu, 6 Aug 2020 16:14:12 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [for-5.2 v4 10/10] s390: Recognize host-trust-limitation option
Message-ID: <20200806061412.GB157233@yekko.fritz.box>
References: <20200724025744.69644-1-david@gibson.dropbear.id.au>
 <20200724025744.69644-11-david@gibson.dropbear.id.au>
 <20200727175040.7beca3dd.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Content-Disposition: inline
In-Reply-To: <20200727175040.7beca3dd.cohuck@redhat.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, frankja@linux.ibm.com,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pasic@linux.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, pbonzini@redhat.com,
 Richard Henderson <rth@twiddle.net>, mdroth@linux.vnet.ibm.com,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2020 at 05:50:40PM +0200, Cornelia Huck wrote:
> On Fri, 24 Jul 2020 12:57:44 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > At least some s390 cpu models support "Protected Virtualization" (PV),
> > a mechanism to protect guests from eavesdropping by a compromised
> > hypervisor.
> >=20
> > This is similar in function to other mechanisms like AMD's SEV and
> > POWER's PEF, which are controlled bythe "host-trust-limitation"
> > machine option.  s390 is a slightly special case, because we already
> > supported PV, simply by using a CPU model with the required feature
> > (S390_FEAT_UNPACK).
> >=20
> > To integrate this with the option used by other platforms, we
> > implement the following compromise:
> >=20
> >  - When the host-trust-limitation option is set, s390 will recognize
> >    it, verify that the CPU can support PV (failing if not) and set
> >    virtio default options necessary for encrypted or protected guests,
> >    as on other platforms.  i.e. if host-trust-limitation is set, we
> >    will either create a guest capable of entering PV mode, or fail
> >    outright
> >=20
> >  - If host-trust-limitation is not set, guest's might still be able to
> >    enter PV mode, if the CPU has the right model.  This may be a
> >    little surprising, but shouldn't actually be harmful.
>=20
> This could be workable, I guess. Would like a second opinion, though.
>=20
> >=20
> > To start a guest supporting Protected Virtualization using the new
> > option use the command line arguments:
> >     -object s390-pv-guest,id=3Dpv0 -machine host-trust-limitation=3Dpv0
> >=20
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > ---
> >  hw/s390x/pv.c | 61 +++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >=20
> > diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
> > index ab3a2482aa..4bf3b345b6 100644
> > --- a/hw/s390x/pv.c
> > +++ b/hw/s390x/pv.c
> > @@ -14,8 +14,11 @@
> >  #include <linux/kvm.h>
> > =20
> >  #include "cpu.h"
> > +#include "qapi/error.h"
> >  #include "qemu/error-report.h"
> >  #include "sysemu/kvm.h"
> > +#include "qom/object_interfaces.h"
> > +#include "exec/host-trust-limitation.h"
> >  #include "hw/s390x/ipl.h"
> >  #include "hw/s390x/pv.h"
> > =20
> > @@ -111,3 +114,61 @@ void s390_pv_inject_reset_error(CPUState *cs)
> >      /* Report that we are unable to enter protected mode */
> >      env->regs[r1 + 1] =3D DIAG_308_RC_INVAL_FOR_PV;
> >  }
> > +
> > +#define TYPE_S390_PV_GUEST "s390-pv-guest"
> > +#define S390_PV_GUEST(obj)                              \
> > +    OBJECT_CHECK(S390PVGuestState, (obj), TYPE_S390_PV_GUEST)
> > +
> > +typedef struct S390PVGuestState S390PVGuestState;
> > +
> > +/**
> > + * S390PVGuestState:
> > + *
> > + * The S390PVGuestState object is basically a dummy used to tell the
> > + * host trust limitation system to use s390's PV mechanism.  guest.
> > + *
> > + * # $QEMU \
> > + *         -object s390-pv-guest,id=3Dpv0 \
> > + *         -machine ...,host-trust-limitation=3Dpv0
> > + */
> > +struct S390PVGuestState {
> > +    Object parent_obj;
> > +};
> > +
> > +static int s390_pv_kvm_init(HostTrustLimitation *gmpo, Error **errp)
> > +{
> > +    if (!s390_has_feat(S390_FEAT_UNPACK)) {
> > +        error_setg(errp,
> > +                   "CPU model does not support Protected Virtualizatio=
n");
> > +        return -1;
> > +    }
> > +
> > +    return 0;
> > +}
>=20
> So here's where I'm confused: If I follow the code correctly, the
> ->kvm_init callback is invoked before kvm_arch_init() is called. The
> kvm_arch_init() implementation for s390x checks whether
> KVM_CAP_S390_PROTECTED is available, which is a pre-req for
> S390_FEAT_UNPACK. Am I missing something? Can someone with access to PV
> hardware check whether this works as intended?

Ah, yes, I need to rethink this.  kvm_arch_init() happens
substantially earlier than I realized.  Plus the setup of s390 cpu
models is confusing to me, it seems to set up the model after the cpu
instance is created, rather than having cpu models correspond to cpu
classes and thus existing before the cpus are actually instantiated.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8rn7IACgkQbDjKyiDZ
s5IjZxAAk1TG+FWxo6+7eJ2SPBjkDNS+NfsIKnPsEQkZ3wTEc1YzXH/9Jb0M1CHX
FNBBF4U+WtDiPpsRonouzEcXpclXmRZ/bz/WfN+rWi/o18sahgqZJohx5xQpKEhM
hWfXUcw9izpX7syLU+ss0DviRV8ngPibpWhE4Bz34Fpcb2pHc4BeIoF40ylX0R/d
oLag20XQy5XknpfKN5Zo6AmTyGWBNGPzGmH6wNMu0q+RZ8wvmZA8O4CociE5x32P
v/UePLQxX84+FWKTGZLi04Dmv5sYipPBWIrBXdoARDwM6sOzo40WtkRAoPtka/CM
I6DgWNZGGCtAJirTP9lsJYkvCsWyTH+O6KkGSLu4Zof18/dgT2IP9cKwSHf4dQ0X
5cnmPOlHedudfmHIT2px9XTynnu/Gwt8xubZRWsYlC3FsYhdlgXW1SCeIeRXUI7+
LC9CfnuDqX787au66KtORWM7J15Q5/dE8RwvCoQ55M/7vriPIXkR8Wqb1t+rhU75
1Apo2YITmWORQW4VMvtnOO3reGNZv++04yxLGCWNZNrCIR9M1tFG9j8sYEwidElk
p6AAnWrc9oV/V66GFUp0yO+z8xLxdkbw+zWjSVXqGiat92GgKGRCTfNG8xB96Lu2
9xN8xl++gLa3s3e2mzzip2s5zyaA7V2y/NsSczpWFr+7H1EVvbM=
=+kII
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--

