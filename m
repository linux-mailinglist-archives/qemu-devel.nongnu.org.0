Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BF445889A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 05:21:31 +0100 (CET)
Received: from localhost ([::1]:38868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp0pe-0003A7-41
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 23:21:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1mp0oR-0001vZ-3m; Sun, 21 Nov 2021 23:20:15 -0500
Received: from mga14.intel.com ([192.55.52.115]:28529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1mp0oP-0008NJ-0F; Sun, 21 Nov 2021 23:20:14 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="234955665"
X-IronPort-AV: E=Sophos;i="5.87,253,1631602800"; d="scan'208";a="234955665"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 20:20:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,253,1631602800"; d="scan'208";a="496716217"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.156.105])
 by orsmga007.jf.intel.com with ESMTP; 21 Nov 2021 20:20:04 -0800
From: "Rao, Lei" <lei.rao@intel.com>
To: armbru@redhat.com, chen.zhang@intel.com, zhang.zhanghailiang@huawei.com,
 wencongyang2@huawei.com, xiechanglong.d@gmail.com, berto@igalia.com,
 eblake@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH 1/2] docs: Drop deprecated 'props' from object-add
Date: Mon, 22 Nov 2021 12:11:22 +0800
Message-Id: <1637554283-11264-1-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=192.55.52.115; envelope-from=lei.rao@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
 docs/system/authz.rst   | 26 ++++++++++----------------
 docs/throttle.txt       |  8 +++-----
 docs/tools/qemu-nbd.rst |  2 +-
 3 files changed, 14 insertions(+), 22 deletions(-)

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


