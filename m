Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57843B1C1D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 13:25:55 +0200 (CEST)
Received: from localhost ([::1]:42586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8ji6-0001B8-FJ
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 07:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44634)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i8jhC-0000Wf-3E
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 07:24:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i8jhB-0006dM-2z
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 07:24:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44344)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i8jh7-0006aQ-69; Fri, 13 Sep 2019 07:24:53 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5B8A3306141F;
 Fri, 13 Sep 2019 11:24:52 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-116-81.ams2.redhat.com
 [10.36.116.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BB035C22F;
 Fri, 13 Sep 2019 11:24:47 +0000 (UTC)
To: qemu-block@nongnu.org
References: <20190911100316.32282-1-mreitz@redhat.com>
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
Message-ID: <bfc0719e-68bc-5ce4-7bb2-01c1f017f96a@redhat.com>
Date: Fri, 13 Sep 2019 13:24:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911100316.32282-1-mreitz@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oMRsadc6j64bjqRay43NBkH1E1sU1gM4l"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 13 Sep 2019 11:24:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3] blockjob: update nodes head while
 removing all bdrv
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Sergio Lopez <slp@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oMRsadc6j64bjqRay43NBkH1E1sU1gM4l
Content-Type: multipart/mixed; boundary="7mTARAHPTgtfP3umv51iTr3k1OlNGYKdP";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Sergio Lopez <slp@redhat.com>
Message-ID: <bfc0719e-68bc-5ce4-7bb2-01c1f017f96a@redhat.com>
Subject: Re: [PATCH v3] blockjob: update nodes head while removing all bdrv
References: <20190911100316.32282-1-mreitz@redhat.com>
In-Reply-To: <20190911100316.32282-1-mreitz@redhat.com>

--7mTARAHPTgtfP3umv51iTr3k1OlNGYKdP
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11.09.19 12:03, Max Reitz wrote:
> From: Sergio Lopez <slp@redhat.com>
>=20
> block_job_remove_all_bdrv() iterates through job->nodes, calling
> bdrv_root_unref_child() for each entry. The call to the latter may
> reach child_job_[can_]set_aio_ctx(), which will also attempt to
> traverse job->nodes, potentially finding entries that where freed
> on previous iterations.
>=20
> To avoid this situation, update job->nodes head on each iteration to
> ensure that already freed entries are no longer linked to the list.
>=20
> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=3D1746631
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
> v3:
> - Rewrote the loop to make the whole function a bit simpler
>   (Also, remove the node from the job->nodes list before unref'ing it,
>   just to be extra-safe)
> ---
>  blockjob.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)

Thanks Sergio for tracking down the bug=E2=80=99s cause, the original pat=
ch, and
the review; I=E2=80=99ve applied the patch to my block branch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block

Max


--7mTARAHPTgtfP3umv51iTr3k1OlNGYKdP--

--oMRsadc6j64bjqRay43NBkH1E1sU1gM4l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl17fH4ACgkQ9AfbAGHV
z0BlPwgAmEf3vcfIU7rK75EB1txt4/0aqxs4iMgevjGtLgCUn0eLljLKTn5jgtCu
Ok6Z/Nzn14eR34iHOqY5qywUT/Zw7RB5Ixm/men5l2qKSjBGclVH2zY++Ovnf8MD
nY4x24R4mA1sxTGMyJyestezZQJKBQPtoCgCNCVa5tIYPeFbkDCgjepMrgEvTyv3
zbn5shD2Kh9YVTEWzJc/Ygmh3bnRkRotDRouxP9HRTkS5jViyt0RYAdmHB5Y7qoY
yIJtJK67tqVutYn+xIzYsgqt+K5QeDd2vY0wCEcguD6pA37nM+MIA4faM39ZmoZv
YuCoEscqCkpCxh8TvIA4eKx+/TnsDA==
=KJdr
-----END PGP SIGNATURE-----

--oMRsadc6j64bjqRay43NBkH1E1sU1gM4l--

