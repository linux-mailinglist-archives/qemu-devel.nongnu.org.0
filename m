Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1800C213AB4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 15:16:30 +0200 (CEST)
Received: from localhost ([::1]:37920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrLYL-0001Bo-51
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 09:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jrLW0-0006pU-Ds; Fri, 03 Jul 2020 09:14:04 -0400
Received: from relay.sw.ru ([185.231.240.75]:60374 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jrLVv-0007eV-QN; Fri, 03 Jul 2020 09:14:02 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jrLVj-0004Vj-JD; Fri, 03 Jul 2020 16:13:47 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 01/10] qcow2: Fix capitalization of header extension
 constant.
Date: Fri,  3 Jul 2020 16:13:41 +0300
Message-Id: <1593782030-521984-2-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593782030-521984-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1593782030-521984-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 09:13:53
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the capitalization of the hexadecimal numbers consistent for the
QCOW2 header extension constants in docs/interop/qcow2.txt.

Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.c          | 2 +-
 docs/interop/qcow2.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 0cd2e67..80dfe5f 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -66,7 +66,7 @@ typedef struct {
 } QEMU_PACKED QCowExtension;
 
 #define  QCOW2_EXT_MAGIC_END 0
-#define  QCOW2_EXT_MAGIC_BACKING_FORMAT 0xE2792ACA
+#define  QCOW2_EXT_MAGIC_BACKING_FORMAT 0xe2792aca
 #define  QCOW2_EXT_MAGIC_FEATURE_TABLE 0x6803f857
 #define  QCOW2_EXT_MAGIC_CRYPTO_HEADER 0x0537be77
 #define  QCOW2_EXT_MAGIC_BITMAPS 0x23852875
diff --git a/docs/interop/qcow2.txt b/docs/interop/qcow2.txt
index cb72346..f072e27 100644
--- a/docs/interop/qcow2.txt
+++ b/docs/interop/qcow2.txt
@@ -231,7 +231,7 @@ be stored. Each extension has a structure like the following:
 
     Byte  0 -  3:   Header extension type:
                         0x00000000 - End of the header extension area
-                        0xE2792ACA - Backing file format name string
+                        0xe2792aca - Backing file format name string
                         0x6803f857 - Feature name table
                         0x23852875 - Bitmaps extension
                         0x0537be77 - Full disk encryption header pointer
-- 
1.8.3.1


