Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B171036BDD0
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 05:42:31 +0200 (CEST)
Received: from localhost ([::1]:37016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbEcI-0006yE-MZ
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 23:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbEZI-00055b-UR; Mon, 26 Apr 2021 23:39:24 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:60103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbEZF-0005SC-2r; Mon, 26 Apr 2021 23:39:24 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FTnYw1Qh0z9sXG; Tue, 27 Apr 2021 13:39:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1619494756;
 bh=QtZVxvb9EClUzkzRqeQoNm5/eG8yJU+fPr4QBi/AD8U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZbjtFpYAXpWuQ3mARJbOUi62HvLZQmzZLeteIsk6m1ihPjLJ+6aZMsxO7MJSh5PM2
 0r0iE4O+pwvALf68jsGAAeUK8Lan15k7bg2ZvilZ8uVHSDMjjilb/7yYAQj3EDveCn
 hYJR8PsHBlaRwRkYtBY7zM+e+CPN7Ikfka/BAUsc=
Date: Tue, 27 Apr 2021 13:16:38 +1000
From: "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Subject: Re: [RFC PATCH 1/4] target/ppc: move opcode table logic to translate.c
Message-ID: <YIeCFk+yuLZbuTd2@yekko.fritz.box>
References: <20210423191807.77963-1-bruno.larsen@eldorado.org.br>
 <20210423191807.77963-2-bruno.larsen@eldorado.org.br>
 <87pmyg3lis.fsf@linux.ibm.com>
 <CP2PR80MB44994743B9245C417246FBDAC7429@CP2PR80MB4499.lamprd80.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9ca8z2C9FfvzSDYw"
Content-Disposition: inline
In-Reply-To: <CP2PR80MB44994743B9245C417246FBDAC7429@CP2PR80MB4499.lamprd80.prod.outlook.com>
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9ca8z2C9FfvzSDYw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 26, 2021 at 07:29:54PM +0000, Bruno Piazera Larsen wrote:
> > > code motion to remove opcode callback table from
> > > translate_init.c.inc to translate.c in preparation
> > > to remove #include <translate_init.c.inc> from
> > > translate.c
> >
> > I'd mention the creation of destroy_ppc_opcodes since this patch is not
> > strictly just moving code.
>=20
> Sure, will do for v2.
>=20
> > > +#if defined(PPC_DUMP_CPU)
> >
> > The commented out define for this was left behind.
>=20
> Good catch! The define is going to still be used by a couple of things in=
 cpu_init, though.
> I'm guessing moving to internal.h is the best solution, but correct
> me if I'm wrong

Generally LGTM, excepting the things Fabiano pointed out.

>=20
>=20
> Bruno Piazera Larsen
>=20
> Instituto de Pesquisas ELDORADO<http://clickemailmkt.eldorado.org.br/ls/c=
lick?upn=3DUPoxpeIcHnAcbUZyo7TTaswyiVb1TXP3jEbQqiiJKKGsxOn8hBEs5ZsMLQfXkKuK=
XZ7MVDg0ij9eG8HV4TXI75dBzDiNGLxQ8Xx5PzCVNt6TpGrzBbU-2Biu0o69X5ce-2FW-2FOk1u=
UipuK0fZnWXJEgbRw-3D-3DJY4T_wWk-2BG6VvNBoa1YzxYjhCdFS9IfANIaBzDSklR1NyyrKOI=
1wj0P-2BdBFcuO4FnHcsA1MyHu0ly1Yt3oDMp7KKdJPM68iKuI2jiRH5v4B0d8wf3chU3qy5n5i=
XWnW1QjSaNFHOgELzxaP-2FnesTeBgJ5dFkjH4f279sVQpOtyjw5xAqj34M6pgNRAxVvuXif4IW=
DcVzXg1FzfYlEfkKzr9vvpA3Hg8kitwMtlU3zwbQUBCgL30fQoJPcRPMGKyOY8RmoAlXNqTJYDY=
IvqmfnI7KLUvw6vKB5R-2B5q1FJRAzX7H-2BmF0NnDET6jMLuIqtCcVIch>
>=20
> Departamento Computa=E7=E3o Embarcada
>=20
> Analista de Software Trainee
>=20
> Aviso Legal - Disclaimer<https://www.eldorado.org.br/disclaimer.html>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9ca8z2C9FfvzSDYw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCHghQACgkQbDjKyiDZ
s5J8kw//a6O6qzyRJylIBQZhGmQu9ObfwYx9d9HmU6p7O4iGoZWyjCqCmS5Tv9Oa
N/TWgyQMllNvBqOk8JiaP7nQphGFfr4GPxxKIHOeXM3cXL21d+flk4hGLWMNW+b0
3kKhM0+1Rh5A07XwDMTXZLOdDW4FVtSAr0OEWc9XNRQusuxst59wB9h2Eq9xkZQo
U4fbDtpz2u16g9nkbTSA5DS/bAWNwAm8K/9bLkYHw+p6/ox5eYqL6bN3E3OIazTL
Jq6AJURqT1FgWQ13PakgsLndYpEfdhstOAOHAmzQ0lPFtMV7tkuVXTeu+/FXiOpb
+fpGzwbJlyLqWcQBAMqKO8O6LfwCCdgKfs7Pk7wfdYCHPgasfNkVKJan45QcG76A
CKnUnQerUy6sGLSvt1FsFfzuQBKdHi0hyNXixSw6HgNkNUgoWPKg9RL6TvR16vk+
e5lrJPhRy+hRhS9rXHqj00WBlKWKNJ79WVDWaTjP1JYNDplgihYJApaY4eT1kx5T
+9fdxQVCStEY1BtTNg7bB8cyYsio4n3u4FzG19lIjxvLxzb2Vu6KxeERqNofI8g2
qRcJE4/x6fJVPPc8ZJCaMnf1BOlgQK/iJMfUezN8eD7oNE6nNVCPxe55Uy0WSAy4
kgfXkI0KFKyAMrD49QmO56tQTb9BKBiH5Mx4iV92O843RNF9Iww=
=+mUx
-----END PGP SIGNATURE-----

--9ca8z2C9FfvzSDYw--

