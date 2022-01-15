Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6455548F599
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 08:23:03 +0100 (CET)
Received: from localhost ([::1]:37596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8dOv-0001PY-H3
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 02:23:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n8d7v-00071P-2E; Sat, 15 Jan 2022 02:05:29 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:34905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n8d7p-0002Xg-Hf; Sat, 15 Jan 2022 02:05:25 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JbTh43y3wz4y4r; Sat, 15 Jan 2022 18:05:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1642230308;
 bh=WPvmAmD79gcgu//Mf3q3K8EgxqH+n2+iJrhLMl5uFXU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RNGXvwx+vap4SZ9MV4nokd+k67m5YC5cP/QD4GRTkdzaNH8DdrMpuYZggcl6InkLE
 b7pi48NCqEfyflsNhOtIJ2w/NepurbiNCJUUgPl+l32da42Lsg1+yWOMiK27PetkrS
 e9nrvgemdQ9FBEKdT+oMriSouirtxxxbBmG121cY=
Date: Sat, 15 Jan 2022 18:05:00 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 2/8] target/ppc: 405: Add missing exception handlers
Message-ID: <YeJyHK5S1PS45IQ0@yekko.fritz.box>
References: <20220110181546.4131853-1-farosas@linux.ibm.com>
 <20220110181546.4131853-3-farosas@linux.ibm.com>
 <YdznIKAOxcLRSPDl@yekko> <87tue6vvml.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bdNNydHJDpYItymS"
Content-Disposition: inline
In-Reply-To: <87tue6vvml.fsf@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--bdNNydHJDpYItymS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 14, 2022 at 06:46:10PM -0300, Fabiano Rosas wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> > On Mon, Jan 10, 2022 at 03:15:40PM -0300, Fabiano Rosas wrote:
> >> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> >> ---
> >>  target/ppc/cpu_init.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>=20
> >> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> >> index a50ddaeaae..9097948e67 100644
> >> --- a/target/ppc/cpu_init.c
> >> +++ b/target/ppc/cpu_init.c
> >> @@ -1951,7 +1951,9 @@ static void init_excp_4xx_softmmu(CPUPPCState *e=
nv)
> >>      env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
> >>      env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
> >>      env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
> >> +    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000800;
> >
> > I have a vague recollection from my days of working on 405 that there
> > may have been something funky with FP emulation on there: e.g. FP
> > instructions causing 0x700 program interrupts instead of FP unavailble
> > interrupts or something.
>=20
> Maybe this (from the manual):
>=20
>   Program - causing conditions:
>  =20
>   Attempted execution of illegal instructions, TRAP instruction,
>   privileged instruction in problem state, or auxiliary processor (APU)
>   instruction, or unimplemented FPU instruction, or unimplemented APU
>   instruction, or APU interrupt, or FPU interrupt
>  =20
>   FPU Unavailable - causing conditions:
>  =20
>   Attempted execution of an FPU instruction when MSR[FP]=3D0.
>=20
> There's also this bit:
>=20
>   Attempted execution of an APU instruction while the APUc405exception
>   signal is asserted) results in a program interrupt. Similarly, attempted
>   execution of an FPU instruction whilethe FPUc405exception signal is
>   asserted) also results in a program interrupt. The following also result
>   in program interrupts: attempted execution of an APU instruction while
>   APUc405DcdAPUOp is asserted but APUC405DcdValidOp is deasserted; and
>   attempted execution of an FPU instruction while APUc405DcdFpuOp but
>   APUC405DcdValidOp is deasserted.

Right... those do seem to suggest that FP comes in as a 0x700 rather
than 0x800.  Really hard to be sure without checking an actual chip.

> > I might be remembering incorrectly - the manual does seem to imply
> > that 0x800 FP unavailable is there as normal, but it might be worth
> > double checking this (against real hardware, if possible).
>=20
> The Linux kernel has the vectors that I'm adding disabled:
>=20
>   EXCEPTION(0x0800, Trap_08, unknown_exception) <-- FPU
>   EXCEPTION(0x0900, Trap_09, unknown_exception)
>   EXCEPTION(0x0A00, Trap_0A, unknown_exception)=20
>   EXCEPTION(0x0B00, Trap_0B, unknown_exception)
>   ...
>   EXCEPTION(0x0F00, Trap_0F, unknown_exception) <-- APU
>=20
> (0xf20 would probably cause a crash as we'd jump to the middle of the
> exception prologue)

Right.. that's fairly strong evidence that those vectors don't operate
in practice.

> Maybe I should drop this patch then? That way future developers won't
> feel tempted to raise one of these.

Maybe.  Better yet would be to verify on a chip then drop a comment in
there explicitly describing the situation

> It seems mostly inconsequential either way, what do you think?

Well, yes.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bdNNydHJDpYItymS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmHicgIACgkQgypY4gEw
YSIk8A//Zx2vPbkvJg7zS0+YenYcdcS/GBdtWGtmsAc0lfDZSWpUOoQXhyH5MgyJ
GOjSNofoRVIhYX0fXJ5OkdOWFYfTYLO3beQhg1vVhNu9/Xf8aFNGq1Zjy/x0gC7v
298b3FlB/BXJPnXIumz7QUF5jECZixK4GTgrEfaocZb1cwihVzk7xajMjz7XSJIh
wIlf4hwy3kQ2/qvw+KU3uPjk7Bjc0xBeBOQX4c9KdakdjrSBCGoxWQGMgfoZKoqv
udRDSQ1Mx1wMSvZaBrmJnK8BLUCLrf+a2v7gBqkFR/CI5IGPheJ7ztbiilURrqZS
crQ/29XCWhEeMqWGJuKM5gre33oqP7Mvs+PGsF19SjA6Tpp07dU20t5H2My8fYhF
yCQqIqGP9D6etaRJZ6BuTTwRL3i88TFoA6u9Xq4o9wD3HCPwA8XGrG9C7TSG3IqY
plts8Ul0UhYqKgaazZLwzOfDfABH4wzRN09EHDGwhxKICOAJ/nowBoazARoTncGY
Oyc6AeVuZ1qDRprxACvsEgyCxQiL+oRp+6KG5vh7i4rzcFovkoGyL5+QoYoC60rh
6DuHqvpjpog/LBRKGjJhSGKvzwUA6yLjwH3Qw7v5Af5MycOerQsU5DXnUOVVE20I
mefS6I9Vys7lToMNQF44+7SZfi23eHT+Sey+lfkzHalpaoQFyvE=
=RhWy
-----END PGP SIGNATURE-----

--bdNNydHJDpYItymS--

