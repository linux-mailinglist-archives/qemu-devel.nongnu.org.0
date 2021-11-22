Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D862458A44
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 09:01:16 +0100 (CET)
Received: from localhost ([::1]:54856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp4GJ-0004mv-2H
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 03:01:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1mp4Dj-00038u-RR; Mon, 22 Nov 2021 02:58:35 -0500
Received: from mga07.intel.com ([134.134.136.100]:24038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1mp4Dg-0008FQ-JE; Mon, 22 Nov 2021 02:58:35 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="298154450"
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="298154450"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 23:58:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="673981171"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.156.105])
 by orsmga005.jf.intel.com with ESMTP; 21 Nov 2021 23:58:25 -0800
From: "Rao, Lei" <lei.rao@intel.com>
To: armbru@redhat.com, chen.zhang@intel.com, zhang.zhanghailiang@huawei.com,
 wencongyang2@huawei.com, xiechanglong.d@gmail.com, berto@igalia.com,
 eblake@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH v2 1/2] docs: Drop deprecated 'props' from object-add
Date: Mon, 22 Nov 2021 15:49:46 +0800
Message-Id: <1637567387-28250-1-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=134.134.136.100; envelope-from=lei.rao@intel.com;
 helo=mga07.intel.com
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

In commit 5024340745 "qapi/qom: Drop deprecated 'props' from
object-add" (v6.0.0), we also should update documents.

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 docs/COLO-FT.txt        | 16 ++++++++--------
 docs/system/authz.rst   | 26 ++++++++++----------------
 docs/throttle.txt       |  8 +++-----
 docs/tools/qemu-nbd.rst |  2 +-
 4 files changed, 22 insertions(+), 30 deletions(-)

diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt
index 8d6d53a..fd5ffcc 100644
--- a/docs/COLO-FT.txt
+++ b/docs/COLO-FT.txt
@@ -289,11 +289,11 @@ Wait until disk is synced, then:
 {'execute': 'human-monitor-command', 'arguments':{ 'command-line': 'drive_add -n buddy driver=replication,mode=primary,file.driver=nbd,file.host=127.0.0.2,file.port=9999,file.export=parent0,node-name=replication0'}}
 {'execute': 'x-blockdev-change', 'arguments':{ 'parent': 'colo-disk0', 'node': 'replication0' } }
 
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-mirror', 'id': 'm0', 'props': { 'netdev': 'hn0', 'queue': 'tx', 'outdev': 'mirror0' } } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire0', 'props': { 'netdev': 'hn0', 'queue': 'rx', 'indev': 'compare_out' } } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire1', 'props': { 'netdev': 'hn0', 'queue': 'rx', 'outdev': 'compare0' } } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-mirror', 'id': 'm0', 'netdev': 'hn0', 'queue': 'tx', 'outdev': 'mirror0' } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire0', 'netdev': 'hn0', 'queue': 'rx', 'indev': 'compare_out' } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire1', 'netdev': 'hn0', 'queue': 'rx', 'outdev': 'compare0' } }
 {'execute': 'object-add', 'arguments':{ 'qom-type': 'iothread', 'id': 'iothread1' } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'colo-compare', 'id': 'comp0', 'props': { 'primary_in': 'compare0-0', 'secondary_in': 'compare1', 'outdev': 'compare_out0', 'iothread': 'iothread1' } } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'colo-compare', 'id': 'comp0', 'primary_in': 'compare0-0', 'secondary_in': 'compare1', 'outdev': 'compare_out0', 'iothread': 'iothread1' } }
 
 {'execute': 'migrate-set-capabilities', 'arguments':{ 'capabilities': [ {'capability': 'x-colo', 'state': true } ] } }
 {'execute': 'migrate', 'arguments':{ 'uri': 'tcp:127.0.0.2:9998' } }
@@ -318,11 +318,11 @@ Wait until disk is synced, then:
 {'execute': 'human-monitor-command', 'arguments':{ 'command-line': 'drive_add -n buddy driver=replication,mode=primary,file.driver=nbd,file.host=127.0.0.1,file.port=9999,file.export=parent0,node-name=replication0'}}
 {'execute': 'x-blockdev-change', 'arguments':{ 'parent': 'colo-disk0', 'node': 'replication0' } }
 
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-mirror', 'id': 'm0', 'props': { 'insert': 'before', 'position': 'id=rew0', 'netdev': 'hn0', 'queue': 'tx', 'outdev': 'mirror0' } } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire0', 'props': { 'insert': 'before', 'position': 'id=rew0', 'netdev': 'hn0', 'queue': 'rx', 'indev': 'compare_out' } } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire1', 'props': { 'insert': 'before', 'position': 'id=rew0', 'netdev': 'hn0', 'queue': 'rx', 'outdev': 'compare0' } } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-mirror', 'id': 'm0', 'insert': 'before', 'position': 'id=rew0', 'netdev': 'hn0', 'queue': 'tx', 'outdev': 'mirror0' } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire0', 'insert': 'before', 'position': 'id=rew0', 'netdev': 'hn0', 'queue': 'rx', 'indev': 'compare_out' } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire1', 'insert': 'before', 'position': 'id=rew0', 'netdev': 'hn0', 'queue': 'rx', 'outdev': 'compare0' } }
 {'execute': 'object-add', 'arguments':{ 'qom-type': 'iothread', 'id': 'iothread1' } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'colo-compare', 'id': 'comp0', 'props': { 'primary_in': 'compare0-0', 'secondary_in': 'compare1', 'outdev': 'compare_out0', 'iothread': 'iothread1' } } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'colo-compare', 'id': 'comp0', 'primary_in': 'compare0-0', 'secondary_in': 'compare1', 'outdev': 'compare_out0', 'iothread': 'iothread1' } }
 
 {'execute': 'migrate-set-capabilities', 'arguments':{ 'capabilities': [ {'capability': 'x-colo', 'state': true } ] } }
 {'execute': 'migrate', 'arguments':{ 'uri': 'tcp:127.0.0.1:9998' } }
diff --git a/docs/system/authz.rst b/docs/system/authz.rst
index 942af39..55b7315 100644
--- a/docs/system/authz.rst
+++ b/docs/system/authz.rst
@@ -77,9 +77,7 @@ To create an instance of this driver via QMP:
      "arguments": {
        "qom-type": "authz-simple",
        "id": "authz0",
-       "props": {
-         "identity": "fred"
-       }
+       "identity": "fred"
      }
    }
 
@@ -110,15 +108,13 @@ To create an instance of this class via QMP:
      "arguments": {
        "qom-type": "authz-list",
        "id": "authz0",
-       "props": {
-         "rules": [
-            { "match": "fred", "policy": "allow", "format": "exact" },
-            { "match": "bob", "policy": "allow", "format": "exact" },
-            { "match": "danb", "policy": "deny", "format": "exact" },
-            { "match": "dan*", "policy": "allow", "format": "glob" }
-         ],
-         "policy": "deny"
-       }
+       "rules": [
+          { "match": "fred", "policy": "allow", "format": "exact" },
+          { "match": "bob", "policy": "allow", "format": "exact" },
+          { "match": "danb", "policy": "deny", "format": "exact" },
+          { "match": "dan*", "policy": "allow", "format": "glob" }
+       ],
+       "policy": "deny"
      }
    }
 
@@ -143,10 +139,8 @@ To create an instance of this class via QMP:
      "arguments": {
        "qom-type": "authz-list-file",
        "id": "authz0",
-       "props": {
-         "filename": "/etc/qemu/myvm-vnc.acl",
-         "refresh": true
-       }
+       "filename": "/etc/qemu/myvm-vnc.acl",
+       "refresh": true
      }
    }
 
diff --git a/docs/throttle.txt b/docs/throttle.txt
index b5b78b7..0a0453a 100644
--- a/docs/throttle.txt
+++ b/docs/throttle.txt
@@ -273,11 +273,9 @@ A group can be created using the object-add QMP function:
      "arguments": {
        "qom-type": "throttle-group",
        "id": "group0",
-       "props": {
-         "limits" : {
-           "iops-total": 1000
-           "bps-write": 2097152
-         }
+       "limits" : {
+         "iops-total": 1000,
+         "bps-write": 2097152
        }
      }
    }
diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
index 56e54cd..726cd189 100644
--- a/docs/tools/qemu-nbd.rst
+++ b/docs/tools/qemu-nbd.rst
@@ -31,7 +31,7 @@ driver options if ``--image-opts`` is specified.
 
 *dev* is an NBD device.
 
-.. option:: --object type,id=ID,...props...
+.. option:: --object type,id=ID,...
 
   Define a new instance of the *type* object class identified by *ID*.
   See the :manpage:`qemu(1)` manual page for full details of the properties
-- 
1.8.3.1


