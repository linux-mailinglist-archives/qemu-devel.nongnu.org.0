Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCC4307BFF
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:18:18 +0100 (CET)
Received: from localhost ([::1]:37036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Avx-0001eU-BI
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:18:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1l5Arc-0008CQ-O6; Thu, 28 Jan 2021 12:13:48 -0500
Received: from relay.sw.ru ([185.231.240.75]:48408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1l5Ara-0005vM-BF; Thu, 28 Jan 2021 12:13:48 -0500
Received: from [192.168.15.83] (helo=iris.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <den@openvz.org>)
 id 1l5Ar2-0011bK-NB; Thu, 28 Jan 2021 20:13:13 +0300
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH 1/1] docs: fix mistake in dirty bitmap feature description
Date: Thu, 28 Jan 2021 20:13:13 +0300
Message-Id: <20210128171313.2210947-1-den@openvz.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75; envelope-from=den@openvz.org;
 helo=relay.sw.ru
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
Cc: "Denis V. Lunev" <den@openvz.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Original specification says that l1 table size if 64 * l1_size, which
is obviously wrong. The size of the l1 entry is 64 _bits_, not bytes.
Thus 64 is to be replaces with 8 as specification says about bytes.

There is also minor tweak, field name is renamed from l1 to l1_table,
which matches with the later text.

Signed-off-by: Denis V. Lunev <den@openvz.org>
CC: Stefan Hajnoczi <stefanha@redhat.com>
CC: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/interop/parallels.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/interop/parallels.txt b/docs/interop/parallels.txt
index e9271eba5d..f15bf35bd1 100644
--- a/docs/interop/parallels.txt
+++ b/docs/interop/parallels.txt
@@ -208,7 +208,7 @@ of its data area are:
   28 - 31:    l1_size
               The number of entries in the L1 table of the bitmap.
 
-  variable:   l1 (64 * l1_size bytes)
+  variable:   l1_table (8 * l1_size bytes)
               L1 offset table (in bytes)
 
 A dirty bitmap is stored using a one-level structure for the mapping to host
-- 
2.27.0


