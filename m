Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E00E52E34D1
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 08:47:21 +0100 (CET)
Received: from localhost ([::1]:49374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktnFQ-0007j3-Vo
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 02:47:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktn6U-0001Es-I2; Mon, 28 Dec 2020 02:38:06 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:37327 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktn6S-00048k-NX; Mon, 28 Dec 2020 02:38:06 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D48Xn6Jvxz9sWb; Mon, 28 Dec 2020 18:38:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609141081;
 bh=PBpmJGp/EkE9pPMQXJXGkYNlEqsQXE2/JJ6dfSSXLyc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IpwTPQDHphHlA0a+NzrslKBE4xUJ18hYF7ESePP87uoOGB2VzRcCd8Xb+5nz2YiOG
 wKItZ10ggohatcns7J7qHxsKvP6SrK3v/Xo1qdaCAGaStV/9MQrKtxGbf6AWigHnuy
 1i1LbwxBJw68oCtagAD9tEwsoB3szZPNMBdRwgcc=
Date: Mon, 28 Dec 2020 18:31:03 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 5/6] spapr: Add drc_ prefix to the DRC realize and
 unrealize functions
Message-ID: <20201228073103.GK6952@yekko.fritz.box>
References: <20201218103400.689660-1-groug@kaod.org>
 <20201218103400.689660-6-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0FM4RQAc0jwHekq5"
Content-Disposition: inline
In-Reply-To: <20201218103400.689660-6-groug@kaod.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0FM4RQAc0jwHekq5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 18, 2020 at 11:33:59AM +0100, Greg Kurz wrote:
> Use a less generic name for an easier experience with tools such as
> cscope or grep.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/ppc/spapr_drc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index a4d2608017c5..8571d5bafe4e 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -503,7 +503,7 @@ static const VMStateDescription vmstate_spapr_drc =3D=
 {
>      }
>  };
> =20
> -static void realize(DeviceState *d, Error **errp)
> +static void drc_realize(DeviceState *d, Error **errp)
>  {
>      SpaprDrc *drc =3D SPAPR_DR_CONNECTOR(d);
>      Object *root_container;
> @@ -530,7 +530,7 @@ static void realize(DeviceState *d, Error **errp)
>      trace_spapr_drc_realize_complete(spapr_drc_index(drc));
>  }
> =20
> -static void unrealize(DeviceState *d)
> +static void drc_unrealize(DeviceState *d)
>  {
>      SpaprDrc *drc =3D SPAPR_DR_CONNECTOR(d);
>      Object *root_container;
> @@ -579,8 +579,8 @@ static void spapr_dr_connector_class_init(ObjectClass=
 *k, void *data)
>  {
>      DeviceClass *dk =3D DEVICE_CLASS(k);
> =20
> -    dk->realize =3D realize;
> -    dk->unrealize =3D unrealize;
> +    dk->realize =3D drc_realize;
> +    dk->unrealize =3D drc_unrealize;
>      /*
>       * Reason: DR connector needs to be wired to either the machine or t=
o a
>       * PHB in spapr_dr_connector_new().
> @@ -628,7 +628,7 @@ static void realize_physical(DeviceState *d, Error **=
errp)
>      SpaprDrcPhysical *drcp =3D SPAPR_DRC_PHYSICAL(d);
>      Error *local_err =3D NULL;
> =20
> -    realize(d, &local_err);
> +    drc_realize(d, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
>          return;
> @@ -644,7 +644,7 @@ static void unrealize_physical(DeviceState *d)
>  {
>      SpaprDrcPhysical *drcp =3D SPAPR_DRC_PHYSICAL(d);
> =20
> -    unrealize(d);
> +    drc_unrealize(d);
>      vmstate_unregister(VMSTATE_IF(drcp), &vmstate_spapr_drc_physical, dr=
cp);
>      qemu_unregister_reset(drc_physical_reset, drcp);
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0FM4RQAc0jwHekq5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/pibYACgkQbDjKyiDZ
s5J3+w/5AfCQWjWpSqCM38KAuDYBIAiPUA0/lbhU7JMMO/Z6qFJ17+S60Rb813za
G365Id3jp/7ewiq4ZmHLMFkZvODFJGO5pZuFt1RcP9aTDiKQNscajcXyOXlBp8r3
t133epiyvRsUsfr3tajTZx5SVUlyEvlIsV1r80qr7N2Yq868VZsIC41hxSUJ+me1
uEJDtpdQ2AQ7eqhru/oPdNC/m3vb5R/B5Cx8TstE08d0LjyHRGQUIiIzTWZxbfbl
QH21S9aNQ1iV3caqPl+fT5dF+t5w+FHk6fByZ3NyyuGLR92u3HF2mpuhY8oRAqQ/
r0lT/KA77Ovw9DLY6TxQr1BwNe7r9FqwkapOQgNHJE7QeR0+FYs2sS3Uq95RkPtf
s/PrAOwdlKkyDZooLx8XrjeSjGu9iE+oNz6WedLqA0LasE43l9J878d3Hx98tN2G
ugNzE5M859s3rZmmTaQkNNJxIztNAJUnFj8piHkPwAFjaQ5pR4Vw72MJ9jTGGfyI
b+ruAGJh/5AUhAKpD1hvfDe8DSyNqNtgC4S8kz9ew0wUCdbOQWtGPSKAaQTSg+if
VnuEnqAMZD0G7TaKQKjAfG1T+l34jso6FsDofEpLXkTunR7JTjE9aGrhox7FwaWq
ykDETqOAKojKoqr2PX6u6NMJPyvsBn6hnR41z6/SS7HNIemZoKU=
=rFM6
-----END PGP SIGNATURE-----

--0FM4RQAc0jwHekq5--

