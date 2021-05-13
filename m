Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7206A37F22B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 06:27:31 +0200 (CEST)
Received: from localhost ([::1]:47394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh2wb-00007z-Uu
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 00:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sU-0007EQ-9E; Thu, 13 May 2021 00:23:14 -0400
Received: from ozlabs.org ([203.11.71.1]:36639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sQ-0004Xb-IM; Thu, 13 May 2021 00:23:13 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgdms3BkDz9ssP; Thu, 13 May 2021 14:22:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620879773;
 bh=UM4iL+rQV92nDygfuIZdmbGGHPEuWMwvJPN++JUOp3o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=onvPK1S3kUfaIKBpTW2BF+NyvKcv8s/TqOYXL0JhdPyMNYGyAY84biHL/Ljw0tAze
 PKjGzg1FQQBvXxjDxYwaYfwBCFX3hvhIilcT0KJFhqdpaTc/0gcZsM4ctsvxzOvOf/
 H8M95+2lTM6jMLNATmUd9DtENPzdjK1R5FXADJ1k=
Date: Thu, 13 May 2021 13:52:30 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 04/11] target/ppc: moved ppc_store_msr into gdbstub.c
Message-ID: <YJyifo3he0nWPQoU@yekko>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-5-bruno.larsen@eldorado.org.br>
 <cd6f164d-8c06-a261-649d-3c39384929df@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xgPD2oWmlqT/wEU7"
Content-Disposition: inline
In-Reply-To: <cd6f164d-8c06-a261-649d-3c39384929df@linaro.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: farosas@linux.ibm.com, qemu-devel@nongnu.org, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--xgPD2oWmlqT/wEU7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 12:05:04PM -0500, Richard Henderson wrote:
> On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
> > This function is used by !TCG cases, so it was moved to a common code
> > file. We chose gdbstub.c since it was the one giving us grief over it.
> >=20
> > Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> > ---
> >   target/ppc/gdbstub.c     | 7 +++++++
> >   target/ppc/misc_helper.c | 6 ------
> >   2 files changed, 7 insertions(+), 6 deletions(-)
>=20
> gdbstub.c is not the only !tcg user; e.g. machine.c.
>=20
> I think this should go in cpu.c, next to the other special register
> read/write functions.

I agree.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--xgPD2oWmlqT/wEU7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCcon4ACgkQbDjKyiDZ
s5LJaxAAniYMor5AMVLTrPlJJjhJZyakfvbU4uvCd2szN0oZk4EeJF2QP4UWNpdH
fI7W5CU2MlsBwVuGEvBDhsCIbEvZXaPYHY66sWTmxWt75HLPvQLwNqm/zPhGKkPI
QOR/QmobpfRv/JF1/SysBp/aAb+M5+ce/kxJKk9UxEfrnp5OjQDA70on9eNIdFiW
kMBPMgC4C4qXjxivAxxFp608y6gAFgvnV+LhsnO1Uvht31F8s/BkBXtZUVgZ7eh2
Oux2oxf0eA2gALmHhRn7oVvjFhxMXPkCUIvV8o4Ag32OALpxANySN0sUZN6eSR3r
sdSDHwbDhnmqlSHG5sD6vIhCA9wz2KQ5aivn2VoeVBvsaDykIG7TM2rMlMo25adx
HDTdg08JE+QLQ7S2/mu2z1wdPm/Lh/I7q2mEuXfZbFsUW6R3RKycruulaKyufws5
KlGXBBESWfgmiHnguNh6+afyYLxU7AGQB8n4E1deC247ARanr8tIn5vn4S+h0rNc
cZRp5hp1Ig/C/2eqkFfstprKdszqpTnxkx6iND2BKGPfCFg1XfvUHftWdCutnBJl
55MZ87ybbkK//ywGW7NxC0dhDcG/G7+N09oDFIVjZPco73C4i/hd+6WPvLqpiyzO
z9rOiju63XfKt5dipah6i4huXheVAHU3xaYIQrqsJZRFw1KexZY=
=aWC3
-----END PGP SIGNATURE-----

--xgPD2oWmlqT/wEU7--

