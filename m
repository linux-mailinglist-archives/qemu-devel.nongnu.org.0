Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030732BFFCF
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 07:13:39 +0100 (CET)
Received: from localhost ([::1]:56046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh56X-0005EK-Jw
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 01:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh52F-0001F2-F5; Mon, 23 Nov 2020 01:09:11 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:42539 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh52B-0006aQ-58; Mon, 23 Nov 2020 01:09:11 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CfcDG1mMbz9s0b; Mon, 23 Nov 2020 17:09:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606111742;
 bh=eJEhrcyahGDUp+R9FvRnuf8BKzFeUttKjvMB37UrIPU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aQGX4jagLVwAz0KG6Kletmgn92U9OIOQqoJtpPKSWvLo5lqzC8KT+Ampom/0+82X5
 5JH4lxsuYEgHP+x8U/7iB+TEbdLAOXUdSjxLyhkTUx0eze3kXh0StkSyFyiOsyUIKU
 TYl0D4gPoLctp8LwBGalPzW2N7zk1We6Pq8hUUDU=
Date: Mon, 23 Nov 2020 16:14:38 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 6/9] spapr: Make PHB placement functions and
 spapr_pre_plug_phb() return status
Message-ID: <20201123051438.GN521467@yekko.fritz.box>
References: <20201120234208.683521-1-groug@kaod.org>
 <20201120234208.683521-7-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="prC3/KjdfqNV7evK"
Content-Disposition: inline
In-Reply-To: <20201120234208.683521-7-groug@kaod.org>
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


--prC3/KjdfqNV7evK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2020 at 12:42:05AM +0100, Greg Kurz wrote:
> Read documentation in "qapi/error.h" and changelog of commit
> e3fe3988d785 ("error: Document Error API usage rules") for
> rationale.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
>  include/hw/ppc/spapr.h |  2 +-
>  hw/ppc/spapr.c         | 40 +++++++++++++++++++++++-----------------
>  2 files changed, 24 insertions(+), 18 deletions(-)
>=20
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 2e89e36cfbdc..b7ced9faebf5 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -140,7 +140,7 @@ struct SpaprMachineClass {
>      bool pre_5_1_assoc_refpoints;
>      bool pre_5_2_numa_associativity;
> =20
> -    void (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
> +    bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
>                            uint64_t *buid, hwaddr *pio,=20
>                            hwaddr *mmio32, hwaddr *mmio64,
>                            unsigned n_dma, uint32_t *liobns, hwaddr *nv2g=
pa,
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index cfca033c7b14..81bac59887ab 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3865,7 +3865,7 @@ int spapr_phb_dt_populate(SpaprDrc *drc, SpaprMachi=
neState *spapr,
>      return 0;
>  }
> =20
> -static void spapr_phb_pre_plug(HotplugHandler *hotplug_dev, DeviceState =
*dev,
> +static bool spapr_phb_pre_plug(HotplugHandler *hotplug_dev, DeviceState =
*dev,
>                                 Error **errp)
>  {
>      SpaprMachineState *spapr =3D SPAPR_MACHINE(OBJECT(hotplug_dev));
> @@ -3875,24 +3875,25 @@ static void spapr_phb_pre_plug(HotplugHandler *ho=
tplug_dev, DeviceState *dev,
> =20
>      if (dev->hotplugged && !smc->dr_phb_enabled) {
>          error_setg(errp, "PHB hotplug not supported for this machine");
> -        return;
> +        return false;
>      }
> =20
>      if (sphb->index =3D=3D (uint32_t)-1) {
>          error_setg(errp, "\"index\" for PAPR PHB is mandatory");
> -        return;
> +        return false;
>      }
> =20
>      /*
>       * This will check that sphb->index doesn't exceed the maximum numbe=
r of
>       * PHBs for the current machine type.
>       */
> -    smc->phb_placement(spapr, sphb->index,
> -                       &sphb->buid, &sphb->io_win_addr,
> -                       &sphb->mem_win_addr, &sphb->mem64_win_addr,
> -                       windows_supported, sphb->dma_liobn,
> -                       &sphb->nv2_gpa_win_addr, &sphb->nv2_atsd_win_addr,
> -                       errp);
> +    return
> +        smc->phb_placement(spapr, sphb->index,
> +                           &sphb->buid, &sphb->io_win_addr,
> +                           &sphb->mem_win_addr, &sphb->mem64_win_addr,
> +                           windows_supported, sphb->dma_liobn,
> +                           &sphb->nv2_gpa_win_addr, &sphb->nv2_atsd_win_=
addr,
> +                           errp);
>  }
> =20
>  static void spapr_phb_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
> @@ -4130,7 +4131,7 @@ static const CPUArchIdList *spapr_possible_cpu_arch=
_ids(MachineState *machine)
>      return machine->possible_cpus;
>  }
> =20
> -static void spapr_phb_placement(SpaprMachineState *spapr, uint32_t index,
> +static bool spapr_phb_placement(SpaprMachineState *spapr, uint32_t index,
>                                  uint64_t *buid, hwaddr *pio,
>                                  hwaddr *mmio32, hwaddr *mmio64,
>                                  unsigned n_dma, uint32_t *liobns,
> @@ -4168,7 +4169,7 @@ static void spapr_phb_placement(SpaprMachineState *=
spapr, uint32_t index,
>      if (index >=3D SPAPR_MAX_PHBS) {
>          error_setg(errp, "\"index\" for PAPR PHB is too large (max %llu)=
",
>                     SPAPR_MAX_PHBS - 1);
> -        return;
> +        return false;
>      }
> =20
>      *buid =3D base_buid + index;
> @@ -4182,6 +4183,7 @@ static void spapr_phb_placement(SpaprMachineState *=
spapr, uint32_t index,
> =20
>      *nv2gpa =3D SPAPR_PCI_NV2RAM64_WIN_BASE + index * SPAPR_PCI_NV2RAM64=
_WIN_SIZE;
>      *nv2atsd =3D SPAPR_PCI_NV2ATSD_WIN_BASE + index * SPAPR_PCI_NV2ATSD_=
WIN_SIZE;
> +    return true;
>  }
> =20
>  static ICSState *spapr_ics_get(XICSFabric *dev, int irq)
> @@ -4561,18 +4563,21 @@ DEFINE_SPAPR_MACHINE(4_1, "4.1", false);
>  /*
>   * pseries-4.0
>   */
> -static void phb_placement_4_0(SpaprMachineState *spapr, uint32_t index,
> +static bool phb_placement_4_0(SpaprMachineState *spapr, uint32_t index,
>                                uint64_t *buid, hwaddr *pio,
>                                hwaddr *mmio32, hwaddr *mmio64,
>                                unsigned n_dma, uint32_t *liobns,
>                                hwaddr *nv2gpa, hwaddr *nv2atsd, Error **e=
rrp)
>  {
> -    spapr_phb_placement(spapr, index, buid, pio, mmio32, mmio64, n_dma, =
liobns,
> -                        nv2gpa, nv2atsd, errp);
> +    if (!spapr_phb_placement(spapr, index, buid, pio, mmio32, mmio64, n_=
dma,
> +                             liobns, nv2gpa, nv2atsd, errp)) {
> +        return false;
> +    }
> +
>      *nv2gpa =3D 0;
>      *nv2atsd =3D 0;
> +    return true;
>  }
> -
>  static void spapr_machine_4_0_class_options(MachineClass *mc)
>  {
>      SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
> @@ -4732,7 +4737,7 @@ DEFINE_SPAPR_MACHINE(2_8, "2.8", false);
>   * pseries-2.7
>   */
> =20
> -static void phb_placement_2_7(SpaprMachineState *spapr, uint32_t index,
> +static bool phb_placement_2_7(SpaprMachineState *spapr, uint32_t index,
>                                uint64_t *buid, hwaddr *pio,
>                                hwaddr *mmio32, hwaddr *mmio64,
>                                unsigned n_dma, uint32_t *liobns,
> @@ -4764,7 +4769,7 @@ static void phb_placement_2_7(SpaprMachineState *sp=
apr, uint32_t index,
>      if (index > max_index) {
>          error_setg(errp, "\"index\" for PAPR PHB is too large (max %u)",
>                     max_index);
> -        return;
> +        return false;
>      }
> =20
>      *buid =3D base_buid + index;
> @@ -4783,6 +4788,7 @@ static void phb_placement_2_7(SpaprMachineState *sp=
apr, uint32_t index,
> =20
>      *nv2gpa =3D 0;
>      *nv2atsd =3D 0;
> +    return true;
>  }
> =20
>  static void spapr_machine_2_7_class_options(MachineClass *mc)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--prC3/KjdfqNV7evK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+7RT4ACgkQbDjKyiDZ
s5JHrRAAhtlGrt2WgYK8QI5yWZJ6p0RcyeH6vBryGGBszifYKSBNLtujPEjIgATD
86+ZubzwYVcqoX+X/KHuY4mv2x1qsWA9ZekNsDxM6VznCt9a1zlJoBDoaklew20v
EU6LSxsnCOC7/1WA8s7IVA6BiBBODFrZTNzFnoYm0LeSy9BNsT/v2oFnyelVKd14
3rC8loWITBRCgBl1V8RIEo0zaDSU0Ba1j1C2jHr8auD578jxffV4K14eM91kGvoh
t5/NN4GEAcgh55GBGEnUirMFqa2MoitPhnCp56+8jZicbMIayqwkJOSum22uREsc
oeWfNxYnp8Vwb84YnMzG4bpNE8YGA57+w+OVgqKbxD4+tJmsC+S0acF0DPGkJX98
yJuHYvIvKPjzAEdgppQz4y9C7ztCo52bVT46wSPwYZGq5X3lE986mCLDNg+uxydN
W6dW9BeNudXA8QlOszOtSlbdelOuByfdUsIhzmx9QcMIXJ3aO0fStWMo7YmZdaF2
rffNhc+x2T7fqL3TQaT69qSW+TXPMkO7mPF2qZcMWd1/G4r0GP3MfVwFJRu10MsJ
xcZuSStSRpgbGTlj8EyJPwMZTxdvrZI+q1cmqrz11WjbvmEo+Fwakpf3UqmyPIWA
npwbMBdVxZHzuYqpMAC800KKhpCaRs28NUnyZk+T0JS342z42YY=
=XR3M
-----END PGP SIGNATURE-----

--prC3/KjdfqNV7evK--

