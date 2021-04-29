Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F5236E427
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 06:27:07 +0200 (CEST)
Received: from localhost ([::1]:52758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbyGX-00070q-Tn
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 00:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbyFW-0006UZ-5c; Thu, 29 Apr 2021 00:26:02 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:45207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbyFT-0008MH-4r; Thu, 29 Apr 2021 00:26:01 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FW2Vc5gbjz9sj5; Thu, 29 Apr 2021 14:25:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1619670344;
 bh=0OQM4LlRFzRyGAA7otc7Ze9EpvcJjKtFMM9omLeGn8s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gg4CmotYBki73yycl2hEH0yRTYDyw+sPdvOxPx7wSOQpjawSk/sFAAY/0fK4tyKau
 x4E7cV/nVggrIomHhpiMa/8TxYXkpRIYEg7rKX4rVJWgSQbJw09prK3FsqogDEYNmy
 b/wUNLcbIz9JIgmcjde2haXP9UXQjEjbWTgCgvy4=
Date: Thu, 29 Apr 2021 14:24:37 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Subject: Re: [RFC PATCH 3/4] target/ppc: Move SPR generation to separate file
Message-ID: <YIo1BRolwATnudEw@yekko>
References: <CP2PR80MB449987FB35CC5BC79CACDAFBC7409@CP2PR80MB4499.lamprd80.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ri3GVRwO/oZhF79Q"
Content-Disposition: inline
In-Reply-To: <CP2PR80MB449987FB35CC5BC79CACDAFBC7409@CP2PR80MB4499.lamprd80.prod.outlook.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ri3GVRwO/oZhF79Q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 02:47:37PM +0000, Bruno Piazera Larsen wrote:
> > > > This move is required to enable building without TCG.
> > > > All the logic related to registering SPRs specific to
> > > > some architectures or machines has been hidden in this
> > > > new file.
> > >
> > > Hm... I thought we ended up deciding to keep the gen_spr_<machine>
> > > functions in translate_init.c.inc (cpu_init.c). I don't strongly favo=
ur
> > > one way or the other, but one alternative would be to just rename the
> > > gen_spr_<machine> functions to add_sprs_<machine> or even
> > > register_<machine>_sprs and leave them where they are.
> >
> > Right.  I think renaming these away from gen_*() is a good idea, to
> > avoid confusion with the other gen_*() functions which, well, generate
> > TCG code.
> >
> > I don't think there's a lot of value in moving them out from
> > translate_init.  Honestly the more useful way to break up
> > translate_init would be by CPU family, rather than by SPR vs. non-SPR
> > setup
>=20
> Right, ok. I thought we agreed to separate, but I can't remember the reas=
on.
> I guess less is more in this case, so I won't create the new file.
> As for separating by CPU family: sounds good for a later cleanup, but I d=
on't
> think it's a priority right now.

That's fair.

> I'll work on that renaming, I agree its a good idea.

Great.  A head's up, there are also patches in preparation which add
64-bit instruction support.  Those are also replacing some of our
existing instruction decode logic with the new somewhat generic
decodetree system.  That seems to be replacing the gen_*() convention
for TCG op generating functions with trans_*() for the new style
decodetree op generating functions.

Nonetheless, it's worth renaming the SPR construction functions to
something that won't collide with either the old or new convention.
However, since you're working in adjacent areas, one or both of you
are likely to have to do some rebasing and conflict fixing along the
way.

> > > > The idea of this final patch is to hide all SPR generation from
> > > > translate_init, but in an effort to simplify the RFC the 4
> > > > functions for not_implemented SPRs were created. They'll be
> > > > substituted by gen_spr_<machine>_misc in reusable ways for the
> > > > final patch.
> > >
> > > I'd expect this patch to be just a big removal of gen_spr* from
> > > translate_init.c.inc and their addition into spr_common.c. So any oth=
er
> > > prep work should come in separate patches ealier in the
> > > series. Specifically, at least one patch for the macro work and anoth=
er
> > > for the refactoring of open coded spr_register calls into gen_spr_*
> > > functions.
> >
> > Seconded.
>=20
> Ok. Should it be 2 commits (refactoring, then macro) or 3 commits (renami=
ng,
> vscr_init, then macro)? I guess also that since I won't move stuff, I don=
't
> need to fix the vscr_init, but it's no big deal at this point.

3 please.  In general, lean towards more, simpler commits.

> > > If you're only adding this now, it means the previous patch is
> > > broken. As a general rule you should make sure every patch works. I k=
now
> > > that for the RFC things might be a bit broken temporarily and that is=
 ok
> > > but it is always a good idea to make sure every individual change is =
in
> > > the correct patch at least.
>=20
> yeah... sorry about that. I'm correcting all these problems.
>=20
> > > > +/*****************************************************************=
************/
> > > > +/* SPR definitions and registration */
> > > > +
> > > > +#ifdef CONFIG_TCG
> > > > +#ifdef CONFIG_USER_ONLY
> > > > +#define spr_register_kvm(env, num, name, uea_read, uea_write,     =
             \
> > > > +                         oea_read, oea_write, one_reg_id, initial_=
value)       \
> > > > +    _spr_register(env, num, name, uea_read, uea_write, initial_val=
ue)
> > > > +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,  =
             \
> > > > +                            oea_read, oea_write, hea_read, hea_wri=
te,          \
> > > > +                            one_reg_id, initial_value)            =
             \
> > > > +    _spr_register(env, num, name, uea_read, uea_write, initial_val=
ue)
> > > > +#else /* CONFIG_USER_ONLY */
> > > > +#if !defined(CONFIG_KVM)
> > > > +#define spr_register_kvm(env, num, name, uea_read, uea_write,     =
             \
> > > > +                         oea_read, oea_write, one_reg_id, initial_=
value)       \
> > > > +    _spr_register(env, num, name, uea_read, uea_write,            =
             \
> > > > +                  oea_read, oea_write, oea_read, oea_write, initia=
l_value)
> > > > +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,  =
             \
> > > > +                            oea_read, oea_write, hea_read, hea_wri=
te,          \
> > > > +                            one_reg_id, initial_value)            =
             \
> > > > +    _spr_register(env, num, name, uea_read, uea_write,            =
             \
> > > > +                  oea_read, oea_write, hea_read, hea_write, initia=
l_value)
> > > > +#else /* !CONFIG_KVM */
> > > > +#define spr_register_kvm(env, num, name, uea_read, uea_write,     =
             \
> > > > +                         oea_read, oea_write, one_reg_id, initial_=
value)       \
> > > > +    _spr_register(env, num, name, uea_read, uea_write,            =
             \
> > > > +                  oea_read, oea_write, oea_read, oea_write,       =
             \
> > > > +                  one_reg_id, initial_value)
> > > > +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,  =
             \
> > > > +                            oea_read, oea_write, hea_read, hea_wri=
te,          \
> > > > +                            one_reg_id, initial_value)            =
             \
> > > > +    _spr_register(env, num, name, uea_read, uea_write,            =
             \
> > > > +                  oea_read, oea_write, hea_read, hea_write,       =
             \
> > > > +                  one_reg_id, initial_value)
> > > > +#endif /* !CONFIG_KVM */
> > > > +#endif /* CONFIG_USER_ONLY */
> > > > +#else /* CONFIG_TCG */
> > > > +#ifdef CONFIG_KVM /* sanity check */
> > > > +#define spr_register_kvm(env, num, name, uea_read, uea_write,     =
             \
> > > > +                         oea_read, oea_write, one_reg_id, initial_=
value)       \
> > > > +    _spr_register(env, num, name, one_reg_id, initial_value)
> > > > +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,  =
             \
> > > > +                            oea_read, oea_write, hea_read, hea_wri=
te,          \
> > > > +                            one_reg_id, initial_value)            =
             \
> > > > +    _spr_register(env, num, name, one_reg_id, initial_value)
> > > > +#else /* CONFIG_KVM */
> > > > +#error "Either TCG or KVM should be configured"
> > > > +#endif /* CONFIG_KVM */
> > > > +#endif /*CONFIG_TCG */
> > > > +
> > > > +#define spr_register(env, num, name, uea_read, uea_write,         =
             \
> > > > +                     oea_read, oea_write, initial_value)          =
             \
> > > > +    spr_register_kvm(env, num, name, uea_read, uea_write,         =
             \
> > > > +                     oea_read, oea_write, 0, initial_value)
> > > > +
> > > > +#define spr_register_hv(env, num, name, uea_read, uea_write,      =
             \
> > > > +                        oea_read, oea_write, hea_read, hea_write, =
             \
> > > > +                        initial_value)                            =
             \
> > > > +    spr_register_kvm_hv(env, num, name, uea_read, uea_write,      =
             \
> > > > +                        oea_read, oea_write, hea_read, hea_write, =
             \
> > > > +                        0, initial_value)
> > >
> > > This change is crucial for this to work, we don't want it buried along
> > > with all of the code movement. It should be clearly described and in
> > > it's own patch at the top of the series.
> > >
> > > If you add this change, plus some #ifdef TCG around the spr callbacks,
> > > it should already be possible to compile this with disable-tcg. It wo=
uld
> > > also make the series as a whole easier to understand.
>=20
> if we added this and removed TCG only files from meson.build it might
> compile already (not sure, I think there were a couple of things that
> used mmu functions), but wouldn't there be way too many ifdefs in that ca=
se?
> The R/W callbacks are spread all around the file, and we'd have to ifdef =
around
> some .h files that are included in common files.
>=20
>=20
> Bruno Piazera Larsen
>=20
> Instituto de Pesquisas ELDORADO<http://clickemailmkt.eldorado.org.br/ls/c=
lick?upn=3DUPoxpeIcHnAcbUZyo7TTaswyiVb1TXP3jEbQqiiJKKGsxOn8hBEs5ZsMLQfXkKuK=
XZ7MVDg0ij9eG8HV4TXI75dBzDiNGLxQ8Xx5PzCVNt6TpGrzBbU-2Biu0o69X5ce-2FW-2FOk1u=
UipuK0fZnWXJEgbRw-3D-3DJY4T_wWk-2BG6VvNBoa1YzxYjhCdFS9IfANIaBzDSklR1NyyrKOI=
1wj0P-2BdBFcuO4FnHcsA1MyHu0ly1Yt3oDMp7KKdJPM68iKuI2jiRH5v4B0d8wf3chU3qy5n5i=
XWnW1QjSaNFHOgELzxaP-2FnesTeBgJ5dFkjH4f279sVQpOtyjw5xAqj34M6pgNRAxVvuXif4IW=
DcVzXg1FzfYlEfkKzr9vvpA3Hg8kitwMtlU3zwbQUBCgL30fQoJPcRPMGKyOY8RmoAlXNqTJYDY=
IvqmfnI7KLUvw6vKB5R-2B5q1FJRAzX7H-2BmF0NnDET6jMLuIqtCcVIch>
>=20
> Departamento Computa=E7=E3o Embarcada
>=20
> Analista de Software Trainee
>=20
> Aviso Legal - Disclaimer<https://www.eldorado.org.br/disclaimer.html>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ri3GVRwO/oZhF79Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCKNQMACgkQbDjKyiDZ
s5Lx3g/+P2omxrazsEHM9JtvwIS/k+HiqR7AIAM12fi378F+swC1zc4B1TurFqGg
Q+8B1xSic7OYXx0ReSHjdq/fCWN4/VT6qNvrra2JfKTaFgGYoRuOVoR8zHc1AxFS
/5qvWVV7dgxgZz4XNfXOLfvgWkn3XdS72EQ5EVY1/4EygZgh3CqHSJymODL3gNQy
vVyAipGvbd0IunXX5FExaLgov07D6Em2stLxjTcm7OWM2aFN7fHbHZ/DchHtG4xG
HM6W3xhAL3uxF7QEA3IyAktc7597MzjlbtjZRdRJYNW9B0n4WUgM69iTGv6SZyhk
v3UUl4xeGRHyzKJlvWbqEkwtWwkGfT5KOdFYntflnC9fFMRRCtI1eOHRoe5wP33P
28yxiMoooyfYQh1t7asVwDCy1FFjySbMwx0fh70UfNGK8Xn81UKBMUkJwXbYlslq
jXJlg60BQ7a/9MVdFADEaLihZZkfn2Za1vh/AQfNAbY0v00kpwx5WWzciSVHidsH
RJNshcAbvgnt0RIGjIDg8GCwdfm7qZmCEWzK2il1ZvyLJTv2Yr1JQxH4bYQL/1Hd
vB1DRgSMSzX42UoDSFeIlFtatL4zhrzF/Vp1P3HbwA2dxKF9/9itAo/ppiH1HGSI
U1+vEDjrEAt1+t6p6r61cXRcnXdcFkWFAd95DL9GL7NP+wpi2Bk=
=YqEP
-----END PGP SIGNATURE-----

--ri3GVRwO/oZhF79Q--

