Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F3B3437DB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 05:19:57 +0100 (CET)
Received: from localhost ([::1]:56990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOC2l-0005OM-3t
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 00:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBv9-0006PV-4y; Mon, 22 Mar 2021 00:12:03 -0400
Received: from ozlabs.org ([203.11.71.1]:59139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBv3-0004kO-57; Mon, 22 Mar 2021 00:11:59 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3gzz1hPnz9sWr; Mon, 22 Mar 2021 15:11:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616386303;
 bh=BZA6aPxj+hQD/Q4Q1CtKRWc79z4Imn5hwZaC0sr3raA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BAhSFdj//mostf3JR/MDKvTmjf6EDkH1cUUZyigUbvsgeOap9Fs7jzsx7I/dWYi+k
 kIDu4sfEdSRGNxP88PlNonHTI4suolotpL++hBpEVyBfnoYXQNgsmid3DIoHjmCkb8
 bL9z/sx8nHI9CLlvOMN6PF+3QBmd4jqnaG5+yspQ=
Date: Mon, 22 Mar 2021 14:42:44 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 06/17] target/ppc: Fix comment for MSR_FE{0,1}
Message-ID: <YFgSNPFsdZXJl5Af@yekko.fritz.box>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-7-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QITrqQq6QLYlGzhK"
Content-Disposition: inline
In-Reply-To: <20210315184615.1985590-7-richard.henderson@linaro.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--QITrqQq6QLYlGzhK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 12:46:04PM -0600, Richard Henderson wrote:
> As per hreg_compute_hflags:
>=20
>   We 'forget' FE0 & FE1: we'll never generate imprecise exceptions
>=20
> remove the hflags marker from the respective comments.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.0, thanks.

> ---
>  target/ppc/cpu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 79c4033a42..fd13489dce 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -322,13 +322,13 @@ typedef struct ppc_v3_pate_t {
>  #define MSR_PR   14 /* Problem state                                  hf=
lags */
>  #define MSR_FP   13 /* Floating point available                       hf=
lags */
>  #define MSR_ME   12 /* Machine check interrupt enable                   =
     */
> -#define MSR_FE0  11 /* Floating point exception mode 0                hf=
lags */
> +#define MSR_FE0  11 /* Floating point exception mode 0                  =
     */
>  #define MSR_SE   10 /* Single-step trace enable                     x hf=
lags */
>  #define MSR_DWE  10 /* Debug wait enable on 405                     x   =
     */
>  #define MSR_UBLE 10 /* User BTB lock enable on e500                 x   =
     */
>  #define MSR_BE   9  /* Branch trace enable                          x hf=
lags */
>  #define MSR_DE   9  /* Debug interrupts enable on embedded PowerPC  x   =
     */
> -#define MSR_FE1  8  /* Floating point exception mode 1                hf=
lags */
> +#define MSR_FE1  8  /* Floating point exception mode 1                  =
     */
>  #define MSR_AL   7  /* AL bit on POWER                                  =
     */
>  #define MSR_EP   6  /* Exception prefix on 601                          =
     */
>  #define MSR_IR   5  /* Instruction relocate                             =
     */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QITrqQq6QLYlGzhK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYEjQACgkQbDjKyiDZ
s5KtzA/+LQNIlCQUAFPalZzevmdWY6QrGyd2JgGzWS3tNzx0pn44/jnee8kx5AnX
p4T/BcJ+orCwGScZD4yuEzXNgSIZGKtyTiKGi+PpKz6Vv7Mw7mZsqbivtvvZckk1
0sJCejy6RM65m0x7dLWWOhpFwbCNCTH4ZRqZ29jVFITpOlB5Qj1w1ytPsO005fcy
bz35uoFyTBRIX2TIzZMHhN+mYrtyrcFXoNN+IPiJ1B89+o8lQKkPyry2Miqjmyyb
8te9en9TAIi5+T8wbAo3TRjtpPfV4t6ijPdow6fbKradlUNH+qxoRgJmUoloO1Wg
Rb6LDjJMkR8WJP3XDkgEqFwOzWGM1aovk+vnGwGe4DM8aU1lidfFIHGGKYs+g91Z
xBqSViyZGz3aX7bqikwxRq1mlBf/fZ5+6FwXtBFbB39fObjvSl+hBdPdi2TFAD4E
wblbdyJJScGNcjPhiCFJ6fvDQOGKKHdgmz0+8t3WpH4qgHGGRYv4WO3OWXnrCIgD
yXYh5Bbl2zau0LNbUrud5Ks2cscOCyf0N73PU5NHnkT2cIf7ya7NOtrSSZbyGOlO
8x1GhdX9XtddeHFyginmWz0//OdR5eHzbVUnNQ+Pk5pfplNe+d4DqKm/9oyY6s8w
YNr/OEFywG+fH/9PwdeFGVWtOITy9MGjVq6+ZGGrxM8i1+RBg7M=
=pcCp
-----END PGP SIGNATURE-----

--QITrqQq6QLYlGzhK--

