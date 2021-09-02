Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC473FE80D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 05:34:39 +0200 (CEST)
Received: from localhost ([::1]:57580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLdUs-0001ca-5X
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 23:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLdLV-0001W0-Jq; Wed, 01 Sep 2021 23:24:57 -0400
Received: from ozlabs.org ([203.11.71.1]:41873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLdLJ-0008N4-Iy; Wed, 01 Sep 2021 23:24:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630553072;
 bh=5Hm+zDp54L+StrqDJu2Cp826qb3NnqJeqm9fV4dUJN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vugc1h8svtZezqDGYIpv2y7M5QM6OGh+eIMOIYSwnEGApIL3H9Qoz0nQ4T4h3t6wa
 TXw6n2Lb0yBsJJwvhn0mbWtOmIP2ExnzlDa/Z6tDGfiRlOrRUbCS24cs8vv+MHuDHs
 Ka14kTdd+5pCwFn/g61qA+vbEaUMD8Fv8nhhGh68=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H0R9r21K4z9t0p; Thu,  2 Sep 2021 13:24:32 +1000 (AEST)
Date: Thu, 2 Sep 2021 11:38:06 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 6/8] ppc/xive: Export priority_to_ipb() helper
Message-ID: <YTAq/j6BR+uxboBJ@yekko>
References: <20210901094153.227671-1-clg@kaod.org>
 <20210901094153.227671-7-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="u21G16JFv40j8eGy"
Content-Disposition: inline
In-Reply-To: <20210901094153.227671-7-clg@kaod.org>
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


--u21G16JFv40j8eGy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 01, 2021 at 11:41:51AM +0200, C=E9dric Le Goater wrote:
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.2.

> ---
>  include/hw/ppc/xive.h | 11 +++++++++++
>  hw/intc/xive.c        | 21 ++++++---------------
>  2 files changed, 17 insertions(+), 15 deletions(-)
>=20
> diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
> index db7641165484..29b130eaea59 100644
> --- a/include/hw/ppc/xive.h
> +++ b/include/hw/ppc/xive.h
> @@ -458,6 +458,17 @@ struct XiveENDSource {
>   */
>  #define XIVE_PRIORITY_MAX  7
> =20
> +/*
> + * Convert a priority number to an Interrupt Pending Buffer (IPB)
> + * register, which indicates a pending interrupt at the priority
> + * corresponding to the bit number
> + */
> +static inline uint8_t xive_priority_to_ipb(uint8_t priority)
> +{
> +    return priority > XIVE_PRIORITY_MAX ?
> +        0 : 1 << (XIVE_PRIORITY_MAX - priority);
> +}
> +
>  /*
>   * XIVE Thread Interrupt Management Aera (TIMA)
>   *
> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
> index b817ee8e3704..b0c4f76b1d4b 100644
> --- a/hw/intc/xive.c
> +++ b/hw/intc/xive.c
> @@ -27,17 +27,6 @@
>   * XIVE Thread Interrupt Management context
>   */
> =20
> -/*
> - * Convert a priority number to an Interrupt Pending Buffer (IPB)
> - * register, which indicates a pending interrupt at the priority
> - * corresponding to the bit number
> - */
> -static uint8_t priority_to_ipb(uint8_t priority)
> -{
> -    return priority > XIVE_PRIORITY_MAX ?
> -        0 : 1 << (XIVE_PRIORITY_MAX - priority);
> -}
> -
>  /*
>   * Convert an Interrupt Pending Buffer (IPB) register to a Pending
>   * Interrupt Priority Register (PIPR), which contains the priority of
> @@ -89,7 +78,7 @@ static uint64_t xive_tctx_accept(XiveTCTX *tctx, uint8_=
t ring)
>          regs[TM_CPPR] =3D cppr;
> =20
>          /* Reset the pending buffer bit */
> -        regs[TM_IPB] &=3D ~priority_to_ipb(cppr);
> +        regs[TM_IPB] &=3D ~xive_priority_to_ipb(cppr);
>          regs[TM_PIPR] =3D ipb_to_pipr(regs[TM_IPB]);
> =20
>          /* Drop Exception bit */
> @@ -353,7 +342,7 @@ static void xive_tm_set_os_cppr(XivePresenter *xptr, =
XiveTCTX *tctx,
>  static void xive_tm_set_os_pending(XivePresenter *xptr, XiveTCTX *tctx,
>                                     hwaddr offset, uint64_t value, unsign=
ed size)
>  {
> -    xive_tctx_ipb_update(tctx, TM_QW1_OS, priority_to_ipb(value & 0xff));
> +    xive_tctx_ipb_update(tctx, TM_QW1_OS, xive_priority_to_ipb(value & 0=
xff));
>  }
> =20
>  static void xive_os_cam_decode(uint32_t cam, uint8_t *nvt_blk,
> @@ -1535,7 +1524,8 @@ bool xive_presenter_notify(XiveFabric *xfb, uint8_t=
 format,
>      /* handle CPU exception delivery */
>      if (count) {
>          trace_xive_presenter_notify(nvt_blk, nvt_idx, match.ring);
> -        xive_tctx_ipb_update(match.tctx, match.ring, priority_to_ipb(pri=
ority));
> +        xive_tctx_ipb_update(match.tctx, match.ring,
> +                             xive_priority_to_ipb(priority));
>      }
> =20
>      return !!count;
> @@ -1682,7 +1672,8 @@ static void xive_router_end_notify(XiveRouter *xrtr=
, uint8_t end_blk,
>           * use. The presenter will resend the interrupt when the vCPU
>           * is dispatched again on a HW thread.
>           */
> -        ipb =3D xive_get_field32(NVT_W4_IPB, nvt.w4) | priority_to_ipb(p=
riority);
> +        ipb =3D xive_get_field32(NVT_W4_IPB, nvt.w4) |
> +            xive_priority_to_ipb(priority);
>          nvt.w4 =3D xive_set_field32(NVT_W4_IPB, nvt.w4, ipb);
>          xive_router_write_nvt(xrtr, nvt_blk, nvt_idx, &nvt, 4);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--u21G16JFv40j8eGy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEwKv4ACgkQbDjKyiDZ
s5JI3hAAuCXnrmJR8lmjvOvrJ5RKhsHcll3MgYVMkfgDwjEGbeQ04zRDAw3A0kQ8
T3nM9cFc5ScBbV8nraUXNaMVWgFdpDCICC6GHLUbrJiH6Qba0/EUmO6fKuY4/fy7
YuLIJxcrRfsHaZr9z+LlYJAohzg55BjqWFgNh+hK82yFs/lNt1E4oIKVbll/XJsR
eOpcUkkzUApfoM72/AcgCd94U7oY9uOkqZ/1h8o16UdWDLE6IywWM7xEFd84liTE
tO8llA5/Do5hoYgj5rjS3/jggom59DoEM4uOK+B1C61z/OknxIaH8mN4q6AzPceH
7tbs0bTe7x2/FOUsjNdW1mtHuO5Fh9cgl1fBUejk2NS2Mu5xDYPJWwCBmu2AaZlX
VHnSQITwf1ygrte29+5m4l6GWijAhnihgol1jqtrUA8s03YYzwDXkYT/OiIf8Do6
RGVDyPJ0PIjyz7DB7CmrEbuZ4gl0vtEZzSE79AXWooCVtEQX3Myngc/hFWjxnWBT
dgcOjs9xf9Ie5augrScn6zexoPPpz2eZLpfmsHqh3rgklnBKtuwWQ82dPv2OZUjD
F+ZJMX5nNImp8Li06Xg+zET5BLZ6KBkTFEMuAeiGb9eChH7DqbzX7ZthQlTsDZxX
Vga6LSREo56ROX7W0CKw9cBuu8dNM8vJPYLzLoflbCBKN1q4PZc=
=uMFM
-----END PGP SIGNATURE-----

--u21G16JFv40j8eGy--

