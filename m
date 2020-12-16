Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1904C2DB7EB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 01:50:24 +0100 (CET)
Received: from localhost ([::1]:40674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpL1L-0003AI-67
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 19:50:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kpKzv-00028F-0h; Tue, 15 Dec 2020 19:48:55 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:42893 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kpKzs-0000uh-Fv; Tue, 15 Dec 2020 19:48:54 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cwc234L1Pz9sSn; Wed, 16 Dec 2020 11:48:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1608079723;
 bh=051eeJt+o0LHsk5VszTwucb67ia31Daaz43UdZ1Frtc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hvSwPZ3rKuLpCtrNuviL//5aAWJPpgdYHsNAiErc9S+olcC2KA7/FjapWuufL3aBj
 aylwuX5oOuWGhwvV6Sc6IGWoro70s1I6ip/BMhfmNJEzarwX+E+1nK/c52+xBoBCRT
 HHXHSXf9mjPvxVFWNYuPXnVgMSz8xIYmSTk28hvA=
Date: Wed, 16 Dec 2020 11:47:12 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] spapr/xive: Make spapr_xive_pic_print_info() static
Message-ID: <20201216004712.GJ4717@yekko.fritz.box>
References: <20201215174025.2636824-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="g3RkK9jYN81zD2N+"
Content-Disposition: inline
In-Reply-To: <20201215174025.2636824-1-clg@kaod.org>
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--g3RkK9jYN81zD2N+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2020 at 06:40:25PM +0100, C=E9dric Le Goater wrote:
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
>  include/hw/ppc/spapr_xive.h | 2 --
>  hw/intc/spapr_xive.c        | 2 +-
>  2 files changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
> index 26c8d90d7196..b282960ad90d 100644
> --- a/include/hw/ppc/spapr_xive.h
> +++ b/include/hw/ppc/spapr_xive.h
> @@ -66,8 +66,6 @@ typedef struct SpaprXiveClass {
>   */
>  #define SPAPR_XIVE_BLOCK_ID 0x0
> =20
> -void spapr_xive_pic_print_info(SpaprXive *xive, Monitor *mon);
> -
>  struct SpaprMachineState;
>  void spapr_xive_hcall_init(struct SpaprMachineState *spapr);
>  void spapr_xive_mmio_set_enabled(SpaprXive *xive, bool enable);
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index caedd312d745..801bc1934160 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -156,7 +156,7 @@ static void spapr_xive_end_pic_print_info(SpaprXive *=
xive, XiveEND *end,
>  #define spapr_xive_in_kernel(xive) \
>      (kvm_irqchip_in_kernel() && (xive)->fd !=3D -1)
> =20
> -void spapr_xive_pic_print_info(SpaprXive *xive, Monitor *mon)
> +static void spapr_xive_pic_print_info(SpaprXive *xive, Monitor *mon)
>  {
>      XiveSource *xsrc =3D &xive->source;
>      int i;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--g3RkK9jYN81zD2N+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/ZWRAACgkQbDjKyiDZ
s5LoJg//QBGSlbvXsUQBMG+Pj5e9kGZGO+Cdn64xI/CMPup5CGGkWpW+1NEr1tW+
uFgjhDaqZjHkFD8pHLpayyfTLgy6HIeQvjhfHLz9fz5sj3IUovDzAfwXQcnGIO7z
B5pV2DL9/lMbdVhmVDc0ggjHy8Vl9DHWxTNAlnVLIiO4zFj2D5uqkk3NO/9fwcs5
5VutSHyWQe3IFDyP+J23zHvcS4U/fuGSWNSHatYrZJKprejjPLt41evVZghUjac8
UL4pmYT1QmUhASAkcna2TtyrCChyq4oCxZoBQvF2Olmu5hSwerNQ2D3OGXnQBnPs
ZC/qcSFeqphr5ckxXy5TqanDo6OXp8K6a7DgB6mRXP2eovswFGZQbKGz1l84Wk5T
Nf7rfZHINNM4k2rqVH/xi6Iy2BDVI+XAXdQ3RfwtkhCAno4ItjxCofOmvBo+A6gu
tlDSQz/9TBLexc5kqRWaMXl+DNHjXlXM3xTZhpudkZ3IO53z4oO42rCiKTkqbD2P
fjIf/A7NNCY3zlAexzhk0XJcBS66/RzIYs4NZ7vECjaImpsudx7fxeCV3VzovTMd
Q9f5ZU3NB1GZ5k/GpJFW7xO4wOapDGbWWKLRKxsElttqEqwttUQrlKOLgng75Wpk
U5iBmqHv1RZ/Ee8bLMVoLRjdteTfjXssrnTbj7RsUYk3tRjjBeY=
=Cem6
-----END PGP SIGNATURE-----

--g3RkK9jYN81zD2N+--

