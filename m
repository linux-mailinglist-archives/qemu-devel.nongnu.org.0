Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA0B37F261
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 06:39:22 +0200 (CEST)
Received: from localhost ([::1]:56742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh385-0001GM-CU
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 00:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sf-0007O2-V5; Thu, 13 May 2021 00:23:27 -0400
Received: from ozlabs.org ([203.11.71.1]:57723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sa-0004fS-KZ; Thu, 13 May 2021 00:23:24 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgdms6ckbz9t54; Thu, 13 May 2021 14:22:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620879773;
 bh=5N7XsWlkCLuQgejGDlU63s1Nn4bann8om2Bx159n2cw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DTa4mayB2sZunr9t2gbDoYWM60ArhLtMUp2K+bZtP0ihMcl5ZCjapTAiZ7vQKIbtd
 FV8hteqB1w4HmXxIp0Lq8wbDVSpqqN4GztW1ILOnXBsXkUYq8Hg/VE4LVWI2K13peT
 thicwLRaREjr4+pYpzMB6FISUORncMnAFWQvPL2k=
Date: Thu, 13 May 2021 14:07:17 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v4 05/31] target/ppc: Remove special case for
 POWERPC_EXCP_TRAP
Message-ID: <YJyl9Sy8/Zzmfdg3@yekko>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
 <20210512185441.3619828-6-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dCuqAPnBEdEq2X6c"
Content-Disposition: inline
In-Reply-To: <20210512185441.3619828-6-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--dCuqAPnBEdEq2X6c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 03:54:15PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> Since POWERPC_EXCP_TRAP is raised by gen_exception_err,
> we will have also set DISAS_NORETURN.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/translate.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 2303bf259a..23de04a08e 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -9416,7 +9416,6 @@ static void ppc_tr_translate_insn(DisasContextBase =
*dcbase, CPUState *cs)
>      /* Check trace mode exceptions */
>      if (unlikely(ctx->singlestep_enabled & CPU_SINGLE_STEP &&
>                   (ctx->base.pc_next <=3D 0x100 || ctx->base.pc_next > 0x=
F00) &&
> -                 ctx->exception !=3D POWERPC_EXCP_TRAP &&
>                   ctx->exception !=3D POWERPC_EXCP_BRANCH &&
>                   ctx->base.is_jmp !=3D DISAS_NORETURN)) {
>          uint32_t excp =3D gen_prep_dbgex(ctx);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dCuqAPnBEdEq2X6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCcpfUACgkQbDjKyiDZ
s5KlYhAAyyEHm/PtW6hMc6REircewBPiUBDfaucmRPZoU4F0qffogWrEsKHi/T5R
hmzIZ3bZ8BOrndW0FZLl2RowkRUAh9JnwyZvwmH5ceKgcvqfyxUYAZYp7+Jcu/W4
lA6tTBnDukhwpOaknMKQUaWT3iAiXoGrBXxUUOfNpE52tGwcAsW5MYND9nZ3wciK
SDkM3zQqRrt3QNR5vvivda4IapoPD1CgT23nXCkIdGBFBfZhnIGtI6QuZakwoHyl
zY9IwMmPamhGD3i/pMNvAMWSJzzqshPJrlBfOYfDj/4V+IYA3KVCZvCBHmELT7/V
u8UQ0wbjIl738ke9wfEBjlj4MKMjpS1GvULHYcXIT3WLR28cdT420qv7s/nhXFaF
cTvm35Ppnb+DOBPzAG99erNMvtYBJP/gH82Rjkn3ziNOz1KFsGCiywyhmpmSKk7c
8YzmZdH6LiHDmaAvXevoWZV0CAQzTGvQdtn9IPGdtl0ALFiMGAZl+duOxT81J4cC
37raoj6TyaWzGDucJRykIPKun2Z6EjTfwADe2YyNklAuOCTCgEgpQ91jguXz5L3y
fD9kQqFiZg/IU3FCYWlq1vBSwbwOIu7sNd//rVUxOS79R4y1/7ChArdF8c3CM7Ac
cvhEXS+qBb6ay9tZSNfLMsfkr5rnaXJRzbKLe85aYxj+QTd+qcM=
=YmgP
-----END PGP SIGNATURE-----

--dCuqAPnBEdEq2X6c--

