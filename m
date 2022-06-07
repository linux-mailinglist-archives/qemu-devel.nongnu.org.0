Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5389D5414F5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:25:57 +0200 (CEST)
Received: from localhost ([::1]:33750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyfm0-0002ot-FC
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:25:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1nyc2W-00008Y-A9
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 12:26:44 -0400
Received: from mail.bwidawsk.net ([107.170.211.233]:57170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1nyc2U-0008BY-EU
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 12:26:44 -0400
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id 0AF0812328F; Tue,  7 Jun 2022 09:26:39 -0700 (PDT)
X-Spam-ASN: 
Received: from saberhagen.. (c-73-25-157-11.hsd1.or.comcast.net [73.25.157.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id 59CFE120065;
 Tue,  7 Jun 2022 09:26:32 -0700 (PDT)
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	qemu-devel@nongnu.org
Cc: Ben Widawsky <ben@bwidawsk.net>
Subject: [PATCH] MAINTAINERS: change Ben Widawsky's email address
Date: Tue,  7 Jun 2022 09:26:28 -0700
Message-Id: <20220607162628.372400-1-ben@bwidawsk.net>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=107.170.211.233; envelope-from=ben@bwidawsk.net;
 helo=mail.bwidawsk.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 07 Jun 2022 16:22:49 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Ben Widawsky <ben@bwidawsk.net>
From:  Ben Widawsky via <qemu-devel@nongnu.org>

ben@widawsky@intel.com will stop working on 2022-06-20, change it to my
personal email address.

Update .mailmap to handle previously authored commits.

Signed-off-by: Ben Widawsky <ben@bwidawsk.net>
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 8c326709cfab..0dec7b156999 100644
--- a/.mailmap
+++ b/.mailmap
@@ -54,6 +54,7 @@ Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <arikalo@wavecomp.com>
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <aleksandar.rikalo@rt-rk.com>
 Alexander Graf <agraf@csgraf.de> <agraf@suse.de>
 Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
+Ben Widawsky <ben.widawsky@intel.com> <ben@bwidawsk.net>
 Christian Borntraeger <borntraeger@linux.ibm.com> <borntraeger@de.ibm.com>
 Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
 Frederic Konrad <konrad.frederic@yahoo.fr> <fred.konrad@greensocs.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 5580a36b68e1..89da5755116b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2574,7 +2574,7 @@ F: qapi/transaction.json
 T: git https://repo.or.cz/qemu/armbru.git block-next
 
 Compute Express Link
-M: Ben Widawsky <ben.widawsky@intel.com>
+M: Ben Widawsky <ben@bwidawsk.net>
 M: Jonathan Cameron <jonathan.cameron@huawei.com>
 S: Supported
 F: hw/cxl/

base-commit: 9b1f58854959c5a9bdb347e3e04c252ab7fc9ef5
-- 
2.36.1


