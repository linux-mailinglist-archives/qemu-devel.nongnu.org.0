Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B5CAE4C9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 09:44:14 +0200 (CEST)
Received: from localhost ([::1]:34656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7aou-0007no-W7
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 03:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52030)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i7anu-0007Hf-Nl
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 03:43:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i7ant-0002uc-AX
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 03:43:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56918)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i7anp-0002rD-85; Tue, 10 Sep 2019 03:43:05 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 18B1318CB8EE;
 Tue, 10 Sep 2019 07:43:03 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-90.ams2.redhat.com
 [10.36.117.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B08AB5D9C9;
 Tue, 10 Sep 2019 07:42:54 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
References: <20190830161228.54238-1-vsementsov@virtuozzo.com>
 <20190830161228.54238-5-vsementsov@virtuozzo.com>
 <ae856032-2d6f-adb8-939b-410708dea596@redhat.com>
 <01bc8974-b9a5-8312-fe24-e2fbe87ab13d@virtuozzo.com>
 <e94365cd-3bdf-4055-10de-abad4f65225b@redhat.com>
 <d4b6869a-a711-f911-2b29-c7062aa44aa6@virtuozzo.com>
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
Message-ID: <80720d39-b9d6-d693-0f6a-0a078d6056e0@redhat.com>
Date: Tue, 10 Sep 2019 09:42:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d4b6869a-a711-f911-2b29-c7062aa44aa6@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rtqkbBSkey69upUas9LqubsMno4vs3HSd"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Tue, 10 Sep 2019 07:43:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v10 04/14] block/backup: introduce
 BlockCopyState
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
Cc: "fam@euphon.net" <fam@euphon.net>, "kwolf@redhat.com" <kwolf@redhat.com>,
 Denis Lunev <den@virtuozzo.com>,
 "wencongyang2@huawei.com" <wencongyang2@huawei.com>,
 "xiechanglong.d@gmail.com" <xiechanglong.d@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "armbru@redhat.com" <armbru@redhat.com>, "jsnow@redhat.com" <jsnow@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rtqkbBSkey69upUas9LqubsMno4vs3HSd
Content-Type: multipart/mixed; boundary="y2BT8wmp2butFe07MQ5VzjNK93fkFS2xJ";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "xiechanglong.d@gmail.com" <xiechanglong.d@gmail.com>,
 "wencongyang2@huawei.com" <wencongyang2@huawei.com>,
 "fam@euphon.net" <fam@euphon.net>, "stefanha@redhat.com"
 <stefanha@redhat.com>, "jsnow@redhat.com" <jsnow@redhat.com>,
 "kwolf@redhat.com" <kwolf@redhat.com>, Denis Lunev <den@virtuozzo.com>
Message-ID: <80720d39-b9d6-d693-0f6a-0a078d6056e0@redhat.com>
Subject: Re: [PATCH v10 04/14] block/backup: introduce BlockCopyState
References: <20190830161228.54238-1-vsementsov@virtuozzo.com>
 <20190830161228.54238-5-vsementsov@virtuozzo.com>
 <ae856032-2d6f-adb8-939b-410708dea596@redhat.com>
 <01bc8974-b9a5-8312-fe24-e2fbe87ab13d@virtuozzo.com>
 <e94365cd-3bdf-4055-10de-abad4f65225b@redhat.com>
 <d4b6869a-a711-f911-2b29-c7062aa44aa6@virtuozzo.com>
In-Reply-To: <d4b6869a-a711-f911-2b29-c7062aa44aa6@virtuozzo.com>

--y2BT8wmp2butFe07MQ5VzjNK93fkFS2xJ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 09.09.19 17:11, Vladimir Sementsov-Ogievskiy wrote:
> 09.09.2019 17:24, Max Reitz wrote:
>> On 09.09.19 16:12, Vladimir Sementsov-Ogievskiy wrote:
>>> 09.09.2019 15:59, Max Reitz wrote:
>>>> On 30.08.19 18:12, Vladimir Sementsov-Ogievskiy wrote:
>>>>> Split copying code part from backup to "block-copy", including sepa=
rate
>>>>> state structure and function renaming. This is needed to share it w=
ith
>>>>> backup-top filter driver in further commits.
>>>>>
>>>>> Notes:
>>>>>
>>>>> 1. As BlockCopyState keeps own BlockBackend objects, remaining
>>>>> job->common.blk users only use it to get bs by blk_bs() call, so cl=
ear
>>>>> job->commen.blk permissions set in block_job_create and add
>>>>> job->source_bs to be used instead of blk_bs(job->common.blk), to ke=
ep
>>>>> it more clear which bs we use when introduce backup-top filter in
>>>>> further commit.
>>>>>
>>>>> 2. Rename s/initializing_bitmap/skip_unallocated/ to sound a bit be=
tter
>>>>> as interface to BlockCopyState
>>>>>
>>>>> 3. Split is not very clean: there left some duplicated fields, back=
up
>>>>> code uses some BlockCopyState fields directly, let's postpone it fo=
r
>>>>> further improvements and keep this comment simpler for review.
>>>>>
>>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.c=
om>
>>>>> ---
>>>>>    block/backup.c     | 357 ++++++++++++++++++++++++++++-----------=
------
>>>>>    block/trace-events |  12 +-
>>>>>    2 files changed, 231 insertions(+), 138 deletions(-)
>>>>>
>>>>> diff --git a/block/backup.c b/block/backup.c
>>>>> index abb5099fa3..002dee4d7f 100644
>>>>> --- a/block/backup.c
>>>>> +++ b/block/backup.c
>>>>> @@ -35,12 +35,43 @@ typedef struct CowRequest {
>>>>>        CoQueue wait_queue; /* coroutines blocked on this request */=

>>>>>    } CowRequest;
>>>>>   =20
>>>>> +typedef void (*ProgressBytesCallbackFunc)(int64_t bytes, void *opa=
que);
>>>>> +typedef void (*ProgressResetCallbackFunc)(void *opaque);
>>>>> +typedef struct BlockCopyState {
>>>>> +    BlockBackend *source;
>>>>> +    BlockBackend *target;
>>>>> +    BdrvDirtyBitmap *copy_bitmap;
>>>>> +    int64_t cluster_size;
>>>>> +    bool use_copy_range;
>>>>> +    int64_t copy_range_size;
>>>>> +    uint64_t len;
>>>>> +
>>>>> +    BdrvRequestFlags write_flags;
>>>>> +
>>>>> +    /*
>>>>> +     * skip_unallocated: if true, on copy operation firstly reset =
areas
>>>>> +     * unallocated in top layer of source (and then of course don'=
t copy
>>>>> +     * corresponding clusters). If some bytes reset, call
>>>>> +     * progress_reset_callback.
>>>>> +     */
>>>>
>>>> It isn=E2=80=99t quite clear that this refers to the copy_bitmap.  M=
aybe
>>>> something like
>>>>
>>>> =E2=80=9CIf true, the copy operation prepares a sync=3Dtop job: It s=
cans the
>>>
>>> hmm, now it's not refactored to scan it before copying loop, so it's =
not precise
>>> wording..
>>>
>>>> source's top layer to find all unallocated areas and resets them in =
the
>>>
>>> Not all, but mostly inside block-copy requested area (but may be more=
)
>>
>> Sorry, I meant backup operation.
>>
>>>> copy_bitmap (so they will not be copied).  Whenever any such area is=

>>>> cleared, progress_reset_callback will be invoked.
>>>> Once the whole top layer has been scanned, skip_unallocated is clear=
ed
>>>> and the actual copying begins.=E2=80=9D
>>>
>>> Last sentence sounds like it's a block-copy who will clear skip_unall=
ocated,
>>> but it's not so. It's not very good design and may be refactored in f=
uture,
>>> but for now, I'd better drop last sentence.
>>
>> But wasn=E2=80=99t that the point of this variable?  That it goes back=
 to false
>> once the bitmap is fully initialized?
>=20
> I just want to stress, that block-copy itself (which will be in a separ=
ate file,
> so it would be clean enough, what is block-copy and what is its user) d=
o not clear
> this variable. It of course may track calls to  block_copy_reset_unallo=
cated() and
> clear this variable automatically, but it don't do it now. And your wor=
ding looks
> for me like block-copy code may automatically clear this variable

Hm, OK.

>>
>>>>
>>>> instead?
>>>
>>> Or, what about the following mix:
>>>
>>> Used for job sync=3Dtop mode. If true, block_copy() will reset in cop=
y_bitmap areas
>>> unallocated in top image (so they will not be copied). Whenever any s=
uch area is cleared,
>>> progress_reset_callback will be invoked. User is assumed to call in b=
ackground
>>> block_copy_reset_unallocated() several times to cover the whole copie=
d disk and
>>> then clear skip_unallocated, to prevent extra effort.
>>
>> I don=E2=80=99t know.  The point of this variable is the initializatio=
n of the
>> bitmap.  block-copy only uses this as a hint that it needs to
>> participate in that initialization process, too, and cannot assume the=

>> bitmap to be fully allocated.
>=20
> Hmm, but where is a conflict of this and my wording? IMHO, I just docum=
ented
> exactly what's written in the code.

There=E2=80=99s no conflict because it isn=E2=80=99t mentioned; which is =
the problem I
have with it.

What I was really confused about is who consumes the variable.  It all
becomes much clearer when I take it as a given that all of your
description just is an imperative to block-copy.  That simply wasn=E2=80=99=
t
clear to me.  (Which is why you don=E2=80=99t like my description, precis=
ely
because it tells the story from another POV, namely that of backup.)

Furthermore, I just miss the big picture about it.  Why does the
variable even exist?  I don=E2=80=99t quite like leaving puzzling togethe=
r the
bits to the reader, if we can avoid it.

Max


--y2BT8wmp2butFe07MQ5VzjNK93fkFS2xJ--

--rtqkbBSkey69upUas9LqubsMno4vs3HSd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl13U/wACgkQ9AfbAGHV
z0B4fAf/RnZVvvsknqu4TXhYSC95FhaEQLVyWo3yaiOyBQrWBy+beDe0WUYv6uD0
txW/PAS8Vo7kxF44HB/2OFbuX0Q+ZXJBk4Za+FlbfotYQRC66iotFYMAFKiSxMSp
HG4KrC77jY2zUJSdAF55cHa2wWateBL/UUmrt6gUO6P9V/5EQt1qgkWPs49cZLYx
AqK+pjbkEkUICT+tiCYfAsVPpZhzgOKhqMzmyxy8ADbRdvYV5dv4qBjI5SumdAaJ
q+OG/n7EhdikcPIipplWNunTftMkwHOIEMq6KVRSDIy9iQyNi/VjvWILQHveE/aO
wZJoZXaVxtkPDXS/zGqUzcBW5M5T2w==
=8aXi
-----END PGP SIGNATURE-----

--rtqkbBSkey69upUas9LqubsMno4vs3HSd--

