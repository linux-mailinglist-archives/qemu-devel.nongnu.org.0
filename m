Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AAA117EDC
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 05:16:27 +0100 (CET)
Received: from localhost ([::1]:50172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieWwk-0008Lg-4b
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 23:16:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59461)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ieWvQ-0007K9-2J
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 23:15:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ieWvO-0007yV-Ny
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 23:15:03 -0500
Received: from ozlabs.org ([203.11.71.1]:53069)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ieWvN-0007vP-NE; Mon, 09 Dec 2019 23:15:02 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47X6Cj4YV7z9sR8; Tue, 10 Dec 2019 15:14:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1575951297;
 bh=svulIjJ5zf0/JraVL0RtsV6/IZHWwIZFaVe9UqWzXDk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ghZw/RLpXXRBJCOvDBLj4QqrLJn7Fg04gBTtrcmNQ0g864TvZ8oEzqDwg2zkzlSU+
 aV7T5pOcu4Nd+2wHTJnHUWFLO3bmQMjHrjzLlyySSSte99qoWp59Gg9T5H4aHd3Ts4
 7ahC4tLoCdE/9hN7Bddkyg2xpr63C+HzNB8JYWHQ=
Date: Tue, 10 Dec 2019 14:51:13 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 0/7] target/ppc: Implement KVM support under TCG (final
 steps)
Message-ID: <20191210035113.GF207300@umbus.fritz.box>
References: <20191128134700.16091-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cpvLTH7QU4gwfq3S"
Content-Disposition: inline
In-Reply-To: <20191128134700.16091-1-clg@kaod.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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


--cpvLTH7QU4gwfq3S
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2019 at 02:46:53PM +0100, C=E9dric Le Goater wrote:
> Hello,
>=20
> This is a resend of Suraj's series adding KVM support to the QEMU
> PowerNV machine under TCG :
>=20
>   http://patchwork.ozlabs.org/cover/1094658/
>  =20
> I have addressed the comments and kept for later the final patch
> adding partition scoped radix tree translation. I need to educate
> myself a bit more on the topic first.

I've applied 1..4 to ppc-for-5.0, the rest I'm still trying to look at
more closely.


>=20
> Thanks,
>=20
> C.=20
>=20
> C=E9dric Le Goater (1):
>   target/ppc: add support for Hypervisor Facility Unavailable Exception
>=20
> Suraj Jitindar Singh (6):
>   target/ppc: Implement the VTB for HV access
>   target/ppc: Work [S]PURR implementation and add HV support
>   target/ppc: Add SPR ASDR
>   target/ppc: Add SPR TBU40
>   target/ppc: Add privileged message send facilities
>   target/ppc: Enforce that the root page directory size must be at least 5
>=20
>  include/hw/ppc/ppc.h            |   4 +-
>  target/ppc/cpu.h                |  11 ++++
>  target/ppc/helper.h             |   9 +++
>  hw/ppc/ppc.c                    |  46 +++++++++++---
>  linux-user/ppc/cpu_loop.c       |   5 ++
>  target/ppc/excp_helper.c        |  52 ++++++++++++++--
>  target/ppc/misc_helper.c        |  46 ++++++++++++++
>  target/ppc/mmu-radix64.c        |   3 +
>  target/ppc/timebase_helper.c    |  20 ++++++
>  target/ppc/translate.c          |  30 +++++++++
>  target/ppc/translate_init.inc.c | 105 +++++++++++++++++++++++++++-----
>  11 files changed, 297 insertions(+), 34 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cpvLTH7QU4gwfq3S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl3vFiwACgkQbDjKyiDZ
s5LRGxAAmLzxod9pPP4+abCGVArs8r5cbEKn16AjMenUbj2AVa62nL11DNerwPIa
ncalxhTGt5z8hxbXGjV4eYpR0L6ieNu7hs/RzxieiZ01Qdp3cJwjb7OtiLgT6g3T
sqzhV05GxXryC+p7Pqimsc9uETVKrpZZ57lsTODsexIZD8PylqJGX29YsGZngclY
Ci6MLbUoCHcritsRH9Oqgz43a61w8yvUZ1y9Lk5ideSnSDCjvti3HFO0/N8cwgBR
dEfZmxP+sm16P5iVqO5YyGaj+xCBmNiTycw8vX+djVw+EjLzXtyIV9/FZWaDibD3
aHCGh060N3OizY6NQlasF+xVk61/s4m2GIpx4d2ftgvejoD/5eqxL5yTInnW469B
mFWomTlUQJQVO2P3Lwwpe/ScIzyuQpP4LF3FfVN6yaAUWwf2moZl9MZkGNMXkaqA
fAzh3iCp39I3LtlZBmTE43TbSg8RsgJ4Jpnpko4EA/uT7H0oF53DFKGEILBBRsQx
kVle4Ed7UFzMwk8EGeZPpj/wYfImllF/F/lqLpNOjEbbwJGSy2TUHkESVy5K7xht
rAaVi9Vh3HbSmL69Mc2e7fdWZMQl8sBK10dScEWnrVUawgYYCma96qzbOSftfhiP
55AWleo94ZsBzG2egZYZYSzQsyUHBUSs5nQwM8ovdxb2onvrOJ4=
=L8x9
-----END PGP SIGNATURE-----

--cpvLTH7QU4gwfq3S--

