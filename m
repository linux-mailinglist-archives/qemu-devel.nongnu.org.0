Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0830386F79
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:41:00 +0200 (CEST)
Received: from localhost ([::1]:34822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liojD-0007Xt-Oy
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeH-0006vM-IT; Mon, 17 May 2021 21:35:53 -0400
Received: from ozlabs.org ([203.11.71.1]:43039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeF-00072O-BP; Mon, 17 May 2021 21:35:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fkdqc0857z9sXH; Tue, 18 May 2021 11:35:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621301740;
 bh=Uy0uswwwruB+0y2AT74oP44/bAcZU07cICvsoZ6nCwM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DdrY2aTxvLc2TW4JiiLXASAVp4hi1uTcIJAyhXkyj/dYf72oMTaUTCalFqtkeNzl0
 Zpo0Q8EmsWJOG7/qLugknUVKJmPBbhuAg6LW2Z/ua5hFeCC0zg+SHZa1ld0kU8PXW7
 /kOxbY9qjmWZjG7FDFXciGzUrTqSfYzI0uTqNyTA=
Date: Tue, 18 May 2021 10:20:15 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v5 07/23] target/ppc: Mark helper_raise_exception* as
 noreturn
Message-ID: <YKMIP28+XlSy/Nar@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-8-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wmyx+uA3WLnCCFhP"
Content-Disposition: inline
In-Reply-To: <20210517205025.3777947-8-matheus.ferst@eldorado.org.br>
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


--wmyx+uA3WLnCCFhP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:50:09PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/helper.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 513066d54d..ea9f2a236c 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -1,5 +1,5 @@
> -DEF_HELPER_FLAGS_3(raise_exception_err, TCG_CALL_NO_WG, void, env, i32, =
i32)
> -DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, void, env, i32)
> +DEF_HELPER_FLAGS_3(raise_exception_err, TCG_CALL_NO_WG, noreturn, env, i=
32, i32)
> +DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, i32)
>  DEF_HELPER_FLAGS_4(tw, TCG_CALL_NO_WG, void, env, tl, tl, i32)
>  #if defined(TARGET_PPC64)
>  DEF_HELPER_FLAGS_4(td, TCG_CALL_NO_WG, void, env, tl, tl, i32)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wmyx+uA3WLnCCFhP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjCD8ACgkQbDjKyiDZ
s5JBTA//TEPdtSTZKSarevY5YV6MfyFMnujU5hTR6Ip+hSCrk9tv1Yqnzn2udquD
PEF0sJoQoV4mnE3HxtOJuPZ0OGbLjW8r5x3R8WTCQrSU6MwY/34ynTANFdPw4/Z3
DdLCKzsCMFhUzNfPTjMjMcjpzYoJ0WLVjGW0cShGHy33Ax4JWS9V2hdUXb8cIaa3
gritVVSu2NZGZCwz0SRHKfKbk/hBfFrpE8LJUzdcAKcTMCLGkgoSi9Bs/ehKttFp
vdIT0hgb5Cphzo4MeM03bY52UOcjtFQzdIhOEWX8kkLjM8gzSD6QZmDAA/bAZPOr
v8/9n+pROfid2DCtUPnsK6xyocVs24xXXcpz05Slr5jkaHE+HWLNMQo2i+UOkknC
EoDoQAiQJq/yEEmzK42xUT6mOmsOy+Vu4YHzu9lT3JHDnudOxee+FrZdKO/8QVqC
7WIGz1ySAvgV7dFBZESjj6P2pX4nqyyPBFnyTWQD/TGcTlBBfMAWCQj5GPY02RD3
4mR1vwSr5RfqEVUOavA/Iyv0jo7T67qwXeOCNUjTC89slrwqYX0Gjl357TbeUc74
W4EOeSMQV0fL9nXXFGIf/fT8w0DzEZHHtZOrZhTTfxhMaciHUaIxzN3jElFcR9w5
28LFapjw0hIUvzfABr7kpZ7CBfvmqIwgX8MbRMh/OYHx4y0RL0s=
=dEXw
-----END PGP SIGNATURE-----

--wmyx+uA3WLnCCFhP--

