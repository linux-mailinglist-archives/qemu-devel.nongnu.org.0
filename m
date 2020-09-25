Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C82278919
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 15:13:32 +0200 (CEST)
Received: from localhost ([::1]:40996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLnXX-0000q3-Pc
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 09:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kLnKA-0002zy-9Y
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 08:59:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kLnK8-0002KA-II
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 08:59:42 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601038779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0GkKH7iPOhpCtNko2QlLqdSO2759bRQDi0F9fDV108A=;
 b=WjD9bGfOhP1VWJ/+b6NKJ+4U1xrrGHm0O7o1QLcyXZ+4b8yu91c/IuuKOPAsi9mE8pCvsC
 jVfvJsFpV2Q/8ZEV1Yq5ps0KbKoFcTcyCruqG1h1mjgTWsJr+T7MfeYVfAIKhN7xh0EulI
 C1g9u2K0ZcNYEh8FZKKK/AxlAQwlgLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-myiD_jmOMEesBfh_IokW4Q-1; Fri, 25 Sep 2020 08:59:37 -0400
X-MC-Unique: myiD_jmOMEesBfh_IokW4Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B0DB88EF06;
 Fri, 25 Sep 2020 12:59:36 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-113.ams2.redhat.com
 [10.36.113.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BAFB7882B;
 Fri, 25 Sep 2020 12:59:32 +0000 (UTC)
Subject: Re: [PATCH v2 30/31] iotests: Allow supported and unsupported formats
 at the same time
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20200924152717.287415-1-kwolf@redhat.com>
 <20200924152717.287415-31-kwolf@redhat.com>
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
Message-ID: <11ac3f9a-84f1-835e-6344-ee0792b18ae4@redhat.com>
Date: Fri, 25 Sep 2020 14:59:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200924152717.287415-31-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lTvkrPnFERZvdks9NmYhVG8kafEqbDEuR"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 02:48:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.238, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lTvkrPnFERZvdks9NmYhVG8kafEqbDEuR
Content-Type: multipart/mixed; boundary="SrflaYrDm2NfO87uXbfLHaQ9G4kjJ3Nd3"

--SrflaYrDm2NfO87uXbfLHaQ9G4kjJ3Nd3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 24.09.20 17:27, Kevin Wolf wrote:
> This is useful for specifying 'generic' as supported (which includes
> only writable image formats), but still excluding some incompatible
> writable formats.
>=20
> It also removes more lines than it adds.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  tests/qemu-iotests/iotests.py | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


--SrflaYrDm2NfO87uXbfLHaQ9G4kjJ3Nd3--

--lTvkrPnFERZvdks9NmYhVG8kafEqbDEuR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl9t6bIACgkQ9AfbAGHV
z0DW+gf9GD7JRuHNogatHGGLF+HrYk4cUUng50lj/siA6xO97MA0Mwev1hoLe9h8
iajO7KuiQMLlnQKDJCUQ2++sLmxqX2SE4q+XLa2hOs1ZqOUM9lS8vE/tMkTaj1P4
D6cAjzU8mwm4IGO6SrDO0iqq4jE+fZT6TTUwCLV2vkQSp+M9gBLdFU0GWDK+n4aG
SYQu8rjxrObN/wvoUU9lEr9IRwMaQ3Gd2yBnCxCyXJNLjkF8EJM79rAqjR4/Whfb
kDhwuL89e8jr9ufWleYcjETIfkWTlONYfPAm18/tUOHEaB1BUEabl3siF85CPKyK
lU+ATrQFnH/tmDmg/IuPDMtIfcPeYA==
=31LU
-----END PGP SIGNATURE-----

--lTvkrPnFERZvdks9NmYhVG8kafEqbDEuR--


