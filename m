Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836A449324B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 02:25:11 +0100 (CET)
Received: from localhost ([::1]:48026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9zio-0006Je-22
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 20:25:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n9zcR-0004h5-8e; Tue, 18 Jan 2022 20:18:37 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=60449
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n9zcL-00081H-9d; Tue, 18 Jan 2022 20:18:33 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jdnp648C8z4y3m; Wed, 19 Jan 2022 12:18:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1642555102;
 bh=sWS/T3xjWzADiZX+hNnG4XnQGybHi3H13FKaHuhSZ7Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RgPv1T3q7sFYVmYN4cngHYFLhpyEUpY4HIaISDbGnaWGHj6cvvLphZJtitSOWYot7
 E5Rxonob0mpMhgrL1FBkO/qssLMWGAN/c3O+XgfbLirZ2tTRywv7dvBCE3UC57qSXU
 /76Je5ftvh66WsaeceeCiwVifPn5F3Ymxg7AJGtw=
Date: Wed, 19 Jan 2022 10:27:50 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] meson.build: Use a function from libfdt 1.5.1 for the
 library check
Message-ID: <YedM9icYA+S5OMT7@yekko>
References: <20220118170548.97288-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5Uof2MeR3Bni/4SR"
Content-Disposition: inline
In-Reply-To: <20220118170548.97288-1-thuth@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--5Uof2MeR3Bni/4SR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 06:05:48PM +0100, Thomas Huth wrote:
> The fdt version test in meson.build uses a function from libfdt v1.4.7,
> but we require version 1.5.1 nowadays. Thus use a function that has
> been introduced in that version instead.
>=20
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/822
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meson.build b/meson.build
> index 762d7cee85..d1cc04c7a2 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2276,7 +2276,7 @@ if have_system
>      if fdt.found() and cc.links('''
>         #include <libfdt.h>
>         #include <libfdt_env.h>
> -       int main(void) { fdt_check_full(NULL, 0); return 0; }''',
> +       int main(void) { fdt_find_max_phandle(NULL, NULL); return 0; }''',
>           dependencies: fdt)
>        fdt_opt =3D 'system'
>      elif fdt_opt =3D=3D 'system'

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5Uof2MeR3Bni/4SR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmHnTO0ACgkQgypY4gEw
YSJuHQ/9F0V124p0EVF8Rx4RuBUftjk4s+1g76KY4NpuweD49vfZcRj6k5JungQE
wYwnd3LWBkpmObDWs44ViTPMc5nCAE+/G2eiNV2j7Zc09Nc16AQ0WLLdTtUX4mhO
/0tAe5Uwh707D8cef2i/W8yPqq8MSH3E+YFpIhffgTJCzJctsqsGqK0UapE7xR4s
qhhDFSqn/MQbim3DneltmOjjweD8Rzpj4+KSZo5IoM/IFESxu0A68z+Ks8LAvaFZ
evw2G8wpU1HFuqjlDbZkR879K6yd/KEsC0OxjajGsFZl6Nlsqo4K9xyK13S3f0nE
gH91PK/lFthdDk+UIjT+iKnYf1uc6pUeAzrdyJu19+VLxNB8kiLfsgXusoD9AqSy
MWuZCr/hhK+UywXT6589amws/MiJ9N8KfYwQVG13No1spucUaKyHB7DxDfgsLNRK
NI7jMiGD/CIpHdTvmDm4oDLuAy3ciEm33y1YnzhJWf6ixgKPdUkQcA8qp0wHfpMN
8WQRNlwKUqwBzZlYawP8LS5vpc6ewmJiBKSJy4HY9AzqAoqZGVuiyc/DdTtPmg1P
Zh3duBu3YSb0BLITI/0T+eR/O3JsWIAn51bkxKWjqwSgxiet2CzxQ33WlRnEhQvw
IT48bJg6xa+cQbBHjFAJirxaGCiC0x6DP+fQkV98QvZGCsdKHCc=
=3Jbe
-----END PGP SIGNATURE-----

--5Uof2MeR3Bni/4SR--

