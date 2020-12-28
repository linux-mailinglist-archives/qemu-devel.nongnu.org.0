Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DFD2E34D0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 08:47:21 +0100 (CET)
Received: from localhost ([::1]:49318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktnFQ-0007hC-7O
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 02:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktmy7-0002UX-Mi; Mon, 28 Dec 2020 02:29:27 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:47855 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktmy5-0000PU-Oz; Mon, 28 Dec 2020 02:29:27 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D48Lh160Cz9sWs; Mon, 28 Dec 2020 18:29:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609140556;
 bh=aW1Lwzrl5PIjqDYtTT/PBBu3qD3Bw0FqFd1PhnBOLrU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fFZMl/H5NTxkwXv4jp2uxvZZHd0i0yuh+z3TiX/kC3tevovVkJ+fm4ovIfauPivBN
 MNHwBaXDe1H/RtyXi5l6y7lqBHR7X4jsVScIMxz0NrmJokwYRQAL/rWEHzJ/qxz5uQ
 Ebw+PbGZ6yx0RiPw6/E+pDwFjCFAbfktpDxgSmoQ=
Date: Mon, 28 Dec 2020 18:26:44 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 3/6] spapr: Introduce spapr_drc_reset_all()
Message-ID: <20201228072644.GI6952@yekko.fritz.box>
References: <20201218103400.689660-1-groug@kaod.org>
 <20201218103400.689660-4-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qVyHzDF4yf4A8jkR"
Content-Disposition: inline
In-Reply-To: <20201218103400.689660-4-groug@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qVyHzDF4yf4A8jkR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 18, 2020 at 11:33:57AM +0100, Greg Kurz wrote:
> No need to expose the way DRCs are traversed outside of spapr_drc.c.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied, thanks.

> ---
>  include/hw/ppc/spapr_drc.h |  6 ++++++
>  hw/ppc/spapr_drc.c         | 31 +++++++++++++++++++++++++++++
>  hw/ppc/spapr_hcall.c       | 40 ++++++--------------------------------
>  3 files changed, 43 insertions(+), 34 deletions(-)
>=20
> diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
> index 5d80019f82e2..8982927d5c24 100644
> --- a/include/hw/ppc/spapr_drc.h
> +++ b/include/hw/ppc/spapr_drc.h
> @@ -245,6 +245,12 @@ int spapr_dt_drc(void *fdt, int offset, Object *owne=
r, uint32_t drc_type_mask);
>  void spapr_drc_attach(SpaprDrc *drc, DeviceState *d);
>  void spapr_drc_detach(SpaprDrc *drc);
> =20
> +/*
> + * Reset all DRCs, causing pending hot-plug/unplug requests to complete.
> + * Safely handles potential DRC removal (eg. PHBs or PCI bridges).
> + */
> +void spapr_drc_reset_all(struct SpaprMachineState *spapr);
> +
>  static inline bool spapr_drc_unplug_requested(SpaprDrc *drc)
>  {
>      return drc->unplug_requested;
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 5b5e2ac58a7e..a4d2608017c5 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -949,6 +949,37 @@ out:
>      return ret;
>  }
> =20
> +void spapr_drc_reset_all(SpaprMachineState *spapr)
> +{
> +    Object *drc_container;
> +    ObjectProperty *prop;
> +    ObjectPropertyIterator iter;
> +
> +    drc_container =3D container_get(object_get_root(), DRC_CONTAINER_PAT=
H);
> +restart:
> +    object_property_iter_init(&iter, drc_container);
> +    while ((prop =3D object_property_iter_next(&iter))) {
> +        SpaprDrc *drc;
> +
> +        if (!strstart(prop->type, "link<", NULL)) {
> +            continue;
> +        }
> +        drc =3D SPAPR_DR_CONNECTOR(object_property_get_link(drc_containe=
r,
> +                                                          prop->name,
> +                                                          &error_abort));
> +
> +        /*
> +         * This will complete any pending plug/unplug requests.
> +         * In case of a unplugged PHB or PCI bridge, this will
> +         * cause some DRCs to be destroyed and thus potentially
> +         * invalidate the iterator.
> +         */
> +        if (spapr_drc_reset(drc)) {
> +            goto restart;
> +        }
> +    }
> +}
> +
>  /*
>   * RTAS calls
>   */
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index aa22830ac4bd..e5dfc1ba7acc 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1632,39 +1632,6 @@ static uint32_t cas_check_pvr(PowerPCCPU *cpu, uin=
t32_t max_compat,
>      return best_compat;
>  }
> =20
> -static void spapr_handle_transient_dev_before_cas(SpaprMachineState *spa=
pr)
> -{
> -    Object *drc_container;
> -    ObjectProperty *prop;
> -    ObjectPropertyIterator iter;
> -
> -    drc_container =3D container_get(object_get_root(), "/dr-connector");
> -restart:
> -    object_property_iter_init(&iter, drc_container);
> -    while ((prop =3D object_property_iter_next(&iter))) {
> -        SpaprDrc *drc;
> -
> -        if (!strstart(prop->type, "link<", NULL)) {
> -            continue;
> -        }
> -        drc =3D SPAPR_DR_CONNECTOR(object_property_get_link(drc_containe=
r,
> -                                                          prop->name,
> -                                                          &error_abort));
> -
> -        /*
> -         * This will complete any pending plug/unplug requests.
> -         * In case of a unplugged PHB or PCI bridge, this will
> -         * cause some DRCs to be destroyed and thus potentially
> -         * invalidate the iterator.
> -         */
> -        if (spapr_drc_reset(drc)) {
> -            goto restart;
> -        }
> -    }
> -
> -    spapr_clear_pending_hotplug_events(spapr);
> -}
> -
>  target_ulong do_client_architecture_support(PowerPCCPU *cpu,
>                                              SpaprMachineState *spapr,
>                                              target_ulong vec,
> @@ -1822,7 +1789,12 @@ target_ulong do_client_architecture_support(PowerP=
CCPU *cpu,
> =20
>      spapr_irq_update_active_intc(spapr);
> =20
> -    spapr_handle_transient_dev_before_cas(spapr);
> +    /*
> +     * Process all pending hot-plug/unplug requests now. An updated full
> +     * rendered FDT will be returned to the guest.
> +     */
> +    spapr_drc_reset_all(spapr);
> +    spapr_clear_pending_hotplug_events(spapr);
> =20
>      /*
>       * If spapr_machine_reset() did not set up a HPT but one is necessary

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qVyHzDF4yf4A8jkR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/piLQACgkQbDjKyiDZ
s5L/PBAAgwQRkfAVdH5Kp9yIwMU8chyoE1jtRFI4WSyt3EyBBWtGylprKBJ/jfJo
gMuupHrsQe7KPti/3sXv9evgt6xnhvY2p4tQ94hOfs8aqaO1rblZKfnTfhSdxI2B
2rhlQ4MF689N8VejVPUC2fHM9X/Lao3jkYAPhFq11n+NMN3hiJTDmRBaRUriFaqw
c2ayvf/NJERdGulES9aWBslXmK1N/xHjrobQzEDIkGXSkjTWnPpJsXsxgn2+GW+Y
qJ1+/TDgOhZGt5NzVHZJ2IVKX2PawYFxor4JOfhxgb5vmO23dOrqgG2r8wdNbfwm
AaQQ4+Fgg/d/KtdHB2xK0eMLlDmNhHWixUm0wiJeRN2HwlXvyHJn+2R6kxNY+2Mg
dZPpAogKDMbs+dIEkYbrR0+I9fp8akLssu1ZqzFZb/NpojcPSlEr1lTLfJIKUG2s
99vVB9jTZsE6BrY/My6cUP/P3380p5kcnHEKF143Yd3YQpOKqIYKjoui2LEpSGZz
4wI0T/bvPUBDidXZGwtmr8PQxAfQI9+St2XkVxWJ84ygtFMLYnkI0otpK0X2wZnw
h8MHxJeVl8O+unF1U1t0JVlO0DmOuOK8jYb75JvG4HNB9oklYl/RpOAqplxVY+H/
kCq0euIGWKhnEBdYGXmxXY57Jjo10jAt/U9xByTwDMWzRWyjr8I=
=q3A1
-----END PGP SIGNATURE-----

--qVyHzDF4yf4A8jkR--

