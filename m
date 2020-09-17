Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9582626D1F7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 05:58:21 +0200 (CEST)
Received: from localhost ([::1]:43360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIl3s-0006t8-N0
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 23:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaolichang@huawei.com>)
 id 1kIl2i-0005Cv-GT; Wed, 16 Sep 2020 23:57:08 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:38098 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaolichang@huawei.com>)
 id 1kIl2g-0000Zs-AS; Wed, 16 Sep 2020 23:57:08 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id F383786E966719DD705F;
 Thu, 17 Sep 2020 11:57:01 +0800 (CST)
Received: from localhost (10.174.187.87) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Thu, 17 Sep 2020
 11:56:51 +0800
From: zhaolichang <zhaolichang@huawei.com>
To: <qemu-trivial@nongnu.org>
Subject: [PATCH V2 09/10] qapi/: fix some comment spelling errors
Date: Thu, 17 Sep 2020 11:54:12 +0800
Message-ID: <20200917035413.701-10-zhaolichang@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20200917035413.701-1-zhaolichang@huawei.com>
References: <20200917035413.701-1-zhaolichang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.87]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=zhaolichang@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 23:20:58
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: zhaolichang <zhaolichang@huawei.com>, qemu-devel@nongnu.org, Markus
 Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I found that there are many spelling errors in the comments of qemu,
so I used the spellcheck tool to check the spelling errors
and finally found some spelling errors in the qapi folder.

Signed-off-by: zhaolichang <zhaolichang@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/block-core.json | 4 ++--
 qapi/crypto.json     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 2d94873ca0..3c16f1e11d 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1795,7 +1795,7 @@
 #
 # @block-backend: corresponds to BlockBackend
 #
-# @block-job: corresonds to BlockJob
+# @block-job: corresponds to BlockJob
 #
 # @block-driver: corresponds to BlockDriverState
 #
@@ -2067,7 +2067,7 @@
 # @target: name of the destination dirty bitmap
 #
 # @bitmaps: name(s) of the source dirty bitmap(s) at @node and/or fully
-#           specifed BlockDirtyBitmap elements. The latter are supported
+#           specified BlockDirtyBitmap elements. The latter are supported
 #           since 4.1.
 #
 # Since: 4.0
diff --git a/qapi/crypto.json b/qapi/crypto.json
index bb7930d332..2aebe6fa20 100644
--- a/qapi/crypto.json
+++ b/qapi/crypto.json
@@ -336,7 +336,7 @@
 #                 written into added active keyslots
 #
 # @old-secret:    Optional (for deactivation only)
-#                 If given will deactive all keyslots that
+#                 If given will deactivate all keyslots that
 #                 match password located in QCryptoSecret with this ID
 #
 # @iter-time:     Optional (for activation only)
@@ -354,7 +354,7 @@
 #                 keyslot to deactivate
 #
 # @secret:        Optional. The ID of a QCryptoSecret object providing the
-#                 password to use to retrive current master key.
+#                 password to use to retrieve current master key.
 #                 Defaults to the same secret that was used to open the image
 #
 #
-- 
2.26.2.windows.1


