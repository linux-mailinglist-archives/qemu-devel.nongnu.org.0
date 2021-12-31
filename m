Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A821A482424
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 14:18:01 +0100 (CET)
Received: from localhost ([::1]:57302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3HnC-0002PY-ER
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 08:17:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HLC-0006iG-Ot
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:49:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HLA-0000nR-GZ
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:49:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640954939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wRGnTZ/XLILKmWFtYsMNltRv2S3GsR7Kd42iwaxNPRc=;
 b=c3TQtHBXu6D0QCs+Zu+cNknhg1E8kDeO71BS5pm5tI1gdNYlwCMA10Vht37wpN/v9734aI
 OgHb5YyAvv7ps5J4+nkfUoPOj1KcNRDSKm6OlOHmuzrRZQh/MyvNoLaprvD+4nIrgdMsMO
 sVjQQLHa2YTg0LPjeDjuS0IIkRI2qcs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-Q6AsUd0JOHOkf_Y6eaSnPw-1; Fri, 31 Dec 2021 07:48:58 -0500
X-MC-Unique: Q6AsUd0JOHOkf_Y6eaSnPw-1
Received: by mail-wr1-f69.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so7547481wrd.1
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:48:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wRGnTZ/XLILKmWFtYsMNltRv2S3GsR7Kd42iwaxNPRc=;
 b=wYeoyHRzlnB4n2OxAmiwr53AFJaieW5DPqPQawmpT2Vzjp5xTcrijAlYEqEIl9u2aH
 SMBnCU32MLurJa5aWNtN3sTXOL+MyK8Og1j5joSxYohElaSYNK3dirOMdt18fI1SKarK
 FCJ5yjGDVliF9Hgo9/lMMs0RBs+6RBvQLRqCPrGqOyhRJknf349NLfhn+lTTWWUjDmVa
 d2UmaYL0yUNE9Cg1kN7JhlCx0BiRf13Bo1dj2H6dXTB5JzvBFlQ9a4lByOWdnUm/3V0n
 tvDRTGPn+tTHmtgp0t5DeI5XYzwKQUsH6Rw8E00GpARB8TVQNrmxxt7WM5jYqN1QLq8W
 E2qA==
X-Gm-Message-State: AOAM532XRNwbPoiGUCT9d/vVNhPvn0GJggeIsLnyxz6e7uFqTbjE7u6n
 KZN/64/KNtNZ+52XAjrkWVX1ZsgNHcaG+3KUkoEO82NSquAsc+syc53pNES2Kz1TQZwAR1xCcsu
 Bjs4yp0sIQtXhvlEzgOZRjxlWMtdXBiazCfheVSO12OPY13bwtbtwhDXwL85WLnlA
X-Received: by 2002:a05:6000:2c9:: with SMTP id
 o9mr29313047wry.377.1640954936968; 
 Fri, 31 Dec 2021 04:48:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOX7ujFYtjAJ/WubxHtWh4q+rNs2hLoB/xDUv76yYDBP3mJiM8jtRG3xb7jDx5xYvvh1ziHg==
X-Received: by 2002:a05:6000:2c9:: with SMTP id
 o9mr29313027wry.377.1640954936582; 
 Fri, 31 Dec 2021 04:48:56 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id ay29sm28438051wmb.13.2021.12.31.04.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:48:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/20] hw/core/machine: Introduce CPU cluster topology support
Date: Fri, 31 Dec 2021 13:47:48 +0100
Message-Id: <20211231124754.1005747-15-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231124754.1005747-1-philmd@redhat.com>
References: <20211231124754.1005747-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

The new Cluster-Aware Scheduling support has landed in Linux 5.16,
which has been proved to benefit the scheduling performance (e.g.
load balance and wake_affine strategy) on both x86_64 and AArch64.

So now in Linux 5.16 we have four-level arch-neutral CPU topology
definition like below and a new scheduler level for clusters.
struct cpu_topology {
    int thread_id;
    int core_id;
    int cluster_id;
    int package_id;
    int llc_id;
    cpumask_t thread_sibling;
    cpumask_t core_sibling;
    cpumask_t cluster_sibling;
    cpumask_t llc_sibling;
}

A cluster generally means a group of CPU cores which share L2 cache
or other mid-level resources, and it is the shared resources that
is used to improve scheduler's behavior. From the point of view of
the size range, it's between CPU die and CPU core. For example, on
some ARM64 Kunpeng servers, we have 6 clusters in each NUMA node,
and 4 CPU cores in each cluster. The 4 CPU cores share a separate
L2 cache and a L3 cache tag, which brings cache affinity advantage.

In virtualization, on the Hosts which have pClusters (physical
clusters), if we can design a vCPU topology with cluster level for
guest kernel and have a dedicated vCPU pinning. A Cluster-Aware
Guest kernel can also make use of the cache affinity of CPU clusters
to gain similar scheduling performance.

This patch adds infrastructure for CPU cluster level topology
configuration and parsing, so that the user can specify cluster
parameter if their machines support it.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Message-Id: <20211228092221.21068-3-wangyanan55@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[PMD: Added '(since 7.0)' to @clusters in qapi/machine.json]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/machine.json     |  5 ++++-
 include/hw/boards.h   |  6 +++++-
 hw/core/machine-smp.c | 26 +++++++++++++++++++-------
 hw/core/machine.c     |  3 +++
 softmmu/vl.c          |  3 +++
 qemu-options.hx       |  7 ++++---
 6 files changed, 38 insertions(+), 12 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index edeab6084b7..372535b3482 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1404,7 +1404,9 @@
 #
 # @dies: number of dies per socket in the CPU topology
 #
-# @cores: number of cores per die in the CPU topology
+# @clusters: number of clusters per die in the CPU topology (since 7.0)
+#
+# @cores: number of cores per cluster in the CPU topology
 #
 # @threads: number of threads per core in the CPU topology
 #
@@ -1416,6 +1418,7 @@
      '*cpus': 'int',
      '*sockets': 'int',
      '*dies': 'int',
+     '*clusters': 'int',
      '*cores': 'int',
      '*threads': 'int',
      '*maxcpus': 'int' } }
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 7597cec4400..f49a2578ead 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -129,10 +129,12 @@ typedef struct {
  * SMPCompatProps:
  * @prefer_sockets - whether sockets are preferred over cores in smp parsing
  * @dies_supported - whether dies are supported by the machine
+ * @clusters_supported - whether clusters are supported by the machine
  */
 typedef struct {
     bool prefer_sockets;
     bool dies_supported;
+    bool clusters_supported;
 } SMPCompatProps;
 
 /**
@@ -299,7 +301,8 @@ typedef struct DeviceMemoryState {
  * @cpus: the number of present logical processors on the machine
  * @sockets: the number of sockets on the machine
  * @dies: the number of dies in one socket
- * @cores: the number of cores in one die
+ * @clusters: the number of clusters in one die
+ * @cores: the number of cores in one cluster
  * @threads: the number of threads in one core
  * @max_cpus: the maximum number of logical processors on the machine
  */
@@ -307,6 +310,7 @@ typedef struct CpuTopology {
     unsigned int cpus;
     unsigned int sockets;
     unsigned int dies;
+    unsigned int clusters;
     unsigned int cores;
     unsigned int threads;
     unsigned int max_cpus;
diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index 2cbfd574293..b39ed21e654 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -37,6 +37,10 @@ static char *cpu_hierarchy_to_string(MachineState *ms)
         g_string_append_printf(s, " * dies (%u)", ms->smp.dies);
     }
 
+    if (mc->smp_props.clusters_supported) {
+        g_string_append_printf(s, " * clusters (%u)", ms->smp.clusters);
+    }
+
     g_string_append_printf(s, " * cores (%u)", ms->smp.cores);
     g_string_append_printf(s, " * threads (%u)", ms->smp.threads);
 
@@ -71,6 +75,7 @@ void machine_parse_smp_config(MachineState *ms,
     unsigned cpus    = config->has_cpus ? config->cpus : 0;
     unsigned sockets = config->has_sockets ? config->sockets : 0;
     unsigned dies    = config->has_dies ? config->dies : 0;
+    unsigned clusters = config->has_clusters ? config->clusters : 0;
     unsigned cores   = config->has_cores ? config->cores : 0;
     unsigned threads = config->has_threads ? config->threads : 0;
     unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
@@ -82,6 +87,7 @@ void machine_parse_smp_config(MachineState *ms,
     if ((config->has_cpus && config->cpus == 0) ||
         (config->has_sockets && config->sockets == 0) ||
         (config->has_dies && config->dies == 0) ||
+        (config->has_clusters && config->clusters == 0) ||
         (config->has_cores && config->cores == 0) ||
         (config->has_threads && config->threads == 0) ||
         (config->has_maxcpus && config->maxcpus == 0)) {
@@ -97,8 +103,13 @@ void machine_parse_smp_config(MachineState *ms,
         error_setg(errp, "dies not supported by this machine's CPU topology");
         return;
     }
+    if (!mc->smp_props.clusters_supported && clusters > 1) {
+        error_setg(errp, "clusters not supported by this machine's CPU topology");
+        return;
+    }
 
     dies = dies > 0 ? dies : 1;
+    clusters = clusters > 0 ? clusters : 1;
 
     /* compute missing values based on the provided ones */
     if (cpus == 0 && maxcpus == 0) {
@@ -113,41 +124,42 @@ void machine_parse_smp_config(MachineState *ms,
             if (sockets == 0) {
                 cores = cores > 0 ? cores : 1;
                 threads = threads > 0 ? threads : 1;
-                sockets = maxcpus / (dies * cores * threads);
+                sockets = maxcpus / (dies * clusters * cores * threads);
             } else if (cores == 0) {
                 threads = threads > 0 ? threads : 1;
-                cores = maxcpus / (sockets * dies * threads);
+                cores = maxcpus / (sockets * dies * clusters * threads);
             }
         } else {
             /* prefer cores over sockets since 6.2 */
             if (cores == 0) {
                 sockets = sockets > 0 ? sockets : 1;
                 threads = threads > 0 ? threads : 1;
-                cores = maxcpus / (sockets * dies * threads);
+                cores = maxcpus / (sockets * dies * clusters * threads);
             } else if (sockets == 0) {
                 threads = threads > 0 ? threads : 1;
-                sockets = maxcpus / (dies * cores * threads);
+                sockets = maxcpus / (dies * clusters * cores * threads);
             }
         }
 
         /* try to calculate omitted threads at last */
         if (threads == 0) {
-            threads = maxcpus / (sockets * dies * cores);
+            threads = maxcpus / (sockets * dies * clusters * cores);
         }
     }
 
-    maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * cores * threads;
+    maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * clusters * cores * threads;
     cpus = cpus > 0 ? cpus : maxcpus;
 
     ms->smp.cpus = cpus;
     ms->smp.sockets = sockets;
     ms->smp.dies = dies;
+    ms->smp.clusters = clusters;
     ms->smp.cores = cores;
     ms->smp.threads = threads;
     ms->smp.max_cpus = maxcpus;
 
     /* sanity-check of the computed topology */
-    if (sockets * dies * cores * threads != maxcpus) {
+    if (sockets * dies * clusters * cores * threads != maxcpus) {
         g_autofree char *topo_msg = cpu_hierarchy_to_string(ms);
         error_setg(errp, "Invalid CPU topology: "
                    "product of the hierarchy must match maxcpus: "
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 3993c534b90..a4a2df405f3 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -742,10 +742,12 @@ static void machine_get_smp(Object *obj, Visitor *v, const char *name,
         .has_cpus = true, .cpus = ms->smp.cpus,
         .has_sockets = true, .sockets = ms->smp.sockets,
         .has_dies = true, .dies = ms->smp.dies,
+        .has_clusters = true, .clusters = ms->smp.clusters,
         .has_cores = true, .cores = ms->smp.cores,
         .has_threads = true, .threads = ms->smp.threads,
         .has_maxcpus = true, .maxcpus = ms->smp.max_cpus,
     };
+
     if (!visit_type_SMPConfiguration(v, name, &config, &error_abort)) {
         return;
     }
@@ -932,6 +934,7 @@ static void machine_initfn(Object *obj)
     ms->smp.max_cpus = mc->default_cpus;
     ms->smp.sockets = 1;
     ms->smp.dies = 1;
+    ms->smp.clusters = 1;
     ms->smp.cores = 1;
     ms->smp.threads = 1;
 }
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 620a1f1367e..d9e4c619d3e 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -726,6 +726,9 @@ static QemuOptsList qemu_smp_opts = {
         }, {
             .name = "dies",
             .type = QEMU_OPT_NUMBER,
+        }, {
+            .name = "clusters",
+            .type = QEMU_OPT_NUMBER,
         }, {
             .name = "cores",
             .type = QEMU_OPT_NUMBER,
diff --git a/qemu-options.hx b/qemu-options.hx
index b39377de3fc..fd1f8135fb5 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -206,13 +206,14 @@ SRST
 ERST
 
 DEF("smp", HAS_ARG, QEMU_OPTION_smp,
-    "-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]\n"
+    "-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,clusters=clusters][,cores=cores][,threads=threads]\n"
     "                set the number of initial CPUs to 'n' [default=1]\n"
     "                maxcpus= maximum number of total CPUs, including\n"
     "                offline CPUs for hotplug, etc\n"
     "                sockets= number of sockets on the machine board\n"
     "                dies= number of dies in one socket\n"
-    "                cores= number of cores in one die\n"
+    "                clusters= number of clusters in one die\n"
+    "                cores= number of cores in one cluster\n"
     "                threads= number of threads in one core\n"
     "Note: Different machines may have different subsets of the CPU topology\n"
     "      parameters supported, so the actual meaning of the supported parameters\n"
@@ -228,7 +229,7 @@ DEF("smp", HAS_ARG, QEMU_OPTION_smp,
     "      must be set as 1 in the purpose of correct parsing.\n",
     QEMU_ARCH_ALL)
 SRST
-``-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]``
+``-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,clusters=clusters][,cores=cores][,threads=threads]``
     Simulate a SMP system with '\ ``n``\ ' CPUs initially present on
     the machine type board. On boards supporting CPU hotplug, the optional
     '\ ``maxcpus``\ ' parameter can be set to enable further CPUs to be
-- 
2.33.1


