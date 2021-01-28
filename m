Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F2030826F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 01:36:21 +0100 (CET)
Received: from localhost ([::1]:59150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Hls-0003A1-Sj
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 19:36:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5Hk4-0001NI-6m; Thu, 28 Jan 2021 19:34:28 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:54549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5Hk1-0003Ip-K3; Thu, 28 Jan 2021 19:34:27 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DRdd94rjHz9sWQ; Fri, 29 Jan 2021 11:34:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611880461;
 bh=aTIc4bSTeTp60jMr4GAQkVyVCF6DuJukcGFPbabpWJo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jE4n8QGxXI1ltMK/fpsSQZdkKDnHCY5Tp5sGY9zWOyst94kTMr6hxBC/O5dua8SjE
 uGDZXItjT9gDvwo5zKjHbKVxm0sk1uncVzfK9LDaToNQKYmPJxeg5wLYi/SnsW+GSa
 KS8ksYsWF4CxoeUwTe0/rQD2b98ODWjg7+HQ+oNI=
Date: Fri, 29 Jan 2021 10:56:39 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 1/3] spapr: move spapr_machine_using_legacy_numa() to
 spapr_numa.c
Message-ID: <20210128235639.GD6951@yekko.fritz.box>
References: <20210128151731.1333664-1-danielhb413@gmail.com>
 <20210128151731.1333664-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fOHHtNG4YXGJ0yqR"
Content-Disposition: inline
In-Reply-To: <20210128151731.1333664-2-danielhb413@gmail.com>
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


--fOHHtNG4YXGJ0yqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2021 at 12:17:29PM -0300, Daniel Henrique Barboza wrote:
> This function is used only in spapr_numa.c.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/ppc/spapr.c         | 9 ---------
>  hw/ppc/spapr_numa.c    | 9 +++++++++
>  include/hw/ppc/spapr.h | 1 -
>  3 files changed, 9 insertions(+), 10 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 6c47466fc2..2d60c6f594 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -295,15 +295,6 @@ static hwaddr spapr_node0_size(MachineState *machine)
>      return machine->ram_size;
>  }
> =20
> -bool spapr_machine_using_legacy_numa(SpaprMachineState *spapr)
> -{
> -    MachineState *machine =3D MACHINE(spapr);
> -    SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(machine);
> -
> -    return smc->pre_5_2_numa_associativity ||
> -           machine->numa_state->num_nodes <=3D 1;
> -}
> -
>  static void add_str(GString *s, const gchar *s1)
>  {
>      g_string_append_len(s, s1, strlen(s1) + 1);
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index b50796bbe3..261810525b 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -19,6 +19,15 @@
>  /* Moved from hw/ppc/spapr_pci_nvlink2.c */
>  #define SPAPR_GPU_NUMA_ID           (cpu_to_be32(1))
> =20
> +static bool spapr_machine_using_legacy_numa(SpaprMachineState *spapr)
> +{
> +    MachineState *machine =3D MACHINE(spapr);
> +    SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(machine);
> +
> +    return smc->pre_5_2_numa_associativity ||
> +           machine->numa_state->num_nodes <=3D 1;
> +}
> +
>  static bool spapr_numa_is_symmetrical(MachineState *ms)
>  {
>      int src, dst;
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index c27c7ce515..ccbeeca1de 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -851,7 +851,6 @@ int spapr_max_server_number(SpaprMachineState *spapr);
>  void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
>                        uint64_t pte0, uint64_t pte1);
>  void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered);
> -bool spapr_machine_using_legacy_numa(SpaprMachineState *spapr);
> =20
>  /* DRC callbacks. */
>  void spapr_core_release(DeviceState *dev);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fOHHtNG4YXGJ0yqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmATTzUACgkQbDjKyiDZ
s5I0VBAA5jegq+pMwSBngsTITZB5kWWfv4jDhJUGmybqBH7KN67pF4DXBEuanQOB
IIZJmOEBr3nARP2w4PRw+2b36Fbo0KaQXTGcvGRGrGWaWjus78wNVKTsd0qQcVpS
mWzhC4rWg7hROWem24PsrQAgqYuThVP6ty+40RO+DznNwao3tfkQKDfuWtAT1Cpq
aLS+ifr666DieKfOoBk0dRnwF9E4iCpSxwarBr8FB5IvIvwbp4a9K3j6omlPWrLQ
i238ZEE+ox0YKDASjlgbF+FpXER3O1fzdiMS2/cmCltzZver5ZukSs1up4OS6lmE
97G2u2WOZD3RKjOZa1lF3s8JOouEe3Dm8AgPqlOTLfUMdDd5Dg4OGGZfqCasF6+g
F45FtR9P817vioM7xou690HKeTjDKRT6GQHGTK5zy2jop+TLWVFNxt2SxPru3PVE
ztUC5pckecjbZLweuoTkvqW5g5CxdZzTZevh89uixWEE4snL/RXmPhox30+/cmG1
o2K38UMu0cMH73zDsKGW1hkN1bXHkf2awhw8LvvnSoyzUOeIbgK0+whD0Z8gHr6J
BmO4iCdLfX8h56BpInYplFS9sW7sA9woJxPiSyDiU+tMfv7MPWwmF7A/wVv+HrvJ
wBnuRgxbt1z7Jb3CcBF3ayWVAAe6QmXIVm315QUiu6gGcly8dX4=
=YE3m
-----END PGP SIGNATURE-----

--fOHHtNG4YXGJ0yqR--

