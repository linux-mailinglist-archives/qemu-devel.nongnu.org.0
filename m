Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB271298E7
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Dec 2019 17:51:26 +0100 (CET)
Received: from localhost ([::1]:58860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ijQvU-0005m3-J6
	for lists+qemu-devel@lfdr.de; Mon, 23 Dec 2019 11:51:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41520)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1ijQmU-0004H1-Ae
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 11:42:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1ijQmS-0005XY-7y
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 11:42:06 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:38415
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1ijQmS-0005XB-1K
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 11:42:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577119322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gA+pwh7nEEbohLHaQ73B+nUfWUkuIF1GGYQVjzNVnqg=;
 b=N9Y3SAdtLJXuu7y0Sjt29WRDEwOqMXK0NRkgDUOK3McVus+OrN6mqBUIn4Og3erT0rHHAK
 Lv9RjxFI+w1fi48sp4swc/mT2iTKCE0VAsTY+e6D9fVzROveeA2ZYD10Kcbc8r2J/TnQRQ
 GjEfbbl3AVFSPXr4f18Wx0+Ag84m77U=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-Y1T_M4XnMDawtKCVjLDzEw-1; Mon, 23 Dec 2019 11:42:00 -0500
Received: by mail-qt1-f197.google.com with SMTP id x8so11446187qtq.14
 for <qemu-devel@nongnu.org>; Mon, 23 Dec 2019 08:42:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bjxdhZe8lLxQ+Az28/cWVrxvfjQRU8bK06t3mInr1NE=;
 b=mGxTHfVTjcsLeabt8RMQ8IJ+NdoMBtLFZqvfsAcXcyS0yDnFvSntIOwuLDSP+YGpQI
 ZOs31RlrG8bG7oAoIhvxFMMeQ+x4jLJhIog/L8uXnR91AiPcx0CBjMOczzcc3V8aDm5d
 EATwP+8GNNgStItXJs0qKYyXwjOD4RbX/8F07uuoBVmYM+zWG6PVHyN96dDRFHOWsVrV
 udKsNTxg6/oQpskMgQJdtzxUIq7uUn3Fwt+25pO02wj0vhnqFtM9Ej7NAOnJHYv2cJyH
 DOvjXr0cUVNQWOZ16bfU1kw3LM+GO72cmZC3z5ZXGlsJ3js2W2IZDqLsSHgCm+jEWnHB
 /psg==
X-Gm-Message-State: APjAAAXLeJWKnbnp7eSbVboqU6JlVWhGa+YY6iClMuuLpNhyocAgPtQq
 Hugxd9/QbdOY8Qn/1imjwpK73MVuQ9TgNsS+8KLMCoBwt+n1PydlkOHi/pp3IoLjmBa/S7A4J1A
 JIm5HxkStnuzhdGs=
X-Received: by 2002:ac8:7601:: with SMTP id t1mr24161325qtq.377.1577119319617; 
 Mon, 23 Dec 2019 08:41:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqypuEsAwv+jGWD4br89NMfRhplLr1vlqpilNgMq2wnpyuQo+pIBbcbZfj+JFN+u3Gv5+51yfQ==
X-Received: by 2002:ac8:7601:: with SMTP id t1mr24161295qtq.377.1577119319175; 
 Mon, 23 Dec 2019 08:41:59 -0800 (PST)
Received: from redhat.com (bzq-109-64-31-13.red.bezeqint.net. [109.64.31.13])
 by smtp.gmail.com with ESMTPSA id
 u16sm5887344qku.19.2019.12.23.08.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 08:41:58 -0800 (PST)
Date: Mon, 23 Dec 2019 11:41:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 13/27] numa: Extend CLI to provide memory side cache
 information
Message-ID: <20191223141536.72682-14-mst@redhat.com>
References: <20191223141536.72682-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191223141536.72682-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-MC-Unique: Y1T_M4XnMDawtKCVjLDzEw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Liu Jingqi <jingqi.liu@intel.com>,
 Tao Xu <tao3.xu@intel.com>, Markus Armbruster <armbru@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liu Jingqi <jingqi.liu@intel.com>

Add -numa hmat-cache option to provide Memory Side Cache Information.
These memory attributes help to build Memory Side Cache Information
Structure(s) in ACPI Heterogeneous Memory Attribute Table (HMAT).
Before using hmat-cache option, enable HMAT with -machine hmat=3Don.

Acked-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Liu Jingqi <jingqi.liu@intel.com>
Signed-off-by: Tao Xu <tao3.xu@intel.com>
Message-Id: <20191213011929.2520-4-tao3.xu@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 qapi/machine.json     | 81 +++++++++++++++++++++++++++++++++++++++++--
 include/sysemu/numa.h |  5 +++
 hw/core/numa.c        | 80 ++++++++++++++++++++++++++++++++++++++++++
 qemu-options.hx       | 17 +++++++--
 4 files changed, 179 insertions(+), 4 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index cf8faf5a2a..b3d30bc816 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -428,10 +428,12 @@
 #
 # @hmat-lb: memory latency and bandwidth information (Since: 5.0)
 #
+# @hmat-cache: memory side cache information (Since: 5.0)
+#
 # Since: 2.1
 ##
 { 'enum': 'NumaOptionsType',
-  'data': [ 'node', 'dist', 'cpu', 'hmat-lb' ] }
+  'data': [ 'node', 'dist', 'cpu', 'hmat-lb', 'hmat-cache' ] }
=20
 ##
 # @NumaOptions:
@@ -447,7 +449,8 @@
     'node': 'NumaNodeOptions',
     'dist': 'NumaDistOptions',
     'cpu': 'NumaCpuOptions',
-    'hmat-lb': 'NumaHmatLBOptions' }}
+    'hmat-lb': 'NumaHmatLBOptions',
+    'hmat-cache': 'NumaHmatCacheOptions' }}
=20
 ##
 # @NumaNodeOptions:
@@ -646,6 +649,80 @@
     '*latency': 'uint64',
     '*bandwidth': 'size' }}
=20
+##
+# @HmatCacheAssociativity:
+#
+# Cache associativity in the Memory Side Cache Information Structure
+# of HMAT
+#
+# For more information of @HmatCacheAssociativity, see chapter
+# 5.2.27.5: Table 5-147 of ACPI 6.3 spec.
+#
+# @none: None (no memory side cache in this proximity domain,
+#              or cache associativity unknown)
+#
+# @direct: Direct Mapped
+#
+# @complex: Complex Cache Indexing (implementation specific)
+#
+# Since: 5.0
+##
+{ 'enum': 'HmatCacheAssociativity',
+  'data': [ 'none', 'direct', 'complex' ] }
+
+##
+# @HmatCacheWritePolicy:
+#
+# Cache write policy in the Memory Side Cache Information Structure
+# of HMAT
+#
+# For more information of @HmatCacheWritePolicy, see chapter
+# 5.2.27.5: Table 5-147: Field "Cache Attributes" of ACPI 6.3 spec.
+#
+# @none: None (no memory side cache in this proximity domain,
+#              or cache write policy unknown)
+#
+# @write-back: Write Back (WB)
+#
+# @write-through: Write Through (WT)
+#
+# Since: 5.0
+##
+{ 'enum': 'HmatCacheWritePolicy',
+  'data': [ 'none', 'write-back', 'write-through' ] }
+
+##
+# @NumaHmatCacheOptions:
+#
+# Set the memory side cache information for a given memory domain.
+#
+# For more information of @NumaHmatCacheOptions, see chapter
+# 5.2.27.5: Table 5-147: Field "Cache Attributes" of ACPI 6.3 spec.
+#
+# @node-id: the memory proximity domain to which the memory belongs.
+#
+# @size: the size of memory side cache in bytes.
+#
+# @level: the cache level described in this structure.
+#
+# @associativity: the cache associativity,
+#         none/direct-mapped/complex(complex cache indexing).
+#
+# @policy: the write policy, none/write-back/write-through.
+#
+# @line: the cache Line size in bytes.
+#
+# Since: 5.0
+##
+{ 'struct': 'NumaHmatCacheOptions',
+  'data': {
+   'node-id': 'uint32',
+   'size': 'size',
+   'level': 'uint8',
+   'associativity': 'HmatCacheAssociativity',
+   'policy': 'HmatCacheWritePolicy',
+   'line': 'uint16' }}
+
 ##
 # @HostMemPolicy:
 #
diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index 70f93c83d7..ba693cc80b 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -91,6 +91,9 @@ struct NumaState {
=20
     /* NUMA nodes HMAT Locality Latency and Bandwidth Information */
     HMAT_LB_Info *hmat_lb[HMAT_LB_LEVELS][HMAT_LB_TYPES];
+
+    /* Memory Side Cache Information Structure */
+    NumaHmatCacheOptions *hmat_cache[MAX_NODES][HMAT_LB_LEVELS];
 };
 typedef struct NumaState NumaState;
=20
@@ -98,6 +101,8 @@ void set_numa_options(MachineState *ms, NumaOptions *obj=
ect, Error **errp);
 void parse_numa_opts(MachineState *ms);
 void parse_numa_hmat_lb(NumaState *numa_state, NumaHmatLBOptions *node,
                         Error **errp);
+void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
+                           Error **errp);
 void numa_complete_configuration(MachineState *ms);
 void query_numa_node_mem(NumaNodeMem node_mem[], MachineState *ms);
 extern QemuOptsList qemu_numa_opts;
diff --git a/hw/core/numa.c b/hw/core/numa.c
index 34eb413f5d..747c9680b0 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -379,6 +379,73 @@ void parse_numa_hmat_lb(NumaState *numa_state, NumaHma=
tLBOptions *node,
     g_array_append_val(hmat_lb->list, lb_data);
 }
=20
+void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
+                           Error **errp)
+{
+    int nb_numa_nodes =3D ms->numa_state->num_nodes;
+    NodeInfo *numa_info =3D ms->numa_state->nodes;
+    NumaHmatCacheOptions *hmat_cache =3D NULL;
+
+    if (node->node_id >=3D nb_numa_nodes) {
+        error_setg(errp, "Invalid node-id=3D%" PRIu32 ", it should be less=
 "
+                   "than %d", node->node_id, nb_numa_nodes);
+        return;
+    }
+
+    if (numa_info[node->node_id].lb_info_provided !=3D (BIT(0) | BIT(1))) =
{
+        error_setg(errp, "The latency and bandwidth information of "
+                   "node-id=3D%" PRIu32 " should be provided before memory=
 side "
+                   "cache attributes", node->node_id);
+        return;
+    }
+
+    if (node->level < 1 || node->level >=3D HMAT_LB_LEVELS) {
+        error_setg(errp, "Invalid level=3D%" PRIu8 ", it should be larger =
than 0 "
+                   "and less than or equal to %d", node->level,
+                   HMAT_LB_LEVELS - 1);
+        return;
+    }
+
+    assert(node->associativity < HMAT_CACHE_ASSOCIATIVITY__MAX);
+    assert(node->policy < HMAT_CACHE_WRITE_POLICY__MAX);
+    if (ms->numa_state->hmat_cache[node->node_id][node->level]) {
+        error_setg(errp, "Duplicate configuration of the side cache for "
+                   "node-id=3D%" PRIu32 " and level=3D%" PRIu8,
+                   node->node_id, node->level);
+        return;
+    }
+
+    if ((node->level > 1) &&
+        ms->numa_state->hmat_cache[node->node_id][node->level - 1] &&
+        (node->size >=3D
+            ms->numa_state->hmat_cache[node->node_id][node->level - 1]->si=
ze)) {
+        error_setg(errp, "Invalid size=3D%" PRIu64 ", the size of level=3D=
%" PRIu8
+                   " should be less than the size(%" PRIu64 ") of "
+                   "level=3D%u", node->size, node->level,
+                   ms->numa_state->hmat_cache[node->node_id]
+                                             [node->level - 1]->size,
+                   node->level - 1);
+        return;
+    }
+
+    if ((node->level < HMAT_LB_LEVELS - 1) &&
+        ms->numa_state->hmat_cache[node->node_id][node->level + 1] &&
+        (node->size <=3D
+            ms->numa_state->hmat_cache[node->node_id][node->level + 1]->si=
ze)) {
+        error_setg(errp, "Invalid size=3D%" PRIu64 ", the size of level=3D=
%" PRIu8
+                   " should be larger than the size(%" PRIu64 ") of "
+                   "level=3D%u", node->size, node->level,
+                   ms->numa_state->hmat_cache[node->node_id]
+                                             [node->level + 1]->size,
+                   node->level + 1);
+        return;
+    }
+
+    hmat_cache =3D g_malloc0(sizeof(*hmat_cache));
+    memcpy(hmat_cache, node, sizeof(*hmat_cache));
+    ms->numa_state->hmat_cache[node->node_id][node->level] =3D hmat_cache;
+}
+
 void set_numa_options(MachineState *ms, NumaOptions *object, Error **errp)
 {
     Error *err =3D NULL;
@@ -430,6 +497,19 @@ void set_numa_options(MachineState *ms, NumaOptions *o=
bject, Error **errp)
             goto end;
         }
         break;
+    case NUMA_OPTIONS_TYPE_HMAT_CACHE:
+        if (!ms->numa_state->hmat_enabled) {
+            error_setg(errp, "ACPI Heterogeneous Memory Attribute Table "
+                       "(HMAT) is disabled, enable it with -machine hmat=
=3Don "
+                       "before using any of hmat specific options");
+            return;
+        }
+
+        parse_numa_hmat_cache(ms, &object->u.hmat_cache, &err);
+        if (err) {
+            goto end;
+        }
+        break;
     default:
         abort();
     }
diff --git a/qemu-options.hx b/qemu-options.hx
index a0c0bbb7cf..d4b73ef60c 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -176,7 +176,8 @@ DEF("numa", HAS_ARG, QEMU_OPTION_numa,
     "-numa node[,memdev=3Did][,cpus=3Dfirstcpu[-lastcpu]][,nodeid=3Dnode][=
,initiator=3Dnode]\n"
     "-numa dist,src=3Dsource,dst=3Ddestination,val=3Ddistance\n"
     "-numa cpu,node-id=3Dnode[,socket-id=3Dx][,core-id=3Dy][,thread-id=3Dz=
]\n"
-    "-numa hmat-lb,initiator=3Dnode,target=3Dnode,hierarchy=3Dmemory|first=
-level|second-level|third-level,data-type=3Daccess-latency|read-latency|wri=
te-latency[,latency=3Dlat][,bandwidth=3Dbw]\n",
+    "-numa hmat-lb,initiator=3Dnode,target=3Dnode,hierarchy=3Dmemory|first=
-level|second-level|third-level,data-type=3Daccess-latency|read-latency|wri=
te-latency[,latency=3Dlat][,bandwidth=3Dbw]\n"
+    "-numa hmat-cache,node-id=3Dnode,size=3Dsize,level=3Dlevel[,associativ=
ity=3Dnone|direct|complex][,policy=3Dnone|write-back|write-through][,line=
=3Dsize]\n",
     QEMU_ARCH_ALL)
 STEXI
 @item -numa node[,mem=3D@var{size}][,cpus=3D@var{firstcpu}[-@var{lastcpu}]=
][,nodeid=3D@var{node}][,initiator=3D@var{initiator}]
@@ -184,6 +185,7 @@ STEXI
 @itemx -numa dist,src=3D@var{source},dst=3D@var{destination},val=3D@var{di=
stance}
 @itemx -numa cpu,node-id=3D@var{node}[,socket-id=3D@var{x}][,core-id=3D@va=
r{y}][,thread-id=3D@var{z}]
 @itemx -numa hmat-lb,initiator=3D@var{node},target=3D@var{node},hierarchy=
=3D@var{hierarchy},data-type=3D@var{tpye}[,latency=3D@var{lat}][,bandwidth=
=3D@var{bw}]
+@itemx -numa hmat-cache,node-id=3D@var{node},size=3D@var{size},level=3D@va=
r{level}[,associativity=3D@var{str}][,policy=3D@var{str}][,line=3D@var{size=
}]
 @findex -numa
 Define a NUMA node and assign RAM and VCPUs to it.
 Set the NUMA distance from a source node to a destination node.
@@ -287,11 +289,20 @@ NUM byte per second (or MB/s, GB/s or TB/s depending =
on used suffix).
 Note that if latency or bandwidth value is 0, means the corresponding late=
ncy or
 bandwidth information is not provided.
=20
+In @samp{hmat-cache} option, @var{node-id} is the NUMA-id of the memory be=
longs.
+@var{size} is the size of memory side cache in bytes. @var{level} is the c=
ache
+level described in this structure, note that the cache level 0 should not =
be used
+with @samp{hmat-cache} option. @var{associativity} is the cache associativ=
ity,
+the possible value is 'none/direct(direct-mapped)/complex(complex cache in=
dexing)'.
+@var{policy} is the write policy. @var{line} is the cache Line size in byt=
es.
+
 For example, the following options describe 2 NUMA nodes. Node 0 has 2 cpu=
s and
 a ram, node 1 has only a ram. The processors in node 0 access memory in no=
de
 0 with access-latency 5 nanoseconds, access-bandwidth is 200 MB/s;
 The processors in NUMA node 0 access memory in NUMA node 1 with access-lat=
ency 10
 nanoseconds, access-bandwidth is 100 MB/s.
+And for memory side cache information, NUMA node 0 and 1 both have 1 level=
 memory
+cache, size is 10KB, policy is write-back, the cache Line size is 8 bytes:
 @example
 -machine hmat=3Don \
 -m 2G \
@@ -305,7 +316,9 @@ nanoseconds, access-bandwidth is 100 MB/s.
 -numa hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Dacce=
ss-latency,latency=3D5 \
 -numa hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Dacce=
ss-bandwidth,bandwidth=3D200M \
 -numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Dacce=
ss-latency,latency=3D10 \
--numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Dacce=
ss-bandwidth,bandwidth=3D100M
+-numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Dacce=
ss-bandwidth,bandwidth=3D100M \
+-numa hmat-cache,node-id=3D0,size=3D10K,level=3D1,associativity=3Ddirect,p=
olicy=3Dwrite-back,line=3D8 \
+-numa hmat-cache,node-id=3D1,size=3D10K,level=3D1,associativity=3Ddirect,p=
olicy=3Dwrite-back,line=3D8
 @end example
=20
 ETEXI
--=20
MST


