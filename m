Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B33124B7FCE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 06:00:29 +0100 (CET)
Received: from localhost ([::1]:42588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCQW-0001el-Ka
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 00:00:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7X-0001HI-Cx; Tue, 15 Feb 2022 23:40:58 -0500
Received: from [2404:9400:2221:ea00::3] (port=56655 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7V-0000Q6-8y; Tue, 15 Feb 2022 23:40:51 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y33r9vz4y4j; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=ht4xcyzdyLWBRPX3PsMbrGKmIdmQVVq73wRugcGK430=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AZsQw0dmTWPnfrYV4stobFABt8/DIHst7KaMtjsOAox3IUo9ES0bKTgGZem5gMEjl
 2difoucOHol8VmB2noqnXXbE8gH0fLLWpnqfPQjLwe9nQpe/k4PN9pt3QLah7yIOVH
 8j0k0TUVBy0BFhMAC/EVF57SRFKi4EJeY00sUQ3s=
Date: Wed, 16 Feb 2022 13:50:39 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 19/27] target/ppc: cpu_init: Reuse init_proc_604 for the
 604e
Message-ID: <YgxmfyUJDPvZTfa4@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-20-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="btYZXcTZVzEx086g"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-20-farosas@linux.ibm.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2404:9400:2221:ea00::3
 (failed)
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--btYZXcTZVzEx086g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:40PM -0300, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu_init.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 8fbd205699..32f99373dc 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -3926,18 +3926,8 @@ POWERPC_FAMILY(604)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_604E(CPUPPCState *env)
>  {
> -    register_ne_601_sprs(env);
> -    register_sdr1_sprs(env);
> -    register_604_sprs(env);
> +    init_proc_604(env);
>      register_604e_sprs(env);
> -
> -    /* Memory management */
> -    register_low_BATs(env);
> -    init_excp_604(env);
> -    env->dcache_line_size =3D 32;
> -    env->icache_line_size =3D 32;
> -    /* Allocate hardware IRQ controller */
> -    ppc6xx_irq_init(env_archcpu(env));
>  }
> =20
>  POWERPC_FAMILY(604E)(ObjectClass *oc, void *data)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--btYZXcTZVzEx086g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMZnkACgkQgypY4gEw
YSL2ShAAq/fPcSIhk1yNTW9j6XX6YjwiB6BmLXGpExVZMbYFWZnpHq0eYY7he3Ni
sM2eZ8DzbSMtFHvzERSKWZDt+AzEfFifoXoclYTwucFBM117iexjlgC7iQplGFyl
CSsFVJ0Klzf12jE6gaWlOUfvCcaGWkEfcUY+RMW2aGmOrGV1eddpwHHvrEAFgAEd
MWZWNZ69XyUFGdDZr9SSGd9fn085JcoYtq2fsaeE+Q8aJ7Gm5ekNxnUU5jM5kDyF
VyDjxUxp9YqXdtbgOOUmTnnWaBZRdlZwbBz4xjOzKxT9x7sUExCrk76UaD0GvdYG
CjyivYs7K+yct/BD02LMCutmJeFec3V+Piw9UK/24l3BxB+cVLW5jn8uisC+Bd32
0tGICrJn3NtiaitFGnV0taxvursWxvYZ56U2U/bKWwCuIWgGULXNQQMevrI7ePcM
WQI74or9mFSPTtQ+1g/x6x9KqhaD63uQ3TZ7VSpGYUnU+LokO9cjGzX3ba6Wyf0O
ihUQ+eRePWuWOPaKIOnF0AyqYsUWwUrDalQ0vM/VJ+FiS7xMfeklIsnSgIkJyOwQ
NzaTaln2z+Dl/rMg1dEhjslfqXjvO7lcYVH9a+HMOaDNDdy1ZWtvztxBcCVaeRO6
qRoLFldE5PgBy2TNohDnBK5fltoQANBikhIWYRkdseBIJGtteEY=
=0EeV
-----END PGP SIGNATURE-----

--btYZXcTZVzEx086g--

