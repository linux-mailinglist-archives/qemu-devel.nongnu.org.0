Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03DB18FFF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 20:10:38 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59025 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOnV7-0000Jm-Pt
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 14:10:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hOnTE-0007rp-3N
	for qemu-devel@nongnu.org; Thu, 09 May 2019 14:08:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hOnTD-0007Fg-7d
	for qemu-devel@nongnu.org; Thu, 09 May 2019 14:08:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48674)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hOnT8-0007Au-OH; Thu, 09 May 2019 14:08:36 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B54481E1E;
	Thu,  9 May 2019 18:08:32 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-204-168.brq.redhat.com
	[10.40.204.168])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9997600C7;
	Thu,  9 May 2019 18:08:24 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20190502084506.8009-1-thuth@redhat.com>
	<20190502084506.8009-8-thuth@redhat.com>
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
Message-ID: <413645a6-385c-e112-ad9c-8525ef3d9e52@redhat.com>
Date: Thu, 9 May 2019 20:08:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502084506.8009-8-thuth@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="x82gkf7AMMgAciPGcxOywF6tZhvqErO2B"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 09 May 2019 18:08:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v3 7/7] tests: Run the iotests during "make
 check" again
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
	Ed Maste <emaste@freebsd.org>, qemu-block@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Christophe Fergeau <cfergeau@redhat.com>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--x82gkf7AMMgAciPGcxOywF6tZhvqErO2B
From: Max Reitz <mreitz@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Christophe Fergeau <cfergeau@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Message-ID: <413645a6-385c-e112-ad9c-8525ef3d9e52@redhat.com>
Subject: Re: [PATCH v3 7/7] tests: Run the iotests during "make check" again
References: <20190502084506.8009-1-thuth@redhat.com>
 <20190502084506.8009-8-thuth@redhat.com>
In-Reply-To: <20190502084506.8009-8-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02.05.19 10:45, Thomas Huth wrote:
> People often forget to run the iotests before submitting patches or
> pull requests - this is likely due to the fact that we do not run the
> tests during our mandatory "make check" tests yet. Now that we've got
> a proper "auto" group of iotests that should be fine to run in every
> environment, we can enable the iotests during "make check" again by
> running the "auto" tests by default from the check-block.sh script.
>=20
> Some cases still need to be checked first, though: iotests need bash
> and GNU sed (otherwise they fail), and if gprof is enabled, it spoils
> the output of some test cases causing them to fail. So if we detect
> that one of the required programs is missing or that gprof is enabled,
> we still have to skip the iotests to avoid failures.
>=20
> And finally, since we are using check-block.sh now again, this patch al=
so
> removes the qemu-iotests-quick.sh script since we do not need that anym=
ore
> (and having two shell wrapper scripts around the block tests seem
> rather confusing than helpful).
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/Makefile.include      |  8 +++----
>  tests/check-block.sh        | 44 ++++++++++++++++++++++++++++---------=

>  tests/qemu-iotests-quick.sh |  8 -------
>  3 files changed, 38 insertions(+), 22 deletions(-)
>  delete mode 100755 tests/qemu-iotests-quick.sh

Can I interest you in a Makefile target that explicitly excludes
check-block?  I run the iotests anyway, but I also run make check.
Running some iotests twice would be a bit pointless.

Max


--x82gkf7AMMgAciPGcxOywF6tZhvqErO2B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAlzUbJcACgkQ9AfbAGHV
z0BfDQgAoIkMClu6wtZEwZRcUvDPee8y+cv0LplX0heBzMKuw5IF1nOEAjUSWBe+
2EUxTObP24JsVofTod2ewp3iVKmVHSHHzOpjq7qJc50TaK1lTAMRj3syECZsN10K
Ol9a74Hyu8+j0kBtD5qoIlwEcAZs7SjWsqVSul9ZcGJdQo/se/JI7MgJmiKBgwLR
gwK8viRjnGAOmFM6xzHz2G4ZJbcCy5Du5JfXKFhSaTNAPH3rtRK+KjJzHzUYj71z
RjYcfsuQjxy++HoUxokB78fhi7JpSQFm1khf1EkevgQpLFY4C7L3RTZgMo2dRAa/
TEjYfJD+enqStkn+JqEr3Bb0aQbTkg==
=shyt
-----END PGP SIGNATURE-----

--x82gkf7AMMgAciPGcxOywF6tZhvqErO2B--

