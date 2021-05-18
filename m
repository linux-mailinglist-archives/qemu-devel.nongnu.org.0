Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C8D386F7A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:41:01 +0200 (CEST)
Received: from localhost ([::1]:34896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liojE-0007bM-4k
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeG-0006tr-Su; Mon, 17 May 2021 21:35:52 -0400
Received: from ozlabs.org ([203.11.71.1]:51215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeF-00072N-1G; Mon, 17 May 2021 21:35:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fkdqc1nMpz9sXM; Tue, 18 May 2021 11:35:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621301740;
 bh=MzWr3FqMfCzc9OsEa/yN1KT6DC/H5613G05P1QrOzyw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kWa1O+tEsX95qRHR2D/yoPZYyXx4fOe26fOij4LgYJNk1YaL68bRsq8m+UNDCr64P
 DxhbZOWeOPu5AJn0z/5sHYyQKAk2xb2TO5lC6GgyubpwSoXUX5nhSfxVHNcuYgZiS0
 i5EUQAFasUp5Xxw0ZNYr3/T5bo44bjmkx4gBSoM4=
Date: Tue, 18 May 2021 10:19:46 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v5 06/23] target/ppc: Tidy exception vs exit_tb
Message-ID: <YKMIIr/o8iQzVm5i@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-7-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gxt0vx/ieF8QzKU+"
Content-Disposition: inline
In-Reply-To: <20210517205025.3777947-7-matheus.ferst@eldorado.org.br>
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


--gxt0vx/ieF8QzKU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:50:08PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> We do not need to emit an exit_tb after an exception,
> as the latter will exit via longjmp.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/translate.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 05e3c0417a..e68152810e 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -4648,8 +4648,9 @@ static void gen_lookup_and_goto_ptr(DisasContext *c=
tx)
>          } else if (sse & (CPU_SINGLE_STEP | CPU_BRANCH_STEP)) {
>              uint32_t excp =3D gen_prep_dbgex(ctx);
>              gen_exception(ctx, excp);
> +        } else {
> +            tcg_gen_exit_tb(NULL, 0);
>          }
> -        tcg_gen_exit_tb(NULL, 0);
>      } else {
>          tcg_gen_lookup_and_goto_ptr();
>      }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gxt0vx/ieF8QzKU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjCCIACgkQbDjKyiDZ
s5KNshAAtYXJxtYaLO6a5dbMUdIm3Op28XboQ4c+y+Lo7WB+LFKfNVrWk7kEO+5U
qMQmarghlicNbaIyIaaDPc6fo8LA8r3uqahUt186WsbZBOcM9MIOk7bs/OHBwJ+q
R8S4RoD43bdxP8kVORLUWNF+rX8GeNMMXuHNIjtV7nMoXZNltQuVVEt3LIHNIkh9
4tS5YpqMeu7Li8tXkK91rnFE/xcwKxW3XrlMeN7hadx6ktA7QqJb9rATD113+Kzc
x08O9wgvUnGam27wveSmFdf+5HEAHfQb1cNENHujZm/E0DGOy/VQm7D+j8yhqeSk
Y3M6xkhXfqzEBVFCgmxmbvzoyG1sVuWlNZ913mhg0I2UmhsnEooyZqe9TcekGvgK
+kmfrqPG4OsRh9zSTj6Nok4Ix/TNDIluw9evjwWU+XVOZWUL6b6QDlW2xO/SdkNM
uG4SH4uI0ruphUHBLcl9iZ0bgcSqwv7ji59by7+jktxFk1XP9+vvARubcZmP4ysA
e3RvqTEqWSILTQ+NqWwrvOOI1LoWt7RV8wuocAFfYOq+gnAkX7qVO+55XBxWDXyh
BbI4ZzsVoXVnkMOJNhL9eeJEc7V1/XZsiDUjl55dNlKFwtS4hzgAu4M/qADhZG3b
6zquGEtHtCgzPBTt+5R/GZ20zIUdBEXhYqjsvxYWh3nrjiKp3jI=
=/O2g
-----END PGP SIGNATURE-----

--gxt0vx/ieF8QzKU+--

