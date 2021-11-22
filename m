Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6915D459083
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 15:47:23 +0100 (CET)
Received: from localhost ([::1]:33352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpAbK-0003v6-GV
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 09:47:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpAY0-00089U-21
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:43:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpAXw-0004Kd-63
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:43:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637592230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4YIvnVCiN6Ga3fkglEcdGF4J2I8t1zE1bdcYeQA+S/A=;
 b=bwXl48Z/5ZU088xg1EyERn80+7RV0dFaemx6aBkj2Er+jWxFsS5DZ1/a3Z9PMQ2PTwf64P
 yV+heQmmOoQF5yHkGU9cChNOZGeY/pJ1J6OqV24TZLIVM7DorySdUJFdp47xB4rG2rN9Ux
 bG5sg05JkR1iTxcauFwr2A4N2fpJa7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-p1BVu11mPqOXUVmdKuWZCA-1; Mon, 22 Nov 2021 09:43:47 -0500
X-MC-Unique: p1BVu11mPqOXUVmdKuWZCA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 284B8806689;
 Mon, 22 Nov 2021 14:43:46 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF6235E274;
 Mon, 22 Nov 2021 14:43:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 5/6] docs: Use double quotes instead of single quotes for COLO
Date: Mon, 22 Nov 2021 15:43:19 +0100
Message-Id: <20211122144320.29178-6-thuth@redhat.com>
In-Reply-To: <20211122144320.29178-1-thuth@redhat.com>
References: <20211122144320.29178-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Rao, Lei" <lei.rao@intel.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

Signed-off-by: Lei Rao <lei.rao@intel.com>
Message-Id: <1637567387-28250-2-git-send-email-lei.rao@intel.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/COLO-FT.txt           | 106 ++++++++++++++++++-------------------
 docs/block-replication.txt |  52 +++++++++---------
 2 files changed, 79 insertions(+), 79 deletions(-)

diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt
index fd5ffcc6e5..8ec653f81c 100644
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
index 59eb2b33b3..b0f23761c6 100644
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
2.27.0


