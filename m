Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 802D716C82
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 22:45:33 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hO6xw-0007Gd-9w
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 16:45:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36318)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1hO6rh-0000my-Is
	for qemu-devel@nongnu.org; Tue, 07 May 2019 16:39:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1hO6rg-0006bn-F0
	for qemu-devel@nongnu.org; Tue, 07 May 2019 16:39:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43706)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1hO6rd-0006aG-SM; Tue, 07 May 2019 16:39:02 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EBF13308FC22;
	Tue,  7 May 2019 20:39:00 +0000 (UTC)
Received: from [10.3.116.15] (ovpn-116-15.phx2.redhat.com [10.3.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5910B60BF3;
	Tue,  7 May 2019 20:39:00 +0000 (UTC)
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20190507183610.9848-1-mreitz@redhat.com>
	<20190507183610.9848-6-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=eblake@redhat.com; keydata=
	xsBNBEvHyWwBCACw7DwsQIh0kAbUXyqhfiKAKOTVu6OiMGffw2w90Ggrp4bdVKmCaEXlrVLU
	xphBM8mb+wsFkU+pq9YR621WXo9REYVIl0FxKeQo9dyQBZ/XvmUMka4NOmHtFg74nvkpJFCD
	TUNzmqfcjdKhfFV0d7P/ixKQeZr2WP1xMcjmAQY5YvQ2lUoHP43m8TtpB1LkjyYBCodd+LkV
	GmCx2Bop1LSblbvbrOm2bKpZdBPjncRNob73eTpIXEutvEaHH72LzpzksfcKM+M18cyRH+nP
	sAd98xIbVjm3Jm4k4d5oQyE2HwOur+trk2EcxTgdp17QapuWPwMfhaNq3runaX7x34zhABEB
	AAHNHkVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPsLAegQTAQgAJAIbAwULCQgHAwUV
	CgkICwUWAgMBAAIeAQIXgAUCS8fL9QIZAQAKCRCnoWtKJSdDahBHCACbl/5FGkUqJ89GAjeX
	RjpAeJtdKhujir0iS4CMSIng7fCiGZ0fNJCpL5RpViSo03Q7l37ss+No+dJI8KtAp6ID+PMz
	wTJe5Egtv/KGUKSDvOLYJ9WIIbftEObekP+GBpWP2+KbpADsc7EsNd70sYxExD3liwVJYqLc
	Rw7so1PEIFp+Ni9A1DrBR5NaJBnno2PHzHPTS9nmZVYm/4I32qkLXOcdX0XElO8VPDoVobG6
	gELf4v/vIImdmxLh/w5WctUpBhWWIfQDvSOW2VZDOihm7pzhQodr3QP/GDLfpK6wI7exeu3P
	pfPtqwa06s1pae3ad13mZGzkBdNKs1HEm8x6zsBNBEvHyWwBCADGkMFzFjmmyqAEn5D+Mt4P
	zPdO8NatsDw8Qit3Rmzu+kUygxyYbz52ZO40WUu7EgQ5kDTOeRPnTOd7awWDQcl1gGBXgrkR
	pAlQ0l0ReO57Q0eglFydLMi5bkwYhfY+TwDPMh3aOP5qBXkm4qIYSsxb8A+i00P72AqFb9Q7
	3weG/flxSPApLYQE5qWGSXjOkXJv42NGS6o6gd4RmD6Ap5e8ACo1lSMPfTpGzXlt4aRkBfvb
	NCfNsQikLZzFYDLbQgKBA33BDeV6vNJ9Cj0SgEGOkYyed4I6AbU0kIy1hHAm1r6+sAnEdIKj
	cHi3xWH/UPrZW5flM8Kqo14OTDkI9EtlABEBAAHCwF8EGAEIAAkFAkvHyWwCGwwACgkQp6Fr
	SiUnQ2q03wgAmRFGDeXzc58NX0NrDijUu0zx3Lns/qZ9VrkSWbNZBFjpWKaeL1fdVeE4TDGm
	I5mRRIsStjQzc2R9b+2VBUhlAqY1nAiBDv0Qnt+9cLiuEICeUwlyl42YdwpmY0ELcy5+u6wz
	mK/jxrYOpzXKDwLq5k4X+hmGuSNWWAN3gHiJqmJZPkhFPUIozZUCeEc76pS/IUN72NfprZmF
	Dp6/QDjDFtfS39bHSWXKVZUbqaMPqlj/z6Ugk027/3GUjHHr8WkeL1ezWepYDY7WSoXwfoAL
	2UXYsMAr/uUncSKlfjvArhsej0S4zbqim2ZY6S8aRWw94J3bSvJR+Nwbs34GPTD4Pg==
Organization: Red Hat, Inc.
Message-ID: <bb490ce7-7943-6607-6a74-cfb5c2f9b95a@redhat.com>
Date: Tue, 7 May 2019 15:38:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507183610.9848-6-mreitz@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="gF99DanDRE3DGzYFwxZOVqlBxRWI2wJVM"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 07 May 2019 20:39:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH 5/5] iotests: Let 233 run concurrently
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gF99DanDRE3DGzYFwxZOVqlBxRWI2wJVM
From: Eric Blake <eblake@redhat.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Message-ID: <bb490ce7-7943-6607-6a74-cfb5c2f9b95a@redhat.com>
Subject: Re: [PATCH 5/5] iotests: Let 233 run concurrently
References: <20190507183610.9848-1-mreitz@redhat.com>
 <20190507183610.9848-6-mreitz@redhat.com>
In-Reply-To: <20190507183610.9848-6-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 5/7/19 1:36 PM, Max Reitz wrote:
> common.nbd's nbd_server_set_tcp_port() tries to find a free port, and
> then uses it for the whole test run.  However, this is racey because

racy

> even if the port was free at the beginning, there is no guarantee it
> will continue to be available.  Therefore, 233 currently cannot reliabl=
y
> be run concurrently with other NBD TCP tests.
>=20
> This patch addresses the problem by dropping nbd_server_set_tcp_port(),=

> and instead finding a new port every time nbd_server_start_tcp_socket()=

> is invoked.  For this, we run qemu-nbd with --fork and on error evaluat=
e
> the output to see whether it contains "Address already in use".  If so,=

> we try the next port.
>=20
> On success, we still want to continually redirect the output from
> qemu-nbd to stderr.  To achieve both, we redirect qemu-nbd's stderr to =
a
> FIFO that we then open in bash.  If the parent process exits with statu=
s
> 0 (which means that the server has started successfully), we launch a
> background cat process that copies the FIFO to stderr.  On failure, we
> read the whole content into a variable and then evaluate it.
>=20
> While at it, use --fork in nbd_server_start_unix_socket(), too.  Doing
> so allows us to drop nbd_server_wait_for_*_socket().
>=20
> Note that the reason common.nbd did not use --fork before is that
> qemu-nbd did not have --pid-file.
>=20
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/233        |  1 -
>  tests/qemu-iotests/common.nbd | 93 ++++++++++++++++-------------------=

>  2 files changed, 42 insertions(+), 52 deletions(-)
>=20

> @@ -34,76 +39,62 @@ nbd_server_stop()
>          fi
>      fi
>      rm -f "$nbd_unix_socket"
> -}
> -
> -nbd_server_wait_for_unix_socket()
> -{
=2E..
> -    echo "Failed in check of unix socket created by qemu-nbd"
> -    exit 1
> +    rm -f "$nbd_stderr_fifo"

You could use a single 'rm -f "$nbd_unix_socket" "$nbd_stderr_fifo"'.
That's cosmetic, though.

Are we sure that even on failure, our fifo will not fill up and cause
deadlock? If the failing qemu-nbd has so much output as to be non-atomic
so that it blocks waiting for a reader, but we don't read anything until
after qemu-nbd exits after forking the daemon, then we have deadlock.
But in the common case, I don't think qemu-nbd ever spits out that much
in errors, even when it fails to start whether due to a socket in use or
for other reasons.  And even if it does hang, it is our testsuite (and
our CI tools will probably notice it), rather than our main code.

Otherwise, it's a lot of shell code with quite a few bash-isms, but we
already require bash, and I didn't spot anything blatantly wrong.

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--gF99DanDRE3DGzYFwxZOVqlBxRWI2wJVM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlzR7OMACgkQp6FrSiUn
Q2qangf+LrnNVcd5RmYn70PO3kipLonnT/8Mf8aP1pwZShFHYBqfS0EJnxyevFcd
ksGKjFfR6cKifRiNWcav/ALUoRiPiOP26FVpYo0r0DdEmXpvcgEB7/WnLMm2HS45
OntEW9ASdv3hBzAnv9T3yvnGfg/hqPmV4qNxjwK0UROXHF9FaCn3RmmrQrMw0hKq
WDqq1yO5sUxDr4kOp3tsm1qwrzA5XJ1JBxldAejc9o0Y26qT8XUa7uiFyxkk5XEo
N2eKfwItpPiWVD+gcLoJwOGLuNL9s7LYSELVrsn1v8GFkiukADn5q1xB1kRMAC6Q
jfBlxM8nKbFToD8BzW2doyp3LsYFPw==
=7azk
-----END PGP SIGNATURE-----

--gF99DanDRE3DGzYFwxZOVqlBxRWI2wJVM--

