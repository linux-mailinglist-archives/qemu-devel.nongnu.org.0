Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE5B2D948D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 10:06:33 +0100 (CET)
Received: from localhost ([::1]:53826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kojoO-0006iz-8T
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 04:06:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kojjD-0002Ez-0x; Mon, 14 Dec 2020 04:01:12 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:57043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kojj6-0006u3-RX; Mon, 14 Dec 2020 04:01:10 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cvb2z3PbWz9sT6; Mon, 14 Dec 2020 20:00:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607936459;
 bh=NbuEKuXjRdgug3CdB4NoJggC7mCYXvxx+WTMul/93Is=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WtEQRcg+lI2Tu9ohnoVP92d15YdTUgKzW50UvMU4+TKV1hewXlQY+dmQb8u3e1L2Z
 ajncs7QAqwC6DVtVXA1s6qe/0fGzmSZfcQHHp2pEShiVkNgUWfat+xfVYHNTHWxagO
 yp3mqeKUkFk2xNGO2Ns3vs/Hcg2UTvJzxvXDiiJo=
Date: Mon, 14 Dec 2020 16:43:08 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/8] hw/ppc/ppc4xx_devs: Make code style fixes to UIC code
Message-ID: <20201214054308.GB4717@yekko.fritz.box>
References: <20201212001537.24520-1-peter.maydell@linaro.org>
 <20201212001537.24520-2-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Content-Disposition: inline
In-Reply-To: <20201212001537.24520-2-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 12, 2020 at 12:15:30AM +0000, Peter Maydell wrote:
> In a following commit we will move the PPC UIC implementation to
> its own file in hw/intc. To prevent checkpatch complaining about that
> code-motion, fix up the minor style issues first.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/ppc/ppc4xx_devs.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
>=20
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index f1651e04d9a..f2f9ca4ffec 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -105,7 +105,7 @@ struct ppcuic_t {
>      qemu_irq *irqs;
>  };
> =20
> -static void ppcuic_trigger_irq (ppcuic_t *uic)
> +static void ppcuic_trigger_irq(ppcuic_t *uic)
>  {
>      uint32_t ir, cr;
>      int start, end, inc, i;
> @@ -156,26 +156,28 @@ static void ppcuic_trigger_irq (ppcuic_t *uic)
>      }
>  }
> =20
> -static void ppcuic_set_irq (void *opaque, int irq_num, int level)
> +static void ppcuic_set_irq(void *opaque, int irq_num, int level)
>  {
>      ppcuic_t *uic;
>      uint32_t mask, sr;
> =20
>      uic =3D opaque;
> -    mask =3D 1U << (31-irq_num);
> +    mask =3D 1U << (31 - irq_num);
>      LOG_UIC("%s: irq %d level %d uicsr %08" PRIx32
>                  " mask %08" PRIx32 " =3D> %08" PRIx32 " %08" PRIx32 "\n",
>                  __func__, irq_num, level,
>                  uic->uicsr, mask, uic->uicsr & mask, level << irq_num);
> -    if (irq_num < 0 || irq_num > 31)
> +    if (irq_num < 0 || irq_num > 31) {
>          return;
> +    }
>      sr =3D uic->uicsr;
> =20
>      /* Update status register */
>      if (uic->uictr & mask) {
>          /* Edge sensitive interrupt */
> -        if (level =3D=3D 1)
> +        if (level =3D=3D 1) {
>              uic->uicsr |=3D mask;
> +        }
>      } else {
>          /* Level sensitive interrupt */
>          if (level =3D=3D 1) {
> @@ -188,11 +190,12 @@ static void ppcuic_set_irq (void *opaque, int irq_n=
um, int level)
>      }
>      LOG_UIC("%s: irq %d level %d sr %" PRIx32 " =3D> "
>                  "%08" PRIx32 "\n", __func__, irq_num, level, uic->uicsr,=
 sr);
> -    if (sr !=3D uic->uicsr)
> +    if (sr !=3D uic->uicsr) {
>          ppcuic_trigger_irq(uic);
> +    }
>  }
> =20
> -static uint32_t dcr_read_uic (void *opaque, int dcrn)
> +static uint32_t dcr_read_uic(void *opaque, int dcrn)
>  {
>      ppcuic_t *uic;
>      uint32_t ret;
> @@ -220,13 +223,15 @@ static uint32_t dcr_read_uic (void *opaque, int dcr=
n)
>          ret =3D uic->uicsr & uic->uicer;
>          break;
>      case DCR_UICVR:
> -        if (!uic->use_vectors)
> +        if (!uic->use_vectors) {
>              goto no_read;
> +        }
>          ret =3D uic->uicvr;
>          break;
>      case DCR_UICVCR:
> -        if (!uic->use_vectors)
> +        if (!uic->use_vectors) {
>              goto no_read;
> +        }
>          ret =3D uic->uicvcr;
>          break;
>      default:
> @@ -238,7 +243,7 @@ static uint32_t dcr_read_uic (void *opaque, int dcrn)
>      return ret;
>  }
> =20
> -static void dcr_write_uic (void *opaque, int dcrn, uint32_t val)
> +static void dcr_write_uic(void *opaque, int dcrn, uint32_t val)
>  {
>      ppcuic_t *uic;
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/W+2sACgkQbDjKyiDZ
s5Io1RAAuRA62sP+bDZRSzp6b7FGvlTDmtvMnRLLJr9ygch4vVpdYtmNf6ZpMxyP
AzewfY1M0g7tTtGCfy5JsLrByBEHppH/IXo0hCUe3gocW1D+1X33TwBVkQmCxQM4
+iSMrs49OPrEoc7CC89sPA3V0D5iBoDJiPP4ZvS8dYCzjvUaOKio5r+xiBt/mxG8
X288EE28mqHC21zqDSYTBYjDKnwDN7HsizKXInRtEcK2hZOjo6VWnbrKSQHICPBc
m8x2c3GYsttOJ8HdFRGkMeYJcvOckZelqHTyRUzuQEd7ry90sjiBxxBF3hY4W8SE
9dccBD/O9eIXklMNjtA7Y89L9RnYgvwv4rBVyWBLjvw1IiEqmWgvtXxki2c2XR9G
J+JZFqsgQJpv/DWq76rVYHTRQMsp1IL5OcZQW4LDCw9iibJ01yels7JVfFBtjDpx
cSRt2ZWKCbU1MTF25bqa69bIi81SWNKpfhO3350USoFaLPBYvLOva0KBRqLo/vYT
N6TMx229FhBXP38A7k+AFPAmW3REjDVVMwMX2apxf4c4vDsh/jZkg7YRGPnvvJ98
7fzdOjS2CqJX4iSKjqdpVlAFAC76CGGZB6HsOfR2WVsr5Zp91AtJtlwdVJPTKAXf
LxKkMIBpNL7Z+fKVzSW3WlesXc7ItkhVKK7zTWAopZz2RvA/BAY=
=w0vF
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--

