Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36F33FE81C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 05:38:50 +0200 (CEST)
Received: from localhost ([::1]:33276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLdYv-0004Tq-O0
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 23:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLdLY-0001d7-Hh; Wed, 01 Sep 2021 23:25:00 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57519 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLdLT-0000DY-EX; Wed, 01 Sep 2021 23:25:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630553072;
 bh=PPPVLZ8JEcP9LABxHPMoLmYybmqotgAzGYEMpbNMXyY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E0MovDjEno8Tk+gWY95zZrOj8Px5cDhB7S67+xUsIDJjldsORwfF1TgaBJ752x1ps
 8wiMZjAZ/akAtR5MptpDEdwbvCmfIEV3LnQIch2btjsiTrnVlUGzzNNA3lMN8MbUyM
 JN1zG+O4MVaOHql2Cw3uZ98iYPcOsnPmaWwDtWo8=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H0R9r2ncbz9t56; Thu,  2 Sep 2021 13:24:32 +1000 (AEST)
Date: Thu, 2 Sep 2021 11:38:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 7/8] ppc/xive: Export xive_tctx_word2() helper
Message-ID: <YTArFQHz8exaJugT@yekko>
References: <20210901094153.227671-1-clg@kaod.org>
 <20210901094153.227671-8-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mI1Z3kuXK1F12RkS"
Content-Disposition: inline
In-Reply-To: <20210901094153.227671-8-clg@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--mI1Z3kuXK1F12RkS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 01, 2021 at 11:41:52AM +0200, C=E9dric Le Goater wrote:
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.2

> ---
>  include/hw/ppc/xive.h | 5 +++++
>  hw/intc/xive.c        | 5 -----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
> index 29b130eaea59..252c58a1d691 100644
> --- a/include/hw/ppc/xive.h
> +++ b/include/hw/ppc/xive.h
> @@ -335,6 +335,11 @@ struct XiveTCTX {
>      XivePresenter *xptr;
>  };
> =20
> +static inline uint32_t xive_tctx_word2(uint8_t *ring)
> +{
> +    return *((uint32_t *) &ring[TM_WORD2]);
> +}
> +
>  /*
>   * XIVE Router
>   */
> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
> index b0c4f76b1d4b..6c82326ec768 100644
> --- a/hw/intc/xive.c
> +++ b/hw/intc/xive.c
> @@ -141,11 +141,6 @@ void xive_tctx_ipb_update(XiveTCTX *tctx, uint8_t ri=
ng, uint8_t ipb)
>      xive_tctx_notify(tctx, ring);
>  }
> =20
> -static inline uint32_t xive_tctx_word2(uint8_t *ring)
> -{
> -    return *((uint32_t *) &ring[TM_WORD2]);
> -}
> -
>  /*
>   * XIVE Thread Interrupt Management Area (TIMA)
>   */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--mI1Z3kuXK1F12RkS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEwKxUACgkQbDjKyiDZ
s5KaqQ//X7sj0Oi+wW0LbcHW5PcuI06qeLac3bbrlk5GdZeVIGKFZXmc8Pnkl6G7
7AmPY+dJvr+AFFDKBQLaKqFjs6Gi0feu8Z0GWup1UB4VxCQKYGTd2PisgrCgndAr
pKZ/CGdZelPz63LlliEjtNIMbht2lkZpl/xNBbvYY/yAQrQEDe3vcY9gLBQtE4ca
ZNDaL+bJTXH9ThdMhWhd3tWEcAEny+tGWEj+ZDU9YUEWG0umkEXFtqpe6+TlNhVW
/qO6V65OdG7ZKLM4O54vd5wXU8Vxt4i4YCqbEMQ3kGfZzY19XfiKFnSeUqLj4XXB
YXNT3N9ULitqEQiwg586raT+/gpsN4aKygYQ8Wwb/NeNuXv40isI6AzDdeVEY11f
Tn0F2wCRgtWfXKCUVCsW/7qA4SnydATkUo3s9ir9cvNrxCVAdL4B7F0tnIX8b8lz
M1ukD9l/caIkht+GLW35slk/ySU6V0c0At6wHnsmyFTOlR/9bzdORAnLXBM4Ksnv
i4Z//H70Tm5SGc8IEmgE5E+UiYPE5vpgn4DRq8H8fFhLEpv3s0HW7U9RMGc/YdDJ
ZFY+PvhGRhH9MrwbdY+51rXuQdJzMax+obJqs8usjW71KHce+LwsJWlDZWl+/5AI
Fib2THAQm4MAT/BCqc233u4xlmWKQBjJGLGWLc8UPt3nIP+0QR8=
=c5B3
-----END PGP SIGNATURE-----

--mI1Z3kuXK1F12RkS--

