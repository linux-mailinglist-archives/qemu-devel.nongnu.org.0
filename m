Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E2828BF3F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 19:52:12 +0200 (CEST)
Received: from localhost ([::1]:43180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS1zX-0006Mf-Ta
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 13:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kS1wb-0003ja-P6; Mon, 12 Oct 2020 13:49:09 -0400
Received: from relay.sw.ru ([185.231.240.75]:33690 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kS1wW-0007kf-9o; Mon, 12 Oct 2020 13:49:09 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kS1vZ-0047iC-PS; Mon, 12 Oct 2020 20:48:05 +0300
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com, fam@euphon.net,
 stefanha@redhat.com, armbru@redhat.com, jsnow@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, den@openvz.org,
 vsementsov@virtuozzo.com, andrey.shinkevich@virtuozzo.com
Subject: [PATCH v11 06/13] block: modify the comment for BDRV_REQ_PREFETCH flag
Date: Mon, 12 Oct 2020 20:43:18 +0300
Message-Id: <1602524605-481160-7-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1602524605-481160-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1602524605-481160-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 13:44:17
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Reply-to: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
From: Andrey Shinkevich via <qemu-devel@nongnu.org>

Modify the comment for the flag BDRV_REQ_PREFETCH as we are going to
use it alone and pass it to the COR-filter driver for further
processing.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 include/block/block.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 981ab5b..2b7efd1 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -71,9 +71,10 @@ typedef enum {
     BDRV_REQ_NO_FALLBACK        = 0x100,
 
     /*
-     * BDRV_REQ_PREFETCH may be used only together with BDRV_REQ_COPY_ON_READ
-     * on read request and means that caller doesn't really need data to be
-     * written to qiov parameter which may be NULL.
+     * BDRV_REQ_PREFETCH may be used together with the BDRV_REQ_COPY_ON_READ
+     * flag or when the COR-filter applied to read operations and means that
+     * caller doesn't really need data to be written to qiov parameter which
+     * may be NULL.
      */
     BDRV_REQ_PREFETCH  = 0x200,
     /* Mask of valid flags */
-- 
1.8.3.1


