Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D754E418E95
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 07:14:06 +0200 (CEST)
Received: from localhost ([::1]:57062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUixp-0006Ha-QH
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 01:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUisg-00043H-1W; Mon, 27 Sep 2021 01:08:47 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:44471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUisc-0000JH-V8; Mon, 27 Sep 2021 01:08:44 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HHrJQ3lZTz4xbV; Mon, 27 Sep 2021 15:08:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632719318;
 bh=6BKvu98D9dIGERKQE3F5xawFIcqTzxpX6GLc7AYvr7Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pVB37YIamsj98nWMbk6eajdWn3BBH0JZRTkTTqXezJTMO1FptS92GMzurehUIg388
 4K4S2trhk2vcTeQtSIIGYO3/j6+XUQj47SAW2KV8rsY7reLYfot3JJR4mJJj0nfgyw
 OrVDqqphTenyw+UzqpVQYPaGiKWB2pVaL3/3ava4=
Date: Mon, 27 Sep 2021 15:04:50 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 03/15] target/ppc: PMU basic cycle count for pseries TCG
Message-ID: <YVFQ8uc7mCUhcxvA@yekko>
References: <20210903203116.80628-1-danielhb413@gmail.com>
 <20210903203116.80628-4-danielhb413@gmail.com>
 <fa7aa371-3fa0-e064-cf73-1c89508bba00@eldorado.org.br>
 <9497e03c-69c3-c736-283f-b95331f4b2e2@gmail.com>
 <b5d60603-6bd9-0323-1754-4eca8c9e5df0@eldorado.org.br>
 <3a7f42d0-b6c6-4dd1-2647-2f6fe853db0b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DtitXwNF451sY9qY"
Content-Disposition: inline
In-Reply-To: <3a7f42d0-b6c6-4dd1-2647-2f6fe853db0b@gmail.com>
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org,
 "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DtitXwNF451sY9qY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 24, 2021 at 04:05:37PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 9/24/21 15:34, Matheus K. Ferst wrote:
> > On 24/09/2021 11:41, Daniel Henrique Barboza wrote:
> > > On 9/22/21 08:24, Matheus K. Ferst wrote:
> > > > On 03/09/2021 17:31, Daniel Henrique Barboza wrote:
> > > > > [E-MAIL EXTERNO] N=E3o clique em links ou abra anexos, a menos qu=
e voc=EA possa confirmar o remetente e saber que o conte=FAdo =E9 seguro. E=
m caso de e-mail suspeito entre imediatamente em contato com o DTI.
> > > > >=20
> > > > > This patch adds the barebones of the PMU logic by enabling cycle
> > > > > counting, done via the performance monitor counter 6. The overall=
 logic
> > > > > goes as follows:
> > > > >=20
> > > > > - a helper is added to control the PMU state on each MMCR0 write.=
 This
> > > > > allows for the PMU to start/stop as the frozen counter bit (MMCR0=
_FC)
> > > > > is cleared or set;
> > > > >=20
> > > > > - MMCR0 reg initial value is set to 0x80000000 (MMCR0_FC set) to =
avoid
> > > > > having to spin the PMU right at system init;
> > > > >=20
> > > > > - the intended usage is to freeze the counters by setting MMCR0_F=
C, do
> > > > > any additional setting of events to be counted via MMCR1 (not
> > > > > implemented yet) and enable the PMU by zeroing MMCR0_FC. Software=
 must
> > > > > freeze counters to read the results - on the fly reading of the P=
MCs
> > > > > will return the starting value of each one.
> > > > >=20
> > > > > Since there will be more PMU exclusive code to be added next, put=
 the
> > > > > PMU logic in its own helper to keep all in the same place. The na=
me of
> > > > > the new helper file, power8_pmu.c, is an indicative that the PMU =
logic
> > > > > has been tested with the IBM POWER chip family, POWER8 being the =
oldest
> > > > > version tested. This doesn't mean that this PMU logic will break =
with
> > > > > any other PPC64 chip that implements Book3s, but since we can't a=
ssert
> > > > > that this PMU will work with all available Book3s emulated proces=
sors
> > > > > we're choosing to be explicit.
> > > > >=20
> > > > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > > > ---
> > > >=20
> > > > <snip>
> > > >=20
> > > > > diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> > > > > index 0babde3131..c3e2e3d329 100644
> > > > > --- a/target/ppc/translate.c
> > > > > +++ b/target/ppc/translate.c
> > > > > @@ -401,6 +401,24 @@ void spr_write_generic(DisasContext *ctx, in=
t sprn, int gprn)
> > > > > =A0=A0=A0=A0=A0 spr_store_dump_spr(sprn);
> > > > > =A0 }
> > > > >=20
> > > > > +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> > > > > +void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
> > > > > +{
> > > > > +=A0=A0=A0 /*
> > > > > +=A0=A0=A0=A0 * helper_store_mmcr0 will make clock based operatio=
ns that
> > > > > +=A0=A0=A0=A0 * will cause 'bad icount read' errors if we do not =
execute
> > > > > +=A0=A0=A0=A0 * gen_icount_io_start() beforehand.
> > > > > +=A0=A0=A0=A0 */
> > > > > +=A0=A0=A0 gen_icount_io_start(ctx);
> > > > > +=A0=A0=A0 gen_helper_store_mmcr0(cpu_env, cpu_gpr[gprn]);
> > > > > +}
> > > > > +#else
> > > > > +void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
> > > > > +{
> > > > > +=A0=A0=A0 spr_write_generic(ctx, sprn, gprn);
> > > > > +}
> > > > > +#endif
> > > > > +
> > > > > =A0 #if !defined(CONFIG_USER_ONLY)
> > > > > =A0 void spr_write_generic32(DisasContext *ctx, int sprn, int gpr=
n)
> > > > > =A0 {
> > > > > @@ -596,7 +614,10 @@ void spr_write_MMCR0_ureg(DisasContext *ctx,=
 int sprn, int gprn)
> > > > > =A0=A0=A0=A0=A0 tcg_gen_andi_tl(t1, t1, ~(MMCR0_UREG_MASK));
> > > > > =A0=A0=A0=A0=A0 /* Keep all other bits intact */
> > > > > =A0=A0=A0=A0=A0 tcg_gen_or_tl(t1, t1, t0);
> > > > > -=A0=A0=A0 gen_store_spr(SPR_POWER_MMCR0, t1);
> > > > > +
> > > > > +=A0=A0=A0 /* Overwrite cpu_gpr[gprn] and use spr_write_MMCR0() */
> > > > > +=A0=A0=A0 tcg_gen_mov_tl(cpu_gpr[gprn], t1);
> > > > > +=A0=A0=A0 spr_write_MMCR0(ctx, sprn + 0x10, gprn);
> > > >=20
> > > > IIUC, this makes writing to MMCR0 change the GPR value and expose t=
he unfiltered content of the SPR to problem state. It might be better to ca=
ll the helper directly or create another method that takes a TCGv as an arg=
ument and call it from spr_write_MMCR0_ureg and spr_write_MMCR0.
> > >=20
> > > I'm overwriting cpu_gpr[gprn] with t1, which is filtered by MMCR0_REG=
_MASK
> > > right before, to re-use spr_write_MMCR0() since its API requires a gp=
rn
> > > index. The reason I'm re-using spr_write_MMCR0() here is to avoid cod=
e repetition
> > > in spr_write_MMCR0_ureg(), which would need to repeat the same steps =
as
> > > spr_write_MMCR0 (calling icount_io_start(), calling the helper, and t=
hen setting
> > > DISAS_EXIT_UPDATE in a later patch).
> > >=20
> > > The idea behind is that all PMU user_write() functions works the same=
 as its
> > > privileged counterparts but with some form of filtering done beforeha=
nd. Note
> > > that this is kind of true in the previous patch as well - gen_store_s=
pr() is
> > > similar to the privileged function MMCR0 was using (spr_write_generic=
()) with
> > > the exception of an optional qemu_log().
> > >=20
> > > Maybe I should've made this clear in the previous patch, using spr_wr=
ite_generic()
> > > and overwriting cpu_gpr[gprn] with the filtered t1 content back there.
> > >=20
> > > Speaking of which, since t1 is being filtered by MMCR0_REG_MASK befor=
e being used to
> > > overwrite cpu_gpr[gprn], I'm not sure how this is exposing unfiltered=
 content to
> > > problem state. Can you elaborate?
> >=20
> > Suppose MMCR0 has the value 0x80000001 (FC and FCH) and problem state e=
xecutes an mtspr with the value 0x4000000 (unset FC and set PMAE) in the GP=
R. The proposed code will do the following:
> >=20
> >  > tcg_gen_andi_tl(t0, cpu_gpr[gprn], MMCR0_UREG_MASK);
> >=20
> > t0 =3D GPR & MMCR0_UREG_MASK =3D 0x4000000 & 0x84000080 =3D 0x4000000
> >=20
> >  > gen_load_spr(t1, SPR_POWER_MMCR0);
> >=20
> > t1 =3D MMCR0 =3D 0x80000001
> >=20
> >  > tcg_gen_andi_tl(t1, t1, ~(MMCR0_UREG_MASK));
> >=20
> > t1 =3D t1 & ~MMCR0_UREG_MASK =3D 0x80000001 & ~0x84000080 =3D 0x1
> >=20
> >  > tcg_gen_or_tl(t1, t1, t0);
> >=20
> > t1 =3D t1 | t0 =3D 0x4000000 | 0x1 =3D 0x4000001
> >=20
> >  > tcg_gen_mov_tl(cpu_gpr[gprn], t1);
> >=20
> > GPR =3D 0x4000001
> >=20
> > Now problem state knows that FCH is set.

Nice catch Matheus.

> I see. The problem is that overwriting the GPR is exposing bits outside
> of the MMCR0_UREG_MASK via GPR itself, something that wasn't happening
> in the previous patch because the filtering logic wasn't visible via
> userspace.

Right.  Note that even if it wasn't exposing privileged bits, I don't
think changing the GPR value would be correct behaviour, although I
suspect it would be unlikely to cause problems in practice.

> Thanks for clarifying. I'll fix it in the next version, probably by addin=
g a
> common 'write_MMCR0' method that receives a TCGv and that can be shared
> for both privileged and user write() callbacks, like you suggested in your
> previous reply.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DtitXwNF451sY9qY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFRUPEACgkQbDjKyiDZ
s5Ji6g/9HRaMFVyOvXp7eVdT0WyZ0h9zm4gwgj5PmwS4BEm1VU7qXuXgxEL5fqL/
QDAfpMAUPzkJp2oR6Tts1VOpdHZZzuk0wjsbkddeE3TjgIpPGBWQu4kOJdrGmdPy
ayl4BoInRJC30YAsMM7rFvc5SBztq/GLhoD7D+FBdnvYIm7gfyCJVF1eCeYzQNc3
94G2FYYk07TTsiV0UhH/5qm2Vxd4HvssjYWQ/IimloALFXGxYhR+5i3oOoI/7L+D
47U6289UCMCkvN9dugBqcFPCwsXqzR/80e9NYH+tuWFvI/Gblf1U06yHLKvDXkZk
BGZhfgZ4zHWGox0KChK1tfySKwE3ngIPdR6SM9se9Utxj9F44aAdMAy86tnvnK45
jHE6gEjshL99eMBGcbm4n8knLSberdj78jl2aEBtgW9ap8aLOgNXZE2aTS1AdvjP
21iG0cArAeD4HKWMGEpdQS6jwQO8lsKXt9FxwWhOTxZV0lBcLdyENZ68oVlrEuzf
unueX/XQ3jJy08o9VcsETxUiLkKnPhSe2huDNY0Q61BYXJx5nXZutoAYwjd+qkKR
bugqO/H0SMnCtbnTa6ecorqVwX7AQNoQpIUMvOPwquapHGicGsEhiMq8WGg5qoYY
T7LtiNm0TkfWZBHOUd/WrKKXtAAEuqEyJsq6b/Ak6T0L6uId7Pg=
=R5D0
-----END PGP SIGNATURE-----

--DtitXwNF451sY9qY--

