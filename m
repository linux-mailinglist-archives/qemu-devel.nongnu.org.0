Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F16502C50EB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 10:11:42 +0100 (CET)
Received: from localhost ([::1]:51148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiDJU-00083L-Lu
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 04:11:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kiDIR-0007WW-Jk; Thu, 26 Nov 2020 04:10:35 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:58595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kiDIP-0006Df-BD; Thu, 26 Nov 2020 04:10:35 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.124])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id C157E6F13FC6;
 Thu, 26 Nov 2020 10:10:29 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 26 Nov
 2020 10:10:28 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003e77dd008-3d6f-4e79-9abd-e95b84ab8f2f,
 3D9671329B6E73EAAA72C004E5562AE56C463AC8) smtp.auth=groug@kaod.org
Date: Thu, 26 Nov 2020 10:10:27 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH for-6.0 4/9] spapr: Set compat mode in spapr_reset_vcpu()
Message-ID: <20201126101027.03f67ad5@bahia.lan>
In-Reply-To: <20201126045737.GA152349@yekko.fritz.box>
References: <20201120234208.683521-1-groug@kaod.org>
 <20201120234208.683521-5-groug@kaod.org>
 <20201123051130.GL521467@yekko.fritz.box>
 <20201123125108.2118048e@bahia.lan>
 <20201125023947.GE521467@yekko.fritz.box>
 <20201125105105.05d25b1f@bahia.lan>
 <20201126045737.GA152349@yekko.fritz.box>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1ug4/R5OhNKZNz9TRWqMf=p";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: ac1b14c5-0be5-4d44-83bf-f8fd90cb4602
X-Ovh-Tracer-Id: 8143915505100495328
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudehvddgtdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtihesghdtreerredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheplefggfefueegudegkeevieevveejfffhuddvgeffteekieevueefgfeltdfgieetnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepihhmrghmmhgvughosehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--Sig_/1ug4/R5OhNKZNz9TRWqMf=p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Nov 2020 15:57:37 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Nov 25, 2020 at 10:51:05AM +0100, Greg Kurz wrote:
> > On Wed, 25 Nov 2020 13:39:47 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >=20
> > > On Mon, Nov 23, 2020 at 12:51:08PM +0100, Greg Kurz wrote:
> > > > On Mon, 23 Nov 2020 16:11:30 +1100
> > > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > > >=20
> > > > > On Sat, Nov 21, 2020 at 12:42:03AM +0100, Greg Kurz wrote:
> > > > > > When it comes to resetting the compat mode of the vCPUS, there =
are
> > > > > > two situations to consider:
> > > > > > (1) machine reset should set the compat mode back to the machin=
e default,
> > > > > >     ie. spapr->max_compat_pvr
> > > > > > (2) hot plugged vCPUs should set their compat mode to mach the =
boot vCPU,
> > > > > >     ie. POWERPC_CPU(first_cpu)->compat_pvr
> > > > > >=20
> > > > > > This is currently handled in two separate places: globally for =
all vCPUs
> > > > > > from the machine reset code for (1) and for each thread of a co=
re from
> > > > > > the hotplug path for (2).
> > > > > >=20
> > > > > > Since the machine reset code already resets all vCPUs, starting=
 with boot
> > > > > > vCPU, consolidate the logic in spapr_reset_vcpu(). Special case=
 the boot
> > > > > > vCPU so that it resets its compat mode back to the machine defa=
ult. Any
> > > > > > other vCPU just need to match the compat mode of the boot vCPU.
> > > > > >=20
> > > > > > Failing to set the compat mode during machine reset is a fatal =
error,
> > > > > > but not for hot plugged vCPUs. This is arguable because if we'v=
e been
> > > > > > able to set the boot vCPU compat mode at CAS or during machine =
reset,
> > > > > > it should definitely not fail for other vCPUs. Since spapr_rese=
t_vcpu()
> > > > > > already has a fatal error path for kvm_check_mmu() failures, do=
 the
> > > > > > same for ppc_set_compat().
> > > > > >=20
> > > > > > This gets rid of an error path in spapr_core_plug(). It will al=
low
> > > > > > further simplifications.
> > > > > >=20
> > > > > > Signed-off-by: Greg Kurz <groug@kaod.org>
> > > > > > ---
> > > > > >  hw/ppc/spapr.c          | 16 ----------------
> > > > > >  hw/ppc/spapr_cpu_core.c | 13 +++++++++++++
> > > > > >  2 files changed, 13 insertions(+), 16 deletions(-)
> > > > > >=20
> > > > > > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > > > > > index f58f77389e8e..da7586f548df 100644
> > > > > > --- a/hw/ppc/spapr.c
> > > > > > +++ b/hw/ppc/spapr.c
> > > > > > @@ -1606,8 +1606,6 @@ static void spapr_machine_reset(MachineSt=
ate *machine)
> > > > > >      spapr_ovec_cleanup(spapr->ov5_cas);
> > > > > >      spapr->ov5_cas =3D spapr_ovec_new();
> > > > > > =20
> > > > > > -    ppc_set_compat_all(spapr->max_compat_pvr, &error_fatal);
> > > > > > -
> > > > > >      /*
> > > > > >       * This is fixing some of the default configuration of the=
 XIVE
> > > > > >       * devices. To be called after the reset of the machine de=
vices.
> > > > > > @@ -3785,20 +3783,6 @@ static void spapr_core_plug(HotplugHandl=
er *hotplug_dev, DeviceState *dev,
> > > > > > =20
> > > > > >      core_slot->cpu =3D OBJECT(dev);
> > > > > > =20
> > > > > > -    /*
> > > > > > -     * Set compatibility mode to match the boot CPU, which was=
 either set
> > > > > > -     * by the machine reset code or by CAS.
> > > > > > -     */
> > > > > > -    if (hotplugged) {
> > > > > > -        for (i =3D 0; i < cc->nr_threads; i++) {
> > > > > > -            if (ppc_set_compat(core->threads[i],
> > > > > > -                               POWERPC_CPU(first_cpu)->compat_=
pvr,
> > > > > > -                               errp) < 0) {
> > > > > > -                return;
> > > > > > -            }
> > > > > > -        }
> > > > > > -    }
> > > > > > -
> > > > > >      if (smc->pre_2_10_has_unused_icps) {
> > > > > >          for (i =3D 0; i < cc->nr_threads; i++) {
> > > > > >              cs =3D CPU(core->threads[i]);
> > > > > > diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> > > > > > index 2f7dc3c23ded..17741a3fb77f 100644
> > > > > > --- a/hw/ppc/spapr_cpu_core.c
> > > > > > +++ b/hw/ppc/spapr_cpu_core.c
> > > > > > @@ -27,6 +27,7 @@
> > > > > > =20
> > > > > >  static void spapr_reset_vcpu(PowerPCCPU *cpu)
> > > > > >  {
> > > > > > +    PowerPCCPU *first_ppc_cpu =3D POWERPC_CPU(first_cpu);
> > > > > >      CPUState *cs =3D CPU(cpu);
> > > > > >      CPUPPCState *env =3D &cpu->env;
> > > > > >      PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> > > > > > @@ -69,6 +70,18 @@ static void spapr_reset_vcpu(PowerPCCPU *cpu)
> > > > > >      kvm_check_mmu(cpu, &error_fatal);
> > > > > > =20
> > > > > >      spapr_irq_cpu_intc_reset(spapr, cpu);
> > > > > > +
> > > > > > +    /*
> > > > > > +     * The boot CPU is only reset during machine reset : reset=
 its
> > > > > > +     * compatibility mode to the machine default. For other CP=
Us,
> > > > > > +     * either cold plugged or hot plugged, set the compatibili=
ty mode
> > > > > > +     * to match the boot CPU, which was either set by the mach=
ine reset
> > > > > > +     * code or by CAS.
> > > > > > +     */
> > > > > > +    ppc_set_compat(cpu,
> > > > > > +                   cpu =3D=3D first_ppc_cpu ?
> > > > > > +                   spapr->max_compat_pvr : first_ppc_cpu->comp=
at_pvr,
> > > > > > +                   &error_fatal);
> > > > >=20
> > > > > This assumes that when it is called for a non-boot CPU, it has al=
ready
> > > > > been called for the boot CPU..  Are we certain that's guaranteed =
by
> > > > > the sequence of reset calls during a full machine reset?
> > > > >=20
> > > >=20
> > > > This happens to be the case. Basically because the boot CPU core
> > > > is created (including registering its reset handler) first and
> > > > qemu_devices_reset() calls handlers in the same order they were
> > > > registered.
> > >=20
> > > Right, I assumed it works for now, but it seems rather fragile, since
> > > I'm not sure we're relying on guaranteed properties of the interface.
> >=20
> > The reset handler interface is absolutely undocumented, so I guess we
> > have no formal guarantees at the present time. But since the current
> > implementation has the property, would it be acceptable to carve it
> > in stone with added documentation ? In the event of unlikely changes
> > to the reset handler logic, people would _just_ need to make sure
> > handlers are called in the same order they were registered.
>=20
> Yeah, maybe.
>=20
> One other thing occurs to me: will we still do things in the right
> order if the (initial) boot cpu is hot unplugged, then replugged
> before a reset?
>=20

This can't happen AFAICT.

(qemu) qom-get /machine/unattached/device[1] core-id
0
(qemu) device_del /machine/unattached/device[1]
Error: Boot CPU core may not be unplugged

commit 62be8b044adf47327ebefdefb25f28a40316ebd0
Author: Bharata B Rao <bharata@linux.vnet.ibm.com>
Date:   Wed Jul 27 10:44:42 2016 +0530

    spapr: Prevent boot CPU core removal


So yes, this adds yet another road block on the way to support hot
unplug of the boot CPU. Is this a concern ?

If we go forward with this patch, maybe I should mention in the
changelog/documentation the various assumptions which this patch
is made under:
- reset handlers are called in the same order they were registered
- boot CPU registers its reset handler before other CPUs
- boot CPU cannot be hot unplugged

These guarantee that the boot core is always reset before other
cores during reset.

> > > Is there any way we could at least assert() if things are called out
> > > of order?
> > >=20
> >=20
> > Maybe. I'll look into it.
> >=20
> > > >=20
> > > > > >  }
> > > > > > =20
> > > > > >  void spapr_cpu_set_entry_state(PowerPCCPU *cpu, target_ulong n=
ip,
> > > > >=20
> > > >=20
> > >=20
> > >=20
> > >=20
> >=20
>=20
>=20
>=20


--Sig_/1ug4/R5OhNKZNz9TRWqMf=p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAl+/cQMACgkQcdTV5YIv
c9av1A/+L5eSyQ3C3D6Wi+HhPO0ybzQ6t/1d6uNzl4LYju6Y5bbUiiip2QN1vu6E
tT6JWwybiDdEyj+gGbETYhr0MEVAFLXuosQV9WyiOfB6PVpxNz2R8cgMRYvujaEV
TbwanSR9VrzZ/MRImBVX2BVwXfwC/JvxmpiQAsqZ5Y0oNwJbBa4+uUAPwY/yMxT0
WvMGI196tH7xQj3v3JyTm+vFzMryEoz6BspOd2jn8Zb+FhaZT0Wp+blwWoUHU3Jy
6uRiIH6KPAInlbyi1n5KrRWVjkusLaPI+a7JQslWe7eaiGx7tkbYSiK5y9eZtnmE
YBynLvtcGXdGpJup+VRRhtZ/rOKd4vSFwn8nFk1rRXWJNPtWxg5/Ab0mem300DIS
4Dx2EBeI5AJIwtCfyr3WOsDeU9MEro9CmadYN4iOXH4yGUeQZzp9dCpTNsKrjlYQ
B8bocP+sMefc6TUZoDh+gAprqD6Y03/+beibSLZYs7QR6PcWlPURcwbkKLOOk8Ug
qa1nbovupEmAPg38UIu9EJ/9MGIHpw5xg2vEJDRRAaK5OPpqdb9HEfHAnC1I3eeJ
DJzpNt0Qudl/00We+xpsf1c8Ub2u5HCpYaGV0GDKtLwZ8JS6WZKlvvc/INNjonp+
rtIFA/DoNBc1HB7mH6QiHhlZijK5axCWJkwyWa8ubFFv+V6fC4I=
=4eHD
-----END PGP SIGNATURE-----

--Sig_/1ug4/R5OhNKZNz9TRWqMf=p--

