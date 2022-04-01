Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C963C4EE6E7
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 05:46:25 +0200 (CEST)
Received: from localhost ([::1]:51954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na8Ey-0007dG-G1
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 23:46:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1na89u-0005pF-Kp; Thu, 31 Mar 2022 23:41:10 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:57445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1na89o-0008K4-Ey; Thu, 31 Mar 2022 23:41:09 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KV5Y91h3nz4xYM; Fri,  1 Apr 2022 14:40:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1648784445;
 bh=srY3DfSeH9yTXt2+nIY2hrgCBGPSw1U55wM3gSBBdoM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QLfPETShXZLD/KdWz2vMqFbMbWd+Pdr9XX6I44Y95uDH90KYWEJnB5O0UamldYBPS
 o/cxSs5W3bF2AYi5PMS5w3latrfVEP6C/E3dwN7t6MmLrVMaLTvsXWLv/CiaYVnsv+
 l/5I5hYi41RlCMYqvObQ4hzOSj8f7EiHA1jexuuE=
Date: Fri, 1 Apr 2022 14:40:40 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 2/4] target/ppc: init 'lpcr' in
 kvmppc_enable_cap_large_decr()
Message-ID: <YkZ0OGtA8mVk1Q0p@yekko>
References: <20220331001717.616938-1-danielhb413@gmail.com>
 <20220331001717.616938-3-danielhb413@gmail.com>
 <YkUDCdUsjjmzFgJr@yekko>
 <d5b622c6-81b4-9d3f-9777-5233fe5a2be4@gmail.com>
 <5e48daaf-d881-2588-c323-30a9bc95a75f@linaro.org>
 <b292e516-80dc-9e5c-991b-49c77c0fe044@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DyPa6GvtVnOq0Q54"
Content-Disposition: inline
In-Reply-To: <b292e516-80dc-9e5c-991b-49c77c0fe044@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DyPa6GvtVnOq0Q54
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2022 at 03:46:57PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 3/31/22 14:36, Richard Henderson wrote:
> > On 3/31/22 11:17, Daniel Henrique Barboza wrote:
> > > > Hmm... this is seeming a bit like whack-a-mole.=A0 Could we instead=
 use
> > > > one of the valgrind hinting mechanisms to inform it that
> > > > kvm_get_one_reg() writes the variable at *target?
> > >=20
> > > I didn't find a way of doing that looking in the memcheck helpers
> > > (https://valgrind.org/docs/manual/mc-manual.html section 4.7). That w=
ould be a
> > > good way of solving this warning because we would put stuff inside a =
specific
> > > function X and all callers of X would be covered by it.
> > >=20
> > > What I did find instead is a memcheck macro called VALGRIND_MAKE_MEM_=
DEFINED that
> > > tells Valgrind that the var was initialized.
> > >=20
> > > This patch would then be something as follows:
> > >=20
> > >=20
> > > diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> > > index dc93b99189..b0e22fa283 100644
> > > --- a/target/ppc/kvm.c
> > > +++ b/target/ppc/kvm.c
> > > @@ -56,6 +56,10 @@
> > > =A0=A0#define DEBUG_RETURN_GUEST 0
> > > =A0=A0#define DEBUG_RETURN_GDB=A0=A0 1
> > >=20
> > > +#ifdef CONFIG_VALGRIND_H
> > > +#include <valgrind/memcheck.h>
> > > +#endif
> > > +
> > > =A0=A0const KVMCapabilityInfo kvm_arch_required_capabilities[] =3D {
> > > =A0=A0=A0=A0=A0 KVM_CAP_LAST_INFO
> > > =A0=A0};
> > > @@ -2539,6 +2543,10 @@ int kvmppc_enable_cap_large_decr(PowerPCCPU *c=
pu, int enable)
> > > =A0=A0=A0=A0=A0 CPUState *cs =3D CPU(cpu);
> > > =A0=A0=A0=A0=A0 uint64_t lpcr;
> > >=20
> > > +#ifdef CONFIG_VALGRIND_H
> > > +=A0=A0=A0 VALGRIND_MAKE_MEM_DEFINED(lpcr, sizeof(uint64_t));
> > > +#endif
> > > +
> > > =A0=A0=A0=A0=A0 kvm_get_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
> > > =A0=A0=A0=A0=A0 /* Do we need to modify the LPCR? */
> > >=20
> > >=20
> > > CONFIG_VALGRIND_H needs 'valgrind-devel=B4 installed.
> > >=20
> > > I agree that this "Valgrind is complaining about variable initializat=
ion" is a whack-a-mole
> > > situation that will keep happening in the future if we keep adding th=
is same code pattern
> > > (passing as reference an uninitialized var). For now, given that we h=
ave only 4 instances
> > > to fix it in ppc code (as far as I'm aware of), and we don't have a b=
etter way of telling
> > > Valgrind that we know what we're doing, I think we're better of initi=
alizing these vars.
> >=20
> > I would instead put this annotation inside kvm_get_one_reg, so that it =
covers all kvm hosts.=A0 But it's too late to do this for 7.0.
>=20
> I wasn't planning on pushing these changes for 7.0 since they aren't fixi=
ng mem
> leaks or anything really bad. It's more of a quality of life improvement =
when
> using Valgrind.
>=20
> I also tried to put this annotation in kvm_get_one_reg() and it didn't so=
lve the
> warning.

That's weird, I'm pretty sure that should work.  I'd double check to
make sure you had all the parameters right (e.g. could you have marked
the pointer itself as initialized, rather than the memory it points
to).

> I didn't find a way of telling Valgrind "consider that every time this
> function is called with parameter X it initializes X". That would be a go=
od solution
> to put in the common KVM files and fix the problem for everybody.
>=20
>=20
> Daniel
>=20
>=20
>=20
> >=20
> >=20
> > r~
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DyPa6GvtVnOq0Q54
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmJGdDEACgkQgypY4gEw
YSKXlw/+NiafjlXwaYUMpP4a3pWxMLKa0Dz6pNC78CidQsTpaohcO9JMuzYTZudN
NmNnLLM8LjCefg1F/GvsKuNVZQbhXXw2S7tCDsjQIqqVV/TF2hKyT82IVq58JTWQ
Utg85HVZdvIjKGlVUbkGTVXr3DeaqQAkXlYCLY3THWSGt8w1JNzXQWHGQcRv02oj
ckELiq0OllOYtSPraU5epVmYk1b3AifTsuoUIVUzKrmKbR2ih+/X3dok08TLV47m
uDfw4zRtPn0Lr+xmrcVZi6Og32fbYMevqeq2GuhQc75Yqbv+z5jaSZun3YeKlKTA
LkmWVhXVnLH8SJfi/5ux7zbzLIIsjII2jUfWQTZO+xXgPor8ITJbTRbph/L71kFm
oyiYAhg4giijj9PcTwR1Cve76ZA+UiXbg147fRWwvOtDPTZ4My3HhOXCxvyODnER
fuqAuHeUvm4uk/qVvKIpTLIOYVKilPl0ImHwCHnmNp0bPlFkJFTBoV+1uH7ktIa+
fIpyvRqrkpTRCVdnVpzHvzilyhHNq6HnjXLKHHg9KhfgJs63XuxIgaUFnMGkcvAs
UmgebAtWqywrgxiPNq+S7viBQ2rB7kai82CnD3sias4wxHEBkwg3EBNcpkslIEDg
uodZKPuJeBDLgplKHV+yCQx0yuWkv0UOCxp9qTEBbx24ZZsR8yo=
=GlQe
-----END PGP SIGNATURE-----

--DyPa6GvtVnOq0Q54--

