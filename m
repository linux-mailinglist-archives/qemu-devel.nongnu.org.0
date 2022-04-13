Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27F04FEE20
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 06:22:03 +0200 (CEST)
Received: from localhost ([::1]:34528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neUW2-0002vH-9S
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 00:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuyd.fnst@fujitsu.com>)
 id 1neUVD-0002Gn-NW
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 00:21:11 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:49101
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liuyd.fnst@fujitsu.com>) id 1neUVB-0004M9-Hs
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 00:21:11 -0400
IronPort-Data: =?us-ascii?q?A9a23=3AwQBxOaDMAiP1JRVW/zrhw5YqxClBgxIJ4g17XOL?=
 =?us-ascii?q?fUALv0msh12QFzjEZXWCOOPffY2L8fIp/YdzlpEhU75GAx9UxeLYW3SszFioV8?=
 =?us-ascii?q?6IpJjg4wn/YZnrUdouaJK5ex512huLocYZkHhcwmj/3auK79SMkjPnRLlbBILW?=
 =?us-ascii?q?s1h5ZFFYMpBgJ2UoLd94R2uaEsPDha++/kYqaT/73ZDdJ7wVJ3lc8sMpvnv/AU?=
 =?us-ascii?q?MPa41v0tnRmDRxCUcS3e3M9VPrzLonpR5f0rxU9IwK0ewrD5OnREmLx9BFrBM6?=
 =?us-ascii?q?nk6rgbwsBRbu60Qqm0yIQAvb9xEMZ4HFaPqUTbZLwbW9TiiiYk5Z/zs5RnZKtS?=
 =?us-ascii?q?wY1JbCKk+MYO/VdO3gkZvAcouScfRBTtuTWlSUqaUDE2vhrEQQ6MJMV/s5xBmd?=
 =?us-ascii?q?B8+FeLyoCBi1vLcreLKmTE7Eq35p8apKwet53h52p9hmBZd5OfHwJa/yiCQdk4?=
 =?us-ascii?q?QoN?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AFIStBKo1+53sgQpPFYURE6oaV5oXeYIsimQD?=
 =?us-ascii?q?101hICG9E/bo8/xG+c536faaslgssQ4b8+xoVJPgfZq+z+8R3WByB8bAYOCOgg?=
 =?us-ascii?q?LBQ72KhrGSoQEIdRefysdtkY9kc4VbTOb7FEVGi6/BizWQIpINx8am/cmT6dvj?=
 =?us-ascii?q?8w=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.88,333,1635177600"; d="scan'208";a="123522334"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Apr 2022 12:20:59 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id E87504D17169
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 12:20:58 +0800 (CST)
Received: from G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 13 Apr 2022 12:20:57 +0800
Received: from G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) by
 G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 13 Apr 2022 12:20:58 +0800
Received: from fedora.g08.fujitsu.local (10.167.223.59) by
 G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.23 via Frontend Transport; Wed, 13 Apr 2022 12:20:57 +0800
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] docs: Correct the default thread-pool-size
Date: Wed, 13 Apr 2022 12:20:54 +0800
Message-ID: <20220413042054.1484640-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: E87504D17169.ADB8B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: liuyd.fnst@fujitsu.com
Received-SPF: neutral client-ip=183.91.158.132;
 envelope-from=liuyd.fnst@fujitsu.com; helo=heian.cn.fujitsu.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Refer to 26ec190964 virtiofsd: Do not use a thread pool by default

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 docs/tools/virtiofsd.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
index 0c0560203c..33fed08c6f 100644
--- a/docs/tools/virtiofsd.rst
+++ b/docs/tools/virtiofsd.rst
@@ -127,7 +127,7 @@ Options
 .. option:: --thread-pool-size=NUM
 
   Restrict the number of worker threads per request queue to NUM.  The default
-  is 64.
+  is 0.
 
 .. option:: --cache=none|auto|always
 
-- 
2.31.1




