Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC4E4C81BD
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 04:45:59 +0100 (CET)
Received: from localhost ([::1]:48068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOtSX-0005UF-Ht
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 22:45:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nOtNO-0003kB-WD; Mon, 28 Feb 2022 22:40:39 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:49809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nOtNL-000678-Rl; Mon, 28 Feb 2022 22:40:38 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4K731B6Qdbz4xnG; Tue,  1 Mar 2022 14:40:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1646106030;
 bh=EFJpdCyj23jmH3d1oBHvhHAlWvfbnoDtM7lYcnBLG+U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NifK/lAJU8VLw9dMftDtlf0rs1S2v0YKR3cmaanlqbuB/Dksp0eCuh/y7KqPjVccq
 xnF6uLZha/UuMjCfhsRUZISBGw3mhL9qRHkq2TdOeUNGOQUsw0nUNtbjKlTTTdsR5r
 KOuLZJtLKAfXs/8jRjjXosLxgWbBMIxz8K3i3SMU=
Date: Tue, 1 Mar 2022 14:15:15 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 04/14] hw/ppc/spapr_caps.c: use g_autofree in
 spapr_cap_get_string()
Message-ID: <Yh2PwyZVRlLJWtH9@yekko>
References: <20220228175004.8862-1-danielhb413@gmail.com>
 <20220228175004.8862-5-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9gMd0tDFEUrO1vcl"
Content-Disposition: inline
In-Reply-To: <20220228175004.8862-5-danielhb413@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9gMd0tDFEUrO1vcl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2022 at 02:49:54PM -0300, Daniel Henrique Barboza wrote:
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr_caps.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index aab313ffb1..2773f9db9e 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -95,12 +95,12 @@ static void spapr_cap_set_bool(Object *obj, Visitor *=
v, const char *name,
>  }
> =20
> =20
> -static void  spapr_cap_get_string(Object *obj, Visitor *v, const char *n=
ame,
> -                                  void *opaque, Error **errp)
> +static void spapr_cap_get_string(Object *obj, Visitor *v, const char *na=
me,
> +                                 void *opaque, Error **errp)
>  {
>      SpaprCapabilityInfo *cap =3D opaque;
>      SpaprMachineState *spapr =3D SPAPR_MACHINE(obj);
> -    char *val =3D NULL;
> +    g_autofree char *val =3D NULL;
>      uint8_t value =3D spapr_get_cap(spapr, cap->index);
> =20
>      if (value >=3D cap->possible->num) {
> @@ -111,7 +111,6 @@ static void  spapr_cap_get_string(Object *obj, Visito=
r *v, const char *name,
>      val =3D g_strdup(cap->possible->vals[value]);
> =20
>      visit_type_str(v, name, &val, errp);
> -    g_free(val);
>  }
> =20
>  static void spapr_cap_set_string(Object *obj, Visitor *v, const char *na=
me,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9gMd0tDFEUrO1vcl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIdj7wACgkQgypY4gEw
YSIRNg/9FGj53i7+gxWyLvtQgeKJpM8Y5N/iwBFPagm2cFI7TM/b/9QjxCQ3jvju
LvPnDeUDU/xEHI8eSwmFnbKkCNrsBGZSkdQKnZUOqY2PoZfakiMDUeiBIjN13NS9
QFrwOPuan4+X4dWdIYeAzOq7dHZIwQMS4DEk1WRshLtvYJ2+DimF9HStvWufe4gz
ReIGI+W48D54QHsnTicv0mim73eSqGh+6ZpNny8/JJvPBjjuBKF1c6b2bD+fRu1I
9xf2eOcO53DbbvukIc/ya8palogBepUHBBmIF8YqSfheI1JM/wfdv5/UekWXwKJI
uY+UUNWnOz6Jzm26pZfmjlRXP1RbkC4LExrDzH6cySFTzO1Vnp4vksEzkjDgBSYz
+MAl1G0E50QpyVP6hnDiZcBnfmNgbdsDQ4uxyIp2ERK7eMGO2NdFS+LsnEqtNuN8
70emAtxNOKraoI2g7hpTf5zGfevcIGicocwh0LFQXqku/upTQGGf/nvfzDCNV27h
xTc3hAaCskcEX8wOKdnqXlhMZYs+Z3yQovgw4L2Ab4TySM7JIYkMIaHtuVNXG0X5
CANK5Rh/QL92Jp0rGf6eL8TckxDC7T8gGAW1FDAKisuBo4rRgeXuhlLaEJgbOyAS
FTuKzxk1jAyzq69OEtY+uNWvJkcmnBC8KShUvj4XMVU3pKk/hvc=
=unv7
-----END PGP SIGNATURE-----

--9gMd0tDFEUrO1vcl--

