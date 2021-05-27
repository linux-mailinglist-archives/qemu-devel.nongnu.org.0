Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA633392876
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 09:23:01 +0200 (CEST)
Received: from localhost ([::1]:37442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmAM8-0005hM-OJ
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 03:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lmAC0-0006mR-Hh; Thu, 27 May 2021 03:12:32 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57767 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lmABw-0004eU-RW; Thu, 27 May 2021 03:12:32 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FrJsx0V3xz9sWQ; Thu, 27 May 2021 17:12:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622099541;
 bh=mN8Ec16T8vSWXrBPnj7df9rFu5lpY+mof1bMQICjOFo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wxrkmhgh3ojnBmW5XkbqAwyJmIuXMOn/KO4dvBHQMG2LMOGio8h7I7Tj7LIQeNYkw
 kc/4wB7lXGcsN5rDWpS/HQSGxdQ6SxPGhaA4wK6vB3HtdKAcA6gFdWviq+bLtQda+W
 AgksIFelG9lMENr7Bh2G8fvYnI0hIpi1f/hkTh2U=
Date: Thu, 27 May 2021 14:18:08 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v5 2/4] target/ppc: added ifdefs around TCG-only code
Message-ID: <YK8dgHfO7E4AApVd@yekko>
References: <20210525115355.8254-1-bruno.larsen@eldorado.org.br>
 <20210525115355.8254-3-bruno.larsen@eldorado.org.br>
 <8e66bba4-96d1-db9e-5f21-156c41ff38ea@amsat.org>
 <abf18c12-129f-b1a5-5d67-90fc6fa71afe@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yoLc/23xFGxaiEEj"
Content-Disposition: inline
In-Reply-To: <abf18c12-129f-b1a5-5d67-90fc6fa71afe@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: farosas@linux.ibm.com, qemu-devel@nongnu.org, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--yoLc/23xFGxaiEEj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 02:24:32PM -0300, Bruno Piazera Larsen wrote:
>=20
> On 25/05/2021 10:02, Philippe Mathieu-Daud=E9 wrote:
> > On 5/25/21 1:53 PM, Bruno Larsen (billionai) wrote:
> > > excp_helper.c, mmu-hash64.c and mmu_helper.c have some function
> > > declarations that are TCG-only, and couldn't be easily moved to a
> > > TCG only file, so ifdefs were added around them.
> > >=20
> > > We also needed ifdefs around some header files because helper-proto.h
> > > includes trace/generated-helpers.h, which is never created when build=
ing
> > > without TCG, and cpu_ldst.h includes tcg/tcg.h, whose containing fold=
er
> > > is not included as a -iquote. As future cleanup, we could change the
> > > part of the configuration script to add those.
> > >=20
> > > cpu_init.c also had a callback definition that is TCG only and could =
be
> > > removed as part of a future cleanup (all the dump_statistics part is
> > > almost never used and will become obsolete as we transition to using
> > > decodetree).
> > >=20
> > > Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> > > ---
> > >   target/ppc/cpu_init.c    |  2 ++
> > >   target/ppc/excp_helper.c | 21 ++++++++++++++++++---
> > >   target/ppc/mmu-hash64.c  | 11 ++++++++++-
> > >   target/ppc/mmu_helper.c  | 16 ++++++++++++++--
> > >   4 files changed, 44 insertions(+), 6 deletions(-)
> > Please have a look at commit range 0a31c16c9ce..a2b0a27d33e
> > for the MIPS convertion.
> >=20
> > >   #if !defined(CONFIG_USER_ONLY)
> > > +#ifdef CONFIG_TCG
> > >   void helper_store_msr(CPUPPCState *env, target_ulong val)
> > >   {
> > For example this one is similar to commit d60146a9389, you
> > could simply move this function to tcg/sysemu/msr_helpers.c
> > and modify the meson file, then when TCG is not available,
> > the file isn't built, without having to use #ifdef'ry.
>=20
> I can see what you mean, but I think the point was to not create separate
> files solely based on the accelerator type.
>=20
> It's up to dgibson if we use that approach, but I agree that it could make
> the code quite a bit cleaner.
>=20
> The next question would then be: should we go the whole 9 yards and add
> tcg/sysemu/* and tcg/linux-user/*, or can we just use tcg/* and rely on d=
evs
> reading and understanding the meson.build file? I believe tcg/sysemu/* is
> going to be very empty (for now, only what is in mmu-hash64.c and is
> TCG-only, IIRC), so it sounds like a bit of an overkill, but I also see t=
he
> argument for future-proofing.

The ifdefs are pretty messy, but drafts based on splitting into
separate files have hit their own complications.  So, I'm inclined to
just go with the ifdefs for now, and hope to clean things up further
in future.

So, applied to ppc-for-6.1.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--yoLc/23xFGxaiEEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCvHYAACgkQbDjKyiDZ
s5L/7g/+KfjiWJxbaN7DwVInzXkqQ2SuRors++EVW0RCrXY4qHlzhcbeR2TiY9Lf
e0zWBKo2rlPVpOpEFPdbclvu4ifAJZ5JZfKd0cQRJtxChMUKvR08wS4cOZw7E07L
OgBfzbWz/gMuLRJwa7q/dkd1QxFPQ/IPFcitu6eMmzANfs8hF63dlS0+SmUVwsra
x9sq05/spREsMOINw0//eyMTnJAarLghJErxfKxfsF49tbLeCREAKHWcaSbIjDwn
cnwzf9PnIEc043AVdzHQVG/Ww48aQ55DpctyFykke4WRIXcbDBNuvuNCF8ctk1CK
jxM4eLEwJtger+E9JdKP8Gcj5cqO9nZ9uTC+hPf271BS1P5AAD9CEKmTznPmgGW3
k9s9iJdM6jraVVIzEfoP8CsbUJ1ON5w0gqeuVQRRkdtl54MiFE8mhFnfWg5DETU7
QjMGae/OPPlM+wjSNNUJRJuM+bfoNh6Jau08xVyLlkuORhBkkQMRr9nY+KFgOX57
LXeD4tOrONFeqk6ZfSLBgRFccvlNwxk2nvvwWuKY2Cao98asikzTFnpoO15c5Pwr
4Vee7NQbqcUU+OxP+rroDQsSPVaCwYNWF5hz4nWcBSh4PKLV6Qw6fnfhkHhG1m87
Zmzidh1UFIQ5SNAMdrxQgLcH3Y0sExJ5xoI7VfQC5EL0W28HzRQ=
=/Q7N
-----END PGP SIGNATURE-----

--yoLc/23xFGxaiEEj--

