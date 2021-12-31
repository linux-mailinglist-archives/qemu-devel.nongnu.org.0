Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33C8482216
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 06:11:55 +0100 (CET)
Received: from localhost ([::1]:46014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3ACo-00072B-7O
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 00:11:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1n3AAB-0005fa-Pj
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 00:09:11 -0500
Received: from mail.cn.fujitsu.com ([183.91.158.132]:9396
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1n3AA9-0006KF-GD
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 00:09:11 -0500
IronPort-Data: =?us-ascii?q?A9a23=3AfsYcIK4OKf/+U7KgtbhiYQxRtNXFchMFZxGqfqr?=
 =?us-ascii?q?LsXjdYENS3zQFnDNKCGqHbvvZYGT1Ltwibd638U0D6MXXzdY2GwE5pCpnJ55og?=
 =?us-ascii?q?ZCbXIzGdC8cHM8zwvXrFRsht4NHAjX5BJhcokT0+1H9YtANkVEmjfvRH+CnUba?=
 =?us-ascii?q?dUsxMbVQMpBkJ2EsLd9ER0tYAbeiRW2thiPuqyyHtEAbNNw1cbgr435m+RCZH5?=
 =?us-ascii?q?5wejt+3UmsWPpintHeG/5Uc4Ql2yauZdxMUSaEMdgK2qnqq8V23wo/Z109F5tK?=
 =?us-ascii?q?NmbC9fFAIQ6LJIE6FjX8+t6qK20AE/3JtlP1gcqd0hUR/0l1lm/h1ycdNtJ6xQ?=
 =?us-ascii?q?AEBMLDOmfgGTl9TFCQW0ahuoeaWfijn6JbOp6HBWz62qxl0N2k4YYcF9c5+BHp?=
 =?us-ascii?q?H6bofMj9lRhuDiuTw0rKyTOZEh8I/Ic2tN4Qa0ll4wC3UF7AjSIHPTqHOzdtZ2?=
 =?us-ascii?q?j4qgYZJB/m2T9MUbCcqYBnebhlnPFARB5Qj2uCyiRHXbz1FtFK9v6c742HPigd?=
 =?us-ascii?q?21dDQ3HD9EjCRbZwN2B/G+SSdpCKkaiz2/ee3kVKtmk9ATMeW9c8jZL8vKQ=3D?=
 =?us-ascii?q?=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3ACAB9Qa1R1scUPjRVPIiXGwqjBI4kLtp133Aq?=
 =?us-ascii?q?2lEZdPU1SL39qynKppkmPHDP5gr5J0tLpTntAsi9qBDnhPtICOsqTNSftWDd0Q?=
 =?us-ascii?q?PGEGgI1/qB/9SPIU3D398Y/aJhXow7M9foEGV95PyQ3CCIV/om3/mLmZrFudvj?=
X-IronPort-AV: E=Sophos;i="5.88,250,1635177600"; d="scan'208";a="119780125"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 31 Dec 2021 13:09:03 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id B68E64D15A24;
 Fri, 31 Dec 2021 13:08:58 +0800 (CST)
Received: from G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Fri, 31 Dec 2021 13:08:59 +0800
Received: from FNSTPC.g08.fujitsu.local (10.167.226.45) by
 G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.23 via Frontend Transport; Fri, 31 Dec 2021 13:08:59 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <thuth@redhat.com>, <peter.maydell@linaro.org>, <f4bug@amsat.org>
Subject: [PATCH] MAINTAINERS: email address change
Date: Fri, 31 Dec 2021 13:09:01 +0800
Message-ID: <20211231050901.360-1-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: B68E64D15A24.ADD85
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lizhijian@fujitsu.com
Received-SPF: neutral client-ip=183.91.158.132;
 envelope-from=lizhijian@fujitsu.com; helo=heian.cn.fujitsu.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=ham autolearn_force=no
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
Cc: chen.zhang@intel.com, qemu-devel@nongnu.org,
 Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fujitsu's mail service has migrated to O365 months ago, the
lizhijian@cn.fujitsu.com address will stop working on 2022-06-01,
change it to my new email address lizhijian@fujitsu.com.

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 50435b8d2f5..e5cda5886d4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2943,7 +2943,7 @@ F: docs/COLO-FT.txt
 
 COLO Proxy
 M: Zhang Chen <chen.zhang@intel.com>
-M: Li Zhijian <lizhijian@cn.fujitsu.com>
+M: Li Zhijian <lizhijian@fujitsu.com>
 S: Supported
 F: docs/colo-proxy.txt
 F: net/colo*
-- 
2.33.0




