Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A89781A056
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 17:39:39 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45246 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP7cY-0000fv-RM
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 11:39:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1hP7OH-0003zZ-TS
	for qemu-devel@nongnu.org; Fri, 10 May 2019 11:24:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1hP7OG-0004Sf-1q
	for qemu-devel@nongnu.org; Fri, 10 May 2019 11:24:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44454)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1hP7OD-0004Pq-JU; Fri, 10 May 2019 11:24:50 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7CB513092654;
	Fri, 10 May 2019 15:24:47 +0000 (UTC)
Received: from [10.3.116.15] (ovpn-116-15.phx2.redhat.com [10.3.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C00EC1001E6D;
	Fri, 10 May 2019 15:24:46 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
	qemu-devel@nongnu.org
References: <20190510052239.21947-1-thuth@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=eblake@redhat.com; keydata=
	xsBNBEvHyWwBCACw7DwsQIh0kAbUXyqhfiKAKOTVu6OiMGffw2w90Ggrp4bdVKmCaEXlrVLU
	xphBM8mb+wsFkU+pq9YR621WXo9REYVIl0FxKeQo9dyQBZ/XvmUMka4NOmHtFg74nvkpJFCD
	TUNzmqfcjdKhfFV0d7P/ixKQeZr2WP1xMcjmAQY5YvQ2lUoHP43m8TtpB1LkjyYBCodd+LkV
	GmCx2Bop1LSblbvbrOm2bKpZdBPjncRNob73eTpIXEutvEaHH72LzpzksfcKM+M18cyRH+nP
	sAd98xIbVjm3Jm4k4d5oQyE2HwOur+trk2EcxTgdp17QapuWPwMfhaNq3runaX7x34zhABEB
	AAHNHkVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPsLAegQTAQgAJAIbAwULCQgHAwUV
	CgkICwUWAgMBAAIeAQIXgAUCS8fL9QIZAQAKCRCnoWtKJSdDahBHCACbl/5FGkUqJ89GAjeX
	RjpAeJtdKhujir0iS4CMSIng7fCiGZ0fNJCpL5RpViSo03Q7l37ss+No+dJI8KtAp6ID+PMz
	wTJe5Egtv/KGUKSDvOLYJ9WIIbftEObekP+GBpWP2+KbpADsc7EsNd70sYxExD3liwVJYqLc
	Rw7so1PEIFp+Ni9A1DrBR5NaJBnno2PHzHPTS9nmZVYm/4I32qkLXOcdX0XElO8VPDoVobG6
	gELf4v/vIImdmxLh/w5WctUpBhWWIfQDvSOW2VZDOihm7pzhQodr3QP/GDLfpK6wI7exeu3P
	pfPtqwa06s1pae3ad13mZGzkBdNKs1HEm8x6zsBNBEvHyWwBCADGkMFzFjmmyqAEn5D+Mt4P
	zPdO8NatsDw8Qit3Rmzu+kUygxyYbz52ZO40WUu7EgQ5kDTOeRPnTOd7awWDQcl1gGBXgrkR
	pAlQ0l0ReO57Q0eglFydLMi5bkwYhfY+TwDPMh3aOP5qBXkm4qIYSsxb8A+i00P72AqFb9Q7
	3weG/flxSPApLYQE5qWGSXjOkXJv42NGS6o6gd4RmD6Ap5e8ACo1lSMPfTpGzXlt4aRkBfvb
	NCfNsQikLZzFYDLbQgKBA33BDeV6vNJ9Cj0SgEGOkYyed4I6AbU0kIy1hHAm1r6+sAnEdIKj
	cHi3xWH/UPrZW5flM8Kqo14OTDkI9EtlABEBAAHCwF8EGAEIAAkFAkvHyWwCGwwACgkQp6Fr
	SiUnQ2q03wgAmRFGDeXzc58NX0NrDijUu0zx3Lns/qZ9VrkSWbNZBFjpWKaeL1fdVeE4TDGm
	I5mRRIsStjQzc2R9b+2VBUhlAqY1nAiBDv0Qnt+9cLiuEICeUwlyl42YdwpmY0ELcy5+u6wz
	mK/jxrYOpzXKDwLq5k4X+hmGuSNWWAN3gHiJqmJZPkhFPUIozZUCeEc76pS/IUN72NfprZmF
	Dp6/QDjDFtfS39bHSWXKVZUbqaMPqlj/z6Ugk027/3GUjHHr8WkeL1ezWepYDY7WSoXwfoAL
	2UXYsMAr/uUncSKlfjvArhsej0S4zbqim2ZY6S8aRWw94J3bSvJR+Nwbs34GPTD4Pg==
Organization: Red Hat, Inc.
Message-ID: <ac4a7ace-813d-31a8-9aae-1b5523988de8@redhat.com>
Date: Fri, 10 May 2019 10:24:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510052239.21947-1-thuth@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="b22CqjwEZZwXRLoaG6V4mezwuQYn8qAOw"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 10 May 2019 15:24:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH] tests/libqtest: Remove unused
 global_qtest-related wrapper functions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--b22CqjwEZZwXRLoaG6V4mezwuQYn8qAOw
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ac4a7ace-813d-31a8-9aae-1b5523988de8@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] tests/libqtest: Remove unused
 global_qtest-related wrapper functions
References: <20190510052239.21947-1-thuth@redhat.com>
In-Reply-To: <20190510052239.21947-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 5/10/19 12:22 AM, Thomas Huth wrote:
> A bunch of the wrapper functions that use global_qtest are not used
> anymore. Remove them to avoid that they are used in new code again.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/libqtest.c |  11 +----
>  tests/libqtest.h | 108 -----------------------------------------------=

>  2 files changed, 1 insertion(+), 118 deletions(-)

Nice!

Reviewed-by: Eric Blake <eblake@redhat.com>


> -/**
> - * qtest_irq_intercept_out:
> - * @string: QOM path of a device.
> - *
> - * Associate qtest irqs with the GPIO-out pins of the device
> - * whose path is specified by @string.
> - */
> -static inline void irq_intercept_out(const char *string)

Fixes a copy-and-paste misdocumentation bug while at it :)

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--b22CqjwEZZwXRLoaG6V4mezwuQYn8qAOw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlzVl70ACgkQp6FrSiUn
Q2p/FQf/dj1CPIcTSq9VHRTcDx2/vVsRLhzlePO7EtRevsGVfu8OdEpy20Yfny63
wiFIss4GYFsKLyMtns5bQNcBDhfhk7yzUAX9L4d5FeXC7KXs0kBwFGq7o67jTo/P
eOCsaItPv0xTsgzVYjFbC29xvo2l4q2+aWxTFWyD9d6wSVorW7Z/Shvt2ncAIpXF
L0jv7NQ1OoiY+sHFLYY/0dcKjD2tLvkQLSpwHH08v2x2uEIGX2t/0RhzXLXe7753
+V1q/JxLNBZJkDUhJsulx6yXSEEhVlN5x6ybvtbUgUT5SRUzJp/onvbRlvOnpy11
d9n3fYyfexDU6kdnlHXx98QmtPGRFA==
=V4FT
-----END PGP SIGNATURE-----

--b22CqjwEZZwXRLoaG6V4mezwuQYn8qAOw--

