Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42257425174
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 12:48:10 +0200 (CEST)
Received: from localhost ([::1]:50028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYQwb-0003bC-6o
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 06:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYQsQ-0005ui-Ou
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:43:51 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYQsN-0002Rv-J7
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:43:50 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HQ79L02YszYdgL;
 Thu,  7 Oct 2021 18:39:18 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 18:43:41 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 18:43:40 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 1/3] qemu-options: Improve scalability of the -smp
 documentation
Date: Thu, 7 Oct 2021 18:43:35 +0800
Message-ID: <20211007104337.10232-2-wangyanan55@huawei.com>
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

Rewrite part of the -smp documentation in qemu-option.hx,
so that we can easily/clearly extend it with more target
specific CPU topology members introduced in the future.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 qemu-options.hx | 90 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 73 insertions(+), 17 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 5f375bbfa6..212657d689 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -207,14 +207,29 @@ ERST
 
 DEF("smp", HAS_ARG, QEMU_OPTION_smp,
     "-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]\n"
-    "                set the number of CPUs to 'n' [default=1]\n"
+    "                set the number of initial CPUs to 'n' [default=1]\n"
     "                maxcpus= maximum number of total CPUs, including\n"
     "                offline CPUs for hotplug, etc\n"
-    "                sockets= number of discrete sockets in the system\n"
-    "                dies= number of CPU dies on one socket (for PC only)\n"
-    "                cores= number of CPU cores on one socket (for PC, it's on one die)\n"
-    "                threads= number of threads on one CPU core\n",
-        QEMU_ARCH_ALL)
+    "                sockets= number of sockets per upper layer container\n"
+    "                dies= number of dies per upper layer container\n"
+    "                cores= number of cores per upper layer container\n"
+    "                threads= number of threads per upper layer container\n"
+    "Note: Different machines may have different subsets of the CPU topology\n"
+    "      parameters supported, so the description of the supported parameters\n"
+    "      will vary accordingly. For example, for a machine that supports a\n"
+    "      CPU hierarchy of sockets/cores/threads, the parameters will sequentially\n"
+    "      mean as below:\n"
+    "                sockets= the total number of sockets on the machine board\n"
+    "                which is the upper layer container of socket\n"
+    "                cores= the number of cores per socket\n"
+    "                which is the upper layer container of core\n"
+    "                threads= the number of threads per core\n"
+    "                which is the upper layer container of thread\n"
+    "      For a particular machine type board, an expected CPU topology hierarchy\n"
+    "      can be defined through the supported sub-option. Unsupported parameters\n"
+    "      can also be provided in addition to the sub-option, but their values\n"
+    "      must be set as 1 in the purpose of correct parsing.\n",
+    QEMU_ARCH_ALL)
 SRST
 ``-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]``
     Simulate a SMP system with '\ ``n``\ ' CPUs initially present on
@@ -225,27 +240,68 @@ SRST
     initial CPU count will match the maximum number. When only one of them
     is given then the omitted one will be set to its counterpart's value.
     Both parameters may be specified, but the maximum number of CPUs must
-    be equal to or greater than the initial CPU count. Both parameters are
-    subject to an upper limit that is determined by the specific machine
-    type chosen.
-
-    To control reporting of CPU topology information, the number of sockets,
-    dies per socket, cores per die, and threads per core can be specified.
-    The sum `` sockets * cores * dies * threads `` must be equal to the
-    maximum CPU count. CPU targets may only support a subset of the topology
-    parameters. Where a CPU target does not support use of a particular
-    topology parameter, its value should be assumed to be 1 for the purpose
-    of computing the CPU maximum count.
+    be equal to or greater than the initial CPU count. Product of the
+    CPU topology hierarchy must be equal to the maximum number of CPUs.
+    Both parameters are subject to an upper limit that is determined by
+    the specific machine type chosen.
+
+    To control reporting of CPU topology information, values of the topology
+    parameters can be specified. Machines may only support a subset of the
+    parameters and different machines may have different subsets supported
+    which vary depending on capacity of the corresponding CPU targets. So
+    for a particular machine type board, an expected topology hierarchy can
+    be defined through the supported sub-option. Unsupported parameters can
+    also be provided in addition to the sub-option, but their values must be
+    set as 1 in the purpose of correct parsing.
 
     Either the initial CPU count, or at least one of the topology parameters
     must be specified. The specified parameters must be greater than zero,
     explicit configuration like "cpus=0" is not allowed. Values for any
     omitted parameters will be computed from those which are given.
+
+    For example, the following sub-option defines a CPU topology hierarchy
+    (2 sockets totally on the machine, 2 cores per socket, 2 threads per
+    core) for a machine that only supports sockets/cores/threads.
+    Some members of the option can be omitted but their values will be
+    automatically computed:
+
+    ::
+
+        -smp 8,sockets=2,cores=2,threads=2,maxcpus=8
+
+    The following sub-option defines a CPU topology hierarchy (2 sockets
+    totally on the machine, 2 dies per socket, 2 cores per die, 2 threads
+    per core) for the PC machine which supports sockets/dies/cores/threads.
+    Some members of the option can be omitted but their values will be
+    automatically computed:
+
+    ::
+
+        -smp 16,sockets=2,dies=2,cores=2,threads=2,maxcpus=16
+
+    The following option provides all the CPU topology parameters for a
+    machine that only support sockets/cores/threads, but values of the
+    unsupported parameters are set as 1. The defined hierarchy for the
+    machine will be 2 sockets totally, 2 cores per socket, 2 threads per
+    core. Some members of the option can be omitted but their values will
+    be automatically computed:
+
+    ::
+
+        -smp 8,sockets=2,dies=1,cores=2,threads=2,maxcpus=8
+
     Historically preference was given to the coarsest topology parameters
     when computing missing values (ie sockets preferred over cores, which
     were preferred over threads), however, this behaviour is considered
     liable to change. Prior to 6.2 the preference was sockets over cores
     over threads. Since 6.2 the preference is cores over sockets over threads.
+
+    For example, the following option defines a machine board with 2 sockets
+    of 1 core before 6.2 and 1 socket of 2 cores after 6.2:
+
+    ::
+
+        -smp 2
 ERST
 
 DEF("numa", HAS_ARG, QEMU_OPTION_numa,
-- 
2.19.1


