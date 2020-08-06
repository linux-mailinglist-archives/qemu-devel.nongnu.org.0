Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A92B23D659
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 07:12:10 +0200 (CEST)
Received: from localhost ([::1]:47108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3YCG-0002Ye-LY
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 01:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k3YBA-0001CJ-Ip; Thu, 06 Aug 2020 01:11:00 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:51685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k3YB7-0001cr-Kv; Thu, 06 Aug 2020 01:11:00 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BMc5N2h4zz9sTX; Thu,  6 Aug 2020 15:10:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1596690648;
 bh=nWpjYeSYIhvsczyLi1mlr+SkuLAzmYJhsMjiou4X5N4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iT4I3SUvE6LQKVbbvkyR5ypRnssjJq5fqphNx1b25p5CNV04Igcwq7YAnJXsgZaPh
 /3/7m9c5wLEkHun6DNEkAlf7vRevMoWutCY2ltTquen3TruO8SgsebpBXzwiPsYnZ1
 YUirIVnwS+6XBf4R0Hi3gUsyRf+6V0dBWvaR+daY=
Date: Thu, 6 Aug 2020 15:09:08 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-5.2 4/5] spapr/xive: Convert KVM device fd checks to
 assert()
Message-ID: <20200806050908.GD100968@yekko.fritz.box>
References: <159664891296.638781.18417631893299150932.stgit@bahia.lan>
 <159664894478.638781.7802223440952803421.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mSxgbZZZvrAyzONB"
Content-Disposition: inline
In-Reply-To: <159664894478.638781.7802223440952803421.stgit@bahia.lan>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--mSxgbZZZvrAyzONB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2020 at 07:35:44PM +0200, Greg Kurz wrote:
> All callers guard these functions with kvmppc_xive_in_kernel() or one
> of its variants. Make it clear that these functions are only to be
> called when the KVM XIVE device is active.
>=20
> Note that the check on xive is dropped in kvmppc_xive_disconnect(). It
> really cannot be NULL since it comes from set_active_intc() which only
> passes pointers to allocated objects.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/intc/spapr_xive_kvm.c |   35 +++++++----------------------------
>  1 file changed, 7 insertions(+), 28 deletions(-)
>=20
> diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> index a9657e2b0cda..3364832de83a 100644
> --- a/hw/intc/spapr_xive_kvm.c
> +++ b/hw/intc/spapr_xive_kvm.c
> @@ -79,10 +79,7 @@ void kvmppc_xive_cpu_set_state(XiveTCTX *tctx, Error *=
*errp)
>      uint64_t state[2];
>      int ret;
> =20
> -    /* The KVM XIVE device is not in use yet */
> -    if (xive->fd =3D=3D -1) {
> -        return;
> -    }
> +    assert(xive->fd !=3D -1);
> =20
>      /* word0 and word1 of the OS ring. */
>      state[0] =3D *((uint64_t *) &tctx->regs[TM_QW1_OS]);
> @@ -101,10 +98,7 @@ void kvmppc_xive_cpu_get_state(XiveTCTX *tctx, Error =
**errp)
>      uint64_t state[2] =3D { 0 };
>      int ret;
> =20
> -    /* The KVM XIVE device is not in use */
> -    if (xive->fd =3D=3D -1) {
> -        return;
> -    }
> +    assert(xive->fd !=3D -1);
> =20
>      ret =3D kvm_get_one_reg(tctx->cs, KVM_REG_PPC_VP_STATE, state);
>      if (ret !=3D 0) {
> @@ -156,10 +150,7 @@ void kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error *=
*errp)
>      unsigned long vcpu_id;
>      int ret;
> =20
> -    /* The KVM XIVE device is not in use */
> -    if (xive->fd =3D=3D -1) {
> -        return;
> -    }
> +    assert(xive->fd !=3D -1);
> =20
>      /* Check if CPU was hot unplugged and replugged. */
>      if (kvm_cpu_is_enabled(tctx->cs)) {
> @@ -245,10 +236,7 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, i=
nt srcno, Error **errp)
>      SpaprXive *xive =3D SPAPR_XIVE(xsrc->xive);
>      uint64_t state =3D 0;
> =20
> -    /* The KVM XIVE device is not in use */
> -    if (xive->fd =3D=3D -1) {
> -        return -ENODEV;
> -    }
> +    assert(xive->fd !=3D -1);
> =20
>      if (xive_source_irq_is_lsi(xsrc, srcno)) {
>          state |=3D KVM_XIVE_LEVEL_SENSITIVE;
> @@ -592,10 +580,7 @@ static void kvmppc_xive_change_state_handler(void *o=
paque, int running,
> =20
>  void kvmppc_xive_synchronize_state(SpaprXive *xive, Error **errp)
>  {
> -    /* The KVM XIVE device is not in use */
> -    if (xive->fd =3D=3D -1) {
> -        return;
> -    }
> +    assert(xive->fd !=3D -1);
> =20
>      /*
>       * When the VM is stopped, the sources are masked and the previous
> @@ -622,10 +607,7 @@ int kvmppc_xive_pre_save(SpaprXive *xive)
>  {
>      Error *local_err =3D NULL;
> =20
> -    /* The KVM XIVE device is not in use */
> -    if (xive->fd =3D=3D -1) {
> -        return 0;
> -    }
> +    assert(xive->fd !=3D -1);
> =20
>      /* EAT: there is no extra state to query from KVM */
> =20
> @@ -845,10 +827,7 @@ void kvmppc_xive_disconnect(SpaprInterruptController=
 *intc)
>      XiveSource *xsrc;
>      size_t esb_len;
> =20
> -    /* The KVM XIVE device is not in use */
> -    if (!xive || xive->fd =3D=3D -1) {
> -        return;
> -    }
> +    assert(xive->fd !=3D -1);
> =20
>      /* Clear the KVM mapping */
>      xsrc =3D &xive->source;
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--mSxgbZZZvrAyzONB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8rkHMACgkQbDjKyiDZ
s5IrMg/+P1IouHHEJleRxI7pzhvJPZtM6+kd/0+TveMEabFkQEMMEgeI9LNNWatE
1sHunSxi8kAzeGE7ZuR6M0hz+5vrW/s9Y6mGhIctnbPtxg8OC11PcGH3yvqGHPBj
aXoV+00FXbuOJg9XBqt7yCJYavkPOtfYKH39FKB+GaUV5BmtW91vw2KHKmRTQj85
U7od1ET3VDeeeIALRW+aQl6+gFcbMxO0YjBetvxQfIjD/UNzpMcgXPmGnhVKLc/+
A+I0MhcEWdNpN4jWXxW7auwiWgBJDC+liXljEVHPoI2kaJp2iNZZdDSNKEVz2Mpv
AygGFJYN+eADXerknuybG6ztaEe1oVvawIRJLjsAu6eKXf5JEd4ZpaqLX3lp+JBY
Cl0p0zqhwLlouioVTqRCM6pOxDhZNHUhbayV6EX6jF1z9g1XFt4kpce1WygwtXLe
Q0PSoTHDlFAj6KtdausclJmkRMlbVt6EaN4Tuxkl8GrHGJpESS3zl3tFDbmO3iQp
hawzn+XUF/KbWTWfdVEyjlihdkHdpmQFLZzj4hmwxdmm/NPGcssFxg0ERuU4Bju5
Kuy02abvftx0ZrrtrYTg/hKivnYoUzTMEjkibX8ruxqYyn7OjaDxhL6zvp50f5JE
enN9svC3cQAsac22RQN9dOAdbU7b29ShRyvFf+89RII4TuhE+d4=
=XAg+
-----END PGP SIGNATURE-----

--mSxgbZZZvrAyzONB--

