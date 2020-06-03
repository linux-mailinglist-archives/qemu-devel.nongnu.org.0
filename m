Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00731ECB3A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 10:16:17 +0200 (CEST)
Received: from localhost ([::1]:35250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgOZM-0001Wo-PD
	for lists+qemu-devel@lfdr.de; Wed, 03 Jun 2020 04:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maozhongyi@cmss.chinamobile.com>)
 id 1jgOTV-000163-OV
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 04:10:13 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:7104)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jgOTU-0000H0-4q
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 04:10:13 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.15]) by
 rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee45ed75ab67b4-8b204;
 Wed, 03 Jun 2020 16:09:26 +0800 (CST)
X-RM-TRANSID: 2ee45ed75ab67b4-8b204
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee85ed75aae43e-61027;
 Wed, 03 Jun 2020 16:09:26 +0800 (CST)
X-RM-TRANSID: 2ee85ed75aae43e-61027
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] docs/xbzrle: update 'cache miss rate' and 'encoding rate'
 to docs
Date: Wed,  3 Jun 2020 16:09:03 +0800
Message-Id: <20200603080904.997083-9-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200603080904.997083-1-maozhongyi@cmss.chinamobile.com>
References: <20200603080904.997083-1-maozhongyi@cmss.chinamobile.com>
Received-SPF: pass client-ip=221.176.66.79;
 envelope-from=maozhongyi@cmss.chinamobile.com; helo=cmccmta1.chinamobile.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 04:09:40
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
---
 docs/xbzrle.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/xbzrle.txt b/docs/xbzrle.txt
index 385b4993f8..6bd1828f34 100644
--- a/docs/xbzrle.txt
+++ b/docs/xbzrle.txt
@@ -113,9 +113,11 @@ is recommended.
     xbzrle transferred: I kbytes
     xbzrle pages: J pages
     xbzrle cache miss: K pages
-    xbzrle overflow: L
+    xbzrle cache miss rate: L
+    xbzrle encoding rate: M
+    xbzrle overflow: N
 
-xbzrle cache-miss: the number of cache misses to date - high cache-miss rate
+xbzrle cache miss: the number of cache misses to date - high cache-miss rate
 indicates that the cache size is set too low.
 xbzrle overflow: the number of overflows in the decoding which where the delta
 could not be compressed. This can happen if the changes in the pages are too
-- 
2.17.1




