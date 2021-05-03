Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EA037110C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 06:56:40 +0200 (CEST)
Received: from localhost ([::1]:42408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldQdL-00033B-5Q
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 00:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQbg-0001RY-9s; Mon, 03 May 2021 00:54:56 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:56013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQbc-0007zj-NL; Mon, 03 May 2021 00:54:55 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FYVyH5ytDz9sW4; Mon,  3 May 2021 14:54:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620017687;
 bh=f8I/KJFYdlz7gsbklOVsM7uXt3a9KEnVOWwZDO1m8ms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EEmmHCubIkynIRIyL4xuJk0JREzY6XUNr8go4t7DH45sNFRAKdzUhFxTHmSnFe15y
 wXLPkGZkpsxVtVL4SoM+KKU4LOFUlvj2MTY59at07BCxTrn+alAhFexf/L9vlw067+
 V852nsqZLeBrmiMgsowXpgiwQmqFNdJsmNs2tVCA=
Date: Mon, 3 May 2021 14:37:00 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 1/7] target/ppc: Created !TCG SPR registration macro
Message-ID: <YI997IKFE624Bt4D@yekko>
References: <20210430193533.82136-1-bruno.larsen@eldorado.org.br>
 <20210430193533.82136-2-bruno.larsen@eldorado.org.br>
 <cb40e011-cf22-1044-43b0-75401d074796@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="llbTbod1ZdjcVJFS"
Content-Disposition: inline
In-Reply-To: <cb40e011-cf22-1044-43b0-75401d074796@linaro.org>
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
Cc: farosas@linux.ibm.com, qemu-devel@nongnu.org, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--llbTbod1ZdjcVJFS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 05:27:13PM -0700, Richard Henderson wrote:
> On 4/30/21 12:35 PM, Bruno Larsen (billionai) wrote:
> > moved RW callback parameters of _spr_register into an ifdef, to support
> > building without TCG in the future, and added definitions for
> > spr_register and spr_register_kvm, to keep the same call regardless of
> > build options
> >=20
> > Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> > ---
> >   target/ppc/translate_init.c.inc | 26 +++++++++++++++++++++-----
> >   1 file changed, 21 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_ini=
t.c.inc
> > index 6235eb7536..22b23793fd 100644
> > --- a/target/ppc/translate_init.c.inc
> > +++ b/target/ppc/translate_init.c.inc
> > @@ -720,6 +720,7 @@ static inline void vscr_init(CPUPPCState *env, uint=
32_t val)
> >       helper_mtvscr(env, val);
> >   }
> > +#ifdef CONFIG_TCG
> >   #ifdef CONFIG_USER_ONLY
> >   #define spr_register_kvm(env, num, name, uea_read, uea_write,        =
          \
> >                            oea_read, oea_write, one_reg_id, initial_val=
ue)       \
> > @@ -728,7 +729,7 @@ static inline void vscr_init(CPUPPCState *env, uint=
32_t val)
> >                               oea_read, oea_write, hea_read, hea_write,=
          \
> >                               one_reg_id, initial_value)               =
          \
> >       _spr_register(env, num, name, uea_read, uea_write, initial_value)
> > -#else
> > +#else /* CONFIG_USER_ONLY */
> >   #if !defined(CONFIG_KVM)
> >   #define spr_register_kvm(env, num, name, uea_read, uea_write,        =
          \
> >                            oea_read, oea_write, one_reg_id, initial_val=
ue)       \
> > @@ -739,7 +740,7 @@ static inline void vscr_init(CPUPPCState *env, uint=
32_t val)
> >                               one_reg_id, initial_value)               =
          \
> >       _spr_register(env, num, name, uea_read, uea_write,               =
          \
> >                     oea_read, oea_write, hea_read, hea_write, initial_v=
alue)
> > -#else
> > +#else /* CONFIG_KVM */
> >   #define spr_register_kvm(env, num, name, uea_read, uea_write,        =
          \
> >                            oea_read, oea_write, one_reg_id, initial_val=
ue)       \
> >       _spr_register(env, num, name, uea_read, uea_write,               =
          \
> > @@ -751,8 +752,21 @@ static inline void vscr_init(CPUPPCState *env, uin=
t32_t val)
> >       _spr_register(env, num, name, uea_read, uea_write,               =
          \
> >                     oea_read, oea_write, hea_read, hea_write,          =
          \
> >                     one_reg_id, initial_value)
> > -#endif
> > -#endif
> > +#endif /* CONFIG_KVM */
> > +#endif /* CONFIG_USER_ONLY */
> > +#else /* CONFIG_TCG */
> > +#ifdef CONFIG_KVM /* sanity check. should always enter this */
> > +#define spr_register_kvm(env, num, name, uea_read, uea_write,         =
         \
> > +                         oea_read, oea_write, one_reg_id, initial_valu=
e)       \
> > +    _spr_register(env, num, name, one_reg_id, initial_value)
> > +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,      =
         \
> > +                            oea_read, oea_write, hea_read, hea_write, =
         \
> > +                            one_reg_id, initial_value)                =
         \
> > +    _spr_register(env, num, name, one_reg_id, initial_value)
> > +#else /* CONFIG_KVM */
> > +#error "Either TCG or KVM should be configured"
> > +#endif /* CONFIG_KVM */
> > +#endif /* CONFIG_TCG */
>=20
> I think this ifdef tree, and the repetition, is unnecessarily confusing.
> How about something like this?

I've applied Richard's version of this to my tree now, so you might
need to rebase the rest of the series.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--llbTbod1ZdjcVJFS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCPfewACgkQbDjKyiDZ
s5Izeg/8CYPRCiApDHhoUTlbNWB2XzXOIX7JeXj7njn5fPyGa6Yh8pm3yu+YoBa/
UPXoppb2CqgbHnULYzfO5kG7lFj34e9rnA559FhNWOcmGjxbN+sVDcXO6vfaCBPz
D2XpZmiUIZOjjbVOitWEZn9b+ZBNhnIzWFLFfQ6+m9zq9A/2oZFwUjsf+v7nD5WI
fVC6KvA+sUchXuNOhqJMYl5ZlCzFkVG2tgnnvMCgrpe85/V6z+0kF55A12P3AU9B
ZqAB/vt6ehvzW4tLJWHRWUrDufM/aWUeKOHsAr99Maz/k9OwSbOF2DpwnzwrqNKH
XVOt3FAD5Zzp1HRaORyMdk6b44uN6qzOdAfhymPak1hnZPaAixjQ/cOAsh68z1Pf
2a0UPe2imMArUzrn7fvkweu4GDodtTaywQTrGnr2Y9peOJauY//OUlxOnwMYUveI
bogfTK4d9GKNLcuSZCE/wPcCUg83EAnD4AFkwQ1cWNlzhajyb5uYsl2oI7CzZXP6
zKPV+zxDBgH0PdOKrcmi2+qVI4+i3NNZtswGaQX0Ggc4337CTuG7xey2m5kTg/21
9scJcz2hGedch6Vl8+1KauYtMUsLENYRtpgGUF9SkNTjqCOe+/3ykcBt561dgzg5
82UjbqYuJT/pHo7yZ/9e8jRyLNEg2l0LwNHLx1KYoZ5Jp0E9w6M=
=BJhS
-----END PGP SIGNATURE-----

--llbTbod1ZdjcVJFS--

