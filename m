Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF0A25C163
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 14:55:42 +0200 (CEST)
Received: from localhost ([::1]:44626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDomD-00014C-Mt
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 08:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kDolN-0000PK-Gd
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 08:54:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kDolL-0002m3-PM
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 08:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599137687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3QapDBHr5jneETXb0Ohi0LvOU6mMvJiz3PvYvPp2wpU=;
 b=EBOgslaVrwjOzsDhAhWB0VvaxsOIov0EiQ2sA+QvD4UFaGDFgV3Ay6o85l3DnN9jR4DqgD
 1o2PdUE3x4Gxz+K8F4YXXKkR+AuVHjNgA97KID2zXMXsc4X8ICiv5uM8+DZNY9mHk7Fdbd
 QgMlxRCmx5hcysoyr4FDD659VV56gpc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-dGcgPzWgPwCuxqCxfw6QLA-1; Thu, 03 Sep 2020 08:54:45 -0400
X-MC-Unique: dGcgPzWgPwCuxqCxfw6QLA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA4EC18BE16D;
 Thu,  3 Sep 2020 12:54:33 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-112-164.ams2.redhat.com
 [10.36.112.164])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B662C39A47;
 Thu,  3 Sep 2020 12:54:32 +0000 (UTC)
Subject: Re: [PATCH] iotests: Allow running from different directory
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20200902110326.257115-1-kwolf@redhat.com>
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
Message-ID: <170e9e09-5d81-f75b-fbb1-b60ed0d2e776@redhat.com>
Date: Thu, 3 Sep 2020 14:54:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200902110326.257115-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="fTwkj1uMJtYsftFtfd5VXVCAViCRVEFF5"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 04:23:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.403, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fTwkj1uMJtYsftFtfd5VXVCAViCRVEFF5
Content-Type: multipart/mixed; boundary="sez01Tm0Co2Kj8mhWWtws8clRNuqn9OoR"

--sez01Tm0Co2Kj8mhWWtws8clRNuqn9OoR
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 02.09.20 13:03, Kevin Wolf wrote:
> It is convenient to be able to edit the tests and run them without
> changing the current working directory back and forth. Instead of
> assuming that $PWD is the qemu-iotests build directory, derive the build
> directory from the executed script.
>=20
> This allows 'check' to find the required files even when called from
> another directory. The scratch directory will still be in the current
> working directory.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  tests/qemu-iotests/check | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index 3ab859ac1a..22ada6a549 100755
> --- a/tests/qemu-iotests/check
> +++ b/tests/qemu-iotests/check
> @@ -44,7 +44,7 @@ then
>          _init_error "failed to obtain source tree name from check symlin=
k"
>      fi
>      source_iotests=3D$(cd "$source_iotests"; pwd) || _init_error "failed=
 to enter source tree"
> -    build_iotests=3D$PWD
> +    build_iotests=3D$(dirname "$0")

This breaks running check from the build tree.
(i.e. cd $build/tests/qemu-iotests; ./check)

The problem is that to run the test, we do cd to the source directory
($source_iotests), and so $build_iotests then becomes invalid if it=E2=80=
=99s
just a relative path.  In my case, this leads to the following error:

-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1048576
+./common.rc: line 139: $QEMU/tests/qemu-iotests/../../qemu-img: No such
file or directory

I think this could be resolved by wrapping the $(dirname) in
$(realpath), i.e.

build_iotests=3D$(realpath "$(dirname "$0")")

Max

>  else
>      # called from the source tree
>      source_iotests=3D$PWD
>=20


--sez01Tm0Co2Kj8mhWWtws8clRNuqn9OoR--

--fTwkj1uMJtYsftFtfd5VXVCAViCRVEFF5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl9Q54UACgkQ9AfbAGHV
z0DatggAhRtnU9C254cIQ1CW0Qiju0JooaTBqlGDYBkKO+O4TdIq9yXHKjIY+MWX
ft/zeVcuC+lIi0c6CU3t0B1lC8ngUezRLBtxUbczzqZ+zNz6SPBJsJglhHKovUc4
knaGzR/8YpdHZ5lN1RnAKIyBpnNLb+K+Hac7yzi83whfSU3tZsQEyPEEqC92M63Q
YzZuSXQOTPbsE55uwG7RSiiNjVh7XFSvIsyPibKT7wpNvZAa19CoWe/e6MUkqKER
wg6L2fWfyOFvzzdaE0hYMeZU1CN0yHlCD8dcCiGZQgtVDYBrCQslyWVCV68QsOtZ
0xkLHtQwF9NPOt+ke9Pyv6yUcHb20w==
=5VuR
-----END PGP SIGNATURE-----

--fTwkj1uMJtYsftFtfd5VXVCAViCRVEFF5--


