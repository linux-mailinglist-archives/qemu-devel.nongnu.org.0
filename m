Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0E73A3A74
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 05:43:28 +0200 (CEST)
Received: from localhost ([::1]:57040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrY4s-0006Vb-Mz
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 23:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lrY40-0005oG-3r
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 23:42:32 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:49659
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1lrY3x-0005T8-Rd
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 23:42:31 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AK3GZU6uHtZbffoYSaa1ojhvT7skDStV00zEX?=
 =?us-ascii?q?/kB9WHVpm62j5qSTdZEguCMc5wx+ZJheo7q90cW7IE80lqQFhLX5X43SPzUO0V?=
 =?us-ascii?q?HARO5fBODZsl/d8kPFltJ15ONJdqhSLJnKB0FmsMCS2mKFOudl7N6Z0K3Av4vj?=
 =?us-ascii?q?80s=3D?=
X-IronPort-AV: E=Sophos;i="5.83,265,1616428800"; d="scan'208";a="109486406"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 11 Jun 2021 11:42:23 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 513514C369E6;
 Fri, 11 Jun 2021 11:42:21 +0800 (CST)
Received: from G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 11 Jun 2021 11:42:15 +0800
Received: from FNSTPC.g08.fujitsu.local (10.167.226.45) by
 G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Fri, 11 Jun 2021 11:42:17 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <xiaoguangrong.eric@gmail.com>
Subject: [PATCH] docs/nvdimm: update doc
Date: Fri, 11 Jun 2021 11:41:33 +0800
Message-ID: <20210611034133.472812-1-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: 513514C369E6.A8F06
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
Cc: qemu-devel@nongnu.org, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The prompt was updated since def835f0da ('hostmem: Don't report pmem attribute if unsupported')

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 docs/nvdimm.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/nvdimm.txt b/docs/nvdimm.txt
index 0aae682be3e..71cdbdf554b 100644
--- a/docs/nvdimm.txt
+++ b/docs/nvdimm.txt
@@ -247,7 +247,8 @@ is built with libpmem [2] support (configured with --enable-libpmem), QEMU
 will take necessary operations to guarantee the persistence of its own writes
 to the vNVDIMM backend(e.g., in vNVDIMM label emulation and live migration).
 If 'pmem' is 'on' while there is no libpmem support, qemu will exit and report
-a "lack of libpmem support" message to ensure the persistence is available.
+a "lack of libpmem support" (or "Invalid parameter 'pmem'" since v6.0.0)
+message to ensure the persistence is available.
 For example, if we want to ensure the persistence for some backend file,
 use the QEMU command line:
 
-- 
2.30.2




