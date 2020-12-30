Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798462E77ED
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 12:02:57 +0100 (CET)
Received: from localhost ([::1]:38884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuZFo-0000rX-Ha
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 06:02:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kuZB7-0004WC-Vi; Wed, 30 Dec 2020 05:58:05 -0500
Received: from ozlabs.org ([203.11.71.1]:58637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kuZB5-0007bN-2S; Wed, 30 Dec 2020 05:58:05 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D5StZ1fgqz9sTg; Wed, 30 Dec 2020 21:57:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609325878;
 bh=Xuqx15VTDKuZ+1zt/4KBDtHv0/6HnRw939jhZ5mBmnI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hFsFWOvPGjBxSCqUnhO2F61dSkbsqTlpJ1tVtkjA5yZvbVTt3MvN5ElhwAZDA+qEo
 El6zdHaUy8DICUOTHsO7PLsNR/xxpaWgbraOzL3uMo1T2oWQFDP/rtvMnWs0lC7Zlo
 2fdVVTnSIlh2ToGA2qSLNhuS1rQrujXm4W1pAV2s=
Date: Wed, 30 Dec 2020 18:57:01 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v3 2/3] ppc: Simplify reverse dependencies of POWERNV and
 PSERIES on XICS and XIVE
Message-ID: <20201230075701.GD5490@yekko.fritz.box>
References: <160883056791.253005.14924294027763955653.stgit@bahia.lan>
 <160883057560.253005.4206568349917633920.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RhUH2Ysw6aD5utA4"
Content-Disposition: inline
In-Reply-To: <160883057560.253005.4206568349917633920.stgit@bahia.lan>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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


--RhUH2Ysw6aD5utA4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 24, 2020 at 06:22:55PM +0100, Greg Kurz wrote:
> Have PSERIES to select XICS and XIVE, and directly check PSERIES
> in hw/intc/meson.build to enable build of the XICS and XIVE sPAPR
> backends, like POWERNV already does. This allows to get rid of the
> intermediate XICS_SPAPR and XIVE_SPAPR.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied, thanks.

> ---
>  hw/intc/Kconfig     |    4 +---
>  hw/intc/meson.build |    3 +--
>  hw/ppc/Kconfig      |   14 ++------------
>  3 files changed, 4 insertions(+), 17 deletions(-)
>=20
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index fa2695e58d56..c18d11142a8f 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -32,11 +32,9 @@ config ARM_GIC_KVM
> =20
>  config XICS
>      bool
> -    depends on POWERNV || PSERIES
> =20
> -config XICS_SPAPR
> +config XIVE
>      bool
> -    select XICS
> =20
>  config ALLWINNER_A10_PIC
>      bool
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index b6c9218908e3..53cba115690f 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -53,8 +53,7 @@ specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: fi=
les('sifive_plic.c'))
>  specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
>  specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
>  		if_true: files('xics_kvm.c'))
> -specific_ss.add(when: 'CONFIG_XICS_SPAPR', if_true: files('xics_spapr.c'=
))
> +specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('xics_spapr.c', '=
spapr_xive.c'))
>  specific_ss.add(when: 'CONFIG_XIVE', if_true: files('xive.c'))
>  specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
>  		if_true: files('spapr_xive_kvm.c'))
> -specific_ss.add(when: 'CONFIG_XIVE_SPAPR', if_true: files('spapr_xive.c'=
))
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index e35710c7c368..a213994ebf5d 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -7,8 +7,8 @@ config PSERIES
>      select PCI
>      select SPAPR_VSCSI
>      select VFIO if LINUX   # needed by spapr_pci_vfio.c
> -    select XICS_SPAPR
> -    select XIVE_SPAPR
> +    select XICS
> +    select XIVE
>      select MSI_NONBROKEN
>      select FDT_PPC
>      select CHRP_NVRAM
> @@ -129,16 +129,6 @@ config VIRTEX
>      select XILINX_ETHLITE
>      select FDT_PPC
> =20
> -config XIVE
> -    bool
> -    depends on POWERNV || PSERIES
> -
> -config XIVE_SPAPR
> -    bool
> -    default y
> -    depends on PSERIES
> -    select XIVE
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

--RhUH2Ysw6aD5utA4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/sMs0ACgkQbDjKyiDZ
s5KhpxAAvTQ3/UUhEIjN21L9sPYDGFxTI9D7PK4HVhWu9m5qjSF/jvp9PXzQuf1i
KLj9q14PzC8BffztG1GZq6riGAm4Z7HrKFcUTYT6Gk7zxpw2u1y6TwxStfmlom+8
2msd9WtbLnWjJZuKu2OiFIOqkbchiIDZ3Jvh+ebAGpUDZUo3OidF07peB0blktMv
fOUGUoNomlQgljMHAviYqSjR2qEUIbEPsI4dyOBITXLxtXcaKGB4X+VMeShnieOm
F8v1e9z+ozgzN0zYVI00T8I9Wb4217crBmkgv1SL3ushr1QvszvMssdybAzAylUG
GuXgHqAjEbFBXCzRxPeP3fW4LNniLpXYBwNlK8UwZW9ZDcOeaAq0K3ke/Vh23DIA
VbfiqtZKguvTPCwNjsk9LCuPPhEhDpj9eIH30Y80cuXFLlKCLq0TY9qzfJ4GZPBm
+s3kw3esMGw79K848lD9j8B2rPunbSUJIIiKxlHRYisPy0eFIEpnt9j0s5iB/aHi
9+h8t1oZLNYrxu4bDu6saQaZBABVZ+jYj8IrSlgkLGm1bm0ZYnzdKmuWk6XPgNJC
NzVcSltnjXDvQPV8dg9UQTOxEcHGhIu2p4QzinywNfn8Rq1XiDQOgl2ud5yMVtBw
QNVkJOEVNULe5U8Bcq2EQ1Z/vMbwQ8mmfFTmXHGbSOhtJ6Vtvlc=
=2Ho2
-----END PGP SIGNATURE-----

--RhUH2Ysw6aD5utA4--

