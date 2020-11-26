Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BEB2C4E1E
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 05:58:42 +0100 (CET)
Received: from localhost ([::1]:39230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki9Mf-0000YK-3a
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 23:58:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ki9Lq-0008Sm-RS; Wed, 25 Nov 2020 23:57:50 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55001 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ki9Ln-00052E-Qe; Wed, 25 Nov 2020 23:57:50 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4ChQVZ2skpz9sTv; Thu, 26 Nov 2020 15:57:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606366662;
 bh=tk36rd0jGohpWZHD5JoRtrPBWCm/ZTqXw+GcMVQg8qQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GYc32mI+mYWKIM8je+cSlzhvvrsA0ETtXYBHMKYzL9yUx7AtCAsT1kSxNL0Aa21dn
 njU8Wi+Vm6yNxLragRiA/EbEVhjRtS6nk93hJYobczArIcYu+OuBGRQQQk7/ci4WOF
 FoDu4KIcTDpcmJPOHJGDyn4qJD74QFi/8sInffbc=
Date: Thu, 26 Nov 2020 15:57:37 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 4/9] spapr: Set compat mode in spapr_reset_vcpu()
Message-ID: <20201126045737.GA152349@yekko.fritz.box>
References: <20201120234208.683521-1-groug@kaod.org>
 <20201120234208.683521-5-groug@kaod.org>
 <20201123051130.GL521467@yekko.fritz.box>
 <20201123125108.2118048e@bahia.lan>
 <20201125023947.GE521467@yekko.fritz.box>
 <20201125105105.05d25b1f@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
In-Reply-To: <20201125105105.05d25b1f@bahia.lan>
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2020 at 10:51:05AM +0100, Greg Kurz wrote:
> On Wed, 25 Nov 2020 13:39:47 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Nov 23, 2020 at 12:51:08PM +0100, Greg Kurz wrote:
> > > On Mon, 23 Nov 2020 16:11:30 +1100
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >=20
> > > > On Sat, Nov 21, 2020 at 12:42:03AM +0100, Greg Kurz wrote:
> > > > > When it comes to resetting the compat mode of the vCPUS, there are
> > > > > two situations to consider:
> > > > > (1) machine reset should set the compat mode back to the machine =
default,
> > > > >     ie. spapr->max_compat_pvr
> > > > > (2) hot plugged vCPUs should set their compat mode to mach the bo=
ot vCPU,
> > > > >     ie. POWERPC_CPU(first_cpu)->compat_pvr
> > > > >=20
> > > > > This is currently handled in two separate places: globally for al=
l vCPUs
> > > > > from the machine reset code for (1) and for each thread of a core=
 from
> > > > > the hotplug path for (2).
> > > > >=20
> > > > > Since the machine reset code already resets all vCPUs, starting w=
ith boot
> > > > > vCPU, consolidate the logic in spapr_reset_vcpu(). Special case t=
he boot
> > > > > vCPU so that it resets its compat mode back to the machine defaul=
t. Any
> > > > > other vCPU just need to match the compat mode of the boot vCPU.
> > > > >=20
> > > > > Failing to set the compat mode during machine reset is a fatal er=
ror,
> > > > > but not for hot plugged vCPUs. This is arguable because if we've =
been
> > > > > able to set the boot vCPU compat mode at CAS or during machine re=
set,
> > > > > it should definitely not fail for other vCPUs. Since spapr_reset_=
vcpu()
> > > > > already has a fatal error path for kvm_check_mmu() failures, do t=
he
> > > > > same for ppc_set_compat().
> > > > >=20
> > > > > This gets rid of an error path in spapr_core_plug(). It will allow
> > > > > further simplifications.
> > > > >=20
> > > > > Signed-off-by: Greg Kurz <groug@kaod.org>
> > > > > ---
> > > > >  hw/ppc/spapr.c          | 16 ----------------
> > > > >  hw/ppc/spapr_cpu_core.c | 13 +++++++++++++
> > > > >  2 files changed, 13 insertions(+), 16 deletions(-)
> > > > >=20
> > > > > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > > > > index f58f77389e8e..da7586f548df 100644
> > > > > --- a/hw/ppc/spapr.c
> > > > > +++ b/hw/ppc/spapr.c
> > > > > @@ -1606,8 +1606,6 @@ static void spapr_machine_reset(MachineStat=
e *machine)
> > > > >      spapr_ovec_cleanup(spapr->ov5_cas);
> > > > >      spapr->ov5_cas =3D spapr_ovec_new();
> > > > > =20
> > > > > -    ppc_set_compat_all(spapr->max_compat_pvr, &error_fatal);
> > > > > -
> > > > >      /*
> > > > >       * This is fixing some of the default configuration of the X=
IVE
> > > > >       * devices. To be called after the reset of the machine devi=
ces.
> > > > > @@ -3785,20 +3783,6 @@ static void spapr_core_plug(HotplugHandler=
 *hotplug_dev, DeviceState *dev,
> > > > > =20
> > > > >      core_slot->cpu =3D OBJECT(dev);
> > > > > =20
> > > > > -    /*
> > > > > -     * Set compatibility mode to match the boot CPU, which was e=
ither set
> > > > > -     * by the machine reset code or by CAS.
> > > > > -     */
> > > > > -    if (hotplugged) {
> > > > > -        for (i =3D 0; i < cc->nr_threads; i++) {
> > > > > -            if (ppc_set_compat(core->threads[i],
> > > > > -                               POWERPC_CPU(first_cpu)->compat_pv=
r,
> > > > > -                               errp) < 0) {
> > > > > -                return;
> > > > > -            }
> > > > > -        }
> > > > > -    }
> > > > > -
> > > > >      if (smc->pre_2_10_has_unused_icps) {
> > > > >          for (i =3D 0; i < cc->nr_threads; i++) {
> > > > >              cs =3D CPU(core->threads[i]);
> > > > > diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> > > > > index 2f7dc3c23ded..17741a3fb77f 100644
> > > > > --- a/hw/ppc/spapr_cpu_core.c
> > > > > +++ b/hw/ppc/spapr_cpu_core.c
> > > > > @@ -27,6 +27,7 @@
> > > > > =20
> > > > >  static void spapr_reset_vcpu(PowerPCCPU *cpu)
> > > > >  {
> > > > > +    PowerPCCPU *first_ppc_cpu =3D POWERPC_CPU(first_cpu);
> > > > >      CPUState *cs =3D CPU(cpu);
> > > > >      CPUPPCState *env =3D &cpu->env;
> > > > >      PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> > > > > @@ -69,6 +70,18 @@ static void spapr_reset_vcpu(PowerPCCPU *cpu)
> > > > >      kvm_check_mmu(cpu, &error_fatal);
> > > > > =20
> > > > >      spapr_irq_cpu_intc_reset(spapr, cpu);
> > > > > +
> > > > > +    /*
> > > > > +     * The boot CPU is only reset during machine reset : reset i=
ts
> > > > > +     * compatibility mode to the machine default. For other CPUs,
> > > > > +     * either cold plugged or hot plugged, set the compatibility=
 mode
> > > > > +     * to match the boot CPU, which was either set by the machin=
e reset
> > > > > +     * code or by CAS.
> > > > > +     */
> > > > > +    ppc_set_compat(cpu,
> > > > > +                   cpu =3D=3D first_ppc_cpu ?
> > > > > +                   spapr->max_compat_pvr : first_ppc_cpu->compat=
_pvr,
> > > > > +                   &error_fatal);
> > > >=20
> > > > This assumes that when it is called for a non-boot CPU, it has alre=
ady
> > > > been called for the boot CPU..  Are we certain that's guaranteed by
> > > > the sequence of reset calls during a full machine reset?
> > > >=20
> > >=20
> > > This happens to be the case. Basically because the boot CPU core
> > > is created (including registering its reset handler) first and
> > > qemu_devices_reset() calls handlers in the same order they were
> > > registered.
> >=20
> > Right, I assumed it works for now, but it seems rather fragile, since
> > I'm not sure we're relying on guaranteed properties of the interface.
>=20
> The reset handler interface is absolutely undocumented, so I guess we
> have no formal guarantees at the present time. But since the current
> implementation has the property, would it be acceptable to carve it
> in stone with added documentation ? In the event of unlikely changes
> to the reset handler logic, people would _just_ need to make sure
> handlers are called in the same order they were registered.

Yeah, maybe.

One other thing occurs to me: will we still do things in the right
order if the (initial) boot cpu is hot unplugged, then replugged
before a reset?

> > Is there any way we could at least assert() if things are called out
> > of order?
> >=20
>=20
> Maybe. I'll look into it.
>=20
> > >=20
> > > > >  }
> > > > > =20
> > > > >  void spapr_cpu_set_entry_state(PowerPCCPU *cpu, target_ulong nip,
> > > >=20
> > >=20
> >=20
> >=20
> >=20
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+/NcEACgkQbDjKyiDZ
s5Lu1A/+NUXA2OuvMSGKh7cnfGqT/m7a6+1867DlkDakukP11CL7R65Q6zYaXopS
gperjVGdVA7gZPpUSnk1401GCoKJbMSx2z7b/YpXxcsk26BxASbdNmj6R64xfnjp
AInYKZO/EoKHsTfewVPIUo6ss/TlZH/kgsRLo9bFc9/86ppt5hQKqatgr8NATGCW
NLE3o34WshmVF9T3lQi4uJOR4iwLdyTrPaRtkmLGKsaItnzUK9gbnDSIExO70H1D
p6L/b/bGf7cz/MgdXS9uM2lRPlC1hFVC15ba3O2xM9wm78uL38wY3DHj57sIa8h0
K3GkNbv83QM5d6jZ2ybYHVmYgydNO1o5Z97QkGtH9oUhmulrNfahA13n9psgqHdW
Mm29ouEPBQlp32y56wNaVrdjnY3mx4GXVMUIalm+vAspmRq8GIDDDYPuL8kilK46
edHPd1Zu8UlfNFLgnWtUeCPL5SGYir76V/snhfwwEJVibdz3EOlbPwDhYSQxBQiA
PC7Fk+NR3juHd+wtpaXXtSVf1ApmWYt9gi7g6TvyuCm1FoUkN0ZKdZkSINMlsYJ1
dYAGyBYpYPP7F+VfqgK2/YRkzfPHElBzVPtyUcdaA3bUoUeVPtVZIiWTnOd/boS9
6kFNu3LycQgpmWxfiNziAMHy8l8jsshZlzkbP9gOiuyOb6njm4Q=
=DvmH
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--

