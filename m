Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1038F4C81BE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 04:46:02 +0100 (CET)
Received: from localhost ([::1]:48078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOtSb-0005Ui-0W
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 22:46:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nOtNO-0003kA-WA; Mon, 28 Feb 2022 22:40:39 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:39477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nOtNM-00067B-1f; Mon, 28 Feb 2022 22:40:38 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4K731B6ZCHz4xv3; Tue,  1 Mar 2022 14:40:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1646106030;
 bh=jmU9/E9nDUC2JgnIsciw6hsOP2IgGd0Zn2EqayXBy9M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XuAidWzl9yAI2asHjgVFwown2/cq9shY9YNqouiAmFVAOCmBZxR5C6fEaFH+FLeSj
 UQs0xyGhNURbIKxwpL3PH+tIulSCnjx8NOx+LU5vX3IQWNO3Pn8WnJDtIuXtYP8zde
 1Ysg0+n9pAvvN7KzuDFTcJMBAtRsLE0agTahcSRU=
Date: Tue, 1 Mar 2022 14:15:59 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 05/14] hw/ppc/spapr_caps.c: use g_autofree in
 spapr_caps_add_properties()
Message-ID: <Yh2P71Np4J0nuk7f@yekko>
References: <20220228175004.8862-1-danielhb413@gmail.com>
 <20220228175004.8862-6-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EE51zhf5kHe9o7it"
Content-Disposition: inline
In-Reply-To: <20220228175004.8862-6-danielhb413@gmail.com>
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


--EE51zhf5kHe9o7it
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2022 at 02:49:55PM -0300, Daniel Henrique Barboza wrote:
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr_caps.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index 2773f9db9e..655ab856a0 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -930,16 +930,13 @@ void spapr_caps_add_properties(SpaprMachineClass *s=
mc)
> =20
>      for (i =3D 0; i < ARRAY_SIZE(capability_table); i++) {
>          SpaprCapabilityInfo *cap =3D &capability_table[i];
> -        char *name =3D g_strdup_printf("cap-%s", cap->name);
> -        char *desc;
> +        g_autofree char *name =3D g_strdup_printf("cap-%s", cap->name);
> +        g_autofree char *desc =3D g_strdup_printf("%s", cap->description=
);
> =20
>          object_class_property_add(klass, name, cap->type,
>                                    cap->get, cap->set,
>                                    NULL, cap);
> =20
> -        desc =3D g_strdup_printf("%s", cap->description);
>          object_class_property_set_description(klass, name, desc);
> -        g_free(name);
> -        g_free(desc);
>      }
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EE51zhf5kHe9o7it
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIdj+gACgkQgypY4gEw
YSJ1qBAAvvg+eHHvv6xnGK9MMcbut3CGIUXhEV32lewJsNcvbhfuOZXNN+pOAjBZ
kAxKDctQ3GzM/T14+tybg4t4occB2dEGMjGGRRUNMuFYGA8mZcLno5mUt/NYtmPL
LgIHIMcvCmfNme435qyau7aKx3/icwfaL8q+/tyyC873Ya1gTP0eoGAXsNCuOTBV
VAM7Bpoc4CkmvfOfOW4b9b1cHhMKU9O6PO+SqQ8slwGXTAT6g4kyKHRZi+mluNmV
Dc5CyEovdXEjk7sB1az+jbPxjBlMgR/kGfG0Lbao7ERKOjKUeLRc68JfdBvov5p0
8DTPpmfEUSct0l6j5ofAB8+oKi22xtbTELzlbgPHDNNWVJ8HumZBbvQgLt9gJlWz
CshosDZHCb+fpy+8/0/DPAd0r/9sXCf1MQFxbucpi9M/A00rUGxNcGCbS8R2Y0Zt
UaOuMA3n1q+tbAqILq15P0fuE+HzAYaDsojzTAkjV7FUJyzu9MmF2/gSaL3NHpzv
JXseuvu/xU+EdAul1NbcdjlH81u7wxI0I3hI0AocSxZ9U0vi+t2aHV/GtpAc2sCf
QlysZZTmLRvY5gETAcsUw2z5Vn+5I9Kd8etrR7OSttdcGATKbEhnhsdaVU8qPeSl
fLDedIXDMq+qOriK+jpJ6QtRE1jV6nvxG+2pgBWt8f9oGCqy1HY=
=L51r
-----END PGP SIGNATURE-----

--EE51zhf5kHe9o7it--

