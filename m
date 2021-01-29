Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D54B308272
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 01:36:45 +0100 (CET)
Received: from localhost ([::1]:60044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5HmG-0003WP-Ki
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 19:36:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5Hk5-0001OO-QW; Thu, 28 Jan 2021 19:34:29 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:35277 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5Hk1-0003Iq-Pj; Thu, 28 Jan 2021 19:34:29 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DRdd95zNZz9sWV; Fri, 29 Jan 2021 11:34:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611880461;
 bh=cZAkCQJEXsHUrJDX2tYjDU7Yfai14T0P06p2LEd+qeM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HK5HxoUhjDb+/VVxiICxUR8HHJgd3dqysznPpP3zAbP8EyVouv/wutaF1IyHUvz6n
 u5uBZft+7rUVlQb65Q8pWQQPmXvGkeCXjMjgHByY1pIAG4bUjIY3I3VLJRmGP9bYnd
 KzxMTgmqotjquEqZMqu9dWaSzl6Oj2hTUbVjXb78=
Date: Fri, 29 Jan 2021 11:05:57 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 2/3] spapr_numa.c: create
 spapr_numa_initial_nvgpu_numa_id() helper
Message-ID: <20210129000557.GE6951@yekko.fritz.box>
References: <20210128174213.1349181-1-danielhb413@gmail.com>
 <20210128174213.1349181-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="u5E4XgoOPWr4PD9E"
Content-Disposition: inline
In-Reply-To: <20210128174213.1349181-3-danielhb413@gmail.com>
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
Cc: clg@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--u5E4XgoOPWr4PD9E
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2021 at 02:42:12PM -0300, Daniel Henrique Barboza wrote:
> We'll need to check the initial value given to spapr->gpu_numa_id when
> building the rtas DT, so put it in a helper for easier access and to
> avoid repetition.
>=20
> Tested-by: C=E9dric Le Goater <clg@kaod.org>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/ppc/spapr.c              | 11 +----------
>  hw/ppc/spapr_numa.c         | 14 ++++++++++++++
>  include/hw/ppc/spapr_numa.h |  1 +
>  3 files changed, 16 insertions(+), 10 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 2d60c6f594..bc3fa276ff 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2765,16 +2765,7 @@ static void spapr_machine_init(MachineState *machi=
ne)
> =20
>      }
> =20
> -    /*
> -     * NVLink2-connected GPU RAM needs to be placed on a separate NUMA n=
ode.
> -     * We assign a new numa ID per GPU in spapr_pci_collect_nvgpu() whic=
h is
> -     * called from vPHB reset handler so we initialize the counter here.
> -     * If no NUMA is configured from the QEMU side, we start from 1 as G=
PU RAM
> -     * must be equally distant from any other node.
> -     * The final value of spapr->gpu_numa_id is going to be written to
> -     * max-associativity-domains in spapr_build_fdt().
> -     */
> -    spapr->gpu_numa_id =3D MAX(1, machine->numa_state->num_nodes);
> +    spapr->gpu_numa_id =3D spapr_numa_initial_nvgpu_numa_id(machine);
> =20
>      /* Init numa_assoc_array */
>      spapr_numa_associativity_init(spapr, machine);
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 261810525b..a757dd88b8 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -46,6 +46,20 @@ static bool spapr_numa_is_symmetrical(MachineState *ms)
>      return true;
>  }
> =20
> +/*
> + * NVLink2-connected GPU RAM needs to be placed on a separate NUMA node.
> + * We assign a new numa ID per GPU in spapr_pci_collect_nvgpu() which is
> + * called from vPHB reset handler so we initialize the counter here.
> + * If no NUMA is configured from the QEMU side, we start from 1 as GPU R=
AM
> + * must be equally distant from any other node.
> + * The final value of spapr->gpu_numa_id is going to be written to
> + * max-associativity-domains in spapr_build_fdt().
> + */
> +unsigned int spapr_numa_initial_nvgpu_numa_id(MachineState *machine)
> +{
> +    return MAX(1, machine->numa_state->num_nodes);
> +}
> +
>  /*
>   * This function will translate the user distances into
>   * what the kernel understand as possible values: 10
> diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
> index b3fd950634..6f9f02d3de 100644
> --- a/include/hw/ppc/spapr_numa.h
> +++ b/include/hw/ppc/spapr_numa.h
> @@ -31,5 +31,6 @@ int spapr_numa_fixup_cpu_dt(SpaprMachineState *spapr, v=
oid *fdt,
>                              int offset, PowerPCCPU *cpu);
>  int spapr_numa_write_assoc_lookup_arrays(SpaprMachineState *spapr, void =
*fdt,
>                                           int offset);
> +unsigned int spapr_numa_initial_nvgpu_numa_id(MachineState *machine);
> =20
>  #endif /* HW_SPAPR_NUMA_H */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--u5E4XgoOPWr4PD9E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmATUWUACgkQbDjKyiDZ
s5KPQBAAvStS8S/0djspQPu6U7/HDDfYR93IPv5odXH/4/IKusz8iMfAk6dTX0UT
YQktuHzq4uucqpu/SzdyPfaRfzN+Pqj5By2IE1Dnti3kqmfg/cXsARmfo+Zk6iyh
toevYPAjKfDtSVJ79cFP5dt3NtUBIRzwbaCaIoV1wyi1qrunTbFANaHOZSvXBuRt
HpCjQ+NCcnqJnv0uFpfXeu/pzhmNRcVC9mthMv4PEMGsFBTWB2rkMb3ExJkCvGyW
pPnRtnSkSMWENkzHTKf8LCzsMtJN+W4LIN1QlazZP9Xhsvp2NTFAhR3PHPUGI/df
pvJYi4+1/Zu6YkW0qicMGGne30GI38lx/LpkFWRRM+MMPBLeLHXrQq4VLCoGCMf6
j0kM3V/qAh/2HYJhuZEtB3h2eq3xtKuyeyt/FWWgiH4PGL3W789L7CCAtg378cTN
4IJWbk8D6RFWD5n4fWi9+TBwp1eQUf/IG7eh3gQO7SKSDObdaCVkRuw4I3Aztuf2
jF5M5Jpp9RLcRvLz6HY0DgdFIqzzJpXIpo18Y1stz7nuViIUtz33Ae2k0a/+bxg7
9rN41/Syo/qF6+2AeR/lORSWcj7AChNhURWbm3MZTLpHlNgwYx6MIeW5YIcuGlKG
nzs5ToBzE2lJ76HfOXP/+PDgARVs2uyFp3xAB8Va8mubQsNa+sQ=
=Een7
-----END PGP SIGNATURE-----

--u5E4XgoOPWr4PD9E--

