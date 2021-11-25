Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B7945D374
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 04:10:12 +0100 (CET)
Received: from localhost ([::1]:57820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq59G-0000uf-WF
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 22:10:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mq56i-0007dS-WB; Wed, 24 Nov 2021 22:07:33 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=39525
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mq56g-0003ZG-7w; Wed, 24 Nov 2021 22:07:32 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J02qD6R4vz4xcM; Thu, 25 Nov 2021 14:07:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1637809640;
 bh=lruCAk1ia2Bx64u2IlwhSSr7mz0u3H8/GFiLT6DlgNA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZmYUN8dh0ypuCX9gNl/tMPiM/JzylrC7sAhkMaT1SBFSCmdoLO56UI3u507LT+SAO
 i3vKNumS1G/wG8kykvz8aqtsRXm1cCzXn0JDkVgkLFzJQlXaFusKzrTyfVx7cUg5Fd
 VzIFo727GRkBEBI/c4XQgTdcWlBJ6Jpkq8UwOUNM=
Date: Thu, 25 Nov 2021 13:59:57 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v3 1/3] target/ppc: Fixed call to deferred exception
Message-ID: <YZ78LSQVRU7YqAvu@yekko>
References: <20211124172523.3598396-1-lucas.araujo@eldorado.org.br>
 <20211124172523.3598396-2-lucas.araujo@eldorado.org.br>
 <ad28911-f3e6-a95b-2541-4cacc1a3626e@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mMO3M2H9IKELHFo2"
Content-Disposition: inline
In-Reply-To: <ad28911-f3e6-a95b-2541-4cacc1a3626e@eik.bme.hu>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, danielhb413@gmail.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org, pc@us.ibm.com, matheus.ferst@eldorado.org.br,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--mMO3M2H9IKELHFo2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 01:49:46AM +0100, BALATON Zoltan wrote:
> On Wed, 24 Nov 2021, Lucas Mateus Castro (alqotel) wrote:
> > mtfsf, mtfsfi and mtfsb1 instructions call helper_float_check_status
> > after updating the value of FPSCR, but helper_float_check_status
> > checks fp_status and fp_status isn't updated based on FPSCR and
> > since the value of fp_status is reset earlier in the instruction,
> > it's always 0.
> >=20
> > Because of this helper_float_check_status would change the FI bit to 0
> > as this bit checks if the last operation was inexact and
> > float_flag_inexact is always 0.
> >=20
> > These instructions also don't throw exceptions correctly since
> > helper_float_check_status throw exceptions based on fp_status.
> >=20
> > This commit created a new helper, helper_fpscr_check_status that checks
> > FPSCR value instead of fp_status and checks for a larger variety of
> > exceptions than do_float_check_status.
> >=20
> > Since fp_status isn't used, gen_reset_fpstatus() was removed.
> >=20
> > The hardware used to compare QEMU's behavior to was a Power9.
> >=20
> > Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org=
=2Ebr>
> > ---
> > target/ppc/fpu_helper.c            | 48 ++++++++++++++++++++++++++++++
> > target/ppc/helper.h                |  1 +
> > target/ppc/translate/fp-impl.c.inc |  9 ++----
> > 3 files changed, 52 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> > index c4896cecc8..bb72715827 100644
> > --- a/target/ppc/fpu_helper.c
> > +++ b/target/ppc/fpu_helper.c
> > @@ -414,6 +414,54 @@ void helper_store_fpscr(CPUPPCState *env, uint64_t=
 val, uint32_t nibbles)
> >     ppc_store_fpscr(env, val);
> > }
> >=20
> > +void helper_fpscr_check_status(CPUPPCState *env)
> > +{
> > +    CPUState *cs =3D env_cpu(env);
> > +    target_ulong fpscr =3D env->fpscr;
> > +    int error =3D 0;
> > +
> > +    if ((fpscr & FP_OX) && (fpscr & FP_OE)) {
> > +        error =3D POWERPC_EXCP_FP_OX;
> > +    } else if ((fpscr & FP_UX) && (fpscr & FP_UE)) {
> > +        error =3D POWERPC_EXCP_FP_UX;
> > +    } else if ((fpscr & FP_XX) && (fpscr & FP_XE)) {
> > +        error =3D POWERPC_EXCP_FP_XX;
> > +    } else if ((fpscr & FP_ZX) && (fpscr & FP_ZE)) {
>=20
> I wonder if these tests could be simplified by combining the masks if you
> want to test for both bits set so e.g. fpscr & (FP_ZX | FP_ZE) should be =
the
> same, shouldn't it?

No, it's not.  In fact your version is equivalent as a boolean to
	((fpscr & FP_ZX) || (fpscr & FP_ZE))

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--mMO3M2H9IKELHFo2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGe/CgACgkQbDjKyiDZ
s5I4tg//fimK0FJKQQScLiV3A/q7b/LStb0klwlLa1usdoqQmJIb6u6uRz2L6LFp
bD1EGkDLKr79J5O+4HPyBeAyeZSSMbZEeIhYAqOe+WMv+jcYOZO0h1g+aocawXUz
qyINO+D/TkJ/o/nKqmBC297WaXZkODo6NlTmV+FG3X4CftJaeSRrp+HchMPUkQN/
wkw3NogaV6lzZBPj20XwDplyS/a66+n93+AM0jzMscWuhDz0yA//tiqC5CYs/i8g
eWFXU86OxqjApHgCFQxE5KdRsgcByQobSI/dkdKdqz4UY3flYDNwVYJ354G741yu
W6FsELFCdPjfcfZKKE2gh3x56Jc4QejLD4X8dO28t6fRbxknDZ9O7T10gHzUDCa7
MMPWjeVF/r4K2U6BpJHWUENkt0PmPakBPB4aAEtjhwYZPWPos/EoBWkCOAomdKJ9
u/ZYpF8bdQsGCfnh7XR8t+nENJckx9Lvf2TuIYg9Q8/ZhoR72GW421RmytHX4zL6
MBJ0c7CGHVgzibmWzZn0icmSTvtHchGdtOGoUIWbhGkDK5m9u1E3u7y6ANslXxMf
lVz2iklMf1/FnCGvVLcuWz/bCnLaIyTsZwdt4NXF869YDm2+KWiBlCabdbplW9ov
4g3HaRd4ifQ1y2s7CCPLUqEDk2lvFzikDC34F2VZ2E/Mnd6DZRA=
=/YD1
-----END PGP SIGNATURE-----

--mMO3M2H9IKELHFo2--

