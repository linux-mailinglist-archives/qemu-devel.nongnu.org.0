Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE05164924
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 16:49:46 +0100 (CET)
Received: from localhost ([::1]:54892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4Rbd-0003FV-FY
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 10:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34124)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j4Ras-0002jO-6V
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 10:48:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j4Rar-0000Ul-6X
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 10:48:58 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:39408
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j4Rar-0000UI-2y
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 10:48:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582127336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/807HjmfSkK9qJ3bJhQt5esG7zxu0pwK4YcjxzAoT6s=;
 b=fmWubGFCuyxhJlA19f7mEvr3aX89hHJM/w6/3UrQS+k0vocYjje0bjz6M7w9V7g1ML1r5i
 y2aeMZH0POVinUFuEqYUBOoF7vijlmWNbihAV8X5BqIKCZ3jLxLcQ2Wlc0gR5NhAx6vthb
 hooSyRde9tYXySCrGJUncuDn1TxFCNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-piQ2BVGeNEiA3ybbOCdDfw-1; Wed, 19 Feb 2020 10:48:51 -0500
X-MC-Unique: piQ2BVGeNEiA3ybbOCdDfw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA528101CC7C;
 Wed, 19 Feb 2020 15:48:50 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-32.ams2.redhat.com
 [10.36.117.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86AD25C112;
 Wed, 19 Feb 2020 15:48:49 +0000 (UTC)
Subject: Re: [PATCH v3 3/4] qemu-img: allow qemu-img measure --object without
 a filename
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20200211160318.453650-1-stefanha@redhat.com>
 <20200211160318.453650-4-stefanha@redhat.com>
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
Message-ID: <76fb1b01-50b3-3ff3-c0e0-f96d742bad1c@redhat.com>
Date: Wed, 19 Feb 2020 16:48:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211160318.453650-4-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="V2Qwas7IiJInjW0EqsLZtmw5qJILwu0pY"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--V2Qwas7IiJInjW0EqsLZtmw5qJILwu0pY
Content-Type: multipart/mixed; boundary="7gC8wCTdCiDnTOs6FkrZCCuDbE4BSt1DD"

--7gC8wCTdCiDnTOs6FkrZCCuDbE4BSt1DD
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11.02.20 17:03, Stefan Hajnoczi wrote:
> In most qemu-img sub-commands the --object option only makes sense when
> there is a filename.  qemu-img measure is an exception because objects
> may be referenced from the image creation options instead of an existing
> image file.  Allow --object without a filename.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  qemu-img.c                       | 6 ++----
>  tests/qemu-iotests/178           | 2 +-
>  tests/qemu-iotests/178.out.qcow2 | 8 ++++----
>  tests/qemu-iotests/178.out.raw   | 8 ++++----
>  4 files changed, 11 insertions(+), 13 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


--7gC8wCTdCiDnTOs6FkrZCCuDbE4BSt1DD--

--V2Qwas7IiJInjW0EqsLZtmw5qJILwu0pY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl5NWOAACgkQ9AfbAGHV
z0CDlggAuweCEmpRZ20MEp7f/GKosP8Bua02gXXEvZGG2RIRooCQZ4Ejj9Hqetsn
LEl4hrOSPmpExHXl+AoLdQBzGqojEN0eTdBsZmxNMA9IRq8kOHhBZ1nzRx8I/lyl
N1A3wDNO0gCy3ORCxjAbBs2NgsAEhlT0BC437ZL40NBvbk4WDQj9t1Hf0fxMEZ3b
LZqxXVb//oCmt3l7CfQKMO0Ixs2uX1rRWRsgPddZhd1oeA2ZvQs/a1cRFnbUtm7U
SJLtAvy3K/rAIDdwadHaYRcVf0z7264q7kDYNF0wo5KyWGxEvqx6NmJ6gEwbGUIi
r6wv3jdvnargSl7ZrGVVTrPXizUKqg==
=kVxM
-----END PGP SIGNATURE-----

--V2Qwas7IiJInjW0EqsLZtmw5qJILwu0pY--


