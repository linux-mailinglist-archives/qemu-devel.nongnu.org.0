Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57CA3F4AAD
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 14:31:26 +0200 (CEST)
Received: from localhost ([::1]:33046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI96r-0007a9-Pn
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 08:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mI93p-0004oG-RE
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 08:28:17 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mI93m-0004t3-Tt
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 08:28:17 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GtWd00CJYz8tQW;
 Mon, 23 Aug 2021 20:24:04 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 23 Aug 2021 20:28:11 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 23 Aug 2021 20:28:10 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v7 01/15] machine: Deprecate "parameter=0" SMP configurations
Date: Mon, 23 Aug 2021 20:27:50 +0800
Message-ID: <20210823122804.7692-2-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210823122804.7692-1-wangyanan55@huawei.com>
References: <20210823122804.7692-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, wanghaibin.wang@huawei.com,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the SMP configuration, we should either provide a topology
parameter with a reasonable value (greater than zero) or just
omit it and QEMU will compute the missing value.

The users shouldn't provide a configuration with any parameter
of it specified as zero (e.g. -smp 8,sockets=0) which could
possibly cause unexpected results in the -smp parsing. So we
deprecate this kind of configurations since 6.2 by adding the
explicit sanity check.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 docs/about/deprecated.rst | 15 +++++++++++++++
 hw/core/machine.c         | 14 ++++++++++++++
 qapi/machine.json         |  2 +-
 qemu-options.hx           | 12 +++++++-----
 4 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 8d4fd384a5..ae49e9fdba 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -138,6 +138,21 @@ an underscore between "window" and "close").
 The ``-no-quit`` is a synonym for ``-display ...,window-close=off`` which
 should be used instead.
 
+``-smp`` ("parameter=0" SMP configurations) (since 6.2)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Specified CPU topology parameters must be greater than zero.
+
+In the SMP configuration, users should either provide a CPU topology
+parameter with a reasonable value (greater than zero) or just omit it
+and QEMU will compute the missing value.
+
+However, historically it was implicitly allowed for users to provide
+a parameter with zero value, which is meaningless and could also possibly
+cause unexpected results in the -smp parsing. So support for this kind of
+configurations (e.g. -smp 8,sockets=0) is deprecated since 6.2 and will
+be removed in the near future, users have to ensure that all the topology
+members described with -smp are greater than zero.
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 54e040587d..3b5df9b002 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -832,6 +832,20 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
         return;
     }
 
+    /*
+     * Specified CPU topology parameters must be greater than zero,
+     * explicit configuration like "cpus=0" is not allowed.
+     */
+    if ((config->has_cpus && config->cpus == 0) ||
+        (config->has_sockets && config->sockets == 0) ||
+        (config->has_dies && config->dies == 0) ||
+        (config->has_cores && config->cores == 0) ||
+        (config->has_threads && config->threads == 0) ||
+        (config->has_maxcpus && config->maxcpus == 0)) {
+        warn_report("Invalid CPU topology deprecated: "
+                    "CPU topology parameters must be greater than zero");
+    }
+
     mc->smp_parse(ms, config, errp);
     if (*errp) {
         goto out_free;
diff --git a/qapi/machine.json b/qapi/machine.json
index 157712f006..10a97837d3 100644
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
diff --git a/qemu-options.hx b/qemu-options.hx
index 83aa59a920..aee622f577 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -227,11 +227,13 @@ SRST
     of computing the CPU maximum count.
 
     Either the initial CPU count, or at least one of the topology parameters
-    must be specified. Values for any omitted parameters will be computed
-    from those which are given. Historically preference was given to the
-    coarsest topology parameters when computing missing values (ie sockets
-    preferred over cores, which were preferred over threads), however, this
-    behaviour is considered liable to change.
+    must be specified. The specified parameters must be greater than zero,
+    explicit configuration like "cpus=0" is not allowed. Values for any
+    omitted parameters will be computed from those which are given.
+    Historically preference was given to the coarsest topology parameters
+    when computing missing values (ie sockets preferred over cores, which
+    were preferred over threads), however, this behaviour is considered
+    liable to change.
 ERST
 
 DEF("numa", HAS_ARG, QEMU_OPTION_numa,
-- 
2.19.1


