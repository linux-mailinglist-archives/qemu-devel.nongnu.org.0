Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 412D92C19A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 10:47:37 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59273 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVXlg-0007Eo-6G
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 04:47:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hVXjy-0006Wy-S6
	for qemu-devel@nongnu.org; Tue, 28 May 2019 04:45:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hVXjx-00038I-V4
	for qemu-devel@nongnu.org; Tue, 28 May 2019 04:45:50 -0400
Received: from relay.sw.ru ([185.231.240.75]:57164)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hVXjx-00035u-OA; Tue, 28 May 2019 04:45:49 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hVXju-0001Ec-DJ; Tue, 28 May 2019 11:45:46 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Tue, 28 May 2019 11:45:42 +0300
Message-Id: <20190528084544.183558-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 0/2] block/io: refactor padding
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
Cc: kwolf@redhat.com, fam@euphon.net, stefanha@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all! Here is unifying of padding code in block/io.c, the main
patch is 02.

Vladimir Sementsov-Ogievskiy (2):
  util/iov: introduce qemu_iovec_init_extended
  block/io: refactor padding

 include/qemu/iov.h |   5 +
 block/io.c         | 344 +++++++++++++++++++++++----------------------
 util/iov.c         |  89 ++++++++++++
 3 files changed, 273 insertions(+), 165 deletions(-)

-- 
2.18.0


