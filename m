Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 554092BFF52
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 06:11:09 +0100 (CET)
Received: from localhost ([::1]:52602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh482-0005lC-NR
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 00:11:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh45r-0004Gk-9N; Mon, 23 Nov 2020 00:08:51 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:58643 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh45m-0000kn-LJ; Mon, 23 Nov 2020 00:08:50 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CfZtd3KV1z9sTL; Mon, 23 Nov 2020 16:08:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606108121;
 bh=SaFFxDQs3PtYW6zfJjBg/Oq4sTf+TddVuJcwjWCpA4k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p0r02dgx14Z9XH2YhUWDow4Bkuadbg9ZKsCa82HyJaq/CNhVRxXJLEWHPdl8s2xOn
 RMRl8MQjt5/AFaCdCt0HMw/OwvwKGmPacEdbf5yH8V+YMyNRvtHRNZ3UvxhyA9cdOY
 f/vVU7ha3ZyKcb9bOG1ajn+Ph3EGCJdBInbESEQo=
Date: Mon, 23 Nov 2020 15:55:48 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 2/9] spapr: Do NVDIMM/PC-DIMM device hotplug
 sanity checks at pre-plug only
Message-ID: <20201123045548.GJ521467@yekko.fritz.box>
References: <20201120234208.683521-1-groug@kaod.org>
 <20201120234208.683521-3-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GlnCQLZWzqLRJED8"
Content-Disposition: inline
In-Reply-To: <20201120234208.683521-3-groug@kaod.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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


--GlnCQLZWzqLRJED8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2020 at 12:42:01AM +0100, Greg Kurz wrote:
> Pre-plug of a memory device, be it an NVDIMM or a PC-DIMM, ensures
> that the memory slot is available and that addresses don't overlap
> with existing memory regions. The corresponding DRCs in the LMB
> and PMEM namespaces are thus necessarily attachable at plug time.
>=20
> Pass &error_abort to spapr_drc_attach() in spapr_add_lmbs() and
> spapr_add_nvdimm(). This allows to greatly simplify error handling
> on the plug path.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
>  include/hw/ppc/spapr_nvdimm.h |  2 +-
>  hw/ppc/spapr.c                | 40 ++++++++++++-----------------------
>  hw/ppc/spapr_nvdimm.c         | 11 +++++-----
>  3 files changed, 20 insertions(+), 33 deletions(-)
>=20
> diff --git a/include/hw/ppc/spapr_nvdimm.h b/include/hw/ppc/spapr_nvdimm.h
> index 344582d2f5f7..73be250e2ac9 100644
> --- a/include/hw/ppc/spapr_nvdimm.h
> +++ b/include/hw/ppc/spapr_nvdimm.h
> @@ -30,6 +30,6 @@ int spapr_pmem_dt_populate(SpaprDrc *drc, SpaprMachineS=
tate *spapr,
>  void spapr_dt_persistent_memory(SpaprMachineState *spapr, void *fdt);
>  bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nv=
dimm,
>                             uint64_t size, Error **errp);
> -bool spapr_add_nvdimm(DeviceState *dev, uint64_t slot, Error **errp);
> +void spapr_add_nvdimm(DeviceState *dev, uint64_t slot);
> =20
>  #endif
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 12a012d9dd09..394d28d9e081 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3382,8 +3382,8 @@ int spapr_lmb_dt_populate(SpaprDrc *drc, SpaprMachi=
neState *spapr,
>      return 0;
>  }
> =20
> -static bool spapr_add_lmbs(DeviceState *dev, uint64_t addr_start, uint64=
_t size,
> -                           bool dedicated_hp_event_source, Error **errp)
> +static void spapr_add_lmbs(DeviceState *dev, uint64_t addr_start, uint64=
_t size,
> +                           bool dedicated_hp_event_source)
>  {
>      SpaprDrc *drc;
>      uint32_t nr_lmbs =3D size/SPAPR_MEMORY_BLOCK_SIZE;
> @@ -3396,15 +3396,12 @@ static bool spapr_add_lmbs(DeviceState *dev, uint=
64_t addr_start, uint64_t size,
>                                addr / SPAPR_MEMORY_BLOCK_SIZE);
>          g_assert(drc);
> =20
> -        if (!spapr_drc_attach(drc, dev, errp)) {
> -            while (addr > addr_start) {
> -                addr -=3D SPAPR_MEMORY_BLOCK_SIZE;
> -                drc =3D spapr_drc_by_id(TYPE_SPAPR_DRC_LMB,
> -                                      addr / SPAPR_MEMORY_BLOCK_SIZE);
> -                spapr_drc_detach(drc);
> -            }
> -            return false;
> -        }
> +        /*
> +         * memory_device_get_free_addr() provided a range of free addres=
ses
> +         * that doesn't overlap with any existing mapping at pre-plug. T=
he
> +         * corresponding LMB DRCs are thus assumed to be all attachable.
> +         */
> +        spapr_drc_attach(drc, dev, &error_abort);
>          if (!hotplugged) {
>              spapr_drc_reset(drc);
>          }
> @@ -3425,11 +3422,9 @@ static bool spapr_add_lmbs(DeviceState *dev, uint6=
4_t addr_start, uint64_t size,
>                                             nr_lmbs);
>          }
>      }
> -    return true;
>  }
> =20
> -static void spapr_memory_plug(HotplugHandler *hotplug_dev, DeviceState *=
dev,
> -                              Error **errp)
> +static void spapr_memory_plug(HotplugHandler *hotplug_dev, DeviceState *=
dev)
>  {
>      SpaprMachineState *ms =3D SPAPR_MACHINE(hotplug_dev);
>      PCDIMMDevice *dimm =3D PC_DIMM(dev);
> @@ -3444,24 +3439,15 @@ static void spapr_memory_plug(HotplugHandler *hot=
plug_dev, DeviceState *dev,
>      if (!is_nvdimm) {
>          addr =3D object_property_get_uint(OBJECT(dimm),
>                                          PC_DIMM_ADDR_PROP, &error_abort);
> -        if (!spapr_add_lmbs(dev, addr, size,
> -                            spapr_ovec_test(ms->ov5_cas, OV5_HP_EVT), er=
rp)) {
> -            goto out_unplug;
> -        }
> +        spapr_add_lmbs(dev, addr, size,
> +                       spapr_ovec_test(ms->ov5_cas, OV5_HP_EVT));
>      } else {
>          slot =3D object_property_get_int(OBJECT(dimm),
>                                         PC_DIMM_SLOT_PROP, &error_abort);
>          /* We should have valid slot number at this point */
>          g_assert(slot >=3D 0);
> -        if (!spapr_add_nvdimm(dev, slot, errp)) {
> -            goto out_unplug;
> -        }
> +        spapr_add_nvdimm(dev, slot);
>      }
> -
> -    return;
> -
> -out_unplug:
> -    pc_dimm_unplug(dimm, MACHINE(ms));
>  }
> =20
>  static void spapr_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceSta=
te *dev,
> @@ -4009,7 +3995,7 @@ static void spapr_machine_device_plug(HotplugHandle=
r *hotplug_dev,
>                                        DeviceState *dev, Error **errp)
>  {
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> -        spapr_memory_plug(hotplug_dev, dev, errp);
> +        spapr_memory_plug(hotplug_dev, dev);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_CPU_CORE)) {
>          spapr_core_plug(hotplug_dev, dev, errp);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_PCI_HOST_BRID=
GE)) {
> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> index a833a63b5ed3..2f1c196e1b76 100644
> --- a/hw/ppc/spapr_nvdimm.c
> +++ b/hw/ppc/spapr_nvdimm.c
> @@ -89,7 +89,7 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev,=
 NVDIMMDevice *nvdimm,
>  }
> =20
> =20
> -bool spapr_add_nvdimm(DeviceState *dev, uint64_t slot, Error **errp)
> +void spapr_add_nvdimm(DeviceState *dev, uint64_t slot)
>  {
>      SpaprDrc *drc;
>      bool hotplugged =3D spapr_drc_hotplugged(dev);
> @@ -97,14 +97,15 @@ bool spapr_add_nvdimm(DeviceState *dev, uint64_t slot=
, Error **errp)
>      drc =3D spapr_drc_by_id(TYPE_SPAPR_DRC_PMEM, slot);
>      g_assert(drc);
> =20
> -    if (!spapr_drc_attach(drc, dev, errp)) {
> -        return false;
> -    }
> +    /*
> +     * pc_dimm_get_free_slot() provided a free slot at pre-plug. The
> +     * corresponding DRC is thus assumed to be attachable.
> +     */
> +    spapr_drc_attach(drc, dev, &error_abort);
> =20
>      if (hotplugged) {
>          spapr_hotplug_req_add_by_index(drc);
>      }
> -    return true;
>  }
> =20
>  static int spapr_dt_nvdimm(SpaprMachineState *spapr, void *fdt,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GlnCQLZWzqLRJED8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+7QNQACgkQbDjKyiDZ
s5JZWg//ee2d4oJXHAEdedXOcDxOtTu5d8TKwe5+nVxflIs37bXOkCCq9MZjhXRw
w+EAqifCx8/atP5DfXWGiAwZ+Z7sbpNIIyGq88wxdEcQQIVJs1brA2nek74uaSBf
w2kz2netDaeBPE42iftmrnOpQ2WCPcuhupqFXCyZbhw0zS0XW8yEF0OJkEoJL2NN
fOMEf6AgUiaauSUk2lcu8FK95q0JUetaVNFw25rDTliQ487H7+CWg5av+elKsU7I
VfAhGQHmnpzxJbsLHSb/VlFSL2gLIID52gOOe/SF242zq2yBUbwU1JlRluAMHBSZ
vnVDysUOQ+r3XUk7Bml1PX8KR3p+eFUDTfEYkc2j4e0o1Ak8mB9IkyPQtiK0e47b
tKM6JumlESkQJGgUsTeuuf1g0gZDT6CidryOauWAGsiRL9s1XATrvERrBurJD8/F
qZyseiBT9Va/Nzx37NTNSG0uI8kYYYcXlMIW8bBhS5fFDXd57Mn/f/E30WuU/LWQ
1PzZEHxLQYtFrMrox1yFiPKv28uPrY3TwkkRxYY6T+Oz58q5ZJIKvcEQeuW6yZ9t
hsCOGDKrUkjfi6N3B38qktaWe2mI3OfBYLq+dP857WcrSG0QKeCPOS0DmKi0SAAy
jVnXXscJGYM2sFVMhstVW6YXG2VIoFEUQh6656WGV16EOYa31Q8=
=+lHC
-----END PGP SIGNATURE-----

--GlnCQLZWzqLRJED8--

