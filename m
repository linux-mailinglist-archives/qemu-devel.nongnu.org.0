Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3219763BC0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 21:14:48 +0200 (CEST)
Received: from localhost ([::1]:53236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkvZf-0007fj-Da
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 15:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42976)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hkv92-0002Sj-V5
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 14:47:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hkv8n-0004U1-50
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 14:47:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55218)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hkv8O-0004GB-Vg; Tue, 09 Jul 2019 14:46:41 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 528B5F9E92;
 Tue,  9 Jul 2019 18:46:33 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.188])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 190A11F7;
 Tue,  9 Jul 2019 18:46:25 +0000 (UTC)
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20190705201631.26266-1-jsnow@redhat.com>
 <20190705201631.26266-13-jsnow@redhat.com>
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
Message-ID: <416e9c84-0f23-2149-eac2-b6ddd35b03ba@redhat.com>
Date: Tue, 9 Jul 2019 20:46:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190705201631.26266-13-jsnow@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="U50TAjmA02iZpxsi8PZflzLAoIVktuyLj"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 09 Jul 2019 18:46:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 12/18] block/backup: add 'always' bitmap
 sync policy
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 vsementsov@virtuozzo.com, Juan Quintela <quintela@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--U50TAjmA02iZpxsi8PZflzLAoIVktuyLj
Content-Type: multipart/mixed; boundary="fzzqOyO4gacgsYhHBzTv1MEL8mMhbpAxm";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Wen Congyang <wencongyang2@huawei.com>,
 Kevin Wolf <kwolf@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, eblake@redhat.com, vsementsov@virtuozzo.com,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Message-ID: <416e9c84-0f23-2149-eac2-b6ddd35b03ba@redhat.com>
Subject: Re: [PATCH v3 12/18] block/backup: add 'always' bitmap sync policy
References: <20190705201631.26266-1-jsnow@redhat.com>
 <20190705201631.26266-13-jsnow@redhat.com>
In-Reply-To: <20190705201631.26266-13-jsnow@redhat.com>

--fzzqOyO4gacgsYhHBzTv1MEL8mMhbpAxm
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05.07.19 22:16, John Snow wrote:
> This adds an "always" policy for bitmap synchronization. Regardless of =
if
> the job succeeds or fails, the bitmap is *always* synchronized. This me=
ans
> that for backups that fail part-way through, the bitmap retains a recor=
d of
> which sectors need to be copied out to accomplish a new backup using th=
e
> old, partial result.
>=20
> In effect, this allows us to "resume" a failed backup; however the new =
backup
> will be from the new point in time, so it isn't a "resume" as much as i=
t is
> an "incremental retry." This can be useful in the case of extremely lar=
ge
> backups that fail considerably through the operation and we'd like to n=
ot waste
> the work that was already performed.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  block/backup.c       | 27 +++++++++++++++++++--------
>  qapi/block-core.json |  5 ++++-
>  2 files changed, 23 insertions(+), 9 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


--fzzqOyO4gacgsYhHBzTv1MEL8mMhbpAxm--

--U50TAjmA02iZpxsi8PZflzLAoIVktuyLj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl0k4QAACgkQ9AfbAGHV
z0AqLggAlJyFQxmt+26Jly3mCrEH6XLxJca66hbOBzoj3KFbIpDRcy8IuX/4mOu4
FuNZWNJipCrTVESQl8inxMnVeo9ogcS0Vq0GHy81P7XKV6HSKsg4lw416imlP5K1
ZL0DDaxUbheFNlLcYtk9NiFgh9qfNbRA2GXUV19y1LRt45UjuK7oAt0OV+6Oxfza
RfjEtIrHGbbAA19Yar1URsotFRC1KGVd6ipfWzS+nmmy8Rr9FqtjRtjT7/6eCEi+
Xd+Anl+ypQ2g1XI2TMNVzx2X3TcfyW1Z9DDPVc9PV+4vMqj7mBuUmHrVPs+3wAbB
aeAM6IB/eu3MukZrl+Wf7CN5gVsLlA==
=WrwD
-----END PGP SIGNATURE-----

--U50TAjmA02iZpxsi8PZflzLAoIVktuyLj--

