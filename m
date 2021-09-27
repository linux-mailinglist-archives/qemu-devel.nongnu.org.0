Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0CC41A20A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 00:02:05 +0200 (CEST)
Received: from localhost ([::1]:39672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUyhH-0003IK-Ru
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 18:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybU-0002YI-OD
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybR-0002ml-7d
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632779760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vd/kqlgqTGm3HGN7jGfqX0/UiG6jvgyetaEnUMIFwZo=;
 b=iLafomYunSY7ShtVIQOYQoZ9DesTWYOLBV61mpI1E7Dohta/dfNEwV3kezHEAWv8Uj2xla
 eVq1Gq0XCwcthPKsCWrrA8iv/iMHC1EHU+Rb1Hhne77+2W0Gc5aKO4TIjdZWOYKsejqs5T
 mxgh5QXq3RAxh3jKufAcpeCutCWPL/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-WO8QfaNHMUytvk4Wi1LMYw-1; Mon, 27 Sep 2021 17:55:51 -0400
X-MC-Unique: WO8QfaNHMUytvk4Wi1LMYw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1D235074D
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 21:55:50 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-87.phx2.redhat.com [10.3.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C08BA5D9D5
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 21:55:50 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/20] NBD patches through 2021-09-27
Date: Mon, 27 Sep 2021 16:55:25 -0500
Message-Id: <20210927215545.3930309-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9b03a1178204598055f23f24e438fdddb5935df9:

  Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.2-pull-request' into staging (2021-09-27 11:08:36 +0100)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-09-27

for you to fetch changes up to 3cb015ad05c7c1e07e0deb356cd20e6cd765c0ea:

  nbd/server: Add --selinux-label option (2021-09-27 16:16:28 -0500)

----------------------------------------------------------------
nbd patches for 2021-09-27

- Richard W.M. Jones: Add --selinux-label option to qemu-nbd
- Vladimir Sementsov-Ogievskiy: Rework coroutines of qemu NBD client
  to improve reconnect support
- Eric Blake: Relax server in regards to NBD_OPT_LIST_META_CONTEXT
- Vladimir Sementsov-Ogievskiy: Plumb up 64-bit bulk-zeroing support
  in block layer, in preparation for future NBD spec extensions
- Nir Soffer: Default to writeback cache in qemu-nbd

----------------------------------------------------------------
Eric Blake (1):
      nbd/server: Allow LIST_META_CONTEXT without STRUCTURED_REPLY

Nir Soffer (1):
      qemu-nbd: Change default cache mode to writeback

Richard W.M. Jones (1):
      nbd/server: Add --selinux-label option

Vladimir Sementsov-Ogievskiy (17):
      block/io: bring request check to bdrv_co_(read,write)v_vmstate
      qcow2: check request on vmstate save/load path
      block: use int64_t instead of uint64_t in driver read handlers
      block: use int64_t instead of uint64_t in driver write handlers
      block: use int64_t instead of uint64_t in copy_range driver handlers
      block: make BlockLimits::max_pwrite_zeroes 64bit
      block: use int64_t instead of int in driver write_zeroes handlers
      block/io: allow 64bit write-zeroes requests
      block: make BlockLimits::max_pdiscard 64bit
      block: use int64_t instead of int in driver discard handlers
      block/io: allow 64bit discard requests
      nbd/client-connection: nbd_co_establish_connection(): fix non set errp
      block/nbd: nbd_channel_error() shutdown channel unconditionally
      block/nbd: move nbd_recv_coroutines_wake_all() up
      block/nbd: refactor nbd_recv_coroutines_wake_all()
      block/nbd: drop connection_co
      block/nbd: check that received handle is valid

 docs/tools/qemu-nbd.rst                       |   6 +-
 configure                                     |   8 +-
 meson.build                                   |  10 +-
 include/block/block_int.h                     |  66 ++--
 block/io.c                                    |  44 ++-
 block/blkdebug.c                              |  12 +-
 block/blklogwrites.c                          |  16 +-
 block/blkreplay.c                             |   8 +-
 block/blkverify.c                             |   8 +-
 block/bochs.c                                 |   4 +-
 block/cloop.c                                 |   4 +-
 block/commit.c                                |   2 +-
 block/copy-before-write.c                     |  15 +-
 block/copy-on-read.c                          |  19 +-
 block/crypto.c                                |   8 +-
 block/curl.c                                  |   3 +-
 block/dmg.c                                   |   4 +-
 block/file-posix.c                            |  35 +-
 block/file-win32.c                            |   8 +-
 block/filter-compress.c                       |  15 +-
 block/gluster.c                               |  13 +-
 block/iscsi.c                                 |  58 ++--
 block/mirror.c                                |   8 +-
 block/nbd.c                                   | 443 ++++++++------------------
 block/nfs.c                                   |  12 +-
 block/null.c                                  |  18 +-
 block/nvme.c                                  |  48 ++-
 block/preallocate.c                           |  14 +-
 block/qcow.c                                  |  16 +-
 block/qcow2-cluster.c                         |  14 +-
 block/qcow2.c                                 |  70 ++--
 block/qed.c                                   |   9 +-
 block/quorum.c                                |  11 +-
 block/raw-format.c                            |  36 +--
 block/rbd.c                                   |  20 +-
 block/throttle.c                              |  18 +-
 block/vdi.c                                   |   8 +-
 block/vmdk.c                                  |  14 +-
 block/vpc.c                                   |   8 +-
 block/vvfat.c                                 |   8 +-
 nbd/client-connection.c                       |   1 +
 nbd/client.c                                  |   2 -
 nbd/server.c                                  |   2 +-
 qemu-nbd.c                                    |  45 ++-
 tests/unit/test-bdrv-drain.c                  |  16 +-
 tests/unit/test-block-iothread.c              |  21 +-
 block/trace-events                            |  10 +-
 meson_options.txt                             |   3 +
 tests/docker/dockerfiles/centos8.docker       |   1 +
 tests/docker/dockerfiles/fedora.docker        |   1 +
 tests/docker/dockerfiles/opensuse-leap.docker |   1 +
 tests/docker/dockerfiles/ubuntu1804.docker    |   1 +
 tests/docker/dockerfiles/ubuntu2004.docker    |   1 +
 53 files changed, 648 insertions(+), 598 deletions(-)

-- 
2.31.1


