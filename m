Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69855AF5AC
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 08:21:22 +0200 (CEST)
Received: from localhost ([::1]:46748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7w0H-00026l-Gd
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 02:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36365)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i7vzL-0001HE-2P
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 02:20:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i7vzJ-0001l6-US
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 02:20:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51227)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i7vzG-0001ip-B3; Wed, 11 Sep 2019 02:20:18 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 90E01335E8;
 Wed, 11 Sep 2019 06:20:17 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-116-94.ams2.redhat.com
 [10.36.116.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7CC96D09D;
 Wed, 11 Sep 2019 06:20:15 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>
References: <20190809161407.11920-1-mreitz@redhat.com>
 <20190809161407.11920-23-mreitz@redhat.com>
 <20190910145229.GI4446@localhost.localdomain>
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
Message-ID: <d7226d81-b89f-5c24-9dd4-39ae832bf61b@redhat.com>
Date: Wed, 11 Sep 2019 08:20:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910145229.GI4446@localhost.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="h6Cg2PiRHvuxyoljmZihl55mvH3mkFln9"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Wed, 11 Sep 2019 06:20:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v6 22/42] block: Fix
 bdrv_get_allocated_file_size's fallback
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--h6Cg2PiRHvuxyoljmZihl55mvH3mkFln9
Content-Type: multipart/mixed; boundary="QVBiOXBN90Bdr6eYcpsqeb750ckiB4irE";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d7226d81-b89f-5c24-9dd4-39ae832bf61b@redhat.com>
Subject: Re: [PATCH v6 22/42] block: Fix bdrv_get_allocated_file_size's
 fallback
References: <20190809161407.11920-1-mreitz@redhat.com>
 <20190809161407.11920-23-mreitz@redhat.com>
 <20190910145229.GI4446@localhost.localdomain>
In-Reply-To: <20190910145229.GI4446@localhost.localdomain>

--QVBiOXBN90Bdr6eYcpsqeb750ckiB4irE
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 10.09.19 16:52, Kevin Wolf wrote:
> Am 09.08.2019 um 18:13 hat Max Reitz geschrieben:
>> If the driver does not implement bdrv_get_allocated_file_size(), we
>> should fall back to cumulating the allocated size of all non-COW
>> children instead of just bs->file.
>>
>> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>=20
> This smells like an overgeneralisation, but if we want to count all vmd=
k
> extents, the qcow2 external data file, etc. it's an improvement anyway.=

> A driver that has a child that should not be counted must just remember=

> to implement the callback.
>=20
> Let me think of an example... How about quorum, for a change? :-)
> Or the second blkverify child.
>=20
> Or eventually the block job filter nodes.

I actually think it makes sense for all of these nodes to report the sum
of all of their children=E2=80=99s allocated sizes.

If a quorum node has three children with allocated sizes of 3 MB, 1 MB,
and 2 MB, respectively (totally possible if some have explicit zeroes
and others don=E2=80=99t; it may also depend on the protocol, the filesys=
tem,
etc.), then I think it makes most sense to report indeed 6 MB for the
quorum subtree as a whole.  What would you report?  3 MB?

> Ehm... Maybe I should just take back what I said first. It almost feels=

> like it would be better if qcow2 and vmdk explicitly used a handler tha=
t
> counts all children (could still be a generic one in block.c) rather
> than having to remember to disable the functionality everywhere where w=
e
> don't want to have it.

I don=E2=80=99t, because everywhere we don=E2=80=99t want this functional=
ity, we still
need to choose a child.  This has to be done by the driver anyway.

Max

> And please adjust the comment for bdrv_get_allocated_file_size(), it
> only talks about a single file as if trees didn't exist. Actually, it
> doesn't even seem so easy to define. Maybe primary node + storage nodes=
?
> Then vmdk needs to expose its extents as storage nodes (plural!), but
> in the long run that might be needed anyway.


--QVBiOXBN90Bdr6eYcpsqeb750ckiB4irE--

--h6Cg2PiRHvuxyoljmZihl55mvH3mkFln9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl14khwACgkQ9AfbAGHV
z0BTfAf/Zla4c9NyVFVVam5urY2CLHxakvImsM+mHC4JhlXHmKPVWfBkQE22o2C7
oWAu6eKx2eOwCVEk92SVCMoDNmPvG9Kg709qpRYZrvFaIE32fEkKAjSqWz6MgtcY
lui6IiWobU0s/QqohJrv7MNtb00W/dX/1rBE6Tz57h/1dD8/do5d7lD5/TNQyPwO
U28YsrwqR0Kh3KBiwDXAmurVl9wYombisDhRLXwzZWVvJWzaN7axlN8fwlXLeEe9
zaGb2tztdtY5y/O0EF4+0f9Tov+h2qDrd5VWu9NQtqXc9dXkBaozYK9abvUFM58l
qzpVbaF4zxLvPBKq2TaFanbIy5TpFQ==
=5k+8
-----END PGP SIGNATURE-----

--h6Cg2PiRHvuxyoljmZihl55mvH3mkFln9--

