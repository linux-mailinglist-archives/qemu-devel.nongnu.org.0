Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8CF2516F3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 12:58:15 +0200 (CEST)
Received: from localhost ([::1]:58252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAWec-0007Jk-Ms
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 06:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kAWdi-0006Jj-5G
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 06:57:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58596
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kAWdg-00021o-5W
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 06:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598353035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=poCiqRa6UgH/qVwZxnw9VTGj7VqwsGQ5bmsTzqwwBlc=;
 b=dyKdwf0C/2bJvgiIcyZdVmAmJdNXHwMDDZ51ucxns8P6yR/y3DhvkVInG1OiYU+zeyCWaP
 HUjVSnYO+C0/gCvGBpdwp/qUuPYTO32xzClaXk1OxWFJeEy5WNtpSiyzHGD94+0Ex7UOYE
 vKguRNm7JL8bOOjykxvYIbBn3xuCPNM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-tHBrfC_6OrGA8AjfFJE4EQ-1; Tue, 25 Aug 2020 06:57:13 -0400
X-MC-Unique: tHBrfC_6OrGA8AjfFJE4EQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D90A71074663;
 Tue, 25 Aug 2020 10:57:11 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-72.ams2.redhat.com
 [10.36.113.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F1C5709D2;
 Tue, 25 Aug 2020 10:57:10 +0000 (UTC)
Subject: Re: [PATCH v2 4/5] qemu-iotests: Merge FilePaths and FilePath
To: Nir Soffer <nirsof@gmail.com>, qemu-devel@nongnu.org
References: <20200820235427.374645-1-nsoffer@redhat.com>
 <20200820235427.374645-5-nsoffer@redhat.com>
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
Message-ID: <fdbec025-1f08-16f6-68c4-7dfb5c7f4d34@redhat.com>
Date: Tue, 25 Aug 2020 12:57:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200820235427.374645-5-nsoffer@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NLRkFVYtYUZiEAal7FBkZMBS51YJ6gaUP"
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 01:37:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.602, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Nir Soffer <nsoffer@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NLRkFVYtYUZiEAal7FBkZMBS51YJ6gaUP
Content-Type: multipart/mixed; boundary="6goV4D73xPx55QNRI7riytbXwk60inXFi"

--6goV4D73xPx55QNRI7riytbXwk60inXFi
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 21.08.20 01:54, Nir Soffer wrote:
> FilePath creates now one temporary file:
>=20
>     with FilePath("a") as a:
>=20
> Or more:
>=20
>     with FilePath("a", "b", "c") as (a, b, c):
>=20
> This is also the behavior of the file_path() helper, used by some of the
> tests. Now we have only 2 helpers for creating temporary files instead
> of 3.
>=20
> Signed-off-by: Nir Soffer <nsoffer@redhat.com>
> ---
>  tests/qemu-iotests/194        |  2 +-
>  tests/qemu-iotests/208        |  2 +-
>  tests/qemu-iotests/222        |  2 +-
>  tests/qemu-iotests/257        |  4 ++--
>  tests/qemu-iotests/iotests.py | 23 +++++++++++------------
>  5 files changed, 16 insertions(+), 17 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


--6goV4D73xPx55QNRI7riytbXwk60inXFi--

--NLRkFVYtYUZiEAal7FBkZMBS51YJ6gaUP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl9E7oQACgkQ9AfbAGHV
z0CuKwf/cK8PrAdQh25ykKt9o6FaCNMA/WmGAamFEDAAFGtfhxiuaLIAFGe90mdg
qJnOAgOR0inpssh69HA6feSBXXsxIurwpQQFHE0c+2Vwb9WLl6E7/mFL85yi4/Rg
2c0h6kG71ha6fZmDoVPWtzpMil3VlGEUYbqp957nNae72x4uGxVeVxypZ9eFJEQ2
yA++MSnMkeKwkE2ArpF+xme6x+liUtQMt4DgQ/KfjYxqdRszwXlxa6/sR35eYP/a
aCMYCfUOr8Vh9kI6pYA6zU4dWBnkcZfObeMIBr++HqBSlUJ+KFYR5ofjP8JV5ky+
Mg+ka2lLjukRNgMpSq00WrPTrfeuag==
=azrj
-----END PGP SIGNATURE-----

--NLRkFVYtYUZiEAal7FBkZMBS51YJ6gaUP--


