Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5564E7ECB
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 04:35:13 +0100 (CET)
Received: from localhost ([::1]:33156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXxCq-0004Vf-5D
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 23:35:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nXx8k-0003de-P0; Fri, 25 Mar 2022 23:30:58 -0400
Received: from [2404:9400:2221:ea00::3] (port=47683 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nXx8g-0005Xy-G0; Fri, 25 Mar 2022 23:30:58 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KQPcM6ZnLz4xhd; Sat, 26 Mar 2022 14:30:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1648265443;
 bh=iG+noNP2Z08xpF2UFMGY5YNLHBgR+dzct3rDIleUf8o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KeIvpjGCamwDHYF3ZVxKbJmJTn0wXLfX2yYJSMxLCp2EIVQuPNzCgoPGTrUGwNZ3h
 RiV/8+BrJRwWLEmvZ3+/y7E86i8oetZzBCQttOSJdz1cgrpRafvnOP6w0lXH14kUGk
 w9Bzg0mZ304MEaz5HudpUMUgz7F2jZUcG1JwOPQo=
Date: Sat, 26 Mar 2022 14:15:14 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH 1/6] target/ppc: Add support for the Processor
 Attention instruction
Message-ID: <Yj6FQubqactWyyNn@yekko>
References: <20220324190854.156898-1-leandro.lupori@eldorado.org.br>
 <20220324190854.156898-2-leandro.lupori@eldorado.org.br>
 <87tubm12z0.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Xc2VNkLWLkS5HuiC"
Content-Disposition: inline
In-Reply-To: <87tubm12z0.fsf@linux.ibm.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2404:9400:2221:ea00::3
 (failed)
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: Leandro Lupori <leandro.lupori@eldorado.org.br>, danielhb413@gmail.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Xc2VNkLWLkS5HuiC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 25, 2022 at 12:11:47PM -0300, Fabiano Rosas wrote:
> Leandro Lupori <leandro.lupori@eldorado.org.br> writes:
>=20
> > From: C=E9dric Le Goater <clg@kaod.org>
> >
> > Check the HID0 bit to send signal, currently modeled as a checkstop.
> > The QEMU implementation adds an exit using the GPR[3] value (that's a
> > hack for tests)
> >
> > Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> > Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> > ---
> >  target/ppc/cpu.h         |  8 ++++++++
> >  target/ppc/excp_helper.c | 27 +++++++++++++++++++++++++++
> >  target/ppc/helper.h      |  1 +
> >  target/ppc/translate.c   | 14 ++++++++++++++
> >  4 files changed, 50 insertions(+)
> >
> > diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> > index 047b24ba50..12f9f3a880 100644
> > --- a/target/ppc/cpu.h
> > +++ b/target/ppc/cpu.h
> > @@ -173,6 +173,12 @@ enum {
> >      POWERPC_EXCP_PRIV_REG      =3D 0x02,  /* Privileged register excep=
tion     */
> >      /* Trap                                                           =
       */
> >      POWERPC_EXCP_TRAP          =3D 0x40,
> > +    /* Processor Attention                                            =
       */
> > +    POWERPC_EXCP_ATTN          =3D 0x100,
> > +    /*
> > +     * NOTE: POWERPC_EXCP_ATTN uses values from 0x100 to 0x1ff to retu=
rn
> > +     *       error codes.
> > +     */
> >  };
> > =20
> >  #define PPC_INPUT(env) ((env)->bus_model)
> > @@ -2089,6 +2095,8 @@ void ppc_compat_add_property(Object *obj, const c=
har *name,
> >  #define HID0_DOZE           (1 << 23)           /* pre-2.06 */
> >  #define HID0_NAP            (1 << 22)           /* pre-2.06 */
> >  #define HID0_HILE           PPC_BIT(19) /* POWER8 */
> > +#define HID0_ATTN           PPC_BIT(31) /* Processor Attention */
> > +#define HID0_POWER9_ATTN    PPC_BIT(3)
> >  #define HID0_POWER9_HILE    PPC_BIT(4)
> > =20
> >  /*********************************************************************=
********/
> > diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> > index d3e2cfcd71..b0c629905c 100644
> > --- a/target/ppc/excp_helper.c
> > +++ b/target/ppc/excp_helper.c
> > @@ -1379,6 +1379,9 @@ static void powerpc_excp_books(PowerPCCPU *cpu, i=
nt excp)
> >              }
> >              cs->halted =3D 1;
> >              cpu_interrupt_exittb(cs);
> > +            if ((env->error_code & ~0xff) =3D=3D POWERPC_EXCP_ATTN) {
> > +                exit(env->error_code & 0xff);
> > +            }
> >          }
> >          if (env->msr_mask & MSR_HVB) {
> >              /*
> > @@ -1971,6 +1974,30 @@ void helper_pminsn(CPUPPCState *env, powerpc_pm_=
insn_t insn)
> >      env->resume_as_sreset =3D (insn !=3D PPC_PM_STOP) ||
> >          (env->spr[SPR_PSSCR] & PSSCR_EC);
> >  }
> > +
> > +/*
> > + * Processor Attention instruction (Implementation dependent)
> > + */
> > +void helper_attn(CPUPPCState *env, target_ulong r3)
> > +{
> > +    bool attn =3D false;
> > +
> > +    if (env->excp_model =3D=3D POWERPC_EXCP_POWER8) {
> > +        attn =3D !!(env->spr[SPR_HID0] & HID0_ATTN);
> > +    } else if (env->excp_model =3D=3D POWERPC_EXCP_POWER9 ||
> > +               env->excp_model =3D=3D POWERPC_EXCP_POWER10) {
> > +        attn =3D !!(env->spr[SPR_HID0] & HID0_POWER9_ATTN);
> > +    }
>=20
> The excp_model is not a CPU identifier. This should ideally be a flag
> set during init_proc. Something like HID0_ATTN_P8/HID0_ATTN_P9.
>=20
> Maybe we should consider adding a hid0_mask similar to lpcr_mask.

I don't think that's a good idea.  By definition, the meaning of the
HID registers is model specific - having a hid0_mask would imply it
always has the same meaning, just different bits that are present or
not.  I think you want to explicitly dispath to cpu family specific
functions for this.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Xc2VNkLWLkS5HuiC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmI+hSwACgkQgypY4gEw
YSLv3A//UstnZBwRri2RiQc7e1mM5xx3H0FksVSIMsAEcLIftUovwHbXP0Lvct7y
LdZy9PjstxP/4PDWzfa3LtGXS4ETYI4RhCd2ZOz5Q+PeMZUAQv5oqGwJ+NfjpyQx
3o97lTCIxCsMG4M0s5ImLd4HjhP/vK4owsOdsXYudqJfYkTzBfWy5SgFnnRHcfBj
zn+wKmho19q4wcVLIPpxHiVl3KDVTdwY8M6veUjSV2zBwTPevRjLoqFcum/lbaQ2
Z8cv3qaORhayGOCXT8kHlpKZaKIS/IYpGhqiod/OsDPHZSMtUd45sK2vZSotPjN6
DK4iyKuWRkENVbKEWDzSuhftzctWZgw+AYuGWOqKHnoei2JNX7XDWdDtoVgwHwve
TcVlbjL1N0YuwpqBDxLlnEzGOeF5+DIdhdM2z4GjPC78MPAjYWIxOYJAi7krpFCx
9nxeDQa9HW1yn1f7u/+mFZjnmgLdcgi/SrQCyFlg2kjDyuCSUIrq1RyTnmAgO6C9
1uPTl0FS3JYowWfJsUIqgaC6iz9LA0OIeUC+zNn7fkIMc/Afmmdeuht7sZVGb7ae
XnwZxCBOa4HbzcNtki/xwWxO3jALgI6u0G1ZzHfOLc4rolvwEHcTfu8q59bebgqr
mMCCh1tlvirRYBxZjr/VFTBU8jzLnXOcwMjegFM48bRaZb+IXHU=
=jLIJ
-----END PGP SIGNATURE-----

--Xc2VNkLWLkS5HuiC--

