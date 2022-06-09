Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E583F545481
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 20:57:02 +0200 (CEST)
Received: from localhost ([::1]:53328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzNL3-0005Cv-S8
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 14:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nzLro-0007sn-QI
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:22:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nzLrd-0003f0-W7
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:22:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654795334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=xd7oMr1/ZYHDKL79wMwNtua/pSLsVhUky1fu6HlL6Mg=;
 b=ajClJbj0y3a/6aB9mCmkoD5LyxBNIfKGjIEcJ6ohLogEXDGzzks2rfnuhapdF4kclWPfxq
 coAclUzZFwyAJjSm4BAsPzSMqdca2JVd0Lrz+zErhZBoA5uRQeDhkRWwPqV1HGI22yPHnH
 0rXntmmdsPuH+Rb2QsjAThQnkg83rWc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54--R47YKc2OZqe119ZcfJrKQ-1; Thu, 09 Jun 2022 13:22:13 -0400
X-MC-Unique: -R47YKc2OZqe119ZcfJrKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7B3D3C11057;
 Thu,  9 Jun 2022 17:22:12 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.195.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3269240D2827;
 Thu,  9 Jun 2022 17:22:12 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 00/18] Block layer patches
Date: Thu,  9 Jun 2022 19:21:31 +0200
Message-Id: <20220609172149.293877-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The following changes since commit 028f2361d0c2d28d6f918fe618f389228ac22b60:

  Merge tag 'pull-target-arm-20220609' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-06-09 06:47:03 -0700)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 7f9a8b3342ff00d3398fdc08264948762d748edb:

  nbd: Drop dead code spotted by Coverity (2022-06-09 18:07:17 +0200)

----------------------------------------------------------------
Block layer patches

- Add vduse-blk export
- Dirty bitmaps: Fix and improve bitmap merge
- gluster: correctly set max_pdiscard
- rbd: report a better error when namespace does not exist
- aio_wait_kick: add missing memory barrier
- Code cleanups

----------------------------------------------------------------
Emanuele Giuseppe Esposito (1):
      aio_wait_kick: add missing memory barrier

Eric Blake (1):
      nbd: Drop dead code spotted by Coverity

Fabian Ebner (1):
      block/gluster: correctly set max_pdiscard

Stefan Hajnoczi (3):
      block: drop unused bdrv_co_drain() API
      block: get rid of blk->guest_block_size
      qsd: document vduse-blk exports

Stefano Garzarella (1):
      block/rbd: report a better error when namespace does not exist

Vladimir Sementsov-Ogievskiy (3):
      block: block_dirty_bitmap_merge(): fix error path
      block: improve block_dirty_bitmap_merge(): don't allocate extra bitmap
      block: simplify handling of try to merge different sized bitmaps

Xie Yongji (8):
      block: Support passing NULL ops to blk_set_dev_ops()
      block/export: Fix incorrect length passed to vu_queue_push()
      block/export: Abstract out the logic of virtio-blk I/O process
      linux-headers: Add vduse.h
      libvduse: Add VDUSE (vDPA Device in Userspace) library
      vduse-blk: Implement vduse-blk export
      vduse-blk: Add vduse-blk resize support
      libvduse: Add support for reconnecting

 qapi/block-export.json                      |   28 +-
 docs/tools/qemu-storage-daemon.rst          |   21 +
 meson_options.txt                           |    4 +
 block/export/vduse-blk.h                    |   20 +
 block/export/virtio-blk-handler.h           |   37 +
 include/block/aio-wait.h                    |    2 +
 include/block/block-io.h                    |    1 -
 include/block/block_int-io.h                |    2 +-
 include/qemu/hbitmap.h                      |   15 +-
 include/sysemu/block-backend-io.h           |    1 -
 linux-headers/linux/vduse.h                 |  306 ++++++
 subprojects/libvduse/include/atomic.h       |    1 +
 subprojects/libvduse/include/compiler.h     |    1 +
 subprojects/libvduse/libvduse.h             |  247 +++++
 block/backup.c                              |    6 +-
 block/block-backend.c                       |   12 +-
 block/dirty-bitmap.c                        |   26 +-
 block/export/export.c                       |    6 +
 block/export/vduse-blk.c                    |  341 +++++++
 block/export/vhost-user-blk-server.c        |  261 +----
 block/export/virtio-blk-handler.c           |  240 +++++
 block/gluster.c                             |    2 +-
 block/io.c                                  |   15 -
 block/monitor/bitmap-qmp-cmds.c             |   40 +-
 block/nbd.c                                 |    8 +-
 block/rbd.c                                 |   24 +
 hw/block/virtio-blk.c                       |    1 -
 hw/block/xen-block.c                        |    1 -
 hw/ide/core.c                               |    1 -
 hw/scsi/scsi-disk.c                         |    1 -
 hw/scsi/scsi-generic.c                      |    1 -
 storage-daemon/qemu-storage-daemon.c        |    9 +
 subprojects/libvduse/libvduse.c             | 1392 +++++++++++++++++++++++++++
 util/aio-wait.c                             |   16 +-
 util/hbitmap.c                              |   25 +-
 MAINTAINERS                                 |    9 +
 block/export/meson.build                    |    7 +-
 meson.build                                 |   34 +
 scripts/meson-buildoptions.sh               |    7 +
 scripts/update-linux-headers.sh             |    2 +-
 subprojects/libvduse/linux-headers/linux    |    1 +
 subprojects/libvduse/meson.build            |   10 +
 subprojects/libvduse/standard-headers/linux |    1 +
 43 files changed, 2830 insertions(+), 355 deletions(-)
 create mode 100644 block/export/vduse-blk.h
 create mode 100644 block/export/virtio-blk-handler.h
 create mode 100644 linux-headers/linux/vduse.h
 create mode 120000 subprojects/libvduse/include/atomic.h
 create mode 120000 subprojects/libvduse/include/compiler.h
 create mode 100644 subprojects/libvduse/libvduse.h
 create mode 100644 block/export/vduse-blk.c
 create mode 100644 block/export/virtio-blk-handler.c
 create mode 100644 subprojects/libvduse/libvduse.c
 create mode 120000 subprojects/libvduse/linux-headers/linux
 create mode 100644 subprojects/libvduse/meson.build
 create mode 120000 subprojects/libvduse/standard-headers/linux


