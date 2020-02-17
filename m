Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8145161D93
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 23:48:44 +0100 (CET)
Received: from localhost ([::1]:54036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3pBz-0002Yr-Mz
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 17:48:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55094)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j3pAL-0000hd-Dy
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 17:47:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j3pAK-0005go-04
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 17:47:00 -0500
Received: from ozlabs.org ([203.11.71.1]:58521)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j3pAI-0005eY-1r; Mon, 17 Feb 2020 17:46:59 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48Lzcs6M5zz9sRY; Tue, 18 Feb 2020 09:46:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1581979613;
 bh=KiG+/iKVF0yJMA0tFEGpp0Qj1iriH5YkmU3y0GBUpVA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xh15Kt+YfS+ruZUODB+GYbFpDpyCH9dabzjIPcx/xR5FDtYzQw+V89p6BRc56BFB7
 4lc/s5c9vX9Wv3y8BD0Ljd5BiQfAxl9ceQZiTLvgSBFbtaTjLH8M8Bkqjnl87xwmkB
 3cXPYUvWzoB1LUZRLJrnkWvnltifRLUsYCKfhZhw=
Date: Tue, 18 Feb 2020 09:46:47 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
Message-ID: <20200217224647.GA26464@umbus.fritz.box>
References: <20200217021217.95766-1-aik@ozlabs.ru>
 <60c5712e-beb7-e536-1252-642dcf88beec@redhat.com>
 <0beab4e0-da3d-48fb-062a-de7a6c244c3f@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <0beab4e0-da3d-48fb-062a-de7a6c244c3f@redhat.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2020 at 11:24:11AM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 2/17/20 10:26 AM, Philippe Mathieu-Daud=E9 wrote:
> > Hi Alexey,
> >=20
> > On 2/17/20 3:12 AM, Alexey Kardashevskiy wrote:
> > > The following changes since commit
> > > 05943fb4ca41f626078014c0327781815c6584c5:
> > >=20
> > > =A0=A0 ppc: free 'fdt' after reset the machine (2020-02-17 11:27:23 +=
1100)
> > >=20
> > > are available in the Git repository at:
> > >=20
> > > =A0=A0 git@github.com:aik/qemu.git tags/qemu-slof-20200217
> > >=20
> > > for you to fetch changes up to ea9a03e5aa023c5391bab5259898475d0298aa=
c2:
> > >=20
> > > =A0=A0 pseries: Update SLOF firmware image (2020-02-17 13:08:59 +1100)
> > >=20
> > > ----------------------------------------------------------------
> > > Alexey Kardashevskiy (1):
> > > =A0=A0=A0=A0=A0=A0 pseries: Update SLOF firmware image
> > >=20
> > > =A0 pc-bios/README=A0=A0 |=A0=A0 2 +-
> > > =A0 pc-bios/slof.bin | Bin 931032 -> 968560 bytes
> > > =A0 roms/SLOF=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 2 +-
> > > =A0 3 files changed, 2 insertions(+), 2 deletions(-)
> >=20
> > I only received the cover, not the patch, have you posted it?
>=20
> OK I see the SLOF binary is almost 1MB. Maybe this got blocked by spam
> filter. FYI you can use 'git-format-patch --no-binary' to emit the patch
> with the commit description but without the content.

Generally Alexey sends SLOF updates to me just as pull requests
without patches in full, because a huge slab of base64 encoded
firmware isn't particularly illuminating.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5LF9YACgkQbDjKyiDZ
s5IzkBAAqWY6cRrap+/kPsb4TXJKHAkMRJcB6r6MXYUIZifymZKugZD2mjIGlh8k
WnKJePhshVd8ItMx4hLF4ULIPh1xMKTwlvHQ7EIEj1b5zAQXxbBO4godxvtg3Xow
2CFUHetPOriAd2AIma3O84dAAbE2vNYNmFnTCpSiaC/dO1/8HZaI/erQtTHfvMZx
YcAO+47SE5cjYrxeYhAe7a7wcEyEbCjit3heZVZ5T5JxzKnDOdMSK3cV+edH/q2z
NwYTuckFjuK3SQii0xR3jdcHomPLvC5IJyH8n7/rb8wVOw6/Lt3jMyiIeFd9E56z
w2h6ECwwgO39kWcqk+UtFZdldalnn5U9Kmi87s4fc/wb+/ppwmHDIU9LdqpNNquz
IWBM9GLpJcrQB0Ne2e5eSBaLDSrT/euE8phZgsN2nxW2VC2npcFyyXWqBt2UGd4Z
NFb6XeuVR72GFgAg8gFhn2T40d6TLKsehta4OXANXfrVaSQejO0PZ6dzPiyqGdZc
fx8I8rQd1+zmCHeDB3RZHhyIWNwy6sd3Pa6BgvgZKjpJOqNODe/BUH6oCVfUZekA
EhLo6VuygHu/9V7oNfhVnUdLQDBZtjWlGA4B4ad1v5LwyMxUlsf7Al47uZTWEor0
JRq3XUgrhKUCYeizfDiOGWoqAM3fSaVwoGzwae+V1JyjjjesmCE=
=PonZ
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--

