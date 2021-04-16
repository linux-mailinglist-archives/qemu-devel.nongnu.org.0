Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2573618E9
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 06:30:44 +0200 (CEST)
Received: from localhost ([::1]:52250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXG7u-00029t-QU
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 00:30:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lXG6R-0000uY-5n; Fri, 16 Apr 2021 00:29:11 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58563 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lXG6O-0005kX-Ev; Fri, 16 Apr 2021 00:29:10 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FM3BR3TkLz9sVv; Fri, 16 Apr 2021 14:29:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618547343;
 bh=a+1UuEPSeku+XgSV/PQJTRNhArtWOG8fpQWCjO/td2c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ng+QaGrmKpx/4kpu2ep2OL4oXSqN+ixfx4xB2QRz0tT3weEJcG1gg/b+hylqOEMTZ
 Cno/jPeBFutSZ0oiZu9vxGdWL7jn1IQfbw6zs3iJilwjsX04IWMGbU5Rbq6Ia6aHDF
 p9kxPo6Bw7YVYrDia32P/PzcfxHWxF1q+EYRuebo=
Date: Fri, 16 Apr 2021 14:13:05 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 1/4] target/ppc: Fix POWER9 radix guest HV interrupt
 AIL behaviour
Message-ID: <YHkO0eyB3XkJ9TGo@yekko.fritz.box>
References: <20210415054227.1793812-1-npiggin@gmail.com>
 <20210415054227.1793812-2-npiggin@gmail.com>
 <87k0p3zqze.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="azLbo/76fe78XOq8"
Content-Disposition: inline
In-Reply-To: <87k0p3zqze.fsf@linux.ibm.com>
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
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@fr.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--azLbo/76fe78XOq8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 09:12:21AM -0300, Fabiano Rosas wrote:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
> > ISA v3.0 radix guest execution has a quirk in AIL behaviour such that
> > the LPCR[AIL] value can apply to hypervisor interrupts.
> >
> > This affects machines that emulate HV=3D1 mode (i.e., powernv9).
> >
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>=20
> Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

Applied to ppc-for-6.1.

>=20
> > ---
> >  target/ppc/excp_helper.c | 17 +++++++++++++----
> >  1 file changed, 13 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> > index 85de7e6c90..b8881c0f85 100644
> > --- a/target/ppc/excp_helper.c
> > +++ b/target/ppc/excp_helper.c
> > @@ -791,14 +791,23 @@ static inline void powerpc_excp(PowerPCCPU *cpu, =
int excp_model, int excp)
> >  #endif
> > =20
> >      /*
> > -     * AIL only works if there is no HV transition and we are running
> > -     * with translations enabled
> > +     * AIL only works if MSR[IR] and MSR[DR] are both enabled.
> >       */
> > -    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1) ||
> > -        ((new_msr & MSR_HVB) && !(msr & MSR_HVB))) {
> > +    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
> >          ail =3D 0;
> >      }
> > =20
> > +    /*
> > +     * AIL does not work if there is a MSR[HV] 0->1 transition and the
> > +     * partition is in HPT mode. For radix guests, such interrupts are
> > +     * allowed to be delivered to the hypervisor in ail mode.
> > +     */
> > +    if ((new_msr & MSR_HVB) && !(msr & MSR_HVB)) {
> > +        if (!(env->spr[SPR_LPCR] & LPCR_HR)) {
> > +            ail =3D 0;
> > +        }
> > +    }
> > +
> >      vector =3D env->excp_vectors[excp];
> >      if (vector =3D=3D (target_ulong)-1ULL) {
> >          cpu_abort(cs, "Raised an exception without defined vector %d\n=
",
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--azLbo/76fe78XOq8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB5DtEACgkQbDjKyiDZ
s5J93RAAxSDu+RjIjgOCmX/ILA+dnRySsAHvjD6uYP7Bniu8roNrC9km7q0Q478G
mm6n9vWUUdn+GcadbRUxTE/1CCaZB1fOi9ty5hOhzvTqtvT4v/1P98XxO+vuc+Sm
8SNCYrh1E8vZqOtt7qHCKJ7P8zfvSUXnZk+/oq/0wtpkatcd6/Pmcy2XpBya2aEX
frm8cxYXNJSdYFUsIo7WB7mbT9+aNGMWb8mNTRMSR7+nPpkzLi8/9KUj+T7WBgdV
yL0hi/rRfdHwnt97vuDeZA7vJattlTGgq/tDBPtfseHmkuszWfu6kWza13zGKVmJ
rstGem7tyOCYGf2+WzDvuJxXfZ+dHSwohvs8YXr45oSxIrpB2xbZVR6k+KcxLNIb
QlWc++bBB4sqgVxBljxmprmwa2kRkuGYlAKXPQozEChXS4JUvD6ItWHNEUqSPJ2X
4bJEAbrpSzB+Wvf9X9kTHh8UM4hSp612jcO4OU1SwBvQQ8j4YZkQzAOEW5vpyHdg
1UNKOAGtAxSxeD6O64OPOr35/Xzefc3mFggR4oUsk1VGQxOLu5SJJRG/hpo6y9BY
FVBQCuCAdd9sEoCz3ypjprmJ3weHBHISo5AJF81tXBG6j2zEMonocjE0EWmCbO12
Qw2X1XB1eXiq+IY4ySqCpCqGRAunHYzJv99Uouw558lA9cARxkU=
=6sNR
-----END PGP SIGNATURE-----

--azLbo/76fe78XOq8--

