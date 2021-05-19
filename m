Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40738388559
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 05:34:55 +0200 (CEST)
Received: from localhost ([::1]:45140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljCz0-0005qz-Ai
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 23:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljCuO-0006zz-VO; Tue, 18 May 2021 23:30:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43145 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljCuI-0006hp-22; Tue, 18 May 2021 23:30:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlJK15xDXz9sW1; Wed, 19 May 2021 13:29:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621394997;
 bh=xuYsxJcqRq70yJ+b+fj59KLS9HX/VIb2wIQDFiHieRI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PUB2KsM7uSEErdoJEMAVA3IYLvV0OGjUDf4HaM+xSrx6KYhqGpmV4qvYUb85XJX5m
 vxmaIivBqNktZj5NqYe3Rx2LbIGLj2EwzH8vlAIYMo5QXbyFxWp2kdALMRser0Ehhy
 WNXiiyYSjmEdlCDWR2cRcp0PgypabbZ2lIAWjkCo=
Date: Wed, 19 May 2021 10:43:42 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Paul A. Clarke" <pc@us.ibm.com>
Subject: Re: [PATCH v2] target/ppc: Fix load endianness for lxvwsx/lxvdsx
Message-ID: <YKRfPuYlni7zBRbI@yekko>
References: <20210518133020.58927-1-thatlemon@gmail.com>
 <20210518154209.GB6890@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FaU4tCgAYvpog6wz"
Content-Disposition: inline
In-Reply-To: <20210518154209.GB6890@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--FaU4tCgAYvpog6wz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 18, 2021 at 10:42:09AM -0500, Paul A. Clarke wrote:
> Thanks, all!  My original patch which addressed this issue
> for me probably should've been labeled as an RFC.  Thanks for your
> willingness to review it, in spite of its problems.  It was a bit
> of a stab in the dark. I hope it at least helped get to this solution.
>=20
> Tested-by: Paul A. Clarke <pc@us.ibm.com>
>=20
> Do I need to do anything about the GitLab issue?
> https://gitlab.com/qemu-project/qemu/-/issues/212

If you could retest and close the issue once the fix is merged, that
would be helpful, thanks.

>=20
> (I couldn't even figure out how to subscribe to my own issue,
> or if I already was, or who might have been notified of its
> existence, or if discussion should happen there or here.)
>=20
> On Tue, May 18, 2021 at 03:30:20PM +0200, Giuseppe Musacchio wrote:
> > TARGET_WORDS_BIGENDIAN may not match the machine endianness if that's a
> > runtime-configurable parameter.
> >=20
> > Fixes: bcb0b7b1a1c05707304f80ca6f523d557816f85c
> > Fixes: afae37d98ae991c0792c867dbd9f32f988044318
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/212
> >=20
> > Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
> > ---
> >  target/ppc/translate/vsx-impl.c.inc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate=
/vsx-impl.c.inc
> > index b817d31260..57a7f73bba 100644
> > --- a/target/ppc/translate/vsx-impl.c.inc
> > +++ b/target/ppc/translate/vsx-impl.c.inc
> > @@ -139,7 +139,7 @@ static void gen_lxvwsx(DisasContext *ctx)
> >      gen_addr_reg_index(ctx, EA);
> > =20
> >      data =3D tcg_temp_new_i32();
> > -    tcg_gen_qemu_ld_i32(data, EA, ctx->mem_idx, MO_TEUL);
> > +    tcg_gen_qemu_ld_i32(data, EA, ctx->mem_idx, DEF_MEMOP(MO_UL));
> >      tcg_gen_gvec_dup_i32(MO_UL, vsr_full_offset(xT(ctx->opcode)), 16, =
16, data);
> > =20
> >      tcg_temp_free(EA);
> > @@ -162,7 +162,7 @@ static void gen_lxvdsx(DisasContext *ctx)
> >      gen_addr_reg_index(ctx, EA);
> > =20
> >      data =3D tcg_temp_new_i64();
> > -    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_TEQ);
> > +    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, DEF_MEMOP(MO_Q));
> >      tcg_gen_gvec_dup_i64(MO_Q, vsr_full_offset(xT(ctx->opcode)), 16, 1=
6, data);
> > =20
> >      tcg_temp_free(EA);
>=20
> PC
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FaU4tCgAYvpog6wz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCkXz4ACgkQbDjKyiDZ
s5J0FBAAlCbdhwiP3SY8SLTTXP/vV6ww7aveuyShGqBOeWvxW9NZmL11siIx4m03
y3XFk8Z7KrC3cppZ0fBB7OmTwu0FySiay841PpxqndjgrMrG359x5IOxrYBv5Igj
9FBLg7WMjM0/YKEBppjAArXNlut+Ve7Bv00y5hm+mEXm/15XFoj7AJBvRZyejJ/J
ql6qcb3zd9Y3aSVwe1TFLcXHdwJ4cU0/pd2LG4K7RJl9VnqwoeZYxitWRG8ysqui
0VdVGE/DETyIcGecumJ/sW4SJb+EkRKuGySoh36xMXwQAShR0nJr1HUOp8HJOhUZ
YvnoIf3WVBWbJtz/crQaZRWu/TkiKn97H8JRSecrtXHnVAb78qyoLBQNgn25DeAU
yZDUlqJA2X4V1Gf5utb7aOcllqT7DAoT1pWWk0RgpS78Ox37+YFaQY3Ggt/CzRDw
JgvHyuJzOCpojwGpDpErPKRcvuwx+Lmd1X2bwoc7ejSBKiu4TR7NVnF5V/mLgj+q
VMrWQkJ01FpwMMldAREMEX8tYh9Wfw0/sCv6LdqQK1LV2h9j+N3TxKiFaxw88jUj
/inH1V4IzaMjvZhQSCh3SbdAAWImUg4LUSjxBpWRzFRJa1/t1CK971jhgU1ODu5t
g//kMZTdEyYUeo7MgN+rMQeGd2RaQ3h+Iy2+RQRsBVpD0rNtWU0=
=OFT+
-----END PGP SIGNATURE-----

--FaU4tCgAYvpog6wz--

