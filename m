Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5ED349C10
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 23:05:56 +0100 (CET)
Received: from localhost ([::1]:45412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPY70-0006LA-Qp
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 18:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lPY5e-0005lO-5Q; Thu, 25 Mar 2021 18:04:30 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:36053 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lPY5b-0003og-4a; Thu, 25 Mar 2021 18:04:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F5zf56f8Lz9sWS; Fri, 26 Mar 2021 09:04:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616709853;
 bh=1cCytWkhwLGAmVhrKPYDKHPkI4j/8BbhVooRhHTycOE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G+1H2F7kT0Eco2D8ZCbSLHOPxDAfKwq9xbFhqPEHv+k0kXcBEAPg5RMnervoZxbU0
 Ug6XtmrqtCUw25zMr2yY98SSeQJ3V8IkkxL1Fd7zPwGwgsKdeHSgcO0Ax+Elu9Mk88
 Ty1z2c/GYFhzojAoEQFIpaXdollKNic0XYDnUnDA=
Date: Thu, 25 Mar 2021 19:47:50 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 10/10] target/ppc: Validate hflags with CONFIG_DEBUG_TCG
Message-ID: <YFxONrbZarGMH34O@yekko.fritz.box>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
 <20210323184340.619757-11-richard.henderson@linaro.org>
 <YFqD5JOVEXVFv9Tr@yekko.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dhnemofG9ZwYs3a2"
Content-Disposition: inline
In-Reply-To: <YFqD5JOVEXVFv9Tr@yekko.fritz.box>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--dhnemofG9ZwYs3a2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 11:12:20AM +1100, David Gibson wrote:
> On Tue, Mar 23, 2021 at 12:43:40PM -0600, Richard Henderson wrote:
> > Verify that hflags was updated correctly whenever we change
> > cpu state that is used by hflags.
> >=20
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>=20
> Applied to ppc-for-6.0, thanks.

Alas, this appears to cause a failure in the 'build-user' test on
gitlab CI :(.  I haven't managed to reproduce it locally, so I'm not
sure what's going on.

>=20
> > ---
> >  target/ppc/cpu.h         |  5 +++++
> >  target/ppc/helper_regs.c | 29 +++++++++++++++++++++++++++--
> >  2 files changed, 32 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> > index 3d021f61f3..69fc9a2831 100644
> > --- a/target/ppc/cpu.h
> > +++ b/target/ppc/cpu.h
> > @@ -2425,6 +2425,10 @@ void cpu_write_xer(CPUPPCState *env, target_ulon=
g xer);
> >   */
> >  #define is_book3s_arch2x(ctx) (!!((ctx)->insns_flags & PPC_SEGMENT_64B=
))
> > =20
> > +#ifdef CONFIG_DEBUG_TCG
> > +void cpu_get_tb_cpu_state(CPUPPCState *env, target_ulong *pc,
> > +                          target_ulong *cs_base, uint32_t *flags);
> > +#else
> >  static inline void cpu_get_tb_cpu_state(CPUPPCState *env, target_ulong=
 *pc,
> >                                          target_ulong *cs_base, uint32_=
t *flags)
> >  {
> > @@ -2432,6 +2436,7 @@ static inline void cpu_get_tb_cpu_state(CPUPPCSta=
te *env, target_ulong *pc,
> >      *cs_base =3D 0;
> >      *flags =3D env->hflags;
> >  }
> > +#endif
> > =20
> >  void QEMU_NORETURN raise_exception(CPUPPCState *env, uint32_t exceptio=
n);
> >  void QEMU_NORETURN raise_exception_ra(CPUPPCState *env, uint32_t excep=
tion,
> > diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> > index 5411a67e9a..3723872aa6 100644
> > --- a/target/ppc/helper_regs.c
> > +++ b/target/ppc/helper_regs.c
> > @@ -43,7 +43,7 @@ void hreg_swap_gpr_tgpr(CPUPPCState *env)
> >      env->tgpr[3] =3D tmp;
> >  }
> > =20
> > -void hreg_compute_hflags(CPUPPCState *env)
> > +static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
> >  {
> >      target_ulong msr =3D env->msr;
> >      uint32_t ppc_flags =3D env->flags;
> > @@ -155,9 +155,34 @@ void hreg_compute_hflags(CPUPPCState *env)
> >      hflags |=3D dmmu_idx << HFLAGS_DMMU_IDX;
> >  #endif
> > =20
> > -    env->hflags =3D hflags | (msr & msr_mask);
> > +    return hflags | (msr & msr_mask);
> >  }
> > =20
> > +void hreg_compute_hflags(CPUPPCState *env)
> > +{
> > +    env->hflags =3D hreg_compute_hflags_value(env);
> > +}
> > +
> > +#ifdef CONFIG_DEBUG_TCG
> > +void cpu_get_tb_cpu_state(CPUPPCState *env, target_ulong *pc,
> > +                          target_ulong *cs_base, uint32_t *flags)
> > +{
> > +    uint32_t hflags_current =3D env->hflags;
> > +    uint32_t hflags_rebuilt;
> > +
> > +    *pc =3D env->nip;
> > +    *cs_base =3D 0;
> > +    *flags =3D hflags_current;
> > +
> > +    hflags_rebuilt =3D hreg_compute_hflags_value(env);
> > +    if (unlikely(hflags_current !=3D hflags_rebuilt)) {
> > +        cpu_abort(env_cpu(env),
> > +                  "TCG hflags mismatch (current:0x%08x rebuilt:0x%08x)=
\n",
> > +                  hflags_current, hflags_rebuilt);
> > +    }
> > +}
> > +#endif
> > +
> >  void cpu_interrupt_exittb(CPUState *cs)
> >  {
> >      if (!kvm_enabled()) {
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dhnemofG9ZwYs3a2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBcTjQACgkQbDjKyiDZ
s5JfVQ/9H2QTmoXGBdhKpD+STqKlw4lUFzjTux0PCdQQAVsvuvaljgw/+bKnTdOB
KNpKsuiRM20LfKjk0prEkNgS6fbu0zJPapQAYFJmeCg7fdAiWdLWhUqKY17oN60X
s6XE4ZBs0scPTyF2nRXufv39TkBtD+FQJETV6fkvrCtCk+CYUXGUx/KUURRzDfRT
0owtl46cN3T/HjoM3YtKUb4RhLvRO+w/LCFIj1rcrwLH9WAtQ3nFufQqR1LI7Ay+
BZxpPpJCjGKwjOhYEnAV5Ta8TC4WH7JHid1eCO9hlxd5H2Th556XM9/kzRhR0Sks
LQkA6i9th7Sy3ikxDILDm8akLUxaItLXtxtIVZa97s9GEVqOR84vTRttgS4aklIn
1jbms6UObIeK3pG+ZlhRovhRK/o0oMsju/IxibxtT0wo91LUyzA1VwM9zdBUIa7L
p9XgjEuDM/3/E/zndDJ8qMMD08Vv11K9k2m/YkaYvilKqoCjXgcGYEtOUdarDEA3
NECWlULjyIxUKua0noDKN7BJmhyoilYddaCc7FRq/JP89+0Wf6z5L0N9OCXqYhTk
Lszy3TLRPsYSxBoYRwK01SUtvvZYEZTs5uOU2Rn69NLn19FC6AConHTM0dQb/d4Y
evniH0x5NIclgNe3HhCdDQzb72EVw0jlEOTduIeWjRJQQjpcs0U=
=cHgp
-----END PGP SIGNATURE-----

--dhnemofG9ZwYs3a2--

