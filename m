Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2791D35FB
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 18:06:59 +0200 (CEST)
Received: from localhost ([::1]:42688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZGNu-0004R4-5X
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 12:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jZGMh-000317-VM
 for qemu-devel@nongnu.org; Thu, 14 May 2020 12:05:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28942
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jZGMg-0002ZG-VF
 for qemu-devel@nongnu.org; Thu, 14 May 2020 12:05:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589472342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nwxgHa8BDBHuW6ga+Mh0DnVsJScJhBgot4bRo20boNs=;
 b=X4kYgu/6d5RBHRHm/aQ/S2Nsi6F4L88VOhhZDo5r0CDEixpVp4ldVU2hd0FPk0nMQ+/8mj
 uFIG8w82mkkUyubU7R2jdMwwT7UrkgR84rP/XX4YozOU5sMLYRDELr6fE5ayBziwofyHc/
 nd3/ijsHqjEHnwizmVb2TJFR8E/DGqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-5rmnB5GlMhS4ynLj0nfFdQ-1; Thu, 14 May 2020 12:05:37 -0400
X-MC-Unique: 5rmnB5GlMhS4ynLj0nfFdQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67B32835B40;
 Thu, 14 May 2020 16:05:36 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-212.ams2.redhat.com
 [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A474210013BD;
 Thu, 14 May 2020 16:05:34 +0000 (UTC)
Subject: Re: [PATCH v6 13/14] block/qcow2: implement blockdev-amend
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20200510134037.18487-1-mlevitsk@redhat.com>
 <20200510134037.18487-14-mlevitsk@redhat.com>
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
Message-ID: <64a4adf7-3625-a37a-e831-ec51d83d1345@redhat.com>
Date: Thu, 14 May 2020 18:05:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200510134037.18487-14-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Sv3ss34IMdeqd12kHW6VKQS6yTi7VYURn"
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 11:31:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Sv3ss34IMdeqd12kHW6VKQS6yTi7VYURn
Content-Type: multipart/mixed; boundary="1DoT9ZL6ndKD3gFbwJiqRlr5QuLuhzwKH"

--1DoT9ZL6ndKD3gFbwJiqRlr5QuLuhzwKH
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 10.05.20 15:40, Maxim Levitsky wrote:
> Currently the implementation only supports amending the encryption
> options, unlike the qemu-img version
>=20
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  block/qcow2.c        | 39 +++++++++++++++++++++++++++++++++++++++
>  qapi/block-core.json | 16 +++++++++++++++-
>  2 files changed, 54 insertions(+), 1 deletion(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


--1DoT9ZL6ndKD3gFbwJiqRlr5QuLuhzwKH--

--Sv3ss34IMdeqd12kHW6VKQS6yTi7VYURn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl69bE0ACgkQ9AfbAGHV
z0BS7AgAqmNBznxWu1pgD5/Qb1lEhSpOCN5hbIdZEf8xArx+zqZISTxlFG75W02t
mimUB8XTBbqEqDK7iUFhPIWRApUbgJzVcvxrGXpe0XyKnvNWBDjkevbVixZuvvEd
TPkRbpfxYjTGkwZAB+n6aOd27ZnYtDU00f0e5Tb+ocpzoeGSNNaWXf1ckwLMFvtf
pHYeTpn0o0w5lMy9h+4hzVQhU4Q5RSNbv/+fiH/CZy/bVwgUozF0CLC73gmmZd0z
jpokU1W+YqzqgIIUxJXZ3qzcrTdxD4WhJHq88Bu4N4sypTHvfbUJbAY1PUApnQjl
gpDaTDQ0wrMepRnfT6ECOAU3h5uiTQ==
=Plcn
-----END PGP SIGNATURE-----

--Sv3ss34IMdeqd12kHW6VKQS6yTi7VYURn--


