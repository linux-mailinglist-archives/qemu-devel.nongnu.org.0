Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E7F4B7FAF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 05:48:39 +0100 (CET)
Received: from localhost ([::1]:52400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCF4-0005Pn-D3
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 23:48:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7A-0000yj-S7; Tue, 15 Feb 2022 23:40:28 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:44731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC72-00009Z-Is; Tue, 15 Feb 2022 23:40:24 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y32HsHz4xsm; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=wJElIbzWLuV00l5DpVWlnyozObaZoie8wp0WI9cw284=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KLfcTpL9iI//aRUnRM450Zgb+l1BnPSorC5EPnhsCI2V/ININuMf9ERCoTsr67CTF
 5JX/p6bcot5nVWBHPEA0xdGo00oMT/+ey2Cmf4F8BGZR+ClTIZNp3EKRstXTySdaH1
 +QJzhxO+viLrjNs2XvOBkpymtnVmPqWZ6mJrQ/Rk=
Date: Wed, 16 Feb 2022 13:07:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 02/27] target/ppc: cpu_init: Remove G2LE init code
Message-ID: <YgxcaJS1UXmpaybv@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-3-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+VJX4bVu4PPJbqqd"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-3-farosas@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+VJX4bVu4PPJbqqd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:23PM -0300, Fabiano Rosas wrote:
> The G2LE CPU initialization code is the same as the G2. Use the latter
> for both.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu_init.c | 42 +-----------------------------------------
>  1 file changed, 1 insertion(+), 41 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 9bd5971c0c..7488001385 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -2889,53 +2889,13 @@ POWERPC_FAMILY(G2)(ObjectClass *oc, void *data)
>                   POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
>  }
> =20
> -static void init_proc_G2LE(CPUPPCState *env)
> -{
> -    register_ne_601_sprs(env);
> -    register_sdr1_sprs(env);
> -    register_G2_755_sprs(env);
> -    register_G2_sprs(env);
> -    /* Time base */
> -    register_tbl(env);
> -    /* External access control */
> -    spr_register(env, SPR_EAR, "EAR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* Hardware implementation register */
> -    spr_register(env, SPR_HID0, "HID0",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_HID1, "HID1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_HID2, "HID2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    /* Memory management */
> -    register_low_BATs(env);
> -    register_high_BATs(env);
> -    register_6xx_7xx_soft_tlb(env, 64, 2);
> -    init_excp_G2(env);
> -    env->dcache_line_size =3D 32;
> -    env->icache_line_size =3D 32;
> -    /* Allocate hardware IRQ controller */
> -    ppc6xx_irq_init(env_archcpu(env));
> -}
> -
>  POWERPC_FAMILY(G2LE)(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(oc);
>      PowerPCCPUClass *pcc =3D POWERPC_CPU_CLASS(oc);
> =20
>      dc->desc =3D "PowerPC G2LE";
> -    pcc->init_proc =3D init_proc_G2LE;
> +    pcc->init_proc =3D init_proc_G2;
>      pcc->check_pow =3D check_pow_hid0;
>      pcc->insns_flags =3D PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
>                         PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+VJX4bVu4PPJbqqd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMXGAACgkQgypY4gEw
YSJxqA//Ubd+kWURLttF2hmFEwXigoZE02/Xe/uuEq8asCleJbL4qYhVMUqF5Uzm
tJ8A20mp2NVSxgz9OyTBaKAvQjp4lfTHO+xgSvLxH99acX1/TqmaJUv0oHPLxUGq
yYeBS+ZObQ5SS70MvH5z/rfmS8Wv04jbOFIwn1K/oLVCVjfjhJ9DkxvXwoGt5tO8
k59PavJ++LGg5C/BuVho1/VEfw30cWO6DyE8IZTjJoQ4BBnx+uDHrLXixyaJIaWR
oyL/Ir49qwiUiVZy9XfBLwp6luylwuijJ18PJvgQ386oLpa+BdaEAFPldyALxuqB
Esa+idYkEcTFhQtSjUH4+kS8n5ZMILYZewTUGfWmeUuNjwwYUHbIV03mhXcN2JKi
ZdCbLs1EGfFQaDKgzryPIH7BGhgznuaPLw+5IdXQLyzjlJ9uYnG7r2aKdHUrI7K9
zFaN/6sGai0T60RGHE2dApsAg9Jckt2h+r653e4hWlCj9sAYU0NAn/DUqzyj6ym0
N+5MwqwktUrxpSbWg62UMnkNvvzVmAIIzatQ+DWn8i7hHAEOtdkIZcOb4J/8opb4
d9ro0seNGO0/TOu7kAN5v3AxhdBxErf4Z4IgTV4Gzip9LkoVcnsMhv0dqYJMHm85
kh84jJUfr7bRHRB7qBmIvGwPLIBQC7iYIHC3UnEvv3xBOd/Ls1U=
=9JIx
-----END PGP SIGNATURE-----

--+VJX4bVu4PPJbqqd--

