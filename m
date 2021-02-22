Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAE43210B7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 07:09:08 +0100 (CET)
Received: from localhost ([::1]:36988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE4P5-0001Dn-Hv
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 01:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lE4Nd-0008I3-85; Mon, 22 Feb 2021 01:07:37 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:46335 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lE4Nb-0000py-9D; Mon, 22 Feb 2021 01:07:37 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DkWtV6vfRz9sVR; Mon, 22 Feb 2021 17:07:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1613974050;
 bh=sg4thDTQBv3u4oxWjv7h2R9cfBOgBkNdeNTQJmM85xM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=COCLbqJoEB0ZG5Mlil8BaJncKzFRhjo//jKWgQJRiqePTt3QR1uVSt3lnW37V9YFl
 gxgSk7OFsqxFGk3DM9G6tfXIIg9txu0n6z1aHmOKZ42QAhuu83nk0/HdrzC6Z2pCra
 IdueErxOYu8/UMQm4YqOePwls4eb9XQ6IaM/TWNQ=
Date: Mon, 22 Feb 2021 17:07:25 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
Message-ID: <YDNKHWTr9xgwThTA@yekko.fritz.box>
References: <20210219041333.74096-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sRm3iq8mknMWjMJw"
Content-Disposition: inline
In-Reply-To: <20210219041333.74096-1-aik@ozlabs.ru>
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


--sRm3iq8mknMWjMJw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021 at 03:13:33PM +1100, Alexey Kardashevskiy wrote:
> The following changes since commit ef450767d7d162dec67ec4674f85f9044a3d80=
cc:
>=20
>   spapr_drc.c: do not call spapr_drc_detach() in drc_isolate_logical() (2=
021-02-17 11:50:21 +1100)
>=20
> are available in the Git repository at:
>=20
>   git@github.com:aik/qemu.git tags/qemu-slof-20210217
>=20
> for you to fetch changes up to 7745df3b2bc512e71badb52f8f07452260ad7409:
>=20
>   pseries: Update SLOF firmware image (2021-02-19 14:56:39 +1100)

Merged into ppc-for-6.0, thanks.

>=20
> ----------------------------------------------------------------
> Alexey Kardashevskiy (1):
>       pseries: Update SLOF firmware image
>=20
>  pc-bios/README   |   2 +-
>  pc-bios/slof.bin | Bin 968368 -> 968888 bytes
>  roms/SLOF        |   2 +-
>  3 files changed, 2 insertions(+), 2 deletions(-)
>=20
>=20
> *** Note: this is not for master, this is for pseries
>=20
> This is mostly compiler warnings fixed but while doing this,
> a bug in MIN() in tcgbios was found.
>=20
> Alexey Kardashevskiy (14):
>       helpers: Define MIN()
>       libc: Compile with -Wextra
>       elf: Compile with -Wextra
>       usb: Compile with -Wextra
>       veth: Compile with -Wextra
>       virtio: Compile with -Wextra
>       e1000: Compile with -Wextra
>       libnet: Compile with -Wextra
>       libhv: Compile with -Wextra
>       libnvram: Compile with -Wextra
>       libtpm: Compile with -Wextra
>       slof/prim: Compile with -Wextra
>       Makefile: Actually compile with -Wextra
>       version: update to 20210217
>=20
> Thomas Huth (1):
>       virtio-serial: Remove superfluous serial-* words
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--sRm3iq8mknMWjMJw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAzShwACgkQbDjKyiDZ
s5Jakw//bs9QuJFCVMVCq4nllg414qgGNUXkk4Ka8Wh5ynNVFFlzPCJ1s77naIg1
jQo1n+p9pRxi+9rFVRMJBMppfMVLc6TiZ2bv77t8ziEitn2YQWBJsSAir2N9yQB7
lVso8s8k8STlQVdxA52yKb7udHQb77jsA84dr6da2irWOgIeK6MyhiCaE6CqPQ7Z
Y4LaXk2/lreNTbRwvfEDmI5IKayYTDtM29Zn1LqaPOnIo/O+/FUJZ79aVgeowG/w
e+9V8yPdbQfeECttD5GJSv4CDuIT9zuhsanGL8876fcIIlh89H/gIXsyYGkLGCDx
QcANROOFgNiCDZVNLAfhoUYOnHuUhUrQQ3vGXtP4xjwWEdwR6RFzCZxQwwc/oL4i
EVAwinMW1IcqlWg0RP5Cks2hgl0iDC1bf+oQMEz/Rw48kBN2fEoxqwmBD4E8UO9h
sUHzf6tebkTIT9Vg/ytiXaXqzpbIJzeRGZlZTVYMgo3eRbzZAJ/o7wRzWZb+6fug
DuWknbiurqvCrbPkIjRFzG5dy6YNjRZdSv7DtASaoIlklzuZLC0oxC7rYLX44y7r
wgfildbXU+UHBforCqppKaGHHZUOypRDeT++9VvOMeNK8BD4HeLtxBiqKA80vzIC
bm7Xg+PCbCLXEv2KddAn9Mnv0T1h3nt2F/dRt/fYsNcfy2VtvnQ=
=XUve
-----END PGP SIGNATURE-----

--sRm3iq8mknMWjMJw--

