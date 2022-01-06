Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F35486052
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 06:37:19 +0100 (CET)
Received: from localhost ([::1]:52338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5LSf-0006uo-LQ
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 00:37:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n5LNy-0004nK-0b; Thu, 06 Jan 2022 00:32:26 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:32985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n5LNo-0002Wu-Rk; Thu, 06 Jan 2022 00:32:19 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JTw2z6slvz4y46; Thu,  6 Jan 2022 16:32:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1641447131;
 bh=swCFS6Me2MY50uQoAyKtIuCiWcDhLW/QZDnkC9crnrw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M85UHRVcEMlQ/sdwL9YWlc3Vt0Hg25S0A+SwXQtYapWHzwr8h/pJZUYv3irObWt1b
 GdEpcgLAQDZvtrtV63RbpGxQ4vYi2PD7brWKYlEC8/V7uDdH5Sbg1zQg5TWPF+4BIR
 usLWZiDJvAr0KzK8qHzLZPJUF7vReVeT8CxWHwTI=
Date: Thu, 6 Jan 2022 16:30:10 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 4/7] target/ppc: Add HV support to
 ppc_interrupts_little_endian
Message-ID: <YdZ+YtvZSUhkFvR/@yekko>
References: <20220105204029.4058500-1-farosas@linux.ibm.com>
 <20220105204029.4058500-5-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QWfmp0ede1fqG0EG"
Content-Disposition: inline
In-Reply-To: <20220105204029.4058500-5-farosas@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--QWfmp0ede1fqG0EG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 05:40:26PM -0300, Fabiano Rosas wrote:
> The ppc_interrupts_little_endian function could be used for interrupts
> delivered in Hypervisor mode, so add support for powernv8 and powernv9
> to it.
>=20
> Also drop the comment because it is inaccurate, all CPUs that can run
> little endian can have interrupts in little endian. The point is
> whether they can take interrupts in an endianness different from
> MSR_LE.
>=20
> This change has no functional impact.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

With one nit you might want to look at later:

> ---
>  target/ppc/arch_dump.c   |  2 +-
>  target/ppc/cpu.h         | 23 +++++++++++++++--------
>  target/ppc/excp_helper.c |  2 +-
>  3 files changed, 17 insertions(+), 10 deletions(-)
>=20
> diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
> index bb392f6d88..12cde198a3 100644
> --- a/target/ppc/arch_dump.c
> +++ b/target/ppc/arch_dump.c
> @@ -237,7 +237,7 @@ int cpu_get_dump_info(ArchDumpInfo *info,
>      info->d_machine =3D PPC_ELF_MACHINE;
>      info->d_class =3D ELFCLASS;
> =20
> -    if (ppc_interrupts_little_endian(cpu)) {
> +    if (ppc_interrupts_little_endian(cpu, false)) {

I'm wondering if using hv=3D=3Dfalse here is actually correct, and AFAICT
it probably is for spapr, but not for powernv.  So I'm wondering if we
should actually test cpu->vhyp here to get the right value for powernv
as well.

>          info->d_endian =3D ELFDATA2LSB;
>      } else {
>          info->d_endian =3D ELFDATA2MSB;
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index f20d4ffa6d..a6fc857ad4 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2728,20 +2728,27 @@ static inline bool ppc_has_spr(PowerPCCPU *cpu, i=
nt spr)
>      return cpu->env.spr_cb[spr].name !=3D NULL;
>  }
> =20
> -static inline bool ppc_interrupts_little_endian(PowerPCCPU *cpu)
> +#if !defined(CONFIG_USER_ONLY)
> +static inline bool ppc_interrupts_little_endian(PowerPCCPU *cpu, bool hv)
>  {
>      PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> +    CPUPPCState *env =3D &cpu->env;
> +    bool ile =3D false;
> =20
> -    /*
> -     * Only models that have an LPCR and know about LPCR_ILE can do litt=
le
> -     * endian.
> -     */
> -    if (pcc->lpcr_mask & LPCR_ILE) {
> -        return !!(cpu->env.spr[SPR_LPCR] & LPCR_ILE);
> +    if (hv && env->has_hv_mode) {
> +        if (is_isa300(pcc)) {
> +            ile =3D !!(env->spr[SPR_HID0] & HID0_POWER9_HILE);
> +        } else {
> +            ile =3D !!(env->spr[SPR_HID0] & HID0_HILE);
> +        }
> +
> +    } else if (pcc->lpcr_mask & LPCR_ILE) {
> +        ile =3D !!(env->spr[SPR_LPCR] & LPCR_ILE);
>      }
> =20
> -    return false;
> +    return ile;
>  }
> +#endif
> =20
>  void dump_mmu(CPUPPCState *env);
> =20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index fa41f8048d..92953af896 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1071,7 +1071,7 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, t=
arget_ulong vector)
>       */
>      msr =3D (1ULL << MSR_ME);
>      msr |=3D env->msr & (1ULL << MSR_SF);
> -    if (ppc_interrupts_little_endian(cpu)) {
> +    if (ppc_interrupts_little_endian(cpu, false)) {
>          msr |=3D (1ULL << MSR_LE);
>      }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QWfmp0ede1fqG0EG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHWfmIACgkQbDjKyiDZ
s5KXABAAkI+G+Y3IdvIDp/FKAH7lKVqlf45mbfQX4lWcrgfXwoQgu+R5M0MU5aU6
BWbvYNS2y55K4YQ+2rzcj8DVNwC/4eT2pda2pPJLqkgEQp58PyCfBoEw+aiKCeQ7
uH2twyJHTEN3Wqev8xGE6zIWofrxabIUZEPiLY8Q8LUABDYrFjfRldYRQhWgpDBt
qOntSkNP/8BpMqDrrFtrDF34i26A2SktVsM0NlCGJf7N6Fdhx/Qu2XWHtbEXiaBV
uI5X/r705s+IF3rgB80ON//VbjKhxwnZ0290vM6hXEy74+gqQEceAt7oQPpfLTrZ
PZnGFyMttXFf827VTul9OI9hRaBNVM5bLse1BsZhY37aD2nn7QI9wNU7nYHQLxWi
qJ438Zwz8BOxwBzsYKhVgnfrhxJidquys9aSmJ3Dfy1Cz9reKgt+/WGYxq8vcE7e
mMK7r6luZCk8msVv5fSF2sZ0gS8BZ+O8T9qEXne7geOAA6/6tvB9pglBuxRYB9V7
+93lQOqWv+p0OkGRvF+afucLpR9kFL3ck4lWuXFNJTOOZ/WFUXq4upq+vTV1syHU
5Fv2CwC28SxHXMunqRz24ASR2LYb1KDT8d+v7MyTtu6XDDLArYE+mC2YX1rmQe3w
Y513CRY/ljyNsEgCfYXoUhctX0mDZFTwp705zonjpNbchQeQ4XE=
=Pt80
-----END PGP SIGNATURE-----

--QWfmp0ede1fqG0EG--

