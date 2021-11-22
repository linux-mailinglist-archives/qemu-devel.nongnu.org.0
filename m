Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C43E458A45
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 09:01:27 +0100 (CET)
Received: from localhost ([::1]:55474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp4GT-0005C5-2b
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 03:01:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1mp4Dw-0003Ni-8x; Mon, 22 Nov 2021 02:58:49 -0500
Received: from mga03.intel.com ([134.134.136.65]:42237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1mp4Dt-0008Fv-6t; Mon, 22 Nov 2021 02:58:47 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="234685220"
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="234685220"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 23:58:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="673981217"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.156.105])
 by orsmga005.jf.intel.com with ESMTP; 21 Nov 2021 23:58:34 -0800
From: "Rao, Lei" <lei.rao@intel.com>
To: armbru@redhat.com, chen.zhang@intel.com, zhang.zhanghailiang@huawei.com,
 wencongyang2@huawei.com, xiechanglong.d@gmail.com, berto@igalia.com,
 eblake@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH v2 2/2] docs: Use double quotes instead of single quotes for
 COLO
Date: Mon, 22 Nov 2021 15:49:47 +0800
Message-Id: <1637567387-28250-2-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637567387-28250-1-git-send-email-lei.rao@intel.com>
References: <1637567387-28250-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=134.134.136.65; envelope-from=lei.rao@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "Rao, Lei" <lei.rao@intel.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 docs/COLO-FT.txt           | 106 ++++++++++++++++++++++-----------------------
 docs/block-replication.txt |  52 +++++++++++-----------
 2 files changed, 79 insertions(+), 79 deletions(-)

diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt
index fd5ffcc..8ec653f 100644
--- a/docs/COLO-FT.txt
+++ b/docs/COLO-FT.txt
@@ -209,9 +209,9 @@ children.0=childs0 \
 
 
 3. On Secondary VM's QEMU monitor, issue command
-{'execute':'qmp_capabilities'}
-{'execute': 'nbd-server-start', 'arguments': {'addr': {'type': 'inet', 'data': {'host': '0.0.0.0', 'port': '9999'} } } }
-{'execute': 'nbd-server-add', 'arguments': {'device': 'parent0', 'writable': true } }
+{"execute":"qmp_capabilities"}
+{"execute": "nbd-server-start", "arguments": {"addr": {"type": "inet", "data": {"host": "0.0.0.0", "port": "9999"} } } }
+{"execute": "nbd-server-add", "arguments": {"device": "parent0", "writable": true } }
 
 Note:
   a. The qmp command nbd-server-start and nbd-server-add must be run
@@ -222,11 +222,11 @@ Note:
      will be merged into the parent disk on failover.
 
 4. On Primary VM's QEMU monitor, issue command:
-{'execute':'qmp_capabilities'}
-{'execute': 'human-monitor-command', 'arguments': {'command-line': 'drive_add -n buddy driver=replication,mode=primary,file.driver=nbd,file.host=127.0.0.2,file.port=9999,file.export=parent0,node-name=replication0'}}
-{'execute': 'x-blockdev-change', 'arguments':{'parent': 'colo-disk0', 'node': 'replication0' } }
-{'execute': 'migrate-set-capabilities', 'arguments': {'capabilities': [ {'capability': 'x-colo', 'state': true } ] } }
-{'execute': 'migrate', 'arguments': {'uri': 'tcp:127.0.0.2:9998' } }
+{"execute":"qmp_capabilities"}
+{"execute": "human-monitor-command", "arguments": {"command-line": "drive_add -n buddy driver=replication,mode=primary,file.driver=nbd,file.host=127.0.0.2,file.port=9999,file.export=parent0,node-name=replication0"}}
+{"execute": "x-blockdev-change", "arguments":{"parent": "colo-disk0", "node": "replication0" } }
+{"execute": "migrate-set-capabilities", "arguments": {"capabilities": [ {"capability": "x-colo", "state": true } ] } }
+{"execute": "migrate", "arguments": {"uri": "tcp:127.0.0.2:9998" } }
 
   Note:
   a. There should be only one NBD Client for each primary disk.
@@ -249,59 +249,59 @@ if you want to resume the replication, follow "Secondary resume replication"
 == Primary Failover ==
 The Secondary died, resume on the Primary
 
-{'execute': 'x-blockdev-change', 'arguments':{ 'parent': 'colo-disk0', 'child': 'children.1'} }
-{'execute': 'human-monitor-command', 'arguments':{ 'command-line': 'drive_del replication0' } }
-{'execute': 'object-del', 'arguments':{ 'id': 'comp0' } }
-{'execute': 'object-del', 'arguments':{ 'id': 'iothread1' } }
-{'execute': 'object-del', 'arguments':{ 'id': 'm0' } }
-{'execute': 'object-del', 'arguments':{ 'id': 'redire0' } }
-{'execute': 'object-del', 'arguments':{ 'id': 'redire1' } }
-{'execute': 'x-colo-lost-heartbeat' }
+{"execute": "x-blockdev-change", "arguments":{ "parent": "colo-disk0", "child": "children.1"} }
+{"execute": "human-monitor-command", "arguments":{ "command-line": "drive_del replication0" } }
+{"execute": "object-del", "arguments":{ "id": "comp0" } }
+{"execute": "object-del", "arguments":{ "id": "iothread1" } }
+{"execute": "object-del", "arguments":{ "id": "m0" } }
+{"execute": "object-del", "arguments":{ "id": "redire0" } }
+{"execute": "object-del", "arguments":{ "id": "redire1" } }
+{"execute": "x-colo-lost-heartbeat" }
 
 == Secondary Failover ==
 The Primary died, resume on the Secondary and prepare to become the new Primary
 
-{'execute': 'nbd-server-stop'}
-{'execute': 'x-colo-lost-heartbeat'}
+{"execute": "nbd-server-stop"}
+{"execute": "x-colo-lost-heartbeat"}
 
-{'execute': 'object-del', 'arguments':{ 'id': 'f2' } }
-{'execute': 'object-del', 'arguments':{ 'id': 'f1' } }
-{'execute': 'chardev-remove', 'arguments':{ 'id': 'red1' } }
-{'execute': 'chardev-remove', 'arguments':{ 'id': 'red0' } }
+{"execute": "object-del", "arguments":{ "id": "f2" } }
+{"execute": "object-del", "arguments":{ "id": "f1" } }
+{"execute": "chardev-remove", "arguments":{ "id": "red1" } }
+{"execute": "chardev-remove", "arguments":{ "id": "red0" } }
 
-{'execute': 'chardev-add', 'arguments':{ 'id': 'mirror0', 'backend': {'type': 'socket', 'data': {'addr': { 'type': 'inet', 'data': { 'host': '0.0.0.0', 'port': '9003' } }, 'server': true } } } }
-{'execute': 'chardev-add', 'arguments':{ 'id': 'compare1', 'backend': {'type': 'socket', 'data': {'addr': { 'type': 'inet', 'data': { 'host': '0.0.0.0', 'port': '9004' } }, 'server': true } } } }
-{'execute': 'chardev-add', 'arguments':{ 'id': 'compare0', 'backend': {'type': 'socket', 'data': {'addr': { 'type': 'inet', 'data': { 'host': '127.0.0.1', 'port': '9001' } }, 'server': true } } } }
-{'execute': 'chardev-add', 'arguments':{ 'id': 'compare0-0', 'backend': {'type': 'socket', 'data': {'addr': { 'type': 'inet', 'data': { 'host': '127.0.0.1', 'port': '9001' } }, 'server': false } } } }
-{'execute': 'chardev-add', 'arguments':{ 'id': 'compare_out', 'backend': {'type': 'socket', 'data': {'addr': { 'type': 'inet', 'data': { 'host': '127.0.0.1', 'port': '9005' } }, 'server': true } } } }
-{'execute': 'chardev-add', 'arguments':{ 'id': 'compare_out0', 'backend': {'type': 'socket', 'data': {'addr': { 'type': 'inet', 'data': { 'host': '127.0.0.1', 'port': '9005' } }, 'server': false } } } }
+{"execute": "chardev-add", "arguments":{ "id": "mirror0", "backend": {"type": "socket", "data": {"addr": { "type": "inet", "data": { "host": "0.0.0.0", "port": "9003" } }, "server": true } } } }
+{"execute": "chardev-add", "arguments":{ "id": "compare1", "backend": {"type": "socket", "data": {"addr": { "type": "inet", "data": { "host": "0.0.0.0", "port": "9004" } }, "server": true } } } }
+{"execute": "chardev-add", "arguments":{ "id": "compare0", "backend": {"type": "socket", "data": {"addr": { "type": "inet", "data": { "host": "127.0.0.1", "port": "9001" } }, "server": true } } } }
+{"execute": "chardev-add", "arguments":{ "id": "compare0-0", "backend": {"type": "socket", "data": {"addr": { "type": "inet", "data": { "host": "127.0.0.1", "port": "9001" } }, "server": false } } } }
+{"execute": "chardev-add", "arguments":{ "id": "compare_out", "backend": {"type": "socket", "data": {"addr": { "type": "inet", "data": { "host": "127.0.0.1", "port": "9005" } }, "server": true } } } }
+{"execute": "chardev-add", "arguments":{ "id": "compare_out0", "backend": {"type": "socket", "data": {"addr": { "type": "inet", "data": { "host": "127.0.0.1", "port": "9005" } }, "server": false } } } }
 
 == Primary resume replication ==
 Resume replication after new Secondary is up.
 
 Start the new Secondary (Steps 2 and 3 above), then on the Primary:
-{'execute': 'drive-mirror', 'arguments':{ 'device': 'colo-disk0', 'job-id': 'resync', 'target': 'nbd://127.0.0.2:9999/parent0', 'mode': 'existing', 'format': 'raw', 'sync': 'full'} }
+{"execute": "drive-mirror", "arguments":{ "device": "colo-disk0", "job-id": "resync", "target": "nbd://127.0.0.2:9999/parent0", "mode": "existing", "format": "raw", "sync": "full"} }
 
 Wait until disk is synced, then:
-{'execute': 'stop'}
-{'execute': 'block-job-cancel', 'arguments':{ 'device': 'resync'} }
+{"execute": "stop"}
+{"execute": "block-job-cancel", "arguments":{ "device": "resync"} }
 
-{'execute': 'human-monitor-command', 'arguments':{ 'command-line': 'drive_add -n buddy driver=replication,mode=primary,file.driver=nbd,file.host=127.0.0.2,file.port=9999,file.export=parent0,node-name=replication0'}}
-{'execute': 'x-blockdev-change', 'arguments':{ 'parent': 'colo-disk0', 'node': 'replication0' } }
+{"execute": "human-monitor-command", "arguments":{ "command-line": "drive_add -n buddy driver=replication,mode=primary,file.driver=nbd,file.host=127.0.0.2,file.port=9999,file.export=parent0,node-name=replication0"}}
+{"execute": "x-blockdev-change", "arguments":{ "parent": "colo-disk0", "node": "replication0" } }
 
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-mirror', 'id': 'm0', 'netdev': 'hn0', 'queue': 'tx', 'outdev': 'mirror0' } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire0', 'netdev': 'hn0', 'queue': 'rx', 'indev': 'compare_out' } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire1', 'netdev': 'hn0', 'queue': 'rx', 'outdev': 'compare0' } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'iothread', 'id': 'iothread1' } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'colo-compare', 'id': 'comp0', 'primary_in': 'compare0-0', 'secondary_in': 'compare1', 'outdev': 'compare_out0', 'iothread': 'iothread1' } }
+{"execute": "object-add", "arguments":{ "qom-type": "filter-mirror", "id": "m0", "netdev": "hn0", "queue": "tx", "outdev": "mirror0" } }
+{"execute": "object-add", "arguments":{ "qom-type": "filter-redirector", "id": "redire0", "netdev": "hn0", "queue": "rx", "indev": "compare_out" } }
+{"execute": "object-add", "arguments":{ "qom-type": "filter-redirector", "id": "redire1", "netdev": "hn0", "queue": "rx", "outdev": "compare0" } }
+{"execute": "object-add", "arguments":{ "qom-type": "iothread", "id": "iothread1" } }
+{"execute": "object-add", "arguments":{ "qom-type": "colo-compare", "id": "comp0", "primary_in": "compare0-0", "secondary_in": "compare1", "outdev": "compare_out0", "iothread": "iothread1" } }
 
-{'execute': 'migrate-set-capabilities', 'arguments':{ 'capabilities': [ {'capability': 'x-colo', 'state': true } ] } }
-{'execute': 'migrate', 'arguments':{ 'uri': 'tcp:127.0.0.2:9998' } }
+{"execute": "migrate-set-capabilities", "arguments":{ "capabilities": [ {"capability": "x-colo", "state": true } ] } }
+{"execute": "migrate", "arguments":{ "uri": "tcp:127.0.0.2:9998" } }
 
 Note:
 If this Primary previously was a Secondary, then we need to insert the
 filters before the filter-rewriter by using the
-"'insert': 'before', 'position': 'id=rew0'" Options. See below.
+""insert": "before", "position": "id=rew0"" Options. See below.
 
 == Secondary resume replication ==
 Become Primary and resume replication after new Secondary is up. Note
@@ -309,23 +309,23 @@ that now 127.0.0.1 is the Secondary and 127.0.0.2 is the Primary.
 
 Start the new Secondary (Steps 2 and 3 above, but with primary_ip=127.0.0.2),
 then on the old Secondary:
-{'execute': 'drive-mirror', 'arguments':{ 'device': 'colo-disk0', 'job-id': 'resync', 'target': 'nbd://127.0.0.1:9999/parent0', 'mode': 'existing', 'format': 'raw', 'sync': 'full'} }
+{"execute": "drive-mirror", "arguments":{ "device": "colo-disk0", "job-id": "resync", "target": "nbd://127.0.0.1:9999/parent0", "mode": "existing", "format": "raw", "sync": "full"} }
 
 Wait until disk is synced, then:
-{'execute': 'stop'}
-{'execute': 'block-job-cancel', 'arguments':{ 'device': 'resync' } }
+{"execute": "stop"}
+{"execute": "block-job-cancel", "arguments":{ "device": "resync" } }
 
-{'execute': 'human-monitor-command', 'arguments':{ 'command-line': 'drive_add -n buddy driver=replication,mode=primary,file.driver=nbd,file.host=127.0.0.1,file.port=9999,file.export=parent0,node-name=replication0'}}
-{'execute': 'x-blockdev-change', 'arguments':{ 'parent': 'colo-disk0', 'node': 'replication0' } }
+{"execute": "human-monitor-command", "arguments":{ "command-line": "drive_add -n buddy driver=replication,mode=primary,file.driver=nbd,file.host=127.0.0.1,file.port=9999,file.export=parent0,node-name=replication0"}}
+{"execute": "x-blockdev-change", "arguments":{ "parent": "colo-disk0", "node": "replication0" } }
 
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-mirror', 'id': 'm0', 'insert': 'before', 'position': 'id=rew0', 'netdev': 'hn0', 'queue': 'tx', 'outdev': 'mirror0' } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire0', 'insert': 'before', 'position': 'id=rew0', 'netdev': 'hn0', 'queue': 'rx', 'indev': 'compare_out' } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire1', 'insert': 'before', 'position': 'id=rew0', 'netdev': 'hn0', 'queue': 'rx', 'outdev': 'compare0' } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'iothread', 'id': 'iothread1' } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'colo-compare', 'id': 'comp0', 'primary_in': 'compare0-0', 'secondary_in': 'compare1', 'outdev': 'compare_out0', 'iothread': 'iothread1' } }
+{"execute": "object-add", "arguments":{ "qom-type": "filter-mirror", "id": "m0", "insert": "before", "position": "id=rew0", "netdev": "hn0", "queue": "tx", "outdev": "mirror0" } }
+{"execute": "object-add", "arguments":{ "qom-type": "filter-redirector", "id": "redire0", "insert": "before", "position": "id=rew0", "netdev": "hn0", "queue": "rx", "indev": "compare_out" } }
+{"execute": "object-add", "arguments":{ "qom-type": "filter-redirector", "id": "redire1", "insert": "before", "position": "id=rew0", "netdev": "hn0", "queue": "rx", "outdev": "compare0" } }
+{"execute": "object-add", "arguments":{ "qom-type": "iothread", "id": "iothread1" } }
+{"execute": "object-add", "arguments":{ "qom-type": "colo-compare", "id": "comp0", "primary_in": "compare0-0", "secondary_in": "compare1", "outdev": "compare_out0", "iothread": "iothread1" } }
 
-{'execute': 'migrate-set-capabilities', 'arguments':{ 'capabilities': [ {'capability': 'x-colo', 'state': true } ] } }
-{'execute': 'migrate', 'arguments':{ 'uri': 'tcp:127.0.0.1:9998' } }
+{"execute": "migrate-set-capabilities", "arguments":{ "capabilities": [ {"capability": "x-colo", "state": true } ] } }
+{"execute": "migrate", "arguments":{ "uri": "tcp:127.0.0.1:9998" } }
 
 == TODO ==
 1. Support shared storage.
diff --git a/docs/block-replication.txt b/docs/block-replication.txt
index 59eb2b3..b0f2376 100644
--- a/docs/block-replication.txt
+++ b/docs/block-replication.txt
@@ -156,15 +156,15 @@ Primary:
          children.0.driver=raw
 
   Run qmp command in primary qemu:
-    { 'execute': 'human-monitor-command',
-      'arguments': {
-          'command-line': 'drive_add -n buddy driver=replication,mode=primary,file.driver=nbd,file.host=xxxx,file.port=xxxx,file.export=colo1,node-name=nbd_client1'
+    { "execute": "human-monitor-command",
+      "arguments": {
+          "command-line": "drive_add -n buddy driver=replication,mode=primary,file.driver=nbd,file.host=xxxx,file.port=xxxx,file.export=colo1,node-name=nbd_client1"
       }
     }
-    { 'execute': 'x-blockdev-change',
-      'arguments': {
-          'parent': 'colo1',
-          'node': 'nbd_client1'
+    { "execute": "x-blockdev-change",
+      "arguments": {
+          "parent": "colo1",
+          "node": "nbd_client1"
       }
     }
   Note:
@@ -189,21 +189,21 @@ Secondary:
          vote-threshold=1,children.0=childs1
 
   Then run qmp command in secondary qemu:
-    { 'execute': 'nbd-server-start',
-      'arguments': {
-          'addr': {
-              'type': 'inet',
-              'data': {
-                  'host': 'xxx',
-                  'port': 'xxx'
+    { "execute": "nbd-server-start",
+      "arguments": {
+          "addr": {
+              "type": "inet",
+              "data": {
+                  "host": "xxx",
+                  "port": "xxx"
               }
           }
       }
     }
-    { 'execute': 'nbd-server-add',
-      'arguments': {
-          'device': 'colo1',
-          'writable': true
+    { "execute": "nbd-server-add",
+      "arguments": {
+          "device": "colo1",
+          "writable": true
       }
     }
 
@@ -223,22 +223,22 @@ After Failover:
 Primary:
   The secondary host is down, so we should run the following qmp command
   to remove the nbd child from the quorum:
-  { 'execute': 'x-blockdev-change',
-    'arguments': {
-        'parent': 'colo1',
-        'child': 'children.1'
+  { "execute": "x-blockdev-change",
+    "arguments": {
+        "parent": "colo1",
+        "child": "children.1"
     }
   }
-  { 'execute': 'human-monitor-command',
-    'arguments': {
-        'command-line': 'drive_del xxxx'
+  { "execute": "human-monitor-command",
+    "arguments": {
+        "command-line": "drive_del xxxx"
     }
   }
   Note: there is no qmp command to remove the blockdev now
 
 Secondary:
   The primary host is down, so we should do the following thing:
-  { 'execute': 'nbd-server-stop' }
+  { "execute": "nbd-server-stop" }
 
 Promote Secondary to Primary:
   see COLO-FT.txt
-- 
1.8.3.1


