Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27980190BFA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 12:07:58 +0100 (CET)
Received: from localhost ([::1]:46750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGhPZ-0002Ye-6n
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 07:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60518)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jGhOX-0001fa-Le
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 07:06:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1jGhOW-00039g-K7
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 07:06:53 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:54171)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1jGhOW-00039T-EM
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 07:06:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585048012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DRqQ386klX8cHs7f2HDOWsl5IT9Kq4yl7GAypiHbh/A=;
 b=Xn0+8RkmS/NpsoSgtGHrCnQ9nQDAmu1Vs3gEmKfiXTwAX4hRka1TCNTHS4yC8A6bNRZdKK
 ZZQZgYI/oJ4MJ4zyuSaH52S38bVNMwpAIiTlTUhGgQRH6euWA3iNalyIKI1HNRR36zgjjx
 OEv8mWrQawK+1VyuLXF2aTgIawHDEOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-BaZ7RxbOOB6or5vs46DGPw-1; Tue, 24 Mar 2020 07:06:50 -0400
X-MC-Unique: BaZ7RxbOOB6or5vs46DGPw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 314858017CC;
 Tue, 24 Mar 2020 11:06:49 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-213.ams2.redhat.com
 [10.36.114.213])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3A9788859;
 Tue, 24 Mar 2020 11:06:47 +0000 (UTC)
Subject: Re: [PATCH] iotests/026: Move v3-exclusive test to new file
To: qemu-block@nongnu.org
References: <20200311140707.1243218-1-mreitz@redhat.com>
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
Message-ID: <e5b9dacf-e2cf-ead4-fac2-4128e8eb1af4@redhat.com>
Date: Tue, 24 Mar 2020 12:06:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200311140707.1243218-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xzTiXUf23UqWLHF3G3wEWv9Vhpi0uJVaj"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xzTiXUf23UqWLHF3G3wEWv9Vhpi0uJVaj
Content-Type: multipart/mixed; boundary="oi5fp4pNSrCExJlDrZBHsFNQdZ1uNb94g"

--oi5fp4pNSrCExJlDrZBHsFNQdZ1uNb94g
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11.03.20 15:07, Max Reitz wrote:
> data_file does not work with v2, and we probably want 026 to keep
> working for v2 images.  Thus, open a new file for v3-exclusive error
> path test cases.
>=20
> Fixes: 81311255f217859413c94f2cd9cebf2684bbda94
>        (=E2=80=9Ciotests/026: Test EIO on allocation in a data-file=E2=80=
=9D)
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/026             | 31 -----------
>  tests/qemu-iotests/026.out         |  6 --
>  tests/qemu-iotests/026.out.nocache |  6 --
>  tests/qemu-iotests/289             | 89 ++++++++++++++++++++++++++++++
>  tests/qemu-iotests/289.out         |  8 +++
>  tests/qemu-iotests/group           |  1 +
>  6 files changed, 98 insertions(+), 43 deletions(-)
>  create mode 100755 tests/qemu-iotests/289
>  create mode 100644 tests/qemu-iotests/289.out

Thanks for the review and test, applied to my block branch.

Max


--oi5fp4pNSrCExJlDrZBHsFNQdZ1uNb94g--

--xzTiXUf23UqWLHF3G3wEWv9Vhpi0uJVaj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl556cUACgkQ9AfbAGHV
z0C4VQgAutLBwcjJwkWpQpBuL8AwMgtoZmp8FF0fEEPvPNh53dM68pcU1eq9P3gJ
Lc+tkKVh9yuMlWSRqQvQl8lVS24pP8m7GfF4DT0x4Vq5/3DP8vINh6LxXjatrCei
jn8D6Ku0KEQdixkxTmU7rLAWfPZpZ9c3601Vq72+tAizZz7f6TDwPl+5fhKhsF0x
aNe0+3m5CDxTdD1TSyuN9q8Vpd7uLjJNOIG8CR22Q2ikHTQrUTe+fC7sbucTmIBB
tDADEHak9IpRks43C4KPKVahX9h7tLx+Wcn8+ilpCOx1qeW7331Ze+p2y9WB9uVS
hmkIn1xGxWCt9FiS7MWSdjx/NFAR2A==
=ompz
-----END PGP SIGNATURE-----

--xzTiXUf23UqWLHF3G3wEWv9Vhpi0uJVaj--


