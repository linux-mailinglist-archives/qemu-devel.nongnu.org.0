Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C58D8EDBA
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 16:08:29 +0200 (CEST)
Received: from localhost ([::1]:42248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyGQW-0005E8-De
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 10:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51963)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1hyGPi-0004kK-0W
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 10:07:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hyGPg-0005li-0j
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 10:07:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52654)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hyGPa-0005ib-Vu; Thu, 15 Aug 2019 10:07:31 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1FFA759451;
 Thu, 15 Aug 2019 14:07:30 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C5F07D3FE;
 Thu, 15 Aug 2019 14:07:27 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20190815121042.121309-1-vsementsov@virtuozzo.com>
 <20190815121042.121309-5-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Openpgp: preference=signencrypt
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
Message-ID: <b8f22ec4-84c0-77c7-9fb8-c8881afa2505@redhat.com>
Date: Thu, 15 Aug 2019 16:07:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815121042.121309-5-vsementsov@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VB4iRj8plHOQ3p60VLT2Jbdzr6lAZjLDE"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 15 Aug 2019 14:07:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 4/4] block/qcow2: introduce parallel
 subrequest handling in read and write
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VB4iRj8plHOQ3p60VLT2Jbdzr6lAZjLDE
Content-Type: multipart/mixed; boundary="A23Zv1oW6BSzzobVJ2ASFmlbnqnjqiyoc";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 kwolf@redhat.com, den@openvz.org, stefanha@redhat.com
Message-ID: <b8f22ec4-84c0-77c7-9fb8-c8881afa2505@redhat.com>
Subject: Re: [PATCH v3 4/4] block/qcow2: introduce parallel subrequest
 handling in read and write
References: <20190815121042.121309-1-vsementsov@virtuozzo.com>
 <20190815121042.121309-5-vsementsov@virtuozzo.com>
In-Reply-To: <20190815121042.121309-5-vsementsov@virtuozzo.com>

--A23Zv1oW6BSzzobVJ2ASFmlbnqnjqiyoc
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 15.08.19 14:10, Vladimir Sementsov-Ogievskiy wrote:
> It improves performance for fragmented qcow2 images.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/qcow2.h      |   3 ++
>  block/qcow2.c      | 125 ++++++++++++++++++++++++++++++++++++++++-----=

>  block/trace-events |   1 +
>  3 files changed, 117 insertions(+), 12 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


--A23Zv1oW6BSzzobVJ2ASFmlbnqnjqiyoc--

--VB4iRj8plHOQ3p60VLT2Jbdzr6lAZjLDE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1VZx4ACgkQ9AfbAGHV
z0Dg4wf+PrcTy8N2pcWjAjSzYEGUjrMyIFNaV61KG3qAoV2eilqhHxwQlFXwaLu8
+EAPpmDuXLH4kVBaX5E3a1dD9JBo3DsAvyze5qI0n3D6JM5fouFFOZwe8B2fFmTX
ghN6EsbhwFObPiT1dMYTfst1/TOQvPFQuuYtrecd82HlyCV3xcivB6pDLWlbZ7e2
0aL7J1O8D1+EQ7YuXQ+ZdEswq++JFeX9+tmMp9UKe7FZb775xqFcAIKJqNBcd4XF
2dXyzcaT2XRdgr6arcIRNfyaoB9b9qFU9HfwfejiqwyS5ABDR2QfvgLOVcJfKrDx
SJ+vq4GE9JglptXd/Q6SS2tDxkzObQ==
=A4Y5
-----END PGP SIGNATURE-----

--VB4iRj8plHOQ3p60VLT2Jbdzr6lAZjLDE--

