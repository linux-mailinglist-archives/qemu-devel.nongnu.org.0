Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D07214B90
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jul 2020 11:32:50 +0200 (CEST)
Received: from localhost ([::1]:46216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1js10z-0002cz-Km
	for lists+qemu-devel@lfdr.de; Sun, 05 Jul 2020 05:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1js0zJ-0000EK-9x; Sun, 05 Jul 2020 05:31:05 -0400
Received: from ozlabs.org ([203.11.71.1]:52959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1js0zF-0007XL-Iz; Sun, 05 Jul 2020 05:31:05 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4B03NJ4zt4z9sSd; Sun,  5 Jul 2020 19:30:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1593941456;
 bh=U1jUIOL/ulOx1HUx5XSN2/rIujWu6Dk+mLs2i8ZPQO8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KtU0axebzmeskEkqjuoT0EcXzIAfB2By8g/a+v2BLP/Hcs9iqIkgF1lzcnbzOPaI6
 zMq9vCVhIrjBpTew7b5jGBERdb6dgOEWgPi+rxqSHK0OGnGEUJZMUrxhd/MjRdiTMp
 bQD7+mEXYwMrjaYgVlC5bibJDO/OkkIzbpeFP3QA=
Date: Sun, 5 Jul 2020 19:10:46 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Lijun Pan <ljp@linux.ibm.com>
Subject: Re: [PATCH v4 00/11] Add several Power ISA 3.1 32/64-bit vector
 instructions
Message-ID: <20200705091046.GE12576@umbus.fritz.box>
References: <20200701234344.91843-1-ljp@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0QFb0wBpEddLcDHQ"
Content-Disposition: inline
In-Reply-To: <20200701234344.91843-1-ljp@linux.ibm.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/05 03:31:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0QFb0wBpEddLcDHQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2020 at 06:43:35PM -0500, Lijun Pan wrote:
> This patch series add several newly introduced 32/64-bit vector
> instructions in Power ISA 3.1. Power ISA 3.1 flag is introduced in
> this version. In v4 version, coding style issues are fixed, community
> reviews/suggestions are taken into consideration.

So, is the ISA 3.1 document available somewhere?

>=20
> Lijun Pan (11):
>   target/ppc: Introduce Power ISA 3.1 flag
>   target/ppc: Enable Power ISA 3.1
>   target/ppc: add byte-reverse br[dwh] instructions
>   target/ppc: convert vmuluwm to tcg_gen_gvec_mul
>   target/ppc: add vmulld instruction
>   Update PowerPC AT_HWCAP2 definition
>   target/ppc: add vmulld to INDEX_op_mul_vec case
>   target/ppc: add vmulh{su}w instructions
>   fix the prototype of muls64/mulu64
>   target/ppc: add vmulh{su}d instructions
>   target/ppc: add vdiv{su}{wd} vmod{su}{wd} instructions
>=20
>  include/elf.h                       |  1 +
>  include/qemu/host-utils.h           |  4 +-
>  target/ppc/cpu.h                    |  4 +-
>  target/ppc/helper.h                 | 13 ++++-
>  target/ppc/int_helper.c             | 75 ++++++++++++++++++++++++-----
>  target/ppc/translate.c              | 43 +++++++++++++++++
>  target/ppc/translate/vmx-impl.inc.c | 26 +++++++++-
>  target/ppc/translate/vmx-ops.inc.c  | 27 +++++++++--
>  target/ppc/translate_init.inc.c     |  2 +-
>  tcg/ppc/tcg-target.h                |  2 +
>  tcg/ppc/tcg-target.inc.c            | 12 ++++-
>  11 files changed, 184 insertions(+), 25 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0QFb0wBpEddLcDHQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8BmRYACgkQbDjKyiDZ
s5JeEg//aACdRIl8cxByrbxxcyp3CABZCSFAu9P8T2vmE9WxuuZHVkEOh4wSKTvu
j/IC4hLJkuXOSwMQokIKV7LeLFvfzbkIKxc3QRATvZtjcut6bz+cLkSkSUEdvcOK
Dn9dA+1n10reRlDa6jIq570+t/e5cl7fytxhyy98Vacn/j75wslyQbhO0fLrWCr4
YMY+NzBk6oXX2ufuqUBQ15Fd59JCE6nqeMGmgaoXRtViJUNiQ8GjV2ta61Fug4K4
8t5xrpK0x0y+qxInsdzrmVO0ksReRSFPwiJofh+nkZVTLUgtMGuWfltlDd87Rg7c
DEo8RW5wb7iuFdi3gTILJD7wPA8WjgIkM423CX8SYYQhKJO6ap9vYyUozKHybTcJ
DHSJ9IAvN1oAu8GGKMhPeAAiWX+wcEVwaRT6akm9ZhmRa51HgBcXb3dm7UBorMZ7
GGhsodRwtugvqM8IxbvmEtcQHx7qIXQhQGIylmV+8HCCstKrO2PgvVQWV0e7JVk2
9ZZLFDh0UoR5GxZE7+hBViddcZX/xnzr3+JYyKuDLDP8m6eTz1eXPkNSIAz31d9v
qMNJoP42ny6sHxG94DrK85Hf//M1Zj1BtWRHNWMhpq2115vPdS36BjpPuhTFWzQ0
SK4tkkd/9tzbl9fOcuhUAlgVFqA4NLn4fCXYnRtN06MW2xSzS74=
=KvxG
-----END PGP SIGNATURE-----

--0QFb0wBpEddLcDHQ--

