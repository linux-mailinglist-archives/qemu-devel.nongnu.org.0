Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFC87FB8E
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 15:52:00 +0200 (CEST)
Received: from localhost ([::1]:35046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htXyR-0001vU-Pr
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 09:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56945)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1htXx7-000165-Dn
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 09:50:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1htXx6-0008HJ-HX
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 09:50:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38064)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1htXx4-0008GK-AV; Fri, 02 Aug 2019 09:50:34 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B1E0D3DE0B;
 Fri,  2 Aug 2019 13:50:32 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C8B81001B02;
 Fri,  2 Aug 2019 13:50:28 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>
References: <20190801173900.23851-1-mreitz@redhat.com>
 <20190802133428.GC6379@localhost.localdomain>
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
Message-ID: <6d3b3fd2-dc14-57bd-9d54-91c5c6deb4eb@redhat.com>
Date: Fri, 2 Aug 2019 15:50:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802133428.GC6379@localhost.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iltQdmRTO4QekGLFwS8f5yD6KUJs0F1ni"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Fri, 02 Aug 2019 13:50:32 +0000 (UTC)
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
Cc: peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iltQdmRTO4QekGLFwS8f5yD6KUJs0F1ni
Content-Type: multipart/mixed; boundary="mR3zk5hykR6cgI1NDLcZ31kpriJAraOlW";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, John Snow
 <jsnow@redhat.com>, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 peter.maydell@linaro.org, qemu-stable@nongnu.org
Message-ID: <6d3b3fd2-dc14-57bd-9d54-91c5c6deb4eb@redhat.com>
Subject: Re: [PATCH v2 for-4.1 0/2] backup: Copy only dirty areas
References: <20190801173900.23851-1-mreitz@redhat.com>
 <20190802133428.GC6379@localhost.localdomain>
In-Reply-To: <20190802133428.GC6379@localhost.localdomain>

--mR3zk5hykR6cgI1NDLcZ31kpriJAraOlW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 02.08.19 15:34, Kevin Wolf wrote:
> Am 01.08.2019 um 19:38 hat Max Reitz geschrieben:
>> Hi,
>>
>> In a discussion with Vladimir today, we noticed that the backup job
>> currently is pretty broken when using copy offloading.  I don=E2=80=99=
t know
>> about you, but my local filesystem (XFS) supports copy offloading, so
>> the job uses it automatically.  That means, that backup is broken and
>> has been broken for a year on my local FS.
>>
>> The last working version was 2.12, so this isn=E2=80=99t a regression =
in 4.1.
>> We could thus justify moving it to 4.2.  But I think this should reall=
y
>> go into 4.1, because this is not really an edge case and as far as I
>> know users cannot do anything to prevent the backup job from performin=
g
>> copy offloading if the system and all involved block drivers support i=
t.
>> I just wonder why nobody has noticed...
>=20
> This sounds bad indeed. But are we already going to have an -rc4 for
> other reasons, or would this mean to have one only for the backup fix?

Looks like we are going to have an rc4 in any case because of the slirp
submodule.

> Also, if you say this was broken in 4.0, Cc: qemu-stable

Oh, right.  I have been forgetting that for quite a while now.

Max



--mR3zk5hykR6cgI1NDLcZ31kpriJAraOlW--

--iltQdmRTO4QekGLFwS8f5yD6KUJs0F1ni
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1EP6IACgkQ9AfbAGHV
z0BqIggAuXZjLwxpgLnP+1voy0i02V1eNw88iBeODlrSEjnjBxpI3Wysq7luB1fn
S1x6Z2iqNpKZyJ1So87sUHbjkTI9vMh0/KhNwwnQRKNLjWlqGt+bh1MWrxDDkJcB
TkUchA3xmBS8qwAH5cntnOfZtMtIacc7ek3MMSiLyh5Ykm+BHtYuxatImMjv5FXf
pNG+cGWjNI/g8k0eb6UaxQjj6f1xpAY1UblXqFS+hzPEkF3QB5p/FmOCF7bL/QXO
yd9Hw/NdAgPPfT8TEZlDEuR2C5m1LLrsEds1Tr0SgxBkfJwIOLgjzAtUlpWME7SO
3i0+8NI5S/q/x00agntNfwnUL2Nxjw==
=LHOz
-----END PGP SIGNATURE-----

--iltQdmRTO4QekGLFwS8f5yD6KUJs0F1ni--

