Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C38F3672E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 00:04:13 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50828 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYe0y-0006n7-8m
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 18:04:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1hYdzx-0006UQ-Dj
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 18:03:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1hYdzv-0006fH-Nt
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 18:03:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60818)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>) id 1hYdzv-0006AV-8X
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 18:03:07 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 06244C04959F;
	Wed,  5 Jun 2019 22:02:53 +0000 (UTC)
Received: from [10.3.116.85] (ovpn-116-85.phx2.redhat.com [10.3.116.85])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75ADF60BF3;
	Wed,  5 Jun 2019 22:02:47 +0000 (UTC)
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20190531192429.GH22103@habkost.net>
	<93e5101f-67f1-a416-5e80-f16371a35e6a@redhat.com>
	<871s0asvli.fsf@dusky.pond.sub.org> <20190605155006.GI8956@redhat.com>
	<20190605201335.GD22416@habkost.net>
	<c6a830b7-2892-6f05-faa1-3c8124e7e78a@redhat.com>
	<20190605204920.GG22416@habkost.net>
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
Message-ID: <a0d8f7e3-17e8-0242-105d-4ed6062b712e@redhat.com>
Date: Wed, 5 Jun 2019 17:02:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605204920.GG22416@habkost.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="8icoOcMmjw5l1fVYR0K9P9eAYg1JJTjlp"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 05 Jun 2019 22:02:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] Deprecation policy and build dependencies
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8icoOcMmjw5l1fVYR0K9P9eAYg1JJTjlp
From: Eric Blake <eblake@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
Message-ID: <a0d8f7e3-17e8-0242-105d-4ed6062b712e@redhat.com>
Subject: Re: [Qemu-devel] Deprecation policy and build dependencies
References: <20190531192429.GH22103@habkost.net>
 <93e5101f-67f1-a416-5e80-f16371a35e6a@redhat.com>
 <871s0asvli.fsf@dusky.pond.sub.org> <20190605155006.GI8956@redhat.com>
 <20190605201335.GD22416@habkost.net>
 <c6a830b7-2892-6f05-faa1-3c8124e7e78a@redhat.com>
 <20190605204920.GG22416@habkost.net>
In-Reply-To: <20190605204920.GG22416@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 6/5/19 3:49 PM, Eduardo Habkost wrote:
> On Wed, Jun 05, 2019 at 03:42:39PM -0500, Eric Blake wrote:
>> On 6/5/19 3:13 PM, Eduardo Habkost wrote:
>>
>>>> IOW, I don't think RHEL-7 support as a build platform blocks us from=

>>>> dropping py2. We merely need to tweak our build platforms doc to cla=
rify
>>>> our intent wrt add-on yum repos.
>>>
>>> If we clarify the docs in QEMU 4.1, is there anything that
>>> prevents us from removing Python 2 support in QEMU 4.1 too?
>>
>> My take (but not definitive): if we have any CI setups that are testin=
g
>> RHEL 7 without software collections and/or EPEL, then save Python 2
>> removal for 4.2 to give us time to update CI setups. But if all of our=

>> CI setups are already fine, and we clarify the docs, then I'm all for
>> getting rid of Python 2 support in 4.1.
>=20
> If we do this soon, CI system owners will have at least 9 weeks
> to fix them before 4.1.0 is released.
>=20
>>
>> Similarly, if we are going to outlaw in-tree builds, let's get that do=
ne
>> in 4.1 instead of waiting yet another release.
>=20
> I'm missing the context on this.  Is this from a separate discussion?

Yes, separate threads (for example, this one:
https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg02553.html),
but related in that it is a build change that would affect existing
development and CI. If we're going to make life harder by pulling the
plug on old ways, we might as well pull the plug on multiple things at on=
ce.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--8icoOcMmjw5l1fVYR0K9P9eAYg1JJTjlp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlz4PAYACgkQp6FrSiUn
Q2q5BAf9HdqnYb16rkpFpnyVseppUEPCqbPvzQ/tarIYgEoOYnGLAsBKwu2bH/BV
vSebtOJqqMjvZIdqwzkOUDEmfljPQv/qHxs1GTJF9Um6ILz5wMlN//xrJyuIfDx3
SQBCPizp68rakJNTzxYtSmEivCusae/6IQkXSf4MAr2/NqFx3W8R/wlt9aqwiHyN
i/Roj2yRWGwPX2g8TVVrWGnCmh+3zSNTrO0QtKRZgjloNOAdPh3g+akcWzXx8xQN
VWbwaHOZ1OCe3uxmDV2IIcQsFfWesHCCYY03EYhv5bc4vINFq31wKfcHJ6RW4qan
yNU0Dxohuungs2BC36vN5PcjLq8TqQ==
=fOmK
-----END PGP SIGNATURE-----

--8icoOcMmjw5l1fVYR0K9P9eAYg1JJTjlp--

