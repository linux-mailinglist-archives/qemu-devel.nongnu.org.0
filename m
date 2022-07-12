Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C5157150D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 10:49:37 +0200 (CEST)
Received: from localhost ([::1]:56890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBBaK-0002QJ-Mm
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 04:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oBBDh-0004B2-7F; Tue, 12 Jul 2022 04:26:13 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:51657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oBBDd-0005E4-Gt; Tue, 12 Jul 2022 04:26:12 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Lhv380GjRz4xj3; Tue, 12 Jul 2022 18:25:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1657614356;
 bh=l3BVeZux9lXdrs6I2SN2GMrjQMDgMJsU+e09EdM5TJg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i5rJoyukYiNOFhC5OlLQX6lY+4rOMmUWReP9nbIwcoXIAN6nor2+fheGj7DE6f3Xx
 75pz1LaBlS9IgE+OooXuD6iN94TuzvqoimFWjtazJH0XqieeKdrNn7NQmAreylJBmJ
 71xf4luIV+t5cXBm8LtL6lyJVBtF6z0wFwyNBR14=
Date: Tue, 12 Jul 2022 13:46:08 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 mopsfelder@gmail.com, Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH] target/ppc/kvm: Skip ".." directory in kvmppc_find_cpu_dt
Message-ID: <YszugDqguoCKti0j@yekko>
References: <20220711193743.51456-1-muriloo@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HJX0rSrVuO+SlPSu"
Content-Disposition: inline
In-Reply-To: <20220711193743.51456-1-muriloo@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--HJX0rSrVuO+SlPSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2022 at 04:37:43PM -0300, Murilo Opsfelder Araujo wrote:
> Some systems have /proc/device-tree/cpus/../clock-frequency. However,
> this is not the expected path for a CPU device tree directory.
>=20
> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  target/ppc/kvm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 6eed466f80..c8485a5cc0 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -1877,6 +1877,12 @@ static int kvmppc_find_cpu_dt(char *buf, int buf_l=
en)
>      buf[0] =3D '\0';
>      while ((dirp =3D readdir(dp)) !=3D NULL) {
>          FILE *f;
> +
> +        /* Don't accidentally read from the upper directory */
> +        if (strcmp(dirp->d_name, "..") =3D=3D 0) {

It might not be causing problems now, but it would be technically more
correct to also skip ".", wouldn't it?

> +            continue;
> +        }
> +
>          snprintf(buf, buf_len, "%s%s/clock-frequency", PROC_DEVTREE_CPU,
>                   dirp->d_name);
>          f =3D fopen(buf, "r");

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HJX0rSrVuO+SlPSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmLM7msACgkQgypY4gEw
YSII/BAAyIhxKuyrldUHibwbxNkVx9LnCPOzCdPz277SYGTtCvsW9FTc/kVJ+un+
hFYIk7MlRIqjAP1fddu4uhWyMBgQlvoli4FU//3+x228xlmKVgsWizSvn+PF44BP
ySMhijHwTldIFDmBXdzrLshpXgGp51w7K/IkCGXChyHgt6fi8kSY2QM4SDRAG9yb
TEcXDMwGbgRo5ZAbZHUmgdHojkOzAZp5urMbrRju8vyvngVwFVnz5MJR8KDQmyhv
1Lmy7JGsMhDnpn/O24t6Er/f3t9xpaOXzH9Ew5/XtAR7poUn8WwEwWUzcXoq7GDj
WaFNxL0t6go11zWYqIXqfoSkoVLPkkmQ9NQbz7i6oKEgYf2/QMPkZqbKfOl2aWQW
uO9Avml5lH0ciaFgn4CT7TjUzmSvPQvKHK1frGjJWaa0VkMDSVSWNV0jXtQbvQx4
884wXs7c3WsY2asOYqhVTDOnFT6Gb2lVk5ytCsX+E03jTa2/e6a8aGIn8lviXkX1
S5KX9xWbG2ERBWHmYjC2Pqi4AAXxUCk+hDGoloi4WYBsW3NdgHlGqt+OuSZ2YEHw
DaArqm05+UCvGq3bz1likgSQ0DvVSduWjDjIkrQ7Gx/e4R9K+yLlGfb3gnxlY4W0
yU97qhejuEZmXKjGNTuuKKyj7Y5Bq//VN14/g1qPDLvdvJpoLto=
=74zn
-----END PGP SIGNATURE-----

--HJX0rSrVuO+SlPSu--

