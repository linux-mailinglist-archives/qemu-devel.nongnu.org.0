Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17AC58C9FF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 15:59:10 +0200 (CEST)
Received: from localhost ([::1]:39030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL3Hi-0006Ky-1x
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 09:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oL3BZ-00055H-Mh
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 09:52:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oL3BX-000379-Lm
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 09:52:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659966767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VSAf8h/aPNpcAvn0G6hnrlXkRzKveyOgF2qKsRnSCBU=;
 b=JWdhMBIhONQDUVwFQ0C7AMbZA4vAYGjkZ6mP/VWHzInNCzGFnjpgdW5Uh5ap8fZPf2WiFm
 rfZ4HLQysYCDmdvaX4W0uj7OiOrJgXL6HgFM/k1iTNf+NuDT9jwj8sA+116+RbtI5QeyfL
 OZuUNsfa9BX3c4XvOQmVOoWz2QmVGmw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-FzFaZ87QPiqinbDJ7TGJnQ-1; Mon, 08 Aug 2022 09:52:43 -0400
X-MC-Unique: FzFaZ87QPiqinbDJ7TGJnQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AFC33C01E03;
 Mon,  8 Aug 2022 13:52:43 +0000 (UTC)
Received: from localhost (unknown [10.39.194.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FBF71121314;
 Mon,  8 Aug 2022 13:52:42 +0000 (UTC)
Date: Sat, 6 Aug 2022 08:26:33 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, hare@suse.de,
 dmitry.fomichev@wdc.com, Kevin Wolf <kwolf@redhat.com>,
 damien.lemoal@opensource.wdc.com, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v6 8/8] docs/zoned-storage: add zoned device documentation
Message-ID: <Yu5d+eqC9F+6H+j4@fedora>
References: <20220805075751.77499-1-faithilikerun@gmail.com>
 <20220805075751.77499-9-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nYVpGg2ROYBNzPqq"
Content-Disposition: inline
In-Reply-To: <20220805075751.77499-9-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--nYVpGg2ROYBNzPqq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 05, 2022 at 03:57:51PM +0800, Sam Li wrote:
> Add the documentation about the zoned device support to virtio-blk
> emulation.
>=20
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  docs/devel/zoned-storage.rst           | 41 ++++++++++++++++++++++++++
>  docs/system/qemu-block-drivers.rst.inc |  6 ++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 docs/devel/zoned-storage.rst
>=20
> diff --git a/docs/devel/zoned-storage.rst b/docs/devel/zoned-storage.rst
> new file mode 100644
> index 0000000000..c3f1e477ac
> --- /dev/null
> +++ b/docs/devel/zoned-storage.rst
> @@ -0,0 +1,41 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +zoned-storage
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Zoned Block Devices (ZBDs) devide the LBA space into block regions calle=
d zones
> +that are larger than the LBA size. It can only allow sequential writes, =
which
> +reduces write amplification in SSDs, leading to higher throughput and in=
creased
> +capacity. More details about ZBDs can be found at:
> +
> +https://zonedstorage.io/docs/introduction/zoned-storage
> +
> +1. Block layer APIs for zoned storage
> +-------------------------------------
> +QEMU block layer has three zoned storage model:
> +- BLK_Z_HM: This model only allows sequential writes access. It supports=
 a set
> +of ZBD-specific I/O request that used by the host to manage device zones.
> +- BLK_Z_HA: It deals with both sequential writes and random writes acces=
s.
> +- BLK_Z_NONE: Regular block devices and drive-managed ZBDs are treated as
> +non-zoned devices.
> +
> +The block device information is resided inside BlockDriverState. QEMU us=
es

s/is resided/resides/

> +BlockLimits struct(BlockDriverState::bl) that is continuously accessed b=
y the
> +block layer while processing I/O requests. A BlockBackend has a root poi=
nter to
> +a BlockDriverState graph(for example, raw format on top of file-posix). =
The
> +zoned storage information can be propagated from the leaf BlockDriverSta=
te all
> +the way up to the BlockBackend. If the zoned storage model in file-posix=
 is
> +set to BLK_Z_HM, then block drivers will declare support for zoned host =
device.
> +
> +The block layer APIs support commands needed for zoned storage devices,
> +including report zones, four zone operations, and zone append.
> +
> +2. Emulating zoned storage controllers
> +--------------------------------------
> +When the BlockBackend's BlockLimits model reports a zoned storage device=
, users
> +like the virtio-blk emulation or the qemu-io-cmds.c utility can use bloc=
k layer
> +APIs for zoned storage emulation or testing.
> +
> +For example, the command line for zone report testing a null_blk device =
of
> +qemu-io-cmds.c is:
> +$ path/to/qemu-io --image-opts driver=3Dzoned_host_device,filename=3D/de=
v/nullb0 -c
> +"zrp offset nr_zones"
> diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-bl=
ock-drivers.rst.inc
> index dfe5d2293d..0b97227fd9 100644
> --- a/docs/system/qemu-block-drivers.rst.inc
> +++ b/docs/system/qemu-block-drivers.rst.inc
> @@ -430,6 +430,12 @@ Hard disks
>    you may corrupt your host data (use the ``-snapshot`` command
>    line option or modify the device permissions accordingly).
> =20
> +Zoned block devices
> +  Zoned block devices can be passed through to the guest if the emulated=
 storage
> +  controller supports zoned storage. Use ``--blockdev zoned_host_device,
> +  node-name=3Ddrive0,filename=3D/dev/nullb0`` to pass through ``/dev/nul=
lb0``
> +  as ``drive0``.
> +
>  Windows
>  ^^^^^^^

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--nYVpGg2ROYBNzPqq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLuXfkACgkQnKSrs4Gr
c8iAfgf+JucPSR7nuhRizVlUK+CYrMcBZQfw9IqAoxEMI7PhnX1ogIsfZpZMktY1
uyDCh0w6GC6Yh60X8cc9gTK6oh+WQdntjIiOKNoVS7D1u2nVSURaZEMTz/M9UJUa
hcJZgso9wwX3tO+TyvfW6GeIo3oY/AkwHyqGRYrpm+9Ston533vEoNcsoq6/95BM
PPAvoNfZnBkSODpw5hO/7xzxCxtzxvnRzmsBe5uQ+muyACvUo1Ql1lVLiUAYfGa8
ouvogYHoOB8W5Ul0IlKJpHU5F06NYWixk9chacMjLS9BDKoNy8lR6nP7mIkStDEJ
KvDjYHIvk3b/sMKsCPu7uXhfLcfaDg==
=M4/g
-----END PGP SIGNATURE-----

--nYVpGg2ROYBNzPqq--


