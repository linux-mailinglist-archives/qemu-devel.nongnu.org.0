Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D492CAA1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 17:49:45 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36965 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVeMB-0007cd-Vk
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 11:49:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hVeKu-0007BO-0B
	for qemu-devel@nongnu.org; Tue, 28 May 2019 11:48:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hVeKr-0006Xc-Mm
	for qemu-devel@nongnu.org; Tue, 28 May 2019 11:48:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55426)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hVeKl-00062E-EM; Tue, 28 May 2019 11:48:16 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 194F5307E04A;
	Tue, 28 May 2019 15:47:59 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.223])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F4BE60565;
	Tue, 28 May 2019 15:47:52 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-block@nongnu.org" <qemu-block@nongnu.org>
References: <20190408162617.258535-1-vsementsov@virtuozzo.com>
	<20190408162617.258535-3-vsementsov@virtuozzo.com>
	<4fdb0181-b9ae-25fa-c601-9f646772c0bd@redhat.com>
	<ba7eafa8-8c40-f32b-77dd-2e54a2390293@virtuozzo.com>
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
Message-ID: <c66629ee-0c12-cd2b-81d1-3096f50c6fc5@redhat.com>
Date: Tue, 28 May 2019 17:47:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ba7eafa8-8c40-f32b-77dd-2e54a2390293@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ojCUv5fCzmvOXHMwFnhaYcH6odQKigyXO"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Tue, 28 May 2019 15:48:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v2 2/2] block: avoid recursive block_status
 call if possible
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
	Denis Lunev <den@virtuozzo.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ojCUv5fCzmvOXHMwFnhaYcH6odQKigyXO
From: Max Reitz <mreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Cc: "kwolf@redhat.com" <kwolf@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>, Denis Lunev <den@virtuozzo.com>
Message-ID: <c66629ee-0c12-cd2b-81d1-3096f50c6fc5@redhat.com>
Subject: Re: [PATCH v2 2/2] block: avoid recursive block_status call if
 possible
References: <20190408162617.258535-1-vsementsov@virtuozzo.com>
 <20190408162617.258535-3-vsementsov@virtuozzo.com>
 <4fdb0181-b9ae-25fa-c601-9f646772c0bd@redhat.com>
 <ba7eafa8-8c40-f32b-77dd-2e54a2390293@virtuozzo.com>
In-Reply-To: <ba7eafa8-8c40-f32b-77dd-2e54a2390293@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 28.05.19 08:39, Vladimir Sementsov-Ogievskiy wrote:
> 27.05.2019 18:13, Max Reitz wrote:
>> On 08.04.19 18:26, Vladimir Sementsov-Ogievskiy wrote:
>>> drv_co_block_status digs bs->file for additional, more accurate searc=
h
>>> for hole inside region, reported as DATA by bs since 5daa74a6ebc.
>>>
>>> This accuracy is not free: assume we have qcow2 disk. Actually, qcow2=

>>> knows, where are holes and where is data. But every block_status
>>> request calls lseek additionally. Assume a big disk, full of
>>> data, in any iterative copying block job (or img convert) we'll call
>>> lseek(HOLE) on every iteration, and each of these lseeks will have to=

>>> iterate through all metadata up to the end of file. It's obviously
>>> ineffective behavior. And for many scenarios we don't need this lseek=

>>> at all.
>>>
>>> However, lseek is needed when we have metadata-preallocated image.
>>>
>>> So, let's detect metadata-preallocation case and don't dig qcow2's
>>> protocol file in other cases.
>>>
>>> The idea is to compare allocation size in POV of filesystem with
>>> allocations size in POV of Qcow2 (by refcounts). If allocation in fs =
is
>>> significantly lower, consider it as metadata-preallocation case.
>>>
>>> 102 iotest changed, as our detector can't detect shrinked file as
>>> metadata-preallocation, which don't seem to be wrong, as with metadat=
a
>>> preallocation we always have valid file length.
>>>
>>> Other two iotests tiny changed QMP output sequence, which should be
>>> exactly because skipped lseek at mirror beginning.
>>>
>>> Suggested-by: Denis V. Lunev <den@openvz.org>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com=
>
>>> ---
>>>   block/qcow2.h              |  4 ++++
>>>   include/block/block.h      |  8 +++++++-
>>>   block/io.c                 |  9 ++++++++-
>>>   block/qcow2-refcount.c     | 32 ++++++++++++++++++++++++++++++++
>>>   block/qcow2.c              | 11 +++++++++++
>>>   tests/qemu-iotests/102     |  2 +-
>>>   tests/qemu-iotests/102.out |  3 ++-
>>>   tests/qemu-iotests/141.out |  2 +-
>>>   tests/qemu-iotests/144.out |  2 +-
>>>   9 files changed, 67 insertions(+), 6 deletions(-)
>>
>> For me, this patch breaks iotests 141 (for qed) and 211 (for vdi):
>>
>>> 141 1s ...        [17:11:53] [17:11:53] - output mismatch (see 141.ou=
t.bad)
>>> --- tests/qemu-iotests/141.out 2019-05-27 17:11:43.327664282 +0200
>>> +++ build/tests/qemu-iotests/141.out.bad       2019-05-27 17:11:53.94=
9439880 +0200
>>> @@ -42,9 +42,9 @@
>>>   {"return": {}}
>>>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, =
"event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}=
}
>>>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, =
"event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}=
}
>>> -{"return": {}}
>>>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, =
"event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "job0"}}
>>>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, =
"event": "BLOCK_JOB_READY", "data": {"device": "job0", "len": 0, "offset"=
: 0, "speed": 0, "type": "commit"}}
>>> +{"return": {}}
>>>   {"error": {"class": "GenericError", "desc": "Node 'drv0' is busy: b=
lock device is in use by block job: commit"}}
>>>   {"return": {}}
>>>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, =
"event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "job0"}=
}
>>
>> and
>>
>>> 211 5s ...        [17:11:54] [17:11:58] - output mismatch (see 211.ou=
t.bad)
>>> --- tests/qemu-iotests/211.out 2019-05-22 19:58:34.870273427 +0200
>>> +++ build/tests/qemu-iotests/211.out.bad       2019-05-27 17:11:58.25=
9348827 +0200
>>> @@ -55,8 +55,7 @@
>>>   virtual size: 32 MiB (33554432 bytes)
>>>   cluster_size: 1048576
>>>  =20
>>> -[{ "start": 0, "length": 3072, "depth": 0, "zero": false, "data": tr=
ue, "offset": 1024},
>>> -{ "start": 3072, "length": 33551360, "depth": 0, "zero": true, "data=
": true, "offset": 4096}]
>>> +[{ "start": 0, "length": 33554432, "depth": 0, "zero": false, "data"=
: true, "offset": 1024}]
>>>  =20
>>>   =3D=3D=3D Invalid BlockdevRef =3D=3D=3D
>>
>> Doesn=E2=80=99t look too bad, but still, broken iotests are broken iot=
ests. :/
>>
>=20
>=20
> You are right, thanks for pointing to this! So, here is my investigatio=
n:
>=20
> about 211: aha, looks like I just didn't implement metadata preallocati=
on detection for vdi,
> and default behavior is changed. I don't know vdi code, but after fast =
look, it seems that
> it may be as simple as (and it fixes the test):
>=20
>=20
> diff --git a/block/vdi.c b/block/vdi.c
> index d7ef6628e7..a72333dcf4 100644
> --- a/block/vdi.c
> +++ b/block/vdi.c
> @@ -542,7 +542,9 @@ static int coroutine_fn vdi_co_block_status(BlockDr=
iverState *bs,
>       *map =3D s->header.offset_data + (uint64_t)bmap_entry * s->block_=
size +
>           index_in_block;
>       *file =3D bs->file->bs;
> -    return BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID;
> +
> +    return BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID |
> +            (s->header.image_type =3D=3D VDI_TYPE_STATIC ? BDRV_BLOCK_=
RECURSE : 0);
>   }

That would be the same as what this patch implements for qcow2, yes.

> Or, we can rollback vdi behavior to pre-patch state:
>=20
>=20
>=20
> diff --git a/block/vdi.c b/block/vdi.c
> index d7ef6628e7..074256d845 100644
> --- a/block/vdi.c
> +++ b/block/vdi.c
> @@ -542,7 +542,7 @@ static int coroutine_fn vdi_co_block_status(BlockDr=
iverState *bs,
>       *map =3D s->header.offset_data + (uint64_t)bmap_entry * s->block_=
size +
>           index_in_block;
>       *file =3D bs->file->bs;
> -    return BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID;
> +    return BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID | BDRV_BLOCK_RECU=
RSE;
>   }
>=20
>   static int coroutine_fn
>=20
>=20
>=20
>=20
> about 141: aha, it's a difference between qcow2 and qed, because of cha=
nged io sequence for
> qcow2, as Kevin described "What happens is that qcow2_detect_metadata_p=
reallocation() causes
> additional I/O by reading in the refcount block.". I think correct way =
to fix it is to filter
> {"return": {}} elements, as we can't be sure where they occur among eve=
nts:
>=20
>=20
>=20
>=20
> diff --git a/tests/qemu-iotests/141 b/tests/qemu-iotests/141
> index 2197a82d45..2704695921 100755
> --- a/tests/qemu-iotests/141
> +++ b/tests/qemu-iotests/141
> @@ -58,16 +58,20 @@ test_blockjob()
>                 }}}" \
>           'return'
>=20
> +    # We may get {"return": {}} result of the following command among =
events in
> +    # the following output or after all events in the next output (if =
$2 is an
> +    # event, not 'return'). So, filter it here and in the following ou=
tput to
> +    # avoid race in test output.
>       _send_qemu_cmd $QEMU_HANDLE \
>           "$1" \
>           "$2" \
> -        | _filter_img_create
> +        | _filter_img_create | _filter_qmp_empty_return
>=20
>       # We want this to return an error because the block job is still =
running
>       _send_qemu_cmd $QEMU_HANDLE \
>           "{'execute': 'blockdev-del',
>             'arguments': {'node-name': 'drv0'}}" \
> -        'error' | _filter_generated_node_ids
> +        'error' | _filter_generated_node_ids | _filter_qmp_empty_retur=
n
>=20
>       _send_qemu_cmd $QEMU_HANDLE \
>           "{'execute': 'block-job-cancel',
> diff --git a/tests/qemu-iotests/141.out b/tests/qemu-iotests/141.out
> index 4d71d9dcae..dbd3bdef6c 100644
> --- a/tests/qemu-iotests/141.out
> +++ b/tests/qemu-iotests/141.out
> @@ -10,7 +10,6 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1=
048576 backing_file=3DTEST_DIR/m.
>   Formatting 'TEST_DIR/o.IMGFMT', fmt=3DIMGFMT size=3D1048576 backing_f=
ile=3DTEST_DIR/t.IMGFMT backing_fmt=3DIMGFMT
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "e=
vent": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "e=
vent": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
> -{"return": {}}
>   {"error": {"class": "GenericError", "desc": "Node drv0 is in use"}}
>   {"return": {}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "e=
vent": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "job0"}}=

> @@ -27,7 +26,6 @@ Formatting 'TEST_DIR/o.IMGFMT', fmt=3DIMGFMT size=3D1=
048576 backing_file=3DTEST_DIR/t.
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "e=
vent": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "e=
vent": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "job0"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "e=
vent": "BLOCK_JOB_READY", "data": {"device": "job0", "len": 0, "offset": =
0, "speed": 0, "type": "mirror"}}
> -{"return": {}}
>   {"error": {"class": "GenericError", "desc": "Node 'drv0' is busy: blo=
ck device is in use by block job: mirror"}}
>   {"return": {}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "e=
vent": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "job0"}}
> @@ -42,7 +40,6 @@ Formatting 'TEST_DIR/o.IMGFMT', fmt=3DIMGFMT size=3D1=
048576 backing_file=3DTEST_DIR/t.
>   {"return": {}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "e=
vent": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "e=
vent": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
> -{"return": {}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "e=
vent": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "job0"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "e=
vent": "BLOCK_JOB_READY", "data": {"device": "job0", "len": 0, "offset": =
0, "speed": 0, "type": "commit"}}
>   {"error": {"class": "GenericError", "desc": "Node 'drv0' is busy: blo=
ck device is in use by block job: commit"}}
> @@ -61,7 +58,6 @@ wrote 1048576/1048576 bytes at offset 0
>   {"return": {}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "e=
vent": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "e=
vent": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
> -{"return": {}}
>   {"error": {"class": "GenericError", "desc": "Node drv0 is in use"}}
>   {"return": {}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "e=
vent": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "job0"}}=

> @@ -77,7 +73,6 @@ wrote 1048576/1048576 bytes at offset 0
>   {"return": {}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "e=
vent": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "e=
vent": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
> -{"return": {}}
>   {"error": {"class": "GenericError", "desc": "Node drv0 is in use"}}
>   {"return": {}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "e=
vent": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "job0"}}=

> diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/comm=
on.filter
> index 35fddc746f..8e9235d6fe 100644
> --- a/tests/qemu-iotests/common.filter
> +++ b/tests/qemu-iotests/common.filter
> @@ -219,5 +219,10 @@ _filter_nbd()
>           -e 's#\(foo\|PORT/\?\|.sock\): Failed to .*$#\1#'
>   }
>=20
> +_filter_qmp_empty_return()
> +{
> +    grep -v '{"return": {}}'
> +}
> +
>   # make sure this script returns success
>   true

I=E2=80=99m not really a fan of this, but I don=E2=80=99t think there is =
an alternative
for a bash test.  So that does look like the best solution for me.

Max


--ojCUv5fCzmvOXHMwFnhaYcH6odQKigyXO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAlztWCYACgkQ9AfbAGHV
z0B90gf/SKvOZxqBiE+kxVbVLL/45BUtrgpRSEBOwSUk2kplmwWrfij2AepAZU/U
IP06uyHtM++5zv618JeMgRgiYV2DIhTRDJaCQRxapAECu6QjelojKnHRUNvHq8O7
Ub8AUVHKA3YKesuElev/aHCDLFHOrJEC1HllgrifxL5lIwyJEoZIfanmHs45R7D1
rCVxKheu1hPGWosMXQH/HgGQx+vaCIcG7918L4DO1+P+prSaqQk43ATlNyZ/79fE
ChGw1VICfYsei0FVEVUBc2PoMV6CtyUF88PbBqbk2tgSA+xO8vgvnFTrhXGZ3OFK
tfVacmuSkdLK5SBoTNzkQ3Xf7M0EjA==
=qNmt
-----END PGP SIGNATURE-----

--ojCUv5fCzmvOXHMwFnhaYcH6odQKigyXO--

