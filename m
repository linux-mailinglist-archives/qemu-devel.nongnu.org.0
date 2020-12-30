Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBDB2E77E7
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 11:59:25 +0100 (CET)
Received: from localhost ([::1]:33102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuZCO-0006Ee-Ao
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 05:59:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kuZB8-0004WT-5z; Wed, 30 Dec 2020 05:58:06 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:53079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kuZB5-0007as-2Z; Wed, 30 Dec 2020 05:58:05 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D5StZ0dZTz9sVm; Wed, 30 Dec 2020 21:57:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609325878;
 bh=aTK+EHvd0bXodr5GHbJw4eashOa3pV3FtII7n8f+SS8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XySh6Gkm6xf9zKN+8p8mfAx3bFHkBTFvq7qA40Kc+E/asWEhVNpk3lQC7+M8fiyoj
 2vQQTPGlUcqk7LvCZEvWCnEN6Xu9UVb/P8wE7u0fHMCWGfD+5YUZ0Yvzx/64jFIQ/L
 GXTfw0ia3iP5NqHsp6C2mTaBBZrg2sZvUVwrab+A=
Date: Wed, 30 Dec 2020 18:55:32 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v3 1/3] ppc: Fix build with --without-default-devices
Message-ID: <20201230075532.GC5490@yekko.fritz.box>
References: <160883056791.253005.14924294027763955653.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xesSdrSSBC0PokLI"
Content-Disposition: inline
In-Reply-To: <160883056791.253005.14924294027763955653.stgit@bahia.lan>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--xesSdrSSBC0PokLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 24, 2020 at 06:22:47PM +0100, Greg Kurz wrote:
> Linking of the qemu-system-ppc64 fails on a POWER9 host when
> --without-default-devices is passed to configure:
>=20
> $ ./configure --without-default-devices \
>               --target-list=3Dppc64-softmmu && make
>=20
> ...
>=20
> libqemu-ppc64-softmmu.fa.p/hw_ppc_e500.c.o: In function `ppce500_init_mpi=
c_kvm':
> /home/greg/Work/qemu/qemu-ppc/build/../hw/ppc/e500.c:777: undefined refer=
ence to `kvm_openpic_connect_vcpu'
> libqemu-ppc64-softmmu.fa.p/hw_ppc_spapr_irq.c.o: In function `spapr_irq_c=
heck':
> /home/greg/Work/qemu/qemu-ppc/build/../hw/ppc/spapr_irq.c:189: undefined =
reference to `xics_kvm_has_broken_disconnect'
> libqemu-ppc64-softmmu.fa.p/hw_intc_spapr_xive.c.o: In function `spapr_xiv=
e_post_load':
> /home/greg/Work/qemu/qemu-ppc/build/../hw/intc/spapr_xive.c:530: undefine=
d reference to `kvmppc_xive_post_load'
>=20
> ... and tons of other symbols belonging to the KVM backend of the
> openpic, XICS and XIVE interrupt controllers.
>=20
> It turns out that OPENPIC_KVM, XICS_KVM and XIVE_KVM are marked
> to depend on KVM but this has no effect when minikconf runs in
> allnoconfig mode. Such reverse dependencies should rather be
> handled with a 'select' statement, eg.
>=20
> config OPENPIC
>     select OPENPIC_KVM if KVM
>=20
> or even better by getting rid of the intermediate _KVM config
> and directly checking CONFIG_KVM in the meson.build file:
>=20
> specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_OPENPIC'],
> 		if_true: files('openpic_kvm.c'))
>=20
> Go for the latter with OPENPIC, XICS and XIVE.
>=20
> This went unnoticed so far because CI doesn't test the build with
> --without-default-devices and KVM enabled on a POWER host.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied, thanks.

> ---
>=20
> The various comments motivated me enough for another round,
> which is basically to split the cleanup out to a separate
> patch and use CONFIG_PSERIES in hw/intc/meson.build as
> suggested by Cedric.
>=20
> v3: - move cleanup to a separate patch
>=20
> v2: - check CONFIG_KVM in the meson.build as suggested by Paolo
> ---
>  hw/intc/Kconfig     |   10 ----------
>  hw/intc/meson.build |    9 ++++++---
>  hw/ppc/Kconfig      |    5 -----
>  3 files changed, 6 insertions(+), 18 deletions(-)
>=20
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index 468d548ca771..fa2695e58d56 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -30,11 +30,6 @@ config ARM_GIC_KVM
>      default y
>      depends on ARM_GIC && KVM
> =20
> -config OPENPIC_KVM
> -    bool
> -    default y
> -    depends on OPENPIC && KVM
> -
>  config XICS
>      bool
>      depends on POWERNV || PSERIES
> @@ -43,11 +38,6 @@ config XICS_SPAPR
>      bool
>      select XICS
> =20
> -config XICS_KVM
> -    bool
> -    default y
> -    depends on XICS && KVM
> -
>  config ALLWINNER_A10_PIC
>      bool
> =20
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index 68da782ad2c5..b6c9218908e3 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -39,7 +39,8 @@ specific_ss.add(when: 'CONFIG_LOONGSON_LIOINTC', if_tru=
e: files('loongson_lioint
>  specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gic.c'))
>  specific_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_intc.c'))
>  specific_ss.add(when: 'CONFIG_OMPIC', if_true: files('ompic.c'))
> -specific_ss.add(when: 'CONFIG_OPENPIC_KVM', if_true: files('openpic_kvm.=
c'))
> +specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_OPENPIC'],
> +		if_true: files('openpic_kvm.c'))
>  specific_ss.add(when: 'CONFIG_POWERNV', if_true: files('xics_pnv.c', 'pn=
v_xive.c'))
>  specific_ss.add(when: 'CONFIG_PPC_UIC', if_true: files('ppc-uic.c'))
>  specific_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_ic.c', 'bc=
m2836_control.c'))
> @@ -50,8 +51,10 @@ specific_ss.add(when: 'CONFIG_SH4', if_true: files('sh=
_intc.c'))
>  specific_ss.add(when: 'CONFIG_SIFIVE_CLINT', if_true: files('sifive_clin=
t.c'))
>  specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.=
c'))
>  specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
> -specific_ss.add(when: 'CONFIG_XICS_KVM', if_true: files('xics_kvm.c'))
> +specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
> +		if_true: files('xics_kvm.c'))
>  specific_ss.add(when: 'CONFIG_XICS_SPAPR', if_true: files('xics_spapr.c'=
))
>  specific_ss.add(when: 'CONFIG_XIVE', if_true: files('xive.c'))
> -specific_ss.add(when: 'CONFIG_XIVE_KVM', if_true: files('spapr_xive_kvm.=
c'))
> +specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
> +		if_true: files('spapr_xive_kvm.c'))
>  specific_ss.add(when: 'CONFIG_XIVE_SPAPR', if_true: files('spapr_xive.c'=
))
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index 982d55f5875c..e35710c7c368 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -139,11 +139,6 @@ config XIVE_SPAPR
>      depends on PSERIES
>      select XIVE
> =20
> -config XIVE_KVM
> -    bool
> -    default y
> -    depends on XIVE_SPAPR && KVM
> -
>  # Only used by 64-bit targets
>  config FW_CFG_PPC
>      bool
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--xesSdrSSBC0PokLI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/sMnEACgkQbDjKyiDZ
s5IAEQ/+KP/ngoIscqEuiLy+8Cy2XrCbKOiKXzTlA18fuT6e4Dhmd3mIdbQYwT73
QzH9hl9Ry5JXNT3bkmy4G1siMM7GIUuygISIIifyUGj+D8vYvxSTSz/iRByHuZv5
o/Fq3fq+Q8qsQFaPev+hPrOCQaz/peDNOqBx8u+6X96giNsSBGhRO0jaQXWDuCk7
DqMbk9HlRD1CB/r6orap7Sfw4C46+fvk/l9xxOUyRbto2s61nU6SAonPKRFPID8s
0EQ3pDJohFxCPfedavH+eHm5YmCI1AdeZVo6PRNZDi7RyMVBemF+KJxBoB56RCU2
SEiDf/eQMRzmJ//QSVhYhirmngG4MYOU7D4f21R4sWQHFbxfJ2Yqbe8n+j9epOfN
5y2jRIYu6I36MI62f3RjJ3t2MzOfBsOYddmBRHgkEVHR7GExoYGJImuvGg1jTj9V
KJnn0RsukyXpERg/T9T+jOcP5SVJv6O2AJIc8oO1nA7xxCcXYPv6KBhlbPfUgfRZ
QBBSU4gnc5CiYxiOpsgcWDOpd/dJvQm+cGpDiX1NBrxjp6DVHfwx4lDHMIBdqKCu
p9+yBh4RL0WcBXxJNauY5I76s8CaKuWbgUL7BqvXeayF+5jnWHBZM9qLrcAUmO72
fJd9PdcYG4GdbkwqHw1E6d+jts6TQmuPbTLVSa08dv9o3WxZbDI=
=QD/q
-----END PGP SIGNATURE-----

--xesSdrSSBC0PokLI--

