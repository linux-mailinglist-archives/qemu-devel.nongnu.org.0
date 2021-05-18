Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA13386FA0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:51:20 +0200 (CEST)
Received: from localhost ([::1]:41700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liotD-0005o4-J8
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeP-00073Q-5V; Mon, 17 May 2021 21:36:01 -0400
Received: from ozlabs.org ([203.11.71.1]:50907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeM-00078W-Cm; Mon, 17 May 2021 21:36:00 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fkdqf5jFvz9ssP; Tue, 18 May 2021 11:35:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621301742;
 bh=ywJM+WGmL6UxgxTO7EQI6agAkg+Xq22gO9cJMjqpalU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fYA8fl7HBexOVyK0xcZm2E2JwzKx1dISh+BkofZ49CsR6UMT9AC2ydtL6+gBjgFQu
 WXSJ4EKHA9KR9LsZG/tETGC42vt3+Nc7Jugxbag4Hmn5tLFWl+wUUHj9Qd+lAeyf1d
 7cngY724KurOwM0ItIb1UzTy64GThKiJ0pi7IxVk=
Date: Tue, 18 May 2021 10:37:26 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v5 14/23] TCG: add tcg_constant_tl
Message-ID: <YKMMRoeseymxWTI8@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-15-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MwwuRmysXgI+u6Xx"
Content-Disposition: inline
In-Reply-To: <20210517205025.3777947-15-matheus.ferst@eldorado.org.br>
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MwwuRmysXgI+u6Xx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:50:16PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> Used in D/DS/X-form load/store implementation.
>=20
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  include/tcg/tcg-op.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
> index 2cd1faf9c4..ef8a008ea7 100644
> --- a/include/tcg/tcg-op.h
> +++ b/include/tcg/tcg-op.h
> @@ -1096,6 +1096,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCG=
Arg offset, TCGType t);
>  #define tcg_gen_sextract_tl tcg_gen_sextract_i64
>  #define tcg_gen_extract2_tl tcg_gen_extract2_i64
>  #define tcg_const_tl tcg_const_i64
> +#define tcg_constant_tl tcg_constant_i64
>  #define tcg_const_local_tl tcg_const_local_i64
>  #define tcg_gen_movcond_tl tcg_gen_movcond_i64
>  #define tcg_gen_add2_tl tcg_gen_add2_i64
> @@ -1209,6 +1210,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCG=
Arg offset, TCGType t);
>  #define tcg_gen_sextract_tl tcg_gen_sextract_i32
>  #define tcg_gen_extract2_tl tcg_gen_extract2_i32
>  #define tcg_const_tl tcg_const_i32
> +#define tcg_constant_tl tcg_constant_i32
>  #define tcg_const_local_tl tcg_const_local_i32
>  #define tcg_gen_movcond_tl tcg_gen_movcond_i32
>  #define tcg_gen_add2_tl tcg_gen_add2_i32

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MwwuRmysXgI+u6Xx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjDEYACgkQbDjKyiDZ
s5LX+w//SH6BwSXak7bQDYb7Io84428y5llkqn+UiLkLYcoGh4K9YLEaMIZhZotW
s5dK+Hpb/H/CrDKGxenG58YDRS5znQhkgSkfymYH3a/v4HNNXC/dfO9AbiQkLbI+
8G8QMKEL9FOPBYZLVG0HXL5JvPZGL/fpXA28Y6e6ENiX/1qwQbG9Vpq13LgDqfXI
Ya+/chiFbBa+2HfQgKK4rycoKzT8rA3xZn06136DxgzHz6L83sv441QfQPqeqppC
Ak1LwPkxf5XDLE5vbNRVSdd0kY4PP4zT6LSnxtqciuBHERpmcAZlnV3s0492FHLC
InEGgmxAMAIEwOGLI45IrxT+Ai1X0zpMwaxd1SjrYafEDC95jSVCr4Khcb8XVG4P
XlKnuBdRpzlDAZnhE+QLsYvxD2f1zIA1SEJXDF5jmIMJZBELYzI35LsBI/oQmV/p
wYN5PFWGQu3zQIm8AJu6KAOf17zXhb0tvNcZbFOC2oiezbA42YK16gFEifeq1DUF
aY42g4HV3zkCAhRN+4GTWN6x6u3otYeh+8UFtIutFemjnfpunbuhj9PU+wEHF4iS
7IoCTpE1NtVi6+cbt/sOmMpGh3L6LSMQG9qtKzINnzPTOT2dJVlKv55H+mYXpqNf
PwBjhYwZteRcvxYdfjh3bJkRWQdgioGHAyOEzv75zqKhrAI8uYc=
=MRft
-----END PGP SIGNATURE-----

--MwwuRmysXgI+u6Xx--

