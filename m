Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF0A1BF88A
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 14:54:03 +0200 (CEST)
Received: from localhost ([::1]:56210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jU8hW-0007PM-II
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 08:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41106)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jU8gE-0005hx-Mj
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 08:52:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jU8ez-000738-QQ
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 08:52:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21312
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jU8ez-00072h-6A
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 08:51:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588251083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KTmNVA2on6joSnRL1I8+NKkigaNbjEC1ARnddiXjKMM=;
 b=VlT/9WDO1lz6hQGBTgbUq0YiLBE7hOKDLylhR7tMZd0lOJHqXCPud9e4tpUVhZwjrZSupe
 eiVGyp32MNuTEB/5Zks+SbiNe5+zz7/v8CnfS+GmDxameGn58qOymeVZeDrGZte5OMScli
 fhSBDSm8bkDkuI08IE+7cVJmnX7qF4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-2ZXwpuPvN5mpQikqe8-vJQ-1; Thu, 30 Apr 2020 08:51:21 -0400
X-MC-Unique: 2ZXwpuPvN5mpQikqe8-vJQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E34D89052B;
 Thu, 30 Apr 2020 12:51:06 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-112-177.ams2.redhat.com
 [10.36.112.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3932D1053B1C;
 Thu, 30 Apr 2020 12:50:51 +0000 (UTC)
Subject: Re: [PATCH v2 1/6] docs: Sort sections on qemu-img subcommand
 parameters
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20200421212019.170707-1-eblake@redhat.com>
 <20200421212019.170707-2-eblake@redhat.com>
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
Message-ID: <ba22a63a-1573-20cb-f4d9-eb49033037c9@redhat.com>
Date: Thu, 30 Apr 2020 14:50:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421212019.170707-2-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8hUcTxDBdzUzfqlL2KmzcWCfXdchpXdu4"
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 23:34:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8hUcTxDBdzUzfqlL2KmzcWCfXdchpXdu4
Content-Type: multipart/mixed; boundary="eB6LaE5dqaYp9kEJ5oJytLAd5oRiPlrUs"

--eB6LaE5dqaYp9kEJ5oJytLAd5oRiPlrUs
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 21.04.20 23:20, Eric Blake wrote:
> We already list the subcommand summaries alphabetically, we should do
> the same for the documentation related to subcommand-specific
> parameters.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  docs/tools/qemu-img.rst | 48 ++++++++++++++++++++---------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)


Reviewed-by: Max Reitz <mreitz@redhat.com>


--eB6LaE5dqaYp9kEJ5oJytLAd5oRiPlrUs--

--8hUcTxDBdzUzfqlL2KmzcWCfXdchpXdu4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl6qyakACgkQ9AfbAGHV
z0CUUwgAsAKAz+JIqF1XbsR2mUp+V4gaYOngD/M23OKozOAanROKZhFHN++tusEZ
lA+DnjSGObEnz6/l6NUIOZgOxQsP7bfOz+Os1fWzQA79V8p+G4f5STBbOHo5hrPb
Y57MzOWTvRECr0gq7axA0/ZOlYejZJnVzpgV8QA/1YUYdKGUVvZs24+IZWmJtCvg
nfuhidgOkrev2g8/Fm3Md3Q54n29hWYxPTbEoRHTr/t8k2hdvAA68HyQmE04Py2G
to9EPlPPegtfSXll1bqYQ3a7GoOPPbDc+9t963aq7h0XFi2H6BzgYYHy/hCFeWeV
bclLXe0qC8i43dut0D94rpZBLJlYBA==
=mb7S
-----END PGP SIGNATURE-----

--8hUcTxDBdzUzfqlL2KmzcWCfXdchpXdu4--


