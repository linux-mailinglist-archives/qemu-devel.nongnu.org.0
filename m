Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B466A3CF154
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 03:28:22 +0200 (CEST)
Received: from localhost ([::1]:57446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5eYX-0001zR-Mx
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 21:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m5ePv-0000wq-Uz; Mon, 19 Jul 2021 21:19:27 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59899 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m5ePt-000474-1b; Mon, 19 Jul 2021 21:19:27 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GTLTh5gyFz9sSs; Tue, 20 Jul 2021 11:19:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626743960;
 bh=2UpqO/LyrDCp5KrvG2O5mfZicv+JfMy4Z9lihjaSv88=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W4zfLonwjhLs+nYfBW7v4K+gbugKHod8AZDoWK5ujC1iwZVbJsbfpOkDZHRhUWN8l
 RCg2AqE85LFB4+8E5df8lc1KcpVfedV16LTwy5M1SbkGvzBjtYjWH22uU6IAfkad8Q
 bUhPNGOP8kz7+HuOyq9vq3db+RKcsMa8FVa7V0iI=
Date: Mon, 19 Jul 2021 22:09:44 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH] target/ppc: Ease L=0 requirement on cmp/cmpi/cmpl/cmpli
 for ppc32
Message-ID: <YPVriLeXtw3EICzu@yekko>
References: <20210715122950.2366428-1-matheus.ferst@eldorado.org.br>
 <YPTmoCh2z2VXzc7O@yekko>
 <4b66ae32-375-1be1-f485-e4d86f2c5a2f@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="g5k43VLWIMtuwz/y"
Content-Disposition: inline
In-Reply-To: <4b66ae32-375-1be1-f485-e4d86f2c5a2f@eik.bme.hu>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, richard.henderson@linaro.org,
 matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--g5k43VLWIMtuwz/y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021 at 12:21:11PM +0200, BALATON Zoltan wrote:
> On Mon, 19 Jul 2021, David Gibson wrote:
> > On Thu, Jul 15, 2021 at 09:29:50AM -0300, matheus.ferst@eldorado.org.br=
 wrote:
> > > From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> > >=20
> > > In commit 8f0a4b6a9, we started to require L=3D0 for ppc32 to match w=
hat
> > > The Programming Environments Manual say:
> > >=20
> > > "For 32-bit implementations, the L field must be cleared, otherwise
> > > the instruction form is invalid."
> > >=20
> > > Further digging, however, shown that older CPUs have different behavi=
or
> > > concerning invalid forms. E.g.: 440 and 405 manuals say that:
> > >=20
> > > "Unless otherwise noted, the PPC440 will execute all invalid instruct=
ion
> > > forms without causing an Illegal Instruction exception".
> > >=20
> > > While the PowerISA has an arguably more restrictive:
> > >=20
> > > "In general, any attempt to execute an invalid form of an instruction
> > > will either cause the system illegal instruction error handler to be
> > > invoked or yield boundedly undefined results."
> >=20
> > That's actually less restrictive.  "boundedly undefined" lets the
> > implementation do nearly anything that won't mess up a hypervisor.
> > Both ignoring the illegal bits and issuing an invalid instruction
> > exception are definitely permissible within the meaning of "boundedly
> > undefined".
> >=20
> > > Finally, BALATON Zoltan (CC'ed) reported that the stricter behavior
> > > broke AROS boot on sam460ex. This patch address this regression by on=
ly
> > > logging a guest error, except for CPUs known to raise an exception for
> > > this case (e500 and e500mc).
> >=20
> > So.. as a rule of thumb, I'd prefer to have qemu give explicit
> > failures (e.g. program check traps) where there's implementation
> > specific or architecture undefined behaviour.  On the other hand,
> > having a real guest that relies on the specific behaviour of real
> > implementations is a compelling reason to break that rule of thumb.
>=20
> One still should get log messages about it with -d guest_errors so that c=
an
> be used for identifying problems with guest code that otherwise runs fine=
 on
> real CPU.
>=20
> > Given it's a behavioural change, I'm disinclined to squeeze this in
> > for qemu-6.1, but I'll consider it for 6.2.  Richard, any thoughts?
>=20
> Well, it's a regression from 6.0 and delaying it to 6.2 means we would ha=
ve

Ah, well that changes everything.  The commit message should
definitely mention that it's a regression.

> a release with a known issue that prevents a guest from running which cou=
ld
> be fixed by this patch so I argue this is a bug fix that should be in 6.1.
> The behaviour change was the patch this one fixes (8f0a4b6a9, mentioned in
> commit message but could also be a Fixes: tag).
>=20
> Regards,
> BALATON Zoltan
>=20
> > > Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> > > ---
> > >  target/ppc/translate/fixedpoint-impl.c.inc | 58 ++++++++++++++++++++=
+-
> > >  1 file changed, 56 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/=
translate/fixedpoint-impl.c.inc
> > > index f4fcfadbfc..1c35b60eb4 100644
> > > --- a/target/ppc/translate/fixedpoint-impl.c.inc
> > > +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> > > @@ -145,8 +145,35 @@ TRANS64(PSTD, do_ldst_PLS_D, false, true, MO_Q)
> > >=20
> > >  static bool do_cmp_X(DisasContext *ctx, arg_X_bfl *a, bool s)
> > >  {
> > > +    if ((ctx->insns_flags & PPC_64B) =3D=3D 0) {
> > > +        /*
> > > +         * For 32-bit implementations, The Programming Environments =
Manual says
> > > +         * that "the L field must be cleared, otherwise the instruct=
ion form is
> > > +         * invalid." It seems, however, that most 32-bit CPUs ignore=
 invalid
> > > +         * forms (e.g., section "Instruction Formats" of the 405 and=
 440
> > > +         * manuals, "Integer Compare Instructions" of the 601 manual=
), with the
> > > +         * notable exception of the e500 and e500mc, where L=3D1 was=
 reported to
> > > +         * cause an exception.
> > > +         */
> > > +        if (a->l) {
> > > +            if ((ctx->insns_flags2 & PPC2_BOOKE206)) {
> > > +                /*
> > > +                 * For 32-bit Book E v2.06 implementations (i.e. e50=
0/e500mc),
> > > +                 * generate an illegal instruction exception.
> > > +                 */
> > > +                return false;
> > > +            } else {
> > > +                qemu_log_mask(LOG_GUEST_ERROR,
> > > +                        "Invalid form of CMP%s at 0x" TARGET_FMT_lx =
", L =3D 1\n",
> > > +                        s ? "" : "L", ctx->cia);
> > > +            }
> > > +        }
> > > +        gen_op_cmp32(cpu_gpr[a->ra], cpu_gpr[a->rb], s, a->bf);
> > > +        return true;
> > > +    }
> > > +
> > > +    /* For 64-bit implementations, deal with bit L accordingly. */
> > >      if (a->l) {
> > > -        REQUIRE_64BIT(ctx);
> > >          gen_op_cmp(cpu_gpr[a->ra], cpu_gpr[a->rb], s, a->bf);
> > >      } else {
> > >          gen_op_cmp32(cpu_gpr[a->ra], cpu_gpr[a->rb], s, a->bf);
> > > @@ -156,8 +183,35 @@ static bool do_cmp_X(DisasContext *ctx, arg_X_bf=
l *a, bool s)
> > >=20
> > >  static bool do_cmp_D(DisasContext *ctx, arg_D_bf *a, bool s)
> > >  {
> > > +    if ((ctx->insns_flags & PPC_64B) =3D=3D 0) {
> > > +        /*
> > > +         * For 32-bit implementations, The Programming Environments =
Manual says
> > > +         * that "the L field must be cleared, otherwise the instruct=
ion form is
> > > +         * invalid." It seems, however, that most 32-bit CPUs ignore=
 invalid
> > > +         * forms (e.g., section "Instruction Formats" of the 405 and=
 440
> > > +         * manuals, "Integer Compare Instructions" of the 601 manual=
), with the
> > > +         * notable exception of the e500 and e500mc, where L=3D1 was=
 reported to
> > > +         * cause an exception.
> > > +         */
> > > +        if (a->l) {
> > > +            if ((ctx->insns_flags2 & PPC2_BOOKE206)) {
> > > +                /*
> > > +                 * For 32-bit Book E v2.06 implementations (i.e. e50=
0/e500mc),
> > > +                 * generate an illegal instruction exception.
> > > +                 */
> > > +                return false;
> > > +            } else {
> > > +                qemu_log_mask(LOG_GUEST_ERROR,
> > > +                        "Invalid form of CMP%s at 0x" TARGET_FMT_lx =
", L =3D 1\n",
> > > +                        s ? "I" : "LI", ctx->cia);
> > > +            }
> > > +        }
> > > +        gen_op_cmp32(cpu_gpr[a->ra], tcg_constant_tl(a->imm), s, a->=
bf);
> > > +        return true;
> > > +    }
> > > +
> > > +    /* For 64-bit implementations, deal with bit L accordingly. */
> > >      if (a->l) {
> > > -        REQUIRE_64BIT(ctx);
> > >          gen_op_cmp(cpu_gpr[a->ra], tcg_constant_tl(a->imm), s, a->bf=
);
> > >      } else {
> > >          gen_op_cmp32(cpu_gpr[a->ra], tcg_constant_tl(a->imm), s, a->=
bf);
> >=20
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--g5k43VLWIMtuwz/y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD1a4gACgkQbDjKyiDZ
s5KrSA//YdnYNtJyByu2gi4Cc1Vx9DbQbvj1Aqw5zx3AQk7M8CLqwbhOSJEybYZ9
MTa4bR1R+stGH1hdwXz8YsM9rwxWER1FJ1ngahvP4+YClaQxfhQTtRqQxPZ+ODX1
pHIrWJLvH3G2OVwYByYKmHl3BSRP+MhQ8JqQcxj2U0dLEdrzFhRrYxgKuNQvS2BY
gHle/C4rJpK/tbKUFrd96yv1jZ61NpcivXxUilsiwfKWJEFAhZven7rEZaad/3Z7
egqi8uMTCBmdpU2m/YoZ2zB7RO8L0Td3Ma28hFExd59ITWUrqUNOF7W4RQG0+1nB
o7x0cPHFiJ4nDLIykotGhmngjYODx7nZJp6H3hfTm5Qqi80RBSwwi+q6pljLoiT1
L3N08d8y/FjV+uJ9EVpGC+QXEROWHr4io8GB3D3Y9TU6gzRSFxZRMvc8/02z8M7D
zGsS4d0tJjiZQGu5Pd8shoEPyxWYG+GwAbfhBD+Lx/YMD0sSANA0Iz59fPetoPBI
lPPeY5q4HoMpdIZvArd0FddwAv58+CmTF9ll0fpq12zEt0lqnpv23DZpel88L1om
9O3hdeeQ0AkUXxaRdTAnoUqdtr/KURDrhqwWb6lXe/TQH1+01jFNAiirJNTMTHWz
r6q4zxtNQtEaEGpHp4de3V4Qpf2iwrBMep0liCMXEEpIfRYvdV8=
=e81j
-----END PGP SIGNATURE-----

--g5k43VLWIMtuwz/y--

