Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140A8648A7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 16:51:23 +0200 (CEST)
Received: from localhost ([::1]:34274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlDwH-00075n-N2
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 10:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56189)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hlDuF-00065U-CM
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 10:49:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hlDuE-0005OA-Ge
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 10:49:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55827)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hlDuA-0004zA-VX; Wed, 10 Jul 2019 10:49:11 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 66C932F8BC9;
 Wed, 10 Jul 2019 14:48:53 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2091D196FE;
 Wed, 10 Jul 2019 14:48:45 +0000 (UTC)
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20190709232550.10724-1-jsnow@redhat.com>
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
Message-ID: <45f3abee-cd8c-2f3f-3ff4-2387f251bd61@redhat.com>
Date: Wed, 10 Jul 2019 16:48:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190709232550.10724-1-jsnow@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iTY96ZJIVpt4fEWQIEKSccXPfnIxXffab"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Wed, 10 Jul 2019 14:48:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 00/18] bitmaps: introduce 'bitmap' sync
 mode
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iTY96ZJIVpt4fEWQIEKSccXPfnIxXffab
Content-Type: multipart/mixed; boundary="9uQpUiTZg0JIput9nXJ4OBMATkojYI6ul";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Juan Quintela
 <quintela@redhat.com>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, vsementsov@virtuozzo.com,
 Markus Armbruster <armbru@redhat.com>, Wen Congyang <wencongyang2@huawei.com>
Message-ID: <45f3abee-cd8c-2f3f-3ff4-2387f251bd61@redhat.com>
Subject: Re: [PATCH v4 00/18] bitmaps: introduce 'bitmap' sync mode
References: <20190709232550.10724-1-jsnow@redhat.com>
In-Reply-To: <20190709232550.10724-1-jsnow@redhat.com>

--9uQpUiTZg0JIput9nXJ4OBMATkojYI6ul
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 10.07.19 01:25, John Snow wrote:
> This series adds a new "BITMAP" sync mode that is meant to replace the
> existing "INCREMENTAL" sync mode.

So who=E2=80=99s going to take it? :-)

get_maintainer.pl says I=E2=80=99m responsible for 14/18 patches, and you=
 are
for 9/18.  But you did prefix the title with =E2=80=9Cbitmaps=E2=80=9D, w=
hich
MAINTAINERS clearly states is your territory. ;-)

Max


--9uQpUiTZg0JIput9nXJ4OBMATkojYI6ul--

--iTY96ZJIVpt4fEWQIEKSccXPfnIxXffab
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl0l+swACgkQ9AfbAGHV
z0Bvqwf+M9XfrFMFhymO9Ctd0mCNGTVbmz0IvcQg85GR5xEpCPG6FNkfXzMiJOVR
QBHp2YaHZcFlOQZm9859UcxhZ8wduZH4SpfGu4fR2Ob6Lk1DF6DUeHy/B5d7gzEP
3OuzoxTkJY86Nti3MS55kLkksRBxxLnIWQyTB7m1NA+GZJmFKkke+hYx+j6OqK9n
kJsAAJQ8GjMmkFFXrk6HSgKeu/mAg+CRYr1WmuWwIPp0trltJiKiuUiCH8slxi5L
ZLy978jYazz0BgrNhLAvc8+EVxrBUPxYMUzH8eQEwOq1+gCB6gTpZ2y+ANihy5fG
Dbq2mRCgj/lKu3gzMr2m3vqQ49tM3w==
=vWbq
-----END PGP SIGNATURE-----

--iTY96ZJIVpt4fEWQIEKSccXPfnIxXffab--

