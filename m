Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ADA4C60E8
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 03:15:27 +0100 (CET)
Received: from localhost ([::1]:42992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOVZO-0003tk-BU
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 21:15:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nOVTR-0002C1-7E; Sun, 27 Feb 2022 21:09:17 -0500
Received: from [2404:9400:2221:ea00::3] (port=41045 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nOVTO-0008Jc-HE; Sun, 27 Feb 2022 21:09:16 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4K6P2J1C13z4xdl; Mon, 28 Feb 2022 13:09:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1646014152;
 bh=Pe/aIzhEmYuYA3AToVa+gHto2w8uP0qIq7MF/a7S7UE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LSdBDZqXShQAZReNSfoZmgtVhiUC7ZM4tk75pnAq4i1zfXlH3uanu/EOdvtzXsBmM
 up8C2OEuMXVnDz+sHpfBDzM3ErVN9O6GDuYDLDkJuN2i3pbLK1IP+TgftsL2H6cE0/
 06eQdGz+OUTUs3GPpRH1u6CHGvqMgb5/Eapn6BKU=
Date: Mon, 28 Feb 2022 13:09:06 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 2/3] spapr: Add SPAPR_CAP_AIL_MODE_3 for AIL mode 3
 support for H_SET_MODE hcall
Message-ID: <Yhwuwp+eAkiu6fnY@yekko>
References: <20220216063903.1782281-1-npiggin@gmail.com>
 <20220216063903.1782281-2-npiggin@gmail.com>
 <Yg2UBtTXneXhDdHz@yekko> <1645601745.av9rgobn2v.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LHZ56Kgf7lLj2uqd"
Content-Disposition: inline
In-Reply-To: <1645601745.av9rgobn2v.astroid@bobo.none>
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
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--LHZ56Kgf7lLj2uqd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2022 at 05:42:06PM +1000, Nicholas Piggin wrote:
> Excerpts from David Gibson's message of February 17, 2022 10:17 am:
> > On Wed, Feb 16, 2022 at 04:39:02PM +1000, Nicholas Piggin wrote:
> >> The behaviour of the Address Translation Mode on Interrupt resource is
> >> not consistently supported by all CPU versions or all KVM versions:
> >> KVM-HV does not support mode 2, and does not support mode 3 on POWER7 =
or
> >> early POWER9 processesors. KVM PR only supports mode 0. TCG supports a=
ll
> >> modes (0, 2, 3). This leads to inconsistencies in guest behaviour and
> >> could cause problems migrating guests.
> >>=20
> >> This was not noticable for Linux guests for a long time because the
> >> kernel only uses modes 0 and 3, and it used to consider AIL-3 to be
> >> advisory in that it would always keep the AIL-0 vectors around. Recent
> >> Linux guests depend on the AIL mode working as specified in order to
> >> support the SCV facility interrupt. If AIL-3 can not be provided, then
> >> Linux must be given an error so it can disable the SCV facility, rather
> >> than silently failing.
> >>=20
> >> Add the ail-mode-3 capability to specify that AIL-3 is supported. AIL-0
> >> is implied as the baseline, and AIL-2 is no longer supported by spapr.
> >> AIL-2 is not known to be used by any software, but support in TCG could
> >> be restored with an ail-mode-2 capability quite easily if a regression
> >> is reported.
> >>=20
> >> Modify the H_SET_MODE Address Translation Mode on Interrupt resource
> >> handler to check capabilities and correctly return error if not
> >> supported.
> >>=20
> >> A heuristic is added for KVM to determine AIL-3 support before the
> >> introduction of a new KVM CAP, because blanket disabling AIL-3 has too
> >> much performance cost.
> >>=20
> >> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> >=20
> > Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> >=20
> > [snip]
> >> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> >> index dc93b99189..1338c41f8f 100644
> >> --- a/target/ppc/kvm.c
> >> +++ b/target/ppc/kvm.c
> >> @@ -2563,6 +2563,35 @@ int kvmppc_has_cap_rpt_invalidate(void)
> >>      return cap_rpt_invalidate;
> >>  }
> >> =20
> >> +bool kvmppc_supports_ail_3(void)
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
> >> +     * mode on some early POWER9s.
> >> +     */
> >> +    if (!(pcc->insns_flags2 & PPC2_ISA207S)) {
> >> +        return 0;
> >> +    }
> >> +
> >> +    /* These tests match the CPU_FTR_P9_RADIX_PREFETCH_BUG flag in Li=
nux */
> >> +    if (((pcc->pvr & 0xffffff00) =3D=3D CPU_POWERPC_POWER9_DD1) ||
> >> +        ((pcc->pvr & 0xffffff00) =3D=3D CPU_POWERPC_POWER9_DD20) ||
> >> +        ((pcc->pvr & 0xffffff00) =3D=3D CPU_POWERPC_POWER9_DD21)) {
> >> +        return 0;
> >> +    }
> >=20
> > Deducing what KVM supports rather than getting it to tell us
> > explicitly with a cap is usually frowned upon.  However, given the
> > earlier discussion, I'm satisfied that this is the least bad available
> > option, at least for now.
>=20
> BTW this particular test doesn't work as I hoped because we only have
> a power9 dd2.0 model.

Oh.. yes... IIRC dd2.0 is barely present in the wild, since it doesn't
have vital Spectre mitigations....

> Adding a 2.2 or 2.3 would be possible. Maybe overkill.  I'll change
> the test just to catch all POWER9 for now.

=2E.. no, given the above, I think we should definitely add the newer
models.  Maybe even remove dd2.0 and replace it with the newer ones.

> KVM cap has been allocated in the upstream kvm tree now though, so I'll
> re-send soon.
>=20
> Thanks,
> Nick
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LHZ56Kgf7lLj2uqd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIcLrsACgkQgypY4gEw
YSIuoA/9GPtBxdh3U05Y3wQO5C2xlcJ7GZFDKH0xgk7i1ajauyK+rvXxaz1Mzxpe
8oY3ugVH+RxgCa2I1EFPxWvNVfNMVlFy0dHDbV+2eeHwbyOmkcTjZ+wTSkzz/2Ub
O+Qv2g25r0q/Vlnw/trdfgfEcIzZSLR4jjjydrAce1UxSUJFKR0t/aMdSQKfPF/x
IeNFZnt3ecdaIbuPCi8EzPHIwkZg0VJGPu8lzORYUjqnqRqImg3txDU3aAlcn7aP
PMvTzMaPa5dgDOCBzbZUTscsBBKD9Y9FOs33+1eaf98aQDYuFuuklw967SzUzepF
zv373bYUvDcp+Hen4lf23bl7M4oenSZ1/eSz40blk650gv2Tsm75OVS1psyNWzjn
75cA95hgLAHbnxWHOMS6G9nM3t/kL7pKBkQeo+ZuEyoZE3IHvtcl78gBBRbXvATa
RzRn4kcdx6GhoZTKyLKYl9+x1d9QSPcMQi1JGrP3QCQWWFx8T4A++sWXcyHUyO0V
11bOASqbKBa6NJNRYwqNV2HhENHOGGtPjwLBiZVEtUVBeeEKNVMkpqNCW+IdMwm6
xuR31m2/HMD39xUT/RlBojaAXD3PiR+vu1edHqcPPsQ4jM9GiFpiCPvmi4gA9Mve
sa8x9sv+bTZWAy1T//tmhN4nK+wQ1uiFLLvOzdBUgtV5M+edbcE=
=2YvT
-----END PGP SIGNATURE-----

--LHZ56Kgf7lLj2uqd--

