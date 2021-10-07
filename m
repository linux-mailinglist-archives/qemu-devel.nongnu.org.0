Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9D7425169
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 12:46:00 +0200 (CEST)
Received: from localhost ([::1]:44172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYQuV-0007xr-KD
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 06:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYQsO-0005tz-MQ
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:43:48 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYQsL-0002SU-Q1
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:43:48 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HQ79L6GdbzYfKW;
 Thu,  7 Oct 2021 18:39:18 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 18:43:42 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 18:43:41 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 2/3] include/hw/boards: Improve scalability of the
 CpuTopology comment
Date: Thu, 7 Oct 2021 18:43:36 +0800
Message-ID: <20211007104337.10232-3-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211007104337.10232-1-wangyanan55@huawei.com>
References: <20211007104337.10232-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rewrite the comment of struct CpuTopology in include/hw/boards.h,
so that we can easily/clearly extend it with more target specific
CPU topology members introduced in the future.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 include/hw/boards.h | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 5adbcbb99b..19c5419174 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -280,11 +280,29 @@ typedef struct DeviceMemoryState {
 /**
  * CpuTopology:
  * @cpus: the number of present logical processors on the machine
- * @sockets: the number of sockets on the machine
- * @dies: the number of dies in one socket
- * @cores: the number of cores in one die
- * @threads: the number of threads in one core
+ * @sockets: the number of sockets per upper layer container
+ * @dies: the number of dies per upper layer container
+ * @cores: the number of cores per upper layer container
+ * @threads: the number of threads per upper layer container
  * @max_cpus: the maximum number of logical processors on the machine
+ *
+ * Different machines may have different subsets of the CPU topology
+ * parameters supported, so the description of the supported parameters
+ * will vary accordingly. For example, for a machine that supports a
+ * CPU hierarchy of sockets/cores/threads, the members will sequentially
+ * mean as below:
+ *    -sockets: the total number of sockets on the machine
+ *     which is the upper layer container of socket
+ *    -cores: the number of cores per socket
+ *     which is the upper layer container of core
+ *    -threads: the number of threads per core
+ *     which is the upper layer container of thread
+ *
+ * The currently supported CPU topology subsets are listed here:
+ * For PC machines, a 4-level CPU hierarchy is supported:
+ *    -sockets/dies/cores/threads
+ * For the other machines, a 3-level CPU hierarchy is supported:
+ *    -sockets/cores/threads
  */
 typedef struct CpuTopology {
     unsigned int cpus;
-- 
2.19.1


