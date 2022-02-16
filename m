Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FDD4B8030
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 06:28:21 +0100 (CET)
Received: from localhost ([::1]:54372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCrU-0005G4-NS
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 00:28:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKCQi-0003xT-UE; Wed, 16 Feb 2022 00:00:41 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:43263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKCQf-0004Zm-On; Wed, 16 Feb 2022 00:00:40 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz5PW1z76z4xsm; Wed, 16 Feb 2022 16:00:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644987631;
 bh=EuFDs6t06wJPL7QHVrz/xkyfyoco99C3cCVRayR1K18=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eiu39IbgeEy5S6byXEkcBXfbmNvw6qoHQn0vlrTXFQTcJ5B+3f6TVQ2h7Mqxuq3Fc
 8kpsc3a7GVKamzNafUSmJCvmzrGtEIeeLQ53xhjdLKZaBxzASilT68gLK4EUps4S6W
 /fyQxuEn6jJIlrZ/9p/q8kfXM4ASvhs5o3L/4wRw=
Date: Wed, 16 Feb 2022 16:00:03 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] spapr: Add SPAPR_CAP_AIL_MODE_3 for AIL mode 3
 support for H_SET_MODE hcall
Message-ID: <YgyE00PnEomXD+DQ@yekko>
References: <20220214111749.1542196-1-npiggin@gmail.com>
 <Ygr9eYymaFJb0nEI@yekko> <1644976024.xj3xgh76qi.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6gS/m+4rYhnaBkeo"
Content-Disposition: inline
In-Reply-To: <1644976024.xj3xgh76qi.astroid@bobo.none>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6gS/m+4rYhnaBkeo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2022 at 11:50:34AM +1000, Nicholas Piggin wrote:
> Excerpts from David Gibson's message of February 15, 2022 11:10 am:
> > On Mon, Feb 14, 2022 at 09:17:48PM +1000, Nicholas Piggin wrote:
> >> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> >> index 222c1b6bbd..5dec056796 100644
> >> --- a/hw/ppc/spapr_hcall.c
> >> +++ b/hw/ppc/spapr_hcall.c
> >> @@ -811,32 +811,35 @@ static target_ulong h_set_mode_resource_le(Power=
PCCPU *cpu,
> >>  }
> >> =20
> >>  static target_ulong h_set_mode_resource_addr_trans_mode(PowerPCCPU *c=
pu,
> >> +                                                        SpaprMachineS=
tate *spapr,
> >>                                                          target_ulong =
mflags,
> >>                                                          target_ulong =
value1,
> >>                                                          target_ulong =
value2)
> >>  {
> >> -    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> >> -
> >> -    if (!(pcc->insns_flags2 & PPC2_ISA207S)) {
> >> -        return H_P2;
> >> -    }
> >>      if (value1) {
> >>          return H_P3;
> >>      }
> >> +
> >>      if (value2) {
> >>          return H_P4;
> >>      }
> >> =20
> >> -    if (mflags =3D=3D 1) {
> >> -        /* AIL=3D1 is reserved in POWER8/POWER9/POWER10 */
> >> +    /* AIL-1 is not architected, and AIL-2 is not supported by QEMU. =
*/
> >> +    if (mflags =3D=3D 1 || mflags =3D=3D 2) {
> >=20
> > This test is redundant with the one below, isn't it?
>=20
> Ah, yes.
>=20
> >=20
> >>          return H_UNSUPPORTED_FLAG;
> >>      }
> >> =20
> >> -    if (mflags =3D=3D 2 && (pcc->insns_flags2 & PPC2_ISA310)) {
> >> -        /* AIL=3D2 is reserved in POWER10 (ISA v3.1) */
> >> +    /* Only 0 and 3 are possible */
> >> +    if (mflags !=3D 0 && mflags !=3D 3) {
> >>          return H_UNSUPPORTED_FLAG;
> >>      }
> >> =20
> >> +    if (mflags =3D=3D 3) {
> >> +        if (!spapr_get_cap(spapr, SPAPR_CAP_AIL_MODE_3)) {
> >> +            return H_UNSUPPORTED_FLAG;
> >> +        }
> >> +    }
> >> +
> >>      spapr_set_all_lpcrs(mflags << LPCR_AIL_SHIFT, LPCR_AIL);
> >> =20
> >>      return H_SUCCESS;
> >> @@ -853,7 +856,7 @@ static target_ulong h_set_mode(PowerPCCPU *cpu, Sp=
aprMachineState *spapr,
> >>          ret =3D h_set_mode_resource_le(cpu, spapr, args[0], args[2], =
args[3]);
> >>          break;
> >>      case H_SET_MODE_RESOURCE_ADDR_TRANS_MODE:
> >> -        ret =3D h_set_mode_resource_addr_trans_mode(cpu, args[0],
> >> +        ret =3D h_set_mode_resource_addr_trans_mode(cpu, spapr, args[=
0],
> >>                                                    args[2], args[3]);
> >>          break;
> >>      }
> >> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> >> index ee7504b976..edbf3eeed0 100644
> >> --- a/include/hw/ppc/spapr.h
> >> +++ b/include/hw/ppc/spapr.h
> >> @@ -77,8 +77,10 @@ typedef enum {
> >>  #define SPAPR_CAP_FWNMI                 0x0A
> >>  /* Support H_RPT_INVALIDATE */
> >>  #define SPAPR_CAP_RPT_INVALIDATE        0x0B
> >> +/* Support for AIL modes */
> >> +#define SPAPR_CAP_AIL_MODE_3            0x0C
> >>  /* Num Caps */
> >> -#define SPAPR_CAP_NUM                   (SPAPR_CAP_RPT_INVALIDATE + 1)
> >> +#define SPAPR_CAP_NUM                   (SPAPR_CAP_AIL_MODE_3 + 1)
> >> =20
> >>  /*
> >>   * Capability Values
> >> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> >> index dc93b99189..128bc530d4 100644
> >> --- a/target/ppc/kvm.c
> >> +++ b/target/ppc/kvm.c
> >> @@ -2563,6 +2563,29 @@ int kvmppc_has_cap_rpt_invalidate(void)
> >>      return cap_rpt_invalidate;
> >>  }
> >> =20
> >> +int kvmppc_supports_ail_3(void)
> >=20
> > Returning bool would make more sense, no?
>=20
> It would.
>=20
> >=20
> >> +{
> >> +    PowerPCCPUClass *pcc =3D kvm_ppc_get_host_cpu_class();
> >> +
> >> +    /*
> >> +     * KVM PR only supports AIL-0
> >> +     */
> >> +    if (kvmppc_is_pr(kvm_state)) {
> >> +        return 0;
> >> +    }
> >> +
> >> +    /*
> >> +     * KVM HV hosts support AIL-3 on POWER8 and above, except for rad=
ix
> >> +     * mode on some early POWER9s, but it's not clear how to cover th=
ose
> >> +     * without disabling the feature for many.
> >> +     */
> >> +    if (!(pcc->insns_flags2 & PPC2_ISA207S)) {
> >=20
> > This effectively means that the pseries machine type simply won't
> > start with a !PPC2_ISA207S cpu model.  I'm not sure if we support any
> > such CPUs in any case.
>=20
> Oh, would that at least give an error to disable cap-ail-mode-3?

Yes, it should.  Which for something as obscure as POWER7 may be acceptable.

> > If we do, we should probably change the
> > default value for this cap based on cpu model in
> > default_caps_with_cpu().
>=20
> We allegedly still support POWER7 KVM in Linux. I've never tested it
> and I don't know how much it's used at all. Probably should keep it
> working here if possible. I'll look into default_caps_with_cpu().
>=20
> Thanks,
> Nick
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6gS/m+4rYhnaBkeo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMhMoACgkQgypY4gEw
YSKeXA//aNDsPOB3Yv4oe9kqGNAW84mZG/7nbEqSCd0cSvZLp/KiczJDgwKeBOhU
+jDx40d0EBoicZb4Qrj9v1vbRdGQivRjSKeXgw9stU7aLOcH8F0rVCMiAgE6BKWv
KWAd75eekeaUoNX3+9PSn3T/fcHnB1V2mUE3NIVozCrLtQFHQ6yVQpX9L/IodOL2
ttDFhhw24V25fYeujP/O3JPk/QtKd4cCeW6hZislBNnWtfL4MusVsk5rq6+WXbLB
1f11cWdrHjWUO0XDtZyAHfd9Ir3WwwiYjxs3kfd3wZxxeVKLcV18hnob72q8qqfE
vyV7ZQyUIk08oRH/L5p2l/qcobCV52JRV4QYwGCDnK2N4qWO48PCajBOKZjSMqzn
lcEj/HmeBGRLLgenz2k6jkcfoalETOi0Uvx8oe3P5CfoMVfXofx14YuxlPeS4PL3
ZajvIpx4LMgzmz2Kewk57P2MHGKekhpGWOAxUsuK2FSgn/qXlO0NPHnSaQ9L/J5o
juj2yYnOebE9wEvFncymOFvU0oAp9hy3sjm2SUVO96bA3vPH4sU7RCWNiru1ENDl
3geOlxsuUd3wvgLjZNaMgBy1JbvwNzb1/NpOu6L2/sndrT63KsbHg9oq+moMWhJ4
dhNRPC4rC5Gp07SPaenHQ9yPoq3hzwkZvjI7xD5SgvvfurvcBjg=
=sFF6
-----END PGP SIGNATURE-----

--6gS/m+4rYhnaBkeo--

