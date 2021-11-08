Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDC4447A9E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 07:53:04 +0100 (CET)
Received: from localhost ([::1]:42862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjyWc-0007lD-Rg
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 01:53:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1mjyVB-0006sb-4b
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 01:51:34 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:60204
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1mjyV6-0003DS-NY
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 01:51:32 -0500
HMM_SOURCE_IP: 172.18.0.188:43150.449545457
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id B61C32800C7;
 Mon,  8 Nov 2021 14:51:08 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 968a666c8a134f88a28af484b2b3e609 for
 qemu-devel@nongnu.org; Mon, 08 Nov 2021 14:51:17 CST
X-Transaction-ID: 968a666c8a134f88a28af484b2b3e609
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH] docs: fix 'sample-pages' option tag
Date: Mon,  8 Nov 2021 14:51:00 +0800
Message-Id: <d212ac87ad45dcdd5d3ed85c61fc1fab765aed7e.1636353909.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
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
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

commit f78d4ed701 has fixed qemu tag, making 'sample-pages' option tag
involved by accident, which introduced since 6.1 in commit 7afa08cd8fd.
revert this line.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 qapi/migration.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index f0aefda..bbfd48c 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1796,7 +1796,7 @@
 # @calc-time: time in units of second for sample dirty pages
 #
 # @sample-pages: page count per GB for sample dirty pages
-#                the default value is 512 (since 6.2)
+#                the default value is 512 (since 6.1)
 #
 # @mode: mode containing method of calculate dirtyrate includes
 #        'page-sampling' and 'dirty-ring' (Since 6.2)
-- 
1.8.3.1


