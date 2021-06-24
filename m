Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E933B2563
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 05:20:37 +0200 (CEST)
Received: from localhost ([::1]:38098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwFut-0001Ec-Jm
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 23:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lwFrt-0007yV-0C; Wed, 23 Jun 2021 23:17:29 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:40295 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lwFrq-0006O5-6f; Wed, 23 Jun 2021 23:17:28 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G9QKr0zjSz9sX2; Thu, 24 Jun 2021 13:17:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1624504640;
 bh=t3OTd+dIj4e+ubUL1kWNCiBKo033tBVC635fB7duIbY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mZ1fAAhqwfFlWdHKOPGbOP2+Uz6a5PYHxO44gc6AZRKv3vKZDZCws2HN8kNa4L4lh
 dwSVO51NCsl1jcXMrgpwG9XJQll3/WeJC9bJAtNKTTaQMCGrduKoawjO+HljWiye27
 iKAcvCyRHdw7x5c5H1G0kYBlBRSbex/sQTQdXkeU=
Date: Thu, 24 Jun 2021 11:25:43 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 0/2] target/ppc: Drop
 PowerPCCPUClass::interrupts_big_endian()
Message-ID: <YNPfFyjxrF1PcrNS@yekko>
References: <20210622140926.677618-1-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NF32ghN7L4BXdYZ6"
Content-Disposition: inline
In-Reply-To: <20210622140926.677618-1-groug@kaod.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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


--NF32ghN7L4BXdYZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 22, 2021 at 04:09:24PM +0200, Greg Kurz wrote:
> Class method is overkill and cause code duplication in CPU setup function=
s.
> Switch to a more lightweight solution with a unique inline helper.

LGTM, applied to ppc-for-6.1, thanks.

>=20
> Greg Kurz (2):
>   target/ppc: Introduce ppc_interrupts_little_endian()
>   target/ppc: Drop PowerPCCPUClass::interrupts_big_endian()
>=20
>  target/ppc/cpu-qom.h     |  1 -
>  target/ppc/cpu.h         | 15 +++++++++++++++
>  target/ppc/arch_dump.c   |  8 +++-----
>  target/ppc/cpu_init.c    | 17 -----------------
>  target/ppc/excp_helper.c |  3 +--
>  5 files changed, 19 insertions(+), 25 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--NF32ghN7L4BXdYZ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDT3xUACgkQbDjKyiDZ
s5KAZhAAzO7NHdqvLegcZGBtDoKVEDpS1Z56w1ktnWKFguu0yoQCEt4JG7r2rwzD
/AGaR7NeOG0Q+8j0l1/h9iRhY6RqZSrJcxeiuz489H8SmVgZ26YXF6vbS92RwKYC
HH3bMNpmj79Q3WO59DCIUHrXHKkPBxuVTsDXLvYPcD5MeXYWg6dpSKQ4KDlv5f9p
YRsOSFx6yYrzugqLOuPEerCxsNV1Wr70cMPYDu3Eb9mIGuI5qPIxKoDDy7mXQOEa
8z2ZJDj7cHZf7qwMbkht77/eWcuLwBAwfyrL25/sUoirDSoqsRg7cezUsbn0FmBo
73iF3Sf2KxFvslSoGJD8ovai+PEex/oKeWUXO5f+MFLyZJxdunbR22S175G1pR5Z
RfLaB3mqi0+NP6gpAT7iWSIsf7SAETTtOWgbvrd1YXefXZpf9j/vSOY6FVomcTO6
YkXlf08yuTE7BSI6nNtq+WQOdwAoAnosdUlw0z8xXzyVeG7tMM7qCXJ2FKMOg7mI
mylkarVLApWDB+3803bv7igx/ydSP17ZyMjUeIhrxAd2BWDYyRxP72LH2uo4AxXd
6AixD5DgLi1+66RVi6u9lo5wKJ0yHW/OvTeOS6Se7drIoagQy9ubT/jV1v06jhLj
Z5AlwDQ3B114z7k4VSoiE/paR9hu5j7uIBwsTJ+ssGrmtvgjsqE=
=HRZJ
-----END PGP SIGNATURE-----

--NF32ghN7L4BXdYZ6--

