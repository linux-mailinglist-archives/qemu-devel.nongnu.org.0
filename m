Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC1F21794
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 13:20:55 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46836 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRauz-0000MP-Jf
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 07:20:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hRatH-00087s-16
	for qemu-devel@nongnu.org; Fri, 17 May 2019 07:19:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hRatF-0002aM-0i
	for qemu-devel@nongnu.org; Fri, 17 May 2019 07:19:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32471)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hRat7-0002Q1-8a; Fri, 17 May 2019 07:18:59 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E1E9FA3EB3;
	Fri, 17 May 2019 11:18:50 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.117])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDD707E8EC;
	Fri, 17 May 2019 11:18:48 +0000 (UTC)
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20190510190307.17647-1-jsnow@redhat.com>
	<20190510190307.17647-5-jsnow@redhat.com>
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
Message-ID: <56494e44-75fe-70af-08bc-c96ba07c5630@redhat.com>
Date: Fri, 17 May 2019 13:18:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510190307.17647-5-jsnow@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="7mvCYCQsAzckLuJoiLeVXoh79cW6uYbHa"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 17 May 2019 11:18:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v2 4/4] iotests: add iotest 250 for testing
 blockdev-backup across iothread contexts
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-stable@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7mvCYCQsAzckLuJoiLeVXoh79cW6uYbHa
From: Max Reitz <mreitz@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-stable@nongnu.org, eblake@redhat.com,
 Markus Armbruster <armbru@redhat.com>
Message-ID: <56494e44-75fe-70af-08bc-c96ba07c5630@redhat.com>
Subject: Re: [PATCH v2 4/4] iotests: add iotest 250 for testing
 blockdev-backup across iothread contexts
References: <20190510190307.17647-1-jsnow@redhat.com>
 <20190510190307.17647-5-jsnow@redhat.com>
In-Reply-To: <20190510190307.17647-5-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10.05.19 21:03, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/250     | 129 +++++++++++++++++++++++++++++++++++++=

>  tests/qemu-iotests/250.out | 119 ++++++++++++++++++++++++++++++++++
>  tests/qemu-iotests/group   |   1 +
>  3 files changed, 249 insertions(+)
>  create mode 100755 tests/qemu-iotests/250
>  create mode 100644 tests/qemu-iotests/250.out
>=20
> diff --git a/tests/qemu-iotests/250 b/tests/qemu-iotests/250
> new file mode 100755
> index 0000000000..1406b10958
> --- /dev/null
> +++ b/tests/qemu-iotests/250
> @@ -0,0 +1,129 @@

[...]

> +    def create_target(filepath, name, size):
> +        basename =3D os.path.basename(filepath)
> +        nodename =3D "file_{}".format(basename)
> +        log(vm.command('blockdev-create', job_id=3D'job1',
> +                       options=3D{
> +                           'driver': 'file',
> +                           'filename': filepath,
> +                           'size': size,

I think this should be 0.  No complaints apart from that, so I can fix
that up when applying, if you agree.

Max

> +                       }))
> +        vm.run_job('job1')
> +        log(vm.command('blockdev-add', driver=3D'file',
> +                       node_name=3Dnodename, filename=3Dfilepath))
> +        log(vm.command('blockdev-create', job_id=3D'job2',
> +                       options=3D{
> +                           'driver': iotests.imgfmt,
> +                           'file': nodename,
> +                           'size': size,
> +                       }))
> +        vm.run_job('job2')
> +        log(vm.command('blockdev-add', driver=3Diotests.imgfmt,
> +                       node_name=3Dname,
> +                       file=3Dnodename))
> +


--7mvCYCQsAzckLuJoiLeVXoh79cW6uYbHa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAlzemJYACgkQ9AfbAGHV
z0B68wf/XXMA9ENRUdBGl368X0hzYSysj2M3fWxpWmfdkkpkvGFRcQQOBuEZPsYz
j8Y6MRcJZL+3zS5ZewUxNMJNVpwQ3eYu3+HLOJqH6Sf8eP5Ccss17ERQ1BPXJZql
2SUQwZbFajqtNfUG8FDGpjuDCvVYzRTSGUc2TQBjW4VLz8b3/bvgeBgFbExAYkTO
p3PKSeFOVzX/Dzktpjcco07gizWO/myGz4XDtsHcjVq6RUskSF1zttwerrMym1Ku
b1Gzrf2Fq7/PTZ9RQf0wdJ3rMCUVHVfCCXe1uv+N7cg219snlk5svqeBpCREZthP
FhuQCAv+9uqvYRsEBuv+y/I5irawlQ==
=nFBf
-----END PGP SIGNATURE-----

--7mvCYCQsAzckLuJoiLeVXoh79cW6uYbHa--

