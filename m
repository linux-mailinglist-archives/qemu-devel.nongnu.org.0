Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FCA6DC726
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 15:11:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plrI0-00061w-QL; Mon, 10 Apr 2023 09:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1plrHz-00061e-14
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 09:10:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1plrHw-0002WZ-Hd
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 09:10:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681132227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n10Xj6d/xAmEj8OO0NXz6ZSZ9xAXlH5i5TY6X9R/9o8=;
 b=TlOIjRVJ2JNgpjGlRelZ0hDljb/67imjiYLOd/2VfCALGsruvlAoWKFLJZa2K3dEy9FhML
 OAgLK4b5vKzb6VgMSZxMWpFmmgkmymiy5NPslgG9V4CJmpLHv5WnbFWxjI8M2o77kFAL+U
 BB2UXtBymvwRWjpeMZOGYngb4msOBiU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-Wf8P9cmgMzyD90mY4qVOfw-1; Mon, 10 Apr 2023 09:10:22 -0400
X-MC-Unique: Wf8P9cmgMzyD90mY4qVOfw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AD841C05B00;
 Mon, 10 Apr 2023 13:10:22 +0000 (UTC)
Received: from localhost (unknown [10.39.192.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C79A40C83B6;
 Mon, 10 Apr 2023 13:10:21 +0000 (UTC)
Date: Mon, 10 Apr 2023 09:10:20 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, dmitry.fomichev@wdc.com,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Julia Suvorova <jusual@redhat.com>,
 damien.lemoal@opensource.wdc.com, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v9 0/4] Add zone append write for zoned device
Message-ID: <20230410131020.GC888305@fedora>
References: <20230407081657.17947-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UXmZ3gGaDCKL3bXO"
Content-Disposition: inline
In-Reply-To: <20230407081657.17947-1-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--UXmZ3gGaDCKL3bXO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 07, 2023 at 04:16:53PM +0800, Sam Li wrote:
> This patch series add zone append operation based on the previous
> zoned device support part. The file-posix driver is modified to
> add zone append emulation using regular writes.
>=20
> v9:
> - address review comments [Stefan]
>   * fix get_zones_wp() for wrong offset index
>   * fix misuses of QEMU_LOCK_GUARD()
>   * free and allocate wps in refresh_limits for now
>=20
> v8:
> - address review comments [Stefan]
>   * fix zone_mgmt covering multiple zones case
>   * fix memory leak bug of wps in refresh_limits()
>   * mv BlockZoneWps field from BlockLimits to BlockDriverState
>   * add check_qiov_request() to bdrv_co_zone_append
>=20
> v7:
> - address review comments
>   * fix wp assignment [Stefan]
>   * fix reset_all cases, skip R/O & offline zones [Dmitry, Damien]
>   * fix locking on non-zap related cases [Stefan]
>   * cleanups and typos correction
> - add "zap -p" option to qemuio-cmds [Stefan]
>=20
> v6:
> - add small fixes
>=20
> v5:
> - fix locking conditions and error handling
> - drop some trival optimizations
> - add tracing points for zone append
>=20
> v4:
> - fix lock related issues[Damien]
> - drop all field in zone_mgmt op [Damien]
> - fix state checks in zong_mgmt command [Damien]
> - return start sector of wp when issuing zap req [Damien]
>=20
> v3:
> - only read wps when it is locked [Damien]
> - allow last smaller zone case [Damien]
> - add zone type and state checks in zone_mgmt command [Damien]
> - fix RESET_ALL related problems
>=20
> v2:
> - split patch to two patches for better reviewing
> - change BlockZoneWps's structure to an array of integers
> - use only mutex lock on locking conditions of zone wps
> - coding styles and clean-ups
>=20
> v1:
> - introduce zone append write
>=20
> Sam Li (4):
>   file-posix: add tracking of the zone write pointers
>   block: introduce zone append write for zoned devices
>   qemu-iotests: test zone append operation
>   block: add some trace events for zone append
>=20
>  block/block-backend.c              |  60 ++++++++
>  block/file-posix.c                 | 226 ++++++++++++++++++++++++++++-
>  block/io.c                         |  27 ++++
>  block/io_uring.c                   |   4 +
>  block/linux-aio.c                  |   3 +
>  block/raw-format.c                 |   8 +
>  block/trace-events                 |   2 +
>  include/block/block-common.h       |  14 ++
>  include/block/block-io.h           |   4 +
>  include/block/block_int-common.h   |   8 +
>  include/block/raw-aio.h            |   4 +-
>  include/sysemu/block-backend-io.h  |   9 ++
>  qemu-io-cmds.c                     |  75 ++++++++++
>  tests/qemu-iotests/tests/zoned     |  16 ++
>  tests/qemu-iotests/tests/zoned.out |  16 ++
>  15 files changed, 469 insertions(+), 7 deletions(-)
>=20
> --=20
> 2.39.2
>=20

Thanks, applied to my block-next tree:
https://gitlab.com/stefanha/qemu/commits/block-next

Stefan

--UXmZ3gGaDCKL3bXO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQ0CrwACgkQnKSrs4Gr
c8htwggAs6mGvdlhvbfhdwrfE/OHbydoXIHxOJQPXBBsgXz93SUi3fAwtnlMFHiL
gt4px4KFnH04n97r1+pGL1Wfh+1DJUQgVB1Z7LlHMgf5H9XGEMxctu53IgQWqDn8
YDU1ORk7o2Nn9QEoj4+nlj7hYT/oo97VORPak+uJywV5RycayGV71CMB5Naacr6w
VNa93W51N7IIopPnRuJbeZx8dAJv2y60gjEHWo03VK6OJwLuZwLXwmnV4+NnPV/M
VsdXXyq2PkYZKtbf8zytF0IeoHxJdDj0OvXQPNiU87LhsCI8jHogWAYZRf6T9sEL
WeRJDSR54JERdosUCGdr1HNZwGSdKg==
=JTqt
-----END PGP SIGNATURE-----

--UXmZ3gGaDCKL3bXO--


