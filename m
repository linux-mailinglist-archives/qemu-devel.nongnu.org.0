Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712A31535E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 20:05:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60354 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNhz4-0000es-Na
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 14:05:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1hNhol-0001yV-F0
	for qemu-devel@nongnu.org; Mon, 06 May 2019 13:54:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1hNhok-0007hs-IT
	for qemu-devel@nongnu.org; Mon, 06 May 2019 13:54:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37660)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>) id 1hNhok-0007h6-8n
	for qemu-devel@nongnu.org; Mon, 06 May 2019 13:54:22 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 73D9781DF1;
	Mon,  6 May 2019 17:54:21 +0000 (UTC)
Received: from [10.3.116.15] (ovpn-116-15.phx2.redhat.com [10.3.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06C1760A98;
	Mon,  6 May 2019 17:54:20 +0000 (UTC)
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
References: <20190503170631.228487-1-sgarzare@redhat.com>
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
Message-ID: <e6457a03-58a4-03aa-efb0-55c84cb674d2@redhat.com>
Date: Mon, 6 May 2019 12:54:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503170631.228487-1-sgarzare@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="59KzHsPOnvv8laGi8w82xDAOqgzaN9k8c"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 06 May 2019 17:54:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH] net: avoid to use variable length array in
 net_client_init()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--59KzHsPOnvv8laGi8w82xDAOqgzaN9k8c
From: Eric Blake <eblake@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Message-ID: <e6457a03-58a4-03aa-efb0-55c84cb674d2@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] net: avoid to use variable length array in
 net_client_init()
References: <20190503170631.228487-1-sgarzare@redhat.com>
In-Reply-To: <20190503170631.228487-1-sgarzare@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 5/3/19 12:06 PM, Stefano Garzarella wrote:
> net_client_init() uses a variable length array to store the prefix
> of 'ipv6-net' parameter (e.g. if ipv6-net=3Dfec0::0/64, the prefix
> is 'fec0::0').
> Since the IPv6 prefix can be at most as long as an IPv6 address,
> we can use an array with fixed size equals to INET6_ADDRSTRLEN.

In addition to Markus' comments, on the subject line:

s/avoid to use/avoid using/

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--59KzHsPOnvv8laGi8w82xDAOqgzaN9k8c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlzQdMwACgkQp6FrSiUn
Q2pDoAgAq0RUU4dqtU2TJzNlNMiKHvqlfjQKJ7Ym7LTgo6fO3BIEBGpvXVZmidn7
8IA+HVh00aTqobleHRuu3i++GvjRsGIcFRL2Y35ebmFDQaz23n87MiUqOWd4V/wR
ye/JbnWsGiGbiDJBSBEiNK0fFijqOhJdNY5CyEn0nWA/8bM2QwJsnYRYlRzcUkbp
mretZasqD/Gn03aR0a5t/8xHL8OojamdOoX2UrMlR/vagRvdFO6wL1A0v2yQHuEk
L8jVBIDbAnKe8yTf1Jv25PJ477iSZ5+1gJv/Bhle6/vaTCYLwvW88KbONGz+UEvE
vm5ee8goCh250D+pr9QqfDoRjxLtsg==
=1jWh
-----END PGP SIGNATURE-----

--59KzHsPOnvv8laGi8w82xDAOqgzaN9k8c--

