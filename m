Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2714C3CD7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 05:00:50 +0100 (CET)
Received: from localhost ([::1]:55464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNRmi-0001so-NE
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 23:00:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nNRhO-0007rw-Il; Thu, 24 Feb 2022 22:55:20 -0500
Received: from [2404:9400:2221:ea00::3] (port=43157 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nNRhF-0001PN-SY; Thu, 24 Feb 2022 22:55:17 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4K4bWm1jpYz4xcl; Fri, 25 Feb 2022 14:55:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1645761300;
 bh=RsL1DLYAAuDPVD9oCgv5UKahXi5viM2SFnc3xnR5mqk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iSdAnDFmlHhF1on4tPw5vMG0j59H/gl4xE8Ldsu3t8GIS85Xevw3JpX2f26Ow/RTv
 5kn7rBtIR6amSlCeeLYlC5NBPKkrIpA1eT0v/eVNaMTY0DLElyDw6OGCliK+IcDgdD
 tPTUyjjaBGRruX177KV66pPihMBWP+pG+FU0RQ78=
Date: Fri, 25 Feb 2022 14:15:07 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH 1/4] target/ppc: TCG: Migrate tb_offset and decr
Message-ID: <YhhJu9HcctgA7xx2@yekko>
References: <20220224185817.2207228-1-farosas@linux.ibm.com>
 <20220224185817.2207228-2-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AvbmaSNCbl+82rgp"
Content-Disposition: inline
In-Reply-To: <20220224185817.2207228-2-farosas@linux.ibm.com>
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
Cc: aik@ozlabs.ru, danielhb413@gmail.com, qemu-devel@nongnu.org,
 npiggin@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--AvbmaSNCbl+82rgp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 24, 2022 at 03:58:14PM -0300, Fabiano Rosas wrote:
> These two were not migrated so the remote end was starting with the
> decrementer expired.
>=20
> I am seeing less frequent crashes with this patch (tested with -smp 4
> and -smp 32). It certainly doesn't fix all issues but it looks like it
> helps.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Nack.  This completely breaks migration compatibility for all ppc
machines.  In order to maintain compatibility as Richard says new info
has to go into a subsection, with a needed function that allows
migration of existing machine types both to and from a new qemu
version.

There are also some other problems.

> ---
>  target/ppc/machine.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index 1b63146ed1..7ee1984500 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -9,6 +9,7 @@
>  #include "qemu/main-loop.h"
>  #include "kvm_ppc.h"
>  #include "power8-pmu.h"
> +#include "hw/ppc/ppc.h"
> =20
>  static void post_load_update_msr(CPUPPCState *env)
>  {
> @@ -666,6 +667,18 @@ static const VMStateDescription vmstate_compat =3D {
>      }
>  };
> =20
> +static const VMStateDescription vmstate_tb_env =3D {
> +    .name =3D "cpu/env/tb_env",

Because spapr requires that all cpus have synchronized timebases, we
migrate the timebase state from vmstate_spapr, not from each cpu
individually, to make sure it stays synchronized across migration.  If
that's not working right, that's a bug, but it needs to be fixed
there, not just plastered over with extra information transmitted at
cpu level.

> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_INT64(tb_offset, ppc_tb_t),

tb_offset isn't a good thing to put directly in the migration stream.
tb_offset has kind of non-obvious semantics to begin with: when we're
dealing with TCG (which is your explicit case), there is no host TB,
so what's this an offset from?  That's why vmstate_ppc_timebase uses
an explicit guest timebase value matched with a time of day in real
units.  Again, if there's a bug, that needs fixing there.

> +        VMSTATE_UINT64(decr_next, ppc_tb_t),
> +        VMSTATE_TIMER_PTR(decr_timer, ppc_tb_t),

You're attempting to migrate decr_next and decr_timer, but not the
actual DECR value, which makes me suspect that *is* being migrated.
In which case you should be able to reconstruct the next tick and
timer state in a post_load function on receive.  If that's buggy, it
needs to be fixed there.

> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  const VMStateDescription vmstate_ppc_cpu =3D {
>      .name =3D "cpu",
>      .version_id =3D 5,
> @@ -696,12 +709,16 @@ const VMStateDescription vmstate_ppc_cpu =3D {
>          /* Backward compatible internal state */
>          VMSTATE_UINTTL(env.hflags_compat_nmsr, PowerPCCPU),
> =20
> +        VMSTATE_STRUCT_POINTER_V(env.tb_env, PowerPCCPU, 1,
> +                                 vmstate_tb_env, ppc_tb_t),
> +
>          /* Sanity checking */
>          VMSTATE_UINTTL_TEST(mig_msr_mask, PowerPCCPU, cpu_pre_2_8_migrat=
ion),
>          VMSTATE_UINT64_TEST(mig_insns_flags, PowerPCCPU, cpu_pre_2_8_mig=
ration),
>          VMSTATE_UINT64_TEST(mig_insns_flags2, PowerPCCPU,
>                              cpu_pre_2_8_migration),
>          VMSTATE_UINT32_TEST(mig_nb_BATs, PowerPCCPU, cpu_pre_2_8_migrati=
on),
> +
>          VMSTATE_END_OF_LIST()
>      },
>      .subsections =3D (const VMStateDescription*[]) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--AvbmaSNCbl+82rgp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIYSbMACgkQgypY4gEw
YSJ+qhAAnjk7PrpWdD7tOs+ujfuMGHtGwophzNQ2EjgAmjz6OEhG6YtkYka96cnQ
RHb9duriTw1s/9vDUo0hLJO5CLrHOhXxuA4hlptpdb9PogBFp4TP/UGcV7qEP14d
s2Zsexib5oRf81I/11yv5vUvHXZdchx9Y2RdAaXZ5cDNU1Np4spIotqgwUwi5LS0
NB3EPOzlzdLZO6f/5WbmOM0l7TKu0rXmwkPJCb6W1W2+tR76U4xLuHbxXKKfWPgd
eh4RVGNG+m7/WQhhqqfOWlbIOgJesPU5BFhIWXCDWmh4q8ugIAzLHbmn3Q36vcC9
KI8D0CgsKmKNT4hXC9y9V5zWCfMR+eALX0H2SIiGpknldoZSiwMLfw+3s4VR590H
SvpNOtp5Ze+yubxE9exbomFlwHg3Efie9X1x1MyCwIGJo9wUwLdET5MocUTJjXzN
T52lToxmOI6d6ckWXTfHC6WhZW81NXSCyrKSSfUPt/FH4P5fGYeYAJg19Z1Ycvw+
ay4AVX8vU1/VzUetlnXoz5iAFNSHlbgsxJRA5a2nYk+NE20fsO8tzVaF4mTjXLo8
BYsALhSKDE7Mk8+lHyZAw2UsQc9bKmAMWIqwS9uQDpfrfaJSg22UYKY/upXlQJVg
bgSj+kFFzm9EipBw5aTBucUwgrcyOtaFPEhDmWSLSUhOsif9sM8=
=LJtA
-----END PGP SIGNATURE-----

--AvbmaSNCbl+82rgp--

