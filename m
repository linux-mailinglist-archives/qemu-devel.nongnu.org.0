Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BCA487027
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 03:08:34 +0100 (CET)
Received: from localhost ([::1]:38952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5egC-00075p-Lb
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 21:08:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n5ebp-0006FL-9E; Thu, 06 Jan 2022 21:04:01 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:52157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n5ebl-0005p6-FC; Thu, 06 Jan 2022 21:04:01 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JVRN65RYhz4xts; Fri,  7 Jan 2022 13:03:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1641521030;
 bh=SRtx+kmuCmuJMXElb3K2OzTFiY1XHP174HDFa9hZiFs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Abc8rnG5Ibka73v3A1508K1wkVZZO2WKfJz3xIxoiQRoN6IAL1AywNErpwmd8G0kA
 Pac+1l7eNpgiqFo/jqI/6Bq68XsxT3zhpkPN273mwryd+l1sSgVaa+D/xOlxgK76mL
 NA0xcJ6EdQuEX215TcMOOqx8HQRq5h6gA8BQpiwo=
Date: Fri, 7 Jan 2022 12:06:18 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [RFC PATCH] target/ppc: Remove xscmpnedp instruction
Message-ID: <YdeSCktdUYcyb+bh@yekko>
References: <20220106112318.13864-1-victor.colombo@eldorado.org.br>
 <722ded34-a09a-b94a-3182-64686ad0150c@kaod.org>
 <20220106140201.5237cb05@bahia>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Y8uKIQFwS3i8Ojwl"
Content-Disposition: inline
In-Reply-To: <20220106140201.5237cb05@bahia>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?V=EDctor?= Colombo <victor.colombo@eldorado.org.br>,
 qemu-ppc@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Y8uKIQFwS3i8Ojwl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 06, 2022 at 02:02:01PM +0100, Greg Kurz wrote:
> On Thu, 6 Jan 2022 13:21:46 +0100
> C=E9dric Le Goater <clg@kaod.org> wrote:
>=20
> > On 1/6/22 12:23, V=EDctor Colombo wrote:
> > > xscmpnedp was added in ISA v3.0 but removed in v3.0B. This patch
> > > removes this instruction as it was not in the final version of v3.0.
> > >=20
> > > RFC to know if you think this is the correct approach.
> >=20
> > Usually we deprecate a feature for a minimum of two releases before
> > removing it. It might be overkill for this case since the P9 processor
> > implementation is based on v3.0B.
> >=20
> > I would simply remove the instruction since it never existed on any
> > supported HW. I will wait for some more feedback.
> >=20
>=20
> I don't think it makes sense to keep this instruction if it only
> existed in pre-GA HW.

I agree.  If we have a vistigial POWER9 DD1 in the cpu table we should
probably remove that anyway.

> Acked-by: Greg Kurz <groug@kaod.org>

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

>=20
> > Reviewed-by: C=E9dric Le Goater <clg@kaod.org>
> >=20
> > Thanks,
> >=20
> > C.
> >=20
> >=20
> > > Signed-off-by: V=EDctor Colombo <victor.colombo@eldorado.org.br>
> > > ---
> > >   target/ppc/fpu_helper.c             | 1 -
> > >   target/ppc/helper.h                 | 1 -
> > >   target/ppc/translate/vsx-impl.c.inc | 1 -
> > >   target/ppc/translate/vsx-ops.c.inc  | 1 -
> > >   4 files changed, 4 deletions(-)
> > >=20
> > > diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> > > index e5c29b53b8..f030858cf9 100644
> > > --- a/target/ppc/fpu_helper.c
> > > +++ b/target/ppc/fpu_helper.c
> > > @@ -2270,7 +2270,6 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *x=
t,                             \
> > >   VSX_SCALAR_CMP_DP(xscmpeqdp, eq, 1, 0)
> > >   VSX_SCALAR_CMP_DP(xscmpgedp, le, 1, 1)
> > >   VSX_SCALAR_CMP_DP(xscmpgtdp, lt, 1, 1)
> > > -VSX_SCALAR_CMP_DP(xscmpnedp, eq, 0, 0)
> > >  =20
> > >   void helper_xscmpexpdp(CPUPPCState *env, uint32_t opcode,
> > >                          ppc_vsr_t *xa, ppc_vsr_t *xb)
> > > diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> > > index f9c72dcd50..8f02cabaf5 100644
> > > --- a/target/ppc/helper.h
> > > +++ b/target/ppc/helper.h
> > > @@ -400,7 +400,6 @@ DEF_HELPER_5(xsnmsubdp, void, env, vsr, vsr, vsr,=
 vsr)
> > >   DEF_HELPER_4(xscmpeqdp, void, env, vsr, vsr, vsr)
> > >   DEF_HELPER_4(xscmpgtdp, void, env, vsr, vsr, vsr)
> > >   DEF_HELPER_4(xscmpgedp, void, env, vsr, vsr, vsr)
> > > -DEF_HELPER_4(xscmpnedp, void, env, vsr, vsr, vsr)
> > >   DEF_HELPER_4(xscmpexpdp, void, env, i32, vsr, vsr)
> > >   DEF_HELPER_4(xscmpexpqp, void, env, i32, vsr, vsr)
> > >   DEF_HELPER_4(xscmpodp, void, env, i32, vsr, vsr)
> > > diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/transla=
te/vsx-impl.c.inc
> > > index c08185e857..fbef496257 100644
> > > --- a/target/ppc/translate/vsx-impl.c.inc
> > > +++ b/target/ppc/translate/vsx-impl.c.inc
> > > @@ -1092,7 +1092,6 @@ GEN_VSX_HELPER_X1(xstsqrtdp, 0x14, 0x06, 0, PPC=
2_VSX)
> > >   GEN_VSX_HELPER_X3(xscmpeqdp, 0x0C, 0x00, 0, PPC2_ISA300)
> > >   GEN_VSX_HELPER_X3(xscmpgtdp, 0x0C, 0x01, 0, PPC2_ISA300)
> > >   GEN_VSX_HELPER_X3(xscmpgedp, 0x0C, 0x02, 0, PPC2_ISA300)
> > > -GEN_VSX_HELPER_X3(xscmpnedp, 0x0C, 0x03, 0, PPC2_ISA300)
> > >   GEN_VSX_HELPER_X2_AB(xscmpexpdp, 0x0C, 0x07, 0, PPC2_ISA300)
> > >   GEN_VSX_HELPER_R2_AB(xscmpexpqp, 0x04, 0x05, 0, PPC2_ISA300)
> > >   GEN_VSX_HELPER_X2_AB(xscmpodp, 0x0C, 0x05, 0, PPC2_VSX)
> > > diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translat=
e/vsx-ops.c.inc
> > > index c974324c4c..67fa7b2e41 100644
> > > --- a/target/ppc/translate/vsx-ops.c.inc
> > > +++ b/target/ppc/translate/vsx-ops.c.inc
> > > @@ -197,7 +197,6 @@ GEN_XX3FORM_NAME(xsnmsubdp, "xsnmsubmdp", 0x04, 0=
x17, PPC2_VSX),
> > >   GEN_XX3FORM(xscmpeqdp, 0x0C, 0x00, PPC2_ISA300),
> > >   GEN_XX3FORM(xscmpgtdp, 0x0C, 0x01, PPC2_ISA300),
> > >   GEN_XX3FORM(xscmpgedp, 0x0C, 0x02, PPC2_ISA300),
> > > -GEN_XX3FORM(xscmpnedp, 0x0C, 0x03, PPC2_ISA300),
> > >   GEN_XX3FORM(xscmpexpdp, 0x0C, 0x07, PPC2_ISA300),
> > >   GEN_VSX_XFORM_300(xscmpexpqp, 0x04, 0x05, 0x00600001),
> > >   GEN_XX2IFORM(xscmpodp,  0x0C, 0x05, PPC2_VSX),
> > >=20
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Y8uKIQFwS3i8Ojwl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHXkggACgkQbDjKyiDZ
s5IemxAAvJVztY+2/fyW//Z+e6yS7uWKov6EmWUyQkRE+/Q1muPcUk1SMFpqzolX
0JgwH1h7lAJrIDWqqKi0zdfzYJI83tvhqpQalafmSHKro8now1rlFJ5xnB8HYdj0
dPqiK5U9EhpOUpuka15eZimyPcsMadAEjOqBw8UWh4H5zn3qY6DhH+ij9oSkmv4E
6b2mkZdBKp0/8FLy5BWGxFUd5QpZe+udxlT91mm1aqr1CgYKTuGFFr6ZZzDY8Dnn
G5ahDG8zAVdkAkkA84QlRMbfQgGGHOrgWniS9Fb8ktPHs30YHEkVkHvlmy2Bvv8I
5Qv9AW1Z3L2Gd17xSBGlsg2rOX/3hVPYZgrz5i3BzLns+bzGMpXdk9i/ZlS5qlw2
0L0/vC1OoZGAVQA2B9TIZLfHDxkhlI8imnXI+h+hDLhyIyz37Cn41v+rlBRwFKY9
MczBZp1cVUhY4/ay67vT+YiRfZueR9+OMuONyeu/wl2/+up107pL7MVOlMmqLL6i
C63H7YhoIBPs9l6Jtd7Wsf+xSDXSYXN8/PlCsYes79T5AB1cQdjYx7I2I0kr5z3k
Ae/+q92pjj9epMc6P0rErQZow3EjKH8kqAwGVPNQSd+7WjcYoU5SsDAHjsSBM9ex
EWoChM7n9m8TMLU8Lukg0Ia4MyGFwap05dK+KuNbYvynFv7eD7s=
=jQ+G
-----END PGP SIGNATURE-----

--Y8uKIQFwS3i8Ojwl--

