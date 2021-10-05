Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36304421BA2
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 03:16:01 +0200 (CEST)
Received: from localhost ([::1]:59748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXZ3o-0003Ce-6o
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 21:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mXYtd-0007IF-PL; Mon, 04 Oct 2021 21:05:30 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:60529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mXYtX-0003XR-5C; Mon, 04 Oct 2021 21:05:28 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HNfWx1YQbz4xbZ; Tue,  5 Oct 2021 12:05:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1633395917;
 bh=AJzyWfUQbn3fmbBIa28aBR/a5AQ0TzRhGSo6OJ9Uu2Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jcnqKYOGTQ4FdE6xSpnVLEq8GIB7q1rBFOKgdGU/bqb6kE9q5VXni5dqLu/Tu0w1C
 IwZTw/+P/vmtjBscLkoMpe4e/B8a7EOeGU3ocndIwVi0ZNzdaccRuTMzZE66MzTGJF
 8InUzBNgoMCb8ZYJE9w/qlaV5fjjShvYj/MdLEv0=
Date: Tue, 5 Oct 2021 11:42:48 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] spapr/xive: Add source status helpers
Message-ID: <YVufiJNLZah1hUnM@yekko>
References: <20211004212141.432954-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mr6VDNyaSkJbz/xk"
Content-Disposition: inline
In-Reply-To: <20211004212141.432954-1-clg@kaod.org>
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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


--mr6VDNyaSkJbz/xk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 04, 2021 at 11:21:41PM +0200, C=E9dric Le Goater wrote:
> and use them to set and test the ASSERTED bit of LSI sources.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.2, thanks.

> ---
>  include/hw/ppc/xive.h    | 24 ++++++++++++++++++++++++
>  hw/intc/spapr_xive.c     |  2 +-
>  hw/intc/spapr_xive_kvm.c | 10 +++-------
>  hw/intc/xive.c           |  8 ++++----
>  4 files changed, 32 insertions(+), 12 deletions(-)
>=20
> diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
> index 252c58a1d691..b8ab0bf7490f 100644
> --- a/include/hw/ppc/xive.h
> +++ b/include/hw/ppc/xive.h
> @@ -286,6 +286,30 @@ uint8_t xive_esb_set(uint8_t *pq, uint8_t value);
>  uint8_t xive_source_esb_get(XiveSource *xsrc, uint32_t srcno);
>  uint8_t xive_source_esb_set(XiveSource *xsrc, uint32_t srcno, uint8_t pq=
);
> =20
> +/*
> + * Source status helpers
> + */
> +static inline void xive_source_set_status(XiveSource *xsrc, uint32_t src=
no,
> +                                          uint8_t status, bool enable)
> +{
> +    if (enable) {
> +        xsrc->status[srcno] |=3D status;
> +    } else {
> +        xsrc->status[srcno] &=3D ~status;
> +    }
> +}
> +
> +static inline void xive_source_set_asserted(XiveSource *xsrc, uint32_t s=
rcno,
> +                                            bool enable)
> +{
> +    xive_source_set_status(xsrc, srcno, XIVE_STATUS_ASSERTED, enable);
> +}
> +
> +static inline bool xive_source_is_asserted(XiveSource *xsrc, uint32_t sr=
cno)
> +{
> +    return xsrc->status[srcno] & XIVE_STATUS_ASSERTED;
> +}
> +
>  void xive_source_pic_print_info(XiveSource *xsrc, uint32_t offset,
>                                  Monitor *mon);
> =20
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index 89cfa018f598..4ec659b93e13 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -185,7 +185,7 @@ static void spapr_xive_pic_print_info(SpaprXive *xive=
, Monitor *mon)
>                         xive_source_irq_is_lsi(xsrc, i) ? "LSI" : "MSI",
>                         pq & XIVE_ESB_VAL_P ? 'P' : '-',
>                         pq & XIVE_ESB_VAL_Q ? 'Q' : '-',
> -                       xsrc->status[i] & XIVE_STATUS_ASSERTED ? 'A' : ' =
',
> +                       xive_source_is_asserted(xsrc, i) ? 'A' : ' ',
>                         xive_eas_is_masked(eas) ? "M" : " ",
>                         (int) xive_get_field64(EAS_END_DATA, eas->w));
> =20
> diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> index 6d4909d0a856..be94cff14837 100644
> --- a/hw/intc/spapr_xive_kvm.c
> +++ b/hw/intc/spapr_xive_kvm.c
> @@ -242,7 +242,7 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, in=
t srcno, Error **errp)
> =20
>      if (xive_source_irq_is_lsi(xsrc, srcno)) {
>          state |=3D KVM_XIVE_LEVEL_SENSITIVE;
> -        if (xsrc->status[srcno] & XIVE_STATUS_ASSERTED) {
> +        if (xive_source_is_asserted(xsrc, srcno)) {
>              state |=3D KVM_XIVE_LEVEL_ASSERTED;
>          }
>      }
> @@ -321,7 +321,7 @@ uint64_t kvmppc_xive_esb_rw(XiveSource *xsrc, int src=
no, uint32_t offset,
>      if (xive_source_irq_is_lsi(xsrc, srcno) &&
>          offset =3D=3D XIVE_ESB_LOAD_EOI) {
>          xive_esb_read(xsrc, srcno, XIVE_ESB_SET_PQ_00);
> -        if (xsrc->status[srcno] & XIVE_STATUS_ASSERTED) {
> +        if (xive_source_is_asserted(xsrc, srcno)) {
>              kvmppc_xive_esb_trigger(xsrc, srcno);
>          }
>          return 0;
> @@ -359,11 +359,7 @@ void kvmppc_xive_source_set_irq(void *opaque, int sr=
cno, int val)
>              return;
>          }
>      } else {
> -        if (val) {
> -            xsrc->status[srcno] |=3D XIVE_STATUS_ASSERTED;
> -        } else {
> -            xsrc->status[srcno] &=3D ~XIVE_STATUS_ASSERTED;
> -        }
> +        xive_source_set_asserted(xsrc, srcno, val);
>      }
> =20
>      kvmppc_xive_esb_trigger(xsrc, srcno);
> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
> index 6c82326ec768..190194d27f84 100644
> --- a/hw/intc/xive.c
> +++ b/hw/intc/xive.c
> @@ -875,7 +875,7 @@ static bool xive_source_lsi_trigger(XiveSource *xsrc,=
 uint32_t srcno)
>  {
>      uint8_t old_pq =3D xive_source_esb_get(xsrc, srcno);
> =20
> -    xsrc->status[srcno] |=3D XIVE_STATUS_ASSERTED;
> +    xive_source_set_asserted(xsrc, srcno, true);
> =20
>      switch (old_pq) {
>      case XIVE_ESB_RESET:
> @@ -923,7 +923,7 @@ static bool xive_source_esb_eoi(XiveSource *xsrc, uin=
t32_t srcno)
>       * notification
>       */
>      if (xive_source_irq_is_lsi(xsrc, srcno) &&
> -        xsrc->status[srcno] & XIVE_STATUS_ASSERTED) {
> +        xive_source_is_asserted(xsrc, srcno)) {
>          ret =3D xive_source_lsi_trigger(xsrc, srcno);
>      }
> =20
> @@ -1104,7 +1104,7 @@ void xive_source_set_irq(void *opaque, int srcno, i=
nt val)
>          if (val) {
>              notify =3D xive_source_lsi_trigger(xsrc, srcno);
>          } else {
> -            xsrc->status[srcno] &=3D ~XIVE_STATUS_ASSERTED;
> +            xive_source_set_asserted(xsrc, srcno, false);
>          }
>      } else {
>          if (val) {
> @@ -1133,7 +1133,7 @@ void xive_source_pic_print_info(XiveSource *xsrc, u=
int32_t offset, Monitor *mon)
>                         xive_source_irq_is_lsi(xsrc, i) ? "LSI" : "MSI",
>                         pq & XIVE_ESB_VAL_P ? 'P' : '-',
>                         pq & XIVE_ESB_VAL_Q ? 'Q' : '-',
> -                       xsrc->status[i] & XIVE_STATUS_ASSERTED ? 'A' : ' =
');
> +                       xive_source_is_asserted(xsrc, i) ? 'A' : ' ');
>      }
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--mr6VDNyaSkJbz/xk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFbn4YACgkQbDjKyiDZ
s5JOIBAA1EIWY2jnQnZbYOwAms8nRXAXOO7d8Torq3OB5CWCMZw+evIHXFmJVJAz
6S/gl1av4N8xQKNFPy9EZ5xUKDjn2J3wefEsmn6rrVVzT0aD3N7jZkq0tbZ533ou
/4rFyidFj/73JPzd8g4E072cAHUFP3xryNAmV+k8tVpkUCZxcRnBeU5JsB/yACpe
AgLKxf4mFaWU+REQ7MTRMdYl6PVrKlaF+bbmUv1WakU1ZH6XaW7yTyUMBBmXIdXK
rnnk/1rU9NaybrM+DYTY6oxTSJUCbhipz3XqGMA82Vf/DTUhxj8wyrRR/PefqFvx
VJ272jpiUpXy44QBIk/wO7X1sFwWXtyQLBlf7KTE4hFEtiEcbx4wCKYTpVOOzyaH
cxhgBJrmiYyQ5Iv30tlvP0bt/Ndk8w5iwMAMu86XbUbwXEO9DF6ZbUzyJjLK+N3f
9CRt5z5sT2GJlHb8dJJi3u3yzWj4iTjkZFU7DHqvbQrG83XBwNhIS3I4/HWbmL7u
sUMdqXnjxHYo2VZMbkG1VSqiAxFUVyLT68y2R5DpdB43cMDbSawfFZa4Ql22tUWD
oQErK6iX/7HwuZxiC4bAxh6RFLceyWco+J9K16Dj7h0d1DZFChskwbR3VlpaFyoR
9ZtxTlBQgLfCdqQGl5ziS128wwnSV3KwLWbO2nztvz3H+ogYa7c=
=L3BD
-----END PGP SIGNATURE-----

--mr6VDNyaSkJbz/xk--

