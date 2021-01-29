Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD4930873D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:10:09 +0100 (CET)
Received: from localhost ([::1]:55674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Pn6-0001yY-7D
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:10:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5PkQ-00077O-1a; Fri, 29 Jan 2021 04:07:22 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:56425 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5PkM-00007m-NP; Fri, 29 Jan 2021 04:07:21 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DRs0w71Npz9sVt; Fri, 29 Jan 2021 20:07:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611911232;
 bh=RImluUDtm9/fn/ObthaPmB8fMgvsqhx2qYkTTVc3mwk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ASmG6e18uvP+WO2E/D6QVaDARjQC8rHw8WbOK1Kb1Phofn0t05ZSgjSbaqu1gHDyi
 LxQIvC+rgY6fH71uf5/h3bjG1wNW3wcyAdbcl1jyauIKTCZEEc3d2U/kCGgxtcjvJR
 Xp2ci8AwufebDURTlP6IJ3j4zLUhPNFyHn4QMmHg=
Date: Fri, 29 Jan 2021 17:30:45 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v7 07/13] confidential guest support: Introduce cgs
 "ready" flag
Message-ID: <20210129063045.GM6951@yekko.fritz.box>
References: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
 <20210113235811.1909610-8-david@gibson.dropbear.id.au>
 <20210118194730.GH9899@work-vm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EOHJn1TVIJfeVXv2"
Content-Disposition: inline
In-Reply-To: <20210118194730.GH9899@work-vm>
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


--EOHJn1TVIJfeVXv2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2021 at 07:47:30PM +0000, Dr. David Alan Gilbert wrote:
> * David Gibson (david@gibson.dropbear.id.au) wrote:
> > The platform specific details of mechanisms for implementing
> > confidential guest support may require setup at various points during
> > initialization.  Thus, it's not really feasible to have a single cgs
> > initialization hook, but instead each mechanism needs its own
> > initialization calls in arch or machine specific code.
> >=20
> > However, to make it harder to have a bug where a mechanism isn't
> > properly initialized under some circumstances, we want to have a
> > common place, relatively late in boot, where we verify that cgs has
> > been initialized if it was requested.
> >=20
> > This patch introduces a ready flag to the ConfidentialGuestSupport
> > base type to accomplish this, which we verify just before the machine
> > specific initialization function.
>=20
> You may find you need to define 'ready' and the answer might be a bit
> variable;

Ugh, yeah.  I'm not sure it will be possible to precisely define
this.  Basically this is a helper for an internal sanity check, rather
than anything more fundamental.  The idea is that depending on the
details of the CGS mechanism, it might need initialization of various
components, which might naturally be distributed across different
parts of the init code.

> for example, on SEV there's a setup bit and then you may end
> up doing an attestation and receiving some data before you actaully let
> the guest execute code.   Is it ready before it's received the
> attestation response or only when it can run code?

I don't really know enough about how SEV works to answer that.
Certainly it should be "ready" before any guest instructions are
executed.

> Is a Power or 390 machine 'ready' before it's executed the magic
> instruction to enter the confidential mode?

Definitely.  Ready must be set before we enter the guest (and so
assert that it *is* set is before that).

>=20
> Dave
>=20
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > ---
> >  hw/core/machine.c                         | 8 ++++++++
> >  include/exec/confidential-guest-support.h | 2 ++
> >  target/i386/sev.c                         | 2 ++
> >  3 files changed, 12 insertions(+)
> >=20
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index 94194ab82d..5a7433332b 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -1190,6 +1190,14 @@ void machine_run_board_init(MachineState *machin=
e)
> >      }
> > =20
> >      if (machine->cgs) {
> > +        /*
> > +         * Where confidential guest support is initialized depends on
> > +         * the specific mechanism in use.  But, we need to make sure
> > +         * it's ready by now.  If it isn't, that's a bug in the
> > +         * implementation of that cgs mechanism.
> > +         */
> > +        assert(machine->cgs->ready);
> > +
> >          /*
> >           * With confidential guests, the host can't see the real
> >           * contents of RAM, so there's no point in it trying to merge
> > diff --git a/include/exec/confidential-guest-support.h b/include/exec/c=
onfidential-guest-support.h
> > index 5f131023ba..bcaf6c9f49 100644
> > --- a/include/exec/confidential-guest-support.h
> > +++ b/include/exec/confidential-guest-support.h
> > @@ -27,6 +27,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(ConfidentialGuestSupport, =
CONFIDENTIAL_GUEST_SUPPORT)
> > =20
> >  struct ConfidentialGuestSupport {
> >      Object parent;
> > +
> > +    bool ready;
> >  };
> > =20
> >  typedef struct ConfidentialGuestSupportClass {
> > diff --git a/target/i386/sev.c b/target/i386/sev.c
> > index e2b41ef342..3d94635397 100644
> > --- a/target/i386/sev.c
> > +++ b/target/i386/sev.c
> > @@ -737,6 +737,8 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Err=
or **errp)
> >      qemu_add_machine_init_done_notifier(&sev_machine_done_notify);
> >      qemu_add_vm_change_state_handler(sev_vm_state_change, sev);
> > =20
> > +    cgs->ready =3D true;
> > +
> >      return 0;
> >  err:
> >      sev_guest =3D NULL;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EOHJn1TVIJfeVXv2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmATq5UACgkQbDjKyiDZ
s5Lt7g/8CrqHbV5yt5m2ew9hpBDIRlmAeTuxlGX/xk4RE0bk/dPEV+XsPEKSzsD9
BLKUhQYOeqVZmjKEl5mgDuoKE4R9H4TJoAG0m8mZaBd4iJoFh3B9JmQ3Oj+eDYuZ
183lORy7eOrs+r4eyQkcOUfbqf6i40ZILa2RyUPbCxgm946gEwFU+ofjZYDUenye
mwxF/84ZM0w7LQAKEBjfPSCzOY3TNs5NvV72ugwsmtzgjxThnnlz8Stxl7HdE3hW
wHT3CKWI7Sg3wf+zdDy6E4phw8/ckmk7UIIsPfbaavdQiBsdkcuLe99wrSGxOtG5
w80WGdmD6QKvjmyruNifXPKHq9xQV8A5V1qd9xAkP9wJLrivTaJR0WhZgqJNPPsF
mHiPawNTVSxPr/k8WQZcA+goZQepmz51W8BvmReLb9DK6BzPRDSlk+9NzH34IZ+/
xce/eMqKrW0lvhQ1u7pW3u/iyTNq7wJGeQNYbbZj/04LNQn/5REEeWwQIo0Hop6H
qzxJ38BQP7Bhlp4sAKHKZWINbrRokyXroGnP01qpEi7W/WE5ckJ9pagG618X//RV
60s7DyDpLXUtOASGXXbxKkEpCgIFk21cNRPmyAkT2jteMPpXbFkhare0UVxLqAMc
z0QiGqabVyNFl2ShG0JaCw3CIGxinPK6raDeqSktRfIbsl/cExc=
=LJDf
-----END PGP SIGNATURE-----

--EOHJn1TVIJfeVXv2--

