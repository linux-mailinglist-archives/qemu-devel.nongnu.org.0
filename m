Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DA838854C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 05:32:30 +0200 (CEST)
Received: from localhost ([::1]:38608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljCwd-0001Nd-LO
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 23:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljCuM-0006yE-42; Tue, 18 May 2021 23:30:06 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56627 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljCuH-0006hq-JX; Tue, 18 May 2021 23:30:05 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlJK16Pnhz9sX1; Wed, 19 May 2021 13:29:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621394997;
 bh=OMf7Tl0iTVj5YxPZWx4jmEReX5oAF9+/qwRo3fkC3Ag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tu3Jz3VZHqZGX4brlLVMi6eDORCIrZxHL3YxUmLix611kXXdMP47bX9DuKeAkVq46
 sFg9yvts3X1/6qc12QHdjtAIWoVxuZ8x7U5HgF/WVAs1Th1ofg1P4g8bhBSKvWifee
 LB1BLR3e6u+zKI9frBfau6mmko3qckfdaxzZqklY=
Date: Wed, 19 May 2021 10:46:40 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] Fix `lxvdsx` (issue #212)
Message-ID: <YKRf8LUQh5l/l00r@yekko>
References: <20210517214032.156187-1-pc@us.ibm.com> <YKMZwVmfec0IocfV@yekko>
 <91759ae2-f1f0-f839-6938-1271165e0a10@gmail.com>
 <20210518093038.28ca0c3d@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KNE7CP3sqj3putl8"
Content-Disposition: inline
In-Reply-To: <20210518093038.28ca0c3d@bahia.lan>
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Paul A. Clarke" <pc@us.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--KNE7CP3sqj3putl8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 18, 2021 at 09:30:38AM +0200, Greg Kurz wrote:
> On Tue, 18 May 2021 08:40:36 +0200
> Giuseppe Musacchio <thatlemon@gmail.com> wrote:
>=20
> > The ISA [1] specifies the load order to be the target one, hence
> > the use of MO_TEQ in my patch (in both lxvwsx and lxvdsx).
> >=20
> > I believe the error is hidden in some of the .mak files: I could not
> > reproduce this problem with Qemu's user-mode emulation in either
> > BE nor LE mode, this lead me to discover that ppc64-softmmu.mak is
> > always defining TARGET_WORDS_BIGENDIAN=3Dy. The user-mode targets are
> > correctly split into ppc64 and ppc64le, where only the former is
> > declared as BE.
> >=20
>=20
> Yes. In system-mode emulation, modern POWER CPUs are expected to
> be able to switch from BE to LE and vice-versa at runtime. Older
> PowerPC CPUs are BE. The qemu-system-ppc64 binary is thus built
> with TARGET_WORDS_BIGENDIAN=3Dy and every place where runtime
> endianness matters need to do a check and only byteswap if needed.

Right.  With modern POWER (and ARM and several others), "target
endian" isn't really a well-defined concept, since the processor can
switch at runtime.

>=20
> Mark's suggestion in another mail of this thread is the way to go.
>=20
> > The presence of that define is unconditionally making MO_TE an alias
> > for MO_BE, that's why Paul's patch seems to fix the problem.
> >=20
> > I didn't catch this problem earlier as pretty much of our testing is
> > done using the Linux user-mode emulation.
> >=20
> > Cheers,
> > G.M.
> >=20
> > [1] https://ibm.ent.box.com/s/1hzcwkwf8rbju5h9iyf44wm94amnlcrv
> >=20
> > On 18/05/21 03:34, David Gibson wrote:
> > >=20
> > > On Mon, May 17, 2021 at 04:40:32PM -0500, Paul A. Clarke wrote:
> > >> `lxvdsx` is byte-swapping the data it loads, which it should not
> > >> do.  Fix it.
> > >>
> > >> Fixes #212.
> > >>
> > >> Fixes: bcb0b7b1a1c05707304f80ca6f523d557816f85c
> > >> Signed-off-by:  Paul A. Clarke <pc@us.ibm.com
> > >                            nit, missing '>' ...^
> > >=20
> > > I'm having a hard time convincing myself this is correct in all cases.
> > > Have you tested it with all combinations of BE/LE host and BE/LE guest
> > > code?
> > >=20
> > > The description in the ISA is pretty inscrutable, since it's in terms
> > > of the confusing numbering if different element types in BE vs LE
> > > mode.
> > >=20
> > > It looks to me like before bcb0b7b1a1c0 this originally resolved to
> > > MO_Q modified by ctx->default_tcg_memop_mask, which appears to depend
> > > on the current guest endian mode.  That's pretty hard to trace through
> > > the various layers of macros, but for reference, before bcb0b7b1a1c0
> > > this used gen_qemu_ld64_i64(), which appears to be constructed by the
> > > line GEN_QEMU_LOAD_64(ld64,  DEF_MEMOP(MO_Q)) in translate.c.
> > >=20
> > > Richard or Giuseppe, care to weigh in?
> > >=20
> > >> ---
> > >>  target/ppc/translate/vsx-impl.c.inc | 2 +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/transl=
ate/vsx-impl.c.inc
> > >> index b817d31260bb..46f97c029ca8 100644
> > >> --- a/target/ppc/translate/vsx-impl.c.inc
> > >> +++ b/target/ppc/translate/vsx-impl.c.inc
> > >> @@ -162,7 +162,7 @@ static void gen_lxvdsx(DisasContext *ctx)
> > >>      gen_addr_reg_index(ctx, EA);
> > >> =20
> > >>      data =3D tcg_temp_new_i64();
> > >> -    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_TEQ);
> > >> +    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_LEQ);
> > >>      tcg_gen_gvec_dup_i64(MO_Q, vsr_full_offset(xT(ctx->opcode)), 16=
, 16, data);
> > >> =20
> > >>      tcg_temp_free(EA);
> > >=20
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--KNE7CP3sqj3putl8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCkX/AACgkQbDjKyiDZ
s5JCvQ//Y+1HpQ6p1jVKx9x+8ET6+AsZDU0hyIeMoTupfYHr6/qlF+8YgQMtbERU
7uW+IRzfNTg8rxtPm4mH0tWqa78MuJUhoyaFfM7cOf6IActjT9seH9iQ+ntArXAH
fUaqcYIxbQYx6ve8R5VZ9zhiQOY+nhsTxL+du/du4rh/FkQJqn23pJ6KLeATD/bO
zpwSjyXSvIDuVjJZFV5sV796sLVU8MXGHxZbJTViaefpn5cBFwo9orbcVdOU/1XK
Yayqv0UMYWtT3d/cHb+PwAMZTfugSlBEiVHIaTETUEdq67/csvf8fxZhJ1qPVCFb
CdRk/Q694jvVdDToTtQVFh4QpKAhtz/16UUZV2N6BqdNIpYdFusigERsPqKWBPmn
uvO/9G22fCc9dVEcQAMiuCandsbuUnHR6WmQ3RGf1zW6y3DNOwdTq8JTZgP62326
7j6JwElLviEJDF1DZATGscYsh2RkNm/IwMJCBlXmatLPgBsr/UnLGOh8ZdVQUB2m
TFSceL6RVtVwRBq7CKElqHih9Rz7d5LnLkyWvWMIXmCAC73SJeOXLsCYtHU1uksj
moNtfbGw86LXZr6Hdzsv+9KZVPQUI7MvDebJpl5cQhJw5AHNsDKmLXjahG7TGrI1
rsWlT0cbeVL2v1SNZSbqAq200ec6rK8ZnDf1PpD2B2VNfZ0qrIM=
=4XAp
-----END PGP SIGNATURE-----

--KNE7CP3sqj3putl8--

