Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379CD6BD7AB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 18:59:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcrrV-0005vk-Dl; Thu, 16 Mar 2023 13:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pcrrT-0005v8-Bx
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 13:57:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pcrrR-0007ap-E9
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 13:57:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678989476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/m0CCdz5mLF0ZLDNJuVEZ0BF2rSVtUL99LOkQTzgzOA=;
 b=VZeOEphJEVOEvvUfFTb7o5zACEZVWis5gshHok6bxDIAui9lqdeOCtjyEQO2YUPTIQhVyd
 IFqdkBCVu9cgyqDxoU6Lfwf0Jsoh3V/jq6NCH3XGdX21VAZjLLvSPs2Tzc5ltPLQbZG6c7
 luRa+JWpOtnoqaGVHeygHwbh6Ir7DkI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-EYTwYe6OPkCTLvOmQrOXMQ-1; Thu, 16 Mar 2023 13:57:51 -0400
X-MC-Unique: EYTwYe6OPkCTLvOmQrOXMQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABB7496DC83;
 Thu, 16 Mar 2023 17:57:50 +0000 (UTC)
Received: from localhost (unknown [10.39.193.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8F70492B00;
 Thu, 16 Mar 2023 17:57:49 +0000 (UTC)
Date: Thu, 16 Mar 2023 13:57:48 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 damien.lemoal@opensource.wdc.com, hare@suse.de,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 dmitry.fomichev@wdc.com, Thomas Huth <thuth@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v16 0/8] Add support for zoned device
Message-ID: <20230316175748.GA63600@fedora>
References: <20230310102403.61347-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xInePHa6e0PjMl6x"
Content-Disposition: inline
In-Reply-To: <20230310102403.61347-1-faithilikerun@gmail.com>
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


--xInePHa6e0PjMl6x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2023 at 06:23:55PM +0800, Sam Li wrote:
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
> Zones, four zone operations and Zone Append.
>=20
> There has been a debate on whethre introducing new zoned_host_device Bloc=
kDriver
> specifically for zoned devices. In the end, it's been decided to stick to
> existing host_device BlockDriver interface by only adding new zoned opera=
tions
> inside it. The benefit of that is to avoid further changes - one example =
is
> command line syntax - to the applications like Libvirt using QEMU zoned
> emulation.
>=20
> It can be tested on a null_blk device using qemu-io or qemu-iotests. For
> example, to test zone report using qemu-io:
> $ path/to/qemu-io --image-opts -n driver=3Dhost_device,filename=3D/dev/nu=
llb0
> -c "zrp offset nr_zones"
>=20
> v16:
> - update zoned_host device name to host_device [Stefan]
> - fix probing zoned device blocksizes [Stefan]
> - Use empty fields instead of changing struct size of BlkRwCo [Kevin, Ste=
fan]
>=20
> v15:
> - drop zoned_host_device BlockDriver
> - add zoned device option to host_device driver instead of introducing a =
new
>   zoned_host_device BlockDriver [Stefan]
>=20
> v14:
> - address Stefan's comments of probing block sizes
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
>  block.c                                |  19 ++
>  block/block-backend.c                  | 133 ++++++++
>  block/file-posix.c                     | 446 +++++++++++++++++++++++--
>  block/io.c                             |  41 +++
>  block/raw-format.c                     |  18 +
>  block/trace-events                     |   2 +
>  docs/devel/zoned-storage.rst           |  43 +++
>  docs/system/qemu-block-drivers.rst.inc |   6 +
>  include/block/block-common.h           |  43 +++
>  include/block/block-io.h               |   9 +
>  include/block/block_int-common.h       |  29 ++
>  include/block/raw-aio.h                |   6 +-
>  include/sysemu/block-backend-io.h      |  18 +
>  meson.build                            |   4 +
>  qemu-io-cmds.c                         | 149 +++++++++
>  tests/qemu-iotests/tests/zoned.out     |  53 +++
>  tests/qemu-iotests/tests/zoned.sh      |  86 +++++
>  17 files changed, 1068 insertions(+), 37 deletions(-)
>  create mode 100644 docs/devel/zoned-storage.rst
>  create mode 100644 tests/qemu-iotests/tests/zoned.out
>  create mode 100755 tests/qemu-iotests/tests/zoned.sh
>=20
> --=20
> 2.39.2
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--xInePHa6e0PjMl6x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQTWJwACgkQnKSrs4Gr
c8jZuwgApjWTNHu9S6y3J6NT9CmF22vxHMJJIXfTktXq17olbtGGhBGoTVB8f5Nr
lmcI0wXEg6R/bjx9VVm9T/7PfNaDcgmaNopF2CwvpYtsJPGw5xD3Ud57BpNPowjx
Vh9uP8ECcfX6QI+4VY02PVtOIoBpx7A3fgSgvARKUIWt5HvTqIDINT5w0i8mAU1g
HTG35DjFjt6DJmelgwfR75/C3rCsibSaZ5y25qBS31teqYE6LOlLwy5Ckau9W6iN
6XhseWnU3yp9D/SJvhlbwZ76vwy7bZWPP6r/K8CqzKkR9ssl92i1W8F4lBENJnrf
56hpZnHj8k3zy+EipJTof0IjDwVPDg==
=BGav
-----END PGP SIGNATURE-----

--xInePHa6e0PjMl6x--


