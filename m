Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE73125D4F0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 11:29:50 +0200 (CEST)
Received: from localhost ([::1]:57338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kE82X-0005Qb-Bf
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 05:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kE81I-0004PA-6Z
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 05:28:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58675
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kE81D-0005ET-0w
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 05:28:31 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-F_9M6CCiP4uuR5nJoQRMaw-1; Fri, 04 Sep 2020 05:28:24 -0400
X-MC-Unique: F_9M6CCiP4uuR5nJoQRMaw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2577C425E0;
 Fri,  4 Sep 2020 09:28:22 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-156.ams2.redhat.com
 [10.36.114.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA638196FD;
 Fri,  4 Sep 2020 09:28:20 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] qcow2: Rewrite the documentation of
 qcow2_alloc_cluster_offset()
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1599150873.git.berto@igalia.com>
 <bb5bd06f07c5a05b0818611de0d06ec5b66c8df3.1599150873.git.berto@igalia.com>
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
Message-ID: <9355b4ef-be80-b8eb-6697-24125caea920@redhat.com>
Date: Fri, 4 Sep 2020 11:28:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <bb5bd06f07c5a05b0818611de0d06ec5b66c8df3.1599150873.git.berto@igalia.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="erdIBTeSupl0BQPnTfOR2GEftMVqoWiEy"
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 03:58:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.403,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
--erdIBTeSupl0BQPnTfOR2GEftMVqoWiEy
Content-Type: multipart/mixed; boundary="olaGkDkCr9Tmq4JxDGIRDVCqAt0IFaVYT"

--olaGkDkCr9Tmq4JxDGIRDVCqAt0IFaVYT
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 03.09.20 18:37, Alberto Garcia wrote:
> The current text corresponds to an earlier, simpler version of this
> function and it does not explain how it works now.
>=20
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>  block/qcow2-cluster.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
>=20
> diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
> index 25e38daa78..f1ce6afcf5 100644
> --- a/block/qcow2-cluster.c
> +++ b/block/qcow2-cluster.c
> @@ -1713,18 +1713,22 @@ out:
>  }
> =20
>  /*
> - * alloc_cluster_offset
> + * For a given area on the virtual disk defined by @offset and @bytes,
> + * find the corresponding area on the qcow2 image, allocating new
> + * clusters (or subclusters) if necessary. The result can span a
> + * combination of allocated and previously unallocated clusters.
>   *
> - * For a given offset on the virtual disk, find the cluster offset in qc=
ow2
> - * file. If the offset is not found, allocate a new cluster.
> + * On return, @host_offset is set to the beginning of the requested
> + * area. This area is guaranteed to be contiguous on the qcow2 file
> + * but it can be smaller than initially requested. In this case @bytes
> + * is updated with the actual size.
>   *
> - * If the cluster was already allocated, m->nb_clusters is set to 0 and
> - * other fields in m are meaningless.
> - *
> - * If the cluster is newly allocated, m->nb_clusters is set to the numbe=
r of
> - * contiguous clusters that have been allocated. In this case, the other
> - * fields of m are valid and contain information about the first allocat=
ed
> - * cluster.
> + * If any clusters or subclusters were allocated then @m contains a
> + * list with the information of all the affected regions. Note that
> + * this can happen regardless of whether this function succeeds or
> + * not. The caller is responsible for updating the L2 metadata of the
> + * allocated clusters (on success) or freeing them (on failure), and
> + * for clearing the contents of @m afterwards in both cases.

It=E2=80=99s too bad that preallocate_co() doesn=E2=80=99t do that then, is=
n=E2=80=99t it...

Max


--olaGkDkCr9Tmq4JxDGIRDVCqAt0IFaVYT--

--erdIBTeSupl0BQPnTfOR2GEftMVqoWiEy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl9SCLMACgkQ9AfbAGHV
z0DCrQgAnjFSi9RXyLq4Qofo/zNtBv+fUxoDIAkMlMQxAzg7mVioXEHnFZ0bZBXT
D6izM3njV+YmZaTcVv3AHiO70tw6AP73aXxGC9eY1eFmlcQrbIRmnplWqPJMEvm/
eHn60KqcDF+arX7pAb6V9EohVy3KlYmU4sGE5XehQTQMI5u761m7eOh4iCQYdXwK
+hH0JNDmy6xUhl4PZdrkYQNeO4JBDlELfC3NmXftsjT1/4fz2FbG0YTBSVzy72AA
gsCW+Qd/CoN3kl3CC5o2fbrKHQ5Z56hk4Zos/06KoGMsBVS1dUDNbGXxRfCROFsE
xssARK10Zt5Q7njVDxdO7FbB4wL7Cw==
=sPTu
-----END PGP SIGNATURE-----

--erdIBTeSupl0BQPnTfOR2GEftMVqoWiEy--


