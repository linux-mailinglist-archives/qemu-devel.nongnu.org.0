Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5533984AA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 10:55:24 +0200 (CEST)
Received: from localhost ([::1]:42992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loMep-0003QM-Ff
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 04:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loMde-0001Ho-T9; Wed, 02 Jun 2021 04:54:10 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:58051 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loMdb-0003mr-HV; Wed, 02 Jun 2021 04:54:10 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fw2rV0Jgsz9sSs; Wed,  2 Jun 2021 18:54:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622624042;
 bh=l6YlGYWip1Uauv6VeigL4QqyGN5uvhwKrLzPmnYLRmc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ep9rvypJ+RMuafokVi3WPeuzyDkPknh3qxWRCKfx2nOPWCjN6r+0cjSXo2LSAgOvJ
 YWreUWoSuvjKhLCLf2CxAKveAiNzUHZTzXcR3CPTD88f1HbWNXw+ira1WpxBCdysY+
 SMEg6+mWFW55QES9dr8AKDiUe9aNWhd/QKPt6Bbk=
Date: Wed, 2 Jun 2021 18:51:49 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v6 12/14] target/ppc: Implement vcfuged instruction
Message-ID: <YLdGpTl64YUNslN9@yekko>
References: <20210601193528.2533031-1-matheus.ferst@eldorado.org.br>
 <20210601193528.2533031-13-matheus.ferst@eldorado.org.br>
 <65c93c35-b956-1ce2-76ff-e72c3c989f71@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VjvkRTb1IEzClgLQ"
Content-Disposition: inline
In-Reply-To: <65c93c35-b956-1ce2-76ff-e72c3c989f71@linaro.org>
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
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, luis.pires@eldorado.org.br,
 qemu-ppc@nongnu.org, lagarcia@br.ibm.com, matheus.ferst@eldorado.org.br,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VjvkRTb1IEzClgLQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 02:09:22PM -0700, Richard Henderson wrote:
> On 6/1/21 12:35 PM, matheus.ferst@eldorado.org.br wrote:
> > +++ b/target/ppc/translate/vector-impl.c.inc
> > @@ -0,0 +1,56 @@
> > +/*
> > + * Power ISA decode for Vector Facility instructions
> > + *
> > + * Copyright (c) 2021 Instituto de Pesquisas Eldorado (eldorado.org.br)
> > + *
> > + * This library is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU Lesser General Public
> > + * License as published by the Free Software Foundation; either
> > + * version 2.1 of the License, or (at your option) any later version.
> > + *
> > + * This library is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > + * Lesser General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU Lesser General Public
> > + * License along with this library; if not, see <http://www.gnu.org/li=
censes/>.
> > + */
> > +
> > +#define REQUIRE_ALTIVEC(CTX) \
> > +    do {                                                \
> > +        if (unlikely(!(CTX)->altivec_enabled)) {        \
> > +            gen_exception((CTX), POWERPC_EXCP_VPU);     \
> > +            return true;                                \
> > +        }                                               \
> > +    } while (0)
>=20
> I think it would be better to name this REQUIRE_VECTOR, to match the
> Vector_Unavailable() pseudo-code in the current manual.
>=20
> Also, I think you should place this in translate.c, because you will also
> need this for VSX.

I think those can reasonably be followup changes.

>=20
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>=20
>=20
> r~
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VjvkRTb1IEzClgLQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC3RqEACgkQbDjKyiDZ
s5LZJRAAhtmDyfmlW1XgZs52hbF8cd/7IgNz2oODxLsQsgPuu3jMLTmLLcXcQmoS
3GdOQJWTS+5Ux6NgICcQKnmdTUK3t0MWM9nYWEkT3JjfWVJkKPssAXWOQd/SVbO4
Cq5ArxILdLJJ6LQ4sXF5JdKgnNwBf76QLiJHH/szoX1TcFPhTktJpOsRsjbyiiF2
vyXyaCs4POPlhpCQRHUYgsA/kU82tag/rQ6Kf4TxKPCQeCrL6HksN1QyZjCnUJU3
dAwztdRYy2fDoz1PurhzrZiAA6RJb8Lyi+HR6/s0S5gpHCvYhreqhQv4/GgJP5E0
NUi0Q/5T0kfiyqt3QY6GfioxjDoQ+RyKXW5ZE7RuSliX02ZhfzVgGLWXwGvHPXFN
2/Zot2n2PK0VNRyXT+w6N13UkKRznUBDIJmCiN3vlAfo0pklGsBmiMbTLlddqYXN
kJTGtU9XQgxBXhyw5KBJ/k3maf3zyMdnLSGxWs6JzrEXw79M/HQjPpxMTtPd2CtB
vX+pbulLCyoE76nnrT1mqv98FxvO1GLuthaNLS3/gj0NoJJYAljfcq0WzZszPoDs
h0A4pnodCaSWeGMeqYlN1wcgZndjpnMF8ioevawiHViaA4xZrJ7Xaw51MPuW2MlW
FOLqWEP7I+ZHfhJGE84x6UXzlWWWuDjSFrD6ahWYTDju/6Y1yk4=
=pt+m
-----END PGP SIGNATURE-----

--VjvkRTb1IEzClgLQ--

