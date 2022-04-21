Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2005509CC7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 11:54:17 +0200 (CEST)
Received: from localhost ([::1]:36334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhTVw-0006G3-PW
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 05:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuyd.fnst@fujitsu.com>)
 id 1nhTU5-0005XO-Kr
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 05:52:21 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:31861
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liuyd.fnst@fujitsu.com>) id 1nhTU3-0004jm-9h
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 05:52:21 -0400
IronPort-Data: =?us-ascii?q?A9a23=3Atxocp6JSSbqYc1d0FE+RPZclxSXFcZb7ZxGrkP8?=
 =?us-ascii?q?bfHDs1jghhTxRy2oaUW/VPq2PZzGmfNh3OYq19UtVu5XQyINqS1BcGVNFFSwT8?=
 =?us-ascii?q?ZWfbTi6wuYcBwvLd4ubChsPA/w2MrEsF+hpCC+MzvuRGuK59yMkj/nRHuOU5NP?=
 =?us-ascii?q?sYUideyc1EU/Ntjozw4bVsqYw6TSIK1vlVeHa+qUzC3f5s9JACV/43orYwP9ZU?=
 =?us-ascii?q?FsejxtD1rA2TagjUFYzDBD5BrpHTU26ByOQroW5goeHq+j/ILGRpgs1/j8mDJW?=
 =?us-ascii?q?rj7T6blYXBLXVOGBiiFIPA+773EcE/Xd0j87XN9JFAatTozGIgsF9jttLroCYR?=
 =?us-ascii?q?xorP7HXhaIWVBww/yRWZPcdp+WWcCXg2SCU5wicG5f2+N13AUQreIEV5OtzKWd?=
 =?us-ascii?q?J8/MeNXYKdB/rr+65wbaxR/Nwrt4uIMniIMUUvXQI5SrFAPgvR5DKa7/H6d9Rw?=
 =?us-ascii?q?HE7gcUmNejRYNsQbRJ1YRjAagEJMVASYLognf20h366fSZwsl+ZpaMrpWPUyWR?=
 =?us-ascii?q?MPBLFWDbOUoXSA5wLwQDD/SSbl1kVyyoybLS3oQdpOFr17gMXoR7GZQ=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A+TIfea2T0iQiHyTcXTXAfwqjBI4kLtp133Aq?=
 =?us-ascii?q?2lEZdPU1SL39qynKppkmPHDP5gr5J0tLpTntAsi9qBDnhPtICOsqTNSftWDd0Q?=
 =?us-ascii?q?PGEGgI1/qB/9SPIU3D398Y/aJhXow7M9foEGV95PyQ3CCIV/om3/mLmZrFudvj?=
X-IronPort-AV: E=Sophos;i="5.88,333,1635177600"; d="scan'208";a="123729957"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Apr 2022 17:52:14 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 2BC784D17172;
 Thu, 21 Apr 2022 17:52:14 +0800 (CST)
Received: from G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 21 Apr 2022 17:52:14 +0800
Received: from fedora.g08.fujitsu.local (10.167.223.59) by
 G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.23 via Frontend Transport; Thu, 21 Apr 2022 17:52:11 +0800
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Vivek Goyal <vgoyal@redhat.com>
Subject: [PATCH] virtiofsd: Add docs/helper for killpriv_v2/no_killpriv_v2
 option
Date: Thu, 21 Apr 2022 17:51:51 +0800
Message-ID: <20220421095151.2231099-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: 2BC784D17172.AD9F6
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
Cc: virtio-fs@redhat.com, Liu Yiding <liuyd.fnst@fujitsu.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtiofsd has introduced killpriv_v2/no_killpriv_v2 for a while. Add
description of it to docs/helper.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 docs/tools/virtiofsd.rst | 5 +++++
 tools/virtiofsd/helper.c | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
index 0c0560203c..85398cce09 100644
--- a/docs/tools/virtiofsd.rst
+++ b/docs/tools/virtiofsd.rst
@@ -111,6 +111,11 @@ Options
     label. Server will try to set that label on newly created file
     atomically wherever possible.
 
+  * killpriv_v2|no_killpriv_v2 -
+    Enable/disable ``FUSE_HANDLE_KILLPRIV_V2`` support. KILLPRIV_V2 is enabled
+    by default as long as client supports it.  Enabling this option helps with
+    performance in write path.
+
 .. option:: --socket-path=PATH
 
   Listen on vhost-user UNIX domain socket at PATH.
diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
index e226fc590f..f8981e5bdf 100644
--- a/tools/virtiofsd/helper.c
+++ b/tools/virtiofsd/helper.c
@@ -188,6 +188,9 @@ void fuse_cmdline_help(void)
            "    -o announce_submounts      Announce sub-mount points to the guest\n"
            "    -o posix_acl/no_posix_acl  Enable/Disable posix_acl. (default: disabled)\n"
            "    -o security_label/no_security_label  Enable/Disable security label. (default: disabled)\n"
+           "    -o killpriv_v2/no_killpriv_v2\n"
+           "                               Enable/Disable FUSE_HANDLE_KILLPRIV_V2.\n"
+           "                               (default: enabled as long as client supports it)\n"
            );
 }
 
-- 
2.31.1




