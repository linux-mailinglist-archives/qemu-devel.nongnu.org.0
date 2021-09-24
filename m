Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97939416A04
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 04:28:45 +0200 (CEST)
Received: from localhost ([::1]:44718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTaxA-0005As-Jd
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 22:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mTaq3-0002WN-EG; Thu, 23 Sep 2021 22:21:23 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:40965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mTaq0-0003dS-9e; Thu, 23 Sep 2021 22:21:23 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HFwkd51gsz4xbQ; Fri, 24 Sep 2021 12:21:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632450073;
 bh=zmCr1PCbEsXsd4WzNPEmFJrnhd41NOrg7adYTsm2twA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Buv/dllqKjI2EqtygE6vQ7MTB37gdSOhFyrxqCWgjIJG0JmRipO2G41XhPqhKrnTU
 hyoVsACE39baIUINAZAsJeT7i9Qdv3A1y+aWhH98odoLVTIZUETHxoQMQK8LH9Lz6u
 zU5n1Tp2YcW6EgBQigB4wLHy2ozjxUwQaQ2xtLrI=
Date: Fri, 24 Sep 2021 12:16:46 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 "@yekko"@gandalf.ozlabs.org
Subject: Re: [PATCH v2] spapr/xive: Fix kvm_xive_source_reset trace event
Message-ID: <YU01Dj2MRA8+zVlZ@yekko>
References: <20210922070205.1235943-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2I+LkhPpzMMwf+W4"
Content-Disposition: inline
In-Reply-To: <20210922070205.1235943-1-clg@kaod.org>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--2I+LkhPpzMMwf+W4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 09:02:05AM +0200, C=E9dric Le Goater wrote:
> The trace event was placed in the wrong routine. Move it under
> kvmppc_xive_source_reset_one().
>=20
> Fixes: 4e960974d4ee ("xive: Add trace events")
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.2, thanks.

> ---
>  hw/intc/spapr_xive_kvm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> index beb904d5bdee..bf43ffb54018 100644
> --- a/hw/intc/spapr_xive_kvm.c
> +++ b/hw/intc/spapr_xive_kvm.c
> @@ -236,6 +236,8 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, in=
t srcno, Error **errp)
>      SpaprXive *xive =3D SPAPR_XIVE(xsrc->xive);
>      uint64_t state =3D 0;
> =20
> +    trace_kvm_xive_source_reset(srcno);
> +
>      assert(xive->fd !=3D -1);
> =20
>      if (xive_source_irq_is_lsi(xsrc, srcno)) {
> @@ -328,8 +330,6 @@ uint64_t kvmppc_xive_esb_rw(XiveSource *xsrc, int src=
no, uint32_t offset,
>          return xive_esb_rw(xsrc, srcno, offset, data, 1);
>      }
> =20
> -    trace_kvm_xive_source_reset(srcno);
> -
>      /*
>       * Special Load EOI handling for LSI sources. Q bit is never set
>       * and the interrupt should be re-triggered if the level is still

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2I+LkhPpzMMwf+W4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFNNQ0ACgkQbDjKyiDZ
s5KMpg/+LtKIDeCAeTmSdzWDjAnOFfiWRX2D/OrL0Jmvn6pAnv+H99WFof9upmMV
VeFOX2W5c3msqJvzevLAxGW3UdaaCvZWidf7NX5t/7AJOO8fR7W6SaAbqv0+rg6f
Q8CZHdVdCGlxe5nfpy4xt3XOZj9J7PfKtb82Z6CMuxlYpEMGk12bTnu6TRRyA0Zj
jM9ZAS7+P3QFOVHM6Xo1bSh138JVqMQHqidWUbaeX5BoLS7/3FDxriPMTs4vwTKD
nyejloHMtM0nxFvIiwFuYGSh/EJ5IOYdEnb64M1OWfRcr/JcrgWErLh6CakRLwps
ZGjlQ5BZ92q3LzMgv796+oraBDEQcMdGyYrmlSQV5XP1o8n0RupPJwDd9qiNgIgG
zc2AtH93F3xDnduqtRscR0DQg3dpHRWd9raOMvwWKHYsIV7Moio5Bv0P7LzotuxH
OGl8bRFFcTDtoU7hNngzM8alnsmEUoN4/P0wiTpTG7d3RGMmE3iMdUyeNY8QaFS3
Et24Slh4H/lo+aoCsDHuaUWf6FXkynTkcs+/YrnLRdgRQbXAe7DCAKNgdN+4ch8e
LA7MHtHlPdlcohL/+8tOm7lzJ4LvSF0Yel2uetnl4TmDSbeFt5piVumjXmysWJKt
uQFh2n7yZ/wNQzfrmGhUsh2h7uX2cAjLdVC03DiX2wjJjG1b2oM=
=i8gW
-----END PGP SIGNATURE-----

--2I+LkhPpzMMwf+W4--

