Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 176E617E09
	for <lists+qemu-devel@lfdr.de>; Wed,  8 May 2019 18:25:01 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40062 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOPNM-0006cK-1Z
	for lists+qemu-devel@lfdr.de; Wed, 08 May 2019 12:25:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1hOPMF-0006Dz-8F
	for qemu-devel@nongnu.org; Wed, 08 May 2019 12:23:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1hOPME-0008Mm-7O
	for qemu-devel@nongnu.org; Wed, 08 May 2019 12:23:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34416)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>) id 1hOPMD-0008KE-Va
	for qemu-devel@nongnu.org; Wed, 08 May 2019 12:23:50 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA9D5308795F;
	Wed,  8 May 2019 16:23:47 +0000 (UTC)
Received: from [10.3.116.15] (ovpn-116-15.phx2.redhat.com [10.3.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04270600C6;
	Wed,  8 May 2019 16:23:46 +0000 (UTC)
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <155721868351.451636.16735088470797960209.stgit@bahia.lan>
	<155721870600.451636.3427944860976861371.stgit@bahia.lan>
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
Message-ID: <4a0a2977-0afd-557a-d6a5-251495cd17b0@redhat.com>
Date: Wed, 8 May 2019 11:23:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <155721870600.451636.3427944860976861371.stgit@bahia.lan>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="OzbJoRnhNrkXWEhZi66KMDev8x825D3gr"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Wed, 08 May 2019 16:23:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH 4/6] fsdev: Error out when unsupported
 option is passed
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OzbJoRnhNrkXWEhZi66KMDev8x825D3gr
From: Eric Blake <eblake@redhat.com>
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Message-ID: <4a0a2977-0afd-557a-d6a5-251495cd17b0@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 4/6] fsdev: Error out when unsupported option
 is passed
References: <155721868351.451636.16735088470797960209.stgit@bahia.lan>
 <155721870600.451636.3427944860976861371.stgit@bahia.lan>
In-Reply-To: <155721870600.451636.3427944860976861371.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 5/7/19 3:45 AM, Greg Kurz wrote:
> Each fsdriver only supports a subset of the options that can be passed
> to -fsdev. Unsupported options are simply ignored. This could cause the=

> user to erroneously think QEMU has a bug.
>=20
> Enforce strict checking of supported options for all fsdrivers. This
> shouldn't impact libvirt, since it doesn't know about he synth and

s/he/the/

> proxy fsdrivers.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  fsdev/qemu-fsdev.c |   74 ++++++++++++++++++++++++++++++++++++++++++++=
++++++--
>  1 file changed, 71 insertions(+), 3 deletions(-)
>=20

>=20
> +#define COMMON_FS_DRIVER_OPTIONS "id", "fsdriver", "readonly"
> +
>  static FsDriverTable FsDrivers[] =3D {
> -    { .name =3D "local", .ops =3D &local_ops},
> -    { .name =3D "synth", .ops =3D &synth_ops},
> -    { .name =3D "proxy", .ops =3D &proxy_ops},
> +    {
> +        .name =3D "local",
> +        .ops =3D &local_ops,
> +        .opts =3D (const char * []) {
> +            COMMON_FS_DRIVER_OPTIONS,
> +            "security_model",


> +static int validate_opt(void *opaque, const char *name, const char *va=
lue,
> +                        Error **errp)
> +{
> +    FsDriverTable *drv =3D opaque;
> +    const char **opt;
> +
> +    for (opt =3D drv->opts; *opt; opt++) {
> +        if (!strcmp(*opt, name)) {
> +            return 0;
> +        }
> +    }
> +
> +    error_setg(errp, "'%s' is invalid for fsdriver '%s'", name, drv->n=
ame);
> +    return -1;
> +}

When we ever reach command-line QAPIfication, this might go away. In the
meantime, this is an improvement.

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--OzbJoRnhNrkXWEhZi66KMDev8x825D3gr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlzTApIACgkQp6FrSiUn
Q2qihAf/T1PU78/OUYCvoDO9PdbIcnpIoAOZ1DDjtv/DhHaMegh3EtOvQvaWLc66
jlmxPVotElbsmL01AT7PDNzy88nDYMdfd5ERAuOPtLnaE6BU20SSD0oC1n9rS5cc
rfIdoUNafT9Hew+lbkNCbid2Z/nj4lz485gIxWTZU8GlY2MK+nbvX4uL0kdyqvYh
SeL6fq0IbowW1MboLqQPzBnBQQMyTG2bYt0wErcfwQivpCGMl8VuwvBulBOgNPiz
/mL2/TD4NBT8xbmV9YfKNKNeWRTLoJ/tI5zM/tEVzqxwVOemWMY1ogN+BckjGBXv
7PFrYCZIzIGc/ZIe5DpRjY2PG8Y3SQ==
=W8qF
-----END PGP SIGNATURE-----

--OzbJoRnhNrkXWEhZi66KMDev8x825D3gr--

