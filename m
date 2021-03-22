Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6572E34539C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 01:06:42 +0100 (CET)
Received: from localhost ([::1]:48392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOUZF-0003GH-Fu
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 20:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOUU4-0000KI-Ne; Mon, 22 Mar 2021 20:01:20 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:59149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOUU1-0002u6-1y; Mon, 22 Mar 2021 20:01:20 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4BNR2XnHz9sW1; Tue, 23 Mar 2021 11:01:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616457671;
 bh=vSzADUP3IBdc+eIxxihaBmlD4gur8Kn2+nzwuy8ctRw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=navmbwy8KAii+gHKiXlldA8Oih0eEmnqTJCQmk5z3QeB7QmrD+EPhbTfybQk1aYno
 9AMIs/VxUwjLFzT9Dq/1lQEN83qFaFgpqNAEJiLBi21eiqGfbcpYbazOVdy+78kc0L
 rghMgK3nfQB//eOs0HcyqMwJik8FjFIw6OecU2/A=
Date: Tue, 23 Mar 2021 10:55:34 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 10/17] target/ppc: Create helper_scv
Message-ID: <YFkudrpOrYLGahf2@yekko.fritz.box>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-11-richard.henderson@linaro.org>
 <YFgWYQ8tPzWfwxDl@yekko.fritz.box>
 <2ac37568-078c-2d51-18fd-d93ed10f39af@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AKHOxwsKfXKeqj2a"
Content-Disposition: inline
In-Reply-To: <2ac37568-078c-2d51-18fd-d93ed10f39af@linaro.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--AKHOxwsKfXKeqj2a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 11:05:00AM -0600, Richard Henderson wrote:
> On 3/21/21 10:00 PM, David Gibson wrote:
> > On Mon, Mar 15, 2021 at 12:46:08PM -0600, Richard Henderson wrote:
> > > Perform the test against FSCR_SCV at runtime, in the helper.
> > >=20
> > > This means we can remove the incorrect set against SCV in
> > > ppc_tr_init_disas_context and do not need to add an HFLAGS bit.
> > >=20
> > > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > > ---
> > >   target/ppc/helper.h      |  1 +
> > >   target/ppc/excp_helper.c |  9 +++++++++
> > >   target/ppc/translate.c   | 20 +++++++-------------
> > >   3 files changed, 17 insertions(+), 13 deletions(-)
> > >=20
> > > diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> > > index 6a4dccf70c..513066d54d 100644
> > > --- a/target/ppc/helper.h
> > > +++ b/target/ppc/helper.h
> > > @@ -13,6 +13,7 @@ DEF_HELPER_1(rfci, void, env)
> > >   DEF_HELPER_1(rfdi, void, env)
> > >   DEF_HELPER_1(rfmci, void, env)
> > >   #if defined(TARGET_PPC64)
> > > +DEF_HELPER_2(scv, noreturn, env, i32)
> > >   DEF_HELPER_2(pminsn, void, env, i32)
> > >   DEF_HELPER_1(rfid, void, env)
> > >   DEF_HELPER_1(rfscv, void, env)
> > > diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> > > index 85de7e6c90..5c95e0c103 100644
> > > --- a/target/ppc/excp_helper.c
> > > +++ b/target/ppc/excp_helper.c
> > > @@ -1130,6 +1130,15 @@ void helper_store_msr(CPUPPCState *env, target=
_ulong val)
> > >   }
> > >   #if defined(TARGET_PPC64)
> > > +void helper_scv(CPUPPCState *env, uint32_t lev)
> > > +{
> > > +    if (env->spr[SPR_FSCR] & (1ull << FSCR_SCV)) {
> > > +        raise_exception_err(env, POWERPC_EXCP_SYSCALL_VECTORED, lev);
> > > +    } else {
> > > +        raise_exception_err(env, POWERPC_EXCP_FU, FSCR_IC_SCV);
> > > +    }
> > > +}
> > > +
> > >   void helper_pminsn(CPUPPCState *env, powerpc_pm_insn_t insn)
> > >   {
> > >       CPUState *cs;
> > > diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> > > index 7912495f28..d48c554290 100644
> > > --- a/target/ppc/translate.c
> > > +++ b/target/ppc/translate.c
> > > @@ -173,7 +173,6 @@ struct DisasContext {
> > >       bool vsx_enabled;
> > >       bool spe_enabled;
> > >       bool tm_enabled;
> > > -    bool scv_enabled;
> > >       bool gtse;
> > >       ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
> > >       int singlestep_enabled;
> > > @@ -4081,15 +4080,16 @@ static void gen_sc(DisasContext *ctx)
> > >   #if !defined(CONFIG_USER_ONLY)
> > >   static void gen_scv(DisasContext *ctx)
> > >   {
> > > -    uint32_t lev;
> > > +    uint32_t lev =3D (ctx->opcode >> 5) & 0x7F;
> > > -    if (unlikely(!ctx->scv_enabled)) {
> > > -        gen_exception_err(ctx, POWERPC_EXCP_FU, FSCR_IC_SCV);
> > > -        return;
> > > +    /* Set the PC back to the faulting instruction. */
> > > +    if (ctx->exception =3D=3D POWERPC_EXCP_NONE) {
> > > +        gen_update_nip(ctx, ctx->base.pc_next - 4);
> > >       }
> >=20
> > I don't quite understand this.  Don't we need the NIP to be on the scv
> > instruction itself for the case where we get a facility unavailable
> > exception, but on the next instruction if we actually take the system
> > call?  This appears to be unconditional.
> >=20
> > > +    gen_helper_scv(cpu_env, tcg_constant_i32(lev));
> > > -    lev =3D (ctx->opcode >> 5) & 0x7F;
> > > -    gen_exception_err(ctx, POWERPC_SYSCALL_VECTORED, lev);
>=20
> Hmm.  In the old code, both paths use gen_exception_err, without otherwise
> manipulating NIP.  That suggests to me that both exceptions receive the s=
ame
> value in NIP.
>=20
> Is there an adjustment to NIP when delivering the SCV exception?  Yep:

Ok.  Just shows my ignorance of the exception handling code.

>=20
>     case POWERPC_EXCP_SYSCALL_VECTORED:
>         lev =3D env->error_code;
>         dump_syscall_vectored(env);
>         env->nip +=3D 4;
>         new_msr |=3D env->msr & ((target_ulong)1 << MSR_EE);
>         new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
>         break;
>=20
>=20
> r~
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--AKHOxwsKfXKeqj2a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBZLnYACgkQbDjKyiDZ
s5Ie/RAA4evtkuVpkd5Du0Lx0OqL40wxrewkOzyvJa5gDIZe6scqY/0Ya2zzJm0o
hZz6khXuOWNs067xyp1FPnUcJS96Wnv80Zv8qpcy5tE3/lnY73GXM6H0eil24XTV
e5QtjSQrM/an7bEdnl/gR+PwmIbXVgxsSmobHYXqX75eLz5aqTG155tJC0w3wDlf
UvAVBY/aVy1hj6V5lV7NMu3P04kOZ8QYOEW1LT1yUe+y3t9lQfZMq6deQ6GpQLhS
dzIh2RMacwSnXUBv8eFaAuH/VDXe//ctvRIXBD/KvX1zwFHMH57VjSav/BzBJ8fu
nd+ST5H5sjiFBS+xtUmULjMkF3NTbk6BSYKogo9ivkHj4XJy2QVIk+LhD6F13s0D
7aRPVHDs5vG3lu4YMTi8ZeXMITR+qsqqrI5cVFBNnffXzPgWkI571Kx7sokyBpeu
WKSz8f4HVZA/ahZZWyVMwGFhpMpXqva41Vhoim0YLJArZk/tbjcLhA4TNYYsyBh3
Tq8EmYT4R/0WsGXL9yQsBZ/KP0lMPK6St62/xNxLqc6FEfMlKQuLyrcylSMErRWD
MbHO076Ew9kpy9Z0bCH/K9292RkCXLEAk+hMV5KIz/+lP5NICn/tj0bkQJlq8mKf
7TVwYYoq5EspG5o78xjZ0rEdTTWUJqeuH5NL3hfs1vCUAFbT8oo=
=4kY7
-----END PGP SIGNATURE-----

--AKHOxwsKfXKeqj2a--

