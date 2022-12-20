Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2CE652830
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 22:01:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7jiq-0003ho-LW; Tue, 20 Dec 2022 16:00:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p7jin-0003fx-A9
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 16:00:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p7jik-0003Bq-1Y
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 16:00:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671570017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h68BhweBo5hHkH53nMin6K1ibd8oVSxPjB4SGPVUqrU=;
 b=AloX+t8X9EvkI9aUspEZ0pgJk5TzZzE2GuVNXzTn/VLSHBPNfq0fNZbaBDfqp8pFwXva26
 MN9x42imnE85c4Jty+G92aXi5LzjqyYj4sHLrBoJsq+8HETrYSGb559If/onUrar5PMC6A
 6Ej1bK+Xecp8RPEtu5Ox1UBKGT11FjI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-b1Mr3WXDMCWEUvC11LKjJQ-1; Tue, 20 Dec 2022 16:00:13 -0500
X-MC-Unique: b1Mr3WXDMCWEUvC11LKjJQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B47B829AB402;
 Tue, 20 Dec 2022 21:00:12 +0000 (UTC)
Received: from localhost (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30FA0492C14;
 Tue, 20 Dec 2022 21:00:11 +0000 (UTC)
Date: Tue, 20 Dec 2022 16:00:10 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>, kwolf@redhat.com
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
Subject: Re: [PATCH v14 0/8] Add support for zoned device
Message-ID: <Y6IiWsRU5IUqL0Nu@fedora>
References: <20221219072919.6204-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="utpsG01ZOYsZyezs"
Content-Disposition: inline
In-Reply-To: <20221219072919.6204-1-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


--utpsG01ZOYsZyezs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2022 at 03:29:11PM +0800, Sam Li wrote:
> Zoned Block Devices (ZBDs) devide the LBA space to block regions called z=
ones
> that are larger than the LBA size. It can only allow sequential writes, w=
hich
> reduces write amplification in SSD, leading to higher throughput and incr=
eased
> capacity. More details about ZBDs can be found at:
>=20
> https://zonedstorage.io/docs/introduction/zoned-storage
>=20
> The zoned device support aims to let guests (virtual machines) access zon=
ed
> storage devices on the host (hypervisor) through a virtio-blk device. This
> involves extending QEMU's block layer and virtio-blk emulation code.  In =
its
> current status, the virtio-blk device is not aware of ZBDs but the guest =
sees
> host-managed drives as regular drive that will runs correctly under the m=
ost
> common write workloads.
>=20
> This patch series extend the block layer APIs with the minimum set of zon=
ed
> commands that are necessary to support zoned devices. The commands are - =
Report
> Zones, four zone operations and Zone Append (developing).
>=20
> It can be tested on a null_blk device using qemu-io or qemu-iotests. For
> example, to test zone report using qemu-io:
> $ path/to/qemu-io --image-opts -n driver=3Dzoned_host_device,filename=3D/=
dev/nullb0
> -c "zrp offset nr_zones"
>=20
> v14:
> - address Stefan's comments of probing block sizes

I have reviewed all patches now.

Kevin: Please review and merge.

Thanks,
Stefan

>=20
> v13:
> - add some tracing points for new zone APIs [Dmitry]
> - change error handling in zone_mgmt [Damien, Stefan]
>=20
> v12:
> - address review comments
>   * drop BLK_ZO_RESET_ALL bit [Damien]
>   * fix error messages, style, and typos[Damien, Hannes]
>=20
> v11:
> - address review comments
>   * fix possible BLKZONED config compiling warnings [Stefan]
>   * fix capacity field compiling warnings on older kernel [Stefan,Damien]
>=20
> v10:
> - address review comments
>   * deal with the last small zone case in zone_mgmt operations [Damien]
>   * handle the capacity field outdated in old kernel(before 5.9) [Damien]
>   * use byte unit in block layer to be consistent with QEMU [Eric]
>   * fix coding style related problems [Stefan]
>=20
> v9:
> - address review comments
>   * specify units of zone commands requests [Stefan]
>   * fix some error handling in file-posix [Stefan]
>   * introduce zoned_host_devcie in the commit message [Markus]
>=20
> v8:
> - address review comments
>   * solve patch conflicts and merge sysfs helper funcations into one patch
>   * add cache.direct=3Don check in config
>=20
> v7:
> - address review comments
>   * modify sysfs attribute helper funcations
>   * move the input validation and error checking into raw_co_zone_* funct=
ion
>   * fix checks in config
>=20
> v6:
> - drop virtio-blk emulation changes
> - address Stefan's review comments
>   * fix CONFIG_BLKZONED configs in related functions
>   * replace reading fd by g_file_get_contents() in get_sysfs_str_val()
>   * rewrite documentation for zoned storage
>=20
> v5:
> - add zoned storage emulation to virtio-blk device
> - add documentation for zoned storage
> - address review comments
>   * fix qemu-iotests
>   * fix check to block layer
>   * modify interfaces of sysfs helper functions
>   * rename zoned device structs according to QEMU styles
>   * reorder patches
>=20
> v4:
> - add virtio-blk headers for zoned device
> - add configurations for zoned host device
> - add zone operations for raw-format
> - address review comments
>   * fix memory leak bug in zone_report
>   * add checks to block layers
>   * fix qemu-iotests format
>   * fix sysfs helper functions
>=20
> v3:
> - add helper functions to get sysfs attributes
> - address review comments
>   * fix zone report bugs
>   * fix the qemu-io code path
>   * use thread pool to avoid blocking ioctl() calls
>=20
> v2:
> - add qemu-io sub-commands
> - address review comments
>   * modify interfaces of APIs
>=20
> v1:
> - add block layer APIs resembling Linux ZoneBlockDevice ioctls
>=20
> Sam Li (8):
>   include: add zoned device structs
>   file-posix: introduce helper functions for sysfs attributes
>   block: add block layer APIs resembling Linux ZonedBlockDevice ioctls
>   raw-format: add zone operations to pass through requests
>   config: add check to block layer
>   qemu-iotests: test new zone operations
>   block: add some trace events for new block layer APIs
>   docs/zoned-storage: add zoned device documentation
>=20
>  block.c                                |  19 +
>  block/block-backend.c                  | 147 ++++++++
>  block/file-posix.c                     | 503 +++++++++++++++++++++++--
>  block/io.c                             |  41 ++
>  block/raw-format.c                     |  14 +
>  block/trace-events                     |   2 +
>  docs/devel/zoned-storage.rst           |  43 +++
>  docs/system/qemu-block-drivers.rst.inc |   6 +
>  include/block/block-common.h           |  43 +++
>  include/block/block-io.h               |   7 +
>  include/block/block_int-common.h       |  29 ++
>  include/block/raw-aio.h                |   6 +-
>  include/sysemu/block-backend-io.h      |  18 +
>  meson.build                            |   4 +
>  qapi/block-core.json                   |   8 +-
>  qemu-io-cmds.c                         | 149 ++++++++
>  tests/qemu-iotests/tests/zoned.out     |  53 +++
>  tests/qemu-iotests/tests/zoned.sh      |  86 +++++
>  18 files changed, 1139 insertions(+), 39 deletions(-)
>  create mode 100644 docs/devel/zoned-storage.rst
>  create mode 100644 tests/qemu-iotests/tests/zoned.out
>  create mode 100755 tests/qemu-iotests/tests/zoned.sh
>=20
> --=20
> 2.38.1
>=20

--utpsG01ZOYsZyezs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmOiIloACgkQnKSrs4Gr
c8hi0ggAkDb+DeFqWfFDRkNjDrEEnsm1EwUPi7nosY9QYAwv1nBSpEw6tq/2nWIX
N9hI0sH09HSu6QHBApRvfpiZ9IuZuY32MTrcdOVTuJU6XEw0u+t+PNq7B5/VkHeG
/ksH9KEFHkQpDQCpc3nvpAMLydG0moXGyispCcYW3+wm396X67UrTn5SqnsUvxco
X6myyrGoBfhsd6+kEfg3VVLGAysWGjmU9ygFsxs6XFg/Ye/y9ByVzliXszzv+uQC
WuF2skKBues8GLLCyxj5/ZjJt9c5M2dY7UGrAWcwqISHrx7lz1CNYfsc3DFAcK6H
/MeGntr9efkYoJaghbjtwpWjW0Cluw==
=Ak8v
-----END PGP SIGNATURE-----

--utpsG01ZOYsZyezs--


