Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A2513DF57
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 16:57:02 +0100 (CET)
Received: from localhost ([::1]:44218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is7W1-0007OM-IA
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 10:57:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36839)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1is7UG-0005nG-QC
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:55:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1is7UF-0001b8-RT
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:55:12 -0500
Received: from relay.sw.ru ([185.231.240.75]:58018)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1is7UB-0001VL-1u; Thu, 16 Jan 2020 10:55:07 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1is7Tz-00021t-Nm; Thu, 16 Jan 2020 18:54:55 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] backup-top failure path fix
Date: Thu, 16 Jan 2020 18:54:50 +0300
Message-Id: <20200116155452.30972-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, qemu-stable@nongnu.org, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Here is a small crash fix.

Vladimir Sementsov-Ogievskiy (2):
  block/backup-top: fix failure path
  iotests: add test for backup-top failure on permission activation

 block/backup-top.c         | 21 ++++++-----
 tests/qemu-iotests/283     | 75 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/283.out |  8 ++++
 tests/qemu-iotests/group   |  1 +
 4 files changed, 96 insertions(+), 9 deletions(-)
 create mode 100644 tests/qemu-iotests/283
 create mode 100644 tests/qemu-iotests/283.out

-- 
2.21.0


