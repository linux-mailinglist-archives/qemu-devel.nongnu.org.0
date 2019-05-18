Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BC022163
	for <lists+qemu-devel@lfdr.de>; Sat, 18 May 2019 05:32:29 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56997 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRq5F-00031C-4b
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 23:32:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hRq1V-0000bJ-LE
	for qemu-devel@nongnu.org; Fri, 17 May 2019 23:28:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hRq1U-00036Y-P7
	for qemu-devel@nongnu.org; Fri, 17 May 2019 23:28:37 -0400
Received: from m12-18.163.com ([220.181.12.18]:40788)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>)
	id 1hRq1T-00034p-As; Fri, 17 May 2019 23:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=wqsPUSs1VwoIXuA/zY
	7YR9mqlMCl+nmGzwi02r8ZDMs=; b=lC81mwcBLczt6As6lbVqdV2kQ93VfnppP0
	5lbwNYcCWGobHRPIU4HFLMxNNh4fKhMkDWSRPbQ41PgIgBrr2L2qS9RfS1UO2NmJ
	sbp5DYZDWl+gdIlUUknJaoCs/WuIcnozUyyOiOwZCrO0RW8Znc241iKnNae4mUpu
	UpnA4Gt0E=
Received: from localhost.localdomain (unknown [183.159.73.182])
	by smtp14 (Coremail) with SMTP id EsCowACXzsrXe99czqL5Gg--.37649S4;
	Sat, 18 May 2019 11:28:33 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: alex.williamson@redhat.com,
	lvivier@redhat.com
Date: Fri, 17 May 2019 20:28:10 -0700
Message-Id: <20190518032811.60341-3-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190518032811.60341-1-liq3ea@163.com>
References: <20190518032811.60341-1-liq3ea@163.com>
X-CM-TRANSID: EsCowACXzsrXe99czqL5Gg--.37649S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF4DWr4xAFWfKFy5Aw1rXrb_yoWfCwbEv3
	W8K397C3WvgrZ29rWqyrW7Zry7Zw4UKFsakFyxt3Wq93y5Aay5CwnruFZ7Zr4xCr12y34D
	Cw4vkasxAF13CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb73vUUUUUU==
X-Originating-IP: [183.159.73.182]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbBLwG4bVUMJXo4VQAAsQ
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.18
Subject: [Qemu-devel] [PATCH 3/4] vfio: platform: fix a typo
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
Cc: qemu-trivial@nongnu.org, philmd@redhat.com, liq3ea@gmail.com,
	qemu-devel@nongnu.org, Li Qiang <liq3ea@163.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CC: qemu-trivial@nongnu.org
Signed-off-by: Li Qiang <liq3ea@163.com>
---
 hw/vfio/platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index e59a0234dd..d52d6552e0 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -72,7 +72,7 @@ static VFIOINTp *vfio_init_intp(VFIODevice *vbasedev,
         g_free(intp->interrupt);
         g_free(intp);
         error_setg_errno(errp, -ret,
-                         "failed to initialize trigger eventd notifier");
+                         "failed to initialize trigger eventfd notifier");
         return NULL;
     }
     if (vfio_irq_is_automasked(intp)) {
@@ -84,7 +84,7 @@ static VFIOINTp *vfio_init_intp(VFIODevice *vbasedev,
             g_free(intp->unmask);
             g_free(intp);
             error_setg_errno(errp, -ret,
-                             "failed to initialize resample eventd notifier");
+                             "failed to initialize resample eventfd notifier");
             return NULL;
         }
     }
-- 
2.17.1



