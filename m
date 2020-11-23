Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F572BFFD5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 07:16:47 +0100 (CET)
Received: from localhost ([::1]:34932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh59Z-0008DP-Hu
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 01:16:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh52I-0001Ig-E6; Mon, 23 Nov 2020 01:09:15 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33841 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh52G-0006dN-Da; Mon, 23 Nov 2020 01:09:14 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CfcDG60M1z9sVD; Mon, 23 Nov 2020 17:09:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606111742;
 bh=puu9QCDldHuidyu3/sx9RkVzkI/LYEUIvDR0EKy8pgc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JdZyfMhXfs2R0BD3bhipKtJqFrS8ujEh+R66b+sU6LE1/sKUEbqRLG5N3NwZB1t9y
 bcLqsO4WghhJuRASRi3M3G8t4hp9m7VJI91ggK8vEk1mYe15P4Brr1qYtkJfHypscg
 AhkuGkIxb/09AuLTYNwQ5GDLQvIBf18s5OQWN2JM=
Date: Mon, 23 Nov 2020 16:34:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 9/9] spapr: spapr_drc_attach() cannot fail
Message-ID: <20201123053455.GQ521467@yekko.fritz.box>
References: <20201120234208.683521-1-groug@kaod.org>
 <20201120234208.683521-10-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="L0TNCHh3fkwjpuuE"
Content-Disposition: inline
In-Reply-To: <20201120234208.683521-10-groug@kaod.org>
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


--L0TNCHh3fkwjpuuE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2020 at 12:42:08AM +0100, Greg Kurz wrote:
> All users are passing &error_abort already. Document the fact
> that spapr_drc_attach() should only be passed a free DRC, which
> is supposedly the case if appropriate checking is done earlier.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
>  include/hw/ppc/spapr_drc.h | 8 +++++++-
>  hw/ppc/spapr.c             | 6 +++---
>  hw/ppc/spapr_drc.c         | 8 ++------
>  hw/ppc/spapr_nvdimm.c      | 2 +-
>  hw/ppc/spapr_pci.c         | 2 +-
>  5 files changed, 14 insertions(+), 12 deletions(-)
>=20
> diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
> index 165b281496bb..def3593adc8b 100644
> --- a/include/hw/ppc/spapr_drc.h
> +++ b/include/hw/ppc/spapr_drc.h
> @@ -235,7 +235,13 @@ SpaprDrc *spapr_drc_by_index(uint32_t index);
>  SpaprDrc *spapr_drc_by_id(const char *type, uint32_t id);
>  int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type=
_mask);
> =20
> -bool spapr_drc_attach(SpaprDrc *drc, DeviceState *d, Error **errp);
> +/*
> + * These functions respectively abort if called with a device already
> + * attached or no device attached. In the case of spapr_drc_attach(),
> + * this means that the attachability of the DRC *must* be checked
> + * beforehand (eg. check drc->dev at pre-plug).
> + */
> +void spapr_drc_attach(SpaprDrc *drc, DeviceState *d);
>  void spapr_drc_detach(SpaprDrc *drc);
> =20
>  /* Returns true if a hot plug/unplug request is pending */
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 5e32d1d396b4..e0047f41073e 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3399,7 +3399,7 @@ static void spapr_add_lmbs(DeviceState *dev, uint64=
_t addr_start, uint64_t size,
>           * that doesn't overlap with any existing mapping at pre-plug. T=
he
>           * corresponding LMB DRCs are thus assumed to be all attachable.
>           */
> -        spapr_drc_attach(drc, dev, &error_abort);
> +        spapr_drc_attach(drc, dev);
>          if (!hotplugged) {
>              spapr_drc_reset(drc);
>          }
> @@ -3767,7 +3767,7 @@ static void spapr_core_plug(HotplugHandler *hotplug=
_dev, DeviceState *dev)
>           * core being plugged into a free slot. Nothing should already
>           * be attached to the corresponding DRC.
>           */
> -        spapr_drc_attach(drc, dev, &error_abort);
> +        spapr_drc_attach(drc, dev);
> =20
>          if (hotplugged) {
>              /*
> @@ -3920,7 +3920,7 @@ static void spapr_phb_plug(HotplugHandler *hotplug_=
dev, DeviceState *dev)
>      assert(drc);
> =20
>      /* spapr_phb_pre_plug() already checked the DRC is attachable */
> -    spapr_drc_attach(drc, dev, &error_abort);
> +    spapr_drc_attach(drc, dev);
> =20
>      if (hotplugged) {
>          spapr_hotplug_req_add_by_index(drc);
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 77718cde1ff2..f991cf89a08a 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -369,14 +369,11 @@ static void prop_get_fdt(Object *obj, Visitor *v, c=
onst char *name,
>      } while (fdt_depth !=3D 0);
>  }
> =20
> -bool spapr_drc_attach(SpaprDrc *drc, DeviceState *d, Error **errp)
> +void spapr_drc_attach(SpaprDrc *drc, DeviceState *d)
>  {
>      trace_spapr_drc_attach(spapr_drc_index(drc));
> =20
> -    if (drc->dev) {
> -        error_setg(errp, "an attached device is still awaiting release");
> -        return false;
> -    }
> +    g_assert(!drc->dev);
>      g_assert((drc->state =3D=3D SPAPR_DRC_STATE_LOGICAL_UNUSABLE)
>               || (drc->state =3D=3D SPAPR_DRC_STATE_PHYSICAL_POWERON));
> =20
> @@ -386,7 +383,6 @@ bool spapr_drc_attach(SpaprDrc *drc, DeviceState *d, =
Error **errp)
>                               object_get_typename(OBJECT(drc->dev)),
>                               (Object **)(&drc->dev),
>                               NULL, 0);
> -    return true;
>  }
> =20
>  static void spapr_drc_release(SpaprDrc *drc)
> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> index 2f1c196e1b76..73ee006541a6 100644
> --- a/hw/ppc/spapr_nvdimm.c
> +++ b/hw/ppc/spapr_nvdimm.c
> @@ -101,7 +101,7 @@ void spapr_add_nvdimm(DeviceState *dev, uint64_t slot)
>       * pc_dimm_get_free_slot() provided a free slot at pre-plug. The
>       * corresponding DRC is thus assumed to be attachable.
>       */
> -    spapr_drc_attach(drc, dev, &error_abort);
> +    spapr_drc_attach(drc, dev);
> =20
>      if (hotplugged) {
>          spapr_hotplug_req_add_by_index(drc);
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 2829f298d9c1..e946bd5055cc 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -1601,7 +1601,7 @@ static void spapr_pci_plug(HotplugHandler *plug_han=
dler,
>      }
> =20
>      /* spapr_pci_pre_plug() already checked the DRC is attachable */
> -    spapr_drc_attach(drc, DEVICE(pdev), &error_abort);
> +    spapr_drc_attach(drc, DEVICE(pdev));
> =20
>      /* If this is function 0, signal hotplug for all the device function=
s.
>       * Otherwise defer sending the hotplug event.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--L0TNCHh3fkwjpuuE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+7Sf8ACgkQbDjKyiDZ
s5JDcQ/+PfX47nim4DRktZryVeNh8hJIDN/7nKGwumh2B1cjwDG5ELzpg0s99wKP
oKSFmn7vGGUbCVITdaGbhbQk3wrb98nSmQPNt4Hob3hgTh4M/KWohWeVPs9gpzpd
3wew4nTp3Sw3r/Fr81e2edK4W+vkNF8qKZbudqUTB6HjInz3fKDeUs6re6LxsVtb
JPg950DCSWJVoa8bXJvNCIOSIjNQHl4wgWHcXrlSuAptv2jfQl185FJbij+Bxse3
bs9PbIkuP7ytYozh2t6/dj/TdlM3B4/3oI6L3dK7Lxs9OijYoJ1zvac2bV9zE9Ps
pracd5apfE0F62sxZuQmJ2DOO0Ij4rvbnpetSFxAPKNJZcpYs078rXEJdmIUaV8H
sYXRSvzun+AA4lOLy496+DTOCzxG8IGTILiCgINPK4ObqtP1kwTqe2kP7J+2OrH/
4pIQMBq0jpiU3TbHy47c1uvJtnGlclzZvt50BCgS8KSYd+lOZywwUyrvE/5EdWeU
s9aGaWkDPauzQvSKAshpb1hn9SKwPcHikV8rdSsbDbEE1Q+u4EZQWBtobH9WOOnB
0LfNTHsleqAEt921HhF9KbX/siajhxRG4VLtEzeol7+hYFCofb3gwdupm8JDRtKd
sPIJmrQjYJfEJC1n5sY4kl+6+izirpFhTHbKTlfcs0iT66X+0EI=
=q5Rh
-----END PGP SIGNATURE-----

--L0TNCHh3fkwjpuuE--

