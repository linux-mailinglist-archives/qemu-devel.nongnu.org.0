Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C93761DEA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 13:47:29 +0200 (CEST)
Received: from localhost ([::1]:40604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkS7D-0003JV-G6
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 07:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52667)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hkS52-0002Yl-Gh
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 07:45:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hkS51-00015e-Gh
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 07:45:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34038)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hkS4z-00011y-6e; Mon, 08 Jul 2019 07:45:09 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 683A37FDEE;
 Mon,  8 Jul 2019 11:45:07 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-204-127.brq.redhat.com
 [10.40.204.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42FFE579A0;
 Mon,  8 Jul 2019 11:44:56 +0000 (UTC)
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20190703215542.16123-1-jsnow@redhat.com>
 <20190703215542.16123-10-jsnow@redhat.com>
 <b73e23a0-5454-c7d4-f1b3-da99e07b1edb@redhat.com>
 <987b304e-2ad6-3342-3825-5f8e7b7dd06a@redhat.com>
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
Message-ID: <7ea8d028-dab7-8067-6f25-5029dafaed56@redhat.com>
Date: Mon, 8 Jul 2019 13:44:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <987b304e-2ad6-3342-3825-5f8e7b7dd06a@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MbxWfMD6pakWidUV6y9Of35re2srhfZZ0"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 08 Jul 2019 11:45:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 09/18] block/dirty-bitmap: add
 bdrv_dirty_bitmap_merge_internal
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 vsementsov@virtuozzo.com, Juan Quintela <quintela@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MbxWfMD6pakWidUV6y9Of35re2srhfZZ0
Content-Type: multipart/mixed; boundary="b50rp1c6S1TjPTZP8L3wZOBulovkVvRdQ";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, vsementsov@virtuozzo.com,
 Xie Changlong <xiechanglong.d@gmail.com>
Message-ID: <7ea8d028-dab7-8067-6f25-5029dafaed56@redhat.com>
Subject: Re: [PATCH v2 09/18] block/dirty-bitmap: add
 bdrv_dirty_bitmap_merge_internal
References: <20190703215542.16123-1-jsnow@redhat.com>
 <20190703215542.16123-10-jsnow@redhat.com>
 <b73e23a0-5454-c7d4-f1b3-da99e07b1edb@redhat.com>
 <987b304e-2ad6-3342-3825-5f8e7b7dd06a@redhat.com>
In-Reply-To: <987b304e-2ad6-3342-3825-5f8e7b7dd06a@redhat.com>

--b50rp1c6S1TjPTZP8L3wZOBulovkVvRdQ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05.07.19 18:45, John Snow wrote:
>=20
>=20
> On 7/4/19 12:49 PM, Max Reitz wrote:
>> On 03.07.19 23:55, John Snow wrote:

[...]

>>> +
>>> +/**
>>> + * bdrv_dirty_bitmap_merge_internal: merge src into dest.
>>> + * Does NOT check bitmap permissions; not suitable for use as public=
 API.
>>> + *
>>> + * @backup: If provided, make a copy of dest here prior to merge.
>>> + * @lock: If true, lock and unlock bitmaps on the way in/out.
>>> + * returns true if the merge succeeded; false if unattempted.
>>> + */
>>> +bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
>>> +                                      const BdrvDirtyBitmap *src,
>>> +                                      HBitmap **backup,
>>> +                                      bool lock)
>>> +{
>>> +    bool ret;
>>> +
>>> +    if (lock) {
>>> +        qemu_mutex_lock(dest->mutex);
>>> +        if (src->mutex !=3D dest->mutex) {
>>> +            qemu_mutex_lock(src->mutex);
>>> +        }
>>> +    }
>>> +
>>
>> Why not check for INCONSISTENT and RO still?
>>
>> Max
>>
>=20
> Well. "why", I guess. The user-facing API will always use the
> non-internal version. This is the scary dangerous version that you don'=
t
> call unless you are Very Sure You Know What You're Doing.
>=20
> I guess I just intended for the suitability checking to happen in
> bdrv_dirty_bitmap_merge, and this is the implementation that you can
> shoot yourself in the foot with if you'd like.

I=E2=80=99m asking because the reasoning behind being allowed to call thi=
s
function is that BUSY means someone who is not the monitor has exclusive
access to the bitmap, and that someone is the caller of this function.

There is no justification for why it should be allowed to call this
function for bitmaps that are inconsistent or read-only.  If someone
needs that, they should justify it with a patch, I think.

Max


--b50rp1c6S1TjPTZP8L3wZOBulovkVvRdQ--

--MbxWfMD6pakWidUV6y9Of35re2srhfZZ0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl0jLLYACgkQ9AfbAGHV
z0Aqrwf9G2aomPmyJM/QQwk8aUxfW0s/SsPEAQod3vMQcbPnvRYzx7UPDbua1dZj
IACQ2p1BdYLzfvigl12DO6ZHHJODf/9mnR92V+PQ4xfUwI9nSmfVhEg5fdxHqthw
umR7oChBgL26VAMLhWdGp0QZAUGWEN26CgWTIp92xBttuGZ5QoiOzaLIQ8ukc8D1
pW9r4n5E6N1AWXsyXIXFIuyPxyRjMu2+vsrTrDpn76CXaX1wF3PIYO9cv1OUz6F0
e/rQO3lnlcSalCA92kEj/EDtF73AaJwXcCh8XzVLiI5DBfF8+grJERjqraa3eGBZ
MSv7Zg832m5VKST4t4qTVsmpXdsf8w==
=O41G
-----END PGP SIGNATURE-----

--MbxWfMD6pakWidUV6y9Of35re2srhfZZ0--

