Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70246347309
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 08:54:51 +0100 (CET)
Received: from localhost ([::1]:47678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOyLq-0002zV-Gx
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 03:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOyKv-0002UW-9v; Wed, 24 Mar 2021 03:53:53 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33201 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOyKt-0000ob-7u; Wed, 24 Mar 2021 03:53:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F50q60RmMz9sTD; Wed, 24 Mar 2021 18:53:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616572418;
 bh=SJUQadghU58/pAY6ewOUNdzuept7qdqbWArTYBJ7/Wc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=grLZtKH+e/x0+oqdcFUsOCAQdqmtOlq+yBmGJ7hdgD2uaV3C3bAIs+LmXQPOSazUA
 F8GY8hT+ZEi3K+3eG13r4p3UcAFLYwX8alhmKDKRvLlfDZl8G8TJBGNVurpnci7oIT
 OjQ4AVPYPczuJC9naJxIDyLj66p3OhCls2h5y+mE=
Date: Wed, 24 Mar 2021 17:15:31 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu] spapr: Fix typo in the patb_entry comment
Message-ID: <YFrZAzj3pfUU8SmW@yekko.fritz.box>
References: <20210225032335.64245-1-aik@ozlabs.ru>
 <YFgu2NpQ7Wr75GOX@yekko.fritz.box>
 <7cb026d4-2df9-9d16-60d9-b6565a71b628@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vkZDol1Y1r//t24p"
Content-Disposition: inline
In-Reply-To: <7cb026d4-2df9-9d16-60d9-b6565a71b628@ozlabs.ru>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--vkZDol1Y1r//t24p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 03:30:57PM +1100, Alexey Kardashevskiy wrote:
>=20
>=20
> On 22/03/2021 16:44, David Gibson wrote:
> > On Thu, Feb 25, 2021 at 02:23:35PM +1100, Alexey Kardashevskiy wrote:
> > > There is no H_REGISTER_PROCESS_TABLE, it is H_REGISTER_PROC_TBL handl=
er
> > > for which is still called h_register_process_table() though.
> > >=20
> > > Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> >=20
> > Applied to ppc-for-6.0.
> >=20
> > In future, best to CC me directly, since I only occasionally peruse
> > the lists.
>=20
>=20
>=20
> even the qemu-ppc@nongnu.org list? okay :)

Yes.  I do try to read qemu-ppc@nongnu.org weekly, but it's still easy
for me to miss things.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vkZDol1Y1r//t24p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBa2QIACgkQbDjKyiDZ
s5JKHA/8DfDiL3hCRWePPRZZCYbYXbAO7Q1nMXec+JYYJn/uxoIWMoRkReSjtv91
DZ2pIYSDgMbElYlK2I6+kGJTpo23muF27FhEt+Tw+zE4NlT6QZb7MadxIQ9ahp9b
RfGBnzYBsnej5px72U2C9ennEWgbUDs3J4GPC36bFiQxz4s0c6VSz9KYRXsQHeGd
G+bgeqgN8IGTm7Cy7PLN8Rm+KvEUj/crbbrOgv/6dYzXw5+JT0URsEq4tpQ+fVrL
4YrKa7VhA2YJO8xo4mIW2mQXKD1wUSdJiHv/HClKecBSNg8nrqRdes0keTALGCbF
9JlFnYXAoc69nPIKKRRW/aVQs0MDi9WQqoR0IRVhlB4VTrtwa7jSWT3OwcN8qbXp
unlheoFTQMq+G16GpMprNZgoD/kGnmn/VxwRBPa9IID466YtaYBelSACTwcgixuX
mm+jFa2i0sp6vTqtD0IlxwwR71Xzhu+XF3EQPFXSRjAq9ULeAmVR6bzDLLROwOj4
69XkykdjZH3sa3Iu795jURA7vZfX4c6CrSyGIo7ZXSgIZvytaNZzZ6eNJKgnB6Tb
Mh06/aZzZzkiYKiuhNjf+y55RfFs+dV3w+7eXj1dCeH7cd54pp/UG1KDh04QdNL/
cdq/Or1SQAC1ZTEP/dTb8h/WptI4EM9uMN2PSb/MpC9E9Di11b0=
=pseQ
-----END PGP SIGNATURE-----

--vkZDol1Y1r//t24p--

