Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B60F14C8067
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 02:37:43 +0100 (CET)
Received: from localhost ([::1]:43324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOrSQ-0001cE-GB
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 20:37:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nOrM5-0007Zk-3r; Mon, 28 Feb 2022 20:31:10 -0500
Received: from [2404:9400:2221:ea00::3] (port=57075 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nOrLx-0000ej-Cf; Mon, 28 Feb 2022 20:31:08 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4K707d1CrKz4xmt; Tue,  1 Mar 2022 12:30:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1646098253;
 bh=aGopEZTKWllE7N7e4JtRw/Ek+3bvab5GdwmRnv0+0+g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ezSTRlwu1ywKyl7b74T3Rpis7a5e1yQye2OrF9Jsiq55KrgXDjKJufjlK08BvrroD
 qmZi/gk+YvJH1iHD+Dz5ziyCdOblc96C6hXJOxOatxCNkUC9PJSKLDNYoLm8vwheV/
 WdPPKFElnR0FH4unFU9n7KrM5uXadk+gg0ERFMXE=
Date: Tue, 1 Mar 2022 11:58:39 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 01/14] hw/ppc/spapr.c: use g_autofree in spapr_dt_chosen()
Message-ID: <Yh1vv0BaY4D4lH4E@yekko>
References: <20220228175004.8862-1-danielhb413@gmail.com>
 <20220228175004.8862-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Nxl8DlG9EB/K4LVA"
Content-Disposition: inline
In-Reply-To: <20220228175004.8862-2-danielhb413@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2404:9400:2221:ea00::3
 (failed)
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


--Nxl8DlG9EB/K4LVA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2022 at 02:49:51PM -0300, Daniel Henrique Barboza wrote:
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index f0b75b22bb..c74543ace3 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1018,9 +1018,9 @@ static void spapr_dt_chosen(SpaprMachineState *spap=
r, void *fdt, bool reset)
> =20
>      if (reset) {
>          const char *boot_device =3D spapr->boot_device;
> -        char *stdout_path =3D spapr_vio_stdout_path(spapr->vio_bus);
> +        g_autofree char *stdout_path =3D spapr_vio_stdout_path(spapr->vi=
o_bus);
>          size_t cb =3D 0;
> -        char *bootlist =3D get_boot_devices_list(&cb);
> +        g_autofree char *bootlist =3D get_boot_devices_list(&cb);
> =20
>          if (machine->kernel_cmdline && machine->kernel_cmdline[0]) {
>              _FDT(fdt_setprop_string(fdt, chosen, "bootargs",
> @@ -1087,9 +1087,6 @@ static void spapr_dt_chosen(SpaprMachineState *spap=
r, void *fdt, bool reset)
>          }
> =20
>          spapr_dt_ov5_platform_support(spapr, fdt, chosen);
> -
> -        g_free(stdout_path);
> -        g_free(bootlist);
>      }
> =20
>      _FDT(spapr_dt_ovec(fdt, chosen, spapr->ov5_cas, "ibm,architecture-ve=
c-5"));

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Nxl8DlG9EB/K4LVA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIdb7cACgkQgypY4gEw
YSKbnRAAx3kDSw7MCVKn/Xy2BjP16zKFTQFEAp6YKgVuhBguiXKY2fKq7yoep2XF
U1TegfWiyXkzSEc0KI3RN61giivz7/W4HxWrH8y/ZS3v4Q1PGxn8qDRs+VuatzMF
jqBLXji+03mJ9hMfdQEQ1HCg68b9yM7Ti3XsKEfjqRGf/96k/MeYNzjzF63oE+bs
3ZQdBHAeGv65zBjT0R2aY2aGeTjsWAtJfeMbcI9rEtlJT3SwAH4Ng+5lDowdAccJ
hlzLWDdAJu3ucPL5fHcB5cgVcCLFuNibcBLP3M952zyYboekIY8HomJXNDH7S6E/
JPb69Y7BFsByDiw+PDVUWNtGRYZnC4S9CFauVUumBD9PPLA2IcX2W4T8LpEc6DhM
EoL9yJrEvcIsCi0AGfmAVKIKrz7aCy+DfZNvcd/5urBItp1s8m/RrVZ1UmSAChfU
X8whz9bB4c8QVWjBiUm7NJ8vGSyDHpmEQ7v2BFE1WITjmp/rc29UoI9SaiEZ8Y+g
wWvDnIlusALAtK7sozRlRk9YMdi3InSlsaAkgDdWcjgIlRQBfY4wtgBcOiFIpAZ0
CYJoWO5Z/BTzxLqYDeSjyVVrx5YOiqIOKqETDZeaMYsFzrCSfSTaUZwwjQfCULNe
ZHh0qHlcmzDHw1R5mN/CWQndm4SsbA+LIcSuz3Ug450TbzJW5rs=
=PHGk
-----END PGP SIGNATURE-----

--Nxl8DlG9EB/K4LVA--

