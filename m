Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D124463C5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 14:03:13 +0100 (CET)
Received: from localhost ([::1]:34400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miysC-000193-As
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 09:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1miyqq-0008Fe-Mr
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:01:49 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:49452
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1miyqm-0007Lx-R5
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:01:47 -0400
HMM_SOURCE_IP: 172.18.0.48:50488.910306946
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.97.71 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id CB89C280097;
 Fri,  5 Nov 2021 21:01:28 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 39fc4329208b4456a6e981f4fb4c8240 for
 qemu-devel@nongnu.org; Fri, 05 Nov 2021 21:01:30 CST
X-Transaction-ID: 39fc4329208b4456a6e981f4fb4c8240
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH] docs: fix qemu incorrect tag
Date: Fri,  5 Nov 2021 21:01:16 +0800
Message-Id: <2f6070f08d63fd2281d324c70bb5f8db3b4c803c.1636116975.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

The last modification of the patchset may be 2 month before
merging dirtyrate implementation, it used the wrong tag, so
fix with 6.2.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 qapi/migration.json | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 87146ce..f0aefda 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1740,7 +1740,7 @@
 #
 # @dirty-rate: dirty rate.
 #
-# Since: 6.1
+# Since: 6.2
 #
 ##
 { 'struct': 'DirtyRateVcpu',
@@ -1774,7 +1774,7 @@
 #
 # @dirty-bitmap: calculate dirtyrate by dirty bitmap.
 #
-# Since: 6.1
+# Since: 6.2
 #
 ##
 { 'enum': 'DirtyRateMeasureMode',
@@ -1796,13 +1796,13 @@
 # @calc-time: time in units of second for sample dirty pages
 #
 # @sample-pages: page count per GB for sample dirty pages
-#                the default value is 512 (since 6.1)
+#                the default value is 512 (since 6.2)
 #
 # @mode: mode containing method of calculate dirtyrate includes
-#        'page-sampling' and 'dirty-ring' (Since 6.1)
+#        'page-sampling' and 'dirty-ring' (Since 6.2)
 #
 # @vcpu-dirty-rate: dirtyrate for each vcpu if dirty-ring
-#                   mode specified (Since 6.1)
+#                   mode specified (Since 6.2)
 #
 # Since: 5.2
 #
-- 
1.8.3.1


