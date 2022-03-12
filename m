Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946594D6DBE
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Mar 2022 10:26:30 +0100 (CET)
Received: from localhost ([::1]:55188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSy16-0000rq-Rw
	for lists+qemu-devel@lfdr.de; Sat, 12 Mar 2022 04:26:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nSxvC-0007C8-5i; Sat, 12 Mar 2022 04:20:22 -0500
Received: from [2404:9400:2221:ea00::3] (port=34715 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nSxv9-0005a2-0d; Sat, 12 Mar 2022 04:20:21 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KFy1z3HTjz4xPt; Sat, 12 Mar 2022 20:20:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1647076807;
 bh=0wLBavIg6iqlSDAIUilCsvcDdlexeZuWT4S1TXLEuNg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DFq3Wz1jpjrAuHw4ulZ+MmkXn2nxh1GUrIqHdgfZybzH3f/jrkBK0s7CaqACWtjIO
 lKRvwTCupg+y/BTtuwvzyMkqbIQGMq8tpRg2p4PakA/fwvPRFih/Q4XFCU5LJPZy4f
 lrK/Wkyc/Iog0MGMvZVJAc1E9JBjyqlaqlKHw0oA=
Date: Sat, 12 Mar 2022 20:17:59 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH 1/2] spapr: Report correct GTSE support via ov5
Message-ID: <YixlR+rLNZCsAA50@yekko>
References: <20220309012400.2527157-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="y+qCzXkLMz8FHH5z"
Content-Disposition: inline
In-Reply-To: <20220309012400.2527157-1-farosas@linux.ibm.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2404:9400:2221:ea00::3
 (failed)
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: aneesh.kumar@linux.ibm.com, danielhb413@gmail.com, qemu-devel@nongnu.org,
 npiggin@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--y+qCzXkLMz8FHH5z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 08, 2022 at 10:23:59PM -0300, Fabiano Rosas wrote:
> QEMU reports MMU support to the guest via the ibm,architecture-vec-5
> property of the /chosen node. Byte number 26 specifies Radix Table
> Expansions, currently only GTSE (Guest Translation Shootdown
> Enable). This feature determines whether the tlbie instruction (and
> others) are HV privileged.
>=20
> Up until now, we always reported GTSE=3D1 to guests. Even after the
> support for GTSE=3D0 was added. As part of that support, a kernel
> command line radix_hcall_invalidate=3Don was introduced that overrides
> the GTSE value received via CAS. So a guest can run with GTSE=3D0 and
> use the H_RPT_INVALIDATE hcall instead of tlbie.
>=20
> In this scenario, having GTSE always set to 1 by QEMU leads to a crash
> when running nested KVM guests because KVM does not allow a nested
> hypervisor to set GTSE support for its nested guests. So a nested
> guest always uses the same value for LPCR_GTSE as its HV. Since the
> nested HV disabled GTSE, but the L2 QEMU always reports GTSE=3D1, we run
> into a crash when:
>=20
> L1 LPCR_GTSE=3D0
> L2 LPCR_GTSE=3D0
> L2 CAS GTSE=3D1
>=20
> The nested guest will run 'tlbie' and crash because the HW looks at
> LPCR_GTSE, which is clear.
>=20
> Having GTSE disabled in the L1 and enabled in the L2 is not an option
> because the whole purpose of GTSE is to disallow access to tlbie and
> we cannot allow L1 to spawn L2s that can access features that L1
> itself cannot.
>=20
> We also cannot have the guest check the LPCR bit, because LPCR is
> HV-privileged.
>=20
> So this patch goes through the most intuitive route which is to have
> QEMU ask KVM about GTSE support and advertise the correct value to the
> guest. A new KVM_CAP_PPC_GTSE capability is being added.
>=20
> TCG continues to always enable GTSE.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  hw/ppc/spapr.c       | 38 +++++++++++++++++++++++++++++++-------
>  target/ppc/kvm.c     |  8 ++++++++
>  target/ppc/kvm_ppc.h |  6 ++++++
>  3 files changed, 45 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 4cc204f90d..3e95a1831f 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -971,7 +971,7 @@ static void spapr_dt_ov5_platform_support(SpaprMachin=
eState *spapr, void *fdt,
>          23, 0x00, /* XICS / XIVE mode */
>          24, 0x00, /* Hash/Radix, filled in below. */
>          25, 0x00, /* Hash options: Segment Tables =3D=3D no, GTSE =3D=3D=
 no. */
> -        26, 0x40, /* Radix options: GTSE =3D=3D yes. */
> +        26, 0x00, /* Radix options, filled in below. */
>      };
> =20
>      if (spapr->irq->xics && spapr->irq->xive) {
> @@ -1000,10 +1000,16 @@ static void spapr_dt_ov5_platform_support(SpaprMa=
chineState *spapr, void *fdt,
>          } else {
>              val[3] =3D 0x00; /* Hash */
>          }
> +
> +        if (kvmppc_has_cap_gtse()) {
> +            val[7] =3D 0x40 /* OV5_MMU_RADIX_GTSE */;
> +        }
>      } else {
>          /* V3 MMU supports both hash and radix in tcg (with dynamic swit=
ching) */
>          val[3] =3D 0xC0;
> +        val[7] =3D 0x40 /* OV5_MMU_RADIX_GTSE */;
>      }
> +
>      _FDT(fdt_setprop(fdt, chosen, "ibm,arch-vec-5-platform-support",
>                       val, sizeof(val)));
>  }
> @@ -2824,14 +2830,32 @@ static void spapr_machine_init(MachineState *mach=
ine)
>      /* Init numa_assoc_array */
>      spapr_numa_associativity_init(spapr, machine);
> =20
> -    if ((!kvm_enabled() || kvmppc_has_cap_mmu_radix()) &&
> -        ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_3_0=
0, 0,
> +    if (ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_3_0=
0, 0,
>                                spapr->max_compat_pvr)) {
> -        spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_300);
> -        /* KVM and TCG always allow GTSE with radix... */
> -        spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_GTSE);
> +
> +        /* TCG always supports Radix w/ GTSE */
> +        if (!kvm_enabled()) {
> +            spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_300);
> +            spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_GTSE);

Yeah, this is no good.  It's never ok to change guest visible
behaviour depending on host properties (in this case whether it's KVM
or not).  It messes up the invariants we need for migration, which
require that the guest visible state depend only on the user
configuration.

The usual way to handle this is with a new capability, you can then
change the default with the next machine version.

> +        } else {
> +            if (kvmppc_has_cap_mmu_radix()) {
> +                spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_300);
> +            }
> +
> +            /*
> +             * Only disable Guest Translation Shootdown if KVM
> +             * supports the H_RPT_INVALIDATE hypercall, otherwise we'd
> +             * leave the guest with no way to make TLB invalidations.
> +             */
> +            if (kvmppc_has_cap_rpt_invalidate()) {
> +                if (kvmppc_has_cap_gtse()) {
> +                    spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_GTSE);
> +                }
> +            } else {
> +                spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_GTSE);
> +            }
> +        }
>      }
> -    /* ... but not with hash (currently). */
> =20
>      if (kvm_enabled()) {
>          /* Enable H_LOGICAL_CI_* so SLOF can talk to in-kernel devices */
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index dc93b99189..91582c4b15 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -90,6 +90,7 @@ static int cap_ppc_nested_kvm_hv;
>  static int cap_large_decr;
>  static int cap_fwnmi;
>  static int cap_rpt_invalidate;
> +static int cap_gtse;
> =20
>  static uint32_t debug_inst_opcode;
> =20
> @@ -154,6 +155,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>      }
> =20
>      cap_rpt_invalidate =3D kvm_vm_check_extension(s, KVM_CAP_PPC_RPT_INV=
ALIDATE);
> +    cap_gtse =3D kvm_vm_check_extension(s, KVM_CAP_PPC_GTSE);
> +
>      kvm_ppc_register_host_cpu_type();
> =20
>      return 0;
> @@ -2397,6 +2400,11 @@ bool kvmppc_has_cap_mmu_hash_v3(void)
>      return cap_mmu_hash_v3;
>  }
> =20
> +bool kvmppc_has_cap_gtse(void)
> +{
> +    return cap_gtse;
> +}
> +
>  static bool kvmppc_power8_host(void)
>  {
>      bool ret =3D false;
> diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
> index ee9325bf9a..7d6980edb7 100644
> --- a/target/ppc/kvm_ppc.h
> +++ b/target/ppc/kvm_ppc.h
> @@ -63,6 +63,7 @@ bool kvmppc_has_cap_fixup_hcalls(void);
>  bool kvmppc_has_cap_htm(void);
>  bool kvmppc_has_cap_mmu_radix(void);
>  bool kvmppc_has_cap_mmu_hash_v3(void);
> +bool kvmppc_has_cap_gtse(void);
>  bool kvmppc_has_cap_xive(void);
>  int kvmppc_get_cap_safe_cache(void);
>  int kvmppc_get_cap_safe_bounds_check(void);
> @@ -343,6 +344,11 @@ static inline bool kvmppc_has_cap_mmu_hash_v3(void)
>      return false;
>  }
> =20
> +static inline bool kvmppc_has_cap_gtse(void)
> +{
> +    return false;
> +}
> +
>  static inline bool kvmppc_has_cap_xive(void)
>  {
>      return false;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--y+qCzXkLMz8FHH5z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIsZT8ACgkQgypY4gEw
YSJ2SBAAw3P92HlTJC1eTRPWjFR1K13Bw2f8Ff8tOrIamrQMqv0cJ/Y1xamb0edj
5iL7OjZ+js0lp8PjuZr74ZQZjGWS9a61aTs2G2ezsvBFCZyR6EAZSDOL+h9BIdYy
JL5psoMiOLvfyhnb6r292dwkTab6O4EQJmdqFY3qS3urA5C0EikTapQ0cYbSw2Pk
ZZovppCuGeOAlDc2WvHGjsv8S8Dm1+2Q0bY7knOnr2l8dXGuStQ6mCq150KrqZIq
0k9+Cig3yXhczlKsEBA1sgSSSLmm3tEiE25v0ckBGLhyqLFRQICx5aUX62As0xO6
EuWJpiXWj28eSCL7iH2ciKlt2s3doBdz31dX9rbJNLz56G4UTr05SwitZy5SkUWT
PxeHSRVl6xEAGxGnd5MlcjiVHXJ0a14z6YbGyXgBzwBJZddWoOU5Hzq2Z8VdH6mi
Z19diSZZRhC9maPm/C7UHmmhI3mammo/Q1bgPQOXP2bZ19t3E91hOyqR97kMU0xX
+/bGnfbjAnrtpJRqU4ClCnli58AMAp+NPPZnp7wEnzlOdfRXsGr+MfrSHE48mWgM
bqph+YcW3yqw7p5NRiRmWSJLqYYiGx/sPko+Q9YFVYrMoLPNLhDpgI81UEg4OTLn
DiThJ9o+S8GzA4NTYZx0H1oseSpQuIopb2mJKUwnZx9fbkzu/WM=
=zIxj
-----END PGP SIGNATURE-----

--y+qCzXkLMz8FHH5z--

