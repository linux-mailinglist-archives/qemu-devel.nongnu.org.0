Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC804C6FC9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 15:44:18 +0100 (CET)
Received: from localhost ([::1]:51596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOhG5-0005Eg-PQ
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 09:44:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nOhEK-0003fk-W7
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 09:42:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nOhEI-0001JR-2W
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 09:42:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646059345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q8PgohTvrpOImxs3+xQ6CeZdyCijarZodP1FwKkJtNE=;
 b=YZHmVe0qTLGM335DI6dUXt92ldkT2f1QeaVuxYFYUIQMgO3GF4hmdnh9PegPTDi4D2InPX
 I28ITpdW4hQqmuNQPDpbfozEj77S6TV9FY7VdqJm6CwoQoYIPCX9tjYS7Lm0i2uhkax5lz
 vhjlPfHWBEmb8N3qtr3pfOmD/0kIQJE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-tRZ_iXkDO4iGQHqGOamw7g-1; Mon, 28 Feb 2022 09:42:21 -0500
X-MC-Unique: tRZ_iXkDO4iGQHqGOamw7g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA5D8835DE0;
 Mon, 28 Feb 2022 14:42:20 +0000 (UTC)
Received: from localhost (unknown [10.39.192.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5AA677B8E4;
 Mon, 28 Feb 2022 14:42:16 +0000 (UTC)
Date: Mon, 28 Feb 2022 14:42:07 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 0/3] block: Make bdrv_refresh_limits() non-recursive
Message-ID: <YhzfPwpigXDAi/02@stefanha-x1.localdomain>
References: <20220216105355.30729-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eIgT3tq14oCsHWK1"
Content-Disposition: inline
In-Reply-To: <20220216105355.30729-1-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--eIgT3tq14oCsHWK1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2022 at 11:53:52AM +0100, Hanna Reitz wrote:
> Hi,
>=20
> v1 with detailed reasoning:
> https://lists.nongnu.org/archive/html/qemu-block/2022-02/msg00508.html
>=20
> This series makes bdrv_refresh_limits() non-recursive so that it is
> sufficient for callers to ensure that the node on which they call it
> will not receive concurrent I/O requests (instead of ensuring the same
> for the whole subtree).
>=20
> We need to ensure such I/O does not happen because bdrv_refresh_limits()
> is not atomic and will produce intermediate invalid values, which will
> break concurrent I/O requests that read these values.
>=20
>=20
> v2:
> - Use separate `try` block to clean up in patch 2 instead of putting the
>   `os.remove()` in the existing one (which would cause the second
>   `os.remove()` to be skipped if the first one failed)
>=20
>=20
> git-backport-diff against v1:
>=20
> Key:
> [----] : patches are identical
> [####] : number of functional differences between upstream/downstream pat=
ch
> [down] : patch is downstream-only
> The flags [FC] indicate (F)unctional and (C)ontextual differences, respec=
tively
>=20
> 001/3:[----] [--] 'block: Make bdrv_refresh_limits() non-recursive'
> 002/3:[0005] [FC] 'iotests: Allow using QMP with the QSD'
> 003/3:[----] [--] 'iotests/graph-changes-while-io: New test'
>=20
>=20
> Hanna Reitz (3):
>   block: Make bdrv_refresh_limits() non-recursive
>   iotests: Allow using QMP with the QSD
>   iotests/graph-changes-while-io: New test
>=20
>  block/io.c                                    |  4 -
>  tests/qemu-iotests/iotests.py                 | 32 ++++++-
>  .../qemu-iotests/tests/graph-changes-while-io | 91 +++++++++++++++++++
>  .../tests/graph-changes-while-io.out          |  5 +
>  4 files changed, 127 insertions(+), 5 deletions(-)
>  create mode 100755 tests/qemu-iotests/tests/graph-changes-while-io
>  create mode 100644 tests/qemu-iotests/tests/graph-changes-while-io.out
>=20
> --=20
> 2.34.1
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--eIgT3tq14oCsHWK1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIc3z8ACgkQnKSrs4Gr
c8iHNQf9H/0Go3H5n9usKflfhdpNfNxDkPXBpsN04mqWvSjrQS0FcZYsCkstLt2k
l7vq4QfbhlNsYkA6n7089t7PoU5dbkHugzj7w0r2WgU+oV+SqfQw3BmwyGIOdivt
qXQT7IrzemexdZv1VEr9vyGl/U0oNS4+Rzr+dTon0bisiQYT68JDT8r53bRlqieg
Yp1nOCmDScj70wMB8Nq1kO8EY7H+E1Yx+i/2dZMNvi2jrblpW6k/8UGH9KH4NU0q
h+lt/GZRoY9EgkChkqsQ6CbqJdtseXRULHZlGMbVd5aTlyJ1z0dbR+9xxMn6XUJ3
k+YV2lWhm04Nzow4C0dwkhg4LM31tg==
=YlLT
-----END PGP SIGNATURE-----

--eIgT3tq14oCsHWK1--


