Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C64FF306AAE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 02:48:02 +0100 (CET)
Received: from localhost ([::1]:45878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4wPh-0000xA-BZ
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 20:48:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l4wO4-0007th-Nu; Wed, 27 Jan 2021 20:46:20 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:35591 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l4wO2-000598-23; Wed, 27 Jan 2021 20:46:20 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DR3GQ091kz9sVR; Thu, 28 Jan 2021 12:46:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611798366;
 bh=gnRw8oqIpX7pWG9vgrQ7LGB2wY0T2ezzYjjcZG+8I2E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mboBTTwxcEJoLVXKbjrHclkx20triH0MZ2ai7UePZFAnW2HjjGKc3BLQwb4eAD0MK
 g5u7xh7IgY7786yozgfg8JmmdQ+qtOPXjaKbNmUSRwaW2lhU26TekRiYLepywWh3DY
 nGN4dXs3NT4OCj35Pja99HQTqnaoZmENeRVjW6IA=
Date: Thu, 28 Jan 2021 11:22:31 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] target/ppc: Remove unused MMU definitions
Message-ID: <20210128002231.GA18347@yekko.fritz.box>
References: <20210127232401.3525126-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline
In-Reply-To: <20210127232401.3525126-1-f4bug@amsat.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Joe Komlodi <komlodi@xilinx.com>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2021 at 12:24:01AM +0100, Philippe Mathieu-Daud=E9 wrote:
> Remove these confusing and unused definitions.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Applied to ppc-for-6.0.

> ---
>  target/ppc/cpu.h | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 2609e4082ed..cb002102888 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2205,9 +2205,6 @@ enum {
>   * may be needed for precise access rights control and precise exception=
s.
>   */
>  enum {
> -    /* 1 bit to define user level / supervisor access */
> -    ACCESS_USER  =3D 0x00,
> -    ACCESS_SUPER =3D 0x01,
>      /* Type of instruction that generated the access */
>      ACCESS_CODE  =3D 0x10, /* Code fetch access                */
>      ACCESS_INT   =3D 0x20, /* Integer load/store access        */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmASA8UACgkQbDjKyiDZ
s5Iu1Q/+P8Mwmvl6QcyQMiwgUY+wxtIcnw2EglfMGPh2xaJM0iUhR2XAmhNy2adu
aA5GXgvC9cFZYZfUHbF0AlIpSbZG3/BP9tz6YvZyd/E5BBX2+WphvFkjdV6yin2a
tLOUBfI1eEfGks7k/eQCtGbxVKMdp6gfpSuIMvlBnV0DnzIZ0KWN3SkLNaFiFvoZ
TYXsJwVfwbhHMSWyxyzZpKcTC2wJNgcc0MpbeQBISepcGpp6TstdE91FuW/wNI20
Dy83p1WdXjQ2Z7Dxz4+cfP611tWz5JV+hUZvZENinZzkDG0UdiO2T8Ia8voqd3MS
IXvuxBny4VoAlt/OObFT6pMzm/CUqsFfMtLXzjJW4K6pwOl5hhTSHo1snDbrK2G6
m3egnRKwP+6N74kMjwIc7RYgO4DmS2ChRFOSdduisz9h1hiMfGXLC38HxZnlzFY5
KoNY0rWOs1O8vrP7n/MuIYsW0cSU4zXtyOhY6ziNi8x+DWBAFOPmOLeXos1qkYHf
fXtyWRbiTOPrnYvWOPNAQykt0ImwLW002HV8PSAulHIcuKMSGSyyb6NluzaR4ekN
IcnJJS168Mo4wE8pFwe/45OxxVJZdvVurmxcYdk/oo/0AAhTVj5t+AX3hwyLsayP
firTOF1EYTHWXPWgrSv3eSNlqYoHtG4OULys3qHkI/oEHssJ7+A=
=5RO0
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--

