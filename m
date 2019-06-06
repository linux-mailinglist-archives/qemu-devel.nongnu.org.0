Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5829B37867
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 17:46:04 +0200 (CEST)
Received: from localhost ([127.0.0.1]:34228 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYuaZ-0003SC-9M
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 11:46:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYuWK-0000Vy-Nu
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 11:41:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYuWJ-0004al-HV
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 11:41:40 -0400
Received: from relay.sw.ru ([185.231.240.75]:50224)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hYuWJ-0004X7-A2; Thu, 06 Jun 2019 11:41:39 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hYuWC-0000xX-Aw; Thu, 06 Jun 2019 18:41:32 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Thu,  6 Jun 2019 18:41:28 +0300
Message-Id: <20190606154132.153330-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 0/4] block: drop bs->job
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
	xiechanglong.d@gmail.com, armbru@redhat.com, mreitz@redhat.com,
	den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

These series follow Kevin's suggestions under 
https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg00670.html
[Qemu-devel] [PATCH v2 0/2] introduce pinned blk
(hope you don't mind me using exactly your wording in 02)

Vladimir Sementsov-Ogievskiy (4):
  block/replication: drop usage of bs->job
  block/block-backend: blk_iostatus_reset: drop usage of bs->job
  blockdev: blockdev_mark_auto_del: drop usage of bs->job
  block: drop bs->job

 include/block/block_int.h | 15 ++++++---------
 include/block/blockjob.h  |  9 +++++++++
 block.c                   |  2 --
 block/block-backend.c     |  4 ----
 block/mirror.c            | 38 ++++++++++++++++++++++----------------
 block/replication.c       | 21 ++++++++++++---------
 blockdev.c                | 19 +++++++++----------
 blockjob.c                | 22 ++++++++++++++--------
 qmp.c                     |  5 +++++
 block/trace-events        |  2 +-
 10 files changed, 78 insertions(+), 59 deletions(-)

-- 
2.18.0


