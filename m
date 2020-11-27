Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A44A72C5FE2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 06:50:20 +0100 (CET)
Received: from localhost ([::1]:34738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiWeB-0000ud-7Z
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 00:50:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kiWd2-0008Va-AB; Fri, 27 Nov 2020 00:49:08 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33057 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kiWcz-0000HN-3v; Fri, 27 Nov 2020 00:49:08 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cj3b92K80z9sTc; Fri, 27 Nov 2020 16:48:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606456133;
 bh=V4cc69YaJch4+Gar3H/R7zP8Bt4puRbbZBsUJodz1n4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WC39H66Kui1dk1ynWKKOqiXnArV3jFK8NtWcVEP6643Vjjh6hMoCSx/yqrjin0jCs
 Ivl1RDRREbmbwOsYatjLLasLi3VPC5tM06o+UoN7zxoOEJB1LEehGsBBbzgryyivSR
 x+3Uo599JwcWpW2Vuz3qLAR42CzFSMyHQXt5kMdk=
Date: Fri, 27 Nov 2020 15:59:16 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 4/9] spapr: Set compat mode in spapr_reset_vcpu()
Message-ID: <20201127045916.GA172647@yekko.fritz.box>
References: <20201120234208.683521-1-groug@kaod.org>
 <20201120234208.683521-5-groug@kaod.org>
 <20201123051130.GL521467@yekko.fritz.box>
 <20201123125108.2118048e@bahia.lan>
 <20201125023947.GE521467@yekko.fritz.box>
 <20201125105105.05d25b1f@bahia.lan>
 <20201126045737.GA152349@yekko.fritz.box>
 <20201126101027.03f67ad5@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline
In-Reply-To: <20201126101027.03f67ad5@bahia.lan>
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2020 at 10:10:27AM +0100, Greg Kurz wrote:
> On Thu, 26 Nov 2020 15:57:37 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Wed, Nov 25, 2020 at 10:51:05AM +0100, Greg Kurz wrote:
> > > On Wed, 25 Nov 2020 13:39:47 +1100
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >=20
> > > > On Mon, Nov 23, 2020 at 12:51:08PM +0100, Greg Kurz wrote:
> > > > > On Mon, 23 Nov 2020 16:11:30 +1100
> > > > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > > > >=20
> > > > > > On Sat, Nov 21, 2020 at 12:42:03AM +0100, Greg Kurz wrote:
> > > > > > > When it comes to resetting the compat mode of the vCPUS, ther=
e are
> > > > > > > two situations to consider:
> > > > > > > (1) machine reset should set the compat mode back to the mach=
ine default,
> > > > > > >     ie. spapr->max_compat_pvr
> > > > > > > (2) hot plugged vCPUs should set their compat mode to mach th=
e boot vCPU,
> > > > > > >     ie. POWERPC_CPU(first_cpu)->compat_pvr
> > > > > > >=20
> > > > > > > This is currently handled in two separate places: globally fo=
r all vCPUs
> > > > > > > from the machine reset code for (1) and for each thread of a =
core from
> > > > > > > the hotplug path for (2).
> > > > > > >=20
> > > > > > > Since the machine reset code already resets all vCPUs, starti=
ng with boot
> > > > > > > vCPU, consolidate the logic in spapr_reset_vcpu(). Special ca=
se the boot
> > > > > > > vCPU so that it resets its compat mode back to the machine de=
fault. Any
> > > > > > > other vCPU just need to match the compat mode of the boot vCP=
U.
> > > > > > >=20
> > > > > > > Failing to set the compat mode during machine reset is a fata=
l error,
> > > > > > > but not for hot plugged vCPUs. This is arguable because if we=
've been
> > > > > > > able to set the boot vCPU compat mode at CAS or during machin=
e reset,
> > > > > > > it should definitely not fail for other vCPUs. Since spapr_re=
set_vcpu()
> > > > > > > already has a fatal error path for kvm_check_mmu() failures, =
do the
> > > > > > > same for ppc_set_compat().
> > > > > > >=20
> > > > > > > This gets rid of an error path in spapr_core_plug(). It will =
allow
> > > > > > > further simplifications.
> > > > > > >=20
> > > > > > > Signed-off-by: Greg Kurz <groug@kaod.org>
> > > > > > > ---
> > > > > > >  hw/ppc/spapr.c          | 16 ----------------
> > > > > > >  hw/ppc/spapr_cpu_core.c | 13 +++++++++++++
> > > > > > >  2 files changed, 13 insertions(+), 16 deletions(-)
> > > > > > >=20
> > > > > > > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > > > > > > index f58f77389e8e..da7586f548df 100644
> > > > > > > --- a/hw/ppc/spapr.c
> > > > > > > +++ b/hw/ppc/spapr.c
> > > > > > > @@ -1606,8 +1606,6 @@ static void spapr_machine_reset(Machine=
State *machine)
> > > > > > >      spapr_ovec_cleanup(spapr->ov5_cas);
> > > > > > >      spapr->ov5_cas =3D spapr_ovec_new();
> > > > > > > =20
> > > > > > > -    ppc_set_compat_all(spapr->max_compat_pvr, &error_fatal);
> > > > > > > -
> > > > > > >      /*
> > > > > > >       * This is fixing some of the default configuration of t=
he XIVE
> > > > > > >       * devices. To be called after the reset of the machine =
devices.
> > > > > > > @@ -3785,20 +3783,6 @@ static void spapr_core_plug(HotplugHan=
dler *hotplug_dev, DeviceState *dev,
> > > > > > > =20
> > > > > > >      core_slot->cpu =3D OBJECT(dev);
> > > > > > > =20
> > > > > > > -    /*
> > > > > > > -     * Set compatibility mode to match the boot CPU, which w=
as either set
> > > > > > > -     * by the machine reset code or by CAS.
> > > > > > > -     */
> > > > > > > -    if (hotplugged) {
> > > > > > > -        for (i =3D 0; i < cc->nr_threads; i++) {
> > > > > > > -            if (ppc_set_compat(core->threads[i],
> > > > > > > -                               POWERPC_CPU(first_cpu)->compa=
t_pvr,
> > > > > > > -                               errp) < 0) {
> > > > > > > -                return;
> > > > > > > -            }
> > > > > > > -        }
> > > > > > > -    }
> > > > > > > -
> > > > > > >      if (smc->pre_2_10_has_unused_icps) {
> > > > > > >          for (i =3D 0; i < cc->nr_threads; i++) {
> > > > > > >              cs =3D CPU(core->threads[i]);
> > > > > > > diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> > > > > > > index 2f7dc3c23ded..17741a3fb77f 100644
> > > > > > > --- a/hw/ppc/spapr_cpu_core.c
> > > > > > > +++ b/hw/ppc/spapr_cpu_core.c
> > > > > > > @@ -27,6 +27,7 @@
> > > > > > > =20
> > > > > > >  static void spapr_reset_vcpu(PowerPCCPU *cpu)
> > > > > > >  {
> > > > > > > +    PowerPCCPU *first_ppc_cpu =3D POWERPC_CPU(first_cpu);
> > > > > > >      CPUState *cs =3D CPU(cpu);
> > > > > > >      CPUPPCState *env =3D &cpu->env;
> > > > > > >      PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> > > > > > > @@ -69,6 +70,18 @@ static void spapr_reset_vcpu(PowerPCCPU *c=
pu)
> > > > > > >      kvm_check_mmu(cpu, &error_fatal);
> > > > > > > =20
> > > > > > >      spapr_irq_cpu_intc_reset(spapr, cpu);
> > > > > > > +
> > > > > > > +    /*
> > > > > > > +     * The boot CPU is only reset during machine reset : res=
et its
> > > > > > > +     * compatibility mode to the machine default. For other =
CPUs,
> > > > > > > +     * either cold plugged or hot plugged, set the compatibi=
lity mode
> > > > > > > +     * to match the boot CPU, which was either set by the ma=
chine reset
> > > > > > > +     * code or by CAS.
> > > > > > > +     */
> > > > > > > +    ppc_set_compat(cpu,
> > > > > > > +                   cpu =3D=3D first_ppc_cpu ?
> > > > > > > +                   spapr->max_compat_pvr : first_ppc_cpu->co=
mpat_pvr,
> > > > > > > +                   &error_fatal);
> > > > > >=20
> > > > > > This assumes that when it is called for a non-boot CPU, it has =
already
> > > > > > been called for the boot CPU..  Are we certain that's guarantee=
d by
> > > > > > the sequence of reset calls during a full machine reset?
> > > > > >=20
> > > > >=20
> > > > > This happens to be the case. Basically because the boot CPU core
> > > > > is created (including registering its reset handler) first and
> > > > > qemu_devices_reset() calls handlers in the same order they were
> > > > > registered.
> > > >=20
> > > > Right, I assumed it works for now, but it seems rather fragile, sin=
ce
> > > > I'm not sure we're relying on guaranteed properties of the interfac=
e.
> > >=20
> > > The reset handler interface is absolutely undocumented, so I guess we
> > > have no formal guarantees at the present time. But since the current
> > > implementation has the property, would it be acceptable to carve it
> > > in stone with added documentation ? In the event of unlikely changes
> > > to the reset handler logic, people would _just_ need to make sure
> > > handlers are called in the same order they were registered.
> >=20
> > Yeah, maybe.
> >=20
> > One other thing occurs to me: will we still do things in the right
> > order if the (initial) boot cpu is hot unplugged, then replugged
> > before a reset?
> >=20
>=20
> This can't happen AFAICT.
>=20
> (qemu) qom-get /machine/unattached/device[1] core-id
> 0
> (qemu) device_del /machine/unattached/device[1]
> Error: Boot CPU core may not be unplugged
>=20
> commit 62be8b044adf47327ebefdefb25f28a40316ebd0
> Author: Bharata B Rao <bharata@linux.vnet.ibm.com>
> Date:   Wed Jul 27 10:44:42 2016 +0530
>=20
>     spapr: Prevent boot CPU core removal

Oh yeah, I'd forgotten we did this.

>=20
> So yes, this adds yet another road block on the way to support hot
> unplug of the boot CPU. Is this a concern ?
>=20
> If we go forward with this patch, maybe I should mention in the
> changelog/documentation the various assumptions which this patch
> is made under:
> - reset handlers are called in the same order they were registered
> - boot CPU registers its reset handler before other CPUs
> - boot CPU cannot be hot unplugged
>=20
> These guarantee that the boot core is always reset before other
> cores during reset.
>=20
> > > > Is there any way we could at least assert() if things are called out
> > > > of order?
> > > >=20
> > >=20
> > > Maybe. I'll look into it.
> > >=20
> > > > >=20
> > > > > > >  }
> > > > > > > =20
> > > > > > >  void spapr_cpu_set_entry_state(PowerPCCPU *cpu, target_ulong=
 nip,
> > > > > >=20
> > > > >=20
> > > >=20
> > > >=20
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

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/Ah6IACgkQbDjKyiDZ
s5K0rg//YIJq520pNjNKilOIMH43KaE/HseOqR9uiqaS2NhOeCiSsI5TLgwzQFhU
/yTg0cTF5uJbEveoqtDpoLQzWyJGZvjwJisBItp2YqIrdOOjoV/g8My7y1t7cTVf
abGoEJwEUwog24WvP6BOyIhZCEHCjUuKMrLSH1i66twMRJSItIm+fYRPye25l/UU
TMcws3nUGZHHoKm0eoe33niUUnE4Xp+bodk9fcLi2eHg/WP2lmU7B3zqbpfppu/7
DZInbFb6MmM3CRbOXmVBHKsUxJIxaSJM7GiUT4l5LAm2eb9pCpwhynAGhAh1ApZx
V9MYh2zl7ZGVWszgDPuWWQJfT2Rn63lkwFsdqvmePevPd8eJoqg+zwLL7mJM9jMx
JECyd3tn8yNdKVvjz9877s2soLbXrCYzCluyr/NhaSGX5fYl7888JknJpfGzYTGv
3kY/JurUC5xdeoSsXOphZG1qMG7t+z7N6xYbk/MYXuui1XvGUS1Hl4ynYnJbrHEQ
wmn9ye5no4+s4nCijYSuw53S7Nsvc2bhI2dNMi+vupi4HoZBpjO7w7sj4hujdySc
0dtmeKD/f3qKADVyu8mVtPPXeMtJkCjofG/1oVa7uwl8rEWwHhzLBghLYNKWXemI
M+I9Zqo5ICC/JsT2TWmZtYT4eJ1I93UESM5GAnwtaVrofUJEVO8=
=OYD9
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--

