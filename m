Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4408AEB1F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 15:07:34 +0200 (CEST)
Received: from localhost ([::1]:39676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7frp-0005dj-Ov
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 09:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35892)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i7fqn-000587-PO
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 09:06:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i7fqm-00024I-J9
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 09:06:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45148)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i7fqj-0001yg-TX; Tue, 10 Sep 2019 09:06:26 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2A0613023080;
 Tue, 10 Sep 2019 13:06:25 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-90.ams2.redhat.com
 [10.36.117.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A53AE100194E;
 Tue, 10 Sep 2019 13:06:23 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>
References: <20190809161407.11920-1-mreitz@redhat.com>
 <20190809161407.11920-21-mreitz@redhat.com>
 <20190910115620.GE4446@localhost.localdomain>
 <4fd84192-0078-07e9-b972-2f10030fb15f@redhat.com>
 <20190910124949.GG4446@localhost.localdomain>
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
Message-ID: <1bf4b123-9157-bc94-4d74-c335f0c5e841@redhat.com>
Date: Tue, 10 Sep 2019 15:06:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910124949.GG4446@localhost.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2jrjhvgV2zXsNzygY23x3oYviEKAoQ9vI"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 10 Sep 2019 13:06:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v6 20/42] block/snapshot: Fix fallback
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
--2jrjhvgV2zXsNzygY23x3oYviEKAoQ9vI
Content-Type: multipart/mixed; boundary="QC7tqKkPal4CQY4IzxdYqbA0CkqzAbURZ";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1bf4b123-9157-bc94-4d74-c335f0c5e841@redhat.com>
Subject: Re: [PATCH v6 20/42] block/snapshot: Fix fallback
References: <20190809161407.11920-1-mreitz@redhat.com>
 <20190809161407.11920-21-mreitz@redhat.com>
 <20190910115620.GE4446@localhost.localdomain>
 <4fd84192-0078-07e9-b972-2f10030fb15f@redhat.com>
 <20190910124949.GG4446@localhost.localdomain>
In-Reply-To: <20190910124949.GG4446@localhost.localdomain>

--QC7tqKkPal4CQY4IzxdYqbA0CkqzAbURZ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 10.09.19 14:49, Kevin Wolf wrote:
> Am 10.09.2019 um 14:04 hat Max Reitz geschrieben:
>> On 10.09.19 13:56, Kevin Wolf wrote:
>>> Am 09.08.2019 um 18:13 hat Max Reitz geschrieben:
>>>> If the top node's driver does not provide snapshot functionality and=
 we
>>>> want to fall back to a node down the chain, we need to snapshot all
>>>> non-COW children.  For simplicity's sake, just do not fall back if t=
here
>>>> is more than one such child.
>>>>
>>>> bdrv_snapshot_goto() becomes a bit weird because we may have to redi=
rect
>>>> the actual child pointer, so it only works if the fallback child is
>>>> bs->file or bs->backing (and then we have to find out which it is).
>>>>
>>>> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com=
>
>>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>>> ---
>>>>  block/snapshot.c | 100 +++++++++++++++++++++++++++++++++++++-------=
---
>>>>  1 file changed, 79 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/block/snapshot.c b/block/snapshot.c
>>>> index f2f48f926a..35403c167f 100644
>>>> --- a/block/snapshot.c
>>>> +++ b/block/snapshot.c
>>>> @@ -146,6 +146,32 @@ bool bdrv_snapshot_find_by_id_and_name(BlockDri=
verState *bs,
>>>>      return ret;
>>>>  }
>>>> =20
>>>> +/**
>>>> + * Return the child BDS to which we can fall back if the given BDS
>>>> + * does not support snapshots.
>>>> + * Return NULL if there is no BDS to (safely) fall back to.
>>>> + */
>>>> +static BlockDriverState *bdrv_snapshot_fallback(BlockDriverState *b=
s)
>>>> +{
>>>> +    BlockDriverState *child_bs =3D NULL;
>>>> +    BdrvChild *child;
>>>> +
>>>> +    QLIST_FOREACH(child, &bs->children, next) {
>>>> +        if (child =3D=3D bdrv_filtered_cow_child(bs)) {
>>>> +            /* Ignore: COW children need not be included in snapsho=
ts */
>>>> +            continue;
>>>> +        }
>>>> +
>>>> +        if (child_bs) {
>>>> +            /* Cannot fall back to a single child if there are mult=
iple */
>>>> +            return NULL;
>>>> +        }
>>>> +        child_bs =3D child->bs;
>>>> +    }
>>>> +
>>>> +    return child_bs;
>>>> +}
>>>
>>> Why do we return child->bs here when bdrv_snapshot_goto() then needs =
to
>>> reconstruct what the associated BdrvChild was? Wouldn't it make more
>>> sense to return BdrvChild** from here and maybe have a small wrapper =
for
>>> the other functions that only need a BDS?
>>
>> What would you return instead?  &child doesn=E2=80=99t work.
>=20
> Oops, brain fart. :-)
>=20
>> We could limit ourselves to bs->file and bs->backing.  It just seemed
>> like a bit of an artificial limit to me, because we only really have i=
t
>> for bdrv_snapshot_goto().
>=20
> Hm, but then, what use is supporting other children for creating a
> snapshot when you can't load it any more afterwards?

Well, the snapshot is still there, it=E2=80=99s just on a different node.=
  So in
theory, you could take a snapshot in a live VM (where the snapshotting
node is not at the top), and then later revert to it with qemu-img (by
accessing the file with the snapshot directly).

Though in practice this is just a fallback anyway, and I don=E2=80=99t th=
ink we
currently have anything where it would make sense to fall through some
node to any child but .file or .backing.  So why not.  It would be
shorter, too.  (Well, plus the short comment why looking at .file and
=2Ebacking is sufficient.)

Max


--QC7tqKkPal4CQY4IzxdYqbA0CkqzAbURZ--

--2jrjhvgV2zXsNzygY23x3oYviEKAoQ9vI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl13n80ACgkQ9AfbAGHV
z0D0Ngf8DPVXn4XRbyUPZJjYg/Gq/cLlJYZalpSCa+Kh4GgqPvKgeNyJL3/0vvAR
uzHkfBFUx45DQ8kUt0cwO3NGZEMDSN2xiW0IjoxvCqN9cd0iOwwFUZhRHZ6lWBW8
2TWrUpl2e9JvUZLfkBmy11ZGrxfpE9CRMcmtgjNH6WpAH9l0vxRJK81BcctBz2ok
veinw70G+WnfqoT6c/D9tCPJJSBBNQnQKL6ByUAwBZLLuvipcFoQodb8/uFRypvA
S2wKS6HQwwhKml5XGgmzyO2jore8HkpKUEGDePYq5XgDjINg8gpl+LXzGLvY/Ln+
X5d/gQiNere7thpPvhcOmV4ZUF4GTA==
=/FYm
-----END PGP SIGNATURE-----

--2jrjhvgV2zXsNzygY23x3oYviEKAoQ9vI--

