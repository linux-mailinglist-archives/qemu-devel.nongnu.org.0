Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8879A3BBC9B
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 14:04:26 +0200 (CEST)
Received: from localhost ([::1]:44232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0NKr-0008WL-JX
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 08:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <8d6cb100731c4d28535adbf2a3c2d1f29be3fef4@lizzy.crudebyte.com>)
 id 1m0NGR-0004sb-JI
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 07:59:52 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:34787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <8d6cb100731c4d28535adbf2a3c2d1f29be3fef4@lizzy.crudebyte.com>)
 id 1m0NGQ-0008KO-1P
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 07:59:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=84i14xJ2o2xziWoVMc2gOmTGKrmKv22i1pwABDGVdHA=; b=mNSCL
 i5MsS01Imk5/O+D03zImfdrLgnWvLXoowg4kBrpaL4Im+ZXERAEN40hL6dtTYWZqrQENa2f6FEbW9
 LHggFhPJV0W24dP3qXGBOdpDARjzetzhpgdYgKBCkUE+BufjkX+24lQJH6Prb56OB3/4RYL16LQ6Q
 EUGz1V3DjmBmBw6Nm3eJmdmsNUlZeyoXzFKZkQ367h5KjH4AavVyOuPNsXPB+lZVKpUwcgOyo+Dg7
 SN7M95YvQXGo6L4kDtso83RFOJyk1H8Kkf0ZVn/hDNWlijp+j9KnSoZiAoFcSZ4Oh5TXKmWSCKk3T
 s+ryhRhD2NgYNtVUHEROhTmnCcGoQ==;
Message-Id: <cover.1625483630.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 05 Jul 2021 13:13:51 +0200
Subject: [PULL 0/8] 9p queue 2021-07-05
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=8d6cb100731c4d28535adbf2a3c2d1f29be3fef4@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 711c0418c8c1ce3a24346f058b001c4c5a2f0f81:

  Merge remote-tracking branch 'remotes/philmd/tags/mips-20210702' into staging (2021-07-04 14:04:12 +0100)

are available in the Git repository at:

  https://github.com/cschoenebeck/qemu.git tags/pull-9p-20210705

for you to fetch changes up to 8d6cb100731c4d28535adbf2a3c2d1f29be3fef4:

  9pfs: reduce latency of Twalk (2021-07-05 13:03:16 +0200)

----------------------------------------------------------------
9pfs: misc patches

* Add link to 9p developer docs.

* Fix runtime check whether client supplied relative path is the export
  root.

* Performance optimization of Twalk requests.

* Code cleanup.

----------------------------------------------------------------
Christian Schoenebeck (8):
      9pfs: add link to 9p developer docs
      9pfs: simplify v9fs_walk()
      9pfs: fix not_same_qid()
      9pfs: capture root stat
      9pfs: drop fid_to_qid()
      9pfs: replace not_same_qid() by same_stat_id()
      9pfs: drop root_qid
      9pfs: reduce latency of Twalk

 MAINTAINERS                    |   1 +
 hw/9pfs/9p-local.c             |   5 ++
 hw/9pfs/9p-posix-acl.c         |   5 ++
 hw/9pfs/9p-proxy.c             |   5 ++
 hw/9pfs/9p-synth.c             |   5 ++
 hw/9pfs/9p-util.c              |   5 ++
 hw/9pfs/9p-xattr-user.c        |   5 ++
 hw/9pfs/9p-xattr.c             |   5 ++
 hw/9pfs/9p.c                   | 142 +++++++++++++++++++++++++++--------------
 hw/9pfs/9p.h                   |   2 +-
 hw/9pfs/codir.c                |   5 ++
 hw/9pfs/cofile.c               |   5 ++
 hw/9pfs/cofs.c                 |   5 ++
 hw/9pfs/coth.c                 |   5 ++
 hw/9pfs/coxattr.c              |   5 ++
 hw/9pfs/virtio-9p-device.c     |   5 ++
 hw/9pfs/xen-9p-backend.c       |   5 ++
 tests/qtest/libqos/virtio-9p.c |   5 ++
 tests/qtest/virtio-9p-test.c   |   5 ++
 19 files changed, 177 insertions(+), 48 deletions(-)

