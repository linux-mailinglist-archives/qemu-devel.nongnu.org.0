Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D92353C23BB
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 14:53:22 +0200 (CEST)
Received: from localhost ([::1]:44792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1q0P-0005Rc-Sl
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 08:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1py3-0002Jw-K9
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:50:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1py0-0003Hv-Lf
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:50:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625835051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bzqxxchc7A8CrDGpzrnxuF7WZiBVOHyZVI1S12UF6Rk=;
 b=aVj+tIQBodpjbRRlcMPgn8Pds6ykbqjHdloeN+wnguXkPll9HZ06a76FlA3NaU+n+eQduL
 b13CXxN9vtobVCOvHXM7H9jSyuYcB99nWaXe/9YtCPvFNP9LURLYmFmtsU+KmFla/ETbsN
 7vOMXTxKVqpkbJBcKz7/5qLL0FDhlr4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-eWYo6h3mNvCADRzwprLMRw-1; Fri, 09 Jul 2021 08:50:48 -0400
X-MC-Unique: eWYo6h3mNvCADRzwprLMRw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9E2780006E;
 Fri,  9 Jul 2021 12:50:47 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-203.ams2.redhat.com [10.36.113.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CEF960843;
 Fri,  9 Jul 2021 12:50:45 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/28] Block layer patches
Date: Fri,  9 Jul 2021 14:50:07 +0200
Message-Id: <20210709125035.191321-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9db3065c62a983286d06c207f4981408cf42184d:

  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-07-08 16:30:18 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to e60edf69e2f64e818466019313517a2e6d6b63f4:

  block: Make blockdev-reopen stable API (2021-07-09 13:19:11 +0200)

----------------------------------------------------------------
Block layer patches

- Make blockdev-reopen stable
- Remove deprecated qemu-img backing file without format
- rbd: Convert to coroutines and add write zeroes support
- rbd: Updated MAINTAINERS
- export/fuse: Allow other users access to the export
- vhost-user: Fix backends without multiqueue support
- Fix drive-backup transaction endless drained section

----------------------------------------------------------------
Alberto Garcia (4):
      block: Add bdrv_reopen_queue_free()
      block: Support multiple reopening with x-blockdev-reopen
      iotests: Test reopening multiple devices at the same time
      block: Make blockdev-reopen stable API

Eric Blake (3):
      qcow2: Prohibit backing file changes in 'qemu-img amend'
      qemu-img: Require -F with -b backing image
      qemu-img: Improve error for rebase without backing format

Heinrich Schuchardt (1):
      util/uri: do not check argument of uri_free()

Ilya Dryomov (1):
      MAINTAINERS: update block/rbd.c maintainer

Kevin Wolf (3):
      vhost-user: Fix backends without multiqueue support
      qcow2: Fix dangling pointer after reopen for 'file'
      block: Acquire AioContexts during bdrv_reopen_multiple()

Max Reitz (6):
      export/fuse: Pass default_permissions for mount
      export/fuse: Add allow-other option
      export/fuse: Give SET_ATTR_SIZE its own branch
      export/fuse: Let permissions be adjustable
      iotests/308: Test +w on read-only FUSE exports
      iotests/fuse-allow-other: Test allow-other

Or Ozeri (1):
      block/rbd: Add support for rbd image encryption

Peter Lieven (8):
      block/rbd: bump librbd requirement to luminous release
      block/rbd: store object_size in BDRVRBDState
      block/rbd: update s->image_size in qemu_rbd_getlength
      block/rbd: migrate from aio to coroutines
      block/rbd: add write zeroes support
      block/rbd: drop qemu_rbd_refresh_limits
      block/rbd: fix type of task->complete
      MAINTAINERS: add block/rbd.c reviewer

Vladimir Sementsov-Ogievskiy (1):
      blockdev: fix drive-backup transaction endless drained section

 qapi/block-core.json                               | 134 +++-
 qapi/block-export.json                             |  33 +-
 docs/system/deprecated.rst                         |  32 -
 docs/system/removed-features.rst                   |  31 +
 include/block/block.h                              |   3 +
 block.c                                            | 108 +--
 block/export/fuse.c                                | 121 +++-
 block/nfs.c                                        |   4 +-
 block/qcow2.c                                      |  42 +-
 block/rbd.c                                        | 749 +++++++++++++--------
 block/replication.c                                |   7 +
 block/ssh.c                                        |   4 +-
 blockdev.c                                         |  77 ++-
 hw/virtio/vhost-user.c                             |   3 +
 qemu-img.c                                         |   9 +-
 qemu-io-cmds.c                                     |   7 +-
 util/uri.c                                         |  22 +-
 MAINTAINERS                                        |   3 +-
 meson.build                                        |   7 +-
 tests/qemu-iotests/040                             |   4 +-
 tests/qemu-iotests/041                             |   6 +-
 tests/qemu-iotests/061                             |   3 +
 tests/qemu-iotests/061.out                         |   3 +-
 tests/qemu-iotests/082.out                         |   6 +-
 tests/qemu-iotests/114                             |  18 +-
 tests/qemu-iotests/114.out                         |  11 +-
 tests/qemu-iotests/155                             |   9 +-
 tests/qemu-iotests/165                             |   4 +-
 tests/qemu-iotests/245                             |  78 ++-
 tests/qemu-iotests/245.out                         |   4 +-
 tests/qemu-iotests/248                             |   4 +-
 tests/qemu-iotests/248.out                         |   2 +-
 tests/qemu-iotests/296                             |  11 +-
 tests/qemu-iotests/298                             |   4 +-
 tests/qemu-iotests/301                             |   4 +-
 tests/qemu-iotests/301.out                         |  16 +-
 tests/qemu-iotests/308                             |  20 +-
 tests/qemu-iotests/308.out                         |   6 +-
 tests/qemu-iotests/common.rc                       |   6 +-
 tests/qemu-iotests/tests/fuse-allow-other          | 168 +++++
 tests/qemu-iotests/tests/fuse-allow-other.out      |  88 +++
 .../qemu-iotests/tests/remove-bitmap-from-backing  |  22 +-
 42 files changed, 1350 insertions(+), 543 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/fuse-allow-other
 create mode 100644 tests/qemu-iotests/tests/fuse-allow-other.out


