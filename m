Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8036143FFE
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 15:53:53 +0100 (CET)
Received: from localhost ([::1]:56132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ituue-0005Vg-UW
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 09:53:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44699)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ituVx-0001VA-H2
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 09:28:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ituVv-0000gk-L7
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 09:28:21 -0500
Received: from relay.sw.ru ([185.231.240.75]:50834)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ituVt-0000di-5n; Tue, 21 Jan 2020 09:28:17 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ituVo-0000mn-4M; Tue, 21 Jan 2020 17:28:12 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/2] backup-top failure path fix
Date: Tue, 21 Jan 2020 17:28:00 +0300
Message-Id: <20200121142802.21467-1-vsementsov@virtuozzo.com>
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

v2: rebase on Max's block tree
 01: add Max's r-b
 02: improve wording

Vladimir Sementsov-Ogievskiy (2):
  block/backup-top: fix failure path
  iotests: add test for backup-top failure on permission activation

 block/backup-top.c         | 21 +++++----
 tests/qemu-iotests/283     | 92 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/283.out |  8 ++++
 tests/qemu-iotests/group   |  1 +
 4 files changed, 113 insertions(+), 9 deletions(-)
 create mode 100644 tests/qemu-iotests/283
 create mode 100644 tests/qemu-iotests/283.out

-- 
2.21.0


