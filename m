Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA34D4BDE0
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 18:18:48 +0200 (CEST)
Received: from localhost ([::1]:40160 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hddIN-0007No-VK
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 12:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52101)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hdd1n-0004qG-1F
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 12:01:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hdd1i-0007WZ-M9
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 12:01:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47268)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hdd1Y-0007OH-Fo; Wed, 19 Jun 2019 12:01:24 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 927DB300181C;
 Wed, 19 Jun 2019 16:01:22 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-116-121.ams2.redhat.com
 [10.36.116.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86E0819722;
 Wed, 19 Jun 2019 16:01:21 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
References: <20190612221004.2317-1-mreitz@redhat.com>
 <20190612221004.2317-35-mreitz@redhat.com>
 <a1c7bbb0-a04c-821a-e46b-bb67e837a272@virtuozzo.com>
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
Message-ID: <4f1f8404-f60d-2a33-0f5b-09de14643198@redhat.com>
Date: Wed, 19 Jun 2019 18:01:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <a1c7bbb0-a04c-821a-e46b-bb67e837a272@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pQnqYQdLxsdutni20R69jbOZ3OtKxAV85"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Wed, 19 Jun 2019 16:01:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5 34/42] block: Inline
 bdrv_co_block_status_from_*()
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pQnqYQdLxsdutni20R69jbOZ3OtKxAV85
Content-Type: multipart/mixed; boundary="dtVn9fEEp3j0B8qODSYM2KEDEsm0zqVgp";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>
Message-ID: <4f1f8404-f60d-2a33-0f5b-09de14643198@redhat.com>
Subject: Re: [PATCH v5 34/42] block: Inline bdrv_co_block_status_from_*()
References: <20190612221004.2317-1-mreitz@redhat.com>
 <20190612221004.2317-35-mreitz@redhat.com>
 <a1c7bbb0-a04c-821a-e46b-bb67e837a272@virtuozzo.com>
In-Reply-To: <a1c7bbb0-a04c-821a-e46b-bb67e837a272@virtuozzo.com>

--dtVn9fEEp3j0B8qODSYM2KEDEsm0zqVgp
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 19.06.19 11:34, Vladimir Sementsov-Ogievskiy wrote:
> 13.06.2019 1:09, Max Reitz wrote:
>> With bdrv_filtered_rw_bs(), we can easily handle this default filter
>> behavior in bdrv_co_block_status().
>>
>> blkdebug wants to have an additional assertion, so it keeps its own
>> implementation, except bdrv_co_block_status_from_file() needs to be
>> inlined there.
>>
>> Suggested-by: Eric Blake <eblake@redhat.com>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   include/block/block_int.h | 22 -----------------
>>   block/blkdebug.c          |  7 ++++--
>>   block/blklogwrites.c      |  1 -
>>   block/commit.c            |  1 -
>>   block/copy-on-read.c      |  2 --
>>   block/io.c                | 51 +++++++++++++------------------------=
--
>>   block/mirror.c            |  1 -
>>   block/throttle.c          |  1 -
>>   8 files changed, 22 insertions(+), 64 deletions(-)

[...]

>> diff --git a/block/io.c b/block/io.c
>> index 14f99e1c00..0a832e30a3 100644
>> --- a/block/io.c
>> +++ b/block/io.c

[...]

>> @@ -2114,9 +2086,20 @@ static int coroutine_fn bdrv_co_block_status(Bl=
ockDriverState *bs,
>>       aligned_offset =3D QEMU_ALIGN_DOWN(offset, align);
>>       aligned_bytes =3D ROUND_UP(offset + bytes, align) - aligned_offs=
et;
>>  =20
>> -    ret =3D bs->drv->bdrv_co_block_status(bs, want_zero, aligned_offs=
et,
>> -                                        aligned_bytes, pnum, &local_m=
ap,
>> -                                        &local_file);
>> +    if (bs->drv->bdrv_co_block_status) {
>> +        ret =3D bs->drv->bdrv_co_block_status(bs, want_zero, aligned_=
offset,
>> +                                            aligned_bytes, pnum, &loc=
al_map,
>> +                                            &local_file);
>> +    } else {
>> +        /* Default code for filters */
>> +
>> +        local_file =3D bdrv_filtered_rw_bs(bs);
>> +        assert(local_file);
>> +
>> +        *pnum =3D aligned_bytes;
>> +        local_map =3D aligned_offset;
>> +        ret =3D BDRV_BLOCK_RAW | BDRV_BLOCK_OFFSET_VALID;
>=20
> I now in a little doubt:
>=20
> What is real difference between RAW for filters and UNALLOCATED for qco=
w2 (when we
> should look at backing) ?

Maybe none, but I don=E2=80=99t think diving down that rabbit hole is goi=
ng to
make this seres shorter.

Max


--dtVn9fEEp3j0B8qODSYM2KEDEsm0zqVgp--

--pQnqYQdLxsdutni20R69jbOZ3OtKxAV85
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl0KXFAACgkQ9AfbAGHV
z0B7IQf9GcWSZlB7BrJYxGChEcCFZmVsvJn/2ixNOC3FGro/nx5hyisQjgMb8v+z
3LQ66bf+ZGSj/9J+5Z0J4XYrHn8x33sMk4Rujl/NB4v8VxkEGhOZxdv0i//GUgmR
n21ELZZQnkiC7EcNrzrAvhu/MflSaeDgqc6Odi4EWYLrqWgYyU9QJa4I40rA94S6
dt19OVlE2/9A0pkzkcJf1l1M9nYZsummkRumVKM/wVrBEzWo2nIwuOyl0KE12t3K
23LFHWvQsC9iEQT8Cc3auHDZrMD3FQyuWk7JyK71SgIB9zhc13qco1+MPUy66zNw
O4aGsqErS8JPxMqBOY/j/agCuL+9/A==
=Gqku
-----END PGP SIGNATURE-----

--pQnqYQdLxsdutni20R69jbOZ3OtKxAV85--

