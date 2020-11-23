Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36342BFF15
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 05:44:34 +0100 (CET)
Received: from localhost ([::1]:43560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh3iL-0008RP-Vx
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 23:44:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh3d7-00011k-JS; Sun, 22 Nov 2020 23:39:09 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:54041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh3d5-0006Qm-Ls; Sun, 22 Nov 2020 23:39:09 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CfZDC4dt4z9sVJ; Mon, 23 Nov 2020 15:38:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606106331;
 bh=pSOXPI/Z5xTXgYYw4DKu+1DwIhgWV8lhOgnGdsFBJsk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=USuJzM7JAPpUZmARiMr9LTTD16IWfv0BEYfObxi1dvahDZjFj69k09HaIyTMRO4s5
 NLJh9PLWLy6Il7ZG5rERx6DYJpCFZHSCWfzk24kzgWD+TDsumxAlIDsuz235PjQzrA
 o/Sx+9uV199Lk4Nx+pTYyZr1yVssnD2RR6vL/B/s=
Date: Mon, 23 Nov 2020 15:10:45 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 5/8] spapr/xics: Drop unused argument to
 xics_kvm_has_broken_disconnect()
Message-ID: <20201123041045.GE521467@yekko.fritz.box>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-6-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="84ND8YJRMFlzkrP4"
Content-Disposition: inline
In-Reply-To: <20201120174646.619395-6-groug@kaod.org>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--84ND8YJRMFlzkrP4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 06:46:43PM +0100, Greg Kurz wrote:
> Never used from the start.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
>  include/hw/ppc/xics_spapr.h | 2 +-
>  hw/intc/xics_kvm.c          | 2 +-
>  hw/ppc/spapr_irq.c          | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/hw/ppc/xics_spapr.h b/include/hw/ppc/xics_spapr.h
> index 0b8182e40b33..de752c0d2c7e 100644
> --- a/include/hw/ppc/xics_spapr.h
> +++ b/include/hw/ppc/xics_spapr.h
> @@ -38,6 +38,6 @@ DECLARE_INSTANCE_CHECKER(ICSState, ICS_SPAPR,
>  int xics_kvm_connect(SpaprInterruptController *intc, uint32_t nr_servers,
>                       Error **errp);
>  void xics_kvm_disconnect(SpaprInterruptController *intc);
> -bool xics_kvm_has_broken_disconnect(SpaprMachineState *spapr);
> +bool xics_kvm_has_broken_disconnect(void);
> =20
>  #endif /* XICS_SPAPR_H */
> diff --git a/hw/intc/xics_kvm.c b/hw/intc/xics_kvm.c
> index 68bb1914b9bb..570d635bcc08 100644
> --- a/hw/intc/xics_kvm.c
> +++ b/hw/intc/xics_kvm.c
> @@ -484,7 +484,7 @@ void xics_kvm_disconnect(SpaprInterruptController *in=
tc)
>   * support destruction of a KVM XICS device while the VM is running.
>   * Required to start a spapr machine with ic-mode=3Ddual,kernel-irqchip=
=3Don.
>   */
> -bool xics_kvm_has_broken_disconnect(SpaprMachineState *spapr)
> +bool xics_kvm_has_broken_disconnect(void)
>  {
>      int rc;
> =20
> diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> index a0fc474ecb06..2dacbecfd5fd 100644
> --- a/hw/ppc/spapr_irq.c
> +++ b/hw/ppc/spapr_irq.c
> @@ -186,7 +186,7 @@ static int spapr_irq_check(SpaprMachineState *spapr, =
Error **errp)
>      if (kvm_enabled() &&
>          spapr->irq =3D=3D &spapr_irq_dual &&
>          kvm_kernel_irqchip_required() &&
> -        xics_kvm_has_broken_disconnect(spapr)) {
> +        xics_kvm_has_broken_disconnect()) {
>          error_setg(errp,
>              "KVM is incompatible with ic-mode=3Ddual,kernel-irqchip=3Don=
");
>          error_append_hint(errp,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--84ND8YJRMFlzkrP4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+7NkUACgkQbDjKyiDZ
s5L+FBAA47hbMlcjjX9d8cQwXjmk0LKy8IgPr8cZSGJ0CZaDOAEaQZh2GU+S2Z0I
90zAZEm/kGW8Ib4LQ/MW2qH5TuP7usnzH0bwyEA7UnqJkQkBTI8jL3SEOyCsdbp7
1lTH7UqUbeJJAjGUeo6ql9fDxamWShQ7TuJ3z/YJCGbkIlwGrUsEVGtciEgaCK1z
XSTVuHOrZlcUz84dyYYml+PBBgZ3T2dy8VsF9/MUrpSrbqPAmVwfuu63vn59xD9z
/XWyGFjzidGUsgmTqqki25Lo1zO6vUExlu1mQql4ypXH8R/GHzxPILJMiCR/nNUd
uC6FfSopiPBnOk4kzjnuZxfz9WZmdtBTPc4i2FvcRnQ2yI5RIOKuw+sHTs5nn7uu
7rzFL9JUjhynEd5Q/GwpqUwSx4hg5PwTwGG4PGKEeM4HDQqRegfipcOym+bQc01V
lnFbIOsXM1w9XgX6jv5EQjlYLuF+Cd+HwkmbrbzvXep7kPgnNTbfkFZsgA0kMvLh
XT4etTGUeWq539rhjfbihikjNnn8hddxCrsGR//0d3VbqTAin305244cLKDfqKBD
vbQc5CEs3l6I09KtJxK+KHPvc9ikzMJpQIBhRFEHfeEQTzRmNRiXBWQiGVQZiFgK
ODmx53kelbKsYJgm0H9sfYhpk3Hto9kkec3CyLSR7vfng6R0dk8=
=aQQn
-----END PGP SIGNATURE-----

--84ND8YJRMFlzkrP4--

