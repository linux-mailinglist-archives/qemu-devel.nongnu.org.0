Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D2B7ADC6
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 18:33:51 +0200 (CEST)
Received: from localhost ([::1]:34542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsV4Q-00035d-E2
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 12:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53238)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hsV3b-0001n5-Q0
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 12:33:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hsV3a-0002Wh-Sz
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 12:32:59 -0400
Received: from relay.sw.ru ([185.231.240.75]:54200)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hsV3Y-0002Un-R2; Tue, 30 Jul 2019 12:32:56 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hsV3V-0001Yw-5M; Tue, 30 Jul 2019 19:32:53 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Tue, 30 Jul 2019 19:32:48 +0300
Message-Id: <20190730163251.755248-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 0/3] backup fixes for 4.1?
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Here are two small fixes.

01 is not a degradation at all, so it's OK for 4.2
02 is degradation of 3.0, so it's possibly OK for 4.2 too,
   but it seems to be real bug and fix is very simple, so,
   may be 4.1 is better

Or you may take the whole series to 4.1 if you want.

Vladimir Sementsov-Ogievskiy (3):
  block/backup: deal with zero detection
  block/backup: disable copy_range for compressed backup
  block/backup: refactor write_flags

 block/backup.c | 31 ++++++++++++++-----------------
 blockdev.c     |  8 ++++----
 2 files changed, 18 insertions(+), 21 deletions(-)

-- 
2.18.0


