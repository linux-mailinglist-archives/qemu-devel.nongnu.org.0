Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D62824CE7D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 09:09:57 +0200 (CEST)
Received: from localhost ([::1]:43738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k91BU-0007R2-05
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 03:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@cn.fujitsu.com>)
 id 1k91Ap-0006zm-8i
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 03:09:15 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:56195
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@cn.fujitsu.com>) id 1k91An-00045h-IA
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 03:09:15 -0400
X-IronPort-AV: E=Sophos;i="5.76,335,1592841600"; d="scan'208";a="98378792"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Aug 2020 15:09:04 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 472BB48990D3
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 15:09:03 +0800 (CST)
Received: from G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 21 Aug 2020 15:09:03 +0800
Received: from G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) by
 G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 21 Aug 2020 15:09:03 +0800
Received: from G08FNSTD190042.g08.fujitsu.local (10.167.226.45) by
 G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Fri, 21 Aug 2020 15:09:02 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] .gitignore: add virtiofsd binary
Date: Fri, 21 Aug 2020 15:09:00 +0800
Message-ID: <20200821070900.3556-1-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: 472BB48990D3.AC258
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lizhijian@cn.fujitsu.com
Received-SPF: none client-ip=183.91.158.132;
 envelope-from=lizhijian@cn.fujitsu.com; helo=heian.cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 03:09:06
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 2992d15931..28729241f1 100644
--- a/.gitignore
+++ b/.gitignore
@@ -57,6 +57,7 @@
 /qemu-ga
 /qemu-bridge-helper
 /qemu-keymap
+/virtiofsd
 /qemu-monitor.texi
 /qemu-monitor-info.texi
 /qemu-storage-daemon
-- 
2.17.1




