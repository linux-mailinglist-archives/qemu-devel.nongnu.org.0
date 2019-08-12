Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A6E8A570
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 20:12:26 +0200 (CEST)
Received: from localhost ([::1]:47596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxEnx-00009J-Kd
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 14:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40984)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hxEnS-0007sA-WF
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 14:11:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hxEnS-0004dz-6L
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 14:11:54 -0400
Received: from relay.sw.ru ([185.231.240.75]:50636)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hxEnQ-0004cI-90; Mon, 12 Aug 2019 14:11:52 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hxEnM-0001oT-FD; Mon, 12 Aug 2019 21:11:48 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Mon, 12 Aug 2019 21:11:44 +0300
Message-Id: <20190812181146.26121-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 0/2] deal with BDRV_BLOCK_RAW
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
Cc: kwolf@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

I'm not sure, is it a bug or a feature, but using qcow2 under raw is
broken. It should be either fixed like I propose (by Max's suggestion)
or somehow forbidden (just forbid backing-file supporting node to be
file child of raw-format node).

Vladimir Sementsov-Ogievskiy (2):
  block/raw-format: switch to BDRV_BLOCK_DATA with BDRV_BLOCK_RECURSE
  iotests: test mirroring qcow2 under raw format

 block/raw-format.c         |  2 +-
 tests/qemu-iotests/263     | 46 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/263.out | 12 ++++++++++
 tests/qemu-iotests/group   |  1 +
 4 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100755 tests/qemu-iotests/263
 create mode 100644 tests/qemu-iotests/263.out

-- 
2.18.0


