Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC578357A7F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 04:41:09 +0200 (CEST)
Received: from localhost ([::1]:60290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUKbU-0004Ld-R3
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 22:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lUKZy-00030o-L0; Wed, 07 Apr 2021 22:39:34 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:36165 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lUKZu-0000f1-T7; Wed, 07 Apr 2021 22:39:34 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FG57X1jMMz9sWQ; Thu,  8 Apr 2021 12:39:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617849560;
 bh=roaNAlM6UvXta6y31QrMRKaibiOhriJt9ENECUBsTPU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VCnPTXNBxabU/WfF3nkPq9mLFuUBLtzyaRixMeTjQ0CqKg0Y8Kf3ESujZ2Ss4WI8c
 cRjmbq/hyNBDK+64x9TiNKPbuEF4m6Hrvqd2PMbcBLdzxr3jmzbp2PNa11GIRv0fxa
 Pi8TQhgQb75Vyw82uFP6M30Dv3lEdrjO1wEs5RaY=
Date: Thu, 8 Apr 2021 12:39:14 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [for-6.0 PATCH 0/3] ppc: e500: Bump ppce500 u-boot to v2021.04
Message-ID: <YG5s0nGaArqTicXD@yekko.fritz.box>
References: <20210406081513.1013372-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xhWJQHBkOW9hN6hG"
Content-Disposition: inline
In-Reply-To: <20210406081513.1013372-1-bmeng.cn@gmail.com>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--xhWJQHBkOW9hN6hG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2021 at 04:15:10PM +0800, Bin Meng wrote:
> This series bumps the u-boot.e500 to v2021.04, which fixed a long
> overdue broken pci issue caused by QEMU changes since Nov 2014.
>=20
> While we are here, add a reST documentation for the ppce500 machine.
>=20
> Please pull the full contents (binary) from https://github.com/lbmeng/qem=
u/
> ppc branch.

This is much to late to go into ppc-for-6.0, but I'm happy to queue it
for 6.1.  However, I'm not sure which branch from your site I need to
pull in.

>=20
>=20
> Bin Meng (3):
>   roms/Makefile: Update ppce500 u-boot build directory name
>   roms/u-boot: Bump ppce500 u-boot to v2021.04 to fix broken pci support
>   docs/system: ppc: Add documentation for ppce500 machine
>=20
>  docs/system/ppc/ppce500.rst | 156 ++++++++++++++++++++++++++++++++++++
>  docs/system/target-ppc.rst  |   1 +
>  pc-bios/u-boot.e500         | Bin 349148 -> 406920 bytes
>  roms/Makefile               |   8 +-
>  roms/u-boot                 |   2 +-
>  5 files changed, 162 insertions(+), 5 deletions(-)
>  create mode 100644 docs/system/ppc/ppce500.rst
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--xhWJQHBkOW9hN6hG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBubNEACgkQbDjKyiDZ
s5LJbhAA1iGpLZJPWd4RfHyrxXTPb6P/Vnl45l3flFY+bHvrNxKiM2NActvBKNOG
SRP3Otou0Pzg6qiVJV4LOmMTPXYPUIdj/WiQGMI0vNoKpd+/rFzTmo75BtW0vwcV
fGFQPHTKLKK/A2hqQvQln58O5NBZ5K0yOB3aGkuEExXzPOpxvZj0FYddsn8Jiath
Xf8UihprY0sK1Aj4rVgfThQs+sGst8phmUxvx/g8uUU7wRtJvF2/VSlNB9chYABn
Tm0cvouMrpyVp9zppMrUwmrFOIZeCGzisomBH6gR3k1KVVDW8Q/aSCseXDw2zux9
QynBq22h2Z6AOkvSUcAhWQWCjDyM1kGuW+uDBVgJRi3cQjy8f/jO91MWgIhtOk1V
ewcbaFzRml4wVvVkAZadngwyVWIVOjkV/FWU7kivPQVcQo2nyM9II5UOHVacjILQ
QYLHExtggHKnWMRu2tVefdhQ8ZnUdiCnGm3Ptw7k6NKbri+1FNKnEgXdI0wgb1Ka
hVFfgTPskgRXtR5m1W2XKw3YYxGDPY+8/dv3TJcZAI04fQaqUw9IvXGfMmWDEV69
GhH2UnzvpV9KlMvLq9b06KEf+QDXcg4ukvctC1WTlPpdydVJtYQIkU2iP+qWtZ1D
WU8Pw67IMQIwdTCt+Lg9NhkBshs6vzjkgcjLxKILClKqHm3Oqz4=
=AINO
-----END PGP SIGNATURE-----

--xhWJQHBkOW9hN6hG--

