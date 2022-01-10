Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073CD488F0D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 04:51:49 +0100 (CET)
Received: from localhost ([::1]:43788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6lim-0007Qh-1Z
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 22:51:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n6lcb-0000Kk-9H; Sun, 09 Jan 2022 22:45:26 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:60215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n6lcY-0006nS-5K; Sun, 09 Jan 2022 22:45:25 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JXKTm3lQqz4xdl; Mon, 10 Jan 2022 14:45:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1641786316;
 bh=s87sqfnjvr/yQF3pXFNXhXv0sNp6ErrpMgxS3Q/TpzY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iWwoG958JK/jnT6WSPP4sICkzwcG0fDRoNauIo3yKsunXrvnqHIQSHyVqLtqLluJA
 B7hOIy6DB6ai790uExonk1UIw4J9LqD8ZEQ0qgG81BwybK5V98q7nlhAx9WPBw6Krh
 CJwHOW12lrTNTKFL6GkQ5IV6H9sR7Kj6rFyy3Lpw=
Date: Mon, 10 Jan 2022 14:10:20 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu] spapr: Force 32bit when resetting a core
Message-ID: <YdujnLX5eXaKmHtf@yekko>
References: <20220107072423.2278113-1-aik@ozlabs.ru>
 <20220107125747.7ddfd3a0@bahia> <Ydgvt0VwFUP0MD5h@yekko>
 <20220107143910.4443af02@bahia>
 <4bad4da5-44b6-717c-7770-609ddd5256f0@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="v16EyhJ19vWs6iJQ"
Content-Disposition: inline
In-Reply-To: <4bad4da5-44b6-717c-7770-609ddd5256f0@ozlabs.ru>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--v16EyhJ19vWs6iJQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2022 at 01:52:06PM +1100, Alexey Kardashevskiy wrote:
>=20
>=20
> On 08/01/2022 00:39, Greg Kurz wrote:
> > On Fri, 7 Jan 2022 23:19:03 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >=20
> > > On Fri, Jan 07, 2022 at 12:57:47PM +0100, Greg Kurz wrote:
> > > > On Fri, 7 Jan 2022 18:24:23 +1100
> > > > Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> > > >=20
> > > > > "PowerPC Processor binding to IEEE 1275" says in
> > > > > "8.2.1. Initial Register Values" that the initial state is define=
d as
> > > > > 32bit so do it for both SLOF and VOF.
> > > > >=20
> > > > > This should not cause behavioral change as SLOF switches to 64bit=
 very
> > > > > early anyway.
> > > >=20
> > > > Only one CPU goes through SLOF. What about the other ones, including
> > > > hot plugged CPUs ?
> > >=20
> > > Those will be started by the start-cpu RTAS call which has its own
> > > semantics.
> > >=20
> >=20
> > Ah indeed, there's code in linux/arch/powerpc/kernel/head_64.S to switch
> > secondaries to 64bit... but then, as noted by Cedric, ppc_cpu_reset(),
> > which is called earlier sets MSR_SF but the changelog of commit 8b9f211=
8ca40
> > doesn't provide much details on the motivation. Any idea ?
>=20
> https://patchwork.kernel.org/project/qemu-devel/patch/1458121432-2855-1-g=
it-send-email-lvivier@redhat.com/
>=20
> this is probably it:
>=20
> =3D=3D=3D
> Reset is properly defined as an exception (0x100). For exceptions, the
> 970MP user manual for example says:
>=20
> 4.5 Exception Definitions
> When an exception/interrupt is taken, all bits in the MSR are set to
> =E2=80=980=E2=80=99, with the following exceptions:
> =E2=80=A2 Exceptions always set MSR[SF] to =E2=80=981=E2=80=99.
> =3D=3D=3D
>=20
> but it looks like the above is about emulation bare metal 970 rather than
> pseries VCPU so that quote does not apply to spapr.

PAPR is rather confusing on the topic (looking at PAPR+ 2.10).
Initially it says:

"When a processor thread exits the RTAS stopped state, it must begin
execution in real mode, with the MSR in the same state as from a
system reset interrupt (except for the MSRHV bit which is on if not
running under a hypervisor and off if running under a hypervisor)"

But further down it has a table of how all the MSR bits are supposed
to be set by start-cpu, and it looks like that might not match the
0x100 conditions in some cases.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--v16EyhJ19vWs6iJQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHbo5oACgkQbDjKyiDZ
s5KAyw//XMtQykd30voVY46jnt2ZgZyrgfjBA0kuncybSEAQJy2ssS6E9uv+aT/r
P6x8DZNTV7Dds/vo7afXf8+DLNW8bAwrxkSRH6HQpeUtZTQdWl31/iEFQyCw6+yw
2mQf2lViZkzYO7vDGmP1hXkLWulo9ZkKBsTGBuG4H58cODTxInuU8dh+YDsI5m6v
KN146Fofv6dDSdpWY1MV5aJQz/ZhXJxFhknqmQc+/ZMOEF2hRJZnwQvIskwiYkAl
YsHYFUaKAUYYD37b4Mtp+pYYPrWsj7yCy8Aydb2qg9pEjViKyRQVoCoYWmB0sVLn
WnmR55I6g9Rrh7h+34afWMsoYSAHohAOoCuL1PSeais5+bN74WTu9Yh1iu/mom/X
8B1D7O4amnVwwBP/iA6HqmakruulZSV1mPJOse+TB1PWC5vNsY/s4MGgXxSHaXFR
8HfhJacRrHKWPpAuVCHKnrQBZQ9s5o49yYNfPn6Rd2owqOf45lFKfrBuObAOeRZa
SGv09Ir6o/1h91cBqJXzQiTR7ENUQVGW8FIKcPsNuE5bOuTYXuHdyaxxEruPpjdL
FrWrXe9tANguiVkPdcRKpLHxA+wtQG+dY5twD+pTAfBGrCvlyz6bA53CAImYtOGo
WRR8X+/DYED4IDApcSpe3G7D54eCPktCaDMzHD81OX2PHY4h11o=
=yzEE
-----END PGP SIGNATURE-----

--v16EyhJ19vWs6iJQ--

