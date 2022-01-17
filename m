Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 166644900C1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 05:17:02 +0100 (CET)
Received: from localhost ([::1]:48678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9JS1-0000cl-2w
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 23:17:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n9JMo-0006Gb-0G
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 23:11:38 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=49179
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n9JMl-0003CM-51
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 23:11:37 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jcdkj29WKz4y4p; Mon, 17 Jan 2022 15:11:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1642392685;
 bh=MvciGaojKnVxvNYtKv68ZXr9FJqofOhluZxX10xonAM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S6olyj04OK33wfkI+Gzl7zE+ODT9I1z0GGt+NUja33uWfQUi1LDsAm4NK6T9BJcX1
 FgNs5wuUPSLvQWAv9uu+4IJ7Yl5ZO7VPCrtRQNAwAc7aE0lBDBBOExgkKSescX50Ow
 oPWwm0Lb2GVtI58SPwvTM3Y6ifFhpNCOnX2foFvA=
Date: Mon, 17 Jan 2022 12:16:54 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH] softmmu: Provide a clue as to why device tree loading
 failed
Message-ID: <YeTDhrIB/g0i41Bq@yekko.fritz.box>
References: <20220116114649.40859-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wpmJLnrc3R1EpmVm"
Content-Disposition: inline
In-Reply-To: <20220116114649.40859-1-shentey@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: qemu-trivial@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wpmJLnrc3R1EpmVm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 16, 2022 at 12:46:49PM +0100, Bernhard Beschow wrote:
> fdt_open_into() obligingly returns an error code in case the operation
> failed. So be obliging as well and use it in the error message.
>=20
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  softmmu/device_tree.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 3965c834ca..31d1066940 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -60,7 +60,8 @@ void *create_device_tree(int *sizep)
>      }
>      ret =3D fdt_open_into(fdt, fdt, *sizep);
>      if (ret) {
> -        error_report("Unable to copy device tree in memory");
> +        error_report("%s: Unable to copy device tree into memory: %s",
> +                     __func__, fdt_strerror(ret));
>          exit(1);
>      }
> =20
> @@ -104,7 +105,8 @@ void *load_device_tree(const char *filename_path, int=
 *sizep)
> =20
>      ret =3D fdt_open_into(fdt, fdt, dt_size);
>      if (ret) {
> -        error_report("Unable to copy device tree in memory");
> +        error_report("%s: Unable to copy device tree into memory: %s",
> +                     __func__, fdt_strerror(ret));
>          goto fail;
>      }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wpmJLnrc3R1EpmVm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmHkw3sACgkQgypY4gEw
YSKv8w/9GHJ0L0QXMxPqJ9C30bgTak2btdLqGFl5Og3gtUnRi7+9HWI5UeSHHJkt
ZslxeKbcmRS2ypC9TOUVr66sRDpHI2d77H7We+kowNXkJER74Oq+c9QPBoajL+cY
iIZF7vx7a1fnDcl6BRZBUqbrmD3voG92xI4O2AypVRP1jiUNdj52W4+Yw8+9yR0K
sCDWhU0nE7Gy8wlUzfDyJYqBYVRCHXR1fwQdDDbzS73RFwQCbYLJibN+emOjGJF4
MJCJ7wrIvRrgoIDPg900eN6lT1q5GmU5wW/M/4Ho1fpXwC43Z9/CgqMmqz52kYKg
2XqnAjWd/yw1L5oCgVtvWr9W1HYqWhYA/Cr/AY6XGWfZ/YbeM428nhlalLWW6WXw
wD7osMy/fhAbyqiSeGaFm6Z6WZBGPxaIgoAK70gdC2sXRipZNu5rVuhxNDuAPT3/
CMIty/Sk3o0nFWaXGI1CUVsuVgDVVKeSaBPuahGMgfx47m8HHmZyxEM/4Wara/kt
eV7f457fhNlJegosyJipcQiHMqtkTpCwdJCXUaXchwr7at3rn9FFbf+6P62xmRdN
Hkl8UkWgW8QkxvRih5pKbmmD61Miu9upMuOgMNIhE+fv7w2eAaiOlSIotG+0RqZa
Sfxj22cisnaObzOm8emBjUBC1Q1enU+n5RttZcPioflFqxZ5wgU=
=Ew13
-----END PGP SIGNATURE-----

--wpmJLnrc3R1EpmVm--

