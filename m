Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD36CE169
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 14:18:55 +0200 (CEST)
Received: from localhost ([::1]:43908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHRyX-0008V5-LF
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 08:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48921)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iHRuf-00063Y-KZ
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 08:14:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iHRue-0006PD-LI
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 08:14:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58464)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iHRuc-0006Ms-Dy; Mon, 07 Oct 2019 08:14:50 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 92A403086228;
 Mon,  7 Oct 2019 12:14:49 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.196])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 618AE1001B3F;
 Mon,  7 Oct 2019 12:14:48 +0000 (UTC)
Subject: Re: [PATCH 2/2] tests: More iotest 223 improvements
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20190924143522.22902-1-eblake@redhat.com>
 <20190924143522.22902-3-eblake@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Autocrypt: addr=mreitz@redhat.com; prefer-encrypt=mutual; keydata=
 mQENBFXOJlcBCADEyyhOTsoa/2ujoTRAJj4MKA21dkxxELVj3cuILpLTmtachWj7QW+TVG8U
 /PsMCFbpwsQR7oEy8eHHZwuGQsNpEtNC2G/L8Yka0BIBzv7dEgrPzIu+W3anZXQW4702+uES
 U29G8TP/NGfXRRHGlbBIH9KNUnOSUD2vRtpOLXkWsV5CN6vQFYgQfFvmp5ZpPeUe6xNplu8V
 mcTw8OSEDW/ZnxJc8TekCKZSpdzYoxfzjm7xGmZqB18VFwgJZlIibt1HE0EB4w5GsD7x5ekh
 awIe3RwoZgZDLQMdOitJ1tUc8aqaxvgA4tz6J6st8D8pS//m1gAoYJWGwwIVj1DjTYLtABEB
 AAG0HU1heCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+iQFTBBMBCAA9AhsDBQkSzAMABQsJ
 CAcCBhUICQoLAgQWAgMBAh4BAheABQJVzie5FRhoa3A6Ly9rZXlzLmdudXBnLm5ldAAKCRD0
 B9sAYdXPQDcIB/9uNkbYEex1rHKz3mr12uxYMwLOOFY9fstP5aoVJQ1nWQVB6m2cfKGdcRe1
 2/nFaHSNAzT0NnKz2MjhZVmcrpyd2Gp2QyISCfb1FbT82GMtXFj1wiHmPb3CixYmWGQUUh+I
 AvUqsevLA+WihgBUyaJq/vuDVM1/K9Un+w+Tz5vpeMidlIsTYhcsMhn0L9wlCjoucljvbDy/
 8C9L2DUdgi3XTa0ORKeflUhdL4gucWoAMrKX2nmPjBMKLgU7WLBc8AtV+84b9OWFML6NEyo4
 4cP7cM/07VlJK53pqNg5cHtnWwjHcbpGkQvx6RUx6F1My3y52vM24rNUA3+ligVEgPYBuQEN
 BFXOJlcBCADAmcVUNTWT6yLWQHvxZ0o47KCP8OcLqD+67T0RCe6d0LP8GsWtrJdeDIQk+T+F
 xO7DolQPS6iQ6Ak2/lJaPX8L0BkEAiMuLCKFU6Bn3lFOkrQeKp3u05wCSV1iKnhg0UPji9V2
 W5eNfy8F4ZQHpeGUGy+liGXlxqkeRVhLyevUqfU0WgNqAJpfhHSGpBgihUupmyUg7lfUPeRM
 DzAN1pIqoFuxnN+BRHdAecpsLcbR8sQddXmDg9BpSKozO/JyBmaS1RlquI8HERQoe6EynJhd
 64aICHDfj61rp+/0jTIcevxIIAzW70IadoS/y3DVIkuhncgDBvGbF3aBtjrJVP+5ABEBAAGJ
 ASUEGAEIAA8FAlXOJlcCGwwFCRLMAwAACgkQ9AfbAGHVz0CbFwf9F/PXxQR9i4N0iipISYjU
 sxVdjJOM2TMut+ZZcQ6NSMvhZ0ogQxJ+iEQ5OjnIputKvPVd5U7WRh+4lF1lB/NQGrGZQ1ic
 alkj6ocscQyFwfib+xIe9w8TG1CVGkII7+TbS5pXHRxZH1niaRpoi/hYtgzkuOPp35jJyqT/
 /ELbqQTDAWcqtJhzxKLE/ugcOMK520dJDeb6x2xVES+S5LXby0D4juZlvUj+1fwZu+7Io5+B
 bkhSVPb/QdOVTpnz7zWNyNw+OONo1aBUKkhq2UIByYXgORPFnbfMY7QWHcjpBVw9MgC4tGeF
 R4bv+1nAMMxKmb5VvQCExr0eFhJUAHAhVg==
Message-ID: <0e7f429f-a7dd-bf7c-70f2-2ea42b73b4a9@redhat.com>
Date: Mon, 7 Oct 2019 14:14:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190924143522.22902-3-eblake@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hkZU4x9OYtvdMhKOcYW5zuD8ONU2WVkTV"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Mon, 07 Oct 2019 12:14:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: nsoffer@redhat.com, Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hkZU4x9OYtvdMhKOcYW5zuD8ONU2WVkTV
Content-Type: multipart/mixed; boundary="4ApCRJHM4iyxbZIsnZptMTLZwNuhfA6Wl"

--4ApCRJHM4iyxbZIsnZptMTLZwNuhfA6Wl
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 24.09.19 16:35, Eric Blake wrote:
> Run the test twice, once without iothreads, and again with, for more
> coverage of both setups.
>=20
> Suggested-by: Nir Soffer <nsoffer@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  tests/qemu-iotests/223     | 66 +++++++++++++++++++++++++
>  tests/qemu-iotests/223.out | 98 ++++++++++++++++++++++++++++++++++++++=

>  2 files changed, 164 insertions(+)

I think this can be done easier by just having a =E2=80=9Cfor i in 0 1=E2=
=80=9D loop
span the range from block-dirty-bitmap-disable to nbd-server-stop (and
then, at the end of the first iteration, do the x-blockdev-set-iothread).=


Max


--4ApCRJHM4iyxbZIsnZptMTLZwNuhfA6Wl--

--hkZU4x9OYtvdMhKOcYW5zuD8ONU2WVkTV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl2bLDYACgkQ9AfbAGHV
z0Cb4Qf/YZhZZtexr0Qd9WSlh0XDGh1mMhJ+oSjim/n/K47Ph+Lw3iwsLahXW3PB
22Jk7pGDEDea51giZ+VMIso7Ed4ua+fAq0DFy4gKYFhEJY6phrfM9PzqGj7C5xJp
OEgOBmz0coRCWzuJ9wOcOpK8rx6xTAS3QkYD83IWBa89l5yB5uSnTgflP7ZBx515
S4eI5vp4medoqLLmiqIgIkjiHGWLQPMsf0qZAikz6Fn6agLQtVz0VersatV268ly
ACymYbJFK1YLPB0eYpMoMixwohYie0G2ET2bSjiP2Q4fBBWfpmK8siJ6aMmf2IHQ
9clzk21vQuPZX8AAFAsdgmDcxM2G4g==
=Kp0M
-----END PGP SIGNATURE-----

--hkZU4x9OYtvdMhKOcYW5zuD8ONU2WVkTV--

