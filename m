Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C67237702D
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 08:50:41 +0200 (CEST)
Received: from localhost ([::1]:49878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfGnQ-0006Oc-Ig
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 02:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lfGmY-0005W0-Cj; Sat, 08 May 2021 02:49:46 -0400
Received: from ozlabs.org ([203.11.71.1]:60849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lfGmV-00014M-LO; Sat, 08 May 2021 02:49:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FcdGK6JDmz9sWq; Sat,  8 May 2021 16:49:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620456569;
 bh=iUAdnPYlozotqMf7VnG3OVAa5C4lMc7OcpgmEbBChh4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EBuY+/FCPjLfT1NtwxRV3D3A32NLpYR6JSIG8AvAS7+AgvZV4KiZGn2uFPbFnStTD
 jD7Kbj6VMZ7Kxdn5Ft9OuBS/Jk0iA6vnGQWIoA6bwc61TMj1/R3kUPJnHoVwQJdy28
 kmBLrUKOmED36i2KD/Vy8sqBYAbMhGezYA7hH/Us=
Date: Sat, 8 May 2021 16:42:48 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: Re: [PATCH v4] hw/ppc: moved has_spr to cpu.h
Message-ID: <YJYy6KofLUGnbZNy@yekko>
References: <20210507164146.67086-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6jV5o5VUycfYllb/"
Content-Disposition: inline
In-Reply-To: <20210507164146.67086-1-lucas.araujo@eldorado.org.br>
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6jV5o5VUycfYllb/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 07, 2021 at 01:41:46PM -0300, Lucas Mateus Castro (alqotel) wro=
te:
> Moved has_spr to cpu.h as ppc_has_spr and turned it into an inline functi=
on.
> Change spr verification in pnv.c and spapr.c to a version that can
> compile in a !TCG environment.
>=20
> Signed-off-by: Lucas Mateus Castro (alqotel)
> <lucas.araujo@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  hw/ppc/pnv.c         |  2 +-
>  hw/ppc/spapr.c       |  4 ++--
>  hw/ppc/spapr_hcall.c | 12 +++---------
>  target/ppc/cpu.h     |  6 ++++++
>  4 files changed, 12 insertions(+), 12 deletions(-)
>=20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index ffe01977cd..d16dd2d080 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -196,7 +196,7 @@ static void pnv_dt_core(PnvChip *chip, PnvCore *pc, v=
oid *fdt)
>      _FDT((fdt_setprop_string(fdt, offset, "status", "okay")));
>      _FDT((fdt_setprop(fdt, offset, "64-bit", NULL, 0)));
> =20
> -    if (env->spr_cb[SPR_PURR].oea_read) {
> +    if (ppc_has_spr(cpu, SPR_PURR)) {
>          _FDT((fdt_setprop(fdt, offset, "ibm,purr", NULL, 0)));
>      }
> =20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 4db448d63e..c23bcc4490 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -703,10 +703,10 @@ static void spapr_dt_cpu(CPUState *cs, void *fdt, i=
nt offset,
>      _FDT((fdt_setprop_string(fdt, offset, "status", "okay")));
>      _FDT((fdt_setprop(fdt, offset, "64-bit", NULL, 0)));
> =20
> -    if (env->spr_cb[SPR_PURR].oea_read) {
> +    if (ppc_has_spr(cpu, SPR_PURR)) {
>          _FDT((fdt_setprop_cell(fdt, offset, "ibm,purr", 1)));
>      }
> -    if (env->spr_cb[SPR_SPURR].oea_read) {
> +    if (ppc_has_spr(cpu, SPR_PURR)) {
>          _FDT((fdt_setprop_cell(fdt, offset, "ibm,spurr", 1)));
>      }
> =20
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 6dbaa93d15..f25014afda 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -20,12 +20,6 @@
>  #include "mmu-book3s-v3.h"
>  #include "hw/mem/memory-device.h"
> =20
> -static bool has_spr(PowerPCCPU *cpu, int spr)
> -{
> -    /* We can test whether the SPR is defined by checking for a valid na=
me */
> -    return cpu->env.spr_cb[spr].name !=3D NULL;
> -}
> -
>  bool is_ram_address(SpaprMachineState *spapr, hwaddr addr)
>  {
>      MachineState *machine =3D MACHINE(spapr);
> @@ -212,12 +206,12 @@ static target_ulong h_set_sprg0(PowerPCCPU *cpu, Sp=
aprMachineState *spapr,
>  static target_ulong h_set_dabr(PowerPCCPU *cpu, SpaprMachineState *spapr,
>                                 target_ulong opcode, target_ulong *args)
>  {
> -    if (!has_spr(cpu, SPR_DABR)) {
> +    if (!ppc_has_spr(cpu, SPR_DABR)) {
>          return H_HARDWARE;              /* DABR register not available */
>      }
>      cpu_synchronize_state(CPU(cpu));
> =20
> -    if (has_spr(cpu, SPR_DABRX)) {
> +    if (ppc_has_spr(cpu, SPR_DABRX)) {
>          cpu->env.spr[SPR_DABRX] =3D 0x3;  /* Use Problem and Privileged =
state */
>      } else if (!(args[0] & 0x4)) {      /* Breakpoint Translation set? */
>          return H_RESERVED_DABR;
> @@ -232,7 +226,7 @@ static target_ulong h_set_xdabr(PowerPCCPU *cpu, Spap=
rMachineState *spapr,
>  {
>      target_ulong dabrx =3D args[1];
> =20
> -    if (!has_spr(cpu, SPR_DABR) || !has_spr(cpu, SPR_DABRX)) {
> +    if (!ppc_has_spr(cpu, SPR_DABR) || !ppc_has_spr(cpu, SPR_DABRX)) {
>          return H_HARDWARE;
>      }
> =20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index a976e7f7b0..98fcf1c4d6 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2642,6 +2642,12 @@ static inline ppc_avr_t *cpu_avr_ptr(CPUPPCState *=
env, int i)
>      return (ppc_avr_t *)((uintptr_t)env + avr_full_offset(i));
>  }
> =20
> +static inline bool ppc_has_spr(PowerPCCPU *cpu, int spr)
> +{
> +    /* We can test whether the SPR is defined by checking for a valid na=
me */
> +    return cpu->env.spr_cb[spr].name !=3D NULL;
> +}
> +
>  void dump_mmu(CPUPPCState *env);
> =20
>  void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int le=
n);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6jV5o5VUycfYllb/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCWMuYACgkQbDjKyiDZ
s5Lg4xAAmLu1nfvhxEySGTTqbk1s5Ft98Wp0C6LSOBKEA8TfQPJoZrCvZOM2xB0L
WvdTAkx/5P72lWVKdexmDegLrUgAoeBh1gsP86/2WM2Cmos1H0ie1SrqjEf8J9Pe
rS+hMVcu6p4Ahagrq61eIds4dua4/TFuLcywJM+L+JxZm5FLLv49JOqiyy2uG1yR
1LkcxJlX55p9sBU3Gpla6vSxYPi195iC2APM+rXqa3flGL7aKucs7GqB8MNyqjm/
+fAi5K9eHjl8lSvaSPJCkn9e9f1wSr2imBEwQSRoHZ4vSwJsHUMm7N/ryCpI8J7L
1jSqaZ2jnhwVGdkqmLjJARsuAyBtz+i6dYQN573zXIaSZJCsX68AU7PJPg8NR+kD
SuL09hUoM4zATXzo0Az8+M+KTXi0H4TMN3aTamIK7js55BvPPofdur/WsnyDX7JH
Ke2bpHmiPe1uvfdaSVrCPNCGUda4mdLxI5RBElFtFaLTEK8as+581YTmlEErKVJD
Ng1h1kDdR2tvLJVTinvTfyIkZpAzNotPVQU24/FOUEHaCw44yvzS6FSMyRWS9i89
ZO4WxHZpy0MJc5+UmL3rjIQKuEvCQvjvJOGU8x3hdLlaosTF4PoBrTHCQUJKY7rw
pF7LOhl8vD3rq83xLNLKtzDzMlqdYKfz4oYDl8uhQD6XQVGp/Bk=
=dkRA
-----END PGP SIGNATURE-----

--6jV5o5VUycfYllb/--

