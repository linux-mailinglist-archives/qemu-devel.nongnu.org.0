Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F8F2F9810
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 04:09:54 +0100 (CET)
Received: from localhost ([::1]:48720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1KvR-0001xD-C4
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 22:09:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1Kuh-0001Qz-8a; Sun, 17 Jan 2021 22:09:07 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:33991 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1Kuf-0003rp-5s; Sun, 17 Jan 2021 22:09:06 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DJxZj05CSz9sVs; Mon, 18 Jan 2021 14:09:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610939341;
 bh=IbM+28WiNylPwcorneBx4ClTkb6UACgBWdnifdHVcSw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ollaxCw5WS2EKsaNtvwzrT47zOnHIRmM+2g2EfznOCr2ru3ZEC50+oMlmlhE/kGDj
 OvkKEe1IjTOGyR6zjN6IJtQovQpLQ8M9Y7qeVGtptKh0verrx4mW6TyrnsUlHlzHne
 C8WvgIiAMgoLvcZQWgKn6mVln+4/PoKOdrK9puSw=
Date: Mon, 18 Jan 2021 14:08:29 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [RFC PATCH v0 1/1] target/ppc: Support for H_RPT_INVALIDATE hcall
Message-ID: <20210118030829.GH2089552@yekko.fritz.box>
References: <20210106085910.2200795-1-bharata@linux.ibm.com>
 <20210113172256.0d32dc5d@bahia.lan>
 <20210115083128.GA2457611@in.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3VRmKSg17yJg2MZg"
Content-Disposition: inline
In-Reply-To: <20210115083128.GA2457611@in.ibm.com>
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
Cc: paulus@ozlabs.org, qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--3VRmKSg17yJg2MZg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 15, 2021 at 02:01:28PM +0530, Bharata B Rao wrote:
> On Wed, Jan 13, 2021 at 05:22:56PM +0100, Greg Kurz wrote:
> > Hi Bharata,
> >=20
> > On Wed,  6 Jan 2021 14:29:10 +0530
> > Bharata B Rao <bharata@linux.ibm.com> wrote:
> >=20
> > > If KVM_CAP_RPT_INVALIDATE KVM capability is enabled, then
> > >=20
> > > - indicate the availability of H_RPT_INVALIDATE hcall to the guest via
> > >   ibm,hypertas-functions property.
> > > - Enable the hcall
> > >=20
> > > Both the above are done only if the new sPAPR machine capability
> > > cap-rpt-invalidate is set.
> > >=20
> > > Note: The KVM implementation of the hcall has been posted for upstream
> > > review here:
> > > https://lore.kernel.org/linuxppc-dev/20210105090557.2150104-1-bharata=
@linux.ibm.com/T/#t
> > >=20
> > > Update to linux-headers/linux/kvm.h here is temporary, will be
> > > done via header updates once the kernel change is accepted upstream.
> > >=20
> > > Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> > > ---
> >=20
> > Patch looks mostly fine. A few remarks below.
> >=20
> > >  hw/ppc/spapr.c            |  7 ++++++
> > >  hw/ppc/spapr_caps.c       | 49 +++++++++++++++++++++++++++++++++++++=
++
> > >  include/hw/ppc/spapr.h    |  8 +++++--
> > >  linux-headers/linux/kvm.h |  1 +
> > >  target/ppc/kvm.c          | 12 ++++++++++
> > >  target/ppc/kvm_ppc.h      | 11 +++++++++
> > >  6 files changed, 86 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > > index 489cefcb81..0228083800 100644
> > > --- a/hw/ppc/spapr.c
> > > +++ b/hw/ppc/spapr.c
> > > @@ -890,6 +890,11 @@ static void spapr_dt_rtas(SpaprMachineState *spa=
pr, void *fdt)
> > >      add_str(hypertas, "hcall-copy");
> > >      add_str(hypertas, "hcall-debug");
> > >      add_str(hypertas, "hcall-vphn");
> > > +    if (kvm_enabled() &&
> >=20
> > You shouldn't check KVM here. The capability is enough to decide if we
> > should expose "hcall-rpt-invalidate" or not. FWIW we won't even reach
> > this code when running with anything but KVM.
>=20
> Correct, the capability itself can be only for KVM case.

Hrm.. that's kind of a problem in itself.  Enabling KVM should not
change the guest visible environment.

>=20
> >=20
> > > +        (spapr_get_cap(spapr, SPAPR_CAP_RPT_INVALIDATE) =3D=3D SPAPR=
_CAP_ON)) {
> > > +        add_str(hypertas, "hcall-rpt-invalidate");
> > > +    }
> > > +
> > >      add_str(qemu_hypertas, "hcall-memop1");
> > > =20
> > >      if (!kvm_enabled() || kvmppc_spapr_use_multitce()) {
> > > @@ -2021,6 +2026,7 @@ static const VMStateDescription vmstate_spapr =
=3D {
> > >          &vmstate_spapr_cap_ccf_assist,
> > >          &vmstate_spapr_cap_fwnmi,
> > >          &vmstate_spapr_fwnmi,
> > > +        &vmstate_spapr_cap_rpt_invalidate,
> > >          NULL
> > >      }
> > >  };
> > > @@ -4478,6 +4484,7 @@ static void spapr_machine_class_init(ObjectClas=
s *oc, void *data)
> > >      smc->default_caps.caps[SPAPR_CAP_LARGE_DECREMENTER] =3D SPAPR_CA=
P_ON;
> > >      smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] =3D SPAPR_CAP_ON;
> > >      smc->default_caps.caps[SPAPR_CAP_FWNMI] =3D SPAPR_CAP_ON;
> > > +    smc->default_caps.caps[SPAPR_CAP_RPT_INVALIDATE] =3D SPAPR_CAP_O=
FF;
> >=20
> > Any reason for not enabling this for the default machine type and
> > disabling it for existing machine types only ?
>=20
> If this capability is enabled, then
>=20
> 1. First level guest (L1) can off-load the TLB invalidations to the
> new hcall if the platform has disabled LPCR[GTSE].
>=20
> 2. Nested guest (L2) will switch to this new hcall rather than using
> the old H_TLB_INVALIDATE hcall.
>=20
> Case 2 is optional and case 1 makes sense only if LPCR[GTSE]=3Doff.
> Hence I thought keeping it off by default and expecting the
> user to turn it on only if required would be correct.
>=20
> Please note that turning this capability ON will result in the
> new hcall being exposed to the guest. I hope this is the right
> usage of spapr-caps?
>=20
> > > diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
> > > index 73ce2bc951..8e27f8421f 100644
> > > --- a/target/ppc/kvm_ppc.h
> > > +++ b/target/ppc/kvm_ppc.h
> > > @@ -24,6 +24,7 @@ void kvmppc_enable_logical_ci_hcalls(void);
> > >  void kvmppc_enable_set_mode_hcall(void);
> > >  void kvmppc_enable_clear_ref_mod_hcalls(void);
> > >  void kvmppc_enable_h_page_init(void);
> > > +void kvmppc_enable_h_rpt_invalidate(void);
> > >  void kvmppc_set_papr(PowerPCCPU *cpu);
> > >  int kvmppc_set_compat(PowerPCCPU *cpu, uint32_t compat_pvr);
> > >  void kvmppc_set_mpic_proxy(PowerPCCPU *cpu, int mpic_proxy);
> > > @@ -72,6 +73,7 @@ bool kvmppc_has_cap_nested_kvm_hv(void);
> > >  int kvmppc_set_cap_nested_kvm_hv(int enable);
> > >  int kvmppc_get_cap_large_decr(void);
> > >  int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable);
> > > +int kvmppc_has_cap_rpt_invalidate(void);
> > >  int kvmppc_enable_hwrng(void);
> > >  int kvmppc_put_books_sregs(PowerPCCPU *cpu);
> > >  PowerPCCPUClass *kvm_ppc_get_host_cpu_class(void);
> > > @@ -151,6 +153,10 @@ static inline void kvmppc_enable_h_page_init(voi=
d)
> > >  {
> > >  }
> > > =20
> > > +static inline void kvmppc_enable_h_rpt_invalidate(void)
> > > +{
> >=20
> > g_assert_not_reached() ?
>=20
> Don't see many others doing that, is that a new preferred
> way?

Pretty much, yes.

>=20
> Regards,
> Bharata.
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3VRmKSg17yJg2MZg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAE+60ACgkQbDjKyiDZ
s5LoWhAA2+teBV/Cq3u3o3rGPooN1KdgePdlEuooSOq+0kvn4N4H59iB++7fc5OF
6R5rGehkIVudKPLDRdvf7dZShndTbkCsoYP97xJVbtRI4yhNJRq7VyZ841uMutt7
uLnAwO7ZkbfmbawwQl5tv+Bo/dkVajw5N2IkfewytDXHAMoVhedi7M/uqTJBTB5B
P+akqD7Qp0N2gQymw6TrfKOAmEWWcOyPf1COSs25DcY2orptySa5jtI++PnHTXmk
xTBCl0V9IvfMYlc8wj1eYGXO48jZoNTNJd7Hnlkv/Ruarh3l/9QKNCGFNWoybLgc
0ZKhbgM3JEhA9xeYlPZG/xqjCZFgsYmvDWwl84393pO5imm7I4vFL0jSrj/rgEXL
YO0jdW0FzTrqH7kSwsG5BSbuzCa3QZwas6KS6F+fLtmvt7PyVkcx0Q/DncXSzgFz
yyl3j3MCaRrkNJplsNaNjwiaSZVyL6pZcJrUV8nv38ChsfVxiEVcLXiDV3AuXz8+
FHTgY3PuuA7IRjdZ3nPoBbrvVOUDoDJRCeYZlpnxUNGskmE+0Pc3urelkk41fcSZ
w51kODEbFsbL8NMmM7kXZMYjWXsVL1snQb8OlWPh0bYE3FU14y3oG96Z8jo5y3i1
iPkM/dBQyIsfzdm8J2U3M+wHeA77CEbjDF+jSrnzN6CL4arUEBk=
=XRRJ
-----END PGP SIGNATURE-----

--3VRmKSg17yJg2MZg--

