Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4665424B9E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 03:27:19 +0200 (CEST)
Received: from localhost ([::1]:40152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYIBq-0001bf-4e
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 21:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mYI87-0000gy-7i; Wed, 06 Oct 2021 21:23:27 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:49313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mYI85-0006Mb-4b; Wed, 06 Oct 2021 21:23:27 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HPtqp2zTYz4xbC; Thu,  7 Oct 2021 12:23:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1633569798;
 bh=zhzBupDKiak8CtVsx07z8y92l+cEjJv0xp1qMvVmLC0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NJ/rfkFeoxzoTBoxWkOYqkMI1wivHkhsv79DB7wRbsHAOGoX/VMxQfpGwgOnNlPnW
 R2RyBfGYf0UgMyqCO16BwT+5bV48+gxo016FcOr5iXWtwDpZwCM0MWFAmPUuMPkGFZ
 OdST/AesQLSf5Kk56ML63VWXS1RWxRAZJydC5OxY=
Date: Thu, 7 Oct 2021 12:17:48 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 02/15] target/ppc: add user write access control for
 PMU SPRs
Message-ID: <YV5KvOR6Ln+hFd8n@yekko>
References: <20210903203116.80628-1-danielhb413@gmail.com>
 <20210903203116.80628-3-danielhb413@gmail.com>
 <YTbCnSz86hsUAF/+@yekko>
 <587d197b-25a4-c5c2-3c3c-4132ac4cdf6b@gmail.com>
 <YVFR0kOUJ2yA6+hg@yekko>
 <2cdfcc63-df5d-5f50-acd0-89c00bf13732@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Mktq+N8sHaxDK/UN"
Content-Disposition: inline
In-Reply-To: <2cdfcc63-df5d-5f50-acd0-89c00bf13732@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Mktq+N8sHaxDK/UN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2021 at 08:05:22PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 9/27/21 02:08, David Gibson wrote:
> > On Thu, Sep 23, 2021 at 11:39:14AM -0300, Daniel Henrique Barboza wrote:
> > >=20
> > >=20
> > > On 9/6/21 22:38, David Gibson wrote:
> > > > On Fri, Sep 03, 2021 at 05:31:03PM -0300, Daniel Henrique Barboza w=
rote:
> > > > > The PMU needs to enable writing of its uregs to userspace, otherw=
ise
> > > > > Perf applications will not able to setup the counters correctly. =
This
> > > > > patch enables user space writing of all PMU uregs.
> > > > >=20
> > > > > MMCR0 is a special case because its userspace writing access is c=
ontrolled
> > > > > by MMCR0_PMCC bits. There are 4 configurations available (0b00, 0=
b01,
> > > > > 0b10 and 0b11) but for our purposes here we're handling only
> > > > > MMCR0_PMCC =3D 0b00. In this case, if userspace tries to write MM=
CR0, a
> > > > > hypervisor emulation assistance interrupt occurs.
> > > > >=20
> > > > > This is being done by adding HFLAGS_PMCCCLEAR to hflags. This flag
> > > > > indicates if MMCR0_PMCC is cleared (0b00), and a new 'pmcc_clear'=
 flag in
> > > > > DisasContext allow us to use it in spr_write_MMCR0_ureg().
> > > > >=20
> > > > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > > > ---
> > > > >    target/ppc/cpu.h         |  1 +
> > > > >    target/ppc/cpu_init.c    | 18 +++++++-------
> > > > >    target/ppc/helper_regs.c |  3 +++
> > > > >    target/ppc/spr_tcg.h     |  3 ++-
> > > > >    target/ppc/translate.c   | 53 ++++++++++++++++++++++++++++++++=
+++++++-
> > > > >    5 files changed, 67 insertions(+), 11 deletions(-)
> > > > >=20
> > > > > diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> > > > > index f68bb8d8aa..8dfbb62022 100644
> > > > > --- a/target/ppc/cpu.h
> > > > > +++ b/target/ppc/cpu.h
> > > > > @@ -616,6 +616,7 @@ enum {
> > > > >        HFLAGS_SE =3D 10,  /* MSR_SE -- from elsewhere on embedded=
 ppc */
> > > > >        HFLAGS_FP =3D 13,  /* MSR_FP */
> > > > >        HFLAGS_PR =3D 14,  /* MSR_PR */
> > > > > +    HFLAGS_PMCCCLEAR =3D 15, /* PMU MMCR0 PMCC equal to 0b00 */
> > > > >        HFLAGS_VSX =3D 23, /* MSR_VSX if cpu has VSX */
> > > > >        HFLAGS_VR =3D 25,  /* MSR_VR if cpu has VRE */
> > > > > diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> > > > > index 9efc6c2d87..bb5ea04c61 100644
> > > > > --- a/target/ppc/cpu_init.c
> > > > > +++ b/target/ppc/cpu_init.c
> > > > > @@ -6867,7 +6867,7 @@ static void register_book3s_pmu_sup_sprs(CP=
UPPCState *env)
> > > > >    static void register_book3s_pmu_user_sprs(CPUPPCState *env)
> > > > >    {
> > > > >        spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
> > > > > -                 &spr_read_MMCR0_ureg, SPR_NOACCESS,
> > > > > +                 &spr_read_MMCR0_ureg, &spr_write_MMCR0_ureg,
> > > > >                     &spr_read_ureg, &spr_write_ureg,
> > > > >                     0x00000000);
> > > > >        spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
> > > > > @@ -6875,31 +6875,31 @@ static void register_book3s_pmu_user_sprs=
(CPUPPCState *env)
> > > > >                     &spr_read_ureg, &spr_write_ureg,
> > > > >                     0x00000000);
> > > > >        spr_register(env, SPR_POWER_UMMCRA, "UMMCRA",
> > > > > -                 &spr_read_ureg, SPR_NOACCESS,
> > > > > +                 &spr_read_ureg, &spr_write_ureg,
> > > > >                     &spr_read_ureg, &spr_write_ureg,
> > > > >                     0x00000000);
> > > > >        spr_register(env, SPR_POWER_UPMC1, "UPMC1",
> > > > > -                 &spr_read_ureg, SPR_NOACCESS,
> > > > > +                 &spr_read_ureg, &spr_write_ureg,
> > > >=20
> > > > Surely this can't be write.  AFAICT spr_write_ureg() will
> > > > unconditionally allow full userspace write access.  That can't be
> > > > right - otherwise the OS could never safely use the PMU for itself.
> > >=20
> > > My assumption here was that the user mode SPRs (UMMCR* and UPMC*) wer=
e created to
> > > allow userspace read/write of PMU regs, while the regular regs (MMCR*=
 and PMC*)
> > > are the supermode privileged SPRs that can't be written by userspace.=
 At least this
> > > is my understanding from reading commit fd51ff6328e3d98158 that intro=
duced these
> > > userspace PMC regs.
> >=20
> > Sure, but my point is that these registers are only userspace
> > accessible under certain conditions, IIUC.  spr_write_ureg() doesn't
> > test for those conditions, so it will *always* allow write access.
>=20
>=20
> Got it.
>=20
> I guess I'll end up biting the bullet and exposing both PMCC bits and add=
ing
> proper read/write access controls for the callbacks we need. This is some=
what
> out of scope of my original goal with this series, but I guess we'll all =
better
> off by doing it right now.

Yeah, sorry to divert you from the EBB stuff, but I don't want to
merge PMU support with glaring flaws.

> I'll add all the read/write ureg functions I'll need in the first patches=
 (the PMC
> write callback functions are on the patch 14, for instance). That will, h=
opefully,
> making it easier to review the rest of the series by going through all th=
e access
> control and read/write callbacks early on.

That sounds good.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Mktq+N8sHaxDK/UN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFeSrwACgkQbDjKyiDZ
s5J+ohAAlCaCBrpotPqs19aXSbaxlCX81JYzbTeFtcliff93oOv6snqxZNOthDKa
q7otL8M9kVZwZppgzgmexjqpu5aZ4iL5SkA8A7MkdExi4RWDTMZ+wdL0d/GuQYp/
zmuKAHS8Ud0wwey5otTwx8LdK9fxcm62Jd+7/9yTFWJ4hyrT9fqA6PhIZKf6jojp
PPV/h6zC0gAG+0vBJIZh5dPqXqR+vCtPta3/ifCEuri2+Ec5YXC7sZZX7QpaQdCn
iUEMY1WP2nOf1NQVN66EBAYE6PwYDEmmUXc/U1VHru8VBQyfHFqXk+3RBqyUR6u8
F2dH6E1B9SNY6txM+6UIbfaQOViI62ZVzXyw+Svwb9YtN0GwMWtz1Qp/13N1+qOW
aKw/lYV69EnjU0X6q5S5dzgvvrAZeKUmThhs27jhzEKRsWxjms6I6A1+Qd1b3Z8D
nV1g6+3IJIqhX6p8wbrVPnbJl8xQt/oMfQxE4ZN+DvVItwHoP1aZWszmBmxWu6QZ
msrLmvilt34JkCzc/zXSLBzKUwsO1bN/EDhBMT7wfvBhN/5tDMd9+mAndQgSXpWh
f2mWw8V1kHs0DMwAKUy2YeYFuCSO/1Km9cc64vUC8+xXEUe02tFhv988/IzZP06N
2nr/xGtvtIUll7Km5hPBmcotQvsVMaCpkO7tJzs+h2jStuLD3tU=
=tSPS
-----END PGP SIGNATURE-----

--Mktq+N8sHaxDK/UN--

