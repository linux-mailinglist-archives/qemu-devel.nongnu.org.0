Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9404B7E2A8
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 20:52:11 +0200 (CEST)
Received: from localhost ([::1]:58476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htGBO-00069A-9v
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 14:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34808)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1htG9u-00059k-95
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 14:50:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1htG9s-0003d6-9U
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 14:50:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57348)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1htG9k-0003Zc-R9; Thu, 01 Aug 2019 14:50:30 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D4ACEC0ED3FE;
 Thu,  1 Aug 2019 18:50:26 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-204-187.brq.redhat.com
 [10.40.204.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7CF260BE0;
 Thu,  1 Aug 2019 18:50:25 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20190801151744.798-1-kwolf@redhat.com>
 <20190801151744.798-4-kwolf@redhat.com>
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
Message-ID: <c38a8d8d-2c86-dd77-be4e-543542ae41ae@redhat.com>
Date: Thu, 1 Aug 2019 20:50:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801151744.798-4-kwolf@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DUJVv5EXNhedmDeuNgx3ofXrS69hqNe6I"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Thu, 01 Aug 2019 18:50:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/3] iotests: Test migration with all kinds
 of filter nodes
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DUJVv5EXNhedmDeuNgx3ofXrS69hqNe6I
Content-Type: multipart/mixed; boundary="zobcWGTXygFhJ28PlWpOgGlC8MpFFpNg7";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eblake@redhat.com, qemu-devel@nongnu.org
Message-ID: <c38a8d8d-2c86-dd77-be4e-543542ae41ae@redhat.com>
Subject: Re: [PATCH 3/3] iotests: Test migration with all kinds of filter
 nodes
References: <20190801151744.798-1-kwolf@redhat.com>
 <20190801151744.798-4-kwolf@redhat.com>
In-Reply-To: <20190801151744.798-4-kwolf@redhat.com>

--zobcWGTXygFhJ28PlWpOgGlC8MpFFpNg7
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 01.08.19 17:17, Kevin Wolf wrote:
> This test case is motivated by commit 2b23f28639 ('block/copy-on-read:
> Fix permissions for inactive node'). Instead of just testing
> copy-on-read on migration, let's stack all sorts of filter nodes on top=

> of each other and try if the resulting VM can still migrate
> successfully. For good measure, put everything into an iothread, becaus=
e
> why not?
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  tests/qemu-iotests/262     | 84 ++++++++++++++++++++++++++++++++++++++=

>  tests/qemu-iotests/262.out | 17 ++++++++
>  tests/qemu-iotests/group   |  1 +
>  3 files changed, 102 insertions(+)
>  create mode 100755 tests/qemu-iotests/262
>  create mode 100644 tests/qemu-iotests/262.out

Reviewed-by: Max Reitz <mreitz@redhat.com>


--zobcWGTXygFhJ28PlWpOgGlC8MpFFpNg7--

--DUJVv5EXNhedmDeuNgx3ofXrS69hqNe6I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1DNHAACgkQ9AfbAGHV
z0DwxAf+OYfBhlMmMD9H7L4gyYp3HPq04cakcF9FYl2qi/tcBadGgiEvBps/xfc+
8oHgI0Yhc8l5SgQ3IC4X92O41mRXNJe1YA8bOqv18XJQUJTjlExzzqlJqinlAKp0
zXubdAVjuRehaJTFuqcQmG32YLTLhx1iJBQZigUwz8JZtZnUpoHuK6eMur7UJBeN
ji1l2SsGBljISNhpvELfu85xF6ocDa3vvYnlYCyqUJ/OPnzOlakW1bVkarEdQBAk
Cam96zA6LPZlkHzDRrTMudEBIKQR/Q8D60l2+9jlXYyFdy4jzCS9k5wCKgazrjBM
O8wLYmxWmTObfn/1PLHUQwLwynHBhA==
=9PyH
-----END PGP SIGNATURE-----

--DUJVv5EXNhedmDeuNgx3ofXrS69hqNe6I--

