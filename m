Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D67782066
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 17:37:21 +0200 (CEST)
Received: from localhost ([::1]:55028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huf32-0004KV-Em
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 11:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53444)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1huf2B-00033P-Na
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 11:36:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1huf2A-0004Ya-LR
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 11:36:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60710)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1huf26-0004S1-2v; Mon, 05 Aug 2019 11:36:22 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EFC333084295;
 Mon,  5 Aug 2019 15:36:19 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6524C60C83;
 Mon,  5 Aug 2019 15:36:16 +0000 (UTC)
To: qemu-block@nongnu.org
References: <20190801173900.23851-1-mreitz@redhat.com>
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
Message-ID: <1a081b80-6c39-081d-8292-ea2f762f95ef@redhat.com>
Date: Mon, 5 Aug 2019 17:36:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801173900.23851-1-mreitz@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="HzmcqEUdBeTGFFh8iENIfpbst0ZvByTuj"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 05 Aug 2019 15:36:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 for-4.1 0/2] backup: Copy only dirty
 areas
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HzmcqEUdBeTGFFh8iENIfpbst0ZvByTuj
Content-Type: multipart/mixed; boundary="VtwgPKwcEHqIkLXhnwewf7p9mXKqAd301";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Kevin Wolf <kwolf@redhat.com>
Message-ID: <1a081b80-6c39-081d-8292-ea2f762f95ef@redhat.com>
Subject: Re: [PATCH v2 for-4.1 0/2] backup: Copy only dirty areas
References: <20190801173900.23851-1-mreitz@redhat.com>
In-Reply-To: <20190801173900.23851-1-mreitz@redhat.com>

--VtwgPKwcEHqIkLXhnwewf7p9mXKqAd301
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 01.08.19 19:38, Max Reitz wrote:
> Hi,
>=20
> In a discussion with Vladimir today, we noticed that the backup job
> currently is pretty broken when using copy offloading.  I don=E2=80=99t=
 know
> about you, but my local filesystem (XFS) supports copy offloading, so
> the job uses it automatically.  That means, that backup is broken and
> has been broken for a year on my local FS.
>=20
> The last working version was 2.12, so this isn=E2=80=99t a regression i=
n 4.1.
> We could thus justify moving it to 4.2.  But I think this should really=

> go into 4.1, because this is not really an edge case and as far as I
> know users cannot do anything to prevent the backup job from performing=

> copy offloading if the system and all involved block drivers support it=
=2E
> I just wonder why nobody has noticed...

Thanks for the review, applied to my block branch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block

Max


--VtwgPKwcEHqIkLXhnwewf7p9mXKqAd301--

--HzmcqEUdBeTGFFh8iENIfpbst0ZvByTuj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1ITO4ACgkQ9AfbAGHV
z0B5QggAi6NxZqFD4puUhqpUBkIvxeXcV2UZKu2mDkNmZGF57iPcv1crk3fw565j
2Je7IBUge4ty4mbV95rlHFl+IzVlAEH3pXpROfsdeRqEixHpBEWLtn4Rm6jBx6qU
NesYsSeOpr9HJjife7MN08LlohI2S05alkiUBNpWuQtMOMsGykzuW9E/MfiEMICy
hzAI77zcH+9mjESt9Tk4OC2a0FphC25CmdlotC0YbWWmyh1Qy6AMuwV1YAWu5bTs
Lm66GJCgjsbLFtjkCc3fjBwBtePbz9xpFyZtw9um1w2HJW2WvquFwhhifT7b2sQE
/2Y56ql1hTe1xSgaYencpVsHil3BSg==
=D5c2
-----END PGP SIGNATURE-----

--HzmcqEUdBeTGFFh8iENIfpbst0ZvByTuj--

