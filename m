Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D598131369
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 19:05:29 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46613 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWky8-0000XZ-Pk
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 13:05:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hWkvp-0007zv-6C
	for qemu-devel@nongnu.org; Fri, 31 May 2019 13:03:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hWkvn-0003Un-OP
	for qemu-devel@nongnu.org; Fri, 31 May 2019 13:03:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40476)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hWkvk-0003KD-Ds; Fri, 31 May 2019 13:03:00 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 886EFC05001F;
	Fri, 31 May 2019 17:02:54 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BECA19C69;
	Fri, 31 May 2019 17:02:53 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	"qemu-block@nongnu.org" <qemu-block@nongnu.org>
References: <20190410202033.28617-1-mreitz@redhat.com>
	<20190410202033.28617-3-mreitz@redhat.com>
	<5a335159-8a98-5c60-657d-920e1eb81065@virtuozzo.com>
	<47fb9429-eb34-ab15-e370-0a38070303be@redhat.com>
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
Message-ID: <80e51147-2575-5fd5-2b82-46f7ce7ddcce@redhat.com>
Date: Fri, 31 May 2019 19:02:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <47fb9429-eb34-ab15-e370-0a38070303be@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="yUjkVT49kWvPRzJjTKHFo0WO3oipwsrv9"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 31 May 2019 17:02:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v4 02/11] block: Filtered children access
 functions
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
Cc: Kevin Wolf <kwolf@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yUjkVT49kWvPRzJjTKHFo0WO3oipwsrv9
From: Max Reitz <mreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Cc: Kevin Wolf <kwolf@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Message-ID: <80e51147-2575-5fd5-2b82-46f7ce7ddcce@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v4 02/11] block: Filtered children access
 functions
References: <20190410202033.28617-1-mreitz@redhat.com>
 <20190410202033.28617-3-mreitz@redhat.com>
 <5a335159-8a98-5c60-657d-920e1eb81065@virtuozzo.com>
 <47fb9429-eb34-ab15-e370-0a38070303be@redhat.com>
In-Reply-To: <47fb9429-eb34-ab15-e370-0a38070303be@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 31.05.19 18:26, Max Reitz wrote:
> On 16.04.19 12:02, Vladimir Sementsov-Ogievskiy wrote:
>> 10.04.2019 23:20, Max Reitz wrote:
>>> What bs->file and bs->backing mean depends on the node.  For filter
>>> nodes, both signify a node that will eventually receive all R/W
>>> accesses.  For format nodes, bs->file contains metadata and data, and=

>>> bs->backing will not receive writes -- instead, writes are COWed to
>>> bs->file.  Usually.
>>>
>>> In any case, it is not trivial to guess what a child means exactly wi=
th
>>> our currently limited form of expression.  It is better to introduce
>>> some functions that actually guarantee a meaning:
>>>
>>> - bdrv_filtered_cow_child() will return the child that receives reque=
sts
>>>    filtered through COW.  That is, reads may or may not be forwarded
>>>    (depending on the overlay's allocation status), but writes never g=
o to
>>>    this child.
>>>
>>> - bdrv_filtered_rw_child() will return the child that receives reques=
ts
>>>    filtered through some very plain process.  Reads and writes issued=
 to
>>>    the parent will go to the child as well (although timing, etc. may=
 be
>>>    modified).
>>>
>>> - All drivers but quorum (but quorum is pretty opaque to the general
>>>    block layer anyway) always only have one of these children: All re=
ad
>>>    requests must be served from the filtered_rw_child (if it exists),=
 so
>>>    if there was a filtered_cow_child in addition, it would not receiv=
e
>>>    any requests at all.
>>>    (The closest here is mirror, where all requests are passed on to t=
he
>>>    source, but with write-blocking, write requests are "COWed" to the=

>>>    target.  But that just means that the target is a special child th=
at
>>>    cannot be introspected by the generic block layer functions, and t=
hat
>>>    source is a filtered_rw_child.)
>>>    Therefore, we can also add bdrv_filtered_child() which returns tha=
t
>>>    one child (or NULL, if there is no filtered child).
>>>
>>> Also, many places in the current block layer should be skipping filte=
rs
>>> (all filters or just the ones added implicitly, it depends) when goin=
g
>>> through a block node chain.  They do not do that currently, but this
>>> patch makes them.
>>>
>>> One example for this is qemu-img map, which should skip filters and o=
nly
>>> look at the COW elements in the graph.  The change to iotest 204's
>>> reference output shows how using blkdebug on top of a COW node used t=
o
>>> make qemu-img map disregard the rest of the backing chain, but with t=
his
>>> patch, the allocation in the base image is reported correctly.
>>>
>>> Furthermore, a note should be made that sometimes we do want to acces=
s
>>> bs->backing directly.  This is whenever the operation in question is =
not
>>> about accessing the COW child, but the "backing" child, be it COW or
>>> not.  This is the case in functions such as bdrv_open_backing_file() =
or
>>> whenever we have to deal with the special behavior of @backing as a
>>> blockdev option, which is that it does not default to null like all
>>> other child references do.
>>>
>>> Finally, the query functions (query-block and query-named-block-nodes=
)
>>> are modified to return any filtered child under "backing", not just
>>> bs->backing or COW children.  This is so that filters do not interrup=
t
>>> the reported backing chain.  This changes the output of iotest 184, a=
s
>>> the throttled node now appears as a backing child.
>>>
>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>> ---
>>>   qapi/block-core.json           |   4 +
>>>   include/block/block.h          |   1 +
>>>   include/block/block_int.h      |  40 +++++--
>>>   block.c                        | 210 +++++++++++++++++++++++++++---=
---
>>>   block/backup.c                 |   8 +-
>>>   block/block-backend.c          |  16 ++-
>>>   block/commit.c                 |  33 +++---
>>>   block/io.c                     |  45 ++++---
>>>   block/mirror.c                 |  21 ++--
>>>   block/qapi.c                   |  30 +++--
>>>   block/stream.c                 |  13 +-
>>>   blockdev.c                     |  88 +++++++++++---
>>>   migration/block-dirty-bitmap.c |   4 +-
>>>   nbd/server.c                   |   6 +-
>>>   qemu-img.c                     |  29 ++---
>>>   tests/qemu-iotests/184.out     |   7 +-
>>>   tests/qemu-iotests/204.out     |   1 +
>>>   17 files changed, 411 insertions(+), 145 deletions(-)
>>
>> really huge... didn't you consider conversion file-by-file?
>>
>> [..]
>>
>>> diff --git a/block.c b/block.c
>>> index 16615bc876..e8f6febda0 100644
>>> --- a/block.c
>>> +++ b/block.c
>>
>> [..]
>>
>>>  =20
>>> @@ -3467,14 +3469,17 @@ static int bdrv_reopen_parse_backing(BDRVReop=
enState *reopen_state,
>>>       /*
>>>        * Find the "actual" backing file by skipping all links that po=
int
>>>        * to an implicit node, if any (e.g. a commit filter node).
>>> +     * We cannot use any of the bdrv_skip_*() functions here because=

>>> +     * those return the first explicit node, while we are looking fo=
r
>>> +     * its overlay here.
>>>        */
>>>       overlay_bs =3D bs;
>>> -    while (backing_bs(overlay_bs) && backing_bs(overlay_bs)->implici=
t) {
>>> -        overlay_bs =3D backing_bs(overlay_bs);
>>> +    while (overlay_bs->backing && bdrv_filtered_bs(overlay_bs)->impl=
icit) {
>>
>> So, you don't want to skip implicit filters with 'file' child? Then, w=
hy not to use
>> child_bs(overlay_bs->backing), like in following if condition?
>=20
> On second thought, I actually think this version is wrong in the other =
way.
>=20
> There needs to be a bs with bs->backing !=3D NULL and !bs->implicit
> somewhere in the chain.

(Actually, no, the bs->backing node is @bs)

> We try to find that node.  It doesn=E2=80=99t matter
> what=E2=80=99s on top of it, though,  If there are implicit node (which=
 we try
> to skip here), the user isn=E2=80=99t aware of them.  Consequentially, =
it
> doesn=E2=80=99t matter whether these implicit nodes use bs->backing or =
bs->file,
> we just need to skip them.
>=20
> What is wrong is the =E2=80=9Cwhile (overlay_bs->backing ...)=E2=80=9D.=
  That needs to
> be =E2=80=9Cwhile (bdrv_filtered_bs(overlay_bs) ...)=E2=80=9D.

I just saw my reply where I noticed this before...  So nothing too new th=
en.

Max


--yUjkVT49kWvPRzJjTKHFo0WO3oipwsrv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAlzxXjsACgkQ9AfbAGHV
z0BwZQgAw9sg78aph7oKAr+0EVbfrBZlYuErRoeABLxS0OFyqVzefcsFZlK6e2KH
F2HlW5eplDsBqcMlzoP+9PYwVRodPOMX691FBt8x3Js5Y4Kj9goqwRKAN+lLlMJn
YcusivcEPx0HrBo4Xc4mwIyjJIbo8S40JfyVrRYrLpX+dNwcsn1eupNJbMohNUsc
YRF4vxzxWWQJhoj9MxZOCFnCqD25naWFWxXCxKTLTNsREb9D6084v2k+zhSImYew
cCCRlq7beGgzGpezsINdfz2Y8i69pMre0e6bJFhzpiREU0x7tYrIWyCfSWGsKXly
EnoemhHG5Kx1NiLrJ2celCAweHgLyQ==
=5q5r
-----END PGP SIGNATURE-----

--yUjkVT49kWvPRzJjTKHFo0WO3oipwsrv9--

