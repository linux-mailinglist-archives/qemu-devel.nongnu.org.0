Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 688B05F4A50
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 22:29:34 +0200 (CEST)
Received: from localhost ([::1]:46008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofoXl-0000lf-FT
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 16:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ofo6z-0004TG-TG
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 16:01:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ofo6y-0006MJ-3y
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 16:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664913711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rxqxkO7bM6o6i6w28uoq7IPzbTSVI3gOYtOW8urS4BI=;
 b=XQbd04kWbbgJDfWDO+AuEISns7cCAsq10Xf/PaUTyD0MUNAq1PzhniO7eSsfQaYT0XfUuy
 Jrzj0dVt9yqIWAffZ+Os5fddzoXLHr8f6OVpdkoaUdcpDUH7/ANP445vSZGcFY62zlQa35
 oEmi4F9Cbni4Qosm6F/KHi1GcLHaRqM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-NGaIm1v3OCC0UXx7ky38JQ-1; Tue, 04 Oct 2022 16:01:47 -0400
X-MC-Unique: NGaIm1v3OCC0UXx7ky38JQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 710AB185A794;
 Tue,  4 Oct 2022 20:01:44 +0000 (UTC)
Received: from localhost (unknown [10.39.192.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C84B949BB63;
 Tue,  4 Oct 2022 20:01:43 +0000 (UTC)
Date: Tue, 4 Oct 2022 15:00:37 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, kwolf@redhat.com,
 hreitz@redhat.com, mst@redhat.com, den@virtuozzo.com
Subject: Re: [RFC patch 0/1] block: vhost-blk backend
Message-ID: <YzyC1Y+c+e4IVDRM@fedora>
References: <20220725205527.313973-1-andrey.zhadchenko@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mD3GwKt+8fya6a3Q"
Content-Disposition: inline
In-Reply-To: <20220725205527.313973-1-andrey.zhadchenko@virtuozzo.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--mD3GwKt+8fya6a3Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2022 at 11:55:26PM +0300, Andrey Zhadchenko wrote:
> Although QEMU virtio-blk is quite fast, there is still some room for
> improvements. Disk latency can be reduced if we handle virito-blk requests
> in host kernel so we avoid a lot of syscalls and context switches.
>=20
> The biggest disadvantage of this vhost-blk flavor is raw format.
> Luckily Kirill Thai proposed device mapper driver for QCOW2 format to att=
ach
> files as block devices: https://www.spinics.net/lists/kernel/msg4292965.h=
tml
>=20
> Also by using kernel modules we can bypass iothread limitation and finaly=
 scale
> block requests with cpus for high-performance devices. This is planned to=
 be
> implemented in next version.
>=20
> Linux kernel module part:
> https://lore.kernel.org/kvm/20220725202753.298725-1-andrey.zhadchenko@vir=
tuozzo.com/
>=20
> test setups and results:
> fio --direct=3D1 --rw=3Drandread  --bs=3D4k  --ioengine=3Dlibaio --iodept=
h=3D128
> QEMU drive options: cache=3Dnone
> filesystem: xfs
>=20
> SSD:
>                | randread, IOPS  | randwrite, IOPS |
> Host           |      95.8k	 |	85.3k	   |
> QEMU virtio    |      57.5k	 |	79.4k	   |
> QEMU vhost-blk |      95.6k	 |	84.3k	   |
>=20
> RAMDISK (vq =3D=3D vcpu):
>                  | randread, IOPS | randwrite, IOPS |
> virtio, 1vcpu    |	123k	  |	 129k       |
> virtio, 2vcpu    |	253k (??) |	 250k (??)  |
> virtio, 4vcpu    |	158k	  |	 154k       |
> vhost-blk, 1vcpu |	110k	  |	 113k       |
> vhost-blk, 2vcpu |	247k	  |	 252k       |
> vhost-blk, 4vcpu |	576k	  |	 567k       |
>=20
> Andrey Zhadchenko (1):
>   block: add vhost-blk backend
>=20
>  configure                     |  13 ++
>  hw/block/Kconfig              |   5 +
>  hw/block/meson.build          |   1 +
>  hw/block/vhost-blk.c          | 395 ++++++++++++++++++++++++++++++++++
>  hw/virtio/meson.build         |   1 +
>  hw/virtio/vhost-blk-pci.c     | 102 +++++++++
>  include/hw/virtio/vhost-blk.h |  44 ++++
>  linux-headers/linux/vhost.h   |   3 +
>  8 files changed, 564 insertions(+)
>  create mode 100644 hw/block/vhost-blk.c
>  create mode 100644 hw/virtio/vhost-blk-pci.c
>  create mode 100644 include/hw/virtio/vhost-blk.h

vhost-blk has been tried several times in the past. That doesn't mean it
cannot be merged this time, but past arguments should be addressed:

- What makes it necessary to move the code into the kernel? In the past
  the performance results were not very convincing. The fastest
  implementations actually tend to be userspace NVMe PCI drivers that
  bypass the kernel! Bypassing the VFS and submitting block requests
  directly was not a huge boost. The syscall/context switch argument
  sounds okay but the numbers didn't really show that kernel block I/O
  is much faster than userspace block I/O.

  I've asked for more details on the QEMU command-line to understand
  what your numbers show. Maybe something has changed since previous
  times when vhost-blk has been tried.

  The only argument I see is QEMU's current 1 IOThread per virtio-blk
  device limitation, which is currently being worked on. If that's the
  only reason for vhost-blk then is it worth doing all the work of
  getting vhost-blk shipped (kernel, QEMU, and libvirt changes)? It
  seems like a short-term solution.

- The security impact of bugs in kernel vhost-blk code is more serious
  than bugs in a QEMU userspace process.

- The management stack needs to be changed to use vhost-blk whereas
  QEMU can be optimized without affecting other layers.

Stefan

--mD3GwKt+8fya6a3Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM8gtUACgkQnKSrs4Gr
c8iqRQf9FSZM9Gp+LszY2PJy2zMSmgMY8B9k8bfa1VYC61gnTxJw58UausiHw/7O
gMDIpomDbRcG6FODYgGMTXOEsAj7/eemXTVJ3MzhoMyG+qogKrOWL4l7TqjV4y/q
tw2QZzv4Ooc58DAC2+Fut0yDqZB7c/hfrEMpd05cA8DNacOOVvM6anN2O0fv5ATs
+Pl2RRmI6mjSkhOtnejA7kJ/9yvDLjZUI2GVoBGFfNmgeYVIyXXp7m8lE0oYvKjA
XrCoQeiG79NQB+J3dpfIm/ob5EA5UZHdPJSBcGCPklgNHCv6to/c6o3FxJ3AdkyH
63MLpxfdARnXARPDaVCfyRUEU8kM0w==
=DQaR
-----END PGP SIGNATURE-----

--mD3GwKt+8fya6a3Q--


