Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA5625D55B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 11:45:17 +0200 (CEST)
Received: from localhost ([::1]:50350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kE8HV-00014s-1Q
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 05:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kE8GJ-0000Ds-K8
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 05:44:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27473
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kE8GH-00079w-DS
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 05:44:02 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-nJ7D-xcDNbeyuDgS0IUFJw-1; Fri, 04 Sep 2020 05:43:58 -0400
X-MC-Unique: nJ7D-xcDNbeyuDgS0IUFJw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A838801FC6;
 Fri,  4 Sep 2020 09:43:57 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-156.ams2.redhat.com
 [10.36.114.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BB9060C0F;
 Fri,  4 Sep 2020 09:43:56 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] qcow2: Rewrite the documentation of
 qcow2_alloc_cluster_offset()
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1599150873.git.berto@igalia.com>
 <bb5bd06f07c5a05b0818611de0d06ec5b66c8df3.1599150873.git.berto@igalia.com>
 <9355b4ef-be80-b8eb-6697-24125caea920@redhat.com>
 <w51blilano8.fsf@maestria.local.igalia.com>
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
Message-ID: <164b6f7e-55b2-cbc4-e90e-c057364a53a7@redhat.com>
Date: Fri, 4 Sep 2020 11:43:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <w51blilano8.fsf@maestria.local.igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zcYYTcOxrPT1GATqAnUali4oC2jDDnsnU"
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 03:58:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.403,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zcYYTcOxrPT1GATqAnUali4oC2jDDnsnU
Content-Type: multipart/mixed; boundary="NWWo1s39uwl1pnTqmPRoQmRcNUP2EYtnp"

--NWWo1s39uwl1pnTqmPRoQmRcNUP2EYtnp
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04.09.20 11:36, Alberto Garcia wrote:
> On Fri 04 Sep 2020 11:28:18 AM CEST, Max Reitz wrote:
>>> + * If any clusters or subclusters were allocated then @m contains a
>>> + * list with the information of all the affected regions. Note that
>>> + * this can happen regardless of whether this function succeeds or
>>> + * not. The caller is responsible for updating the L2 metadata of the
>>> + * allocated clusters (on success) or freeing them (on failure), and
>>> + * for clearing the contents of @m afterwards in both cases.
>>
>> It=E2=80=99s too bad that preallocate_co() doesn=E2=80=99t do that then,=
 isn=E2=80=99t it...
>=20
> I was planning to have a closer look at that function next week.

Great! :)

Max


--NWWo1s39uwl1pnTqmPRoQmRcNUP2EYtnp--

--zcYYTcOxrPT1GATqAnUali4oC2jDDnsnU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl9SDFoACgkQ9AfbAGHV
z0D03AgAnB6Bz0W845IRY/Rm2ZNO79dJ/CB7P6XM8SCLZOPPlGOhSDtNE4Xjl6sH
++kdKBJU4EigPKkO2sUgBzfmkjuvUFO7949LwSgsa1mR099JNlc4mRHIOeu45fKN
g/oi6dMA6ELOiO0WjkdPUhv5c/BRMkJabnwCFRbm0NJO9Vy5BvOQSjVEXY5aCbwU
auboyuibLo5bRRjJGUnVbUh3z6jcKoong/CQrOEZwnYFDoi19/KwhR7FHf7tqjYY
eZ+XB9qbRubSSg01Oq0i3Bg1/41m0IWGwawU9xnBNCXi0CkrIESzSS41rNhHkiQP
gmGVCgnKQEVmDM1QZPlfSzQ8nFGE+A==
=SzBr
-----END PGP SIGNATURE-----

--zcYYTcOxrPT1GATqAnUali4oC2jDDnsnU--


