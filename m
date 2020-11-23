Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9E02C052F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 13:06:17 +0100 (CET)
Received: from localhost ([::1]:57220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAbo-0008E5-P8
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 07:06:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1khANJ-0007r7-4B; Mon, 23 Nov 2020 06:51:18 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:57231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1khANG-0005kb-OO; Mon, 23 Nov 2020 06:51:16 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.186])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DCAEC6E29EBA;
 Mon, 23 Nov 2020 12:51:10 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 23 Nov
 2020 12:51:10 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00412d9caad-044a-426f-af58-e5245794512d,
 7563B3C8582C4E5C569F12427BEE2CF3FAD9DE82) smtp.auth=groug@kaod.org
Date: Mon, 23 Nov 2020 12:51:08 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH for-6.0 4/9] spapr: Set compat mode in spapr_reset_vcpu()
Message-ID: <20201123125108.2118048e@bahia.lan>
In-Reply-To: <20201123051130.GL521467@yekko.fritz.box>
References: <20201120234208.683521-1-groug@kaod.org>
 <20201120234208.683521-5-groug@kaod.org>
 <20201123051130.GL521467@yekko.fritz.box>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UduOronwxZ4iWwneROJPr2z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 81b00384-bf5b-405f-8541-64852ac2091a
X-Ovh-Tracer-Id: 11686278086789077472
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegiedgfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtihesghdtreerredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheplefggfefueegudegkeevieevveejfffhuddvgeffteekieevueefgfeltdfgieetnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehimhgrmhhmvgguohesrhgvughhrghtrdgtohhm
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

--Sig_/UduOronwxZ4iWwneROJPr2z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Nov 2020 16:11:30 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Sat, Nov 21, 2020 at 12:42:03AM +0100, Greg Kurz wrote:
> > When it comes to resetting the compat mode of the vCPUS, there are
> > two situations to consider:
> > (1) machine reset should set the compat mode back to the machine defaul=
t,
> >     ie. spapr->max_compat_pvr
> > (2) hot plugged vCPUs should set their compat mode to mach the boot vCP=
U,
> >     ie. POWERPC_CPU(first_cpu)->compat_pvr
> >=20
> > This is currently handled in two separate places: globally for all vCPUs
> > from the machine reset code for (1) and for each thread of a core from
> > the hotplug path for (2).
> >=20
> > Since the machine reset code already resets all vCPUs, starting with bo=
ot
> > vCPU, consolidate the logic in spapr_reset_vcpu(). Special case the boot
> > vCPU so that it resets its compat mode back to the machine default. Any
> > other vCPU just need to match the compat mode of the boot vCPU.
> >=20
> > Failing to set the compat mode during machine reset is a fatal error,
> > but not for hot plugged vCPUs. This is arguable because if we've been
> > able to set the boot vCPU compat mode at CAS or during machine reset,
> > it should definitely not fail for other vCPUs. Since spapr_reset_vcpu()
> > already has a fatal error path for kvm_check_mmu() failures, do the
> > same for ppc_set_compat().
> >=20
> > This gets rid of an error path in spapr_core_plug(). It will allow
> > further simplifications.
> >=20
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  hw/ppc/spapr.c          | 16 ----------------
> >  hw/ppc/spapr_cpu_core.c | 13 +++++++++++++
> >  2 files changed, 13 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index f58f77389e8e..da7586f548df 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -1606,8 +1606,6 @@ static void spapr_machine_reset(MachineState *mac=
hine)
> >      spapr_ovec_cleanup(spapr->ov5_cas);
> >      spapr->ov5_cas =3D spapr_ovec_new();
> > =20
> > -    ppc_set_compat_all(spapr->max_compat_pvr, &error_fatal);
> > -
> >      /*
> >       * This is fixing some of the default configuration of the XIVE
> >       * devices. To be called after the reset of the machine devices.
> > @@ -3785,20 +3783,6 @@ static void spapr_core_plug(HotplugHandler *hotp=
lug_dev, DeviceState *dev,
> > =20
> >      core_slot->cpu =3D OBJECT(dev);
> > =20
> > -    /*
> > -     * Set compatibility mode to match the boot CPU, which was either =
set
> > -     * by the machine reset code or by CAS.
> > -     */
> > -    if (hotplugged) {
> > -        for (i =3D 0; i < cc->nr_threads; i++) {
> > -            if (ppc_set_compat(core->threads[i],
> > -                               POWERPC_CPU(first_cpu)->compat_pvr,
> > -                               errp) < 0) {
> > -                return;
> > -            }
> > -        }
> > -    }
> > -
> >      if (smc->pre_2_10_has_unused_icps) {
> >          for (i =3D 0; i < cc->nr_threads; i++) {
> >              cs =3D CPU(core->threads[i]);
> > diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> > index 2f7dc3c23ded..17741a3fb77f 100644
> > --- a/hw/ppc/spapr_cpu_core.c
> > +++ b/hw/ppc/spapr_cpu_core.c
> > @@ -27,6 +27,7 @@
> > =20
> >  static void spapr_reset_vcpu(PowerPCCPU *cpu)
> >  {
> > +    PowerPCCPU *first_ppc_cpu =3D POWERPC_CPU(first_cpu);
> >      CPUState *cs =3D CPU(cpu);
> >      CPUPPCState *env =3D &cpu->env;
> >      PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> > @@ -69,6 +70,18 @@ static void spapr_reset_vcpu(PowerPCCPU *cpu)
> >      kvm_check_mmu(cpu, &error_fatal);
> > =20
> >      spapr_irq_cpu_intc_reset(spapr, cpu);
> > +
> > +    /*
> > +     * The boot CPU is only reset during machine reset : reset its
> > +     * compatibility mode to the machine default. For other CPUs,
> > +     * either cold plugged or hot plugged, set the compatibility mode
> > +     * to match the boot CPU, which was either set by the machine reset
> > +     * code or by CAS.
> > +     */
> > +    ppc_set_compat(cpu,
> > +                   cpu =3D=3D first_ppc_cpu ?
> > +                   spapr->max_compat_pvr : first_ppc_cpu->compat_pvr,
> > +                   &error_fatal);
>=20
> This assumes that when it is called for a non-boot CPU, it has already
> been called for the boot CPU..  Are we certain that's guaranteed by
> the sequence of reset calls during a full machine reset?
>=20

This happens to be the case. Basically because the boot CPU core
is created (including registering its reset handler) first and
qemu_devices_reset() calls handlers in the same order they were
registered.

> >  }
> > =20
> >  void spapr_cpu_set_entry_state(PowerPCCPU *cpu, target_ulong nip,
>=20


--Sig_/UduOronwxZ4iWwneROJPr2z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAl+7oiwACgkQcdTV5YIv
c9bN8Q/+PzblaZ0bYAc3apRmzWPgYSOMQeUAlHXnPxiOW3q+rStjTAKxF+ehbnZz
HaGG3+51eEfDbKyToFF3tbJfCUrS81E3TloqCbLPKih/IWn7m1Xgm/YD/QPEveTr
CP6XmcF/Jbj2T/QQxGxAOtHwUxtjrBsXYFFf9fsD31yaLk38LDTvYuaOKQgeCP4Q
UEVFihmf6mQ/hS1+rDxhv8dCL9aAbNc6JUf7clXb93ZLcglO/ypF6+y7ZwtKEFXX
4imYmTR8b0SkHuqbGuxH8geLuniXtU8lCRrwbhiBVdgSzcZSGpQX4P/MbXrsDTNe
WnynZFD9TiOHdVJTL3PnAcXRgcFdQEfmBtfii4KrfFy45sJlpN7y1QbcNNo8UB3d
0/T950T3RIXXY3tkIxEBseARSAEYRyPmDJVWSkF67oTMT4cSwwcX7Q9OKvVk/m2z
++TsBdZr98Vf+QNq/7dTMJA6yOJLg7cwuZavHGU8fs0FUcyNeXg0J41bXrzvNl1e
6r5qhX5GJSTudwcJG2YEB42xfnIRBlk9hOznvhDd02CGhPZKlADf1gJd4wUbeJoR
qaC3ilheHad1JjmfUpRwLodcpD61WQP+9MG7aF4RjoF/GFzUa6AVxJqVYMqQ9aLh
TSy/zPQrph8tWAYkGCDGDBigUseqs79U3SeNkJVAMTJvkF8yHq0=
=ieWr
-----END PGP SIGNATURE-----

--Sig_/UduOronwxZ4iWwneROJPr2z--

