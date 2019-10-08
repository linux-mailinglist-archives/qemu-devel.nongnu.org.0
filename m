Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70110CF69F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 11:59:52 +0200 (CEST)
Received: from localhost ([::1]:53214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHmHW-0000eY-P6
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 05:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39477)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iHmEZ-0007R0-EV
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 05:56:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iHmEW-00061N-1x
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 05:56:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37274)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iHmES-0005zY-Vh; Tue, 08 Oct 2019 05:56:41 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 24E03308FBA0;
 Tue,  8 Oct 2019 09:56:40 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.207])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C16EF600CE;
 Tue,  8 Oct 2019 09:56:33 +0000 (UTC)
Subject: Re: [PATCH 5/6] block/block-copy: add memory limit
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
References: <20191003171539.12327-1-vsementsov@virtuozzo.com>
 <20191003171539.12327-6-vsementsov@virtuozzo.com>
 <8aa011d7-3f11-2df5-d77e-5c5176ab63ed@redhat.com>
 <49b99621-2d8a-f4a8-d31a-e64a727952a9@virtuozzo.com>
 <8bd41e8a-acfb-8f55-b2d3-ae909dc21ae7@redhat.com>
 <c6cfb56c-970d-ab44-ee93-639c65370dc2@virtuozzo.com>
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
Message-ID: <73390228-76f4-1bc2-3a6f-a99f1422a6d6@redhat.com>
Date: Tue, 8 Oct 2019 11:56:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <c6cfb56c-970d-ab44-ee93-639c65370dc2@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="obUQyX1BMEgyqfXBM1Ie0B60RnhDDyl9K"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 08 Oct 2019 09:56:40 +0000 (UTC)
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "jsnow@redhat.com" <jsnow@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Denis Lunev <den@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--obUQyX1BMEgyqfXBM1Ie0B60RnhDDyl9K
Content-Type: multipart/mixed; boundary="5w9I1VMxCjed7bYvHY1krjOGbiCDvMfR5"

--5w9I1VMxCjed7bYvHY1krjOGbiCDvMfR5
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 08.10.19 11:15, Vladimir Sementsov-Ogievskiy wrote:
> 08.10.2019 12:03, Max Reitz wrote:
>> On 07.10.19 19:10, Vladimir Sementsov-Ogievskiy wrote:
>>> 07.10.2019 18:27, Max Reitz wrote:
>>>> On 03.10.19 19:15, Vladimir Sementsov-Ogievskiy wrote:
>>>>> Currently total allocation for parallel requests to block-copy inst=
ance
>>>>> is unlimited. Let's limit it to 128 MiB.
>>>>>
>>>>> For now block-copy is used only in backup, so actually we limit tot=
al
>>>>> allocation for backup job.
>>>>>
>>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.c=
om>
>>>>> ---
>>>>>    include/block/block-copy.h | 3 +++
>>>>>    block/block-copy.c         | 5 +++++
>>>>>    2 files changed, 8 insertions(+)
>>>>>
>>>>> diff --git a/include/block/block-copy.h b/include/block/block-copy.=
h
>>>>> index e2e135ff1b..bb666e7068 100644
>>>>> --- a/include/block/block-copy.h
>>>>> +++ b/include/block/block-copy.h
>>>>> @@ -16,6 +16,7 @@
>>>>>    #define BLOCK_COPY_H
>>>>>   =20
>>>>>    #include "block/block.h"
>>>>> +#include "qemu/co-shared-amount.h"
>>>>>   =20
>>>>>    typedef struct BlockCopyInFlightReq {
>>>>>        int64_t start_byte;
>>>>> @@ -69,6 +70,8 @@ typedef struct BlockCopyState {
>>>>>         */
>>>>>        ProgressResetCallbackFunc progress_reset_callback;
>>>>>        void *progress_opaque;
>>>>> +
>>>>> +    QemuCoSharedAmount *mem;
>>>>>    } BlockCopyState;
>>>>>   =20
>>>>>    BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChil=
d *target,
>>>>> diff --git a/block/block-copy.c b/block/block-copy.c
>>>>> index cc49d2345d..e700c20d0f 100644
>>>>> --- a/block/block-copy.c
>>>>> +++ b/block/block-copy.c
>>>>> @@ -21,6 +21,7 @@
>>>>>    #include "qemu/units.h"
>>>>>   =20
>>>>>    #define BLOCK_COPY_MAX_COPY_RANGE (16 * MiB)
>>>>> +#define BLOCK_COPY_MAX_MEM (128 * MiB)
>>>>>   =20
>>>>>    static void coroutine_fn block_copy_wait_inflight_reqs(BlockCopy=
State *s,
>>>>>                                                           int64_t s=
tart,
>>>>> @@ -64,6 +65,7 @@ void block_copy_state_free(BlockCopyState *s)
>>>>>        }
>>>>>   =20
>>>>>        bdrv_release_dirty_bitmap(s->source->bs, s->copy_bitmap);
>>>>> +    qemu_co_shared_amount_free(s->mem);
>>>>>        g_free(s);
>>>>>    }
>>>>>   =20
>>>>> @@ -95,6 +97,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *s=
ource, BdrvChild *target,
>>>>>            .cluster_size =3D cluster_size,
>>>>>            .len =3D bdrv_dirty_bitmap_size(copy_bitmap),
>>>>>            .write_flags =3D write_flags,
>>>>> +        .mem =3D qemu_co_shared_amount_new(BLOCK_COPY_MAX_MEM),
>>>>>        };
>>>>>   =20
>>>>>        s->copy_range_size =3D QEMU_ALIGN_DOWN(max_transfer, cluster=
_size),
>>>>> @@ -316,7 +319,9 @@ int coroutine_fn block_copy(BlockCopyState *s,
>>>>>   =20
>>>>>            bdrv_reset_dirty_bitmap(s->copy_bitmap, start, chunk_end=
 - start);
>>>>>   =20
>>>>> +        qemu_co_get_amount(s->mem, chunk_end - start);
>>>>
>>>> Now that I see it like this, maybe the name is too short.  This soun=
ds
>>>> like it was trying to get some amount of coroutines.
>>>>
>>>> Would =E2=80=9Cqemu_co_get_from_shared_amount=E2=80=9D be too long? =
 (Something like
>>>> qemu_co_sham_alloc() would be funny, but maybe not.  :-)  Or maybe
>>>> exactly because it=E2=80=9Ds funny.)
>>>>
>>>
>>> hmm sham may be interpreted as shared memory, not only like shame..
>>
>> =E2=80=9Csham=E2=80=9D is also a word by itself. :-)
>=20
> Hmm didn't know, me go to google translate. OK, sham looks a lot nicer =
than shame)
>=20
>>
>>> And if we call it _alloc, the opposite should be _free, but how to
>>> distinguish it from freeing the whole object? Hmm, use create/destroy=
 for
>>> the whole object maybe.
>>>
>>> May be, drop "qemu_" ? It's not very informative. Or may be drop "co_=
"?.
>>>
>>> I don't like shaming my shared amount :)
>>
>> It=E2=80=99s worse calling it all a sham.
>>
>>> May be, we should imagine, what are we allocating? May be balls?
>>>
>>> struct BallAllocator
>>>
>>> ball_allocator_create
>>> ball_allocator_destroy
>>>
>>> co_try_alloc_balls
>>> co_alloc_balls
>>> co_free_balls
>>>
>>> Or bars? Or which thing may be used for funny naming and to not inter=
sect
>>> with existing concepts like memory?
>>
>> I love it (thanks for making my morning), but I fear it may be
>> interpreted as risqu=C3=A9.
>>
>> Maybe just shres for shared resource?  So alloc_from_shres?
>>
>=20
> OK for me. But.. How to name _free function than?
>=20
> struct SharedResource
>=20
> shres_create
> shres_destroy
>=20
> co_try_alloc_from_shres
> co_alloc_from_shres
> co_free_???
>=20
> co_free_res_alloced_from_shres ? :)
>=20
> or
>=20
> co_try_get_from_shres
> co_get_from_shres
> co_put_to_shres

Sounds good to me.

Max


--5w9I1VMxCjed7bYvHY1krjOGbiCDvMfR5--

--obUQyX1BMEgyqfXBM1Ie0B60RnhDDyl9K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl2cXVAACgkQ9AfbAGHV
z0D3Awf9FgR6C1FacazRWlO6nL/uAP3F7pkczckSN3hpeSglCSG3FmN/FoX3yCmH
fLjvMJ+fNGYt3XirvyiZiLcn5yRp1I6uo8UMO/oxxinr2YBDWaLv9Znia3y8z9eC
4MUGwvRPBsJDGC9nWmZseipspAHAkNu0Ctb/mCSnyU1axxw1JeM4C2x5Ts6hznE1
I4uC/frgfs6s4nRB2jXgQJC5V1l5AhxJoBuSqoddIt5nVmw/N38wK2YZDEZ3ymmO
BeO2Wdh10j4AVkBzslA/p0sJBdDomQVAPPjNWm2yHHCS+66BeRZJ714T1AmNtD/w
ThGD4AAxD7pGtnWRe3t57cYSZLvKzw==
=5t7D
-----END PGP SIGNATURE-----

--obUQyX1BMEgyqfXBM1Ie0B60RnhDDyl9K--

