Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC111312B5
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 14:18:22 +0100 (CET)
Received: from localhost ([::1]:51832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioSGz-0006El-HQ
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 08:18:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39540)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1ioSFk-0005gq-Ah
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 08:17:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1ioSFi-0003f8-PK
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 08:17:03 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59648
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1ioSFi-0003ef-KA
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 08:17:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578316621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hy4EsRQeNe3lbCWpy1ZHQS1K1+X5fHfhsRgSCB1OaWw=;
 b=BI4H9YaVZtzbn/7KsDDmDsKE0Po+OWToCDqgxwUj/XwSkaRD9FX/dcO4z9N27aFZFPaVOT
 EfNzGuO2mc8WyPtMiSbK6c84otqb1yWLtYrSEODBSS6wE2K5edxFe+IS/tGkPuM2re7TVn
 qCegi2TPGAVnMfpUJx1RPdMoWzDpRZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-ljoHkUBYP2GGVMxPST8M4w-1; Mon, 06 Jan 2020 08:16:54 -0500
X-MC-Unique: ljoHkUBYP2GGVMxPST8M4w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64AEF8024DE;
 Mon,  6 Jan 2020 13:16:53 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-91.ams2.redhat.com
 [10.36.117.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A19611C4;
 Mon,  6 Jan 2020 13:16:46 +0000 (UTC)
Subject: Re: [PATCH] tests/qemu-iotests: Update tests to recent desugarized
 -accel option
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20200106130951.29873-1-philmd@redhat.com>
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
Message-ID: <453b637c-64d5-d693-09d8-a77c5a62c6c6@redhat.com>
Date: Mon, 6 Jan 2020 14:16:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200106130951.29873-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UmbFsUB8N6q3cTFfIqaX9UqLwKAG7fcgg"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UmbFsUB8N6q3cTFfIqaX9UqLwKAG7fcgg
Content-Type: multipart/mixed; boundary="zaW87QApZnbtaqq16wW5WMDi1BaknUvTA"

--zaW87QApZnbtaqq16wW5WMDi1BaknUvTA
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06.01.20 14:09, Philippe Mathieu-Daud=C3=A9 wrote:
> Commit 6f6e1698a6 desugarized "-machine accel=3D" to a list
> of "-accel" options. Since now "-machine accel" and "-accel"
> became incompatible, update the iotests to the new format.
>=20
> Error reported here:
> https://gitlab.com/qemu-project/qemu/-/jobs/385801004#L3400
>=20
> Reported-by: GitLab CI
> Fixes: 6f6e1698a6 (vl: configure accelerators from -accel options)
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  tests/qemu-iotests/235   | 2 +-
>  tests/qemu-iotests/check | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)

Thanks, applied to my block branch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block

Max


--zaW87QApZnbtaqq16wW5WMDi1BaknUvTA--

--UmbFsUB8N6q3cTFfIqaX9UqLwKAG7fcgg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl4TMzwACgkQ9AfbAGHV
z0D2xwf/enxqt8+5L7m4z1RZq6I2q1yCFz2tIKMRh+Xi6zQJiuYqCFQ8cBJ/YZ0D
QNPCbW8ALlOdGVmL8etFGtEo4N7GY8LT7n41xAX1VZJ+G3wclX5mrcxorPuTsffp
4u0kf7YUEe8aI4H3B7Ssy0GtvFUv0SP0p3MfloSTieJXZsh52+u6ldVahzRdSMKd
B1PUALpBfl4tpkUKHYhe0a51djS1v4pMd84KgmpkV7WCgkGwihlTjX7DyGuWh9sx
64VvLtnc5tYRCkYTRkdusnfWjShpvJB+Ei4wHH9pGdjqT1CZ/hyooPbiVDoMc5yz
CziHa7cs1xWoo26rgaNrmBLhqKyE6g==
=U0oj
-----END PGP SIGNATURE-----

--UmbFsUB8N6q3cTFfIqaX9UqLwKAG7fcgg--


