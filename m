Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 483AF572D92
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 07:46:03 +0200 (CEST)
Received: from localhost ([::1]:34954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBVCD-0007BN-TZ
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 01:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oBV5q-0003Ju-La; Wed, 13 Jul 2022 01:39:27 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:38801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oBV5m-0003Nr-9f; Wed, 13 Jul 2022 01:39:25 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4LjRJN2lgFz4xvg; Wed, 13 Jul 2022 15:39:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1657690756;
 bh=cfcfIjCC8HFWyChx6wu8RcceSqxLHx4e/S3vSAFUSUs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=goyZ+yhDdl9GtONcD2OuQo0FJj7T2t9+ZCJ8iMh9WDL/jEnNgwQoMjFtMiNvCUEac
 HvQ47PC/m32ePAE+q6pL542ytCcezmE9oR57TRuY1rXTymDRi5cxeL5rBfB01w1ePJ
 6uvGtrq28GOgBrIGVfdKl/LiClZBwCr7HeidoYPM=
Date: Wed, 13 Jul 2022 11:54:45 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 mopsfelder@gmail.com, Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2] target/ppc/kvm: Skip current and parent directories
 in kvmppc_find_cpu_dt
Message-ID: <Ys4l5SThIxQVq+W5@yekko>
References: <20220712210810.35514-1-muriloo@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="E+h0PnVZHyb85s/f"
Content-Disposition: inline
In-Reply-To: <20220712210810.35514-1-muriloo@linux.ibm.com>
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


--E+h0PnVZHyb85s/f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2022 at 06:08:10PM -0300, Murilo Opsfelder Araujo wrote:
> Some systems have /proc/device-tree/cpus/../clock-frequency. However,
> this is not the expected path for a CPU device tree directory.
>=20
> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

and, I believe, mea culpa.

> ---
> v2:
> - Skip current and parent directories.
>=20
> v1: https://lore.kernel.org/qemu-devel/20220711193743.51456-1-muriloo@lin=
ux.ibm.com/
>=20
>  target/ppc/kvm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 6eed466f80..466d0d2f4c 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -1877,6 +1877,12 @@ static int kvmppc_find_cpu_dt(char *buf, int buf_l=
en)
>      buf[0] =3D '\0';
>      while ((dirp =3D readdir(dp)) !=3D NULL) {
>          FILE *f;
> +
> +        /* Don't accidentally read from the current and parent directori=
es */
> +        if (strcmp(dirp->d_name, ".") =3D=3D 0 || strcmp(dirp->d_name, "=
=2E.") =3D=3D 0) {
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

--E+h0PnVZHyb85s/f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmLOJc8ACgkQgypY4gEw
YSJgdBAA1CaoOPVasHCbkhlBvmo0p6cuOInpoCtc+/RRQuhkvm7oKgTiwvZsamXO
WA9Eh5UrQSCJytxS55SHt5arx8mOW9eEjECAQcOV35GlhBsb6ncqVX2CP8hmWA0u
eDhb02q0MhfX0PhhaBeS5sDKRiFpco+lvpadZCXIzqCC6kjSd8QM9qu/8bGzcy6o
8X+q0ah8atusufrFsCky8SHrizbvX0FArF7uUKaZ6ByITqup281u8Gwi/RFKx/nD
NEVzkGRTgyRoE3FBce4aQnp+pJ0kvi2TjNPvnJFySGGS/aWVAFoPVgeSbwkCI8Tm
h27Y0ZbR3bSe1/363fy3DBKcL35paKbYTkMiwnG1tpu3fT5yrJfSuBW5ozeEsq4Y
YRFP7Nn86jF8qmvJibKdQ3xaF02yRs0w539ux4WRh8nSAP65VAKlGnyFwL5u1fuC
mP425AvYHt0wtbCFt90g4dApsLwiyTo4GYFiZXqhqbrwQl6pRhBDImvQClAy5bQd
/Dh97MS4LBSa/InlE2+Cj9BowhawhLwg4n/i174uKU7KBgwPtk5X+ATVBP9lPd7g
NPCKqlnDHE8vhVadVHULQhTQ5hyZhRtJId1eVv9/Bz413SLJ/E36pZarDPpj3aEf
wtz92JzgQ9pqpuJpwDyCGwAgp2BLcgGOM9YhxHwdLBQWfqIXGsA=
=WZZq
-----END PGP SIGNATURE-----

--E+h0PnVZHyb85s/f--

