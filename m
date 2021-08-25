Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1A63F6F9E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 08:35:33 +0200 (CEST)
Received: from localhost ([::1]:37512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mImVX-00042F-1D
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 02:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mImRt-0001db-8D; Wed, 25 Aug 2021 02:31:45 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:42269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mImRq-00076b-RX; Wed, 25 Aug 2021 02:31:44 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvbjP5Ps7z9sWl; Wed, 25 Aug 2021 16:31:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629873097;
 bh=n/0ToF2Jl7+8shMy8ft9RLfWx1gJPxFtZV9oBq3uH9E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hvqSkd6UhTpJv2dyRSu84WMFXUUSNyNo8mZOugWj4ssS/3M2r0ZGQUj21Vd4iEb2c
 VlwTApRHbcxJULTzYc/Sds0MzxjamPGP7GMoVG+2MU3epuFjWpkPzxOCIUkf/g2OtY
 cAORgLBqBiQdP9Y3B28tzuS+npOBBBu6oau9yxdA=
Date: Wed, 25 Aug 2021 16:01:49 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 10/26] ppc/xive2: Introduce a presenter matching routine
Message-ID: <YSXcze1dKtUWEMIl@yekko>
References: <20210809134547.689560-1-clg@kaod.org>
 <20210809134547.689560-11-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Bh1M7ayvLyJDtMR+"
Content-Disposition: inline
In-Reply-To: <20210809134547.689560-11-clg@kaod.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Bh1M7ayvLyJDtMR+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 03:45:31PM +0200, C=E9dric Le Goater wrote:
> The VP space is larger in XIVE2 (P10), 24 bits instead of 19bits on
> XIVE (P9), and the CAM line can use a 7bits or 8bits thread id.
>=20
> For now, we only use 7bits thread ids, same as P9, but because of the
> change of the size of the VP space, the CAM matching routine is
> different between P9 and P10. It is easier to duplicate the whole
> routine than to add extra handlers in xive_presenter_tctx_match() used
> for P9.
>=20
> We might come with a better solution later on, after we have added
> some more support for the XIVE2 controller.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> ---
>  include/hw/ppc/xive2.h |  9 +++++
>  hw/intc/xive2.c        | 87 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 96 insertions(+)
>=20
> diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
> index a14f430a09f7..8a74fa7e4c7e 100644
> --- a/include/hw/ppc/xive2.h
> +++ b/include/hw/ppc/xive2.h
> @@ -60,6 +60,15 @@ int xive2_router_write_nvp(Xive2Router *xrtr, uint8_t =
nvp_blk, uint32_t nvp_idx,
> =20
>  void xive2_router_notify(XiveNotifier *xn, uint32_t lisn);
> =20
> +/*
> + * XIVE2 Presenter (POWER10)
> + */
> +
> +int xive2_presenter_tctx_match(XivePresenter *xptr, XiveTCTX *tctx,
> +                               uint8_t format,
> +                               uint8_t nvt_blk, uint32_t nvt_idx,
> +                               bool cam_ignore, uint32_t logic_serv);
> +
>  /*
>   * XIVE2 END ESBs  (POWER10)
>   */
> diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
> index b1c216b10006..55400628467b 100644
> --- a/hw/intc/xive2.c
> +++ b/hw/intc/xive2.c
> @@ -20,6 +20,11 @@
>  #include "hw/ppc/xive2.h"
>  #include "hw/ppc/xive2_regs.h"
> =20
> +static inline uint32_t xive_tctx_word2(uint8_t *ring)
> +{
> +    return *((uint32_t *) &ring[TM_WORD2]);
> +}
> +
>  static uint8_t priority_to_ipb(uint8_t priority)
>  {
>      return priority > XIVE_PRIORITY_MAX ?
> @@ -215,6 +220,88 @@ static int xive2_router_get_block_id(Xive2Router *xr=
tr)
>     return xrc->get_block_id(xrtr);
>  }
> =20
> +/*
> + * Encode the HW CAM line with 7bit or 8bit thread id. The thread id
> + * width and block id width is configurable at the IC level.
> + *
> + *    chipid << 24 | 0000 0000 0000 0000 1 threadid (7Bit)
> + *    chipid << 24 | 0000 0000 0000 0001 threadid   (8Bit)
> + */
> +static uint32_t xive2_tctx_hw_cam_line(XivePresenter *xptr, XiveTCTX *tc=
tx)
> +{
> +    Xive2Router *xrtr =3D XIVE2_ROUTER(xptr);
> +    CPUPPCState *env =3D &POWERPC_CPU(tctx->cs)->env;
> +    uint32_t pir =3D env->spr_cb[SPR_PIR].default_value;
> +    uint8_t blk =3D xive2_router_get_block_id(xrtr);
> +    uint8_t tid_shift =3D 7;
> +    uint8_t tid_mask =3D (1 << tid_shift) - 1;
> +
> +    return xive2_nvp_cam_line(blk, 1 << tid_shift | (pir & tid_mask));
> +}
> +
> +/*
> + * The thread context register words are in big-endian format.
> + */
> +int xive2_presenter_tctx_match(XivePresenter *xptr, XiveTCTX *tctx,
> +                               uint8_t format,
> +                               uint8_t nvt_blk, uint32_t nvt_idx,
> +                               bool cam_ignore, uint32_t logic_serv)
> +{
> +    uint32_t cam =3D   xive2_nvp_cam_line(nvt_blk, nvt_idx);
> +    uint32_t qw3w2 =3D xive_tctx_word2(&tctx->regs[TM_QW3_HV_PHYS]);
> +    uint32_t qw2w2 =3D xive_tctx_word2(&tctx->regs[TM_QW2_HV_POOL]);
> +    uint32_t qw1w2 =3D xive_tctx_word2(&tctx->regs[TM_QW1_OS]);
> +    uint32_t qw0w2 =3D xive_tctx_word2(&tctx->regs[TM_QW0_USER]);
> +
> +    /*
> +     * TODO (PowerNV): ignore mode. The low order bits of the NVT
> +     * identifier are ignored in the "CAM" match.
> +     */
> +
> +    if (format =3D=3D 0) {
> +        if (cam_ignore =3D=3D true) {
> +            /*
> +             * F=3D0 & i=3D1: Logical server notification (bits ignored =
at
> +             * the end of the NVT identifier)
> +             */
> +            qemu_log_mask(LOG_UNIMP, "XIVE: no support for LS NVT %x/%x\=
n",
> +                          nvt_blk, nvt_idx);
> +             return -1;

You seem to have copied a small indentation error here from
xive_presenter_tctx_match().

> +        }
> +
> +        /* F=3D0 & i=3D0: Specific NVT notification */
> +
> +        /* PHYS ring */
> +        if ((be32_to_cpu(qw3w2) & TM2_QW3W2_VT) &&
> +            cam =3D=3D xive2_tctx_hw_cam_line(xptr, tctx)) {
> +            return TM_QW3_HV_PHYS;
> +        }
> +
> +        /* HV POOL ring */
> +        if ((be32_to_cpu(qw2w2) & TM2_QW2W2_VP) &&
> +            cam =3D=3D xive_get_field32(TM2_QW2W2_POOL_CAM, qw2w2)) {
> +            return TM_QW2_HV_POOL;
> +        }
> +
> +        /* OS ring */
> +        if ((be32_to_cpu(qw1w2) & TM2_QW1W2_VO) &&
> +            cam =3D=3D xive_get_field32(TM2_QW1W2_OS_CAM, qw1w2)) {
> +            return TM_QW1_OS;
> +        }
> +    } else {
> +        /* F=3D1 : User level Event-Based Branch (EBB) notification */
> +
> +        /* USER ring */
> +        if  ((be32_to_cpu(qw1w2) & TM2_QW1W2_VO) &&
> +             (cam =3D=3D xive_get_field32(TM2_QW1W2_OS_CAM, qw1w2)) &&
> +             (be32_to_cpu(qw0w2) & TM2_QW0W2_VU) &&
> +             (logic_serv =3D=3D xive_get_field32(TM2_QW0W2_LOGIC_SERV, q=
w0w2))) {
> +            return TM_QW0_USER;
> +        }
> +    }
> +    return -1;
> +}
> +
>  static void xive2_router_realize(DeviceState *dev, Error **errp)
>  {
>      Xive2Router *xrtr =3D XIVE2_ROUTER(dev);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Bh1M7ayvLyJDtMR+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEl3MoACgkQbDjKyiDZ
s5Jm1Q/+OZpPFj+lfn2ixpi7oSrMQO3iYYGOHOq7974P/zAkxeY6ECyN/Q5Ho+kG
+kM4BQxpeNlpYLjRTA0zb7lacg/J3QvdoAhV5KlFg2cJRCf7OvFinmLPZYsllsbD
Hwe4xbxwrYfSnyfK6womaqy2/Lvm7/PKEPKC5nerQO7/cOdPx7PldRc4rxF7d02C
4rEESFw1J0OhWzMkodgSOVwrym6QAxEjU1FffaY4AoomCho07KogTLAeCQx5Wbma
ZPTCGdVCCca0MHoK7Idu596husm0JKnE8IA9o3v+kyl49pSOhtW7pVL+xLNR+dSS
E37ZIA8lJamdgxmE9pS+QvdaAHJmFX98u0SUq2coJIrV/X/8irOI8BokYCLd5NLH
IBiLhfSs+2B2kQE6lOahJORTuaHFqu5yjn014b+sKf1mDMQxx44PA+AZ5847gpI2
Nde4ieS55aGJ08XyQt1d0S3PXifhuTpgCsTzqSySBVKsigdy2dai2Pf0pLfvMan/
zpNMq6esma3W4NjdJurDaJPyTnzWOdaUs+UzWTcJ/MGZR3uOUkKAvUWcIza9l5/2
kip4kYTPHvGalDSHyoOSLcQCyEQjrPLPNgjeoR4jAN1AvC0U+fiCG2LSuJf7+Nic
5OPKV5SSxndMCUaJ6TIiAJpkmbOCd6awXKidV0LmlW0e9C4ePMU=
=z2In
-----END PGP SIGNATURE-----

--Bh1M7ayvLyJDtMR+--

