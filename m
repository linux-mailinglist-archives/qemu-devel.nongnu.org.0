Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1038332BD5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:23:05 +0100 (CET)
Received: from localhost ([::1]:58530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJf8S-0007Tb-Mg
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:23:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJeew-0003uA-Bw
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:52:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJeei-0000w8-3X
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615305138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6eCngHxAAXHe6Pqr6YihVoPQnSvoBEJsfITAzPXLn9c=;
 b=Z/efj1ax8EW+FCrp4qZYoB042NOgGSYTIFKaeRXAMNhNCBIZy3XmzvHHDCggI1NRrOSsCI
 Aqpukh4H9qA24vivdZtjAgK7MXWgzk6qG6VVAwoKnJpGob1YxXRESA8xqbLRktVAwWYWCi
 BGNwJuI95jgezx8a20u1cy6hhb2a54s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-5dKgm5_xMeqQ6OUbZ-_Zgw-1; Tue, 09 Mar 2021 10:52:12 -0500
X-MC-Unique: 5dKgm5_xMeqQ6OUbZ-_Zgw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C295D26860
 for <qemu-devel@nongnu.org>; Tue,  9 Mar 2021 15:52:11 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F5DE19C46
 for <qemu-devel@nongnu.org>; Tue,  9 Mar 2021 15:52:11 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/17] NBD patches through 2021-03-09
Date: Tue,  9 Mar 2021 09:51:45 -0600
Message-Id: <20210309155202.1312571-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 0436c55edf6b357ff56e2a5bf688df8636f83456:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-03-08 13:51:41 +0000)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-03-09

for you to fetch changes up to 1184b411016bce7590723170aa6b5984518707ec:

  block/qcow2: refactor qcow2_update_options_prepare error paths (2021-03-08 16:04:46 -0600)

----------------------------------------------------------------
nbd patches for 2021-03-09

- Add Vladimir as NBD co-maintainer
- Fix reporting of holes in NBD_CMD_BLOCK_STATUS
- Improve command-line parsing accuracy of large numbers (anything going
through qemu_strtosz), including the deprecation of hex+suffix
- Improve some error reporting in the block layer

----------------------------------------------------------------
Eric Blake (3):
      utils: Enhance testsuite for do_strtosz()
      utils: Improve qemu_strtosz() to have 64 bits of precision
      utils: Deprecate hex-with-suffix sizes

Nir Soffer (1):
      nbd: server: Report holes for raw images

Vladimir Sementsov-Ogievskiy (13):
      MAINTAINERS: add Vladimir as co-maintainer of NBD
      block: check return value of bdrv_open_child and drop error propagation
      blockdev: fix drive_backup_prepare() missed error
      block: drop extra error propagation for bdrv_set_backing_hd
      block/mirror: drop extra error propagation in commit_active_start()
      blockjob: return status from block_job_set_speed()
      block/qcow2: qcow2_get_specific_info(): drop error propagation
      block/qcow2-bitmap: improve qcow2_load_dirty_bitmaps() interface
      block/qcow2-bitmap: return status from qcow2_store_persistent_dirty_bitmaps
      block/qcow2: read_cache_sizes: return status value
      block/qcow2: simplify qcow2_co_invalidate_cache()
      block/qed: bdrv_qed_do_open: deal with errp
      block/qcow2: refactor qcow2_update_options_prepare error paths

 docs/system/deprecated.rst       |   8 ++
 block/qcow2.h                    |   9 ++-
 include/block/blockjob.h         |   2 +-
 block.c                          |   6 +-
 block/blkdebug.c                 |   6 +-
 block/blklogwrites.c             |  10 +--
 block/blkreplay.c                |   6 +-
 block/blkverify.c                |  11 +--
 block/mirror.c                   |  12 ++-
 block/qcow2-bitmap.c             |  65 ++++++++-------
 block/qcow2.c                    |  65 +++++++--------
 block/qed.c                      |  24 +++---
 block/quorum.c                   |   6 +-
 blockdev.c                       |   4 +-
 blockjob.c                       |  18 ++---
 nbd/server.c                     |   4 +-
 tests/test-cutils.c              | 168 ++++++++++++++++++++++++++++++++-------
 tests/test-keyval.c              |  35 +++++---
 tests/test-qemu-opts.c           |  33 +++++---
 util/cutils.c                    |  98 ++++++++++++++++++-----
 MAINTAINERS                      |   2 +
 tests/qemu-iotests/049.out       |  14 +++-
 tests/qemu-iotests/178.out.qcow2 |   3 +-
 tests/qemu-iotests/178.out.raw   |   3 +-
 tests/qemu-iotests/241.out       |   4 +-
 25 files changed, 408 insertions(+), 208 deletions(-)

-- 
2.30.1


