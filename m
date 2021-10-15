Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9924742E724
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 05:14:47 +0200 (CEST)
Received: from localhost ([::1]:39620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbDgE-0003cG-K1
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 23:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mbDck-0001pR-Kv; Thu, 14 Oct 2021 23:11:11 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:47241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mbDch-0005Wk-Qy; Thu, 14 Oct 2021 23:11:10 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HVrrG3dPSz4xbQ; Fri, 15 Oct 2021 14:10:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634267454;
 bh=ASLcjvYpw9HSJ6ITyl3RxW4G+1gXmWdFfp4TxijfFaE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V4NHlHNBD8cpN0+00fmH8eQ2Nrk9lac1b24uAASaVlup19am9GS+4jDvIg1wWDKI3
 MXtkNkUXKbTJeEcRsCou/K5xBWI4VhY76c9GjmF4I+Csm3m9n50jMdlwZU6+gtjv70
 K2hl+xtOjv1Dp2AsOtjrz7AimytCcOcumBrruhig=
Date: Fri, 15 Oct 2021 11:31:25 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH 2/4] target/ppc: Fix XER access in gdbstub
Message-ID: <YWjL3ac3SvxAPYgl@yekko>
References: <20211014223234.127012-1-matheus.ferst@eldorado.org.br>
 <20211014223234.127012-3-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BY3929yT1+nlHQlE"
Content-Disposition: inline
In-Reply-To: <20211014223234.127012-3-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: laurent@vivier.eu, richard.henderson@linaro.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--BY3929yT1+nlHQlE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 07:32:32PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> The value of XER is split in multiple fields of CPUPPCState, like
> env->xer and env->so. To get/set the whole register from gdb, we should
> use cpu_read_xer/cpu_write_xer.
>=20
> Fixes: da91a00f191f ("target-ppc: Split out SO, OV, CA fields from XER")
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.2.

> ---
>  target/ppc/gdbstub.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
> index 1808a150e4..105c2f7dd1 100644
> --- a/target/ppc/gdbstub.c
> +++ b/target/ppc/gdbstub.c
> @@ -159,7 +159,7 @@ int ppc_cpu_gdb_read_register(CPUState *cs, GByteArra=
y *buf, int n)
>              gdb_get_regl(buf, env->ctr);
>              break;
>          case 69:
> -            gdb_get_reg32(buf, env->xer);
> +            gdb_get_reg32(buf, cpu_read_xer(env));
>              break;
>          case 70:
>              gdb_get_reg32(buf, env->fpscr);
> @@ -217,7 +217,7 @@ int ppc_cpu_gdb_read_register_apple(CPUState *cs, GBy=
teArray *buf, int n)
>              gdb_get_reg64(buf, env->ctr);
>              break;
>          case 69 + 32:
> -            gdb_get_reg32(buf, env->xer);
> +            gdb_get_reg32(buf, cpu_read_xer(env));
>              break;
>          case 70 + 32:
>              gdb_get_reg64(buf, env->fpscr);
> @@ -269,7 +269,7 @@ int ppc_cpu_gdb_write_register(CPUState *cs, uint8_t =
*mem_buf, int n)
>              env->ctr =3D ldtul_p(mem_buf);
>              break;
>          case 69:
> -            env->xer =3D ldl_p(mem_buf);
> +            cpu_write_xer(env, ldl_p(mem_buf));
>              break;
>          case 70:
>              /* fpscr */
> @@ -319,7 +319,7 @@ int ppc_cpu_gdb_write_register_apple(CPUState *cs, ui=
nt8_t *mem_buf, int n)
>              env->ctr =3D ldq_p(mem_buf);
>              break;
>          case 69 + 32:
> -            env->xer =3D ldl_p(mem_buf);
> +            cpu_write_xer(env, ldl_p(mem_buf));
>              break;
>          case 70 + 32:
>              /* fpscr */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BY3929yT1+nlHQlE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFoy90ACgkQbDjKyiDZ
s5IG9Q/9Exxx6M1R4G+AmIM9JDA4OlFa2FhboMon2gJplQxDXHn5bIzXWAVin7+5
uRW60ibJc5H8gg4cE1U7E0sw1eq+aOan2tq5pF98VdcG0z00Yy1W36NEp+7BZRN9
iJEaU6WeybveXVPHa1z+nuPRKYiH5Zvj+q/qrIv2tQnpaQuFmQxMDI8tPSSGp2px
5RSj0Q9EkSYiABFjv+copizwZiFHe0i6eFNklFxPVTiiDhr9XVx1EoMtapEd9FSe
bUMz8k/ZN0QEPWXWPldnv6tACvY0dEvEOVFhPakLmbr2wXH1e4DPJmJKLOu+Ehx6
VQah+GMEgevcKsXItE8u+y3vmFSgXHiM64Mm0eMLn9wQ8GGoe3AMmTqPFfsTJA5W
VqS6fn0h5g0XBeGzu0gogpiGTPv90wKDGE1x3IAcKGwoOcG6OjuLyVa4DYo5gX87
ukNcmMJtDxpUWLgw82taAIipYnu5tOmyMk1OMAcWmRjhXaKN4r9bWbLQrh5khTbw
j1agJ/y3QqCDUDhKdNn+DtFDmWksMCpoUXpYMAz1ZObeyBUVpXFd31fEMFaZz68q
g+me8SYyK0i9IHlrlsgoKKnNGpuEBfj7XJryfFoGKnuvbizo1SpP2Jn333sdR/zi
G338H4hhVpesN/DY+SlCLeh4spqVqP3eKBgYsoaSaLd76Ccz8L0=
=4Gt7
-----END PGP SIGNATURE-----

--BY3929yT1+nlHQlE--

