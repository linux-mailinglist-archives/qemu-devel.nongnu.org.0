Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EE016422B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 11:31:17 +0100 (CET)
Received: from localhost ([::1]:48692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4MdQ-0002oD-D1
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 05:31:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56518)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j4McH-00021K-Ug
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 05:30:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j4McH-0006Vi-19
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 05:30:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56651
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j4McG-0006VO-SJ
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 05:30:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582108204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=I2yDfeKcEPCkuDatLCsUd0zxjHcD/Nm835TAo3Kbex8=;
 b=Ar29tGDweRB/zja8WXhhK2Tsxxjo7/reSiGLbcnyCKuafg/XxaftEgjz48BAz06/L0E8bM
 zWPcZsge3xSIatWHLzinKW6WZ5IziEKdJUfO55d+D2Ekd+yrxUMGqfQgvj8BlloO3brZ0/
 wfgFc26QQr8V9Mu5ojYhAObbSrgBE/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-KMYSH2GCNVKVNXaSJkxppg-1; Wed, 19 Feb 2020 05:30:01 -0500
X-MC-Unique: KMYSH2GCNVKVNXaSJkxppg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E2888010EF;
 Wed, 19 Feb 2020 10:30:00 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-116-152.ams2.redhat.com
 [10.36.116.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDD5619756;
 Wed, 19 Feb 2020 10:29:58 +0000 (UTC)
Subject: Re: [PATCH] iotests/279: Fix for non-qcow2 formats
To: qemu-block@nongnu.org
References: <20191219144243.1763246-1-mreitz@redhat.com>
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
Message-ID: <9910c074-d9ba-9759-4544-12ac35bf47ee@redhat.com>
Date: Wed, 19 Feb 2020 11:29:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20191219144243.1763246-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nVVnrmU59y5k5ti0spljjB9MRyvmzGwvZ"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nVVnrmU59y5k5ti0spljjB9MRyvmzGwvZ
Content-Type: multipart/mixed; boundary="7wqnEeItg8swSIMMxdKNq9x9WJFvagAfR"

--7wqnEeItg8swSIMMxdKNq9x9WJFvagAfR
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 19.12.19 15:42, Max Reitz wrote:
> First, driver=3Dqcow2 will not work so well with non-qcow2 formats (and
> this test claims to support qcow, qed, and vmdk).
>=20
> Second, vmdk will always report the backing file format to be vmdk.
> Filter that out so the output looks like for all other formats.
>=20
> Third, the flat vmdk subformats do not support backing files, so they
> will not work with this test.
>=20
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/279 | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied to my block branch.

Max


--7wqnEeItg8swSIMMxdKNq9x9WJFvagAfR--

--nVVnrmU59y5k5ti0spljjB9MRyvmzGwvZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl5NDiQACgkQ9AfbAGHV
z0AKEwgAtfP/Y1jhM35rRw9uPzryUq/vkI1UtYj2pexPOobaHZz6+5s7RKnh9Bws
ixRfcYQIB6hgcR6tb0LNmxKghMLykJDniEourlsGgiz+C+xDEAn1CmOH5TQZKiGl
yabzcRproObazKj4RNoOmb5qzkrZnIUE7N4MPNAeywdel4nt0qLvhbDUQBWIYjbh
tFSs4yGGx+bj4EByv7tqZnRdecqHsIHXxvc3CcegrfDcwUx1R77VLOAcPLwsYPDu
dKQ/SOMjMa0Stz5TnoavcKHgIcpnmUJE2pPXbIFmC/P6X4y6t6ZDLG/4ErbWc5HV
n6wXArFEVuGq5GbtBO85y2RJQbsUsQ==
=hmPO
-----END PGP SIGNATURE-----

--nVVnrmU59y5k5ti0spljjB9MRyvmzGwvZ--


