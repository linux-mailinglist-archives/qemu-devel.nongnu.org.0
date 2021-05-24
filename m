Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9D438DF8D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 05:09:00 +0200 (CEST)
Received: from localhost ([::1]:47424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll0xf-0000MF-56
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 23:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll0sV-0008BX-Ri; Sun, 23 May 2021 23:03:40 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59475 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll0sS-0000ZY-C4; Sun, 23 May 2021 23:03:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FpMV42sY8z9sVb; Mon, 24 May 2021 13:03:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621825404;
 bh=6f/vvhJBGZcf0gASi/QDaJ7eEmx88o+LUBx05Bmw5oA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LT3/2f5dsn3IaiothOZtrgnCsHxGj5MumuGTSIOn1n4Mx3DWU+yyzOu/zA0qFzYUO
 98JfEzdN1BshJjJaWljzR8SOaLg6ruSYyxHtzB+9+qG2UWoE1gD5/SkXReG08QWlZS
 1ewFOWk6xDYTO88OHZsDEq5icUHp9wsDJAVeHbgQ=
Date: Mon, 24 May 2021 12:36:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v3 1/9] target/ppc: cleaned error_report from
 ppc_store_sdr1
Message-ID: <YKsRLC0CCn0DGJKR@yekko>
References: <20210521201759.85475-1-bruno.larsen@eldorado.org.br>
 <20210521201759.85475-2-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZoeWLD2RoB0zxWKq"
Content-Disposition: inline
In-Reply-To: <20210521201759.85475-2-bruno.larsen@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ZoeWLD2RoB0zxWKq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2021 at 05:17:51PM -0300, Bruno Larsen (billionai) wrote:
> Changed how the function ppc_store_sdr1, from error_report(...) to
> qemu_log_mask(LOG_GUEST_ERROR, ...).
>=20
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/cpu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
> index d957d1a687..9cf3288b7a 100644
> --- a/target/ppc/cpu.c
> +++ b/target/ppc/cpu.c
> @@ -77,13 +77,13 @@ void ppc_store_sdr1(CPUPPCState *env, target_ulong va=
lue)
>          target_ulong htabsize =3D value & SDR_64_HTABSIZE;
> =20
>          if (value & ~sdr_mask) {
> -            error_report("Invalid bits 0x"TARGET_FMT_lx" set in SDR1",
> -                         value & ~sdr_mask);
> +            qemu_log_mask(LOG_GUEST_ERROR, "Invalid bits 0x"TARGET_FMT_lx
> +                     " set in SDR1", value & ~sdr_mask);
>              value &=3D sdr_mask;
>          }
>          if (htabsize > 28) {
> -            error_report("Invalid HTABSIZE 0x" TARGET_FMT_lx" stored in =
SDR1",
> -                         htabsize);
> +            qemu_log_mask(LOG_GUEST_ERROR, "Invalid HTABSIZE 0x" TARGET_=
FMT_lx
> +                     " stored in SDR1", htabsize);
>              return;
>          }
>      }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ZoeWLD2RoB0zxWKq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCrESYACgkQbDjKyiDZ
s5Imng//bgDU83bIG6LL5VBh/1CWNIYeRu4dY75YRSLGn1Eys5E0O8IyNqGGwT4+
MlGyhXHf8gzbGmOvyTDhsPMTM8Tz6oO0S38CG1bOlb4IZd9qf7VBHFessx+IPxZE
tCcTQnLbafKLM+Q9x6dfA8Y8jdvU3wPXX3wkRT/rLlOrSVaPF/n9NA8BjP4Pv/R6
iUvuOhOgvx570tWWd93+nKXbMkLKlD3mHzR+pP2m7X5A8rIP2rDz6nwijXOeVkjC
Q0ZZdRZelSecVx4Y/vwpMHVeiwiYkSTjnZUrkDhBz2DNXAUR3HqbUD9jRP+mh4UI
CRCbrHasdc5URPRNVkFLKX7A3kyA0e5KS+Hv3aWcrmaB4KvQh1ainww89MR1fJrK
8AKsHp6cS4GTptA4eLAPKXKI0h6GcsxVN5wBOlF/zhSXAmKarMJPsAvGlW96W8t+
0F1iEftNtrsersuj/si810zjcl+qm8kGNOzgLDf4zxYHOUNxhRBLCLiQKXRR3iSf
esaD6fXyU5ReMNMgoBGwXxqo8QzLHd7hFctr8CDtOCXAN+Mv4/c8JfhblbE3/qBV
I9sWbPyeCCyq24nijNqOMYGAshJaG6/zQ71Wv2muMQyT/wyyMD2fogmb6ZL7UHJq
xx+O7/zpy4Sg1amYwfiuyFEnGi9H+hlR/8xc4Um/manfYIWOsAA=
=6O3/
-----END PGP SIGNATURE-----

--ZoeWLD2RoB0zxWKq--

