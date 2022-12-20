Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11931652821
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 21:59:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7jhE-0002ze-JZ; Tue, 20 Dec 2022 15:58:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p7jhC-0002zM-IV
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 15:58:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p7jhA-0002i9-Ej
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 15:58:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671569918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5gyOAaQ0/lyy6h+RZHVyWaq9rp1VAW2WzaUP1A6uUXM=;
 b=fu+TPolAhz6/2b/hC9NDjTG2OcCIubH5DSxBjrmYCpfmdhjWh18/EwP1kQIPKd/Z64BwtP
 UKyQTw0LTC5An3+I5Fi0uOkcJRgnA1wZEMlzKskF/vdMSrqRI2WjRLK79mBzbtbKOC2JPk
 qLA5nTzdQ7qP/z8dPI7tIe1YhEKRvaw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299--HGw4IKTOaqpFrVdIjpIig-1; Tue, 20 Dec 2022 15:58:34 -0500
X-MC-Unique: -HGw4IKTOaqpFrVdIjpIig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 045603C0D843;
 Tue, 20 Dec 2022 20:58:34 +0000 (UTC)
Received: from localhost (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9D5D4014EB9;
 Tue, 20 Dec 2022 20:58:27 +0000 (UTC)
Date: Tue, 20 Dec 2022 15:58:21 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, hare@suse.de, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, dmitry.fomichev@wdc.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 damien.lemoal@opensource.wdc.com, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v14 3/8] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
Message-ID: <Y6Ih7Xk1nxzKSbsv@fedora>
References: <20221219072919.6204-1-faithilikerun@gmail.com>
 <20221219072919.6204-4-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="m6gJFF7ZNOzTGq+t"
Content-Disposition: inline
In-Reply-To: <20221219072919.6204-4-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--m6gJFF7ZNOzTGq+t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2022 at 03:29:14PM +0800, Sam Li wrote:
> Add a new zoned_host_device BlockDriver. The zoned_host_device option
> accepts only zoned host block devices. By adding zone management
> operations in this new BlockDriver, users can use the new block
> layer APIs including Report Zone and four zone management operations
> (open, close, finish, reset, reset_all).
>=20
> Qemu-io uses the new APIs to perform zoned storage commands of the device:
> zone_report(zrp), zone_open(zo), zone_close(zc), zone_reset(zrs),
> zone_finish(zf).
>=20
> For example, to test zone_report, use following command:
> $ ./build/qemu-io --image-opts -n driver=3Dzoned_host_device, filename=3D=
/dev/nullb0
> -c "zrp offset nr_zones"
>=20
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> ---
>  block/block-backend.c             | 147 ++++++++++++
>  block/file-posix.c                | 364 ++++++++++++++++++++++++++++++
>  block/io.c                        |  41 ++++
>  include/block/block-io.h          |   7 +
>  include/block/block_int-common.h  |  21 ++
>  include/block/raw-aio.h           |   6 +-
>  include/sysemu/block-backend-io.h |  18 ++
>  meson.build                       |   4 +
>  qapi/block-core.json              |   8 +-
>  qemu-io-cmds.c                    | 149 ++++++++++++
>  10 files changed, 762 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--m6gJFF7ZNOzTGq+t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmOiIewACgkQnKSrs4Gr
c8g6qwf+NMLi96sikifQG2uGQkZhAMIK5KxwCa/UPfOiBxWNtwq+Pj8Ok+NX6Rte
fwB7V+fOZpOIS0ZXvuOKLzYWZzVk6GY7IAVegaqAvPF7rcBkXmuYFIPEXEUzEqr4
egSVtPYVscF5oglMl0WJBZCdwnJPsy1NCB9dI6Cmfo14Mk0BacjScXrLyw39+OH+
Qo5gIjo4NiG0RJGzdcQXqobSvq4GTGf5obYT3ue4Rs00HTckma6MPiuVY5QeLrW5
r+sM24qF3NqhFDwarmbOpqUvmJSIszPpnoy4iIoDCxQViHvy5IpSa1p1bGUXS2EZ
K9PcY4KBquWLuLFjnp7jcOLDUEpX4g==
=CIQY
-----END PGP SIGNATURE-----

--m6gJFF7ZNOzTGq+t--


