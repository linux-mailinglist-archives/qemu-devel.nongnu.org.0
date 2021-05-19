Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00354388549
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 05:32:20 +0200 (CEST)
Received: from localhost ([::1]:38588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljCwW-0001Mv-2U
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 23:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljCuL-0006xx-Ay; Tue, 18 May 2021 23:30:05 -0400
Received: from ozlabs.org ([203.11.71.1]:35213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljCuH-0006i7-LE; Tue, 18 May 2021 23:30:05 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlJK201Jnz9sXM; Wed, 19 May 2021 13:29:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621394998;
 bh=KqFX/gJz8T7iAGhTJInWzKoQg48O3ZiDaw1VuDppdA4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NpUDgybvxbppeb6371BEL70tIkF+QoY3SSxUQMdanJsiHB2di0Nfo8xvdIa9s6jPq
 NAUOTMHjtOXL5z6ahEJSYZCrK5SrFpBCqQojsv/Tlxy8ndH2NsnSzwOeim3RIuZh2/
 PS0thr7bpSOoAPJudPhZUymo8h4FAGsyq6eMKir0=
Date: Wed, 19 May 2021 12:02:35 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v2 7/7] target/ppc: wrapped some TCG only logic with ifdefs
Message-ID: <YKRxu6mcVAfQJUwo@yekko>
References: <20210518150515.57983-1-bruno.larsen@eldorado.org.br>
 <20210518150515.57983-8-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jkdN6aQlizKRNa2X"
Content-Disposition: inline
In-Reply-To: <20210518150515.57983-8-bruno.larsen@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jkdN6aQlizKRNa2X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 18, 2021 at 12:05:15PM -0300, Bruno Larsen (billionai) wrote:
> Wrapped some function calls in cpu_init.c, gdbstub.c, mmu-hash64.c and
> excp_helper.c that were TCG only with ifdef CONFIG_TCG, to support
> building without TCG.
>=20
> for excp_helper we also moved the function do_rfi higher in the file to
> reduce the ifdef count.

The description's no longer really accurate since some of the fixups
are no longer ifdef based.


> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/cpu_init.c    | 16 +++++---
>  target/ppc/excp_helper.c | 82 +++++++++++++++++++++++-----------------
>  target/ppc/mmu-hash64.c  |  8 ++++
>  3 files changed, 66 insertions(+), 40 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 88a8344eea..5ab4d4ef2b 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -1203,15 +1203,13 @@ static void register_BookE206_sprs(CPUPPCState *e=
nv, uint32_t mas_mask,
>      /* TLB assist registers */
>      /* XXX : not implemented */
>      for (i =3D 0; i < 8; i++) {
> -        void (*uea_write)(DisasContext *ctx, int sprn, int gprn) =3D
> -            &spr_write_generic32;
> -        if (i =3D=3D 2 && (mas_mask & (1 << i)) && (env->insns_flags & P=
PC_64B)) {
> -            uea_write =3D &spr_write_generic;
> -        }
>          if (mas_mask & (1 << i)) {
>              spr_register(env, mas_sprn[i], mas_names[i],
>                           SPR_NOACCESS, SPR_NOACCESS,
> -                         &spr_read_generic, uea_write,
> +                         &spr_read_generic,
> +                         (i =3D=3D 2 && (mas_mask & (1 << i)) &&
> +                         (env->insns_flags & PPC_64B))
> +                         ? &spr_write_generic : &spr_write_generic32,


Looks good.
>                           0x00000000);
>          }
>      }
> @@ -8605,11 +8603,13 @@ static void ppc_cpu_realize(DeviceState *dev, Err=
or **errp)
>          }
>      }
> =20
> +#ifdef CONFIG_TCG
>      create_ppc_opcodes(cpu, &local_err);
>      if (local_err !=3D NULL) {
>          error_propagate(errp, local_err);
>          goto unrealize;
>      }
> +#endif

In this instance, I think it would be cleaner to create a no-op stub
for create_ppc_opcodes() and destroy_ppc_opcodes() rather than using
ifdefs.

>      init_ppc_proc(cpu);
> =20
>      ppc_gdb_init(cs, pcc);
> @@ -8798,7 +8798,9 @@ static void ppc_cpu_unrealize(DeviceState *dev)
> =20
>      cpu_remove_sync(CPU(cpu));
> =20
> +#ifdef CONFIG_TCG
>      destroy_ppc_opcodes(cpu);
> +#endif
>  }
> =20
>  static gint ppc_cpu_compare_class_pvr(gconstpointer a, gconstpointer b)
> @@ -9296,7 +9298,9 @@ static void ppc_cpu_class_init(ObjectClass *oc, voi=
d *data)
>      cc->class_by_name =3D ppc_cpu_class_by_name;
>      cc->has_work =3D ppc_cpu_has_work;
>      cc->dump_state =3D ppc_cpu_dump_state;
> +#ifdef CONFIG_TCG
>      cc->dump_statistics =3D ppc_cpu_dump_statistics;
> +#endif
>      cc->set_pc =3D ppc_cpu_set_pc;
>      cc->gdb_read_register =3D ppc_cpu_gdb_read_register;
>      cc->gdb_write_register =3D ppc_cpu_gdb_write_register;
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 80bb6e70e9..a14b529722 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -19,9 +19,13 @@
>  #include "qemu/osdep.h"
>  #include "qemu/main-loop.h"
>  #include "cpu.h"
> +#ifdef CONFIG_TCG
>  #include "exec/helper-proto.h"
> +#endif

I don't like the look of ifdefs amongst the includes.  Generally the
headers themselves should be made safe (if unnecessary) to include for
!TCG builds.

>  #include "exec/exec-all.h"
> +#ifdef CONFIG_TCG
>  #include "exec/cpu_ldst.h"
> +#endif
>  #include "internal.h"
>  #include "helper_regs.h"

The remaining ifdef changes look fine.  Some it would be nice to clean
up better in future, but there's no rush.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jkdN6aQlizKRNa2X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCkcboACgkQbDjKyiDZ
s5KmIhAAs/wDzzu3w78XNqlA3grfzLJKPizWMuLQ4Mvrfj6v2HPiVQq4g0tgJThv
S0EuhhVZIzSy3n6RqqE6yK8qcUuYNA1wOF4f5hjJFiAhprwLPdsRP35HBVFXhqWA
+3sQRXDdnUbsysaCKsns8p73/lA/smUuTmYdsoBYKeZcl9Q9CSJEMzt6076xYD6S
lhw2hnNZzqHjByg6kCzCFqAlBJ1ZwJ2xt0SU3Al0OVJpzGF4krP8KUJjAG17iLKl
VCVPa1vaQBGK8ybGIv28eQgiCAL33Vw6g1lErtqI0JlsjAXkr8muVR4Z9+ovSrxz
3X34/AVnKSF2FwhJqxtJMm0XeAgxEEhS33d+LUZGoOmFWR4002etk3hAYhw2dKLh
+l+W3PCKpA9Tx4tXIqILw5jgLxbZqIETvy7RIn2UUqctk81TulBtpteSr6FVzhQS
kTHosTd4cQRkRZAMRBTXiYanVMDE11U8Z1anodm9rm4lzMQf0iurvy6IgMkI8bNO
Cjt/hbN0qN7swGPUzXMmgJfHiH1D+OzjYO1Qr6gBRGtvN05uU+k/a0dWL50iEr6d
1MkGCSGyAg3Qzbfsw+iMIUWIovnQu76U5NkHFpo1mgD57jHZksPLMeNAw+ztELJj
U+/Z+/ZxZjFZF+HyB4YTGzjtZ4FRwwgaczNsJp/QmtkiWbuOTbQ=
=qLtK
-----END PGP SIGNATURE-----

--jkdN6aQlizKRNa2X--

