Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879E63CCC9F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 05:25:40 +0200 (CEST)
Received: from localhost ([::1]:59766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5JuV-0002Uv-Hf
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 23:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m5Jq5-00069U-8y
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 23:21:05 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m5Jq1-000638-IY
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 23:21:05 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GSn7F2GyGz7vbp;
 Mon, 19 Jul 2021 11:16:25 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 19 Jul 2021 11:20:59 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 19 Jul 2021 11:20:58 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH for-6.2 v2 09/11] machine: Tweak the order of topology members
 in struct CpuTopology
Date: Mon, 19 Jul 2021 11:20:41 +0800
Message-ID: <20210719032043.25416-10-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210719032043.25416-1-wangyanan55@huawei.com>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew
 Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 yuzenghui@huawei.com, Igor
 Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all the possible topology parameters are integrated in struct
CpuTopology, tweak the order of topology members to be "cpus/sockets/
dies/cores/threads/maxcpus" for readability and consistency. We also
tweak the comment by adding explanation of dies parameter.

Furthermore, a comment of struct SMPConfiguration is fixed.

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/core/machine.c   | 4 ++--
 include/hw/boards.h | 7 ++++---
 qapi/machine.json   | 2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index f5620c4d34..9d24b67ef3 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1075,10 +1075,10 @@ static void machine_initfn(Object *obj)
     /* default to mc->default_cpus */
     ms->smp.cpus = mc->default_cpus;
     ms->smp.max_cpus = mc->default_cpus;
-    ms->smp.cores = 1;
+    ms->smp.sockets = 1;
     ms->smp.dies = 1;
+    ms->smp.cores = 1;
     ms->smp.threads = 1;
-    ms->smp.sockets = 1;
 }
 
 static void machine_finalize(Object *obj)
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 8df885c9d2..12ab0f5968 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -276,17 +276,18 @@ typedef struct DeviceMemoryState {
 /**
  * CpuTopology:
  * @cpus: the number of present logical processors on the machine
- * @cores: the number of cores in one package
- * @threads: the number of threads in one core
  * @sockets: the number of sockets on the machine
+ * @dies: the number of dies in one socket
+ * @cores: the number of cores in one die
+ * @threads: the number of threads in one core
  * @max_cpus: the maximum number of logical processors on the machine
  */
 typedef struct CpuTopology {
     unsigned int cpus;
+    unsigned int sockets;
     unsigned int dies;
     unsigned int cores;
     unsigned int threads;
-    unsigned int sockets;
     unsigned int max_cpus;
 } CpuTopology;
 
diff --git a/qapi/machine.json b/qapi/machine.json
index c11b2e6f73..9272cb3cf8 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1297,7 +1297,7 @@
 #
 # @dies: number of dies per socket in the CPU topology
 #
-# @cores: number of cores per thread in the CPU topology
+# @cores: number of cores per die in the CPU topology
 #
 # @threads: number of threads per core in the CPU topology
 #
-- 
2.19.1


